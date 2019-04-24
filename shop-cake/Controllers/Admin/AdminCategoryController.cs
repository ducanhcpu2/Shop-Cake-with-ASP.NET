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
        private shop_cakeEntities1 db = new shop_cakeEntities1();
        // GET: AdminCategory
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddCategory(product_types model)
        {

            if (ModelState.IsValid)
            {
                db.product_types.Add(new product_types
                {
                    name = model.name
                });
                db.SaveChanges();
                return RedirectToAction(actionName: "Index", controllerName: "AdminCategory");
            }
            return View(model);
        }
    }
}