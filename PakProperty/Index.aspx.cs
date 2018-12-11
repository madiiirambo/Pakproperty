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
    public partial class Index : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            con.Open();
            if (!IsPostBack)
            {
                loadImage();
                viewFeaturedDetails();
                viewCustomers();
                viewPop();
                viewCounter();
            }
        }
        public void loadImage()
        {

            SqlCommand cmd = new SqlCommand("select imageData from tblPartners", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {



                StringBuilder html = new StringBuilder();
                for (int i = 1; i < dt.Rows.Count; i++)
                {



                    string a = "data:Image/png;base64," + Convert.ToBase64String((byte[])dt.Rows[i][0]);
                  

                    html.Append("<div class=\"owl-item\">");
                    html.Append("<img ID=\"Image\"" + i + " src=\"" + a + "\"/>");

                    html.Append("</div>");

                    
                }
                PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
            }


        }
        public void viewFeaturedDetails()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("propertyId", typeof(string));
            dt.Columns.Add("coverImage", typeof(string));
            dt.Columns.Add("propertyName", typeof(string));
            dt.Columns.Add("propertyAddress", typeof(string));
            dt.Columns.Add("propertyCity", typeof(string));
            dt.Columns.Add("propertyCountry", typeof(string));
            dt.Columns.Add("propertyMin", typeof(string));
            dt.Columns.Add("propertyMax", typeof(string));
            dt.Columns.Add("propertyBeds", typeof(string));
            dt.Columns.Add("propertyBaths", typeof(string));
            dt.Columns.Add("propertyBalcony", typeof(string));
            dt.Columns.Add("propertySquareft", typeof(string));

            

            SqlCommand cmd = new SqlCommand("select * from tblAddFeaturedPropertiesBasic", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable datatable = new DataTable();
            sda.Fill(datatable);
            if(datatable.Rows.Count>0)
            {
                for (int i = 0; i < datatable.Rows.Count; i++)
                {
                    dt.Rows.Add(datatable.Rows[i][0], "data:Image/png;base64," + Convert.ToBase64String((byte[])datatable.Rows[i][1]),datatable.Rows[i][2], datatable.Rows[i][3], datatable.Rows[i][5], datatable.Rows[i][6], datatable.Rows[i][7], datatable.Rows[i][8], datatable.Rows[i][9], datatable.Rows[i][10], datatable.Rows[i][13], datatable.Rows[i][14]);
                }
            }
            rptBasic.DataSource = dt;
            rptBasic.DataBind();
        }
        public void viewCustomers()
        {
            DataTable data = new DataTable();
            data.Columns.Add("customerName", typeof(string));
            data.Columns.Add("customerDescription", typeof(string));
            data.Columns.Add("customerImage", typeof(string));

            SqlCommand cmd = new SqlCommand("select * from tblHappyCustomers", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                data.Rows.Add(dt.Rows[i][1].ToString(), dt.Rows[i][2].ToString(), "data:Image/png;base64," + Convert.ToBase64String((byte[])dt.Rows[i][3]));
            }
            rptHappyCustomer.DataSource = data;
            rptHappyCustomer.DataBind();

        }
        public void getAllAdd(object sender, EventArgs e)
        {
            if (autocomplete.Text != "")
            {

                SqlCommand cmd = new SqlCommand("select propertyId,pp,pt,cover,address,bed,bath,sq,garage,price,FORMAT(postdate,'MMM dd yyyy') as postedate,userName,proty,coverlink from tblAdds join tblUsersData on tblAdds.userId=tblUsersData.userId where approved=@approved and address like @address and sc like @sc and pp like @pp and pt like @pt and expdate between GETDATE() and  expdate order by case proty when 'Diamond'  then 1 when 'Gold' then 2 when 'Free' then 3 end", con);
                string abc = string.Empty;
                string[] xyz = autocomplete.Text.ToString().Split(',');
                for (int i = 0; i < xyz.Length; i++)
                {
                    if (xyz[i + 1].Equals(" Pakistan"))
                    {
                        break;
                    }
                    else
                    {
                        if (i == 0)
                        {
                            abc = xyz[i];
                        }
                        else
                        {
                            abc += ',' + xyz[i];
                        }

                    }
                }


                cmd.Parameters.AddWithValue("@approved", "true");
                cmd.Parameters.AddWithValue("@address", "%" + abc + "%");
                cmd.Parameters.AddWithValue("@sc", "%" + ddcities.SelectedItem.Text + "%");
                cmd.Parameters.AddWithValue("@pp", "%" + ddpurpose.SelectedItem.Text + "%");
                cmd.Parameters.AddWithValue("@pt", "%" + ddtype.SelectedItem.Text + "%");
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                Session["dt"] = dt;
                Session["b"] = "0";
                Response.Redirect("Properties.aspx");
            }
            else
            {
                SqlCommand cmd = new SqlCommand("select propertyId,pp,pt,cover,address,bed,bath,sq,garage,price,FORMAT(postdate,'MMM dd yyyy') as postedate,userName,proty,coverlink from tblAdds join tblUsersData on tblAdds.userId=tblUsersData.userId where approved=@approved and sc like @sc and pp like @pp and pt like @pt and expdate between GETDATE() and  expdate order by case proty when 'Diamond'  then 1 when 'Gold' then 2 when 'Free' then 3 end", con);
                cmd.Parameters.AddWithValue("@approved", "true");
                cmd.Parameters.AddWithValue("@sc", "%" + ddcities.SelectedItem.Text + "%");
                cmd.Parameters.AddWithValue("@pp", "%" + ddpurpose.SelectedItem.Text + "%");
                cmd.Parameters.AddWithValue("@pt", "%" + ddtype.SelectedItem.Text + "%");
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                Session["dt"] = dt;
                Response.Redirect("Properties.aspx");
            }
        }
        protected void getProperty(object sender, EventArgs e)
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

                        Response.Write("<script type=\"text/javascript\">alert('Invalid Id Property')</script>");
                        TextBox1.Text = string.Empty;
                    }
                }
            }
        
        public void viewPop()
        {
            SqlCommand cmd = new SqlCommand("select * from tblPopupAdds", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            var rand = new Random();


            var result = dt.AsEnumerable().OrderBy(r => rand.Next());

            DataRow dr1;

            dr1 = result.First();
            pop.ImageUrl = "data:Image/png;base64," + Convert.ToBase64String((byte[])dr1[2]);
        }
        public void viewCounter()
        {
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) as Total ,'ActiveAdds' AS TableSource  FROM tblAdds where expdate between GETDATE() and expdate UNION select COUNT(*) as Total, 'Users' AS TableSource from tblUsersData union select count(*) as Total, 'Agencies' as TableSource from tblAgencies union select count(*) as Total, 'Partners' as TableSource from tblPartners", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if(dt.Rows[i][1].ToString().Equals("ActiveAdds"))
                {
                    adds.Text = dt.Rows[i][0].ToString();
                }
               else if (dt.Rows[i][1].ToString().Equals("Users"))
                {
                    users.Text = dt.Rows[i][0].ToString();
                }
                else if (dt.Rows[i][1].ToString().Equals("Agencies"))
                {
                    agencies.Text = dt.Rows[i][0].ToString();
                }
                else if(dt.Rows[i][1].ToString().Equals("Partners"))
                {
                    partners.Text = dt.Rows[i][0].ToString();
                }
            }
        }
    }
}