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
    public partial class DeletePopupAdds : System.Web.UI.Page
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
            if (Pid.Text != "")
            {
                SqlCommand cmd = new SqlCommand("select * from tblPopupAdds where popupId = @popupId", con);
                cmd.Parameters.AddWithValue("@popupId", Pid.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Pid.Text = dt.Rows[0][0].ToString();
                    Pname.Text = dt.Rows[0][1].ToString();
                    Pid.ReadOnly = true;
                    Pname.ReadOnly = true;

                }
                else
                {
                    Response.Write("<script>alert('Popup Id Invalid')</script>");
                    Pid.Text = string.Empty;
                    Pname.Text = string.Empty;
                }
            }
            else
            {
                Response.Write("<script>alert('Enter Popup Id ')</script>");
            }

        }
        protected void delete(object sender, EventArgs e)
        {
            if (Pid.Text != "")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from tblPopupAdds where popupId = @popupId", con);
                cmd.Parameters.AddWithValue("@popupId", Pid.Text);
                cmd.ExecuteNonQuery();
                Response.Write("<script type=\"text/javascript\">alert('Delete');location.href='ViewPopup.aspx'</script>");
                Pid.Text = "";
                Pname.Text = "";
                Pid.ReadOnly = false;
                Pname.ReadOnly = false;

            }
            else
            {
                Response.Write("<script>alert('Enter Id')</script>");
            }
        }
    }
}