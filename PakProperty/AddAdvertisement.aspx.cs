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
    public partial class AddAdvertisement : System.Web.UI.Page
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
            if (nametxt.Text != "")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tblAdvertisement where advertisementName = @advertisementName", con);
                cmd.Parameters.AddWithValue("@advertisementName", nametxt.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                cmd.ExecuteNonQuery();

                if (dt.Rows.Count > 0)
                {
                    Response.Write("<script>alert('This Advertisement is already Added')</script>");
                    nametxt.Text = string.Empty;
                }
                else
                {
                    insertAdvertisement();

                }
            }
            else
            {
                Response.Write("<script>alert('Enter Advertisement Name')</script>");
            }

        }
        public void insertAdvertisement()
        {
            HttpPostedFile postedFile = FileUpload1.PostedFile;
            string filename1 = Path.GetFileName(postedFile.FileName);
            if (nametxt.Text != "" && filename1 != "")
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
                        SqlCommand cmd = new SqlCommand("insert into tblAdvertisement (advertisementName,advertisementLink,image) values (@advertisementName,@advertisementLink,@image)", con);
                        cmd.Parameters.AddWithValue("@advertisementName", nametxt.Text);
                        cmd.Parameters.AddWithValue("@advertisementLink", link.Text);
                        cmd.Parameters.AddWithValue("@image", bytes);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                        lblMessage.Visible = true;
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        lblMessage.Text = "Upload Successful";
                        nametxt.Text = string.Empty;
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
                Response.Write("<script>alert('Missing Image or Advertisement Name')</script>");
            }

        }
    }
}