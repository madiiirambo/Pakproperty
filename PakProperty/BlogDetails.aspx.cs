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

    public partial class BlogDetails : System.Web.UI.Page
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
                    viewBlogDetails(blogId);
                    viewRecentBlogs();
                    updateView(blogId);
                    viewComments(blogId);
                }
                else
                {

                }
            }



            
        }
        public void viewBlogDetails(int id)
        {
            string description = string.Empty;
            SqlCommand cmd = new SqlCommand("SELECT blogId,blogTitle,authorName,blogDescription,blogDate,blogView,blogImage,FORMAT(blogDate, 'dd') as Date, FORMAT(blogDate, 'MMM') as Month from tblBlog where blogId = @blogId", con);
            cmd.Parameters.AddWithValue("@blogId", id);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            
            lblTitle.Text = dt.Rows[0][1].ToString();
            description = dt.Rows[0][3].ToString();
            string[] test1 = description.Split(new string[] { "\n" }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < test1.Length; i++)
            {

                des.Text = des.Text + test1[i] + "<br />";
            }
            lblview.Text = dt.Rows[0][5].ToString();
            img.ImageUrl = "data:Image/png;base64," + Convert.ToBase64String((byte[])dt.Rows[0][6]);
            date.Text = dt.Rows[0][7].ToString();
            month.Text = dt.Rows[0][8].ToString();
            lblauthor.Text = "Author Name : " + dt.Rows[0][2].ToString();


        }


        public void viewRecentBlogs()
        {
            DataTable data = new DataTable();
            data.Columns.Add("blogId", typeof(string));
            data.Columns.Add("blogTitle", typeof(string));
            data.Columns.Add("blogDate", typeof(string));
            data.Columns.Add("blogImage", typeof(string));



            SqlCommand cmd = new SqlCommand("SELECT Top 3 blogId,blogTitle,FORMAT(blogDate, 'MMMM dd yyyy') as blogDate,blogImage from tblBlog ORDER BY blogId DESC", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                data.Rows.Add(dt.Rows[i][0], dt.Rows[i][1], dt.Rows[i][2], "data:Image/png;base64," + Convert.ToBase64String((byte[])dt.Rows[i][3]));
            }
            rptResult.DataSource = data;
            rptResult.DataBind();
        }
        public void updateView(int id)
        {
            SqlCommand cmd = new SqlCommand("select blogView from tblBlog where blogId = @blogId", con);
            cmd.Parameters.AddWithValue("@blogId", id);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);




            SqlCommand cmd1 = new SqlCommand("update tblBlog set blogView = @blogView where blogId = @blogId", con);
            cmd1.Parameters.AddWithValue("@blogId", id);
            cmd1.Parameters.AddWithValue("@blogView", Convert.ToInt16(dt.Rows[0][0])+1);
            cmd1.ExecuteNonQuery();
        }
        public void addComment(object sender, EventArgs e)
        {
            if(name.Text != "" && email.Text != "" && textMsg.Text != "")
            {
                SqlCommand cmd = new SqlCommand("insert into blogComments (blogId,pname,email,comment,date) values (@blogId,@pname,@email,@comment,@date)", con);
                cmd.Parameters.AddWithValue("@blogId", Convert.ToInt32(Request.QueryString["id"]));
                cmd.Parameters.AddWithValue("@pname", name.Text);
                cmd.Parameters.AddWithValue("@email", email.Text);
                cmd.Parameters.AddWithValue("@comment", textMsg.Text);
                cmd.Parameters.AddWithValue("@date", DateTime.Now.ToString());
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('ThankYou For Your Comment')</script>");
                Response.Redirect("BlogDetails.aspx?id="+Convert.ToInt32(Request.QueryString["id"]));
                
            }
            else
            {
                Response.Write("<script>alert('Missing Feilds')</script>");
            }
        }
        public void viewComments(int id)
        {
            SqlCommand cmd = new SqlCommand("select pname,email,comment,FORMAT(date, 'MMM dd yyyy') as date from blogComments where blogId =@blogId", con);
            cmd.Parameters.AddWithValue("@blogId", id);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rptComment.DataSource = dt;
            rptComment.DataBind();
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

                Response.Write("<script type=\"text/javascript\">alert('Invalid Id Property');location.href='BlogDetails.aspx'</script>");

            }
        }


    }
}