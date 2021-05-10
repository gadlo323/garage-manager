using System;
using System.Collections.Generic;
using System.Data;
using System.Runtime.InteropServices;
using GargeManger.App_Code;
using Newtonsoft.Json;using System.Web.Script.Serialization;

namespace GargeManger
{
    public class Garge
    {
        public readonly List<CustomerModel> customers;
        private int GaragID;
        private string CityID;
        private string NameGarga;
        private int pricePerHour;
        //private string UserName;
        private string Password;
        private string Address;
        private string FIRST_NAME;
        private string LAST_NAME;
        private string Phone;
        private string Email;
        private string Status;
        private string Activecode;
        private string imageUrl;
        private string joinDate;

        //Public get set
        public int GetGargeID()
        {
            return GaragID;
        }
        public void SetGargeID(int value)
        {
            GaragID = value;
        }
        //..................................
        public string GetCity()
        {
            return CityID;
        }
        public void SetCity(string value)
        {
            CityID = value;
        }
        //..................................
        public string GetNameGarga()
        {
            return NameGarga;
        }
        public void SetNameGarga(string value)
        {
            NameGarga = value;
        }
        //..................................
        public int GetPricePerHour()
        {
            return pricePerHour;
        }
        public void SetPricePerHour(int value)
        {
            pricePerHour = value;
        }
        //..................................
        //public string GetUserName()
        //{
        //    return UserName;
        //}
        //public void SetUserName(string value)
        //{
        //    UserName = value;
        //}
        //..................................
        public string GetPassword()
        {
            return Password;
        }
        public void SetPassword(string value)
        {
            Password = value;
        }
        //..................................
        public string GetAddress()
        {
            return Address;
        }
        public void SetAddress(string value)
        {
            Address = value;
        }
        //..................................
        public string GetFirstName()
        {
            return FIRST_NAME;
        }
        public void SetFirstName(string value)
        {
            FIRST_NAME = value;
        }
        //..................................
        public string GetLastName()
        {
            return LAST_NAME;
        }
        public void SetLastName(string value)
        {
            LAST_NAME = value;
        }
        //..................................
        public string GetPhone()
        {
            return Phone;
        }
        public void SetPhone(string value)
        {
            Phone = value;
        }
        //..................................
        public string GetEmail()
        {
            return Email;
        }
        public void SetEmail(string value)
        {
            Email = value;
        }
        //..................................
        public string status
        {
            get { return Status; }
            set { Status = value; }
        }
        //..................................
        public string Getactivecode()
        {
            return Activecode;
        }
        public void Setactivecode(string value)
        {
            Activecode = value;
        }
        //..................................
        public string GetimageUrl()
        {
            return imageUrl;
        }
        public void SetimageUrl(string value)
        {
            imageUrl = value;
        }
        //..................................
        private string GetJoinDate()
        {
            return joinDate;
        }
        private void SetJoinDate(string value)
        {
            joinDate = value;
        }

       


        //constructor
        public Garge(int id)
        {

            DataTable data = new sql_class().Where("GaragID", id.ToString()).Get("Garage");
            this.GaragID = id;
            this.CityID = data.Rows[0]["CityID"].ToString();
            this.NameGarga = data.Rows[0]["NameGarga"].ToString();
            this.pricePerHour = Convert.ToInt32(data.Rows[0]["pricePerHour"]);
            //this.UserName = data.Rows[0]["UserName"].ToString();
            this.Password = data.Rows[0]["Password"].ToString();
            this.Address = data.Rows[0]["Address"].ToString();
            this.FIRST_NAME = data.Rows[0]["FIRST_NAME"].ToString();
            this.LAST_NAME = data.Rows[0]["LAST_NAME"].ToString();
            this.Phone = data.Rows[0]["Phone"].ToString();
            this.Email = data.Rows[0]["Email"].ToString();
            this.status = data.Rows[0]["Status"].ToString();
            this.Activecode = data.Rows[0]["Activecode"].ToString();
            this.imageUrl = data.Rows[0]["imageUrl"].ToString();
            this.joinDate = data.Rows[0]["JoinDate"].ToString();

            this.customers = getAllCustomers();
            
        }
        
        //func thet get all Customers
        public List<CustomerModel> getAllCustomers()
        {
            List<CustomerModel> list = new List<CustomerModel>();
            DataTable sql = new sql_class().Where("GaragID", this.GaragID.ToString()).Get("Customer", "CustomerID");
            
            for(int i = 0; i < sql.Rows.Count; i++)
            {
                CustomerModel customer = new CustomerModel( Convert.ToInt32( sql.Rows[i]["CustomerID"] ));
                list.Add(customer);
            }

            return list;
        }
       
        //func return FullName
        public string Get_Full_Name()
        {
            return this.GetFirstName() + " " + GetLastName();
        }

        //Func Registraion New_Garge
        public static bool create_new_garage(List< DbListAdapter>  data)
            
        {
            sql_class newsql = new sql_class();

            return newsql.Insert("Garage", data) ? true : false;
            
        }

        //Func Login Admin
        public static DataTable get_data(string user, [Optional]string password, [Optional]string status,params string[] User)
        {
            sql_class new_data = new sql_class();
            new_data.Where("Email", user);
            new_data.Where("Password", password);
            new_data.Where("Status", status);
            DataTable data = new_data.Get("Garage", User);
            return data;
        }
         
        //Fung Get Name of City
        public string  get_city()
        {
            DataTable data = new sql_class().Where("CityID", CityID).Get("City", "CityName", "CityNameEN");
            string Name_City= data.Rows[0]["CityName"].ToString();
            //Name_Hebrwo = data.Rows[0]["CityName"].ToString();
            return Name_City;
        }


        public string Calnder_data()
        {
           
            
            DataTable data = new sql_class().Where("GaragID", this.GaragID.ToString()).Where("ShwoEvent","true").Get("EventsModel");
            List<EventsModel> list = new List<EventsModel>();
            for (int i = 0; i < data.Rows.Count; i++)
            {
                EventsModel events = new EventsModel(this.GaragID, i);
                list.Add(events);
            }
            return JsonConvert.SerializeObject(list);
           
        }

        public bool UpdateShowEvent(string idevent)
        {
            sql_class sql = new sql_class();
            var Dblist = new List<DbListAdapter>();
            Dblist.Add(new DbListAdapter("ShwoEvent", false.ToString()));
            sql.Where("GaragID", this.GaragID.ToString());
            sql.Where("EventID", idevent);
            bool Updat_result = sql.Update("EventsModel", Dblist);
            return Updat_result;
        }

        //func thet get Top3 RepairJob
        public List<RepairJobl> GetTeratmentsTop3()
        {
            List<RepairJobl> list = new List<RepairJobl>();
            DataTable sql = new sql_class().Where("GaragID", this.GaragID.ToString())
                .Where("Status","true").Sort("DESC", "StartDate")
                .Limit(3).Get("RepairJob", "teratmentID");

            for (int i = 0; i < sql.Rows.Count; i++)
            {
                RepairJobl Teratment = new RepairJobl(Convert.ToInt32(sql.Rows[i]["teratmentID"]));
                list.Add(Teratment);
            }

            return list;
        }
        
        public List<RepairJobl> GetTeratments()
        {
            List<RepairJobl> list = new List<RepairJobl>();
            DataTable sql = new sql_class().Where("GaragID", this.GaragID.ToString()).Where("Status", "true").Get("RepairJob", "teratmentID");

            for (int i = 0; i < sql.Rows.Count; i++)
            {
                RepairJobl Teratment = new RepairJobl(Convert.ToInt32(sql.Rows[i]["teratmentID"]));
                list.Add(Teratment);
            }

            return list;
        }

        public List<Sticky_Note> GetSticky_Notes()
        {
            List<Sticky_Note> list = new List<Sticky_Note>();
            DataTable sql = new sql_class().Where("GaragID", this.GaragID.ToString()).Get("StickyModel", "stickyID");

            for (int i = 0; i < sql.Rows.Count; i++)
            {
                Sticky_Note sticky = new Sticky_Note(Convert.ToInt32(sql.Rows[i]["stickyID"]),i);
                list.Add(sticky);
            }

            return list;
        }
    }

   
    
} 