using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pagination;
using System.Drawing;

namespace PakProperty
{
    public partial class Blog : System.Web.UI.Page
    {
        SqlConnection con;
        readonly PagedDataSource _pgsource = new PagedDataSource();
        int _firstIndex, _lastIndex;
        private int _pageSize = 6;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            con.Open();
            if(!IsPostBack)
            {
                if (Page.IsPostBack) { return; };
                BindDataIntoRepeater();
                
            }



        }


        static List<tblBlog> get()
        {
            string shotdes = string.Empty;
            SqlConnection con;
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT blogId,blogTitle,authorName,blogDescription,blogDate,blogView,blogImage,FORMAT(blogDate, 'dd') as Date, FORMAT(blogDate, 'MMM') as Month from tblBlog", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable data = new DataTable();
            sda.Fill(data);
            List<tblBlog> dt = new List<tblBlog>();
            for (int i = 0; i < data.Rows.Count; i++)
            {
                tblBlog bb = new tblBlog();
                bb.blogId = Convert.ToInt32(data.Rows[i][0]);
                bb.blogTitle = data.Rows[i][1].ToString();
                bb.authorName = data.Rows[i][2].ToString();


                string des = data.Rows[i][3].ToString();
                for (int k = 0; k < 130; k++)
                {
                    shotdes = shotdes + des[k];
                }
                shotdes = shotdes + ". . .";
                bb.blogDescription = shotdes;
                bb.blogDate = Convert.ToDateTime(data.Rows[i][4]);
                bb.blogView = Convert.ToInt32(data.Rows[i][5]);
                bb.blogImage = "data:Image/png;base64," + Convert.ToBase64String((byte[])data.Rows[i][6]);
                bb.Date = data.Rows[i][7].ToString();
                bb.Month = data.Rows[i][8].ToString();
                dt.Add(bb);
                shotdes = string.Empty;
                

            }
            return dt;
        }

        private void BindDataIntoRepeater()
        {
            var dt = get();
            _pgsource.DataSource = dt;
            _pgsource.AllowPaging = true;
            // Number of items to be displayed in the Repeater
            _pgsource.PageSize = _pageSize;
            _pgsource.CurrentPageIndex = CurrentPage;
            // Keep the Total pages in View State
            ViewState["TotalPages"] = _pgsource.PageCount;
            // Example: "Page 1 of 10"
            //lblpage.Text = "Page " + (CurrentPage + 1) + " of " + _pgsource.PageCount;
            // Enable First, Last, Previous, Next buttons
            PreBtn.Enabled = !_pgsource.IsFirstPage;
            NextBtn.Enabled = !_pgsource.IsLastPage;


            // Bind data into repeater
            rptResult.DataSource = _pgsource;
            rptResult.DataBind();

            // Call the function to do paging
            HandlePaging();
        }
        private void HandlePaging()
        {
            var dt = new DataTable();
            dt.Columns.Add("PageIndex"); //Start from 0
            dt.Columns.Add("PageText"); //Start from 1

            _firstIndex = CurrentPage - 5;
            if (CurrentPage > 5)
                _lastIndex = CurrentPage + 5;
            else
                _lastIndex = 10;

            // Check last page is greater than total page then reduced it 
            // to total no. of page is last index
            if (_lastIndex > Convert.ToInt32(ViewState["TotalPages"]))
            {
                _lastIndex = Convert.ToInt32(ViewState["TotalPages"]);
                _firstIndex = _lastIndex - 10;
            }

            if (_firstIndex < 0)
                _firstIndex = 0;

            // Now creating page number based on above first and last page index
            for (var i = _firstIndex; i < _lastIndex; i++)
            {
                var dr = dt.NewRow();
                dr[0] = i;
                dr[1] = i + 1;
                dt.Rows.Add(dr);
            }

            rptPaging.DataSource = dt;
            rptPaging.DataBind();
        }

        protected void rptPaging_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (!e.CommandName.Equals("newPage")) return;
            CurrentPage = Convert.ToInt32(e.CommandArgument.ToString());
            BindDataIntoRepeater();
        }

        protected void rptPaging_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            var lnkPage = (LinkButton)e.Item.FindControl("lbPaging");
            if (lnkPage.CommandArgument != CurrentPage.ToString()) return;
            lnkPage.Enabled = false;
            lnkPage.BackColor = Color.FromName("#337ab7");
        }

        protected void PrevButton_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;
            BindDataIntoRepeater();
        }

        protected void NextBtn_Click(object sender, EventArgs e)
        {
            CurrentPage += 1;
            BindDataIntoRepeater();
        }

        private int CurrentPage
        {
            get
            {
                if (ViewState["CurrentPage"] == null)
                {
                    return 0;
                }
                return ((int)ViewState["CurrentPage"]);
            }
            set
            {
                ViewState["CurrentPage"] = value;
            }
        }


        public void getProperty(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select * from tblAdds where propertyId=@propertyId", con);
            cmd.Parameters.AddWithValue("@propertyId", TextBox1.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Response.Redirect("AddDetails.aspx?id=" + Convert.ToInt32(dt.Rows[0][0]));
            }
            else
            {

                Response.Write("<script type=\"text/javascript\">alert('Invalid Id Property');location.href='Blog.aspx'</script>");

            }
        }

    }
}