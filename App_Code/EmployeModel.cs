using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GargeManger.App_Code;

namespace GargeManger.App_Code
{
    public class EmployeModel
    {
        private int EmployeID;
        private int GargeID;
        private string FirstName;
        private string LastName;
        private string IdCard;
        private string PhonNumber;
        private bool Status;
        private DateTime StartWorkDate;

        public DateTime startWorkDate
        {
            get { return StartWorkDate; }
            set { StartWorkDate = value; }
        }


        public bool status
        {
            get { return Status; }
            set { Status = value; }
        }


        public string phonNumber
        {
            get { return PhonNumber; }
            set { PhonNumber = value; }
        }


        public string lastName
        {
            get { return LastName; }
            set { LastName = value; }
        }


        public string firstname
        {
            get { return FirstName; }
            set { FirstName = value; }
        }


        public int gargeid
        {
            get { return GargeID; }
            set { GargeID = value; }
        }


        public int employeid
        {
            get { return EmployeID; }
            set { EmployeID = value; }
        }
        public string idCard
        {
            get { return IdCard; }
            set { IdCard = value; }
        }

        public EmployeModel(int employeID, int gargeID, string firstName, string lastName, string idCard, string phonNumber, bool status, DateTime startWorkDate)
        {
            EmployeID = employeID;
            GargeID = gargeID;
            FirstName = firstName;
            LastName = lastName;
            IdCard = idCard;
            PhonNumber = phonNumber;
            Status = status;
            StartWorkDate = startWorkDate;
        }

        public static bool create_new_Employee(List<DbListAdapter> data)

        {
            sql_class newsql = new sql_class();

            return newsql.Insert("EmployeModel", data) ? true : false;

        }
    }
}