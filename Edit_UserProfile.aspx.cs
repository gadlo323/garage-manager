using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using GargeManger.App_Code;
using System.Security.Cryptography;
using System.Text;
using System.Web.Services;

namespace GargeManger
{
    public partial class Edit_UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {

                    setCustomerInfo(Request.QueryString["id"]);
                    historyRepairJob(Request.QueryString["id"]);
                }
            }
             
             
        }
        
        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            try
            {
                sql_class sql = new sql_class();
                var Dblist = new List<DbListAdapter>();
                Dblist.Add(new DbListAdapter("FirstName", first_name.Text));
                Dblist.Add(new DbListAdapter("LastName", last_name.Text));
                Dblist.Add(new DbListAdapter("Email", email.Text));
                Dblist.Add(new DbListAdapter("Phone", mobile.Text));
                //Dblist.Add(new DbListAdapter("BirthDate", BirthDate.Value));

                sql.Where("CustomerID", Request.QueryString["id"].Replace("'", " "));
                bool Updat_result = sql.Update("Customer", Dblist);
                if (Updat_result)
                    System.Windows.Forms.MessageBox.Show("הנתונים נשמרו בהצלחה! ");
                else { System.Windows.Forms.MessageBox.Show("שגיאה "); }

            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "Error!", "alert('" + ex.Message.Replace("'", @"\'") + "');", true);
                lblmessage.Text = ex.Message;
            }
            finally
            {
               
            }
        }

        //set customer info
        public void setCustomerInfo(string CustomerID)
        {
            sql_class sql = new sql_class();
            DataTable date = sql.Where("CustomerID", CustomerID.Replace("'", " ")).Get("Customer");
            first_name.Text = date.Rows[0]["FirstName"].ToString();
            last_name.Text = date.Rows[0]["LastName"].ToString();
            mobile.Text = date.Rows[0]["Phone"].ToString();
            email.Text = date.Rows[0]["Email"].ToString();
            DateTime added = Convert.ToDateTime(date.Rows[0]["JOINING_DATE"]);
            joinData.Text = added.ToString("dd/MM/yyyy");
            DateTime birth = Convert.ToDateTime(date.Rows[0]["BirthDate"]);
            birthData.Text = birth.ToString("dd/MM/yyyy");
            FullName.Text = first_name.Text + " " + last_name.Text;
        }

        //get history off all repairjob
        public void historyRepairJob(string CustomerID)
        {
            sql_class sql = new sql_class();
            sql.Where("CustomerID", CustomerID);
           DataTable data = sql.Get("RepairJob");
            shwoHistory.DataSource = data;
            shwoHistory.DataBind();
        }
        public DataTable getPart(string teratmentID)
        {
            sql_class sql = new sql_class();
            sql.Where("teratmentID", teratmentID);
            DataTable data = sql.Get("CartModel");
            return data;
        }

       
        
        //get teratment pert
       
        public DataTable GetPart(string teratmentID)
        {
            sql_class sql = new sql_class();
            sql.Where("teratmentID", teratmentID);
            DataTable data =  sql.Get("CartModel");
            return data;
        }
        
    }
}