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
    public partial class userUpdateAdd : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            con.Open();
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Session["id"] as string))
                {


                    if (Request.QueryString["id"].Contains("rep"))
                    {
                        string temp = Request.QueryString["id"].Replace("rep", "");
                        repost(Convert.ToInt32(temp));
                    }

                
                    else
                    {
                        lblName.Text = Session["name"].ToString();

                        int id = Convert.ToInt32(Request.QueryString["id"]);
                        SqlCommand cmd = new SqlCommand("select * from tblAdds where userId = @userId and propertyId = @propertyId", con);
                        cmd.Parameters.AddWithValue("@userId", Convert.ToInt32(Session["id"]));
                        cmd.Parameters.AddWithValue("@propertyId", id);
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        viewData(id);
                        if (dt.Rows.Count > 0)
                        {
                            if (dt.Rows[0][8].ToString().Equals("Free"))
                            {
                                videolink.Visible = false;
                                featuresTxt.Visible = false;
                                vl.Visible = false;
                                fl.Visible = false;
                            }
                            else if (dt.Rows[0][8].ToString().Equals("Gold"))
                            {
                                videolink.Visible = false;
                                vl.Visible = false;
                            }

                        }

                        else
                        {
                            Response.Redirect("userDashboard.aspx");
                        }
                    }
                }
                else
                {

                    Response.Redirect("Login.aspx");
                }
            }
       }    
        
        public void viewData(int id)
        {
            SqlCommand cmd = new SqlCommand("Select * from tblAdds where propertyId = @propertyId", con);
            cmd.Parameters.AddWithValue("@propertyid", id);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                lat.Text = dt.Rows[0][2].ToString();
                lng.Text = dt.Rows[0][3].ToString();
                ddpurpose.SelectedItem.Text = dt.Rows[0][4].ToString();
                ddtype.SelectedItem.Text = dt.Rows[0][5].ToString();
                ddcities.SelectedItem.Text = dt.Rows[0][6].ToString();
                countryTxt.Text = dt.Rows[0][7].ToString();
                status.SelectedItem.Text = dt.Rows[0][8].ToString();
                xpData.Text = dt.Rows[0][9].ToString();
                pdesTxt.Text = dt.Rows[0][11].ToString();
                addtxt.Text = dt.Rows[0][12].ToString();
                beds.Text = dt.Rows[0][13].ToString();
                baths.Text = dt.Rows[0][14].ToString();
                garage.Text = dt.Rows[0][15].ToString();
                kitchen.Text = dt.Rows[0][16].ToString();
                balcony.Text = dt.Rows[0][17].ToString();
                area.Text = dt.Rows[0][18].ToString();
                price.Text = dt.Rows[0][19].ToString();
                featuresTxt.Text = dt.Rows[0][21].ToString();
                videolink.Text = dt.Rows[0][22].ToString();

            }
        }
        protected void update(object sender, EventArgs e)
        {
            if (pdesTxt.Text != "" && beds.Text != "" && baths.Text != "" && garage.Text != "" && kitchen.Text != ""
                && balcony.Text != "" && addtxt.Text != "" && area.Text != "" && price.Text != "")
            {
                
                int id = Convert.ToInt32(Request.QueryString["id"]);
                SqlCommand cmd = new SqlCommand("update tblAdds set pp=@pp,pt=@pt,sc=@sc,proty=@proty,des=@des,address=@address,bed=@bed,bath=@bath,garage=@garage,kitchen=@kitchen,balconey=@balconey,sq=@sq,price=@price,features=@features,videolink=@videolink where propertyId=@propertyId", con);
                cmd.Parameters.AddWithValue("@propertyId", id);
                cmd.Parameters.AddWithValue("@pp", ddpurpose.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@pt", ddtype.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@sc", ddcities.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@proty", status.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@des", pdesTxt.Text);
                cmd.Parameters.AddWithValue("@address", addtxt.Text);
                cmd.Parameters.AddWithValue("@bed", beds.Text);
                cmd.Parameters.AddWithValue("@bath", baths.Text);
                cmd.Parameters.AddWithValue("@garage", garage.Text);
                cmd.Parameters.AddWithValue("@kitchen", kitchen.Text);
                cmd.Parameters.AddWithValue("@balconey", balcony.Text);
                cmd.Parameters.AddWithValue("@sq", area.Text);
                cmd.Parameters.AddWithValue("@price", price.Text);
                cmd.Parameters.AddWithValue("@features", featuresTxt.Text);
                cmd.Parameters.AddWithValue("@videolink", videolink.Text);
                cmd.ExecuteNonQuery();
                Response.Write("<script type=\"text/javascript\">alert('Your Add Updated ');location.href='userDashboard.aspx'</script>");
            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert('Missing Fields')");   
            }
        }
        protected void repost(int id)
        {
            SqlCommand cmd = new SqlCommand("select proty,free,gold,diamond,indgold,inddia,propertyId,FORMAT(expdate,'MMM dd yyyy') as expdate from tblAdds join tblUsersData on tblAdds.userId=tblUsersData.userId where propertyId = @propertyId and tblAdds.userId=@userId", con);
            cmd.Parameters.AddWithValue("@propertyId", id);
            cmd.Parameters.AddWithValue("@userId", Convert.ToInt32(Session["id"]));
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if(dt.Rows[0][0].Equals("Free") && Convert.ToInt32(dt.Rows[0][1]) >  0)

            {

                SqlCommand cmd1 = new SqlCommand("UPDATE tblAdds set expdate=(DateADD(MONTH,1,GETDATE())) WHERE propertyId=@propertyId", con);
                cmd1.Parameters.AddWithValue("@propertyId", id);
                cmd1.ExecuteNonQuery();

                SqlCommand cmd2 = new SqlCommand("update tblUsersData set free=free-1 where userId=@userId", con);
                cmd2.Parameters.AddWithValue("@userId", Convert.ToInt32(Session["id"]));
                cmd2.ExecuteNonQuery();
                Response.Write("<script type=\"text/javascript\">alert('Your Free Add Listed Sucessfully Expire After 1 Month');location.href='userDashboard.aspx'</script>");
            }
            else if (dt.Rows[0][0].Equals("Gold") && Convert.ToInt32(dt.Rows[0][2]) > 0)
            {
                SqlCommand cmd1 = new SqlCommand("UPDATE tblAdds set expdate=(DateADD(Year,1,GETDATE())) WHERE propertyId=@propertyId", con);
                cmd1.Parameters.AddWithValue("@propertyId", id);
                cmd1.ExecuteNonQuery();

                SqlCommand cmd2 = new SqlCommand("update tblUsersData set gold=gold-1 where userId=@userId", con);
                cmd2.Parameters.AddWithValue("@userId", Convert.ToInt32(Session["id"]));
                cmd2.ExecuteNonQuery();
                Response.Write("<script type=\"text/javascript\">alert('Your Gold Add Listed Sucessfully Expire After 1 Year');location.href='userDashboard.aspx'</script>");
            }
            else if (dt.Rows[0][0].Equals("Diamond") && Convert.ToInt32(dt.Rows[0][3]) > 0)
            {
                SqlCommand cmd1 = new SqlCommand("UPDATE tblAdds set expdate=(DateADD(Year,1,GETDATE())) WHERE propertyId=@propertyId", con);
                cmd1.Parameters.AddWithValue("@propertyId", id);
                cmd1.ExecuteNonQuery();

                SqlCommand cmd2 = new SqlCommand("update tblUsersData set diamond=diamond-1 where userId=@userId", con);
                cmd2.Parameters.AddWithValue("@userId", Convert.ToInt32(Session["id"]));
                cmd2.ExecuteNonQuery();
                Response.Write("<script type=\"text/javascript\">alert('Your DIamond Add Listed Sucessfully Expire After 1 Year');location.href='userDashboard.aspx'</script>");
            }
            else if (dt.Rows[0][0].Equals("Gold") && Convert.ToInt32(dt.Rows[0][4]) > 0)
            {
                SqlCommand cmd1 = new SqlCommand("UPDATE tblAdds set expdate=(DateADD(Week,1,GETDATE())) WHERE propertyId=@propertyId", con);
                cmd1.Parameters.AddWithValue("@propertyId", id);
                cmd1.ExecuteNonQuery();

                SqlCommand cmd2 = new SqlCommand("update tblUsersData set indgold=indgold-1 where userId=@userId", con);
                cmd2.Parameters.AddWithValue("@userId", Convert.ToInt32(Session["id"]));
                cmd2.ExecuteNonQuery();
                Response.Write("<script type=\"text/javascript\">alert('Your Individual Gold Add Listed Sucessfully Expire After 1 Week');location.href='userDashboard.aspx'</script>");
            }
            else if (dt.Rows[0][0].Equals("Diamond") && Convert.ToInt32(dt.Rows[0][5]) > 0)
            {
                SqlCommand cmd1 = new SqlCommand("UPDATE tblAdds set expdate=(DateADD(Week,1,GETDATE())) WHERE propertyId=@propertyId", con);
                cmd1.Parameters.AddWithValue("@propertyId", id);
                cmd1.ExecuteNonQuery();

                SqlCommand cmd2 = new SqlCommand("update tblUsersData set inddia=inddia-1 where userId=@userId", con);
                cmd2.Parameters.AddWithValue("@userId", Convert.ToInt32(Session["id"]));
                cmd2.ExecuteNonQuery();
                Response.Write("<script type=\"text/javascript\">alert('Your Individual Diamond Add Listed Sucessfully Expire After 1 Week');location.href='userDashboard.aspx'</script>");
            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert('You Have No Add Remaining Please Buy Package');location.href='userDashboard.aspx'</script>");
            }


        }
    }
}