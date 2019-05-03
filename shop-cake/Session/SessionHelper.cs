using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace shop_cake.Session
{
    public class SessionHelper
    {
        public static void setSession(AdminSession session)
        {
            HttpContext.Current.Session["loginSession"] = session;
        }
        public static AdminSession getSession()
        {
            var session = HttpContext.Current.Session["loginSession"];
            if (session == null)
                return null;
            else
            {
                return session as AdminSession;
            }
        }
    }
}