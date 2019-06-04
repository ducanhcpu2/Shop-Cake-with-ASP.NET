using shop_cake.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
namespace shop_cake.Controllers.Admin
{
    public class AdminEditProductController : Controller
    {
        // GET: AdminEditProduct
        private shop_cakeEntities1 db = new shop_cakeEntities1();
        public ActionResult Index(int? id)
        {
            var products =
           (from p in db.products
            join
            c in db.product_types
            on p.id_product_type equals c.id_product_type
            select new product_productType_ViewModel()
            {
                id_product = p.id_product,
                product_name = p.name,
                image = p.image,
                unit_price = p.unit_price,
                promotion_price = p.promotion_price,
                product_types_name = c.name,
                description = p.description,
                unit=p.unit
            });
            ViewBag.products = products.FirstOrDefault(x => x.id_product == id);
            ViewBag.Products_Type = db.product_types.ToList();
            return View();
        }
        [HttpPost]
        public ActionResult Edit(product_productType_ViewModel model, System.Web.HttpPostedFileWrapper image)
        {
            var obj = db.products.FirstOrDefault(x => x.id_product == model.id_product);
            obj.name = model.product_name;
            obj.unit_price = model.unit_price;
            obj.promotion_price = model.promotion_price;
            if (image != null)
            {
                obj.image = image.FileName;
                image.SaveAs(Server.MapPath(Path.Combine("~/image/product/", image.FileName)));
            }
            obj.id_product_type = model.id_product_type;
            obj.@new = model.@new;
            obj.unit = model.unit;
            
            obj.updated_at = System.DateTime.Now; 
            db.Entry(obj).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index","AdminProduct");
        }
        [HttpPost]
        //[ValidateAntiForgeryToken]
        public ActionResult Delete(int id)
        {
            //if(id>0)
            //{
            //    var obj = db.products.Where(x => x.id_product == id).FirstOrDefault();
            //    if(id!= null)
            //    {
            //        db.Entry(obj).State = System.Data.Entity.EntityState.Deleted;
            //        db.SaveChanges();
            //    }
            //}
            product obj = db.products.Find(id);
            db.products.Remove(obj);
            db.SaveChanges();

            return RedirectToAction("Index", "AdminProduct");
        }
    }
    //[HttpPost]
    //public ActionResult DeleteProduct(int id)
    //{
    //    product_productType_ViewModel model;
    //    if (id > 0)
    //    {
    //        var obj = 
    //            //db.products.where(x => x.id == studentid).firstordefault();
    //        //if (studentbyid != null)
    //        //{
    //        //    objcontext.entry(studentbyid).state = entitystate.deleted;
    //        //    objcontext.savechanges();
    //        //}
    //    }
    //    return RedirectToAction();
    //}

}