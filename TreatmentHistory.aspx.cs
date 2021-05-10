using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GargeManger.App_Code;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;

namespace GargeManger
{
    public partial class TreatmentHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack & Session["UserID"] != null)
            {
                Garge garge = new Garge(Convert.ToInt32(Session["UserID"]));
                RepairJobl allJobs = new RepairJobl ();
                List<RepairJobl> data = allJobs.AllHistory(Session["UserID"].ToString());
                ShwoHistory.DataSource = data;
                ShwoHistory.DataBind();

            }

        }
    }
}