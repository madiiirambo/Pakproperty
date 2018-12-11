using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PakProperty
{
    public partial class Support : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Session["id"] as string))
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tblUsersData where userId = @userId", con);
                cmd.Parameters.AddWithValue("@userId", Convert.ToInt32(Session["id"]));
                cmd.ExecuteNonQuery();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                lblName.Text = dt.Rows[0][1].ToString();
                email.Text = dt.Rows[0][2].ToString();
                phone.Text = dt.Rows[0][5].ToString();

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            }
        protected void sendMessage(object sender, EventArgs e)
        {
            if(desText.Text != "")
            {


                MailMessage mail = new MailMessage();
                mail.To.Add("admin@pakproperty.co");
                mail.From = new MailAddress("support@pakproperty.co");
                mail.Subject = "User Message";
                string Body = "User Email: " + email.Text + "\n" + "User Phone: " + phone.Text + "\n" + "Message: " + desText.Text;
                mail.Body = Body;
                mail.IsBodyHtml = true;
                SmtpClient smtpClient = new SmtpClient();
                smtpClient.Send(mail);

                //MailMessage mailMessage = new MailMessage("support@pakproperty.co", "admin@pakproperty.co");
                //// Specify the email body
                //mailMessage.Body = "User Email: " + email.Text + "\n" + "User Phone: " + phone.Text + "\n" + "Message: "+desText.Text;
                //// Specify the email Subject
                //mailMessage.Subject = "User Message";

                //// Specify the SMTP server name and post number
                //SmtpClient smtpClient = new SmtpClient("smtp.office365.com", 587);
                //smtpClient.Host = "relay-hosting.secureserver.net";
                //smtpClient.Port = 25;

                //// Specify your gmail address and password

                //smtpClient.Credentials = new System.Net.NetworkCredential()
                //{
                //    UserName = "support@pakproperty.co",
                //    Password = "Pakproperty.co1"
                //};
                //// Gmail works on SSL, so set this property to true
                //smtpClient.EnableSsl = true;
                //// Finall send the email message using Send() method
                //smtpClient.Send(mailMessage);

                //Response.Write("<script type=\"text/javascript\">alert('Your Message Send We Reply with in 24hours');location.href='userDashboard.aspx'</script>");

            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert('Please Fill Your Message');</script>");

            }
        }
    }
}