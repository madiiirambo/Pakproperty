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
    public partial class UpdateAdd : System.Web.UI.Page
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
        public void viewData(object sender, EventArgs e)
        {
            if(Pid.Text != "")
            {
                SqlCommand cmd = new SqlCommand("Select * from tblAdds where propertyId = @propertyId", con);
                cmd.Parameters.AddWithValue("@propertyid", Pid.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if(dt.Rows.Count > 0)
                {
                    lat.Text = dt.Rows[0][2].ToString();
                    lng.Text = dt.Rows[0][3].ToString();
                    ddpurpose.SelectedItem.Text = dt.Rows[0][4].ToString();
                    ddtype.SelectedItem.Text = dt.Rows[0][5].ToString();
                    ddcities.SelectedItem.Text = dt.Rows[0][6].ToString();
                    countryTxt.Text = dt.Rows[0][7].ToString();
                    status.SelectedItem.Text = dt.Rows[0][8].ToString();
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
        public void update(object sender, EventArgs e)
        {
            

            if(xpDate.SelectedItem.Text == "")
            {
                SqlCommand cmd = new SqlCommand("update tblAdds set pp=@pp,pt=@pt,sc=@sc,proty=@proty,des=@des,address=@address,bed=@bed,bath=@bath,garage=@garage,kitchen=@kitchen,balconey=@balconey,sq=@sq,price=@price,features=@features,videolink=@videolink where propertyId=@propertyId", con);
                cmd.Parameters.AddWithValue("@propertyId", Pid.Text);
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
                Response.Write("<script type=\"text/javascript\">alert('Your Add Updated ');location.href='ViewAllPropertyAdds.aspx'</script>");
            }
            else
            {
                SqlCommand cmd = new SqlCommand("update tblAdds set pp=@pp,pt=@pt,sc=@sc,proty=@proty,des=@des,address=@address,bed=@bed,bath=@bath,garage=@garage,kitchen=@kitchen,balconey=@balconey,sq=@sq,price=@price,features=@features,videolink=@videolink where propertyId=@propertyId", con);
                cmd.Parameters.AddWithValue("@propertyId", Pid.Text);
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

                string[] words = xpDate.SelectedItem.Text.Split(' ');
                SqlCommand cmd1 = new SqlCommand("UPDATE tblAdds set expdate=(DateADD(DAY,@n,GETDATE())) WHERE propertyId=@propertyId", con);
                cmd1.Parameters.AddWithValue("@propertyId", Pid.Text);
                cmd1.Parameters.AddWithValue("@n", Convert.ToInt32(words[0]));
                cmd1.ExecuteNonQuery();
                Response.Write("<script type=\"text/javascript\">alert('Your Add Updated ');location.href='ViewAllPropertyAdds.aspx'</script>");
            }





        }
    }
}