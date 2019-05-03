using Model.Framework;
using shop_cake.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace shop_cake.Controllers
{
    public class ProductController : Controller
    {
        private CakeshopDbContext db = new CakeshopDbContext();
        // GET: Product
        public ActionResult Product()
        {
            var detail_product = db.products.Where(x => x.id_product == 1);
            ViewBag.detail_product = detail_product;
            return View();
        }
    }
}