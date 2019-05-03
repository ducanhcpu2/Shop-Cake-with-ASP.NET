using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace shop_cake.Session
{
    [Serializable]
    public class AdminSession
    {
        public string Email { set; get; }
    }
}