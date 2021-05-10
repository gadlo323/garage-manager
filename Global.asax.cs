using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace GargeManger
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            Application["UseronLine"] = 0;
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Application.Lock();
            Application["UseronLine"] = Convert.ToInt32(Application["UseronLine"]) + 1;
            Application.UnLock();
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            //Exception ex = Server.GetLastError();
            //Server.ClearError();
            //Response.Redirect("~/error-500 defult.html");

        }

        protected void Session_End(object sender, EventArgs e)
        {
            Application.Lock();
            Application["UseronLine"] = (int)(Application["UseronLine"]) - 1;
            Application.UnLock();
            

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}