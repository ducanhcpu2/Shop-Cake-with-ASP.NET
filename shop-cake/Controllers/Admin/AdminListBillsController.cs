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
        public ActionResult BillDetail()
        {
            var billdetail = (
                from bd in db.bill_detail
                join
                p in db.products
                on bd.id_product equals p.id_product 
                join
                b in db.bills
                on bd.id_bill equals b.id_bill
                select new bill_detailViewModel()
                {
                    id_bill_detail = bd.id_bill_detail,
                    nameproduct=p.name,
                    quatity = bd.quantity,
                    unit_price = bd.unit_price,
                    id_bill = b.id_bill,
                    created_at = b.created_at,
                    updated_at = b.updated_at,
                    imageproduct = p.image
                    
                }).ToList();
            ViewBag.BillDetail = billdetail;

            return View();
        }

    }
}