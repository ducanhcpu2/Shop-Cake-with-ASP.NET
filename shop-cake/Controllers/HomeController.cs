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

namespace shop_cake.Controllers
{
    public class Slides
    {
        public int id_slide;
        public string link;
        public string image;
    }
    public class HomeController : Controller
    {
        private shop_cakeEntities db = new shop_cakeEntities();

        //public actionresult index()
        //{

        //    return view();
        //}

        public async Task<ActionResult> Index()
        {
            var slides_from_db = await db.slides.ToListAsync();

            var product = await db.products.ToListAsync();
            List<Slides> slide = new List<Slides>();
            var slidesObject = from b in slides_from_db select new {id_slide= b.id_slide,link=b.link,image=b.image};
            foreach(var item in slidesObject)
            {
                slide.Add(new Slides() { id_slide =item.id_slide,image=item.image,link=item.link});

            }
            ViewBag.TotalSlides = slide.Count();
            ViewBag.AllSlide = slide;
            return View();
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