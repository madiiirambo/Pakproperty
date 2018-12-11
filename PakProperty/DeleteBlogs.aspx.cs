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
    public partial class DeleteBlogs : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
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
            con.Open();
            if (Pid.Text != "")
            {
                SqlCommand cmd = new SqlCommand("select * from tblBlog where blogId = @blogId", con);
                cmd.Parameters.AddWithValue("@blogId", Pid.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Pid.Text = dt.Rows[0][0].ToString();
                    titleText.Text = dt.Rows[0][1].ToString();
                    authorText.Text = dt.Rows[0][2].ToString();
                    desText.Text = dt.Rows[0][3].ToString();
                    Pid.ReadOnly = true;

                }
                else
                {
                    Response.Write("<script>alert('Partner Id Invalid')</script>");
                    Pid.Text = string.Empty;
                    titleText.Text = string.Empty;
                    authorText.Text = string.Empty;
                    desText.Text = string.Empty;
                }
            }
            else
            {
                Response.Write("<script>alert('Enter Blog Id ')</script>");
            }

        }
        protected void delete(object sender, EventArgs e)
        {
            if (Pid.Text != "")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from tblBlog where blogId = @blogId", con);
                cmd.Parameters.AddWithValue("@blogId", Pid.Text);
                cmd.ExecuteNonQuery();
                Response.Write("<script type=\"text/javascript\">alert('Deleted');location.href='ViewBlogs.aspx'</script>");
                Pid.Text = string.Empty;
                titleText.Text = string.Empty;
                authorText.Text = string.Empty;
                desText.Text = string.Empty;
                Pid.ReadOnly = false;


            }
            else
            {
                Response.Write("<script>alert('Enter Id')</script>");
            }
        }
    }
}