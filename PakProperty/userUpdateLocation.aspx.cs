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
    public partial class userUpdateLocation : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Session["id"] as string))
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
                con.Open();

                SqlCommand cmd = new SqlCommand("select * from tblAdds where userId = @userId and propertyId = @propertyId", con);
                cmd.Parameters.AddWithValue("@userId",Convert.ToInt32(Session["id"]));
                cmd.Parameters.AddWithValue("@propertyId", id);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if(dt.Rows.Count > 0)
                {

                }
                else
                {
                    Response.Redirect("userDashboard.aspx");
                }
            }
            else
            {

                Response.Redirect("Login.aspx");
            }
        }
        public void update(Object sender , EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            if (latitude.Text != "" && longitude.Text != "")
            {
                SqlCommand cmd = new SqlCommand("update tblAdds set lat = @lat , lng = @lng where propertyId = @propertyId", con);
                cmd.Parameters.AddWithValue("@lat", latitude.Text);
                cmd.Parameters.AddWithValue("@lng", longitude.Text);
                cmd.Parameters.AddWithValue("@propertyId", id);
                cmd.ExecuteNonQuery();
                Response.Write("<script type=\"text/javascript\">alert('Updated');location.href='userDashboard.aspx'</script>");
            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert('Enter Location')</script>");
            }
        }
    }
}