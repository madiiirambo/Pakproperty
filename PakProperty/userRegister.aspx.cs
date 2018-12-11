using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PakProperty
{
    public partial class userRegister : System.Web.UI.Page
    {
        SqlConnection con;
    
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            con.Open();
            if (!IsPostBack)
            {
                Label1.Visible = false;
                code.Visible = false;
                Button3.Visible = false;
            }
        }
        public void addUser(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select * from tblUsersData where userPhone=@userPhone", con);
            cmd.Parameters.AddWithValue("@userPhone", phtxt.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Response.Write("<script>alert('This Phone Number Already Register')</script>");

            }
            else
            {


                if (nameTxt.Text != "" && emailtxt.Text != "" && passtxt.Text != "" && contxt.Text != "" && phtxt.Text != "" && !cities.SelectedValue.Equals(-1))
                {

                    if (checkBox.Checked)
                    {

                        Random rand = new Random();
                        Session["pin"] = rand.Next(10000, 1000000);
                        string message = "Welcome To Pakproperty Your Pin is: " +Session["pin"].ToString();

                        HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create("http://paigam.pk/SMSApi/SendSMS.aspx?username=Pakproperty&password=HumaKainat&number="+phtxt.Text+"&msg="+message);
                       
                        HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
                        System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
                        string responseString = respStreamReader.ReadToEnd();
                        respStreamReader.Close();
                        myResp.Close();

                        visible();

                    }

                    else
                    {
                        Response.Write("<script>alert('Please Check The Terms And Condition')</script>");

                    }
                }
                else
                {
                    Response.Write("<script>alert('Missing Fields')</script>");

                }
            }
        }

        protected void contxt_TextChanged(object sender, EventArgs e)
        {


            if (contxt.Text != "")
            {
                if (passtxt.Text == contxt.Text)
                {
                    Label1.Visible = true;
                    Label1.Text = "Password match";
                }
                else
                {
                    Label1.Visible = true;
                    Label1.Text = "Password not match";
                }
            }
            else
            {
                Label1.Visible = false;
            }

        }
        public void getProperty(object sender, EventArgs e)
        {
            if (TextBox1.Text != "")
            {

                SqlCommand cmd = new SqlCommand("select * from tblAdds where propertyId=@propertyId", con);
                cmd.Parameters.AddWithValue("@propertyId", TextBox1.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Response.Redirect("AddDetails.aspx?id=" + Convert.ToInt32(dt.Rows[0][0]));
                }
                else
                {

                    Response.Write("<script type=\"text/javascript\">alert('Invalid Id Property');location.href='userRegister.aspx'</script>");

                }
            }
        }
        public void visible()
        {
            nameTxt.Visible = false;
            emailtxt.Visible = false;
            passtxt.Visible = false;
            contxt.Visible = false;
            phtxt.Visible = false;
            Label1.Visible = false;
            Button1.Visible = false;
            cities.Visible = false;
            checkBox.Visible = false;
            abc.Visible = false;
            code.Visible = true;
            Button3.Visible = true;
        }

        public void enterCode(object sender, EventArgs e)
        {
            if (Session["pin"].ToString() == code.Text)
            {
                SqlCommand command = new SqlCommand("insert into tblUsersData (userName,userEmail,userPass,userConpass,userPhone,userCity,free,gold,diamond,indgold,inddia) values (@userName,@userEmail,@userPass,@userConpass,@userPhone,@userCity,@free,@gold,@diamond,@indgold,@inddia)", con);
                command.Parameters.AddWithValue("@userName", nameTxt.Text);
                command.Parameters.AddWithValue("@userEmail", emailtxt.Text);
                command.Parameters.AddWithValue("@userPass", passtxt.Text);
                command.Parameters.AddWithValue("@userConpass", contxt.Text);
                command.Parameters.AddWithValue("@userPhone", phtxt.Text);
                command.Parameters.AddWithValue("@userCity", cities.SelectedItem.Text);
                command.Parameters.AddWithValue("@free", 5);
                command.Parameters.AddWithValue("@gold", 0);
                command.Parameters.AddWithValue("@diamond", 0);
                command.Parameters.AddWithValue("@indgold", 0);
                command.Parameters.AddWithValue("@inddia", 0);
                command.ExecuteNonQuery();
                
                Response.Write("<script type=\"text/javascript\">alert('Your Account Created Is Scucessfully Please Login');location.href='Login.aspx'</script>");

  
            }
            else
            {
                Response.Write("<script>alert('Invalid Code')</script>");
            }
        }
    }
}