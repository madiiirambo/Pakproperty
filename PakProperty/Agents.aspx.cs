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
    public partial class Agents : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dat = new DataTable();
            dat.Columns.Add("image",typeof(string));
            dat.Columns.Add("agencyId", typeof(string));
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tblAgencies where agencyType=@agencyType", con);
            cmd.Parameters.AddWithValue("@agencyType", "Diamond Agency");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dat.Rows.Add("data:Image/png;base64," + Convert.ToBase64String((byte[])dt.Rows[i][6]),dt.Rows[i][0]); 
            }
            rptBasic.DataSource = dat;
            rptBasic.DataBind();





            DataTable dat1 = new DataTable();
            dat1.Columns.Add("image", typeof(string));
            dat1.Columns.Add("agencyId", typeof(string));

            SqlCommand cmd1 = new SqlCommand("select * from tblAgencies where agencyType=@agencyTypee", con);
            cmd1.Parameters.AddWithValue("@agencyTypee", "Gold Agency");
            SqlDataAdapter sda1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                dat1.Rows.Add("data:Image/png;base64," + Convert.ToBase64String((byte[])dt1.Rows[i][6]), dt1.Rows[i][0]);
            }
            rptImg.DataSource = dat1;
            rptImg.DataBind();



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

                Response.Write("<script type=\"text/javascript\">alert('Invalid Id Property');location.href='Agents.aspx'</script>");

            }
        }
    }
}