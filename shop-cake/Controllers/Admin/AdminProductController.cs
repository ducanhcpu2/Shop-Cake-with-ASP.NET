using PagedList;
using shop_cake.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using static shop_cake.Models.shop_cakeEntities1;

namespace shop_cake.Controllers.Admin
{
    public class AdminProductController : Controller
    {
        // GET: AdminProduct
        private shop_cakeEntities1 db = new shop_cakeEntities1();
        public ActionResult Index(int? page) 
        {
            var  products =
            (from p in db.products
            join
            c in db.product_types
            on p.id_product_type equals c.id_product_type
            select new product_productType_ViewModel() { id_product= p.id_product, product_name =  p.name, image= p.image,
                unit_price = p.unit_price, promotion_price= p.promotion_price, product_types_name = c.name }).ToList();

            int pageSize = 4;
            int pageNumber = (page ?? 1);
            ViewBag.List = products;
            return View(products.ToPagedList(pageNumber, pageSize));
        }
        //public PartialViewResult ProductPaging()
        //{

        //}
    }
}