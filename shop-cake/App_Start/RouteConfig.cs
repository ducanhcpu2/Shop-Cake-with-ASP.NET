using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace shop_cake
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "AdminProduct",
                url: "AdminProduct/{action}/{id}",
                defaults: new { controller = "AdminProduct", action = "Index", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "AdminCategory",
                url: "AdminCategory/{action}/{id}",
                defaults: new { controller = "AdminCategory", action = "Index", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
