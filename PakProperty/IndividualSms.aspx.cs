using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PakProperty
{
    public partial class IndividualSms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
                        mm.Text = reader.ReadLine();

                        // Console application output  
                    }
                }
                else
                {
                    Response.Redirect("LoginAdminPanel.aspx");
                }
            }
            }
        protected void sendSms(object sender , EventArgs e)
        {
            HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create("http://paigam.pk/SMSApi/SendSMS.aspx?username=Pakproperty&password=HumaKainat&number=" + number.Text + "&msg=" + msg.Text);

            HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
            System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
            string responseString = respStreamReader.ReadToEnd();
            respStreamReader.Close();
            myResp.Close();

            Response.Write("<script type=\"text/javascript\">alert('Message Send !');location.href='Dashboard.aspx'</script>");
        }
        }
}