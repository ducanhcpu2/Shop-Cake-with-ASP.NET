using Models.Framework;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class AdminModel
    {
        private ShopCakeDbContext context = null;

        public AdminModel()
        {
            context = new ShopCakeDbContext();
        }

        public bool Login(string Email, string Password)
        {
            object[] SqlParams =
            {
                new SqlParameter("@Email",Email),
                new SqlParameter("@Password",Password)
            };

            var res = context.Database.SqlQuery<bool>("Sp_Admin_Login @Email,@Password", SqlParams).SingleOrDefault();
            return res;
        }
    }
}
