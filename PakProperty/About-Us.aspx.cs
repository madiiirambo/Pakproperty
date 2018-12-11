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
    public partial class About_Us : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            con.Open();

        }
        public void getProperty(object sender, EventArgs e)
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

                Response.Write("<script type=\"text/javascript\">alert('Invalid Id Property');location.href='About-Us.aspx'</script>");

            }
        }
    }
}