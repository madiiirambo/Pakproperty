using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PakProperty
{
    public partial class Location : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                //DataTable dt = new DataTable();
                //dt.Columns.Add("Name", typeof(string));
                //dt.Columns.Add("Latitude", typeof(string));
                //dt.Columns.Add("Longitude", typeof(string));
                //dt.Columns.Add("Description", typeof(string));
                //dt.Rows.Add("Komal Heavan", 24.9297262, 67.12564480000003, "KW & SB Customer Service And Revenue Department Block 2 Block 2");
                //rptMarkers.DataSource = dt;
                //rptMarkers.DataBind();
                latitude.Value = Convert.ToString(24.9297262);
                longitude.Value = Convert.ToString(67.12564480000003);

            }
        }
    }
}