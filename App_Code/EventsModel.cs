using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using GargeManger.App_Code;

namespace GargeManger.App_Code
{
    public class EventsModel
    {
        private int GaragID;
        private int EventID;
        private string Title;
        private string Description;
        private DateTime Start;
        private DateTime End;
        private string ThemsColor;
        private bool IsFullDay;

        public bool isFullDay
        {
            get { return IsFullDay; }
            set { IsFullDay = value; }
        }


        public string themsColor
        {
            get { return ThemsColor; }
            set { ThemsColor = value; }
        }


        public DateTime end
        {
            get { return End; }
            set { End = value; }
        }


        public DateTime start
        {
            get { return Start; }
            set { Start = value; }
        }


        public string description
        {
            get { return Description; }
            set { Description = value; }
        }


        public string title
        {
            get { return Title; }
            set { Title = value; }
        }



        public int eventID
        {
            get { return EventID; }
            set { EventID = value; }
        }


        public int Gargeid
        {
            get { return GaragID; }
            set { GaragID = value; }
        }

        public EventsModel(int gargeID, int id, string title, string description, DateTime start, DateTime end, string themsColor, bool isFullDay)
        {
            this.EventID = id;
            this.title = title;
            Description = description;
            this.start = start;
            this.end = end;
            ThemsColor = themsColor;
            IsFullDay = isFullDay;
        }

        public EventsModel(int id,int i)
        {
            DataTable data = new sql_class().Where("GaragID", id.ToString()).Where("ShwoEvent", "true").Get("EventsModel");
            GaragID = Convert.ToInt32( data.Rows[i]["GaragID"]);
            EventID= Convert.ToInt32(data.Rows[i]["EventID"]);
            Title = data.Rows[i]["Title"].ToString();
            Description = data.Rows[i]["Description"].ToString();
            start = Convert.ToDateTime( data.Rows[i]["StartDate"]);
            if (!String.IsNullOrEmpty( data.Rows[i]["EndDate"].ToString()))
            end = Convert.ToDateTime( data.Rows[i]["EndDate"]);
            ThemsColor = data.Rows[i]["ThemsColor"].ToString();
           IsFullDay = Convert.ToBoolean( data.Rows[i]["IsFullDay"]);
        }

        public EventsModel(string title, DateTime start, DateTime end)
        {
            this.Title = title;
            this.Start = start;
            this.End = end;
        }

        public static bool CreateNewEvent(List<DbListAdapter> data)

        {
            sql_class newsql = new sql_class();

            return newsql.Insert("EventsModel", data) ? true : false;

        }
    }
}