using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace PakProperty
{
    /// <summary>
    /// Summary description for PopupAdds
    /// </summary>
    public class PopupAdds : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            int displayLength = int.Parse(context.Request["iDisplayLength"]);
            int displayStart = int.Parse(context.Request["iDisplayStart"]);
            int sortCol = int.Parse(context.Request["iSortCol_0"]);
            string sortDir = context.Request["sSortDir_0"];
            string search = context.Request["sSearch"];

            string cs = ConfigurationManager.ConnectionStrings["pp"].ConnectionString;
            List<Pop> listPartners = new List<Pop>();
            int filteredCount = 0;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spGetPopupAdds", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paramDisplayLength = new SqlParameter()
                {
                    ParameterName = "@DisplayLength",
                    Value = displayLength
                };
                cmd.Parameters.Add(paramDisplayLength);

                SqlParameter paramDisplayStart = new SqlParameter()
                {
                    ParameterName = "@DisplayStart",
                    Value = displayStart
                };
                cmd.Parameters.Add(paramDisplayStart);

                SqlParameter paramSortCol = new SqlParameter()
                {
                    ParameterName = "@SortCol",
                    Value = sortCol
                };
                cmd.Parameters.Add(paramSortCol);

                SqlParameter paramSortDir = new SqlParameter()
                {
                    ParameterName = "@SortDir",
                    Value = sortDir
                };
                cmd.Parameters.Add(paramSortDir);

                SqlParameter paramSearchString = new SqlParameter()
                {
                    ParameterName = "@Search",
                    Value = string.IsNullOrEmpty(search) ? null : search
                };
                cmd.Parameters.Add(paramSearchString);

                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Pop part = new Pop();
                    part.popupId = Convert.ToInt32(rdr["popupId"]);
                    filteredCount = Convert.ToInt32(rdr["TotalCount"]);
                    part.popupName = rdr["popupName"].ToString();

                    listPartners.Add(part);
                }
            }

            var result = new
            {
                iTotalRecords = GetPartnerTotalCount(),
                iTotalDisplayRecords = filteredCount,
                aaData = listPartners
            };

            JavaScriptSerializer js = new JavaScriptSerializer();
            context.Response.Write(js.Serialize(result));
        }

        private int GetPartnerTotalCount()
        {
            int totalEmployeeCount = 0;
            string cs = ConfigurationManager.ConnectionStrings["pp"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new
                    SqlCommand("select count(*) from tblPopupAdds", con);
                con.Open();
                totalEmployeeCount = (int)cmd.ExecuteScalar();
            }
            return totalEmployeeCount;
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}