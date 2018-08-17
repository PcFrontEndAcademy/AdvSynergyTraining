using System;
using Exact.Core;
using Exact.Repository;
using Exact.Web.UI.Page;
using Exact.Web.UI.Controls;
using System.Net.Mail;
using ExactHelpers.Extensions;

namespace AdvErniukasEvents
{
    public class EmailSender: ApplicationExtensionBase
    {
        public override void AfterInit()
        {
            page.Form.Controls.Add(new InputField {ID="advSendEmail", Hidden=true});
        }

        public override void AfterLoad()
        {
            var bc = new BusinessComponent(env,"Associates");
            var idInput = (InputField)page.FindControl("ID");
            bc.Edit(idInput.Value);
            var input = (InputField)page.FindControl("advSendEmail");
            if (input != null && input.Value != null && input.Value.ToString() == "send")
            {
                try
                {
                    var email = bc["email"];

                    if(email == null || string.IsNullOrEmpty(email.ToString()))
                    {
                        page.AddErrorMessage("Email is empty");
                        return;
                    }

                    var name = bc["TavoMama"];
                    SendEmail(email.Value.ToString(), name.ToString());
                    input.Value = null;
                }
                catch (Exception)
                {
                    page.AddErrorMessage("Failed to send email");
                }
                   
            }
        }

        private void SendEmail(string to, string name)
        {
            var fromEmail = env.get_Setting(SettingType.User, "fromEmail");

            if (fromEmail == null)
            {
                page.AddErrorMessage("Please fill email in settings");
                return;
            }

            var mail = new MailMessage(fromEmail.ToString(), to);

            var port = env.get_Setting(SettingType.User, "EmailPort");

            if (port == null)
            {
                page.AddErrorMessage("Please fill port in settings");
                return;
            }

            var smtp = env.get_Setting(SettingType.User, "SmtpServerHost");

            if (smtp == null)
            {
                page.AddErrorMessage("Please fill smtp host in settings");
                return;
            }

            SmtpClient client = new SmtpClient
            {
                Port = Convert.ToInt32(port),
                DeliveryMethod = SmtpDeliveryMethod.Network,
                Host = smtp.ToString()
            };

            mail.Subject = "this is a test email.";
            mail.Body = "Hello:" + name;
            client.Send(mail);
            page.AddInfoMessage("Email sent!");
        }
    }
}
