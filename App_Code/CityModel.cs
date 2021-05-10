using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace GargeManger.App_Code
{
    public class CityModel
    {
        private int CityID { get; set; }
        private string CityName { get; set; }


        public CityModel(int cityid,string cityname)
        {
            this.CityID = cityid;
            this.CityName = cityname;
        }

        public static DataTable All_City()
        {
           DataTable sql = new sql_class().Get("City", "CityID", "CityName");
            return sql;
        }
    }
}