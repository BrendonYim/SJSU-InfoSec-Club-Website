using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Configuration;

namespace WebApplication5
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {

            }
            else
            {

            }
        }

        protected void Email(object sender, EventArgs e)
        {

            //http://stackoverflow.com/questions/27764692/validating-recaptcha-2-no-captcha-recaptcha-in-asp-nets-server-side
            string EncodedResponse = Request.Form["g-Recaptcha-Response"];
            bool IsCaptchaValid = (ReCaptchaClass.Validate(EncodedResponse) == "True" ? true : false);

            if (IsCaptchaValid)
            {
                var fromAddress = new MailAddress(ConfigurationManager.AppSettings["clubEmail"], "InfoSec Club");
                var toAddress = new MailAddress(ConfigurationManager.AppSettings["adminEmail"], "Vivi Langga");
                string fromPassword = ConfigurationManager.AppSettings["clubEmailPass"];
                string subject = "Contacted from website";
                string body = "From: " + txtName.Text + "\nPhone: " + txtPhone.Text + "\nEmail: " + txtEmail.Text + "\nComment: " + txtComment2.Value;

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
                clearAll();
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Contact_Success", "alert('Your message has been sent, please expect a response within 24 hours')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Contact_Fail", "alert('I don't allow robots to contact me')", true);

            }
        }
        protected void clearAll()
        {
            txtName.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
            txtComment2.Value = "";
            Label4.Text = "You message has been sent, please expect a response through email in 24 hours";
            Image1.ImageUrl = "/images/Thankyou.jpg";
        }
    }
}