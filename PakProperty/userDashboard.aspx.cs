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
    public partial class userDashboard : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Session["id"] as string))
            {

                     con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select * from tblUsersData where userId = @userId", con);
                    cmd.Parameters.AddWithValue("@userId", Convert.ToInt32(Session["id"]));
                    cmd.ExecuteNonQuery();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    lblName.Text = dt.Rows[0][1].ToString();
                    Session["name"] = lblName.Text;
                    rptResult.DataSource = dt;
                    rptResult.DataBind();
                    viewAdds(Convert.ToInt32(Session["id"]));
                    viewExpireAdds(Convert.ToInt32(Session["id"]));
                
            }
            else
            {

                Response.Redirect("Login.aspx");
            }
        }
        protected void viewAdds(int id)
        {
            SqlCommand cmd = new SqlCommand("select propertyId,pp,pt,proty,price,FORMAT(postdate,'MMM dd yyyy') as postdate, Format(expdate,'MMM dd yyyy') as expdate from tblAdds where userId = @userId and expdate between GETDATE() and  expdate", con);
            cmd.Parameters.AddWithValue("@userId", id);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rpttblAdds.DataSource = dt;
            rpttblAdds.DataBind();
        }
        protected void viewExpireAdds(int id)
        {
            SqlCommand cmd = new SqlCommand("select propertyId,pp,pt,proty,price,FORMAT(postdate,'MMM dd yyyy') as postdate, Format(expdate,'MMM dd yyyy') as expdate from tblAdds where userId = @userId and expdate between expdate and GETDATE()", con);
            cmd.Parameters.AddWithValue("@userId", id);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rpttblEAdds.DataSource = dt;
            rpttblEAdds.DataBind();
        }


    }
}