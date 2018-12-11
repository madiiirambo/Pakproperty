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
    public partial class AddProperty : System.Web.UI.Page
    {
        SqlConnection con;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblName.Text = Session["name"].ToString();
            freeBtn.Visible = false;
            goldBtn.Visible = false;
            diamondBtn.Visible = false;
            indgBtn.Visible = false;
            inddBtn.Visible = false;


            diamondlink.Visible = false;
            goldlink.Visible = false;
            indilink.Visible = false;


            HyperLink1.Visible = false;
            HyperLink2.Visible = false;
            HyperLink3.Visible = false;

            HyperLink4.Visible = false;
            HyperLink5.Visible = false;
            HyperLink6.Visible = false;

            HyperLink7.Visible = false;
            HyperLink8.Visible = false;
            HyperLink9.Visible = false;

            HyperLink10.Visible = false;
            HyperLink11.Visible = false;
            HyperLink12.Visible = false;






            if (!string.IsNullOrEmpty(Session["id"] as string))
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tblUsersData where userId = @userId", con);
                cmd.Parameters.AddWithValue("@userId", Convert.ToInt32(Session["id"]));
                cmd.ExecuteNonQuery();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                 dt = new DataTable();
                sda.Fill(dt);
                if(Convert.ToInt32(dt.Rows[0][7]) > 0)
                {
                    lblFree.Text = "Welcome To PakProperty :)" + "<br/>" + "Your Remaining Adds "  + Convert.ToInt32(dt.Rows[0][7]) + "<br/>"+ "And This Free Listing Adds Expire after 1 month. ThankYou :)";
                    freeBtn.Visible = true;

                }
                else
                {
                    lblFree.Text = "Welcome To PakProperty :)" +"<br/>" + "Your Remaining Adds " + Convert.ToInt32(dt.Rows[0][7]) + "<br/>"+ " If you want to post your Add so please buy packages. ThankYou :)";
                    diamondlink.Visible = true;
                    goldlink.Visible = true;
                    indilink.Visible = true;
                }
                if (Convert.ToInt32(dt.Rows[0][8]) > 0)
                {
                    lblGold.Text = "Welcome To PakProperty :)" + "<br/>" + "Your Remaining Adds " + Convert.ToInt32(dt.Rows[0][8]) + "<br/>" + "And This Gold Listing Adds Expire after 1 year. ThankYou :)";
                    goldBtn.Visible = true;


                }
                else
                {
                    lblGold.Text = "Welcome To PakProperty :)" + "<br/>" + "Your Remaining Adds " + Convert.ToInt32(dt.Rows[0][8]) + "<br/>" + " If you want to post your Add so please buy packages. ThankYou :)";
                    HyperLink1.Visible = true;
                    HyperLink2.Visible = true;
                    HyperLink3.Visible = true;
                }
                if (Convert.ToInt32(dt.Rows[0][9]) > 0)
                {
                    lblDiamond.Text = "Welcome To PakProperty :)" + "<br/>" + "Your Remaining Adds " + Convert.ToInt32(dt.Rows[0][9]) + "<br/>" + "And This Diamond Listing Adds Expire after 1 year. ThankYou :)";
                    diamondBtn.Visible = true;

                }
                else
                {
                    lblDiamond.Text = "Welcome To PakProperty :)" + "<br/>" + "Your Remaining Adds " + Convert.ToInt32(dt.Rows[0][9]) + "<br/>" + " If you want to post your Add so please buy packages. ThankYou :)";
                    HyperLink4.Visible = true;
                    HyperLink5.Visible = true;
                    HyperLink6.Visible = true;
                }
                if (Convert.ToInt32(dt.Rows[0][10]) > 0)
                {
                    lblindividualgold.Text = "Welcome To PakProperty :)" + "<br/>" + "Your Remaining Adds " + Convert.ToInt32(dt.Rows[0][10]) + "<br/>" + "And This Individual Gold Listing Adds Expire after 1 week. ThankYou :)";
                    indgBtn.Visible = true;

                }
                else
                {
                    lblindividualgold.Text = "Welcome To PakProperty :)" + "<br/>" + "Your Remaining Adds " + Convert.ToInt32(dt.Rows[0][10]) + "<br/>" + " If you want to post your Add so please buy packages. ThankYou :)";
                    HyperLink7.Visible = true;
                    HyperLink8.Visible = true;
                    HyperLink9.Visible = true;
                }
                if (Convert.ToInt32(dt.Rows[0][11]) > 0)
                {
                    lblindividualdiamond.Text = "Welcome To PakProperty :)" + "<br/>" + "Your Remaining Adds " + Convert.ToInt32(dt.Rows[0][11]) + "<br/>" + "And This Individual Diamond Listing Adds Expire after 1 week. ThankYou :)";
                    inddBtn.Visible = true;
                    Session["inddiamondId"] = dt.Rows[0][11];
                }
                else
                {
                    lblindividualdiamond.Text = "Welcome To PakProperty :)" + "<br/>" + "Your Remaining Adds " + Convert.ToInt32(dt.Rows[0][11]) + "<br/>" + " If you want to post your Add so please buy packages. ThankYou :)";
                    HyperLink10.Visible = true;
                    HyperLink11.Visible = true;
                    HyperLink12.Visible = true;
                }


            }
            else
            {

                Response.Redirect("Login.aspx");
            }
        }
        protected void freeAddProperty(object sender, EventArgs e)
        {
            Session["freeId"] = dt.Rows[0][7].ToString();
            Response.Redirect("PropertyLocation.aspx");
        }
        protected void  goldAddProperty(object sender, EventArgs e)
        {
            Session["goldId"] = dt.Rows[0][8].ToString();
            Response.Redirect("PropertyLocation.aspx");
        }
        protected void diamondAddProperty(object sender, EventArgs e)
        {
            Session["diamondId"] = dt.Rows[0][9].ToString();
            Response.Redirect("PropertyLocation.aspx");
        }
        protected void indGoldAdd(object sender, EventArgs e)
        {
            Session["indgoldId"] = dt.Rows[0][10].ToString();
            Response.Redirect("PropertyLocation.aspx");

        }
        protected void indDiamondAdd(object sender, EventArgs e)
        {
            Session["inddiamondId"] = dt.Rows[0][11].ToString();
            Response.Redirect("PropertyLocation.aspx");
        }
    }
}