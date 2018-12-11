using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PakProperty
{
    public class tblBlog
    {
        public int blogId { get; set; }
        public string blogTitle { get; set; }
        public string authorName { get; set; }
        public string blogDescription { get; set; }
        public DateTime blogDate { get; set; }
        public int blogView { get; set; }

        public string blogImage { get; set; }
        public string Date { get; set; }
        public string Month { get; set; }
        

    }
}