using Model.Framework;
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
        private CakeshopDbContext db = new CakeshopDbContext();
        public ActionResult Index()
        {
            ViewBag.Users = db.customers;
            return View();
        }
    }
}