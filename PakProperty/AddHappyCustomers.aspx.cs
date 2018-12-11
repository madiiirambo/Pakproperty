using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PakProperty
{
    public partial class AddHappyCustomers : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            con.Open();
            if (!string.IsNullOrEmpty(Session["admin"] as string))
            {
            }
            else
            {
                Response.Redirect("LoginAdminPanel.aspx");
            }

        }

        protected void addCustomer(object sender, EventArgs e)
        {
            HttpPostedFile postedFile = FileUpload1.PostedFile;
            string filename1 = Path.GetFileName(postedFile.FileName);
            if (filename1 != "" && customername.Text != "" && descrip.Text != "")
            {
                SqlCommand cmd = new SqlCommand("insert into tblHappyCustomers (customerName,customerDescription,customerImage) values (@customerName,@customerDescription,@customerImage)", con);
                cmd.Parameters.AddWithValue("@customerName", customername.Text);
                cmd.Parameters.AddWithValue("@customerDescription", descrip.Text);
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
                cmd.Parameters.AddWithValue("@customerImage", bytes);
                cmd.ExecuteNonQuery();
                Response.Write("<script type=\"text/javascript\">alert('Customer Added Sucessfull ');location.href='ViewCustomers.aspx'</script>");
            }
            else
            {
                Response.Write("<script>alert('Missing Fields')</script>");
            }
        }
    }
}