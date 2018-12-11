using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PakProperty
{
    public partial class Properties : System.Web.UI.Page
    {

        public static DataTable datatable;
        public static bool abc;
        SqlConnection con;
        readonly PagedDataSource _pgsource = new PagedDataSource();
        int _firstIndex, _lastIndex;
        private int _pageSize = 9;


        protected void Page_Load(object sender, EventArgs e)
        {

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            con.Open();
            
                DataTable dt = Session["dt"] as DataTable;

                if (dt == null)
                {
                    abc = true;
                }
                else
                {
                    abc = false;
                    datatable = (DataTable)Session["dt"];
                   
                   
                }
                
            


            if (!IsPostBack)
            {
                if (Page.IsPostBack) { return; };
                BindDataIntoRepeater();
                viewAdvertisement();
                

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

                Response.Write("<script type=\"text/javascript\">alert('Invalid Id Property');location.href='Properties.aspx'</script>");
                
            }
        }
        

        static List<tblAdd> get()
        {
           
            
            
             DataTable data = new DataTable();
            SqlConnection con;
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["pp"].ToString());
            con.Open();

            // string a = "gulistan";
            if (abc == true)
            {
                SqlCommand cmd = new SqlCommand("select propertyId,pp,pt,cover,address,bed,bath,sq,garage,price,FORMAT(postdate,'MMM dd yyyy') as postedate,userName,proty,coverlink from tblAdds join tblUsersData on tblAdds.userId=tblUsersData.userId where approved=@approved and expdate between GETDATE() and  expdate order by case proty when 'Diamond'  then 1 when 'Gold' then 2 when 'Free' then 3 end", con);
                cmd.Parameters.AddWithValue("@approved", "true");
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(data);
            }
            else 
            {
                data = datatable;
                
            }

            


            

            List<tblAdd> dt = new List<tblAdd>();
            for (int i = 0; i < data.Rows.Count; i++)
            {
                tblAdd bb = new tblAdd();
                bb.propertyId = Convert.ToInt32(data.Rows[i][0]);
                bb.pp = data.Rows[i][1].ToString();
                bb.pt = data.Rows[i][2].ToString();
                try
                {
                    bb.cover = "data:Image/png;base64," + Convert.ToBase64String((byte[])data.Rows[i][3]);
                }
                catch (Exception ex)
                {
                    bb.cover = "/FrontEnd/" + data.Rows[i][13].ToString();
                }
                bb.address = data.Rows[i][4].ToString();
                bb.bed = Convert.ToInt32(data.Rows[i][5]);
                bb.bath = Convert.ToInt32(data.Rows[i][6]);
                bb.sq = data.Rows[i][7].ToString();
                bb.garage = Convert.ToInt32(data.Rows[i][8]);
                bb.price = data.Rows[i][9].ToString();
                bb.postdate = data.Rows[i][10].ToString();
                bb.userName = data.Rows[i][11].ToString();
                bb.proty = data.Rows[i][12].ToString();
                dt.Add(bb);
                


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


        protected void viewAdvertisement()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("advertisementLink", typeof(string));
            dt.Columns.Add("image", typeof(string));


            SqlCommand cmd = new SqlCommand("select * from tblAdvertisement", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dat = new DataTable();
            sda.Fill(dat);
            for (int i = 0; i < dat.Rows.Count; i++)
            {
                dt.Rows.Add(dat.Rows[0][2], "data:Image/png;base64," + Convert.ToBase64String((byte[])dat.Rows[i][3]));
            }
            rptBasic.DataSource = dt;
            rptBasic.DataBind();
            
        }

    }
}