using shop_cake.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace shop_cake.Controllers.Admin
{
    public class AdminListBillsController : Controller
    {
        // GET: AdminListBills
        private shop_cakeEntities1 db = new shop_cakeEntities1();
        public ActionResult Index()
        {
            var bill = (
                from b in db.bills
                join
                c in db.customers
                on b.id_customer equals c.id_customer
                select new bill_customerViewModel()
                {
                    id_bill = b.id_bill,
                    date_order = b.date_order,
                    total = b.total,
                    payment = b.payment,
                    note = b.note,
                    created_at = b.created_at,
                    updated_at = b.updated_at,
                    namecustomer = c.name,
                    emailcustomer = c.email
                }).ToList();
            ViewBag.Bills = bill;
                
            return View();
        }
    }
}