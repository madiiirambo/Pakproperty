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
    public partial class forgetPass : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            con.Open();
            lblcheck.Visible = false;
            if (!IsPostBack)
            {

            }
        }

        protected void sendEmail(object sender, EventArgs e)
        {
            if (emailtxt.Text != "" && num.Text != "")
            {
                SqlCommand cmd = new SqlCommand("select * from tblUsersData where userEmail = @userEmail and userPhone=@userPhone", con);
                cmd.Parameters.AddWithValue("@userEmail", emailtxt.Text);
                cmd.Parameters.AddWithValue("@userPhone", num.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    MailMessage mailMessage = new MailMessage();
                    mailMessage.To.Add(emailtxt.Text);
                    mailMessage.From = new MailAddress("support@pakproperty.co");
                    // Specify the email body
                    mailMessage.Body = "Your Password is (" + dt.Rows[0][3].ToString() + ")";
                    // Specify the email Subject
                    mailMessage.Subject = "Password";

                    // Specify the SMTP server name and post number
                    SmtpClient smtpClient = new SmtpClient();
                    // Specify your gmail address and password

                   
                    // Gmail works on SSL, so set this property to true
                   
                    // Finall send the email message using Send() method
                    smtpClient.Send(mailMessage);
                    lblcheck.Visible = true;
                    lblcheck.Text = "Kindly Check Your Email ! We Sent Your Password in Your Email Address";
                }
                else
                {
                    lblcheck.Visible = true;
                    lblcheck.Text = "Invalid Email Or Phone Number ";
                }
            }
            else
            {
                lblcheck.Visible = true;
                lblcheck.Text = "Missing Fields ";
            }
        }
        public void getProperty(object sender, EventArgs e)
        {
            if (TextBox1.Text != "")
            {
                SqlCommand cmd = new SqlCommand("select * from tblAdds where propertyId=@propertyId", con);
                cmd.Parameters.AddWithValue("@propertyId", TextBox1.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Response.Redirect("AddDetails.aspx?id=" + Convert.ToInt32(dt.Rows[0][0]));
                }
                else
                {

                    Response.Write("<script type=\"text/javascript\">alert('Invalid Id Property');location.href=forgetPass.aspx'</script>");

                }
            }


        }
    }
}