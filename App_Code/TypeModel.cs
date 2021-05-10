using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GargeManger.App_Code
{
    public class TypeModel
    {
        private int TypeID;
        private int PartID;

        public int partID
        {
            get { return PartID; }
            set { PartID = value; }
        }


        public int typeID
        {
            get { return TypeID; }
            set { TypeID = value; }
        }

        public TypeModel(int typeID, int partID)
        {
            TypeID = typeID;
            PartID = partID;
        }
    }
}