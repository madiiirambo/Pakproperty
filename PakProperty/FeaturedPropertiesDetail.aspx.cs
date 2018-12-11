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
    public partial class FeaturedPropertiesDetail : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            con.Open();
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int blogId = Convert.ToInt32(Request.QueryString["id"]);

                    
                    viewData(blogId);
                    viewImages(blogId);
                    viewType(blogId);
                    viewFeatures(blogId);
                    viewImagesLocation(blogId);
                    viewagents(blogId);
                    viewBookingOffice(blogId);
                }
            }
        }
        public void viewData(int id)

        { 
            string description = string.Empty;
            SqlCommand cmd = new SqlCommand("select * from tblAddFeaturedPropertiesBasic where propertyId = @propertyId ", con);
            cmd.Parameters.AddWithValue("@propertyId", id);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            namePropertyTxt.Text = dt.Rows[0][2].ToString();
            description = dt.Rows[0][4].ToString();
            locationText.Text = dt.Rows[0][3].ToString() + "<br/>" + dt.Rows[0][5].ToString() + " , " + dt.Rows[0][6].ToString();
            Minprice.Text = dt.Rows[0][7].ToString();
            Maxprice.Text = dt.Rows[0][8].ToString();
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
            SqlCommand cmd = new SqlCommand("select imageData from tblAddFeaturedPropertiesImages where propertyId = @propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId", id);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            html.Append("<li data-target=\"#carouselExampleIndicators\"data-slide-to=\"0\"class=\"active\"></li>");
            
            for (int i = 1; i <= dt.Rows.Count; i++)
            {

                html.Append("<li data-target=\"#carouselExampleIndicators\"data-slide-to=\""+i+"\"></li>");
                

                // data.Rows.Add("data:Image/png;base64," + Convert.ToBase64String((byte[])dt.Rows[i][0]));
            }
            PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });


            StringBuilder html1 = new StringBuilder();
            html1.Append("<div class=\"carousel-item active\">");
            string a = "data:Image/png;base64," + Convert.ToBase64String((byte[])dt.Rows[0][0]);
            html1.Append("<img class=\"d-block img-fluid\" src=\""+a+"\">");
            html1.Append("</div>");

            for (int k = 1; k < dt.Rows.Count; k++)
            {
                string b = "data:Image/png;base64," + Convert.ToBase64String((byte[])dt.Rows[k][0]);
                html1.Append("<div class=\"carousel-item\">");
                html1.Append("<img class=\"d-block img-fluid\" src=\"" + b + "\">");
                html1.Append("</div>");

            }
            PlaceHolder2.Controls.Add(new Literal { Text = html1.ToString() });
        }
        public void viewType(int id)
        {
            SqlCommand cmd = new SqlCommand("select * from tblAddFeaturedPropertiesType where propertyId = @propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId", id);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rptType.DataSource = dt;
            rptType.DataBind();
        }
        public void viewFeatures(int id)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("features", typeof(string));
            SqlCommand cmd = new SqlCommand("select * from tblAddFeaturedPropertiesFeatures where propertyId = @propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId", id);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt1 = new DataTable();
            sda.Fill(dt1);
            string[] abc = dt1.Rows[0][1].ToString().Split(',');
            for (int i = 0; i < abc.Length; i++)
            {
                dt.Rows.Add(abc[i]);
            }
            rptFeatures.DataSource = dt;
            rptFeatures.DataBind();




        }
        public void viewImagesLocation(int id)
        {

            DataTable datatable = new DataTable();
            datatable.Columns.Add("ppImage", typeof(string));

            SqlCommand cmd = new SqlCommand("select * from tblAddFeaturedPropertiesPPImages where propertyId = @propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId", id);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                datatable.Rows.Add("data:Image/png;base64," + Convert.ToBase64String((byte[])dt.Rows[i][1]));
            }

            rptppImg.DataSource = datatable;
            rptppImg.DataBind();


            SqlCommand cmd1 = new SqlCommand("select * from tblAddFeaturedPropertiesLocation where propertyId = @propertyId", con);
            cmd1.Parameters.AddWithValue("@propertyId", id);
            SqlDataAdapter sda1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);
            string a = dt1.Rows[0][1].ToString();
            StringBuilder html = new StringBuilder();
            html.Append("<iframe "+a);
            html.Append("></iframe>");
            PlaceHolder3.Controls.Add(new Literal { Text = html.ToString() });





        }
        public void viewagents(int id)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Id", typeof(string));
            dt.Columns.Add("propertyId", typeof(string));
            dt.Columns.Add("agentname", typeof(string));
            dt.Columns.Add("agentmob", typeof(string));
            dt.Columns.Add("agentfblink", typeof(string));
            dt.Columns.Add("agentimg", typeof(string));


            SqlCommand cmd = new SqlCommand("select * from tblAddFeaturedPropertiesAgents where propertyId = @propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId", id);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable data = new DataTable();
            sda.Fill(data);
            for (int i = 0; i < data.Rows.Count; i++)
            {
                dt.Rows.Add(data.Rows[i][0], data.Rows[i][1], data.Rows[i][2], data.Rows[i][3], data.Rows[i][4], "data:Image/png;base64," + Convert.ToBase64String((byte[])data.Rows[i][5]));
            }

            rptagents.DataSource = dt;
            rptagents.DataBind();

        }
        public void viewBookingOffice(int id)
        {
            SqlCommand cmd = new SqlCommand("select * from tblAddFeaturedPropertiesOffice where propertyId=@propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId", id);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            bname.Text = dt.Rows[0][1].ToString();
            baddress.Text = dt.Rows[0][2].ToString();
            bnum.Text = dt.Rows[0][3].ToString();
            bnum1.Text = dt.Rows[0][4].ToString();
            bnum2.Text = dt.Rows[0][5].ToString();

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

                Response.Write("<script type=\"text/javascript\">alert('Invalid Id Property');location.href='FeaturedPropertiesDetail.aspx'</script>");

            }
        }

    }
}