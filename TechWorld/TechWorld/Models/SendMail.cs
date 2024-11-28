using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;

namespace TechWorld.Models
{
    public class sendMail
    {
        // Lấy thông tin từ file config
        private static string password = ConfigurationManager.AppSettings["PasswordEmail"];
        private static string Email = ConfigurationManager.AppSettings["Email"];

        public static bool SendMail(string name, string subject, string content, string toMail)
        {
            bool rs = false;
            try
            {
                // Tạo đối tượng MailMessage
                MailMessage message = new MailMessage();

                // Cấu hình SMTP client
                var smtp = new SmtpClient()
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential()
                    {
                        UserName = Email,
                        Password = password
                    }
                };

                // Cấu hình email
                MailAddress fromAddress = new MailAddress(Email, name);
                message.From = fromAddress;
                message.To.Add(toMail);
                message.Subject = subject;
                message.IsBodyHtml = true;
                message.Body = content;

                // Gửi email
                smtp.Send(message);
                rs = true;

                // Giải phóng tài nguyên
                message.Dispose();
            }
            catch (Exception ex)
            {
                // Xử lý lỗi và log
                System.Diagnostics.Debug.WriteLine($"Error sending email: {ex.Message}");
                rs = false;
            }

            return rs;
        }
    }
}