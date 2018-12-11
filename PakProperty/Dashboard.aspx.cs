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
    public partial class Dashboard : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            con.Open();

            if (!string.IsNullOrEmpty(Session["admin"] as string))
            {

  
                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {

                    if (Request.QueryString["id"].Contains("up"))
                    {
                        string temp = Request.QueryString["id"].Replace("up", "");
                        update(Convert.ToInt32(temp));
                    }
                    else if (Request.QueryString["id"].Contains("del"))
                    {
                        string temp = Request.QueryString["id"].Replace("del", "");
                        delete(Convert.ToInt32(temp));

                    }

                }

                viewNumber();

                SqlCommand cmd = new SqlCommand("select propertyId,userName,proty,price from tblAdds join tblUsersData on tblAdds.userId=tblUsersData.userId where tblAdds.approved = @approved", con);
                cmd.Parameters.AddWithValue("@approved", "false");
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                rptBasic.DataSource = dt;
                rptBasic.DataBind();
            }
            else
            {
                Response.Redirect("LoginAdminPanel.aspx");
            }


        }
        public void update(int id)
        {
            SqlCommand cmd = new SqlCommand("update tblAdds set approved=@approved where propertyId=@propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId", id);
            cmd.Parameters.AddWithValue("@approved", "true");
            cmd.ExecuteNonQuery();
        }
        public void delete(int id)
        {
            SqlCommand cmd;
            cmd = new SqlCommand("delete from tblAdds  where propertyId=@propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId", id);
            cmd.ExecuteNonQuery();
            cmd = new SqlCommand("delete from tblAddImages  where propertyId=@propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId", id);
            cmd.ExecuteNonQuery();
        }
        public void viewNumber()
        {
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) as Total ,'ActiveAdds' AS TableSource  FROM tblAdds where expdate between GETDATE() and expdate UNION SELECT COUNT(*) as Total, 'ExpireAdds' AS TableSource   FROM tblAdds where expdate between expdate and GETDATE() UNION select COUNT(*) as Total, 'Users' AS TableSource from tblUsersData union select COUNT(*) as Total, 'AllAdds' AS TableSource from tblAdds", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if(dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if(dt.Rows[i][1].ToString() == "ActiveAdds")
                    {
                        runningAdds.Text = dt.Rows[i][0].ToString();
                    }
                    else if (dt.Rows[i][1].ToString() == "ExpireAdds")
                    {
                         totalExpireAdds.Text = dt.Rows[i][0].ToString();
                    }
                    else if (dt.Rows[i][1].ToString() == "Users")
                    {
                        totalUserss.Text = dt.Rows[i][0].ToString();
                    }
                    else if (dt.Rows[i][1].ToString() == "AllAdds")
                    {
                        totalAdds.Text = dt.Rows[i][0].ToString();
                    }

                }
            }

        }
    }
}