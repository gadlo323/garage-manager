using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using GargeManger.App_Code;

namespace GargeManger.App_Code
{
    public class SmsSender
    {
        private static readonly string ApiKey = ConfigurationManager.AppSettings["ApiKey"];
        private static readonly string Pass = ConfigurationManager.AppSettings["ApiPass"];
        private static readonly string Phone = ConfigurationManager.AppSettings["Phone"];


        public static  async Task  SendUsingAPIAsync(string GarageNumber,string GarageName,
            string userPhone,string userName,string licenseplate )
        {
            try
            {
                HttpClient client = new HttpClient();
                string mesaage = $"{userName} שלום , מ.ר {licenseplate} מוכן. תודה על הסבלנות." +
                    $" {GarageName} {GarageNumber}";
                var values = new Dictionary<string, string>
            {
                { "key", ApiKey }, { "user",Phone},{ "pass", Pass },
                { "sender", GarageNumber }, { "recipient", userPhone },
                { "msg", mesaage }
            };
                var content = new FormUrlEncodedContent(values); //Encode the Data
                var response = await client.PostAsync("https://www.sms4free.co.il/ApiSMS/SendSMS", content);
                var responseString = await response.Content.ReadAsStringAsync();
            }
            catch(Exception ex)
            {
                throw ex;
            }
          
        }

    }
}