using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.yx.weixin
{
    public partial class ActiveList : System.Web.UI.Page
    {
        #region 定义AJAX属性 wensx 2014-10-11
        private string _taget;
        protected string Taget
        {
            get { return _taget; }
            set { _taget = value; }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            Taget = Request.Form["taget"];
            if (Taget == "AjaxGet")
            {
                AjaxGetCust();
            }
        }

        protected void AjaxGetCust()
        {
            Response.Write("success");
            Response.End();
        }

    }
}