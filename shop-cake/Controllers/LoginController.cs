using Models;
using shop_cake.Controllers.Code;
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
        // GET: Login
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginUserModel model)
        {
            var result = new CustomerModel().Login(model.Email, model.Password);
            if (result && ModelState.IsValid)
            {
                SessionHelper.SetSession(new UserSession() { Email = model.Email });
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ModelState.AddModelError("", "Ten dang nhap hoac mat khau khong dung.");
            }
            return View();
        }

    }
}