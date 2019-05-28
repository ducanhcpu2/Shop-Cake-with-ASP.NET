using shop_cake.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace shop_cake.Controllers
{
    public class ShoppingCartController : Controller
    {
        shop_cakeEntities1 db = new shop_cakeEntities1();
        // GET: ShoppingCart
        public ActionResult ShoppingCart()
        {
            //abcde
            return View();
        }
        [HttpPost]
        public ActionResult Add()
        {
            customer user = (customer)Session["user"];
            if (user == null)
            {
                return RedirectToAction("Login", "Login");
            }
            int id = Convert.ToInt32(Request.Form["id"]);
            ShoppingCart cart = (ShoppingCart)Session["cart"];
            if (cart == null)
            {
                cart = new ShoppingCart();
            }
            var obj = db.products.Find(id);
            cart.InsertItem(obj.id_product, obj.name, obj.unit_price,obj.promotion_price,obj.image,obj.@new);
            Session["cart"] = cart;
            return Redirect(Request.UrlReferrer.ToString());
        }
        [HttpPost]
        public ActionResult Update(int[] id, int[] quantity)
        {
            ShoppingCart cart = (ShoppingCart)Session["cart"];
            if(cart == null)
            {
                return Redirect(Request.UrlReferrer.ToString());
            }
            for(int i  = 0; i<= id.Length-1; i++)
            {
                cart.UpdateNewQuantity(id[i], quantity[i]);
            }
            
            Session["cart"] = cart;
            return Redirect(Request.UrlReferrer.ToString());
        }
        [HttpPost]
        public ActionResult Delete(int id)
        {
            ShoppingCart cart = (ShoppingCart)Session["cart"];
            cart.RemoveItem(id);

            return Redirect(Request.UrlReferrer.ToString());
        }
    }
}