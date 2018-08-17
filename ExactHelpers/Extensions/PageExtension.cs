using Exact.Web.UI.Controls;
using Exact.Web.UI.Page;

namespace ExactHelpers.Extensions
{
    public static class PageExtension
    {
        public static void AddErrorMessage(this Base page, string message)
        {
            var messageControl = new BCErrorMessages();
            messageControl.Errors.Add(message);
            page.Controls.AddAt(0,messageControl);
        }

        public static void AddInfoMessage(this Base page, string message)
        {
            var messageControl = new BCErrorMessages
            {
                Mode = BCErrorMessages.BCErrorMessagesMode.Notification
            };
            messageControl.Errors.Add(message);
            page.Controls.AddAt(0, messageControl);
        }
    }
}
