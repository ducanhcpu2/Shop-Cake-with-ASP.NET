using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace shop_cake.Models
{
    public class RegisterModel
    {

        [Display(Name = "Email")]
        [Required(ErrorMessage = "Bắt buộc phải nhập Email")]
        public string Email { set; get; }

        [Display(Name = "Họ tên")]
        [Required(ErrorMessage = "Bắt buộc phải nhập họ tên")]
        public string Name { set; get; }

        [Display(Name = "Mật khẩu")]
        [StringLength(20,MinimumLength =6,ErrorMessage ="Độ dài ít nhất là 6 kí tự")]
        public string Password { set; get; }

        [Display(Name = "Xác nhận mật khẩu")]
        [Compare("Password",ErrorMessage ="Mật khẩu không đúng")]
        public string ComfirmPassword { set; get; }

        

        [Display(Name = "Địa chỉ")]
        public string Address { set; get; }

        
        [Display(Name = "Số điện thoại")]
        public string Phone { set; get; }
    }
}