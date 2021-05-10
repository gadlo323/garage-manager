using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GargeManger
{
    public partial class UpdaetUserPassword : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Session["UserID"] !=null)
            {
                Garge garge = new Garge(Convert.ToInt32(Session["UserID"]));
                Image1.ImageUrl = garge.GetimageUrl();
            }


        }

        [Obsolete]
        protected void UpdatePassword()
        {
            try
            {
                string Encryptedpass = FormsAuthentication.HashPasswordForStoringInConfigFile(ReptPasID.Text, "SHA1");
                sql_class sql_ = new sql_class();
                sql_.Where("GaragID", Session["UserID"].ToString());
                var Dblist = new List<DbListAdapter>();
                Dblist.Add(new DbListAdapter("Password", Encryptedpass));
                bool data = sql_.Update("Garage", Dblist);

                if (data)
                {
                    lblmessage.ForeColor = System.Drawing.Color.Green;
                    lblmessage.Text = "סיסמא הוחלפה בהצלחה!";
                   

                }
                else
                {
                    lblmessage.ForeColor = System.Drawing.Color.Red;
                    lblmessage.Text = "אירעה שגיאה אנא נסה שוב    !";
                    
                }

            }
            catch
            {

                throw;
            }

        }

        [Obsolete]
        protected void sumbit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string Encryptedpass = FormsAuthentication.HashPasswordForStoringInConfigFile(OldPasID.Text, "SHA1");
                    //var ID = Convert.ToInt32();
                    sql_class sql_ = new sql_class();
                    sql_.Where("Password", Encryptedpass);
                    sql_.Where("GaragID", Session["UserID"].ToString());
                    DataTable data = sql_.Get("Garage","Password");
                    

                    if (data.Rows.Count>0)
                    {
                        UpdatePassword();

                    }
                    else
                    {
                        lblmessage.ForeColor = System.Drawing.Color.Red;
                        lblmessage.Text = "סיסמא שגויה";
                       
                    }

                }
            catch(Exception Error)
                {
                    lblmessage.Text  = Error.ToString();
                  
                }

            }
            else
            {
                lblmessage.ForeColor = System.Drawing.Color.Red;
                lblmessage.Text = "חובה למלא שדות חובה!";
            }
        }
    }
}