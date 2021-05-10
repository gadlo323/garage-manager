using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Script.Serialization;
using GargeManger.App_Code;

namespace GargeManger.App_Code
{
    public class PartModel
    {
        private int PartID;
        private string ProdectGroup;
        private string PartNmae;
        private string Condition;
        private int QuantityAaliable;
        private Double UnitPricey;
        private string ImageUrl;
        private int GaragID;

        public int garagID
        {
            get { return GaragID; }
            set { GaragID = value; }
        }


        public string imageUrl
        {
            get { return ImageUrl; }
            set { ImageUrl = value; }
        }


        public Double unitPricey
        {
            get { return UnitPricey; }
            set { UnitPricey = value; }
        }


        public int quantityAaliable
        {
            get { return QuantityAaliable; }
            set { QuantityAaliable = value; }
        }


        public string condition
        {
            get { return Condition; }
            set { Condition = value; }
        }


        public string partNmae
        {
            get { return PartNmae; }
            set { PartNmae = value; }
        }


        public string prodectGroup
        {
            get { return ProdectGroup; }
            set { ProdectGroup = value; }
        }


        public int partID
        {
            get { return PartID; }
            set { PartID = value; }
        }

        public PartModel(int partID, string prodectGroup, string partNmae, string condition, int quantityAaliable, double unitPricey,string ImageUrl)
        {
            PartID = partID;
            ProdectGroup = prodectGroup;
            PartNmae = partNmae;
            Condition = condition;
            QuantityAaliable = quantityAaliable;
            UnitPricey = unitPricey;
            this.ImageUrl = imageUrl;
        }

        public PartModel( string prodectGroup, string partNmae, string condition, int quantityAaliable, double unitPricey, int GaragID,string imageUrl)
        {
       
            ProdectGroup = prodectGroup;
            PartNmae = partNmae;
            Condition = condition;
            QuantityAaliable = quantityAaliable;
            UnitPricey = unitPricey;
            this.GaragID = GaragID;
            this.ImageUrl = imageUrl;
        }


        //Add new part to partModel table
        public bool newPart()
        {
            sql_class sql = new sql_class();
            var Dblist = new List<DbListAdapter>();
            Dblist.Add(new DbListAdapter("ProdectGroup", this.ProdectGroup));
            Dblist.Add(new DbListAdapter("PartNmae", this.PartNmae));
            Dblist.Add(new DbListAdapter("Condition", this.Condition));
            Dblist.Add(new DbListAdapter("QuantityAaliable", this.QuantityAaliable.ToString()));
            Dblist.Add(new DbListAdapter("UnitPricey", this.UnitPricey.ToString()));
            Dblist.Add(new DbListAdapter("ImageUrl", this.ImageUrl));
            Dblist.Add(new DbListAdapter("GaragID", this.GaragID.ToString()));

            bool succses = sql.Insert("PartModel", Dblist);
            if (succses)
                return true;
            else
                return false;
        }

        public static DataTable GetParts(string id, params string[] fields)
        {
            sql_class sql_ = new sql_class();
            if(fields.Length > 0)
            {
                foreach(string fiald in fields)
                {
                    if (!string.IsNullOrEmpty(fiald))
                    {
                        sql_.OrWhere("ProdectGroup", fiald);
                    }
                    
                }
            }
            sql_.Where("GaragID", id);
            DataTable data = sql_.Get("PartModel");
            return data;
        }
    }
}