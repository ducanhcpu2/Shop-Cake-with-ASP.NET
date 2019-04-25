using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using shop_cake.Models;
using PagedList;
namespace shop_cake.Controllers
{
    //aaaa
    public class Slides
    {
        public int id_slide;
        public string link;
        public string image;
    }
   
    public class HomeController : Controller
    {
        private shop_cakeEntities1 db = new shop_cakeEntities1();
        public async Task<ActionResult> Index()
        {
            var slides_from_db = await db.slides.ToListAsync();

            
            //start display slides
            List<Slides> slide = new List<Slides>();
            var slidesObject = from b in slides_from_db select new {id_slide= b.id_slide,link=b.link,image=b.image};
            foreach(var item in slidesObject)
            {
                slide.Add(new Slides() { id_slide =item.id_slide,image=item.image,link=item.link});

            }
            ViewBag.TotalSlides = slide.Count();
            ViewBag.AllSlide = slide;
            //end display slides
            
            return View();
        }
        //public ActionResult GetPaging(string currentFilter, string searchString, int? Page_No)
        //{
        //    var product = db.products;
        //    //start search
        //    if (searchString != null)
        //    {
        //        Page_No = 1;
        //    }
        //    else
        //    {
        //        searchString = currentFilter;
        //    }

        //    ViewBag.CurrentFilter = searchString;

        //    var products = from s in product
        //                   select s;
        //    if (!String.IsNullOrEmpty(searchString))
        //    {
        //        products = products.Where(s => s.name.Contains(searchString));

        //    }
        //    //end search

        //    //paginate

        //    int Size_Of_Page = 4;
        //    int No_Of_Page = (Page_No ?? 1);
        //    return PartialView("GetPaging", products.OrderBy(i => i.id_product).ToPagedList(No_Of_Page, Size_Of_Page));
        //}
        public PartialViewResult GetPaging(string currentFilter, string searchString, int? Page_No)
        {

            var product = db.products;
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

            int Size_Of_Page = 4;
            int No_Of_Page = (Page_No ?? 1);
            return PartialView("GetPaging", products.OrderBy(i => i.id_product).ToPagedList(No_Of_Page, Size_Of_Page));
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}