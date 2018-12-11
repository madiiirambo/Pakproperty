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

    public partial class UpdateUsers : System.Web.UI.Page
    {

        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            conn.Open();
            if(!this.IsPostBack)
            {

            }
        }
        protected void viewData(object sender, EventArgs e)
        {
            if(Pid.Text != "")
            {
                SqlCommand cmd = new SqlCommand("select * from tblUsersData where userId=@userId", conn);
                cmd.Parameters.AddWithValue("@userId", Pid.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                nametxt.Text = dt.Rows[0][1].ToString();
                emailtxt.Text = dt.Rows[0][2].ToString();
                pass.Text = dt.Rows[0][3].ToString();
                con.Text = dt.Rows[0][4].ToString();
                phone.Text = dt.Rows[0][5].ToString();
                text.Text = dt.Rows[0][6].ToString();
                free.Text = dt.Rows[0][7].ToString();
                gold.Text = dt.Rows[0][8].ToString();
                diamond.Text = dt.Rows[0][9].ToString();
                indgold.Text = dt.Rows[0][10].ToString();
                inddia.Text = dt.Rows[0][11].ToString();
                
            }
            else
            {
                Response.Write("<script>alert('Enter User Id ')</script>");
            }
        }
        protected void update(object sender, EventArgs e)
        {
            if(Pid.Text != "" && nametxt.Text != "" && emailtxt.Text != "" && pass.Text != "" && con.Text != "" &&
                phone.Text != "" && text.Text != "" && free.Text != "" && gold.Text != "" && diamond.Text != "" &&
                indgold.Text != "" && inddia.Text != "")
            {
                if(pass.Text == con.Text)
                {
                    SqlCommand cmd = new SqlCommand("update tblUsersData set userName=@userName,userEmail=@userEmail,userPass=@userPass,userConpass=@userConpass,userPhone=@userPhone,free=@free,gold=@gold,diamond=@diamond,indgold=@indgold,inddia=@inddia where userId = @userId", conn);
                    cmd.Parameters.AddWithValue("@userId", Pid.Text);
                    cmd.Parameters.AddWithValue("@userName", nametxt.Text);
                    cmd.Parameters.AddWithValue("@userEmail", emailtxt.Text);
                    cmd.Parameters.AddWithValue("@userPass", pass.Text);
                    cmd.Parameters.AddWithValue("@userConpass", con.Text);
                    cmd.Parameters.AddWithValue("@userPhone", phone.Text);
                    cmd.Parameters.AddWithValue("@userCity", text.Text);
                    cmd.Parameters.AddWithValue("@free", free.Text);
                    cmd.Parameters.AddWithValue("@gold", gold.Text);
                    cmd.Parameters.AddWithValue("@diamond", diamond.Text);
                    cmd.Parameters.AddWithValue("@indgold", indgold.Text);
                    cmd.Parameters.AddWithValue("@inddia", inddia.Text);
                    cmd.ExecuteNonQuery();
                    Response.Write("<script type=\"text/javascript\">alert('Update');location.href='ViewUsers.aspx'</script>");

                }
                else
                {
                    Response.Write("<script>alert('Pass Not Match Please Check')</script>");
                }



            }
            else
            {
                Response.Write("<script>alert('Missing field')</script>");
            }
        }
    }
}