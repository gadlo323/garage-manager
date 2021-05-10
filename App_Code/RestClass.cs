using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GargeManger.App_Code
{
    public class RestClass
    {
        private int id;
        private string codeNumber;
        private int GargeID;
        private DateTime RestDate;
        private bool active;

        public bool Active
        {
            get { return active; }
            set { active = value; }
        }


        public DateTime Restdate
        {
            get { return RestDate; }
            set { RestDate = value; }
        }


        public int Gargeid
        {
            get { return GargeID; }
            set { GargeID = value; }
        }


        public string CodeNumber
        {
            get { return codeNumber; }
            set { codeNumber = value; }
        }


        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        public RestClass(int id, string codeNumber, int gargeID, DateTime restDate,bool active)
        {
            this.id = id;
            this.codeNumber = codeNumber;
            GargeID = gargeID;
            RestDate = restDate;
            this.active = active;
        }

        public static void InsertRestData(List<DbListAdapter> data)
        {
            sql_class sql = new sql_class();
             sql.Insert("RestUserAdmin", data);
            
        }
    }
}