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
    public partial class AddBlog : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());

            if (!string.IsNullOrEmpty(Session["admin"] as string))
            {
                if (!IsPostBack)
                {
                    lblMessage.Visible = false;

                }
            }
            else
            {
                Response.Redirect("LoginAdminPanel.aspx");
            }
        }
        protected void addBlog(object sender, EventArgs e)
        {
            con.Open();
            HttpPostedFile postedFile = FileUpload1.PostedFile;
            string filename1 = Path.GetFileName(postedFile.FileName);
            if (desText.Text != "" && titleText.Text != "" && authorText.Text != "" && filename1 != "")
            {
                SqlCommand cmd = new SqlCommand("select * from tblBlog where blogTitle = @blogTitle", con);
                cmd.Parameters.AddWithValue("@blogTitle", titleText.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Response.Write("<script>alert('Your Blog Is Already Uploaded')</script>");
                }
                else
                {

                    string filename = Path.GetFileName(postedFile.FileName);
                    string fileExtension = Path.GetExtension(filename);
                    if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif"
                    || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
                    {
                        Stream stream = postedFile.InputStream;
                        BinaryReader binaryReader = new BinaryReader(stream);
                        Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);


                        SqlCommand cmd1 = new SqlCommand("insert into tblBlog (blogTitle,authorName,blogDescription,blogDate,blogView,blogImage) values (@blogTitle,@authorName,@blogDescription,@blogDate,@blogView,@blogImage)", con);
                        cmd1.Parameters.AddWithValue("@blogTitle", titleText.Text);
                        cmd1.Parameters.AddWithValue("@authorName", authorText.Text);
                        cmd1.Parameters.AddWithValue("@blogDescription", desText.Text);
                        cmd1.Parameters.AddWithValue("@blogDate", DateTime.Now.ToString());
                        cmd1.Parameters.AddWithValue("@blogView", 0);
                        cmd1.Parameters.AddWithValue("@blogImage", bytes);

                        cmd1.ExecuteNonQuery();
                        con.Close();

                        lblMessage.Visible = true;
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        lblMessage.Text = "Upload Successful";
                        titleText.Text = string.Empty;
                        authorText.Text = string.Empty;
                        desText.Text = string.Empty;

                        Response.Write("<script>alert('Upload Sucessfull')</script>");

                    }
                    else
                    {
                        lblMessage.Visible = true;
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = "Only images (.jpg, .png, .gif and .bmp) can be uploaded";
                    }



                }
            }
            else
            {
                Response.Write("<script>alert('Missing Data')</script>");
            }
        }
    }
}