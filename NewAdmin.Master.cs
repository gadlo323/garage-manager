using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Script.Serialization;
using GargeManger.App_Code;

namespace GargeManger
{
    public partial class NewAdmin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (Session["UserID"] != null)
                {

                    //string Name_Hebrwo = "";
                    Garge garge = new Garge(Convert.ToInt32(Session["UserID"]));
                    string city = garge.get_city();
                    Set_Wolcome_Time();
                    user_name.Text += garge.Get_Full_Name();
                    user_name2.Text = garge.Get_Full_Name();
                    user_name3.Text = garge.GetNameGarga();
                    UserName4.Text = garge.GetFirstName();
                    City_Name.Text = city;
                    City_Name_Hebrwo.Text = city;
                    Useremail.Text = garge.GetEmail();
                    Image1.ImageUrl = garge.GetimageUrl();
                    Image2.ImageUrl = garge.GetimageUrl();
                    Image3.ImageUrl = garge.GetimageUrl();
                    RendarCard();
                }

                else
                {
                    Response.Redirect("~/error-404.html");
                }
            }
           catch(Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", ex.ToString(), true);
            }
            
        }

        // func that Logout
        protected void logOut_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }

        // func thet set WolcomeTime
        private void Set_Wolcome_Time()
        {
            if (DateTime.Now.Hour > 5 && DateTime.Now.Hour < 12)
            {
                user_name.Text =  " בוקר טוב ";

            }
            else if (DateTime.Now.Hour >= 12 && DateTime.Now.Hour <= 16)
            {
                 user_name.Text = " צהריים טובים ";

            }
            else if (DateTime.Now.Hour >= 16 && DateTime.Now.Hour <= 22)
            {
                user_name.Text =  " ערב טוב ";

            }
            else if ((DateTime.Now.Hour > 22 || DateTime.Now.Hour <= 5))
            {
                 user_name.Text =  " לילה טוב ";
            }
            
        }
        //shwo all open work card
        protected void RendarCard()
        {
            Garge garge = new Garge(Convert.ToInt32(Session["UserID"]));
            List <RepairJobl> listTop = garge.GetTeratmentsTop3();
            List<RepairJobl> list = garge.GetTeratments();
            Count.InnerText = list.Count.ToString();
            Count2.InnerText = listTop.Count.ToString();
            Open_WordCaed.DataSource = listTop;
            Open_WordCaed.DataBind();
        }

        protected void ReminderTreatment()
        {
            Garge garge = new Garge(Convert.ToInt32(Session["UserID"]));
            List<CustomerModel> list = garge.getAllCustomers();
            //ShwoCustomer.DataSource = list;
            //ShwoCustomer.DataBind();                            
        }


    }
}