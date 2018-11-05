using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.yx
{
    public partial class tool4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DBCommon.DbHelperOra.LoginLog("", Request.ServerVariables.Get("REMOTE_ADDR"), "猪三乐36950+55PK自配料小工具");
        }
    }
}