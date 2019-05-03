using Model.Framework;
using shop_cake.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace shop_cake.Controllers.Admin
{
    public class AdminCategoryController : Controller
    {
        private CakeshopDbContext db = new CakeshopDbContext();
        // GET: AdminCategory
        public ActionResult Index()
        {
            ViewBag.Product_Type = db.product_types;
            return View();
        }
        [HttpPost]
        public ActionResult AddCategory(Model.Framework.product_types model)
        {

            if (ModelState.IsValid)
            {
                db.product_types.Add(new Model.Framework.product_types
                {
                    name = model.name
                });
                db.SaveChanges();
                return RedirectToAction(actionName: "Index", controllerName: "AdminCategory");
            }
            return View(model);
        }

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            Model.Framework.product_types obj = db.product_types.Find(id);
            db.product_types.Remove(obj);
            db.SaveChanges();

            return RedirectToAction("Index", "AdminCategory");
        }
    }
}