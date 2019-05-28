using shop_cake.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace shop_cake.Controllers.Admin
{
    public class AdminEditCategoryController : Controller
    {
        private shop_cakeEntities1 db = new shop_cakeEntities1();
        // GET: AdminEditCategory
        [HttpGet]
        public ActionResult Index(int id)
        {
            ViewBag.Category = db.product_types.Find(id);
            return View();
        }
        [HttpPost]
        public ActionResult Edit(product_types model)
        {
            var obj = db.product_types.FirstOrDefault(x => x.id_product_type == model.id_product_type);
            obj.name = model.name;
            db.Entry(obj).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index", "AdminCategory");
        }

    }
}