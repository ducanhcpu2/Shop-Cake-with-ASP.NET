using shop_cake.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace shop_cake.Controllers
{
    public class SignUpController : Controller
    {
        private shop_cakeEntities1 db = new shop_cakeEntities1();
        // GET: SignUp
        [HttpGet]
        public ActionResult SignUp()
        {
            return View();
        }
        public bool CheckEmail(string email)
        {
            return db.customers.Count(x => x.email == email) > 0;
        }
        public long Insert(customer entity)
        {
            db.customers.Add(entity);
            db.SaveChanges();
            return entity.id_customer;
        }
        [HttpPost]
        public ActionResult SignUp(SignUpModel model)
        {

            if (ModelState.IsValid){
                if (CheckEmail(model.Email))
                {
                    ModelState.AddModelError("", "Tên đăng nhập đã tồn tại");
                }
                else
                {
                    var custo = new customer();
                    custo.email = model.Email;
                    custo.name = model.FullName;
                    custo.address = model.Address;
                    custo.phone_number = model.Phone;
                    custo.password = model.Password;
                    var result = Insert(custo);
                    if (result > 0)
                    {
                        ViewBag.Success = "Đăng ký thành công";
                        model = new SignUpModel();
                    }
                    else
                    {
                        ModelState.AddModelError("", "Đăng ký không thành công.");
                    }
                }
            }
            return View(model);
        }
        

    }
}