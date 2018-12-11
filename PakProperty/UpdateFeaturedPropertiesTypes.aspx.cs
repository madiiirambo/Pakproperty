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
    public partial class UpdateFeaturedPropertiesTypes : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
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
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tblAddFeaturedPropertiesType where id = @id ", con);
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            pid.Text = dt.Rows[0][0].ToString();
            pid.ReadOnly = true;
            floorTxt.Text = dt.Rows[0][2].ToString();
            Min.Text = dt.Rows[0][3].ToString();
            Max.Text = dt.Rows[0][4].ToString();
            MinSq.Text = dt.Rows[0][5].ToString();
            MaxSq.Text = dt.Rows[0][6].ToString();
        }
        protected void update(object sender, EventArgs e )
        {
            if (pid.Text != "" && floorTxt.Text != "" && Min.Text != "" && Max.Text != "" && MinSq.Text != "" && MaxSq.Text != "")
            {


                con.Open();
            SqlCommand cmd = new SqlCommand("update tblAddFeaturedPropertiesType set fsname=@fsname,min=@min,max=@max,minsq=@minsq,maxsq=@maxsq where id=@id", con);
            cmd.Parameters.AddWithValue("@id", pid.Text);
            cmd.Parameters.AddWithValue("@fsname", floorTxt.Text);
            cmd.Parameters.AddWithValue("@min", Min.Text);
            cmd.Parameters.AddWithValue("@max", Max.Text);
            cmd.Parameters.AddWithValue("@minsq", MinSq.Text);
            cmd.Parameters.AddWithValue("@maxsq", MaxSq.Text);
            cmd.ExecuteNonQuery();

                Response.Write("<script type=\"text/javascript\">alert('Updated');location.href='ViewFeaturedPropertiesType.aspx'</script>");

                
            }
            else
            {
                Response.Write("<script>alert('Missing Data Fields')</script>");
            }


        }
    }
}