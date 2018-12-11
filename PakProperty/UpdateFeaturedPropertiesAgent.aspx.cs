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
    public partial class UpdateFeaturedPropertiesAgent : System.Web.UI.Page
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



        public void viewData(int id)
        {
            string description = string.Empty;
            SqlCommand cmd = new SqlCommand("select * from tblAddFeaturedPropertiesAgents where id = @id ", con);
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            agpid.Text = dt.Rows[0][0].ToString();
            agentName.Text = dt.Rows[0][2].ToString();
            agentMob.Text = dt.Rows[0][3].ToString();
            fblink.Text = dt.Rows[0][4].ToString();
            
        }
        public void update(object sender, EventArgs e)
        {


            if (agpid.Text != "" && agentName.Text != "" && agentMob.Text != "" && fblink.Text != "")
            {
                SqlCommand cmd = new SqlCommand("update tblAddFeaturedPropertiesAgents set agentname=@agentname,agentmob=@agentmob,agentfblink=@agentfblink where id=@id", con);
                cmd.Parameters.AddWithValue("@id", agpid.Text);
                cmd.Parameters.AddWithValue("@agentname", agentName.Text);
                cmd.Parameters.AddWithValue("@agentmob", agentMob.Text);
                cmd.Parameters.AddWithValue("@agentfblink", fblink.Text);
                cmd.ExecuteNonQuery();
                Response.Write("<script type=\"text/javascript\">alert('Updated');location.href='ViewFeaturedPropertiesAgents.aspx'</script>");

                
            }
            else
            {
                Response.Write("<script>alert('Missing Data')</script>");
            }
        }

    }
}