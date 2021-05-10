using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using GargeManger.App_Code;
using System.Drawing.Drawing2D;

namespace GargeManger
{
    public partial class AddCustomer : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
         
            if(!IsPostBack)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "myfunc2();", true);
            }

           
          
            
        }

        protected void SendEmailByAdmin()
        {
            Garge garge = new Garge(Convert.ToInt32(Session["UserID"]));
            string Name = garge.GetNameGarga();
            String Address = garge.GetAddress();
            String City = garge.get_city();
            String phone = garge.GetPhone();
            if (EmailBLL.IsValidEmailAddress(tbEmail.Text))
            {
                string path = @"C:\Users\isaya\OneDrive\שולחן העבודה\c#\GargeManger\EmailTamplate\NewCustomerAdd.html";
                StreamReader sr = new StreamReader(path);
                string FullMessage = sr.ReadToEnd();
                FullMessage = FullMessage.Replace("{UserName}",Fname.Text);
                FullMessage = FullMessage.Replace("{LastName}",Lname.Text);
                FullMessage = FullMessage.Replace("{NameGarga}", Name);
                FullMessage = FullMessage.Replace("{UserIdCard}", tbUser.Text);
                FullMessage = FullMessage.Replace(" {Address}", Address);
                FullMessage = FullMessage.Replace("{City}", City);
                FullMessage = FullMessage.Replace("{phone}", phone);
                sr.Close();
                EmailBLL.SendMailMessage(tbEmail.Text, "fixmedonotreply@gmail.com", null, null, "לקוח יקר", FullMessage, null);
            }

        }

        // return customerid 
        protected string GetCustomerid()
        {
            try
            {
                sql_class Check = new sql_class();
                Check.Where("UsarName", tbUser.Text);
                DataTable data = Check.Get("Customer", "CustomerID");
                if (data.Rows.Count>0)
                {
                    return data.Rows[0]["CustomerID"].ToString();
                }
                else
                {

                    Response.Redirect("~/error-500.html");
                    return null;
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "Error!", "alert('" + ex.Message.Replace("'", @"\'") + "');", true);
                return null;
            }
        }

        //cheack if UserName  Exsicte
        protected bool CheackUserName()
        {
            try
            {
                sql_class data = new sql_class();
                data.Where("UsarName", tbUser.Text);
                data.Where("GaragID", Session["UserID"].ToString());
                DataTable HesRow = data.Get("Customer");
                if (HesRow.Rows.Count > 0)
                {

                    lblusercheck.Text = "שם משתמש תפוס";
                    lblusercheck.ForeColor = System.Drawing.Color.Red;
                    tbUser.Text = "";
                    return true;

                }
                else
                {
                    lblusercheck.Text = "";
                    return false;
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "Error!", "alert('" + ex.Message.Replace("'", @"\'") + "');", true);
                return false;
            }
               

            

        }

        [Obsolete]
        protected void Button1_Click(object sender, EventArgs e)
        {
            
            if (!CheackUserName()&& Page.IsValid)
            {
                try
                {


                    var startday = Convert.ToDateTime(BirthDate.Text).ToString("yyyy-MM-dd");
                    string Encryptedpass = FormsAuthentication.HashPasswordForStoringInConfigFile(PasswordID.Text, "SHA1");
                    var Dblist = new List<DbListAdapter>();
                    Dblist.Add(new DbListAdapter("GaragID", Session["UserID"].ToString()));
                    Dblist.Add(new DbListAdapter("FirstName", Fname.Text));
                    Dblist.Add(new DbListAdapter("LastName", Lname.Text));
                    Dblist.Add(new DbListAdapter("Email", tbEmail.Text));
                    Dblist.Add(new DbListAdapter("Phone", tbphone.Text));
                    Dblist.Add(new DbListAdapter("UsarName", tbUser.Text));
                    Dblist.Add(new DbListAdapter("Password", Encryptedpass));
                    Dblist.Add(new DbListAdapter("BirthDate", startday));
                    //Dblist.Add(new DbListAdapter("JoinDate", date.ToString()));
                    bool Pinfo_insert= CustomerModel.create_new_Customer(Dblist);
                    ////////////////////////////////////////////////////////////
                    var DblistCar = new List<DbListAdapter>();
                    string id = GetCustomerid();
                    DblistCar.Add(new DbListAdapter("License_Number", License_NumberID.Text));
                    DblistCar.Add(new DbListAdapter("CustomerID", id));
                    DblistCar.Add(new DbListAdapter("ModelID", Request.Form[degemID.UniqueID]));
                    DblistCar.Add(new DbListAdapter("ManufacthreID", Request.Form[tozeretID.UniqueID]));
                    DblistCar.Add(new DbListAdapter("misgeret", misgeretID.Text));
                    DblistCar.Add(new DbListAdapter("ModelYear", YearID.Text));
                    DblistCar.Add(new DbListAdapter("tokef_test", TtestID.Text));
                    DblistCar.Add(new DbListAdapter("Gimor", GimorID.Text));
                    DblistCar.Add(new DbListAdapter("Balot", BalotID.Text));
                    DblistCar.Add(new DbListAdapter("imageUrl", SendProfile_Click()));
                    bool Car_info_insert = VehicleModel.create_new_Vehicle(DblistCar);
                    if (Pinfo_insert && Car_info_insert)
                    SendEmailByAdmin();
                    Response.Redirect("~/AddCustomer.aspx");
                    showmodel();
                    }

                

                catch(Exception ex)
                {
                   // ClientScript.RegisterStartupScript(GetType(), "Error!", "alert('" + ex.Message.Replace("'", @"\'") + "');", true);
                    pageVild.Text =ex.ToString();
                    //pageVild.ForeColor = System.Drawing.Color.Red;
                    //Response.Redirect("~/error-500.htmlreturn null;
                }
                
               
            }
            else
            {
                pageVild.Text = "חובה למלאות שדות חובה *";
                pageVild.ForeColor = System.Drawing.Color.Red;
            }

        }

        protected string SendProfile_Click()
        {

            string filename = Path.GetFileName(upload_file.PostedFile.FileName);
            string fileExstenshion = Path.GetExtension(filename);
            if (fileExstenshion.ToLower() == ".jpg" || fileExstenshion.ToLower() == ".gif" || fileExstenshion.ToLower() == ".png" ||
                      fileExstenshion.ToLower() == ".bmp" && upload_file.PostedFile != null)
            {
                pageVild.Text = string.Empty;
                string path = @"\CarImages\" + upload_file.FileName;
                upload_file.SaveAs(Server.MapPath("~/CarImages/") + Path.GetFileName(upload_file.FileName));
                return path;

            }
            else
            {

                pageVild.Text = "ניתן לעלות תמונות אם סיומת(.jpg,.gif,.png,.bmp) בלבד!";
                pageVild.ForeColor = System.Drawing.Color.Red;
                return null;
            }

        }

        public void showmodel()
        {

            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "infoNewClient();", true);
        }

    }
}