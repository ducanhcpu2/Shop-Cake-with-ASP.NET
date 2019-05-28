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
        private shop_cakeEntities1 db = new shop_cakeEntities1();
        // GET: Product
        public ActionResult Product()
        {
            var detail_product = db.products.Where(x => x.id_product == 1);
            ViewBag.detail_product = detail_product;
            return View();
        }
    }
}