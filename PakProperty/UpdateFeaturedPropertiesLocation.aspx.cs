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
    public partial class UpdateFeaturedPropertiesLocation : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            con.Open();
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int proId = Convert.ToInt32(Request.QueryString["id"]);
                    viewData(proId);
                }
            }
        }
        protected void viewData(int id)
        {
            SqlCommand cmd = new SqlCommand("select * from tblAddFeaturedPropertiesLocation where propertyId = @propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId", id);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            proppid.Text = dt.Rows[0][0].ToString();
            locationTxt.Text = dt.Rows[0][1].ToString();

        }
        protected void update(object sender, EventArgs e)
        {

            if (proppid.Text != "" && locationTxt.Text != "")
            {

                SqlCommand cmd = new SqlCommand("update tblAddFeaturedPropertiesLocation set location=@location where propertyId=@propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId", proppid.Text);
            cmd.Parameters.AddWithValue("@location", locationTxt.Text);
            cmd.ExecuteNonQuery();
                Response.Write("<script type=\"text/javascript\">alert('Updated');location.href='ViewFeaturedProperties.aspx'</script>");


                


            }
            else
            {
                Response.Write("<script>alert('Missing Data')</script>");
            }
        }
    }
}