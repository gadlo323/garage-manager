using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using GargeManger.App_Code;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;



namespace GargeManger
{
    public partial class BillingCustomer : System.Web.UI.Page
    {
        static double totel ;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null )
            {
                setGarageInfo();
                renderInfoCutomer();
                RendarCart();
            }

           
        }

        public void renderInfoCutomer()
        {
            var cid = Request.QueryString["cid"];
            var tid = Request.QueryString["tid"];

            CustomerModel customer = new CustomerModel(Convert.ToInt32(cid));

            //DataTable customer = CustomerModel.Customer_info(cid);
            FnameCustomer.Text = customer.firstnmae +" "+ customer.lastname;
            pone.Text = customer.phonNumber;
            EmailTop.Text = customer.email;
            barthData.Text = customer.birthDate.ToShortDateString().ToString();
            
        }
        protected void RendarCart()
        {
            var GaragID = Session["UserID"].ToString();
            string CID = Request.QueryString["cid"].ToString();
            string teratmentID = Request.QueryString["tid"].ToString();
           
            var totalPrice = 0.0;
            CartModel model = new CartModel();
            DataTable data = model.GetCartData(GaragID, CID, teratmentID);
            var count = data.Rows.Count;
            while (count > 0)
            {
                var price = data.Rows[count - 1]["productPrice"].ToString();
                totalPrice += Convert.ToDouble(price);
                count--;
            }
            total.InnerHtml =totalPrice.ToString() + "₪";
     
            texes.InnerHtml = Convert.ToDouble( (totalPrice + totel) * 0.17).ToString() + "₪";
            result.InnerHtml =  (((totalPrice+ totel) * 0.17) + totel + totalPrice).ToString() + "₪";
            //texes.InnerHtml = string.Format("{0:0.00}", Convert.ToDouble((totalPrice * 0.17)).ToString()) + "₪";
            //result.InnerHtml = string.Format(" {0:F2}", (((totalPrice + totel) * 0.17) + totel + totalPrice).ToString()) + "₪";
            ShwoPartTreatment.DataSource = data;
            ShwoPartTreatment.DataBind();
        }
        
        public void setGarageInfo()
        {
            string teratmentID = Request.QueryString["tid"].ToString();
            RepairJobl repairJob = new RepairJobl(Convert.ToInt32(teratmentID));
            var amountsTime = repairJob.totalWorkingHours;

            Garge garge = new Garge(Convert.ToInt32(Session["UserID"]));
            LblbisanceName.Text = garge.GetNameGarga();
            LblbisanceName2.Text = garge.GetNameGarga();
            city.Text = garge.get_city();
            lblstreet.Text = garge.GetAddress();
            lblphone.Text = garge.GetPhone();
            name.InnerText = garge.Get_Full_Name();
            phonenumber.InnerText= garge.GetPhone();
            email.InnerText = garge.GetEmail();
            Phone.InnerText=garge.GetPhone();
            mail.InnerText= garge.GetEmail();
            priceHour.InnerText = garge.GetPricePerHour().ToString() + "₪";
            amountTime.InnerText = amountsTime.ToString();
            ////////
            DateTime currentTime = DateTime.Now;
            lbldatatime.Text = currentTime.ToString();
            Random random = new Random();
            lblidinvoic.Text = "##" + random.Next(10001, 9999999).ToString() + "##";
            totelTimePrice.InnerText = string.Format("{0:0.00}", Convert.ToDouble((amountsTime * garge.GetPricePerHour())).ToString()) + "₪";
            totelTimePrice2.InnerText = string.Format("{0:0.00}", Convert.ToDouble((amountsTime * garge.GetPricePerHour())).ToString()) + "₪";
            totel = Convert.ToDouble((amountsTime * garge.GetPricePerHour())) ;
        }

        protected async void SendSms_Click(object sender, EventArgs e)
        {
            var cid = Request.QueryString["cid"];
            CustomerModel customer = new CustomerModel(Convert.ToInt32(cid));
           string customerPhone = customer.phonNumber;
           string customername = customer.firstnmae + " " + customer.lastname;

            string teratmentID = Request.QueryString["tid"].ToString();
            RepairJobl repairJob = new RepairJobl(Convert.ToInt32(teratmentID));
            string LicensePlate = repairJob.license_Number;


            Garge garge = new Garge(Convert.ToInt32(Session["UserID"]));
            string garageName = garge.GetNameGarga();
            string garageNumber = garge.GetPhone();

            //This Method Sends Using API and its ASYNC (You have to wait until the process ends)
            await SmsSender.SendUsingAPIAsync(
              garageNumber,
               garageName,
               customerPhone,
             customername,
             LicensePlate
                );  
            Thread.Sleep(5000); //Sleep for 5 SECOND Until API FINISH His Work
            showmodel();
        }



        public void showmodel()
        {

            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "info();", true);
        }
    }
}


