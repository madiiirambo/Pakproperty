using System;
using System.Collections;
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
    public partial class Login : System.Web.UI.Page
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
        protected void userLogin(object sender, EventArgs e)
        {

            SqlCommand cmd = new SqlCommand("select * from tblUsersData where userEmail=@userEmail", con);
            cmd.Parameters.AddWithValue("@userEmail", emailtxt.Text);
            cmd.ExecuteNonQuery();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                if (passtxt.Text == dt.Rows[0][3].ToString())
                {
                    Session["id"] = dt.Rows[0][0].ToString();


                    Response.Redirect("userDashboard.aspx");
                }
                else
                {
                    lblcheck.Visible = true;
                    lblcheck.Text = "Invalid Password Please Try Again";
                }


            }
            else
            {
                lblcheck.Visible = true;
                lblcheck.Text = "Invalid Credential Please Try Again";
            }
        }
        protected void getProperty(object sender, EventArgs e)
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

                    Response.Write("<script type=\"text/javascript\">alert('Invalid Id Property');location.href='Login.aspx'</script>");

                }
            }
        }
    }
}
