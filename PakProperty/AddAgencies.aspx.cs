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
    public partial class AddAgencies : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            if (!string.IsNullOrEmpty(Session["admin"] as string))
            {


                if (!IsPostBack)
                {


                }
            }
            else
            {
                Response.Redirect("LoginAdminPanel.aspx");
            }
        }
        public void agencyAdd(object sender, EventArgs e)
        {
            con.Open();
            HttpPostedFile postedFile = FileUpload1.PostedFile;
            string filename1 = Path.GetFileName(postedFile.FileName);
            if (name.Text != "" && phone.Text != "" && TextBox1.Text != "" && pdesTxt.Text != "" && filename1 != "")
            {
                SqlCommand coom = new SqlCommand("select * from tblAgencies where agencyName=@agencyName", con);
                coom.Parameters.AddWithValue("@agencyName", name.Text);
                SqlDataAdapter sda = new SqlDataAdapter(coom);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Response.Write("<script>alert('This Agency Is Already Uploaded')</script>");
                }
                else
                {
                    string filename = Path.GetFileName(postedFile.FileName);
                    string fileExtension = Path.GetExtension(filename);
                    Stream stream = postedFile.InputStream;
                    BinaryReader binaryReader = new BinaryReader(stream);
                    Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);


                    SqlCommand cmd = new SqlCommand("insert into tblAgencies (agencyName,agencyPhone,agencyType,agencyCity,agencyDes,image) values (@agencyName,@agencyPhone,@agencyType,@agencyCity,@agencyDes,@image)", con);
                    cmd.Parameters.AddWithValue("@agencyName", name.Text);
                    cmd.Parameters.AddWithValue("@agencyPhone", phone.Text);
                    cmd.Parameters.AddWithValue("@agencyType", ddAgencies.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@agencyCity", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@agencyDes", pdesTxt.Text);
                    cmd.Parameters.AddWithValue("@image", bytes);
                    cmd.ExecuteNonQuery();
                    Response.Write("<script type=\"text/javascript\">alert('Agency Uploaded');location.href='viewAgencies.aspx'</script>");
                }



            }
            else
            {
                Response.Write("<script>alert('Missing Fields')</script>");
            }
        }
    }
}