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
    public partial class ViewFeaturedPropertiesAgents : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            con.Open();
            if (!string.IsNullOrEmpty(Session["admin"] as string))
            {

                if (!IsPostBack)
                {

                }
            }
            else
            {
                Response.Redirect("LoginAdminPanel.aspx");
            }
        }
        protected void viewData(object sender, EventArgs e)
        {



            if (pid.Text != "")
            {
                SqlCommand cmd = new SqlCommand("select * from tblAddFeaturedPropertiesAgents where propertyId=@propertyId", con);
                cmd.Parameters.AddWithValue("@propertyId", pid.Text);
                cmd.ExecuteNonQuery();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    rptBasic.DataSource = dt;
                    rptBasic.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Id')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Enter Id')</script>");
            }
        }
    }
}