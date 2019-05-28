using PagedList;
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
        public ActionResult Index(string currentFilter, string searchString, int? Page_No)
        {
            if (searchString != null)
            {
                Page_No = 1;
            }
            else
            {
                searchString = currentFilter;
            }

            ViewBag.CurrentFilter = searchString;

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
                });
            ViewBag.Bills = bill;

            if (!String.IsNullOrEmpty(searchString))
            {
                bill = bill.Where(u => u.namecustomer.Contains(searchString));
            }
            int Size_Of_Page = 10;
            int No_Of_Page = (Page_No ?? 1);
            bill.ToList();
            return View(bill.OrderBy(i => i.id_bill).ToPagedList(No_Of_Page, Size_Of_Page));
        }
    }
}