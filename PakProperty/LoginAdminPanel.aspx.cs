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
    public partial class LoginAdminPanel : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            con.Open();
            if(!IsPostBack)
            {

            }
        }
        protected void login(object sender, EventArgs e)
        {
            if(passtxt.Text != "" && nametxt.Text != "")
            {
                SqlCommand cmd = new SqlCommand("select * from tblAdminLogin where name=@name and password=@password", con);
                cmd.Parameters.AddWithValue("@name", nametxt.Text);
                cmd.Parameters.AddWithValue("@password", passtxt.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if(dt.Rows.Count > 0 )
                {
                    Session["admin"] = "pakproperty.co";

                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Credentials')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Missing Data')</script>");
            }
        }
    }
}