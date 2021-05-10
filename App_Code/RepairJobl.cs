using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;


namespace GargeManger.App_Code
{
    public class RepairJobl
    {
        private int teratmentID;
        private int GaragID;
        private int CustomerID;
        private int TypeID;
        private string License_Number;
        private string description;
        private DateTime StartDate;
        private DateTime EndDate;
        private bool Status;
        private string Approved_by;
        private string Mileage_start;
        private int TotalWorkingHours;

       

        public string mileage_start
        {
            get { return Mileage_start; }
            set { Mileage_start = value; }
        }


        public string approved_by
        {
            get { return Approved_by; }
            set { Approved_by = value; }
        }


        public bool status
        {
            get { return Status; }
            set { Status = value; }
        }


        public DateTime endDate
        {
            get { return EndDate; }
            set { EndDate = value; }
        }


        public DateTime startDate
        {
            get { return StartDate; }
            set { StartDate = value; }
        }


        public string Description
        {   get { return description; }
            set { description = value; }
        }


        public string license_Number
        {
            get { return License_Number; }
            set { License_Number = value; }
        }


        public int typeID
        {
            get { return TypeID; }
            set { TypeID = value; }
        }
        public int Customerid
        {
            get { return CustomerID; }
            set { CustomerID = value; }
        }


        public int Gargeid
        {
            get { return GaragID; }
            set { GaragID = value; }
        }

        public int teratmentid
        {
            get { return teratmentID; }
            set { teratmentID = value; }
        }
        public int totalWorkingHours
        {
            get { return TotalWorkingHours; }
            set { TotalWorkingHours = value; }
        }
        public RepairJobl()
        {
            //empty construtor
        }

        public RepairJobl(int teratmentID, int garagID, int customerID, int typeID, string license_Number, string description,
            DateTime startDate, DateTime endDate, bool status, string approved_by, string mileage_start,int totalWorkingHours) : this(teratmentID)
        {
            GaragID = garagID;
            CustomerID = customerID;
            TypeID = typeID;
            License_Number = license_Number;
            this.description = description;
            StartDate = startDate;
            EndDate = endDate;
            Status = status;
            Approved_by = approved_by;
            Mileage_start = mileage_start;
            TotalWorkingHours = totalWorkingHours;
        }

        public  RepairJobl(int id)
        {

            DataTable data = new sql_class().Where("teratmentID", id.ToString()).Get("RepairJob");

            teratmentID = Convert.ToInt32(data.Rows[0]["teratmentID"]);
            GaragID = Convert.ToInt32(data.Rows[0]["GaragID"]);
            CustomerID = Convert.ToInt32( data.Rows[0]["CustomerID"]);
            TypeID = Convert.ToInt32( data.Rows[0]["TypeID"]);
            License_Number = data.Rows[0]["License_Number"].ToString();
            description = data.Rows[0]["description"].ToString();
            StartDate =Convert.ToDateTime( data.Rows[0]["StartDate"]);
            Status =Convert.ToBoolean(data.Rows[0]["Status"]);
            Approved_by = data.Rows[0]["Approved_by"].ToString();
            Mileage_start = data.Rows[0]["Mileage_start"].ToString();
            var isNull =data.Rows[0]["TotalWorkingHours"].ToString();
            if (isNull != ""){
                TotalWorkingHours = Convert.ToInt32(data.Rows[0]["TotalWorkingHours"]);
            }
            var isEnddateNull = data.Rows[0]["EndDate"].ToString();
            if (isEnddateNull != "")
            {
                EndDate = Convert.ToDateTime(data.Rows[0]["EndDate"]);
            }

        }
        //Func RegistraionNew_RepairJob
        public static bool New_RepairJob(List<DbListAdapter> data)

        {
            sql_class newsql = new sql_class();

            return newsql.Insert("RepairJob", data) ? true : false;

        }

        //End and close repiarJob 
        public bool closeRepiarJob(string teratmentID)
        {
             var nowDataTime = DateTime.Now.ToString("yyyy-MM-dd h:mm:ss tt");
             sql_class sql = new sql_class();
            sql.Where("teratmentID", teratmentID);
            var Dblist = new List<DbListAdapter>();
             Dblist.Add(new DbListAdapter("Status", "false"));
             Dblist.Add(new DbListAdapter("EndDate", nowDataTime));
             bool updateOrnot =   sql.Update("RepairJob", Dblist);
             return updateOrnot;

        }
        //delete repair job in database
        public bool deleteJob(string teratmentID)
        {
            sql_class sql = new sql_class();
            sql.Where("teratmentID", teratmentID);
            DataTable jobDelete = sql.Delete("RepairJob");
            return (jobDelete.Rows.Count > 0) ? true : false;
        }

        public List<RepairJobl> AllHistory(string Id)
        {
            List<RepairJobl> list = new List<RepairJobl>();
            sql_class sql = new sql_class();
            sql.Where("GaragID", Id);
           DataTable data  = sql.Get("RepairJob");
            for (int i = 0; i < data.Rows.Count; i++)
            {
                RepairJobl Teratment = new RepairJobl(Convert.ToInt32(data.Rows[i]["teratmentID"]));
                list.Add(Teratment);
            }
            return list;
        }
    }

}