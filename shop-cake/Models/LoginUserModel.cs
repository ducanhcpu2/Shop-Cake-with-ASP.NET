using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace shop_cake.Models
{
    public class LoginUserModel
    {
        [Required]
        public string Email { set; get; }
        public string Password { set; get; }
        
    }
}