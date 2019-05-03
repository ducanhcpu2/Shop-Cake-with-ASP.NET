using Model.Framework;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    
    public class AccountModel
    {
        private CakeshopDbContext context = null;
        public AccountModel()
        {
            context = new CakeshopDbContext();
        }
        public bool Login(string Email, string password)
        {
            object[] sqlParams =
            {
                new SqlParameter("@Email", Email),
                new SqlParameter("@Password", password),
            };
            var res = context.Database.SqlQuery<bool>("Sp_Admin_Login @Email, @Password", sqlParams).SingleOrDefault();
            return res;
        }
        
    }
}
