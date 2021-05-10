using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GargeManger.App_Code;
namespace GargeManger
{
    public partial class NewPart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //save new part to table partMoael
        protected void savePart_Click(object sender, EventArgs e)
        {
            var image = uploadPart_Click();
            try
            {
                PartModel part = new PartModel(
                ProdectGroup.Value,
                PartNmae.Value,
                Condition.Value,
                Convert.ToInt32(QuantityAaliable.Value),
                Convert.ToDouble(UnitPricey.Value),
                Convert.ToInt32(Session["UserID"].ToString()),
                image
                );
                bool data = part.newPart();
                if (data)
                    message.Text = "פריט חדש נוסף בהצלחה";
                else
                    message.Text = "אירעה שגיאה";
            }
            catch (Exception ex)
            {
                message.Text = ex.ToString();
            }
            


        }


        //upload part image
        protected string uploadPart_Click()
        {

            string filename = Path.GetFileName(Partimage.PostedFile.FileName);
            string fileExstenshion = Path.GetExtension(filename);
            if (fileExstenshion.ToLower() == ".jpg" || fileExstenshion.ToLower() == ".jpeg" || fileExstenshion.ToLower() == ".gif" || fileExstenshion.ToLower() == ".png" ||
                      fileExstenshion.ToLower() == ".bmp" && Partimage.PostedFile != null)
            {
                message.Text = string.Empty;
                string path = @"\PartImage\" + Partimage.FileName;
                Partimage.SaveAs(Server.MapPath("~/PartImage/") + Path.GetFileName(Partimage.FileName));
                return path;

            }
            else
            {

                message.Text = "ניתן לעלות תמונות אם סיומת(.jpg,.gif,.png,.bmp) בלבד!";
                message.ForeColor = System.Drawing.Color.Red;
                return null;
            }

        }
    }
}