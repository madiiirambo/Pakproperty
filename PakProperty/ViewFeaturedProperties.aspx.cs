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
    public partial class ViewFeaturedProperties : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Session["admin"] as string))
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
                con.Open();

                SqlCommand cmd = new SqlCommand("select propertyId , propertyName from tblAddFeaturedPropertiesBasic", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                rptBasic.DataSource = dt;
                rptBasic.DataBind();


            }
            else
            {
                Response.Redirect("LoginAdminPanel.aspx");
            }
        }


    }
}