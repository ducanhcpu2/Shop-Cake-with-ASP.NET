using shop_cake.Models;
using System;
using System.Collections.Generic;
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
        public ActionResult CheckOut(customer cus )
        {
            var cart = (ShoppingCart)Session["cart"];
            if (cart == null)
            {
                return Redirect(Request.UrlReferrer.ToString());
            }

            if (ModelState.IsValid)
            {
                db.customers.Add(new customer
                {
                    name = cus.name,
                    email = cus.email,
                    gender = cus.gender,
                    phone_number = cus.phone_number,
                    address = cus.address,
                    updated_at = System.DateTime.Now
                });

                db.bills.Add(new bill
                {
                    date_order = System.DateTime.Now,
                    total = cart.TotalPrice(),
                    note = cus.note,
                    created_at = System.DateTime.Now,
                    updated_at = System.DateTime.Now,
                    id_customer = cus.id_customer,


                });

                db.SaveChanges();

                var Current_Bill = db.bills.LastOrDefault(s => s.id_customer == cus.id_customer);
                foreach (var i in cart.Item)
                {
                    db.bill_detail.Add(new bill_detail
                    {
                        id_bill = Current_Bill.id_bill,
                        id_product = i.id,
                        quantity = i.quantity,
                        unit_price = i.promotion_price > 0 ? i.promotion_price : i.unit_price,
                        created_at = System.DateTime.Now,
                        updated_at = System.DateTime.Now
                    });
                }

                db.SaveChanges();

                return RedirectToAction("Index","Home");
            }
            return Redirect(Request.UrlReferrer.ToString());
        }
    }
}