using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using GargeManger.App_Code;


namespace GargeManger.App_Code
{
    public class CustomerModel
    {
        private int CustomerID;
        private int GaragID;
        private string FirstName;
        private string LastName;
        private string Email;
        private string UsarName;
        private string PhonNumber;
        private string Password;
        private DateTime BirthDate;
        private DateTime JoinDate;

        public DateTime joinDate
        {
            get { return JoinDate; }
            set { JoinDate = value; }
        }


        public DateTime birthDate
        {
            get { return BirthDate; }
            set { BirthDate = value; }
        }


        public string password
        {
            get { return Password; }
            set { Password = value; }
        }


        public string phonNumber
        {
            get { return PhonNumber; }
            set { PhonNumber = value; }
        }


        public string usarname
        {
            get { return UsarName; }
            set { UsarName = value; }
        }


        public string email
        {
            get { return Email; }
            set { Email = value; }
        }


        public string lastname
        {
            get { return LastName; }
            set { LastName = value; }
        }


        public string firstnmae
        {
            get { return FirstName; }
            set { FirstName = value; }
        }


        public int Gargrid
        {
            get { return GaragID; }
            set { GaragID = value; }
        }


        public int Customerid
        {
            get { return CustomerID; }
            set { CustomerID = value; }
        }

        public CustomerModel(int customerID, int gargrID, string firstNmae, string lastName, string email, string usarName, string phonNumber, string password, DateTime birthDate, DateTime joinDate)
        {
            CustomerID = customerID;
            GaragID = gargrID;
            FirstName = firstNmae;
            LastName = lastName;
            Email = email;
            UsarName = usarName;
            PhonNumber = phonNumber;
            Password = password;
            BirthDate = birthDate;
            JoinDate = joinDate;
        }
        public CustomerModel(int id)
        {
            
            DataTable data = new sql_class().Where("Customerid", id.ToString()).Get("Customer");
            CustomerID = Convert.ToInt32(data.Rows[0]["CustomerID"]);
            GaragID = Convert.ToInt32(data.Rows[0]["GaragID"]);
            FirstName = data.Rows[0]["FirstName"].ToString();
            LastName = data.Rows[0]["LastName"].ToString();
            Email = data.Rows[0]["Email"].ToString();
            UsarName = data.Rows[0]["UsarName"].ToString();
            PhonNumber = data.Rows[0]["Phone"].ToString();
            Password = data.Rows[0]["Password"].ToString();
            BirthDate = Convert.ToDateTime( data.Rows[0]["BirthDate"]);
            JoinDate = Convert.ToDateTime( data.Rows[0]["JOINING_DATE"]);
            
        }
        public CustomerModel(string ID)
        {

            DataTable data = new sql_class().Where("UsarName", ID).Get("Customer");
            CustomerID = Convert.ToInt32(data.Rows[0]["CustomerID"]);
            GaragID = Convert.ToInt32(data.Rows[0]["GaragID"]);
            FirstName = data.Rows[0]["FirstNmae"].ToString();
            LastName = data.Rows[0]["LastName"].ToString();
            Email = data.Rows[0]["Email"].ToString();
            UsarName = data.Rows[0]["UsarName"].ToString();
            PhonNumber = data.Rows[0]["PhonNumber"].ToString();
            Password = data.Rows[0]["Password"].ToString();
            BirthDate = Convert.ToDateTime(data.Rows[0]["BirthDate"]);
            JoinDate = Convert.ToDateTime(data.Rows[0]["JOINING_DATE"]);

        }
        public static bool create_new_Customer(List<DbListAdapter> data)

        {
            sql_class newsql = new sql_class();

            return newsql.Insert("Customer", data) ? true : false;

        }
        public static DataTable  Customer_info(string ID)
        {
            DataTable data = new sql_class().Where("UsarName", ID).Get("Customer");
            return data;
        }
    }
}