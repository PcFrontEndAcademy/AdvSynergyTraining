using System;
using Exact.Core;

public partial class docs_ErniukasSettingsNew : Exact.Web.UI.Page.Base
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Save.Value != null && bool.Parse(Save.Value.ToString()) == true)
        {
            env.set_Setting(SettingType.User, "FromEmail", null, fromEmail.Value);
            env.set_Setting(SettingType.User, "SmtpServerHost", null, SMTP.Value);
            env.set_Setting(SettingType.User, "EmailPort", null, port.Value);
        }

        Save.Value = false;

        fromEmail.Value = env.get_Setting(SettingType.User, "FromEmail");
        SMTP.Value = env.get_Setting(SettingType.User, "SmtpServerHost");
        port.Value = env.get_Setting(SettingType.User, "EmailPort");
    }
}

