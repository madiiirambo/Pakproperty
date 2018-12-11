using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PakProperty
{
    public partial class PropertyLocation : System.Web.UI.Page
    {
     
        protected void Page_Load(object sender, EventArgs e)
        {
             
            if (!string.IsNullOrEmpty(Session["id"] as string))
            {

                if (!string.IsNullOrEmpty(Session["freeId"] as string))
                {


                }
                else if (!string.IsNullOrEmpty(Session["diamondId"] as string))
                {

                }
               else if (!string.IsNullOrEmpty(Session["goldId"] as string))
                {


                }
                else if (!string.IsNullOrEmpty(Session["indgoldId"] as string))
                {

                }
                else if (!string.IsNullOrEmpty(Session["inddiamondId"] as string))
                {

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
        protected void details(object sender, EventArgs e)
        {


            if (latitude.Text == "" && longitude.Text == "")
            {
                Response.Write("<script>alert('Add Location PLease')</script>");
            }

            else if (!string.IsNullOrEmpty(Session["freeId"] as string))
            {
                Session["freeId"] = null;
                Session["lat"] = latitude.Text;
                Session["lng"] = longitude.Text;
                Session["add"] = add.Text;
                Response.Redirect("FreeAdd.aspx");
            }
            else if (!string.IsNullOrEmpty(Session["diamondId"] as string))
            {
                Session["diamondId"] = null;
                Session["lat"] = latitude.Text;
                Session["lng"] = longitude.Text;
                Session["add"] = add.Text;
                Response.Redirect("DiamondAdd.aspx");
            }
            if (!string.IsNullOrEmpty(Session["goldId"] as string))
            {
                Session["goldId"] = null;
                Session["lat"] = latitude.Text;
                Session["lng"] = longitude.Text;
                Session["add"] = add.Text;
                Response.Redirect("GoldAdd.aspx");

            }
            else if (!string.IsNullOrEmpty(Session["indgoldId"] as string))
            {
                Session["indgoldId"] = null;
                Session["lat"] = latitude.Text;
                Session["lng"] = longitude.Text;
                Session["add"] = add.Text;
                Response.Redirect("IndividualGoldAdd.aspx");
            }
            else if (!string.IsNullOrEmpty(Session["inddiamondId"] as string))
            {
                Session["inddiamondId"] = null;
                Session["lat"] = latitude.Text;
                Session["lng"] = longitude.Text;
                Session["add"] = add.Text;
                Response.Redirect("IndividualDiamondAdd.aspx");
            }
        }

    }
}