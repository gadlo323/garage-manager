using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using GargeManger.App_Code;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;

namespace GargeManger
{
    public partial class Shwo_All_Customer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack & Session["UserID"] != null)
            {
                Garge garge = new Garge(Convert.ToInt32(Session["UserID"]));
                List<CustomerModel> list = garge.getAllCustomers();
                ShwoCustomer.DataSource = list;
                ShwoCustomer.DataBind();
                
            }


        }

        [WebMethod]
        public static string[] Get_CarInfo(string id)
        {
            String[] infos = new String[13];
            var Cid = Convert.ToInt32(id);
            DataTable data = VehicleModel.Info(Cid);
            DataTable Modal = ModelClass.GeModelName(data.Rows[0]["ModelID"].ToString(), data.Rows[0]["ModelYear"].ToString(),
              data.Rows[0]["ManufacthreID"].ToString());
            if (data.Rows.Count > 0)
            {
                infos[0] = data.Rows[0]["License_Number"].ToString();
                infos[1] = ManufacthreModel.GetozarName(data.Rows[0]["ManufacthreID"].ToString());
                infos[2] = Modal.Rows[0]["degem_nm"].ToString();
                infos[3] = data.Rows[0]["misgeret"].ToString();
                infos[4] = data.Rows[0]["ModelYear"].ToString();
                infos[5] = data.Rows[0]["tokef_test"].ToString();
                infos[6] = data.Rows[0]["Gimor"].ToString();
                infos[7] = data.Rows[0]["Balot"].ToString();
                infos[8] = data.Rows[0]["imageUrl"].ToString();
                infos[9] = Modal.Rows[0]["kinuy_mishari"].ToString();
                infos[10] = Modal.Rows[0]["merkav"].ToString();
                infos[11] = Modal.Rows[0]["nefah_manoa"].ToString();
                infos[12] = Modal.Rows[0]["delek_nm"].ToString();
                

                return infos;
            }
            else
            {
                return null;
            }
        }
        
    }
}
