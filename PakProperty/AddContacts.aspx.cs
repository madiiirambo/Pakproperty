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
    public partial class AddContacts : System.Web.UI.Page
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
                    SqlCommand cmd = new SqlCommand("select * from tblContactCategories", con);

                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    ddcontacts.DataTextField = "name";
                    ddcontacts.DataValueField = "id";
                    ddcontacts.DataSource = dt;
                    ddcontacts.DataBind();
                    ddcontacts.Items.Insert(0, new ListItem("--Select--", "0"));
                }
                else
                {
                    Response.Redirect("LoginAdminPanel.aspx");
                }

            }

        }
        protected void add(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select * from tblContacts where number=@number", con);
            cmd.Parameters.AddWithValue("@number", contact.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if(dt.Rows.Count > 0)
            {
                Response.Write("<script>alert('This Contact Already Exist')</script>");
            }
            else
            {
                if(ddcontacts.SelectedValue.Equals("0"))
                {
                    Response.Write("<script>alert('Select Category Please')</script>");
                }
                else
                {
                    SqlCommand command = new SqlCommand("insert into tblContacts (cateId,number) values (@cateId,@number)", con);
                    command.Parameters.AddWithValue("@cateId", ddcontacts.SelectedValue);

                    command.Parameters.AddWithValue("@number", contact.Text);
                    command.ExecuteNonQuery();
                    Response.Write("<script>alert('Contact Add Sucessfull')</script>");
                    contact.Text = "";
                }
            }
        }
    }
}