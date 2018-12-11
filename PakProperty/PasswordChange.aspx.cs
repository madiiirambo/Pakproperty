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
    public partial class PasswordChange : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            con.Open();

         

            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Session["admin"] as string))
                {
                }
                else
                {
                    Response.Redirect("LoginAdminPanel.aspx");
                }

            }

        }
        protected void changepass(object sender, EventArgs e)
        {
            if(prepass.Text != "" && newpass.Text != "")
            {
                SqlCommand cmd = new SqlCommand("select * from tblAdminLogin where password=@password", con);
                cmd.Parameters.AddWithValue("@password", prepass.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if(dt.Rows.Count > 0)
                {
                    SqlCommand command = new SqlCommand("update tblAdminLogin set password=@password where name=@name", con);
                    command.Parameters.AddWithValue("@name", "admin");
                    command.Parameters.AddWithValue("@password", newpass.Text);
                    command.ExecuteNonQuery();
                    Response.Write("<script type=\"text/javascript\">alert('Password Changed Sucussfull');location.href='Dashboard.aspx'</script>");


                }
                else
                {
                    Response.Write("<script type=\"text/javascript\">alert('Current Password Wrong');</script>");

                }

            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert(Missing field');</script>");
            }
        }
    }
}
