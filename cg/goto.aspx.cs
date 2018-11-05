using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.cg
{
    public partial class _goto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["m"]))
            {
                if (Request.QueryString["m"].ToString() == "18607080902" || Request.QueryString["m"].ToString() == "18170807170" || Request.QueryString["m"].ToString() == "13657943215" || Request.QueryString["m"].ToString() == "17687917664" || Request.QueryString["m"].ToString() == "15270972737" || Request.QueryString["m"].ToString() == "13697059610" || Request.QueryString["m"].ToString() == "18170807366" || Request.QueryString["m"].ToString() == "18170807899")
                {
                    DBCommon.DbHelperOra.LoginLog(Request.QueryString["m"].ToString(), Request.ServerVariables.Get("REMOTE_ADDR"), "原料比价小工具");
                    Response.Redirect("http://59.55.142.211:9527/ReportServer?reportlet=CGPG/app/pt_bj.cpt&op=view");
                }
                else if (Request.QueryString["m"] == "18170808888" || Request.QueryString["m"] == "18170807088" || Request.QueryString["m"] == "18170809678" || Request.QueryString["m"] == "13803516092" || Request.QueryString["m"] == "18170807047" || Request.QueryString["m"] == "18170807068" || Request.QueryString["m"] == "15070893550" || Request.QueryString["m"] == "18170807065" || Request.QueryString["m"] == "18679135154" || Request.QueryString["m"] == "18170807043" || Request.QueryString["m"] == "15180447961" || Request.QueryString["m"] == "15079190650" || Request.QueryString["m"] == "18170807668" || Request.QueryString["m"] == "18170805873" || Request.QueryString["m"].ToString() == "15879083330" || Request.QueryString["m"].ToString() == "18170807013")
                {
                    DBCommon.DbHelperOra.LoginLog(Request.QueryString["m"].ToString(), Request.ServerVariables.Get("REMOTE_ADDR"), "原料比价小工具");
                    Response.Redirect("http://59.55.142.211:9527/ReportServer?reportlet=CGPG/app/ld_bj.cpt&op=view");
                }
                else
                {
                    //Common.MessageBox.ShowAndRedirect(this, "对不起，无访问权限!", "http://59.55.142.211:8088/Main.aspx");
                    Response.Redirect("http://59.55.142.211:8088/Main.aspx");
                }
            }
        }
    }
}