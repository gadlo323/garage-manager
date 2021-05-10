using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;
using System.Net.Mail;
using GargeManger.App_Code;
using System.Text;

namespace GargeManger
{

    public partial class emailverification : System.Web.UI.Page
    {

        static string activatoncode;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack && Request.QueryString["tb_email"] != null)
            {
                AccountVefiad();
                userMessage.Text = " ";
                EmailUser.Text = Request.QueryString["tb_email"];
            }
            

        }
         //chack if the code is right
        protected void log_Click(object sender, EventArgs e)
        {
            sql_class sql_new= new sql_class();
            sql_new.Where("Email", Request.QueryString["tb_email"].ToString());
            //sql_new.Where("UserName", Request.QueryString["UserName"].ToString());
            DataTable data = sql_new.Get("Garage");
            if (data.Rows.Count > 0)
            {
                string activshncode = "";
                activshncode = data.Rows[0]["Activecode"].ToString();
                if (activshncode == tb_code.Value)
                {
                    changestatus();
                    Response.Redirect("~/Login.aspx");
                    
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('קוד לא נכון')", true);

                }

            }
            //con.Close();

        }

        //cange status user account 
        private void changestatus()
        {
            sql_class sql = new sql_class();
            sql.Where("Email", Request.QueryString["tb_email"]);
            //sql.Where("UserName", Request.QueryString["UserName"]);
            var Dblist = new List<DbListAdapter>();
            Dblist.Add(new DbListAdapter("Status",true.ToString()));
            sql.Update("Garage", Dblist);
        }

        // send user mail with new code
        public void sendemail()

        {
            if (EmailBLL.IsValidEmailAddress(Request.QueryString["tb_email"]))
            {
                StringBuilder Emailbody = new StringBuilder();
                Emailbody.Append("http://localhost:55078/emailverification.aspx?tb_email=" + Request.QueryString["tb_email"]);
                string path = @"C:\Users\isaya\OneDrive\שולחן העבודה\c#\GargeManger\EmailTamplate\EmailVerifcationAgain.html";
                StreamReader sr = new StreamReader(path);
                string FullMessage = sr.ReadToEnd();
                FullMessage = FullMessage.Replace("{activatoncode}", activatoncode);
                FullMessage = FullMessage.Replace("{Url}", Emailbody.ToString());
                sr.Close();
                EmailBLL.SendMailMessage(Request.QueryString["tb_email"], "fixmedonotreply@gmail.com", null, null, "VerificationAgain", FullMessage, null);
            }
        }
        // send onr more time code to user
        protected void send_Click(object sender, EventArgs e)
        {
            Random random = new Random();
            activatoncode = random.Next(1001, 9999).ToString();
            try
            {
                sql_class sql = new sql_class();
                sql.Where("Email", Request.QueryString["tb_email"]);
                //sql.Where("UserName", Request.QueryString["UserName"]);
                var Dblist = new List<DbListAdapter>();
                Dblist.Add(new DbListAdapter("Activecode", activatoncode));
              bool Up =   sql.Update("Garage", Dblist);
                if (Up)
                {
                    sendemail();
                    userMessage.Text = "נשלח קוד חדש!";
                }
                else
                {
                    userMessage.Text = "אירעה שגיאה בעת שליחת הקוד";
                }
                
            }
            catch (Exception  )
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(ex)", true);
            }



        }

        //Checks if the account has been approved
        protected void AccountVefiad()
        {
            sql_class sql = new sql_class();
            sql.Where("Email", Request.QueryString["tb_email"]);
            //sql.Where("UserName", Request.QueryString["UserName"]);
            DataTable data =  sql.Get("Garage", "Status");
            if(data.Rows[0]["Status"].ToString().ToUpper() == "True".ToUpper())
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('חשבון זה כבר מאושר!')", true);
                Response.Redirect("~/Login.aspx");
            }
               
        }


    }
}
