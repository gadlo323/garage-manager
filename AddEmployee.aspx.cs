using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GargeManger.App_Code;

namespace GargeManger
{
    public partial class AddEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!CheackUserName() && Page.IsValid)
            {
                try
                {
                    var Birth = Convert.ToDateTime(BirthDate.Text).ToString("yyyy-MM-dd");
                    var Dblist = new List<DbListAdapter>();
                    Dblist.Add(new DbListAdapter("GaragID", Session["UserID"].ToString()));
                    Dblist.Add(new DbListAdapter("FirstName", Fname.Text));
                    Dblist.Add(new DbListAdapter("LastName", Lname.Text));
                    Dblist.Add(new DbListAdapter("Email", tbEmail.Text));
                    Dblist.Add(new DbListAdapter("PhonNumber", tbphone.Text));
                    Dblist.Add(new DbListAdapter("IdCard", tbUser.Text));
                    Dblist.Add(new DbListAdapter("BirthDate", Birth));
                    Dblist.Add(new DbListAdapter("imageUrl", SendProfile_Click()));
                    bool employee = EmployeModel.create_new_Employee(Dblist);
                    if (employee)
                    {
                     
                        Response.Redirect("~/AddEmployee.aspx");
                       
                    }
                       
                }
                catch (Exception ex)
                {
                    // ClientScript.RegisterStartupScript(GetType(), "Error!", "alert('" + ex.Message.Replace("'", @"\'") + "');", true);
                    pageVild.Text = ex.ToString();
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
                string path = @"\EmployeesImages\" + upload_file.FileName;
                upload_file.SaveAs(Server.MapPath("~/EmployeesImages/") + Path.GetFileName(upload_file.FileName));
                return path;

            }
            else
            {

                pageVild.Text = "ניתן לעלות תמונות אם סיומת(.jpg,.gif,.png,.bmp) בלבד!";
                pageVild.ForeColor = System.Drawing.Color.Red;
                return null;
            }

        }

        //cheack if UserName  Exsicte
        protected bool CheackUserName()
        {
            try
            {
                sql_class data = new sql_class();
                data.Where("IdCard", tbUser.Text);
                data.Where("GaragID", Session["UserID"].ToString());
                DataTable HesRow = data.Get("EmployeModel");
                if (HesRow.Rows.Count > 0)
                {

                    lblusercheck.Text = "תעודת זהות זו כבר בשימוש";
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
    }
}