using PagedList;
using shop_cake.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace shop_cake.Controllers
{
    public class ProductTypeController : Controller
    {
        shop_cakeEntities1 db = new shop_cakeEntities1();
        // GET: ProductType
        public ActionResult ProductType(int? a)
        {
            ViewBag.IDProductType = a;
            return View();
        }

        public PartialViewResult ListProductType()
        {

            return PartialView("ListProductType", db.product_types);
        }
        
        public PartialViewResult ListProduct(int? a, string currentFilter, string searchString, int? Page_No)
        {
            if (a == null)
            {
                a = 1;
            }
            var product = db.products.Where(s => s.id_product_type==a);
            //start search
            if (searchString != null)
            {
                Page_No = 1;
            }
            else
            {
                searchString = currentFilter;
            }

            ViewBag.CurrentFilter = searchString;

            var products = from s in product
                           select s;
            if (!String.IsNullOrEmpty(searchString))
            {
                products = products.Where(s => s.name.Contains(searchString));

            }
            //end search

            //paginate
            ViewBag.id_product_type = a;
            ViewBag.totalItem = product.Count();
            int Size_Of_Page = 4;
            int No_Of_Page = (Page_No ?? 1);
            return PartialView("ListProduct", products.OrderBy(i => i.id_product).ToPagedList(No_Of_Page, Size_Of_Page));
        }
        
    }
}