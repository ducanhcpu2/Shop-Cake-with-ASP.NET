﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace shop_cake.Controllers
{
    public class SignUpController : Controller
    {
        // GET: SignUp
        [HttpGet]
        public ActionResult SignUp()
        {
            return View();
        }
    }
}