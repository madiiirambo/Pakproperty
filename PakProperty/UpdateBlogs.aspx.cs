using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PakProperty
{
    
    public partial class UpdateBlogs : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            if (!string.IsNullOrEmpty(Session["admin"] as string))
            {
            }
            else
            {
                Response.Redirect("LoginAdminPanel.aspx");
            }
        }
        protected void viewDate(object sender, EventArgs e)
        {
            con.Open();
            if (Pid.Text != "")
            {
                SqlCommand cmd = new SqlCommand("select * from tblBlog where blogId = @blogId", con);
                cmd.Parameters.AddWithValue("@blogId", Pid.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Pid.Text = dt.Rows[0][0].ToString();
                    titleText.Text = dt.Rows[0][1].ToString();
                    authorText.Text = dt.Rows[0][2].ToString();
                    desText.Text = dt.Rows[0][3].ToString();
                    Pid.ReadOnly = true;

                }
                else
                {
                    Response.Write("<script>alert('Partner Id Invalid')</script>");
                    Pid.Text = string.Empty;
                    titleText.Text = string.Empty;
                    authorText.Text = string.Empty;
                    desText.Text = string.Empty;
                }
            }
            else
            {
                Response.Write("<script>alert('Enter Partner Id ')</script>");
            }

        }

        public void updateBlog()
        {
            if(titleText.Text != "" && authorText.Text != "" && desText.Text != "")
            {
                HttpPostedFile postedFile = FileUpload1.PostedFile;
                string filename1 = Path.GetFileName(postedFile.FileName);

                if (filename1.Equals(""))
                {

                    Pid.ReadOnly = true;
                    SqlCommand cmd = new SqlCommand("update tblBlog set blogTitle = @blogTitle,authorName=@authorName,blogDescription=@blogDescription,blogDate=@blogDate where blogId = @blogId", con);
                    cmd.Parameters.AddWithValue("@blogId", Pid.Text);
                    cmd.Parameters.AddWithValue("@blogTitle", titleText.Text);
                    cmd.Parameters.AddWithValue("@authorName", authorText.Text);
                    cmd.Parameters.AddWithValue("@blogDescription", desText.Text);
                    cmd.Parameters.AddWithValue("@blogDate", DateTime.Now.ToString());
                    con.Open();
                    cmd.ExecuteNonQuery();

                    Response.Write("<script type=\"text/javascript\">alert('Updated');location.href='ViewBlogs.aspx'</script>");

                    Pid.Text = string.Empty;
                    titleText.Text = string.Empty;
                    authorText.Text = string.Empty;
                    desText.Text = string.Empty;
                }
                else
                {
                    Pid.ReadOnly = false;
                    string filename = Path.GetFileName(postedFile.FileName);
                    string fileExtension = Path.GetExtension(filename);
                    int fileSize = postedFile.ContentLength;

                    if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif"
                        || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
                    {
                        Stream stream = postedFile.InputStream;
                        BinaryReader binaryReader = new BinaryReader(stream);
                        Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);


                        string cs = ConfigurationManager.ConnectionStrings["pp"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(cs))
                        {
                            SqlCommand cmd = new SqlCommand("update tblBlog set blogTitle = @blogTitle,authorName=@authorName,blogDescription=@blogDescription,blogDate=@blogDate,blogImage=@blogImage where blogId = @blogId", con);
                            cmd.Parameters.AddWithValue("@blogId", Pid.Text);
                            cmd.Parameters.AddWithValue("@blogTitle", titleText.Text);
                            cmd.Parameters.AddWithValue("@authorName", authorText.Text);
                            cmd.Parameters.AddWithValue("@blogDescription", desText.Text);
                            cmd.Parameters.AddWithValue("@blogDate", DateTime.Now.ToString());
                            cmd.Parameters.AddWithValue("@blogImage", bytes);

                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                            Response.Write("<script>alert('Update Sucessfull')</script>");
                            Pid.Text = string.Empty;
                            titleText.Text = string.Empty;
                            authorText.Text = string.Empty;
                            desText.Text = string.Empty;

                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Only images (.jpg, .png, .gif and .bmp) can be uploaded')</script>");
                    }

                }


            }
            else
            {
                Response.Write("<script> alert ('Missing Data') </script>");

            }
        }
        protected void update(object sender, EventArgs e)
        {
            updateBlog();
            Pid.ReadOnly = false;

        }
    }
}