using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using GargeManger.App_Code;
using System.Web.Services;


namespace GargeManger
{
    public partial class Admin2HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack && Session["UserId"] != null )
            {
                //All_notes();
            }
        }

        [WebMethod]
        public static  string Event()
        {
            int id = Convert.ToInt32(HttpContext.Current.Session["UserID"]);
            Garge garge = new Garge(id);
           return  garge.Calnder_data();
        }
         
        

        protected void NewEvent_Click(object sender, EventArgs e)
        {
           
            if(Page.IsValid)
            {
                try
                {
                    var endday="";
                    var startday = Convert.ToDateTime(StartTimeBtn.Text);
                    if(!String.IsNullOrEmpty(EndTimeBtn.Text))
                    {
                         endday = Convert.ToDateTime(EndTimeBtn.Text).ToString("yyyy/MM/dd HH:mm:ss");
                    }


                    var DbList = new List<DbListAdapter>();
                    DbList.Add(new DbListAdapter("GaragID", Session["UserID"].ToString()));
                    DbList.Add(new DbListAdapter("Title", EventTitleTxt.Text));
                    DbList.Add(new DbListAdapter("Description", Description1.Value));
                    DbList.Add(new DbListAdapter("StartDate", startday.ToString("yyyy/MM/dd HH:mm:ss") +".000"));
                    DbList.Add(new DbListAdapter("ThemsColor", null));
                    DbList.Add(new DbListAdapter("ShwoEvent", true.ToString()));
                    if (AllDayTwo.Checked)
                    {
                        DbList.Add(new DbListAdapter("IsFullDay", true.ToString()));
                        //RequiredEndTimeBtn.Enabled = false;
                        RequiredEndTimeBtn.EnableClientScript = false;
                        //DbList.Add(new DbListAdapter("EndDate",null));
                    }
                    else {
                        DbList.Add(new DbListAdapter("IsFullDay", false.ToString()));
                        DbList.Add(new DbListAdapter("EndDate",endday + ".000"));
                    }
                    bool Eventbool = EventsModel.CreateNewEvent(DbList);
                    if (Eventbool)
                    {
                     
                        Response.Redirect(Request.RawUrl, true);
                        NewEvntModel();

                    }
                       
                    else { System.Windows.Forms.MessageBox.Show("שגיאה "); }
                }

                catch
                {
                    throw;
                }
                finally
                {
                    EventTitleTxt.Text = "";
                    Description1.Value = "";
                    StartTimeBtn.Text = "";
                    EndTimeBtn.Text = "";
                }
            }

           
        }


        private bool CheckDate(string data)
        {
            if (data != "" && Convert.ToDateTime(data) < DateTime.Today)
            {
                EroorM.Text = "!תאריך התחלה/סיום לא יכול להיות תאריך שעבר";
                return false;
            }
            return true;
        }

        public void NewEvntModel()
        {
            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "NewEvnt();", true);
        }


        [WebMethod]
        public static bool DeleteEvent(string idevent)
        {
            int id = Convert.ToInt32(HttpContext.Current.Session["UserID"]);
            Garge garge = new Garge(id);

            return garge.UpdateShowEvent(idevent);
        }

        //[WebMethod]
        //public static void send_Stickry(string Massage)
        //{
        //    Sticky_Note sticky = new Sticky_Note();
        //    sticky.New_Stikey(Massage, HttpContext.Current.Session["UserID"].ToString());
        //}

        //protected void All_notes()
        //{
        //    Garge garge = new Garge(Convert.ToInt32(Session["UserID"]));
        //    List<Sticky_Note> list = garge.GetSticky_Notes();
        //    StickyNote.DataSource = list;
        //    StickyNote.DataBind();
        //}

    }
}