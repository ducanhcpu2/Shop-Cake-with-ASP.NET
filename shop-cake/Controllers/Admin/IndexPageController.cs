using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace shop_cake.Controllers.Admin
{
    public class IndexPageController : Controller
    {
        // GET: IndexPage//abc
        public ActionResult Index()
        {
            return View();
        }
    }
}