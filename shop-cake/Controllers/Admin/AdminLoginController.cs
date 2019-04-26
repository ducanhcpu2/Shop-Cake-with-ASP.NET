using Models;
using shop_cake.Controllers.Code;
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
        [HttpGet]
        // GET: AdminLogin
        public ActionResult Login()
        {
            return View("Index");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginAdminModel model)
        {
            var result = new AdminModel().Login(model.Email, model.Password);
            if (result && ModelState.IsValid)
            {
                SessionHelper.SetSession(new AdminSession() {Email = model.Email });
                return RedirectToAction("Index", "IndexPage");
            }
            else
            {
                ModelState.AddModelError("", "Ten dang nhap hoac mat khau khong dung.");
            }
            return View("Index",model);
        }
        
    }
}