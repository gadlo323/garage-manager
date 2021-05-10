using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GargeManger
{
    public class CustomerInfo
    {
        public int CustomerID { get; set; }
        public int GargeID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string UserName { get; set; }
        public string Phone { get; set; }
        public string Password { get; set; }
        public string BirthDate{ get; set; }
        public string JoinDate { get; set; }

    }
}