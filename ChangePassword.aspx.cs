using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

namespace GargeManger
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

       

        [Obsolete]
        protected void UpdatePassword()
        {
            try
            {
                string Encryptedpass = FormsAuthentication.HashPasswordForStoringInConfigFile(PasswordID.Text, "SHA1");
                sql_class sql = new sql_class();
                sql.Where("GaragID", Request.QueryString["userID"]);
                var Dblist = new List<DbListAdapter>();
                Dblist.Add(new DbListAdapter("Password", Encryptedpass));
                bool data = sql.Update("Garage",Dblist);
                if (data)
                {
                    lblmessage.ForeColor = System.Drawing.Color.Green;
                    lblmessage.Text = "סיסמא הוחלפה בהצלחה!";
                    DeleteLastCode();
                    Response.Redirect("~/Login.aspx");

                }
                else
                {
                    lblmessage.ForeColor = System.Drawing.Color.Red;
                    lblmessage.Text = "אירעה שגיאה  !";
                    
                }

            }
            catch
            {
                
                throw;
            }
            
        }

        [Obsolete]
        protected void SubmitID_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                try
                {
                    sql_class sql = new sql_class();
                    sql.Where("codeNumber", Request.QueryString["id"]);
                    sql.Where("GaragID", Request.QueryString["userID"]);
                    sql.Where("active",true.ToString());
                    DataTable data =   sql.Get("RestUserAdmin");
                    if(data.Rows.Count>0)
                    {
                        UpdatePassword();

                    }
                    else
                    {
                        lblmessage.ForeColor = System.Drawing.Color.Red;
                        lblmessage.Text = "קישור זה כבר פג תוקף!";
                    }
                    
                }
                catch
                {
                    throw;
                }
            }
            else
            {
                lblmessage.ForeColor = System.Drawing.Color.Red;
                lblmessage.Text = "חובה למלא שדות חובה!";
            }
        }

        protected void DeleteLastCode()
        {
            try
            {
                sql_class sql = new sql_class();
                sql.Where("codeNumber", Request.QueryString["id"]);
                sql.Where(" GaragID", Request.QueryString["userID"]);
                var Dblist = new List<DbListAdapter>();
                Dblist.Add(new DbListAdapter("active", false.ToString()));
                bool data = sql.Update("RestUserAdmin", Dblist);
            }
            catch
            {
                throw;
            }
        }
    }
}