using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASPSnippets.SmsAPI;


namespace Look4Home
{
    public partial class Contact : System.Web.UI.Page
    {
        String Email, fullname, mobile, message, passwd;
        String SMSName, SMSPass;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            fullname = full_name.Text;
            mobile = "9769216298";
            Email = fedemail.Text;
            message = fedMessage.Text;
            passwd = fedpass.Text;

            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.To.Add("mohitamichand@gmail.com");
            mail.From = new MailAddress(Email);
            mail.Subject = "Look4Home Ltd.: Feedback from " + fullname;
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = message;

            mail.Priority = MailPriority.High;
            SmtpClient client = new SmtpClient();

            client.UseDefaultCredentials = false;
            client.Credentials = new System.Net.NetworkCredential(Email, passwd);
            client.Port = 587; // Gmail works on this port
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true; //Gmail works on Server Secured Layer

            try
            {
                client.Send(mail);
                Response.Write("Feedback Sent Successfully!");
            }
            catch (Exception ex)
            {
                btnSubmit_Click(sender, e);
            }
            finally
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script language='javascript'>alert('Feedback Sent Successful!')</script>");
                sendtoMobile();
            }

        }

        public void sendtoMobile()
        {

            SMSName = "9768745220";
            SMSPass = "8874288";
            String combMessage = "From: " + fullname + "\r\nEmail:" + Email + "\r\n" + fedMobile.Text + "\r\nFeedBack:" + message;
            SMS.APIType = SMSGateway.Site2SMS;
            SMS.MashapeKey = "3xQ6I5wwMmmshPrBU4u9K85jCgeqp1WvUxljsnLuRggbitKvM7";
            SMS.Username = SMSName.Trim();
            SMS.Password = SMSPass.Trim();
            if (mobile.Trim().IndexOf(",") == -1)
            {
                //Single SMS
                SMS.SendSms(mobile.Trim(), combMessage.Trim());
            }
            else
            {
                //Multiple SMS
                List<string> numbers = mobile.Trim().Split(',').ToList();
                SMS.SendSms(numbers, combMessage.Trim());
            }
        }

        
    }
}
