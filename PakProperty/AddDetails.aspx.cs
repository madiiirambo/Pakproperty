using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PakProperty
{
    public partial class AddDetails : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            con.Open();
            if (!IsPostBack)
            {
                //latitude.Value = Convert.ToString(24.9297262);
                //longitude.Value = Convert.ToString(67.12564480000003);
                // if (Request.QueryString["id"] != null)
                //   {
                 int addId = Convert.ToInt32(Request.QueryString["id"]);
                


                    viewData(addId);
                    viewImages(addId);
                    viewFeatures(addId);


                
            }
        }
        public void getProperty(object sender, EventArgs e)
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

                Response.Write("<script type=\"text/javascript\">alert('Invalid Id Property');location.href='AddDetails.aspx'</script>");

            }
        }
        public void viewData(int id)

        {
            string description = string.Empty;
            SqlCommand cmd = new SqlCommand("select * from tblAdds where propertyId = @propertyId ", con);
            cmd.Parameters.AddWithValue("@propertyId", id);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            viewPropertyInfo(Convert.ToInt16(dt.Rows[0][1]),id);
            latitude.Value = Convert.ToString(dt.Rows[0][2].ToString());
            longitude.Value = Convert.ToString(dt.Rows[0][3].ToString());
            description = dt.Rows[0][11].ToString();
            locationText.Text = dt.Rows[0][12].ToString() + "<br/>" + dt.Rows[0][6].ToString() + " , " + dt.Rows[0][7].ToString();
            price.Text = dt.Rows[0][19].ToString();
            type.Text = dt.Rows[0][4].ToString();
           
            string[] test1 = description.Split(new string[] { "\n" }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < test1.Length; i++)
            {

                des.Text = des.Text + test1[i] + "<br />";
            }
            rptBasic.DataSource = dt;
            rptBasic.DataBind();
        }
        public void viewImages(int id)
        {
            StringBuilder html = new StringBuilder();
            DataTable data = new DataTable();
            data.Columns.Add("imageData", typeof(string));
            SqlCommand cmd = new SqlCommand("select image,link from tblAddImages where propertyId = @propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId", id);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            html.Append("<li data-target=\"#carouselExampleIndicators\"data-slide-to=\"0\"class=\"active\"></li>");

            for (int i = 1; i <= dt.Rows.Count - 1; i++)
            {

                html.Append("<li data-target=\"#carouselExampleIndicators\"data-slide-to=\"" + i + "\"></li>");


                // data.Rows.Add("data:Image/png;base64," + Convert.ToBase64String((byte[])dt.Rows[i][0]));
            }
            PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });

            StringBuilder html1 = new StringBuilder();

            try
            {



                string a = "data:Image/png;base64," + Convert.ToBase64String((byte[])dt.Rows[0][0]);
                html1.Append("<div class=\"carousel-item active\">");
                // string a = "/FrontEnd/assests/images/Logo/abad-logo.png";
                html1.Append("<img class=\"d-block img-fluid\" src=\"" + a + "\">");
                html1.Append("</div>");

                for (int k = 1; k < dt.Rows.Count; k++)
                {
                    string b = "data:Image/png;base64," + Convert.ToBase64String((byte[])dt.Rows[k][0]);
                    html1.Append("<div class=\"carousel-item\">");
                    html1.Append("<img class=\"d-block img-fluid\" src=\"" + b + "\">");
                    html1.Append("</div>");

                }
            }
            catch(Exception ex)
            {
                string a = "/FrontEnd/"+ dt.Rows[0][1].ToString();
                html1.Append("<div class=\"carousel-item active\">");



                // string a = "/FrontEnd/assests/images/Logo/abad-logo.png";
                html1.Append("<img class=\"d-block img-fluid\" src=\"" + a + "\">");
                html1.Append("</div>");

                for (int k = 1; k < dt.Rows.Count; k++)
                {
                    string b = "/FrontEnd/"+dt.Rows[k][1].ToString();
                    html1.Append("<div class=\"carousel-item\">");
                    html1.Append("<img class=\"d-block img-fluid\" src=\"" + b + "\">");
                    html1.Append("</div>");

                }
            }

               
            
            PlaceHolder2.Controls.Add(new Literal { Text = html1.ToString() });
        }

        public void viewFeatures(int id)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("features", typeof(string));
            SqlCommand cmd = new SqlCommand("select * from tblAdds where propertyId = @propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId", id);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt1 = new DataTable();
            sda.Fill(dt1);
            if(dt1.Rows[0][21].ToString() != "")
            {
                string[] abc = dt1.Rows[0][21].ToString().Split(',');
                for (int i = 0; i < abc.Length; i++)
                {
                    dt.Rows.Add(abc[i]);
                }
                rptFeatures.DataSource = dt;
                rptFeatures.DataBind();
            }




        }
        
       
        public void viewPropertyInfo(int id,int proid)
        {
            SqlCommand cmd = new SqlCommand("select propertyId,userName,userPhone from tblUsersData join tblAdds on tblUsersData.userId= tblAdds.userId where tblUsersData.userId = @userId And tblAdds.propertyId = @propertyId", con);
            cmd.Parameters.AddWithValue("@userId", id);
            cmd.Parameters.AddWithValue("@propertyId", proid);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            pid.Text = dt.Rows[0][0].ToString();
            ownername.Text = dt.Rows[0][1].ToString();
            bnum.Text = dt.Rows[0][2].ToString();


        }
    }
}