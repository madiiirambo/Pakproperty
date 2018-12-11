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
    public partial class UpdateAgencies : System.Web.UI.Page
    {
        SqlConnection con;



        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            con.Open();
            if (!string.IsNullOrEmpty(Session["admin"] as string))
            {
                if (!IsPostBack)
                {

                }
            }
            else
            {
                Response.Redirect("AdminLoginPanel.aspx");
            }
        }
        public void viewData(object sender, EventArgs e)
        {
            if (Pid.Text != "")
            {
                SqlCommand cmd = new SqlCommand("select * from tblAgencies where agencyId=@agencyId", con);
                cmd.Parameters.AddWithValue("@agencyId", Pid.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    name.Text = dt.Rows[0][1].ToString();
                    phone.Text = dt.Rows[0][2].ToString();
                    ddTyPE.SelectedItem.Text = dt.Rows[0][3].ToString();
                    text.Text = dt.Rows[0][4].ToString();
                    pdesTxt.Text = dt.Rows[0][5].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Id')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Enter Project Id Please  ')</script>");
            }
        }
        public void update(object sender, EventArgs e)
        {
            HttpPostedFile postedFile = FileUpload1.PostedFile;
            string filename1 = Path.GetFileName(postedFile.FileName);
            if (name.Text != "" && phone.Text != "" && Pid.Text != "" && text.Text != "" && pdesTxt.Text != "" && filename1 != "")
            {
                string filename = Path.GetFileName(postedFile.FileName);
                string fileExtension = Path.GetExtension(filename);
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
                SqlCommand cmd = new SqlCommand("update tblAgencies set agencyName=@agencyName,agencyPhone=@agencyPhone,agencyType=@agencyType,agencyCity=@agencyCity,agencyDes=@agencyDes,image=@image where agencyId=@agencyId", con);
                cmd.Parameters.AddWithValue("@agencyId", Pid.Text);
                cmd.Parameters.AddWithValue("@agencyName", name.Text);
                cmd.Parameters.AddWithValue("@agencyPhone", phone.Text);
                cmd.Parameters.AddWithValue("@agencyType", ddTyPE.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@agencyCity", text.Text);
                cmd.Parameters.AddWithValue("@agencyDes", pdesTxt.Text);
                cmd.Parameters.AddWithValue("@image", bytes);
                cmd.ExecuteNonQuery();
                Response.Write("<script type=\"text/javascript\">alert('Agency Updated');location.href='viewAgencies.aspx'</script>");

            }
            else if (name.Text != "" && phone.Text != "" && Pid.Text != "" && text.Text != "" && pdesTxt.Text != "")
            {
                SqlCommand cmd = new SqlCommand("update tblAgencies set agencyName=@agencyName,agencyPhone=@agencyPhone,agencyType=@agencyType,agencyCity=@agencyCity,agencyDes=@agencyDes where agencyId=@agencyId", con);
                cmd.Parameters.AddWithValue("@agencyId", Pid.Text);
                cmd.Parameters.AddWithValue("@agencyName", name.Text);
                cmd.Parameters.AddWithValue("@agencyPhone", phone.Text);
                cmd.Parameters.AddWithValue("@agencyType", ddTyPE.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@agencyCity", text.Text);
                cmd.Parameters.AddWithValue("@agencyDes", pdesTxt.Text);
                cmd.ExecuteNonQuery();
                Response.Write("<script type=\"text/javascript\">alert('Agency Updated');location.href='viewAgencies.aspx'</script>");

            }
            else
            {
                Response.Write("<script>alert('Missing Fields')</script>");
            }
        }
    }
}