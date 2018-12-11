using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PakProperty
{
    public partial class DeleteAgencies : System.Web.UI.Page
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

                }
            }
            else
            {
                Response.Redirect("LoginAdminPanel.aspx");
            }
        }
        public void viewData(object sender, EventArgs e)
        {
            if (Pid.Text != "")
            {
                SqlCommand cmd = new SqlCommand("select * from tblAgencies where agencyId=@agencyId", con);
                cmd.Parameters.AddWithValue("@agencyId", Pid.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    name.Text = dt.Rows[0][1].ToString();
                    phone.Text = dt.Rows[0][2].ToString();
                    ddTyPE.SelectedItem.Text = dt.Rows[0][3].ToString();
                    text.Text = dt.Rows[0][4].ToString();
                    pdesTxt.Text = dt.Rows[0][5].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Id')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Enter Project Id Please  ')</script>");
            }
        }
        public void delte(object sender, EventArgs e)
        {

            if (Pid.Text != "") {

                SqlCommand cmd = new SqlCommand("delete from tblAgencies where agencyId=@agencyId", con);
                cmd.Parameters.AddWithValue("@agencyId", Pid.Text);
                cmd.ExecuteNonQuery();
                Response.Write("<script type=\"text/javascript\">alert('Agency Deleted');location.href='viewAgencies.aspx'</script>");

            }

        }
    }
}