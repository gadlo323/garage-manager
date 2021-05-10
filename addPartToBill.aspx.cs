using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using GargeManger.App_Code;

namespace GargeManger
{
    public partial class addPartToBill : System.Web.UI.Page
    {
         
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                RendarPart("");
            }
        }

        protected void RendarPart(string category)
        {
            string[] allCategory = category.Split(',');
            DataTable data = PartModel.GetParts(Session["UserID"].ToString(), allCategory);
            showPart.DataSource = data;
            showPart.DataBind();
            RendarCart();
        }
        protected void Search(object sender, EventArgs e)
        {
            string condition = string.Empty;
            foreach (ListItem item in catgorey.Items)
            {
                condition += item.Selected ? string.Format("{0},", item.Value) : "";
            }
            
            if(!string.IsNullOrEmpty( condition))
            {

                condition = condition.Remove(condition.Length - 1);
                    RendarPart(condition);
                
                
            }
            else
            {
                RendarPart(condition);
            }
            
            RendarPart(condition);
        }
        protected void RendarCart()
        {
            var GaragID = Session["UserID"].ToString();
            string CID = Request.QueryString["ID"].ToString();
            string teratmentID = Request.QueryString["termid"].ToString();
            var totalPrice = 0.0;
            CartModel model = new CartModel();
            DataTable data = model.GetCartData(GaragID, CID, teratmentID);
            var count = data.Rows.Count;
            while (count > 0)
            {
                var price = data.Rows[count-1]["productPrice"].ToString();
                totalPrice +=Convert.ToDouble(price);
                count--;
            }
            totelCart.InnerHtml = totalPrice.ToString();
            cart_Item.DataSource = data;
            cart_Item.DataBind();
        }


        [WebMethod(EnableSession = true)]
        public static bool AddToCart(string productName,string productPrice,string ProdectGroup,string PartID,string queryString, string productImage,string querytrimid)
        {
            
            var garageid = HttpContext.Current.Session["UserID"].ToString();
            //var queryString = HttpContext.Current.Request.QueryString["ID"];
            CartModel cart = new CartModel(Convert.ToInt32( queryString),Convert.ToInt32( garageid), PartID, 1, productName,Convert.ToDouble(productPrice), productImage, querytrimid);
           bool  insertWork =cart.AddItem();
           
            return (insertWork) ? true : false;

        }
        [WebMethod(EnableSession = true)]
        public static bool deleteItem( string PartID, string queryString)
        {
            var garageid = HttpContext.Current.Session["UserID"].ToString();
            //var queryString = HttpContext.Current.Request.QueryString["ID"];
            CartModel cart = new CartModel();
            bool deleteOrnot =cart.deleteItem(garageid, queryString, PartID);
            return (deleteOrnot) ? true : false;

        }
    }
}