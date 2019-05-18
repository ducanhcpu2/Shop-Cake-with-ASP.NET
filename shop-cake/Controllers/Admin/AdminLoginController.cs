using shop_cake.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace shop_cake.Controllers.Admin
{
    public class AdminLoginController : Controller
    {
        private shop_cakeEntities1 db = new shop_cakeEntities1();
        // GET: AdminLogin
        public ActionResult Index()
        {
            return View();
        }

        
        [HttpPost]
        public ActionResult Login(admin admin)
        {
            admin ad = (admin)Session["admin"];
            var _admin = db.admins.Where(s => s.email == admin.email);
            if (_admin.Any())
            {
                if (_admin.Where(s => s.password == admin.password).Any())
                {
                    ad = admin;
                    Session["admin"] = ad;
                    return RedirectToAction("Index", "IndexPage");
                    //return Json(new { status = true, message = "Login Successfull!" });
                }
                else
                {
                    //return Json(new { status = false, message = "Invalid Password!" });
                    return Redirect(Request.UrlReferrer.ToString());
                }
            }
            else
            {
                // return Json(new { status = false, message = "Invalid Email!" });
                return Redirect(Request.UrlReferrer.ToString());
            }
        }
        public ActionResult LogoutAdmin()
        {
            Session["admin"] = null;

            return RedirectToAction("Index", "AdminLogin");
        }
    }
}