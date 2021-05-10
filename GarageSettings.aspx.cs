using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GargeManger
{
    public partial class GarageSettings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["UserID"] != null)
                {
                    Garge garge = new Garge(Convert.ToInt32(Session["UserID"]));
                    string city = garge.get_city();
                    BisanceID.Attributes["placeholder"] = garge.GetNameGarga();
                    price.Attributes["placeholder"] = "₪" + garge.GetPricePerHour().ToString();
                    StreetID.Attributes["placeholder"] = garge.GetAddress();
                    emailId.Attributes["placeholder"] = garge.GetEmail();
                    PhoneId.Attributes["placeholder"] = garge.GetPhone();
                                  

                }

                else
                {
                    Response.Redirect("~/error-404.html");
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", ex.ToString(), true);
            }

        }

        protected void UpdSetting_Click(object sender, EventArgs e)
        {
          
                try
                {

                    sql_class sql = new sql_class();
                    var Dblist = new List<DbListAdapter>();
                    Dblist.Add(new DbListAdapter("pricePerHour", price.Value));
                    Dblist.Add(new DbListAdapter("Email", emailId.Value));
                    Dblist.Add(new DbListAdapter("Phone", PhoneId.Value));
                    Dblist.Add(new DbListAdapter("NameGarga", BisanceID.Value));
                    Dblist.Add(new DbListAdapter("Address", StreetID.Value));
                    Dblist.Add(new DbListAdapter("CityID", Request.Form[hfCityid.UniqueID]));

                sql.Where("GaragID", Session["UserID"].ToString());
                    bool Updat_result = sql.Update("Garage", Dblist);
                    if (Updat_result)
                        System.Windows.Forms.MessageBox.Show("הנתונים נשמרו בהצלחה! ");
                    else { System.Windows.Forms.MessageBox.Show("שגיאה "); }

                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(GetType(), "Error!", "alert('" + ex.Message.Replace("'", @"\'") + "');", true);

                }
              


            
        }



        [WebMethod]

        public static List<KeyValuePair<string, int>> ReloadCity(string parm)
        {
            List<string> City = new List<string>();
            List<KeyValuePair<string, int>> dataList = new List<KeyValuePair<string, int>>();
            sql_class sqlQuery = new sql_class();
            sqlQuery.WhereLIKE("CityName", parm);
            sqlQuery.Limit(5);
            DataTable data = sqlQuery.Get("City", "CityName", "CityID");
            if (data.Rows.Count == 0)
            {
                dataList.Add(new KeyValuePair<string, int>("לא נמצאו התאמות", -1));
            }
            var sizedata = data.Rows.Count;
            var i = 0;
            while (sizedata > 0)
            {
             
                dataList.Add(new KeyValuePair<string, int>(data.Rows[i]["CityName"].ToString(), Convert.ToInt32(data.Rows[i]["CityID"])));
                sizedata--;
                i++;
            }

            return dataList;
        }
    }
}