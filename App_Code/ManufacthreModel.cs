using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace GargeManger.App_Code
{
    public class ManufacthreModel
    {
        private int tozeret_cd;
        private string tozar;

        public string manufacthre_Name
        {
            get { return tozar; }
            set { tozar = value; }
        }


        public int manufacthreID
        {
            get { return tozeret_cd; }
            set { tozeret_cd = value; }
        }
        public ManufacthreModel()
        {

        }

        public ManufacthreModel(int manufacthreID, string manufacthre_Name)
        {
            tozeret_cd = manufacthreID;
            tozar = manufacthre_Name;
        }

        public static  string GetozarName(string id)
        {
            sql_class sql = new sql_class();
            DataTable data = sql.Where("tozeret_cd", id).Get("Manufacturers", "tozar");
            return data.Rows[0]["tozar"].ToString();
        }
    }
}