using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net.Mime;
using GargeManger.App_Code;


namespace GargeManger
{
    public partial class conect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bt_send_Click(object sender, EventArgs e)
        {
              try
              {
                if (EmailBLL.IsValidEmailAddress(tb_email.Text))
                {
                    EmailBLL.SendMailMessage("fixmedonotreply@gmail.com", tb_email.Text, null, null, tb_subjact.Text, tb_message.Text, null);
                    lbl_message.Text = "השליחה בוצעה בהצלחה!";
                    tb_name.Text = "";
                    tb_email.Text = "";
                    tb_message.Text = "";
                    tb_subjact.Text = "";
                }
                   
                

              }
               catch (Exception ex)
              {
                   lbl_message.Text = ex.Message;
              }
             

           
        }

    }
   
}