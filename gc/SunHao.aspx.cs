﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.gc
{
    public partial class SunHao : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DBCommon.DbHelperOra.LoginLog("", Request.ServerVariables.Get("REMOTE_ADDR"), "损耗率计算小工具");
        }
    }
}