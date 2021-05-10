using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using GargeManger.App_Code;
namespace GargeManger.App_Code
{
    public class Sticky_Note
    {
        private int stickyID;
        private int gargeID;
        private string sticky_Message;

        public string Sticky_Message
        {
            get { return sticky_Message; }
            set { sticky_Message = value; }
        }

        public int GargeID
        {
            get { return gargeID; }
            set { gargeID = value; }
        }


        public int StickyID 
        {
            get { return stickyID; }
            set { stickyID = value; }
        }

        public Sticky_Note()
        {

        }

        public Sticky_Note(int stickyID, int gargeID, string sticky_Message)
        {
            this.stickyID = stickyID;
            this.gargeID = gargeID;
            this.sticky_Message = sticky_Message;
        }

        public void New_Stikey( string message,string Session)
        {
            sql_class sql = new sql_class();
            var Dblist = new List<DbListAdapter>();
            Dblist.Add(new DbListAdapter("GaragID", Session));
            Dblist.Add(new DbListAdapter("sticky_Message", message));
            sql.Insert("StickyModel", Dblist);
        }
        public Sticky_Note(int id, int i)
        {
            DataTable data = new sql_class().Where("stickyID", id.ToString()).Get("StickyModel");
            stickyID = Convert.ToInt32(data.Rows[0]["stickyID"]);
            gargeID = Convert.ToInt32(data.Rows[0]["GaragID"]);
            sticky_Message =data.Rows[0]["sticky_Message"].ToString();

        }
    }
}