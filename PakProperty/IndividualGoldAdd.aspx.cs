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
    public partial class IndividualGoldAdd : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            con.Open();


            if (!string.IsNullOrEmpty(Session["id"] as string))
            {

                if (!string.IsNullOrEmpty(Session["lat"] as string))
                {
                    string abc = string.Empty;

                    lat.Text = Session["lat"].ToString();
                    lng.Text = Session["lng"].ToString();
                    string[] xyz = Session["add"].ToString().Split(',');
                    for (int i = 0; i < xyz.Length; i++)
                    {
                        if (xyz[i + 1].Equals(" Pakistan"))
                        {
                            break;
                        }
                        else
                        {
                            if (i == 0)
                            {
                                abc = xyz[i];
                            }
                            else
                            {
                                abc += ',' + xyz[i];
                            }

                        }
                    }
                    addtxt.Text = abc;
                    lblName.Text = Session["name"].ToString();


                }
                else
                {
                    Response.Redirect("userDashboard.aspx");
                }

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void add(object sender, EventArgs e)
        {

            HttpPostedFile postedFile = FileUpload1.PostedFile;
            string filename1 = Path.GetFileName(postedFile.FileName);

            HttpPostedFile postedFile11 = FileUpload.PostedFile;
            string filename11 = Path.GetFileName(postedFile.FileName);

            if (pdesTxt.Text != "" && addtxt.Text != "" && beds.Text != "" && baths.Text != "" && garage.Text != ""
                && kitchen.Text != "" && balcony.Text != "" && area.Text != "" && price.Text != "" && filename1 != "" && filename11 != "" && featuresTxt.Text != "")
            {
                SqlCommand cmd = new SqlCommand("insert into tblAdds (userId,lat,lng,pp,pt,sc,sco,proty,expdate,postdate,des,address,bed,bath,garage,kitchen,balconey,sq,price,cover,features,approved) values (@userId,@lat,@lng,@pp,@pt,@sc,@sco,@proty,@expdate,@postdate,@des,@address,@bed,@bath,@garage,@kitchen,@balconey,@sq,@price,@cover,@features,@approved) SELECT propertyId FROM tblAdds WHERE propertyId = SCOPE_IDENTITY()", con);
                cmd.Parameters.AddWithValue("@userId", Convert.ToInt32(Session["id"].ToString()));
                cmd.Parameters.AddWithValue("@lat", lat.Text);
                cmd.Parameters.AddWithValue("@lng", lng.Text);
                cmd.Parameters.AddWithValue("@pp", ddpurpose.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@pt", ddtype.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@sc", ddcities.SelectedItem.ToString());
                cmd.Parameters.AddWithValue("@sco", countryTxt.Text);
                cmd.Parameters.AddWithValue("@proty", typeaddTxt.Text);
                cmd.Parameters.AddWithValue("@expdate", DateTime.Now);
                cmd.Parameters.AddWithValue("@postdate", DateTime.Now);
                cmd.Parameters.AddWithValue("@des", pdesTxt.Text);
                cmd.Parameters.AddWithValue("@address", addtxt.Text);
                cmd.Parameters.AddWithValue("@bed", beds.Text);
                cmd.Parameters.AddWithValue("@bath", baths.Text);
                cmd.Parameters.AddWithValue("@garage", garage.Text);
                cmd.Parameters.AddWithValue("@kitchen", kitchen.Text);
                cmd.Parameters.AddWithValue("@balconey", balcony.Text);
                cmd.Parameters.AddWithValue("@sq", area.Text);
                cmd.Parameters.AddWithValue("@price", price.Text);

                string filename = Path.GetFileName(postedFile11.FileName);
                string fileExtension = Path.GetExtension(filename);

                Stream stream = postedFile11.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
                cmd.Parameters.AddWithValue("@cover", bytes);
                cmd.Parameters.AddWithValue("@features", featuresTxt.Text);
                cmd.Parameters.AddWithValue("@approved", "false");


                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                addImage(Convert.ToInt32(dt.Rows[0][0]));
                goldAddupdate(Convert.ToInt32(Session["id"].ToString()));
                expire(Convert.ToInt32(dt.Rows[0][0]));

                Response.Write("<script type=\"text/javascript\">alert('Your Add Posted Waiting 4 Approval');location.href='userDashboard.aspx'</script>");
                Session["lat"] = null;
                Session["lng"] = null;
                Session["add"] = null;

            }
            else
            {
                Response.Write("<script>alert('Missing Data')</script>");
            }
        }
        public void addImage(int id)
        {
            foreach (HttpPostedFile thefile in FileUpload1.PostedFiles)
            {
                string filename = Path.GetFileName(thefile.FileName);
                string fileExtension = Path.GetExtension(filename);

                Stream stream = thefile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

                SqlCommand cmd1 = new SqlCommand("insert into tblAddImages (propertyId,image) values (@propertyId,@image)", con);
                cmd1.Parameters.AddWithValue("@propertyId", id);
                cmd1.Parameters.AddWithValue("@image", bytes);
                cmd1.ExecuteNonQuery();




            }
        }
        public void goldAddupdate(int id)
        {
            SqlCommand cmd = new SqlCommand("update tblUsersData set indgold=indgold-1 where userId=@userId", con);
            cmd.Parameters.AddWithValue("@userId", id);
            cmd.ExecuteNonQuery();

        }
        public void expire(int id)
        {
            SqlCommand cmd = new SqlCommand("UPDATE tblAdds set expdate=(DateADD(WEEK,1,expdate)) WHERE propertyId=@propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId", id);
            cmd.ExecuteNonQuery();
        }
       
    }
}