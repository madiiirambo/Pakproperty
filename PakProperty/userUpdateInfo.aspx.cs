using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PakProperty
{
    public partial class userUpdateInfo : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            con.Open();
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Session["id"] as string))
                {
                    
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
        }
        protected void update(object sender, EventArgs e)
        {

            if(email.Text != "" && phone.Text != "")
            {
                    SqlCommand command = new SqlCommand("update tblUsersData set userEmail=@userEmail,userPhone=@userPhone where userId=@userId", con);
                    command.Parameters.AddWithValue("@userEmail", email.Text);
                    command.Parameters.AddWithValue("@userPhone", phone.Text);
                    command.Parameters.AddWithValue("@userId", Convert.ToInt32(Session["id"]));
                    command.ExecuteNonQuery();
                    Response.Write("<script type=\"text/javascript\">alert('Update Sucessfull');location.href='userDashboard.aspx'</script>");

                
            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert('Missing Fields');</script>");
            }
        }
    }
}