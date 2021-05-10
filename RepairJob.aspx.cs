using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Script.Serialization;
using GargeManger.App_Code;
using System.Web.Services;

namespace GargeManger
{
    public partial class RepairJob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                All_RepJob();
            }
        }


        protected void All_RepJob()
        {
            List<string> customerid = new List<string>();
            Garge garge = new Garge(Convert.ToInt32(Session["UserID"]));
            List<RepairJobl> list = garge.GetTeratments();
            RepJob.DataSource = list;
            RepJob.DataBind();
            
        }
        protected void OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string Id = (e.Item.FindControl("lblId") as Label).Text;
                string teratmentID = (e.Item.FindControl("teratmentID") as Label).Text;
                Repeater rptGallery = e.Item.FindControl("ShwoPartTreatment") as Repeater;
                rptGallery.DataSource = getPartDetails(Id,teratmentID);
                rptGallery.DataBind();
            }
        }

        public DataTable getPartDetails(string id,string teratmentID)
        {
            DataTable table = null;
            var GaragID = Session["UserID"].ToString();
            CartModel model = new CartModel();
            if(!string.IsNullOrEmpty(id))
            {
                 table = model.GetCartData(GaragID,id, teratmentID);
                
            }
            
            return table;


        }
        //close repaiJob
        [WebMethod]
        public static bool closeRepiarJob(string teratmentID,string amountTime)
        {
            sql_class sql = new sql_class();
            var Dblist = new List<DbListAdapter>();
            Dblist.Add(new DbListAdapter("TotalWorkingHours", amountTime));
            sql.Where("teratmentID", teratmentID);
            sql.Update("RepairJob", Dblist);
            RepairJobl jobl = new RepairJobl();
            bool closeOrnot = jobl.closeRepiarJob(teratmentID);
            if (closeOrnot)
            {
                CartModel cart = new CartModel();
                cart.cartItemChengaStatus(teratmentID);
                return true;
            }
            else { return false; }
        }

        //delete repairjob AND All teratment part from cart
        [WebMethod]
        public static bool deltetJob(string teratmentID)
        {
            RepairJobl job = new RepairJobl();
          bool deleteOrnot = job.deleteJob(teratmentID);
            if (deleteOrnot)
            {
                CartModel cart = new CartModel();
              cart.deleteAllCart(teratmentID);
                return true;
            }
            else { return false; }
              
           
        }


        //set amount of time work on the car
    

    }
}