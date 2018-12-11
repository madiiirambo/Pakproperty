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
    public partial class UpdateFeaturedPropertiesOffice : System.Web.UI.Page
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
                    if (Request.QueryString["id"] != null)
                    {
                        int proId = Convert.ToInt32(Request.QueryString["id"]);
                        viewData(proId);
                    }
                }
            }
            else
            {
                Response.Redirect("LoginAdminPanel.aspx");
            }
        }
        protected void viewData(int id)
        {
            SqlCommand cmd = new SqlCommand("select * from tblAddFeaturedPropertiesOffice where propertyId = @propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId", id);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            probookId.Text = dt.Rows[0][0].ToString();
            OfficeNameTxt.Text = dt.Rows[0][1].ToString();
            baddTxt.Text = dt.Rows[0][2].ToString();
            tphtxt.Text = dt.Rows[0][3].ToString();
            tphtxt1.Text = dt.Rows[0][4].ToString();
            tphtxt2.Text = dt.Rows[0][5].ToString();

        }

        protected void update(object sender, EventArgs e)
        {
            if (probookId.Text != "" && OfficeNameTxt.Text != "" && baddTxt.Text != "" && tphtxt.Text != "" &&
               tphtxt1.Text != "" && tphtxt2.Text != "")
            {


                SqlCommand cmd = new SqlCommand("update tblAddFeaturedPropertiesOffice set offName=@offName,offAdd=@offAdd,offc=@offc,offc1=@offc1,offc2=@offc2 where propertyId=@propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId", probookId.Text);
            cmd.Parameters.AddWithValue("@offName", OfficeNameTxt.Text);
            cmd.Parameters.AddWithValue("@offAdd", baddTxt.Text);
            cmd.Parameters.AddWithValue("@offc", tphtxt.Text);
            cmd.Parameters.AddWithValue("@offc1", tphtxt1.Text);
            cmd.Parameters.AddWithValue("@offc2", tphtxt2.Text);
            cmd.ExecuteNonQuery();
                Response.Write("<script type=\"text/javascript\">alert('Updated');location.href='ViewFeaturedProperties.aspx'</script>");

            }
            else
            {
                Response.Write("<script>alert('Missing Data')</script>");
            }
        }
    }
}