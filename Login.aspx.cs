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

namespace GargeManger
{
    public partial class Login : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        //login into the system by Admin  (!customer)


        [Obsolete]
        protected void BtnLogin_Click(object sender, EventArgs e)
        {
             
            if (Page.IsValid)
            {
                string Encryptedpass = FormsAuthentication.HashPasswordForStoringInConfigFile(tb_password.Text, "SHA1");
                DataTable data = Garge.get_data(tb_user.Text, Encryptedpass, "true");
                if(data.Rows.Count > 0)
                {
                    Session["UserID"] = data.Rows[0]["GaragID"].ToString();
                    Response.Redirect("~/Admin2HomePage.aspx");
                }
                    
                else
                {

                        Lblreg.Text = "שם משתמש או סיסמא אינם נכונים!";
                        Lblreg.ForeColor = System.Drawing.Color.Red;
                      
                }
               
                
                
              

            }
            else
            {
                Lblreg.Text = "חובה למלא שדות חובה!";
                Lblreg.ForeColor = System.Drawing.Color.Red;
            }

          
        
        }
      

    }
}