using shop_cake.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace shop_cake.Controllers.Admin
{
    public class AdminListUsersController : Controller
    {
        // GET: AdminListUsers
        private shop_cakeEntities1 db = new shop_cakeEntities1();
        public ActionResult Index()
        {
            ViewBag.Users = db.customers;
            return View();
        }
    }
}