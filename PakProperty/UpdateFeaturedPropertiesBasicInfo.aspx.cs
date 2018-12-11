using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PakProperty
{
    public partial class UpdateFeaturedPropertiesBasicInfo : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Session["admin"] as string))
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());


                if (!IsPostBack)
                {
                    if (Request.QueryString["id"] != null)
                    {
                        int proId = Convert.ToInt32(Request.QueryString["id"]);
                        viewData(proId);
                    }
                }
            }
            else
            {
                Response.Redirect("LoginAdminPanel.aspx");
            }
        }

            

        public void viewData(int id)
        {
            string description = string.Empty;
            SqlCommand cmd = new SqlCommand("select * from tblAddFeaturedPropertiesBasic where propertyId = @propertyId ", con);
            cmd.Parameters.AddWithValue("@propertyId", id);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            propertyId.Text = dt.Rows[0][0].ToString();
            pnameTxt.Text = dt.Rows[0][2].ToString();
            paddressTxt.Text = dt.Rows[0][3].ToString();
            pdesTxt.Text = dt.Rows[0][4].ToString();
            pcityTxt.Text = dt.Rows[0][5].ToString();
            pcountryTxt.Text = dt.Rows[0][6].ToString();
            minpriceTxt.Text = dt.Rows[0][7].ToString();
            maxpriceTxt.Text = dt.Rows[0][8].ToString();
            totalbedsTxt.Text = dt.Rows[0][9].ToString();
            totalbathsTxt.Text = dt.Rows[0][10].ToString();
            totalgarageTxt.Text = dt.Rows[0][11].ToString();
            totalkitchesTxt.Text = dt.Rows[0][12].ToString();
            totalbalconyTxt.Text = dt.Rows[0][13].ToString();
            sqftTxt.Text = dt.Rows[0][14].ToString();
            videolinkTxt.Text = dt.Rows[0][15].ToString();

        }
        protected void update(object sender, EventArgs e)
        {
            if (pnameTxt.Text != "" && paddressTxt.Text != "" && pdesTxt.Text != "" && pcityTxt.Text != ""
                && pcountryTxt.Text != "" && minpriceTxt.Text != "" && maxpriceTxt.Text != "" && totalbedsTxt.Text != ""
                    && totalbathsTxt.Text != "" && totalgarageTxt.Text != "" && totalkitchesTxt.Text != "" &&
                    totalbalconyTxt.Text != "" && sqftTxt.Text != "" && videolinkTxt.Text != "" )
            {


                con.Open();
            SqlCommand cmd = new SqlCommand("update tblAddFeaturedPropertiesBasic set propertyName=@propertyName,propertyAddress=@propertyAddress,propertyDescription=@propertyDescription,propertyCity=@propertyCity,propertyCountry=@propertyCountry,propertyMin=@propertyMin,propertyMax=@propertyMax,propertyBeds=@propertyBeds,propertyBaths=@propertyBaths,propertyGarage=@propertyGarage,propertyKitchen=@propertyKitchen,propertyBalcony=@propertyBalcony,propertySquareft=@propertySquareft,propertyVideolink=@propertyVideolink where propertyId=@propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId",propertyId.Text);
            cmd.Parameters.AddWithValue("@propertyName",pnameTxt.Text);
            cmd.Parameters.AddWithValue("@propertyAddress",paddressTxt.Text);
            cmd.Parameters.AddWithValue("@propertyDescription",pdesTxt.Text);
            cmd.Parameters.AddWithValue("@propertyCity",pcityTxt.Text);
            cmd.Parameters.AddWithValue("@propertyCountry",pcountryTxt.Text);
            cmd.Parameters.AddWithValue("@propertyMin",minpriceTxt.Text);
            cmd.Parameters.AddWithValue("@propertyMax",maxpriceTxt.Text);
            cmd.Parameters.AddWithValue("@propertyBeds",totalbedsTxt.Text);
            cmd.Parameters.AddWithValue("@propertyBaths",totalbathsTxt.Text);
            cmd.Parameters.AddWithValue("@propertyGarage",totalgarageTxt.Text);
            cmd.Parameters.AddWithValue("@propertyKitchen",totalkitchesTxt.Text);
            cmd.Parameters.AddWithValue("@propertyBalcony",totalbalconyTxt.Text);
            cmd.Parameters.AddWithValue("@propertySquareft",sqftTxt.Text);
            cmd.Parameters.AddWithValue("@propertyVideolink",videolinkTxt.Text);
            cmd.ExecuteNonQuery();
                Response.Write("<script type=\"text/javascript\">alert('Updated');location.href='ViewFeaturedProperties.aspx'</script>");
                
            }
            else
            {
                Response.Write("<script>alert('Missing Data')</script>");
            }














        }
    }
}