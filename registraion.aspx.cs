using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Windows;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.IO;
using System.Web.Security;
using System.Web.Services;
using System.Net.Mime;
using GargeManger.App_Code;
using System.Text;

namespace GargeManger
{
    public partial class registraion : System.Web.UI.Page
    {
        static string activatoncode;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                RailodCity();


            }
        }
        protected void RailodCity()
        {
            DataTable data = CityModel.All_City();
            if (data.Rows.Count > 0)
            {

                ddl_city.DataTextField = "CityName";
                ddl_city.DataValueField = "CityID";
                ddl_city.DataSource = data;
                ddl_city.DataBind();
                ListItem li = new ListItem("בחר עיר", "-1");
                ddl_city.Items.Insert(0, li);
            }
            else
            {
                ListItem li = new ListItem("שגיאה! אנא רענן את הדף", "-1");
                ddl_city.Items.Insert(0, li);
            }

        }

        public void sendemail()
        {
            if (EmailBLL.IsValidEmailAddress(tb_email.Text))
            {
                StringBuilder Emailbody = new StringBuilder();
                Emailbody.Append("http://localhost:55078/emailverification.aspx?tb_email=" + tb_email.Text);
                string path = @"C:\Users\isaya\OneDrive\שולחן העבודה\c#\GargeManger\EmailTamplate\EmeilVerifyAccount.html";
                StreamReader sr = new StreamReader(path);
                string FullMessage = sr.ReadToEnd();
                FullMessage = FullMessage.Replace("{UserName}", tb_Fname.Text);
                FullMessage = FullMessage.Replace("{NameGarage}",tb_namebisance.Text);
                FullMessage = FullMessage.Replace("{activatoncode}", activatoncode);
                FullMessage = FullMessage.Replace("{Url}", Emailbody.ToString());
                sr.Close();
                EmailBLL.SendMailMessage(tb_email.Text, "fixmedonotreply@gmail.com", null, null, "Verification", FullMessage, null);
            }


        }

        [Obsolete]
        protected void bt_submit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                bool Exsict = CheackUserName();
                if (Exsict == false)
                {
                   
                        Random random = new Random();
                        activatoncode = random.Next(1001, 9999).ToString();
                        try
                        {
                            string Encryptedpass = FormsAuthentication.HashPasswordForStoringInConfigFile(tb_password.Text, "SHA1");
                            var dateAndTime = DateTime.Now;
                            var date = dateAndTime.Date;
                            date.ToString("dd/MM/yyyy");
                            var Dblist = new List<DbListAdapter>();
                            Dblist.Add(new DbListAdapter("CityID", ddl_city.SelectedValue));
                            Dblist.Add(new DbListAdapter("NameGarga", tb_namebisance.Text));
                            Dblist.Add(new DbListAdapter("pricePerHour", pricePerHour.Text));
                            //Dblist.Add(new DbListAdapter("UserName", tb_user.Text));
                            Dblist.Add(new DbListAdapter("Password", Encryptedpass));
                            Dblist.Add(new DbListAdapter("Address", tb_Address.Text));
                            Dblist.Add(new DbListAdapter("FIRST_NAME", tb_Fname.Text));
                            Dblist.Add(new DbListAdapter("LAST_NAME", tb_Lname.Text));
                            Dblist.Add(new DbListAdapter("Phone", tb_phone.Text));
                            Dblist.Add(new DbListAdapter("Email", tb_email.Text));
                            Dblist.Add(new DbListAdapter("Activecode", activatoncode));
                            //Dblist.Add(new DbListAdapter("JoinDate", date.ToString()));
                            bool garageid = Garge.create_new_garage(Dblist);
                            if (garageid)
                            {
                                sendemail();
                                //Session["user"] = tb_Fname.Text;
                                //Session["user"] = tb_user.Text;
                                Session["email"] = tb_email.Text;
                                Response.Redirect("~/emailverification.aspx?tb_email=" + tb_email.Text);
                            }

                        }
                        catch (Exception ex)
                        {
                            Lblsend.Text = ex.Message;
                        }
                        finally
                        {

                        }

                }
                else
                {
                    Lblsend.Text = "נראה שחשבון מייל זה כבר נמצא בשימוש!";
                   pricePerHour.Focus();
                }

            }

            else
            {
                Label1.Text = "חובה למלאות שדות חובה* !";
            }
        }

        //cheack if email  Exsicte
        public bool CheackUserName()
        {
            sql_class sql_data = new sql_class();
            sql_data.Where("Email", tb_email.Text);
            DataTable data = sql_data.Get("Garage");
            if (data.Rows.Count > 0)
            {
                Label1.Text = "נראה שחשבון מייל זה כבר נמצא בשימוש";
                Label1.ForeColor = System.Drawing.Color.Red;
               tb_email.Text = "";
                return true;

            }
            else
            {
                Label1.Text = "";
                return false;
            }



        }
    }
}