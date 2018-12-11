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
    public partial class UpdatePartner : System.Web.UI.Page
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
           if(Pid.Text != "")
            {
                SqlCommand cmd = new SqlCommand("select * from tblPartners where partnerId = @partnerId", con);
                cmd.Parameters.AddWithValue("@partnerId", Pid.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Pid.Text = dt.Rows[0][0].ToString();
                    Pname.Text = dt.Rows[0][1].ToString();
                    Pid.ReadOnly = true;

                }
                else
                {
                    Response.Write("<script>alert('Partner Id Invalid')</script>");
                    Pid.Text = string.Empty;
                    Pname.Text = string.Empty;
                }
            }
            else
            {
                Response.Write("<script>alert('Enter Partner Id ')</script>");
            }

        }

        protected void update(object sender, EventArgs e)
        {
            updatePartner();
            Pid.ReadOnly = false;

        }
        public void updatePartner()
        {
            if (Pname.Text != "")
            {
                HttpPostedFile postedFile = FileUpload1.PostedFile;
                string filename1 = Path.GetFileName(postedFile.FileName);

                if (filename1.Equals(""))
                {

                    Pid.ReadOnly = true;
                    SqlCommand cmd = new SqlCommand("update tblPartners set partnerName = @partnerName where partnerId = @partnerId", con);
                    cmd.Parameters.AddWithValue("@partnerId", Pid.Text);
                    cmd.Parameters.AddWithValue("@partnerName", Pname.Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    Response.Write("<script type=\"text/javascript\">alert('Update');location.href='ViewPopup.aspx'</script>");

                   
                    Pid.Text = string.Empty;
                    Pname.Text = string.Empty;
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
                            SqlCommand cmd = new SqlCommand("update tblPartners set partnerName=@partnerName,imageName=@imageName,imageSize=@imageSize,imageData=@imageData where partnerId = @partnerId", con);
                            cmd.Parameters.AddWithValue("@partnerId", Pid.Text);
                            cmd.Parameters.AddWithValue("@partnerName", Pname.Text);
                            cmd.Parameters.AddWithValue("@imageName", filename);
                            cmd.Parameters.AddWithValue("@imageSize", fileSize);
                            cmd.Parameters.AddWithValue("@imageData", bytes);

                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                            Response.Write("<script type=\"text/javascript\">alert('Update');location.href='ViewPopup.aspx'</script>");
                            Pid.Text = string.Empty;
                            Pname.Text = string.Empty;

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
                Response.Write("<script> alert ('Enter Partner Name') </script>");

            }
        }
    }
}