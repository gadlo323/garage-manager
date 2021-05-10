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


namespace GargeManger
{
    public partial class WorkCard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null && !IsPostBack)

            {
               
                Garge garge = new Garge(Convert.ToInt32(Session["UserID"]));
                
                UserName_ID.Value = garge.Get_Full_Name();
              
            }

        }

        //get car info rasive parm from ajax
        [WebMethod]
        public static List<string> ClintInfo(string id)
        {
            if (id.Length == 9 & CustomerEx(id))
            {
                List<string> AllData = new List<string>();
                var gargeid = HttpContext.Current.Session["UserID"].ToString();
                DataTable sql = new sql_class().Where("GaragID", gargeid).Where("UsarName", id).Get("Customer");
                var CustmID = sql.Rows[0]["CustomerID"].ToString();
                DataTable data = new sql_class().Where("CustomerID", CustmID).Get("Vehicle");

                //get the car datels after geting the data from vehicle table
                var Modelcar = data.Rows[0]["ModelID"].ToString();
                var ModelYear = data.Rows[0]["ModelYear"].ToString();
                var ManufacthreID = data.Rows[0]["ManufacthreID"].ToString();
                DataTable cardata = ModelClass.GeModelName(Modelcar,ModelYear,ManufacthreID);

                //get model maufathrename
                var tozar = cardata.Rows[0]["tozeret_cd"].ToString();
                string cardataName = ManufacthreModel.GetozarName(tozar);


                var NumberRow = sql.Columns.Count + data.Columns.Count + cardata.Columns.Count ;
                for (int i = 0; i < NumberRow; i++)
                {
                    if (sql.Columns.Count > i)
                        AllData.Add(sql.Rows[0][i].ToString());
                    if (data.Columns.Count > i)
                        AllData.Add(data.Rows[0][i].ToString());
                    if (cardata.Columns.Count > i)
                        AllData.Add(cardata.Rows[0][i].ToString());
                    

                }
                AllData.Add(cardataName);

                return AllData;
            }
            else
                return null;
        }

        //check if user id is exciste
        protected static bool CustomerEx(string id)
        {
            var gargeid = HttpContext.Current.Session["UserID"].ToString();
            DataTable sql = new sql_class().Where("GaragID", gargeid).Where("UsarName", id).Get("Customer");
            if (sql.Rows.Count != 0)
                return true;
            else
                return false;
           
        }

        // submit new work card for customer
       
        protected void Submit_RepairJob_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                try
                {
                    var Dblist = new List<DbListAdapter>();
                    Dblist.Add(new DbListAdapter("GaragID", Session["UserID"].ToString()));
                    Dblist.Add(new DbListAdapter("CustomerID", CustomID.Value));
                    Dblist.Add(new DbListAdapter("TypeID", SelectTipol.Value));
                    Dblist.Add(new DbListAdapter("License_Number", License_id.Text));
                    Dblist.Add(new DbListAdapter("description", description_ID.Value));
                    Dblist.Add(new DbListAdapter("StartDate", Data_ID.Value));
                    Dblist.Add(new DbListAdapter("Approved_by", UserName_ID.Value));
                    Dblist.Add(new DbListAdapter("Mileage_start", Mileage_start.Value));

                    bool Repair = RepairJobl.New_RepairJob(Dblist);
                    if (Repair)
                    {
                        annualTreatment();
                        Error_ID.Text = "כרטיס עבודה חדש נפתח בהצלחה ! ";
                        showmodel();
                     
                    }
                }
                catch (Exception ex)
                {

                    throw ex;
                }

            }
            else
            {
                Error_ID.Text = "חובה למלא שדות חובה ! ";
            }
        }

        //autoCompliyte
        [WebMethod]
        public static List<string> AutoCompilteId_card(string parm)
        {
            List<string> autoid = new List<string>();
            sql_class sqlQuery = new sql_class();
            sqlQuery.WhereLIKE("UsarName", parm);
            sqlQuery.Limit(5);
            DataTable data = sqlQuery.Get("Customer", "UsarName");
            if(data.Rows.Count == 0)
            {
                autoid.Add("לא נמצאו התאמות");
            }
            var sizedata = data.Rows.Count;
            var i = 0;
            while (sizedata > 0)
            {
                autoid.Add(data.Rows[i]["UsarName"].ToString());
                sizedata--;
                i++;
            }
            return autoid;

        }

        public  void showmodel()
        {
           
            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "info();", true);
        }


        public void annualTreatment()
        {
            if (SelectTipol.Value == "1" || SelectTipol.Value == "2")
            {
                DateTime today = DateTime.Today;
                sql_class sql = new sql_class();
                var Dblist = new List<DbListAdapter>();
                Dblist.Add(new DbListAdapter("Last_annual_treatment", today.ToString(("yyyy-MM-dd"))));
            
                sql.Where("License_Number", License_id.Text);
                sql.Update("Vehicle", Dblist);
            }
        }
    }


   
}