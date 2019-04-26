﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace shop_cake.Controllers.Code
{
    public class SessionHelper
    {
        public static void SetSession(UserSession session)
        {
            HttpContext.Current.Session["loginSession"] = session;
        }

        public static void SetSession(AdminSession session)
        {
            HttpContext.Current.Session["loginAdminSession"] = session;
        }


        public static UserSession GetSession()
        {
            var session = HttpContext.Current.Session["loginSession"];
            if (session == null)
                return null;
            else
            {
                return session as UserSession; 
            }
        }

        public static AdminSession GetSessionAdmin()
        {
            var session = HttpContext.Current.Session["loginAdminSession"];
            if (session == null)
                return null;
            else
            {
                return session as AdminSession;
            }
        }
    }
}