using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PakProperty
{
    public partial class SendAllSms : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            con.Open();
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Session["admin"] as string))
                {

                    HttpWebRequest request = WebRequest.Create("http://paigam.pk/SMSApi/GetBalance.aspx?username=Pakproperty&password=HumaKainat") as HttpWebRequest;
                    // Get response  
                    using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                    {
                        // Get the response stream  
                        StreamReader reader = new StreamReader(response.GetResponseStream());
                        mm.Text  = reader.ReadLine();

                        // Console application output  
                    }



                    SqlCommand cmd = new SqlCommand("select * from tblContactCategories", con);

                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        ddcontacts.DataTextField = "name";
                        ddcontacts.DataValueField = "id";
                        ddcontacts.DataSource = dt;
                        ddcontacts.DataBind();
                        ddcontacts.Items.Insert(0, new ListItem("--Select--", "0"));
                    }
                
                else
                {
                    Response.Redirect("LoginAdminPanel.aspx");
                }
            }
        }
        protected void sendSms(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select number from tblContacts where cateId=@cateId", con);
            cmd.Parameters.AddWithValue("@cateId", ddcontacts.SelectedValue);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if(dt.Rows.Count > 0)
            {


                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    //HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create("http://paigam.pk/SMSApi/SendSMS.aspx?username=Pakproperty&password=HumaKainat&number=" + dt.Rows[i][0].ToString() + "&msg=" + msg.Text);

                    //HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
                    //System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
                    //string responseString = respStreamReader.ReadToEnd();
                    //respStreamReader.Close();
                    //myResp.Close();

                }
            }
            Response.Write("<script type=\"text/javascript\">alert('Message Send !');location.href='Dashboard.aspx'</script>");
        }
        protected void totalNum(object sender, EventArgs e)
        {

            if (this.IsPostBack)
            {
               if(ddcontacts.SelectedValue.Equals("42"))
                {
                    SqlCommand cmd = new SqlCommand("select userPhone from tblUsersData", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        lat.Text = dt.Rows.Count.ToString();
                    }
                    else
                    {
                        lat.Text = 0.ToString();
                    }
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("select * from tblContacts where cateId=@cateId", con);
                    cmd.Parameters.AddWithValue("@cateId", ddcontacts.SelectedValue);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        lat.Text = dt.Rows.Count.ToString();
                    }
                    else
                    {
                        lat.Text = 0.ToString();
                    }
                }
            }
        }
    }
}