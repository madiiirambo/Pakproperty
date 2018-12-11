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
    public partial class AddFeaturedProperty : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            con.Open();
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Session["admin"] as string))
                {

                    if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                    {
                        if (Request.QueryString["id"].Contains("del"))
                        {
                            string temp = Request.QueryString["id"].Replace("del", "");
                            delete(temp);
                        }

                    }


                }

                else
                {
                    Response.Redirect("LoginAdminPanel.aspx");
                }
            }
        }
        protected void addBasicInfo(object sender, EventArgs e)
        {
            HttpPostedFile postedFile = FileUpload1.PostedFile;
            string filename1 = Path.GetFileName(postedFile.FileName);

            HttpPostedFile postedFile11 = FileUpload4.PostedFile;
            string filename11 = Path.GetFileName(postedFile.FileName);




            if (pnameTxt.Text != "" && paddressTxt.Text != "" && pdesTxt.Text != "" && pcityTxt.Text != ""
                && pcountryTxt.Text != "" && minpriceTxt.Text != "" && maxpriceTxt.Text != "" && totalbedsTxt.Text != ""
                    && totalbathsTxt.Text != "" && totalgarageTxt.Text != "" && totalkitchesTxt.Text != "" &&
                    totalbalconyTxt.Text != "" && sqftTxt.Text != "" && videolinkTxt.Text != "" && filename1 != "" && filename11 != "")
            {
                SqlCommand cmd = new SqlCommand("insert into tblAddFeaturedPropertiesBasic (propertyName,propertyAddress,propertyDescription,propertyCity,propertyCountry,propertyMin,propertyMax,propertyBeds,propertyBaths,propertyGarage,propertyKitchen,propertyBalcony,propertySquareft,propertyVideolink,coverImage) values (@propertyName,@propertyAddress,@propertyDescription,@propertyCity,@propertyCountry,@propertyMin,@propertyMax,@propertyBeds,@propertyBaths,@propertyGarage,@propertyKitchen,@propertyBalcony,@propertySquareft,@propertyVideolink,@coverImage) SELECT propertyId FROM tblAddFeaturedPropertiesBasic WHERE propertyId = SCOPE_IDENTITY()", con);
                cmd.Parameters.AddWithValue("@propertyName", pnameTxt.Text);
                cmd.Parameters.AddWithValue("@propertyAddress", paddressTxt.Text);
                cmd.Parameters.AddWithValue("@propertyDescription", pdesTxt.Text);
                cmd.Parameters.AddWithValue("@propertyCity", pcityTxt.Text);
                cmd.Parameters.AddWithValue("@propertyCountry", pcountryTxt.Text);
                cmd.Parameters.AddWithValue("@propertyMin", minpriceTxt.Text);
                cmd.Parameters.AddWithValue("@propertyMax", maxpriceTxt.Text);
                cmd.Parameters.AddWithValue("@propertyBeds", totalbedsTxt.Text);
                cmd.Parameters.AddWithValue("@propertyBaths", totalbathsTxt.Text);
                cmd.Parameters.AddWithValue("@propertyGarage", totalgarageTxt.Text);
                cmd.Parameters.AddWithValue("@propertyKitchen", totalkitchesTxt.Text);
                cmd.Parameters.AddWithValue("@propertyBalcony", totalbalconyTxt.Text);
                cmd.Parameters.AddWithValue("@propertySquareft", sqftTxt.Text);
                cmd.Parameters.AddWithValue("@propertyVideolink", videolinkTxt.Text);

                string filename = Path.GetFileName(postedFile11.FileName);
                string fileExtension = Path.GetExtension(filename);

                Stream stream = postedFile11.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
                cmd.Parameters.AddWithValue("@coverImage", bytes);


                
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                addImage(Convert.ToInt32(dt.Rows[0][0]));
                Response.Write("<script>alert('Upload Featured Property Sucessfull')</script>");
                pnameTxt.Text = string.Empty;
                paddressTxt.Text = string.Empty;
                pdesTxt.Text = string.Empty;
                pcityTxt.Text = string.Empty;
                pcountryTxt.Text = string.Empty;
                minpriceTxt.Text = string.Empty;
                maxpriceTxt.Text = string.Empty;
                totalbedsTxt.Text = string.Empty;
                totalbathsTxt.Text = string.Empty;
                totalgarageTxt.Text = string.Empty;
                totalkitchesTxt.Text = string.Empty;
                totalbalconyTxt.Text = string.Empty;
                sqftTxt.Text = string.Empty;
                videolinkTxt.Text = string.Empty;

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

                SqlCommand cmd1 = new SqlCommand("insert into tblAddFeaturedPropertiesImages (propertyId,imageData) values (@propertyId,@imageData)", con);
                cmd1.Parameters.AddWithValue("@propertyId", id);
                cmd1.Parameters.AddWithValue("@imageData", bytes);
                cmd1.ExecuteNonQuery();




            }
        }
        protected void addType(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select * from tblAddFeaturedPropertiesBasic where propertyId = @propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId",pid.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if(dt.Rows.Count > 0)
            {
                if(pid.Text != "" && floorTxt.Text != "" && Min.Text != "" && Max.Text != "" && MinSq.Text != ""  && MaxSq.Text != "")
                {
                    SqlCommand cmdd = new SqlCommand("insert into tblAddFeaturedPropertiesType (propertyId,fsname,min,max,minsq,maxsq) values (@propertyId,@fsname,@min,@max,@minsq,@maxsq)", con);
                    cmdd.Parameters.AddWithValue("@propertyId", pid.Text);
                    cmdd.Parameters.AddWithValue("@fsname", floorTxt.Text);
                    cmdd.Parameters.AddWithValue("@min", Min.Text);
                    cmdd.Parameters.AddWithValue("@max", Max.Text);
                    cmdd.Parameters.AddWithValue("@minsq", MinSq.Text);
                    cmdd.Parameters.AddWithValue("@maxsq", MaxSq.Text);
                    cmdd.ExecuteNonQuery();
                    Response.Write("<script>alert('Upload Featured Property Type Sucessfull')</script>");
                    pid.Text = string.Empty;
                    floorTxt.Text = string.Empty;
                    Min.Text = string.Empty;
                    Max.Text = string.Empty;
                    MinSq.Text = string.Empty;
                    MaxSq.Text = string.Empty;


                }
                else
                {
                    Response.Write("<script>alert('Missing Data Fields')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Id Number')</script>");
            }
        }
        protected void addFeatures(object sender, EventArgs e)
        {

            SqlCommand cmd1 = new SqlCommand("select * from tblAddFeaturedPropertiesBasic where propertyId = @propertyId", con);
            cmd1.Parameters.AddWithValue("@propertyId", proId.Text);
            SqlDataAdapter sda1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);


            if (dt1.Rows.Count>0)
            {
                if (proId.Text != "" && featuresTxt.Text != "")
                {

                    SqlCommand command = new SqlCommand("select * from tblAddFeaturedPropertiesFeatures where propertyId=@propertyId", con);
                    command.Parameters.AddWithValue("@propertyId", proId.Text);
                    SqlDataAdapter data = new SqlDataAdapter(command);
                    DataTable daaa = new DataTable();
                    data.Fill(daaa);
                    if(daaa.Rows.Count > 0)
                    {
                        Response.Write("<script>alert('This Id Features Already Added')</script>");

                    }
                    else
                    {
                        SqlCommand cmd = new SqlCommand("insert into tblAddFeaturedPropertiesFeatures (propertyId,features) values (@propertyId,@features)", con);
                        cmd.Parameters.AddWithValue("@propertyId", proId.Text);
                        cmd.Parameters.AddWithValue("@features", featuresTxt.Text);
                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Upload Featured Property Features Sucessfull')</script>");
                        proId.Text = string.Empty;
                        featuresTxt.Text = string.Empty;
                    }



                   
                }
                else
                {
                    Response.Write("<script>alert('Missing Data Fields')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Id Number')</script>");
            }
        }
        protected void addLocationPP(object sender,EventArgs e)
        {
            HttpPostedFile postedFile = FileUpload2.PostedFile;
            string filename1 = Path.GetFileName(postedFile.FileName);
            if (proppid.Text != "" && locationTxt.Text != "" && filename1 != "")
            {
                SqlCommand cmd = new SqlCommand("select * from tblAddFeaturedPropertiesLocation where propertyId =@propertyId", con);
                cmd.Parameters.AddWithValue("@propertyId", proppid.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Response.Write("<script>alert('This Id Data Already Added')</script>");
                }
                {
                    SqlCommand cmd1 = new SqlCommand("insert into tblAddFeaturedPropertiesLocation (propertyId,location) values (@propertyId,@location)", con);
                    cmd1.Parameters.AddWithValue("@propertyId", proppid.Text);
                    cmd1.Parameters.AddWithValue("@location", locationTxt.Text);
                    cmd1.ExecuteNonQuery();

                    foreach (HttpPostedFile thefile in FileUpload2.PostedFiles)
                    {
                        string filename = Path.GetFileName(thefile.FileName);
                        string fileExtension = Path.GetExtension(filename);

                        Stream stream = thefile.InputStream;
                        BinaryReader binaryReader = new BinaryReader(stream);
                        Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

                        SqlCommand cmdd = new SqlCommand("insert into tblAddFeaturedPropertiesPPImages (propertyId,ppImage) values (@propertyId,@ppImage)", con);
                        cmdd.Parameters.AddWithValue("@propertyId", proppid.Text);
                        cmdd.Parameters.AddWithValue("@ppImage", bytes);
                        cmdd.ExecuteNonQuery();




                    }
                    Response.Write("<script>alert('Upload Sucessfull')</script>");
                    proppid.Text = string.Empty;
                    locationTxt.Text = string.Empty;





                }
            }
            else
            {
                Response.Write("<script>alert('Missing Data')</script>");
            }
        }
        protected void addAgents(object sender,EventArgs e)
        {
            HttpPostedFile postedFile = FileUpload3.PostedFile;
            string filename1 = Path.GetFileName(postedFile.FileName);

            if (agpid.Text != "" && agentName.Text != "" && agentMob.Text != "" && fblink.Text != "" && filename1 != "" )
            {


                string filename = Path.GetFileName(postedFile.FileName);
                string fileExtension = Path.GetExtension(filename);

                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
                SqlCommand cmd = new SqlCommand("insert into tblAddFeaturedPropertiesAgents (propertyId,agentname,agentmob,agentfblink,agentimg) values (@propertyId,@agentname,@agentmob,@agentfblink,@agentimg)", con);
                cmd.Parameters.AddWithValue("@propertyId", agpid.Text);
                cmd.Parameters.AddWithValue("@agentname", agentName.Text);
                cmd.Parameters.AddWithValue("@agentmob", agentMob.Text);
                cmd.Parameters.AddWithValue("@agentfblink", fblink.Text);
                cmd.Parameters.AddWithValue("@agentimg", bytes);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Agent Upload Sucessfull')</script>");

                agpid.Text = string.Empty;
                agentName.Text = string.Empty;
                agentMob.Text = string.Empty;
                fblink.Text = string.Empty;

            }
            else
            {
                Response.Write("<script>alert('Missing Data')</script>");
            }
        }
        protected void addOfficeDetail(object sender,EventArgs e)
        {
            if(probookId.Text != "" && OfficeNameTxt.Text != "" && baddTxt.Text != "" && tphtxt.Text != "" &&
                tphtxt1.Text != "" && tphtxt2.Text != "")
            {
                SqlCommand cmd = new SqlCommand("select * from tblAddFeaturedPropertiesOffice where propertyId =@propertyId", con);
                cmd.Parameters.AddWithValue("@propertyId", probookId.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Response.Write("<script>alert('This Id Data Already Added')</script>");
                }
                else
                {
                    SqlCommand command = new SqlCommand("insert into tblAddFeaturedPropertiesOffice (propertyId,offName,offAdd,offc,offc1,offc2) values (@propertyId,@offName,@offAdd,@offc,@offc1,@offc2)", con);
                    command.Parameters.AddWithValue("@propertyId", probookId.Text);
                    command.Parameters.AddWithValue("@offName", OfficeNameTxt.Text);
                    command.Parameters.AddWithValue("@offAdd", baddTxt.Text);
                    command.Parameters.AddWithValue("@offc", tphtxt.Text);
                    command.Parameters.AddWithValue("@offc1", tphtxt1.Text);
                    command.Parameters.AddWithValue("@offc2", tphtxt2.Text);
                    command.ExecuteNonQuery();
                    Response.Write("<script>alert('Upload Office Detail Sucessfull')</script>");
                    probookId.Text = string.Empty;
                    OfficeNameTxt.Text = string.Empty;
                    baddTxt.Text = string.Empty;
                    tphtxt.Text = string.Empty;
                    tphtxt1.Text = string.Empty;
                    tphtxt2.Text = string.Empty;


                }
            }
            else
            {
                Response.Write("<script>alert('Missing Data')</script>");
            }
        }
        public void delete(string id)
        {
            SqlCommand cmd;
            int propertyId = Convert.ToInt32(id);
            cmd = new SqlCommand("delete from tblAddFeaturedPropertiesBasic where propertyId=@propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId", id);
            cmd.ExecuteNonQuery();
            cmd = new SqlCommand("delete from tblAddFeaturedPropertiesAgents where propertyId=@propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId", id);
            cmd.ExecuteNonQuery();
            cmd = new SqlCommand("delete from tblAddFeaturedPropertiesFeatures where propertyId=@propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId", id);
            cmd.ExecuteNonQuery();
            cmd = new SqlCommand("delete from tblAddFeaturedPropertiesImages where propertyId=@propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId", id);
            cmd.ExecuteNonQuery();
            cmd = new SqlCommand("delete from tblAddFeaturedPropertiesLocation where propertyId=@propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId", id);

            cmd.ExecuteNonQuery();
            cmd = new SqlCommand("delete from tblAddFeaturedPropertiesOffice where propertyId=@propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId", id);
            cmd.ExecuteNonQuery();
            cmd = new SqlCommand("delete from tblAddFeaturedPropertiesPPImages where propertyId=@propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId", id);
            cmd.ExecuteNonQuery();
            cmd = new SqlCommand("delete from tblAddFeaturedPropertiesType where propertyId=@propertyId", con);
            
            cmd.Parameters.AddWithValue("@propertyId", id);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Property Deleted');location.href='ViewFeaturedProperties.aspx'</script>");

        }

    }
}