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
    public partial class UpdatePopupAdds : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("select * from tblPopupAdds where popupId = @popupId", con);
                cmd.Parameters.AddWithValue("@popupId", Pid.Text);
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
                    Response.Write("<script>alert('Popup Id Invalid')</script>");
                    Pid.Text = string.Empty;
                    Pname.Text = string.Empty;
                }
            }
            else
            {
                Response.Write("<script>alert('Enter Popup Id ')</script>");
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
                    SqlCommand cmd = new SqlCommand("update tblPopupAdds set popupName = @popupName where popupId = @popupId", con);
                    cmd.Parameters.AddWithValue("@popupId", Pid.Text);
                    cmd.Parameters.AddWithValue("@popupName", Pname.Text);
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
                            SqlCommand cmd = new SqlCommand("update tblPopupAdds set popupName=@popupName,image=@image where popupId = @popupId", con);
                            cmd.Parameters.AddWithValue("@popupId", Pid.Text);
                            cmd.Parameters.AddWithValue("@popupName", Pname.Text);

                            cmd.Parameters.AddWithValue("@image", bytes);

                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                            Response.Write("<script type=\"text/javascript\">alert('Update');location.href='ViewPartners.aspx'</script>");
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
                Response.Write("<script> alert ('Enter PopupAdd Name') </script>");

            }
        }
    }
}