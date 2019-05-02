using shop_cake.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
namespace shop_cake.Controllers.Admin
{
    public class AdminAddProductController : Controller
    {
        // GET: AdminAddProduct
        private shop_cakeEntities1 db = new shop_cakeEntities1();
        public ActionResult Index()
        {
            ViewBag.Products_Type = db.product_types;
            return View();
        }
        [HttpPost]
        public ActionResult AddProduct(product_productType_ViewModel model, System.Web.HttpPostedFileWrapper image)
        {
            
            if (ModelState.IsValid)
            {
                db.products.Add(new product { name = model.product_name, unit_price = model.unit_price , promotion_price=model.promotion_price
                    ,image= image.FileName,
                    @new=model.@new,unit=model.unit,description=model.description,id_product_type=model.id_product_type
                });
                db.SaveChanges();
                return RedirectToAction(actionName: "Index", controllerName:"AdminProduct");
            }
            return View(model);
        }
    }
}