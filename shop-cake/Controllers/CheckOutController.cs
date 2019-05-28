using shop_cake.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace shop_cake.Controllers
{
    public class CheckOutController : Controller
    {
        shop_cakeEntities1 db = new shop_cakeEntities1();
        // GET: CheckOut
        public ActionResult CheckOut()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CheckOut(customer cus, string payment_method )
        {
            var cart = (ShoppingCart)Session["cart"];
            if (cart == null)
            {
                return Redirect(Request.UrlReferrer.ToString());
            }

            if (ModelState.IsValid)
            {
                var obj = db.customers.FirstOrDefault(x => x.id_customer == cus.id_customer);
                if (cus.name != null) obj.name = cus.name;

                if (cus.email != null) obj.email = cus.email;
                if (cus.gender != null) obj.gender = cus.gender;
                if (cus.phone_number != null)  obj.phone_number = cus.phone_number;
                if (cus.address != null)  obj.address = cus.address;
                obj.created_at = System.DateTime.Now;
                obj.updated_at = System.DateTime.Now;
                db.Entry(obj).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }

            db.bills.Add(new bill
            {
                date_order = System.DateTime.Now,
                payment = payment_method,
                total = cart.TotalPrice(),
                note = cus.note,
                created_at = System.DateTime.Now,
                updated_at = System.DateTime.Now,
                id_customer = cus.id_customer,
            });

            db.SaveChanges();

            var lastIdBill = db.bills.Max(x => x.id_bill);
            foreach (var i in cart.Item)
            {
                db.bill_detail.Add(new bill_detail
                {
                    id_bill = lastIdBill,
                    id_product = i.id,
                    quantity = i.quantity,
                    unit_price = i.promotion_price > 0 ? i.promotion_price : i.unit_price,
                    created_at = System.DateTime.Now,
                    updated_at = System.DateTime.Now
                });
            }

            db.SaveChanges();
            Session["cart"] = null;
             return RedirectToAction("Index","Home");
        }
    }
}