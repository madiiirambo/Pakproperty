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
    public partial class Uploaa : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            con.Open();
        }
        public void add(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("update tblAdds set cover=@cover",con);
            HttpPostedFile postedFile = FileUpload1.PostedFile;
            Stream stream = postedFile.InputStream;
            BinaryReader binaryReader = new BinaryReader(stream);
            Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
            cmd.Parameters.AddWithValue("@cover", bytes);
            cmd.ExecuteNonQuery();

        }
        public void addtblImages(object sender, EventArgs e)
        {


            foreach (HttpPostedFile thefile in FileUpload1.PostedFiles)
            {
                
               

                Stream stream = thefile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

                SqlCommand cmd = new SqlCommand("insert into tblAddImages (image,propertyId) values (@image,@propertyId)", con);
                cmd.Parameters.AddWithValue("@propertyId", 1);
                cmd.Parameters.AddWithValue("@image", bytes);
                cmd.ExecuteNonQuery();




            }


;
        }
    }
}