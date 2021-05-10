using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GargeManger
{
    public partial class ProfileSettingAdmin : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Session["UserID"] != null)
            {
                Garge garge = new Garge(Convert.ToInt32(Session["UserID"]));
                profileImage.ImageUrl = garge.GetimageUrl();
                FnameID.Attributes["placeholder"] = garge.GetFirstName();
                LnameID.Attributes["placeholder"] = garge.GetLastName();
                
            }

        }
        
        protected void SendProfile_Click(object sender, EventArgs e)
        {
            
            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            string fileExstenshion = Path.GetExtension(filename);
            if (fileExstenshion.ToLower() == ".jpg" || fileExstenshion.ToLower() == ".gif" || fileExstenshion.ToLower() == ".png" ||
                      fileExstenshion.ToLower() == ".bmp" && FileUpload1.PostedFile != null)
            {
                Lblsend.Text = string.Empty;
                string path = @"\Userimage\" + FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath("~/Userimage/") + Path.GetFileName(FileUpload1.FileName));
                sql_class sql = new sql_class();
                sql.Where("GaragID", Session["UserID"].ToString());
                var DbList = new List<DbListAdapter>();
                DbList.Add(new DbListAdapter("imageURL", path));
                if(sql.Update("Garage", DbList)) {
                    Lblsend.Text = "התמונה הועלתה בהצלחה!";
                    Lblsend.ForeColor = System.Drawing.Color.Green;
                }
                

            }
            else
            {
                
                Lblsend.Text = "ניתן לעלות תמונות אם סיומת(.jpg,.gif,.png,.bmp) בלבד!";
                Lblsend.ForeColor = System.Drawing.Color.Red;
            }
            
        }
        
      
        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            try
            {
                sql_class sql = new sql_class();
                var Dblist = new List<DbListAdapter>();
                Dblist.Add(new DbListAdapter("FIRST_NAME", FnameID.Text));
                Dblist.Add(new DbListAdapter("LAST_NAME", LnameID.Text));
                
            

                sql.Where("GaragID", Session["UserID"].ToString());
               bool Updat_result = sql.Update("Garage", Dblist);
                if(Updat_result)
                System.Windows.Forms.MessageBox.Show("הנתונים נשמרו בהצלחה! ");
                else { System.Windows.Forms.MessageBox.Show("שגיאה "); }
               
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "Error!", "alert('" + ex.Message.Replace("'", @"\'") + "');", true);
                Lblsend.Text = ex.Message;
            }
            
        }
       
    }
}
