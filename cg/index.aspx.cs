﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.cg
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DBCommon.DbHelperOra.LoginLog("", Request.ServerVariables.Get("REMOTE_ADDR"), "原料成本小工具");
        }
    }
}