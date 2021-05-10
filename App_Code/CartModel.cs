using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using GargeManger.App_Code;

namespace GargeManger.App_Code
{
    public class CartModel
    {
       // private int CartId;
        private int CustomerID;
        private int GaragID;
        private string ProductId;
        private int Quantity;
        private string ProductName;
        private DateTime Odata;
        private bool order_Status;
        private double productPrice;
        private string productImage;
        private string teratmentID;

        public string TeratmentID
        {
            get { return teratmentID; }
            set { teratmentID = value; }
        }


        public string productimage
        {
            get { return productImage; }
            set { productImage = value; }
        }


        public double productrice
        {
            get { return productPrice; }
            set { productPrice = value; }
        }


        public bool order_status
        {
            get { return order_Status; }
            set { order_Status = value; }
        }


        public DateTime odata
        {
            get { return Odata; }
            set { Odata = value; }
        }


        public string productName
        {
            get { return ProductName; }
            set { ProductName = value; }
        }


        public int quantity
        {
            get { return Quantity; }
            set { Quantity = value; }
        }


        public string productId
        {
            get { return ProductId; }
            set { ProductId = value; }
        }


        public int garagID
        {
            get { return GaragID; }
            set { GaragID = value; }
        }


        public int customerID
        {
            get { return CustomerID; }
            set { CustomerID = value; }
        }

        /*
        public int cartId
        {
            get { return CartId; }
            set { CartId = value; }
        }
        */
        public CartModel()
        {
        }

        public CartModel(int customerID, int garagID, string productId,
            int quantity, string productName, double productprice, string productimage,string teratmentID)
        {
            CustomerID = customerID;
            GaragID = garagID;
            ProductId = productId;
            Quantity = quantity;
            ProductName = productName;
            productPrice = productprice;
            productImage = productimage;
            this.teratmentID = teratmentID;
        }

        public bool AddItem()
        {
            var Dblist = new List<DbListAdapter>();
            Dblist.Add(new DbListAdapter("CustomerID", this.CustomerID.ToString()));
            Dblist.Add(new DbListAdapter("GaragID", GaragID.ToString()));
            Dblist.Add(new DbListAdapter("ProductId", this.ProductId));
            Dblist.Add(new DbListAdapter("Quantity", this.Quantity.ToString()));
            Dblist.Add(new DbListAdapter("ProductName", this.ProductName));
            Dblist.Add(new DbListAdapter("productPrice", this.productPrice.ToString()));
            Dblist.Add(new DbListAdapter("productImage", this.productImage));
            Dblist.Add(new DbListAdapter("teratmentID", this.teratmentID));
            sql_class sql = new sql_class();
            bool newItem = sql.Insert("CartModel",Dblist);
            return (newItem) ? true : false;
        }

        public  DataTable GetCartData(string userId , string customerId,string teratmentID)
        {
            sql_class sql = new sql_class();
            sql.Where("CustomerID", customerId);
            sql.Where("teratmentID", teratmentID);
            sql.Where("GaragID", userId);
            return sql.Get("CartModel");

        }

        public  bool deleteItem(string GargeID,string CustomerID,string partID)
        {
            sql_class sql = new sql_class();
            sql.Where("GaragID", GargeID);
            sql.Where("CustomerID", CustomerID);
            sql.Where("ProductId", partID);
            DataTable data = sql.Delete("CartModel");

            return (data.Rows.Count > 0) ? true : false; 

        }
        //End and close repiarJob 
        public bool cartItemChengaStatus(string teratmentID)
        {
            sql_class sql = new sql_class();
            sql.Where("teratmentID", teratmentID);
            var Dblist = new List<DbListAdapter>();
            Dblist.Add(new DbListAdapter("order_Status", "false"));
            bool updateOrnot = sql.Update("CartModel", Dblist);
            return updateOrnot;

        }
        // //delete teratmient All part from cart database
        public bool deleteAllCart(string teratmentID)
        {
            sql_class cart = new sql_class();
            cart.Where("teratmentID", teratmentID);
            DataTable cartDelete = cart.Delete("CartModel");
            return (cartDelete.Rows.Count > 0) ? true : false;
        }
    }

}