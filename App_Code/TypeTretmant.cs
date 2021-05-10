using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GargeManger.App_Code
{
    public class TypeTretmant
    {
        private int TypeID;
        private string description;
        private double CostCare;

        public double Costcare
        {
            get { return CostCare; }
            set { CostCare = value; }
        }


        public string Description
        {
            get { return description; }
            set { description = value; }
        }


        public int typeID
        {
            get { return TypeID; }
            set { TypeID = value; }
        }

        public TypeTretmant(int typeID, string description, double costCare)
        {
            TypeID = typeID;
            this.description = description;
            CostCare = costCare;
        }
    }
}