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
    public partial class DeleteAdvertisement : System.Web.UI.Page
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
        protected void viewDate(object sender, EventArgs e)
        {
            if (Pid.Text != "")
            {
                SqlCommand cmd = new SqlCommand("select * from tblAdvertisement where advertisementId = @advertisementId", con);
                cmd.Parameters.AddWithValue("@advertisementId", Pid.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Pid.Text = dt.Rows[0][0].ToString();
                    nametxt.Text = dt.Rows[0][1].ToString();
                    link.Text = dt.Rows[0][2].ToString();
                    Pid.ReadOnly = true;

                }
                else
                {
                    Response.Write("<script>alert('Advertisement Id Invalid')</script>");
                    Pid.Text = string.Empty;
                    nametxt.Text = string.Empty;
                    link.Text = string.Empty;
                }
            }
            else
            {
                Response.Write("<script>alert('Enter Advertisement Id ')</script>");
            }

        }
        protected void delete(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("delete from tblAdvertisement where advertisementId = @advertisementId", con);
            cmd.Parameters.AddWithValue("@advertisementId", Pid.Text);
            cmd.ExecuteNonQuery();
            Response.Write("<script type=\"text/javascript\">alert('Delete');location.href='ViewAdvertisement.aspx'</script>");

        }
    } 
}