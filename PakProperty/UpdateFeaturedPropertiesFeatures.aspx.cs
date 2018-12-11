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
    public partial class UpdateFeaturedPropertiesFeatures : System.Web.UI.Page
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
                    if (Request.QueryString["id"] != null)
                    {
                        int proId = Convert.ToInt32(Request.QueryString["id"]);
                        viewData(proId);
                    }
                }
            }
            else
            {
                Response.Redirect("LoginAdminPanel.aspx");
            }
        }
        protected void viewData(int id)
        {
            SqlCommand cmd = new SqlCommand("select * from tblAddFeaturedPropertiesFeatures where propertyId=@propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId", id);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            proId.Text = dt.Rows[0][0].ToString();
            featuresTxt.Text = dt.Rows[0][1].ToString();
            
        }

        protected void update(object sender, EventArgs e)
        {
            if (proId.Text != "" && featuresTxt.Text != "")
            {

                SqlCommand cmd = new SqlCommand("update tblAddFeaturedPropertiesFeatures set features=@features where propertyId=@propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId", proId.Text);
            cmd.Parameters.AddWithValue("@features", featuresTxt.Text);
            cmd.ExecuteNonQuery();

                Response.Write("<script type=\"text/javascript\">alert('Updated');location.href='ViewFeaturedProperties.aspx'</script>");


                
            }
            else
            {
                Response.Write("<script>alert('Missing Data Fields')</script>");
            }
        }
        
    }
}