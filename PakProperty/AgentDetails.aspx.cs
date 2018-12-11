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
    public partial class AgentDetails : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);

                DataTable daat = new DataTable();
                daat.Columns.Add("agencyName", typeof(string));
                daat.Columns.Add("agencyPhone", typeof(string));
                daat.Columns.Add("agencyCity", typeof(string));
                daat.Columns.Add("agencyDes", typeof(string));
                daat.Columns.Add("image", typeof(string));



                con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tblAgencies where agencyId=@agencyId", con);
                cmd.Parameters.AddWithValue("@agencyId", id);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    daat.Rows.Add(dt.Rows[0][1], dt.Rows[0][2], dt.Rows[0][4], dt.Rows[0][5], "data:Image/png;base64," + Convert.ToBase64String((byte[])dt.Rows[i][6]));
                }
                rptBasic.DataSource = daat;
                rptBasic.DataBind();
            }
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