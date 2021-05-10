using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Security;
using System.IO;
using System.Net.Mail;
using System.Text;
using GargeManger.App_Code;

namespace GargeManger
{
    public partial class RestPasswordAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //send mail with link for rest password
        protected void SendMeilRestPassword(string sendto, string username, string id, string UserID)
        {
            if (EmailBLL.IsValidEmailAddress(sendto))
            {
                StringBuilder Emailbody = new StringBuilder();
                Emailbody.Append("http://localhost:55078/ChangePassword.aspx?id=" + id + "&userID=" + UserID);
                string path = @"C:\Users\isaya\OneDrive\שולחן העבודה\c#\GargeManger\EmailTamplate\RestPasswordAdmin.html";
                StreamReader sr = new StreamReader(path);
                string FullMessage = sr.ReadToEnd();
                FullMessage = FullMessage.Replace("{Url}", Emailbody.ToString());
                sr.Close();
                EmailBLL.SendMailMessage(sendto, "fixmedonotreply@gmail.com", null, null, "איפוס סיסמא", FullMessage, null);

            }


        }

        //send randum code
        protected string RandomPassword(string ID)
        {
            string code;
            Random random = new Random();
            code = random.Next(10000000, 100000000).ToString();
            InsertCode(code,ID);
            return code;
        }


        protected void InsertCode(string codein,string ID)
        {
            try
            {
                //string gargeID = FindUserID();
                var Dblist = new List<DbListAdapter>();
                Dblist.Add(new DbListAdapter("codeNumber", codein));
                Dblist.Add(new DbListAdapter("GaragID", ID));
                 RestClass.InsertRestData(Dblist);

            }
            catch
            {
                throw;
            }



        }
       
        //chack if the user exicte
        protected void RestPassword_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
 
                sql_class sql = new sql_class();
                //sql.Where("UserName", userPassinput.Text);
                sql.Where("Email", useremailinput.Text);
                DataTable data=  sql.Get("Garage", "Email", "FIRST_NAME", "GaragID");
                if (data.Rows.Count>0)
                {
                    string UserID = data.Rows[0]["GaragID"].ToString();
                    string ID = RandomPassword(UserID);
                    string addressee = data.Rows[0]["Email"].ToString();
                    string user = data.Rows[0]["FIRST_NAME"].ToString();
                    SendMeilRestPassword(addressee, user, ID, UserID);
                    lbmessage.Text = "נשלח קישור לכתובת המייל לצורך איפוס!";
                }
                else
                {
                    
                    lbmessage.ForeColor = System.Drawing.Color.Red;
                    lbmessage.Text = "לא קיים חשבון כזה במערכת,אנא פנה לצוות הלקוחות!";
                }

                 

            }
            else
            {
                lbmessage.ForeColor = System.Drawing.Color.Red;
                lbmessage.Text = "חובה למלא שדות חובה!";

            }

        }


       

    }
}