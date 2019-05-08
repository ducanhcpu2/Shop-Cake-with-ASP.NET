using shop_cake.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace shop_cake.Controllers
{
    public class LoginController : Controller
    {
        shop_cakeEntities1 db = new shop_cakeEntities1();
        // GET: Login
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string email,string password)
        {
            customer user = (customer)Session["user"];
            if(user != null)
            {

                return RedirectToAction("Index", "Home");
            }
            var a = db.customers.Where(s => s.email == email.Trim()  ).FirstOrDefault();
            if(a != null)
            {
                if(a.password == password)
                {
                    user = a;
                    Session["user"] = user;
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    return Redirect(Request.UrlReferrer.ToString());
                }
            }
            return Redirect(Request.UrlReferrer.ToString());
        }
    }
}