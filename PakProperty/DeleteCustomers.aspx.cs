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
    public partial class DeleteCustomers : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            con.Open();
            if (!string.IsNullOrEmpty(Session["admin"] as string))
            {
            }
            else
            {
                Response.Redirect("LoginAdminPanel.aspx");
            }
        }

        protected void viewDate(object sender, EventArgs e)
        {
            if (Cid.Text != "")
            {
                SqlCommand cmd = new SqlCommand("select * from tblHappyCustomers where customerId = @customerId", con);
                cmd.Parameters.AddWithValue("@customerId", Cid.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Cid.Text = dt.Rows[0][0].ToString();
                    Cname.Text = dt.Rows[0][1].ToString();
                    Cdes.Text = dt.Rows[0][2].ToString();
                    Cid.ReadOnly = true;

                }
                else
                {
                    Response.Write("<script>alert('Customer Id Invalid')</script>");
                    Cid.Text = string.Empty;
                    Cname.Text = string.Empty;
                    Cdes.Text = string.Empty;
                }
            }
            else
            {
                Response.Write("<script>alert('Enter Customer Id ')</script>");
            }

        }
        protected void delete (object sender, EventArgs e)
        {

            SqlCommand cmd = new SqlCommand("delete from tblHappyCustomers where customerId=@customerId", con);
            cmd.Parameters.AddWithValue("@customerId", Cid.Text);
            cmd.ExecuteNonQuery();
            Response.Write("<script type=\"text/javascript\">alert('Delete Customer Sucessfull ');location.href='ViewCustomers.aspx'</script>");

        }
    }
}