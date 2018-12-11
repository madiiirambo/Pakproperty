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
    public partial class AddPartners : System.Web.UI.Page
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
        protected void addPartner(object sender, EventArgs e)
        {
            if(icon_prefix.Text != "")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tblPartners where partnerName = @partnerName", con);
                cmd.Parameters.AddWithValue("@partnerName", icon_prefix.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                cmd.ExecuteNonQuery();

                if (dt.Rows.Count > 0)
                {
                    Response.Write("<script>alert('This Partner is already Added')</script>");
                    icon_prefix.Text = string.Empty;
                }
                else
                {
                    insertPartner();

                }
            }
            else
            {
                Response.Write("<script>alert('Enter Partner Name')</script>");
            }
            
        }
        public void insertPartner()
        {
            HttpPostedFile postedFile = FileUpload1.PostedFile;
            string filename1 = Path.GetFileName(postedFile.FileName);
            if (icon_prefix.Text != "" && filename1 != "")
            {

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
                        SqlCommand cmd = new SqlCommand("insert into tblPartners (partnerName,imageName,imageSize,imageData) values (@partnerName,@imageName,@imageSize,@imageData)", con);
                        cmd.Parameters.AddWithValue("@partnerName", icon_prefix.Text);
                        cmd.Parameters.AddWithValue("@imageName", filename);
                        cmd.Parameters.AddWithValue("@imageSize", fileSize);
                        cmd.Parameters.AddWithValue("@imageData", bytes);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                        lblMessage.Visible = true;
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        lblMessage.Text = "Upload Successful";
                        icon_prefix.Text = string.Empty;
                        Response.Write("<script>alert('Upload Sucessfull')</script>");
                    }
                }
                else
                {
                    lblMessage.Visible = true;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Only images (.jpg, .png, .gif and .bmp) can be uploaded";
                }
            }
            else
            {
                Response.Write("<script>alert('Missing Image or Partner Name')</script>");
            }
                
        }
        
    }
}