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
    public partial class UpdateCustomers : System.Web.UI.Page
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
            if (Cid.Text != "")
            {
                SqlCommand cmd = new SqlCommand("select * from tblHappyCustomers where customerId = @customerId", con);
                cmd.Parameters.AddWithValue("@customerId", Cid.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Cid.Text = dt.Rows[0][0].ToString();
                    Cname.Text = dt.Rows[0][1].ToString();
                    Cdes.Text = dt.Rows[0][2].ToString();
                    Cid.ReadOnly = true;

                }
                else
                {
                    Response.Write("<script>alert('Customer Id Invalid')</script>");
                    Cid.Text = string.Empty;
                    Cname.Text = string.Empty;
                    Cdes.Text = string.Empty;
                }
            }
            else
            {
                Response.Write("<script>alert('Enter Customer Id ')</script>");
            }

        }
        protected void update(object sender, EventArgs e)
        {
            updatePartner();
            Cid.ReadOnly = false;

        }
        public void updatePartner()
        {
            if (Cname.Text != "")
            {
                HttpPostedFile postedFile = FileUpload1.PostedFile;
                string filename1 = Path.GetFileName(postedFile.FileName);

                if (filename1.Equals(""))
                {

                    Cid.ReadOnly = true;
                    SqlCommand cmd = new SqlCommand("update tblHappyCustomers set customerName = @customerName,customerDescription=@customerDescription where customerId = @customerId", con);
                    cmd.Parameters.AddWithValue("@customerId", Cid.Text);
                    cmd.Parameters.AddWithValue("@customerName", Cname.Text);
                    cmd.Parameters.AddWithValue("@customerDescription", Cdes.Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    Response.Write("<script type=\"text/javascript\">alert('Update Customer Sucessfull ');location.href='ViewCustomers.aspx'</script>");
                    Cid.Text = string.Empty;
                    Cname.Text = string.Empty;
                }
                else
                {
                    Cid.ReadOnly = false;
                    string filename = Path.GetFileName(postedFile.FileName);
                   // string fileExtension = Path.GetExtension(filename);
                   // int fileSize = postedFile.ContentLength;

                    //if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif"
                    //    || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
                    //{
                        Stream stream = postedFile.InputStream;
                        BinaryReader binaryReader = new BinaryReader(stream);
                        Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);


                        string cs = ConfigurationManager.ConnectionStrings["pp"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(cs))
                        {
                        SqlCommand cmd = new SqlCommand("update tblHappyCustomers set customerName = @customerName,customerDescription=@customerDescription,customerImage=@customerImage where customerId = @customerId", con);

                        cmd.Parameters.AddWithValue("@customerId", Cid.Text);
                        cmd.Parameters.AddWithValue("@customerName", Cname.Text);
                        cmd.Parameters.AddWithValue("@customerDescription", Cdes.Text);
                        cmd.Parameters.AddWithValue("@customerImage", bytes);

                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        Response.Write("<script type=\"text/javascript\">alert('Update Customer Sucessfull ');location.href='ViewCustomers.aspx'</script>");
                        Cid.Text = string.Empty;
                            Cname.Text = string.Empty;

                        }
                    
                    
                }


            }
            else
            {
                Response.Write("<script> alert ('Enter Customer Name') </script>");

            }
        }
    }
}