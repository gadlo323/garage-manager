using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using GargeManger.App_Code;


namespace GargeManger.App_Code
{
    public class VehicleModel
    {
        private string License_Number;
        private int CustomerID;
        private int ModelID;
        private int ManufacthreID;
        private string misgeret;
        private string ModelYear;
        private DateTime tokef_test;
        private string Gimor;
        private string Balot;
        private string imageUrl;

        public string ImageUrl
        {
            get { return imageUrl; }
            set { imageUrl = value; }
        }


        public string balot
        {
            get { return Balot; }
            set { Balot = value; }
        }


        public string gimor
        {
            get { return Gimor; }
            set { Gimor = value; }
        }


        public DateTime Tokef_test
        {
            get { return tokef_test; }
            set { tokef_test = value; }
        }


        public string Modelyear
        {
            get { return ModelYear; }
            set { ModelYear = value; }
        }


        public string Misgeret
        {
            get { return misgeret; }
            set { misgeret = value; }
        }


        public int Manufacthreid
        {
            get { return ManufacthreID; }
            set { ManufacthreID = value; }
        }


        public int Modelid
        {
            get { return ModelID; }
            set { ModelID = value; }
        }


        public int Customerid
        {
            get { return CustomerID; }
            set { CustomerID = value; }
        }


        public string License_number
        {
            get { return License_Number; }
            set { License_Number = value; }
        }

        public VehicleModel(string license_Number, int customerID, int modelID,
            int manufacthreID, string misgeret, string modelYear,
            DateTime tokef_test, string gimor, string balot,string imageUrl)
        {
            License_Number = license_Number;
            CustomerID = customerID;
            ModelID = modelID;
            ManufacthreID = manufacthreID;
            this.misgeret = misgeret;
            ModelYear = modelYear;
            this.tokef_test = tokef_test;
            Gimor = gimor;
            Balot = balot;
            this.imageUrl = imageUrl;
        }

        public static bool create_new_Vehicle(List<DbListAdapter> data)

        {
            sql_class newsql = new sql_class();

            return newsql.Insert("Vehicle", data) ? true : false;

        }

       public static DataTable Info(int ID)
        {
            sql_class sql = new sql_class();
            DataTable data = sql.Where("CustomerID", ID.ToString()).Get("Vehicle");
            return data;
        }

        //public void ReminderTreatment()
        //{
        //    DateTime answer = firsttext.AddDays(Convert.Todouble(TextBox2.Text));
        //}
    }
}