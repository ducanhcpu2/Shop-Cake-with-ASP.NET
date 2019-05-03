using Model;
using shop_cake.Models;
using shop_cake.Session;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace shop_cake.Controllers.Admin
{
    public class AdminLoginController : Controller
    {
        // GET: AdminLogin
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(LoginAdminModel model)
        {
            var result = new AccountModel().Login(model.Email, model.Password);
            if(result && ModelState.IsValid)
            {
                SessionHelper.setSession(new AdminSession() { Email = model.Email });
                return RedirectToAction("Index", "IndexPage");
            }
            else
            {
                ModelState.AddModelError("", "Tên đăng nhập hoặc mật khẩu không đúng!");
            }
            return View(model);
        }

    }
}