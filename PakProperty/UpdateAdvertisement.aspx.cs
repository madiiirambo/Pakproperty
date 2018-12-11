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
    public partial class UpdateAdvertisement : System.Web.UI.Page
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
            if (Pid.Text != "")
            {
                SqlCommand cmd = new SqlCommand("select * from tblAdvertisement where advertisementId = @advertisementId", con);
                cmd.Parameters.AddWithValue("@advertisementId", Pid.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Pid.Text = dt.Rows[0][0].ToString();
                    nametxt.Text = dt.Rows[0][1].ToString();
                    link.Text = dt.Rows[0][2].ToString();
                    Pid.ReadOnly = true;

                }
                else
                {
                    Response.Write("<script>alert('Advertisement Id Invalid')</script>");
                    Pid.Text = string.Empty;
                    nametxt.Text = string.Empty;
                    link.Text = string.Empty;
                }
            }
            else
            {
                Response.Write("<script>alert('Enter Advertisement Id ')</script>");
            }

        }

        protected void update(object sender, EventArgs e)
        {
            updatePartner();
            Pid.ReadOnly = false;

        }
        public void updatePartner()
        {
            if (nametxt.Text != "")
            {
                HttpPostedFile postedFile = FileUpload1.PostedFile;
                string filename1 = Path.GetFileName(postedFile.FileName);

                if (filename1.Equals(""))
                {

                    Pid.ReadOnly = true;
                    SqlCommand cmd = new SqlCommand("update tblAdvertisement set advertisementName = @advertisementName,advertisementLink=@advertisementLink where advertisementId = @advertisementId", con);
                    cmd.Parameters.AddWithValue("@advertisementId", Pid.Text);
                    cmd.Parameters.AddWithValue("@advertisementName", nametxt.Text);
                    cmd.Parameters.AddWithValue("@advertisementLink", link.Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    Response.Write("<script type=\"text/javascript\">alert('Update');location.href='ViewAdvertisement.aspx'</script>");



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
                            SqlCommand cmd = new SqlCommand("update tblAdvertisement set advertisementName = @advertisementName,advertisementLink=@advertisementLink,image=@image where advertisementId = @advertisementId", con);
                            cmd.Parameters.AddWithValue("@advertisementId", Pid.Text);
                            cmd.Parameters.AddWithValue("@advertisementName", nametxt.Text);
                            cmd.Parameters.AddWithValue("@advertisementLink", link.Text);

                            cmd.Parameters.AddWithValue("@image", bytes);

                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                            Response.Write("<script type=\"text/javascript\">alert('Update');location.href='ViewAdvertisement.aspx'</script>");
                           

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
                Response.Write("<script> alert ('Enter Advertisement Name') </script>");

            }
        }
    }
}