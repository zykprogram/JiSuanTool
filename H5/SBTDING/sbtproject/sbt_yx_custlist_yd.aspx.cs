using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace WebApp.H5.SBTDING.sbtproject
{
    public partial class sbt_yx_custlist_yd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
 
        [System.Web.Services.WebMethod]
        public static string VeryUserName(string name, string userid)
        {
            int i=0;
            string str = "";
           OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringWb_erp"].ConnectionString);
           connstring.Open(); 
           //表头PK
           string strpk = "select y.*,round(y.tar,4)*100||'%' as tart from sbt_customerlose_yd y where   custcode in (select custcode    from wb_erp.zsj_so_custmoerrelatsalesman a where type='Y'   and a.salestr  in  (select bmname    from wb_erp.zsj_ddm_userinfo b  where b.user_name = '" + userid + "'        )) " +
            " and tar<=-0.5 and losemonth = (select max(losemonth) from sbt_customerlose_yd)  order by ts ";
           OracleDataAdapter ODA = new OracleDataAdapter(strpk, connstring);
           DataSet ds = new DataSet();
           ODA.Fill(ds);
           str = "<ul class='mui-table-view mui-table-view-striped mui-table-view-condensed'>";
           for (i = 0; i < ds.Tables[0].Rows.Count; i++)
           {
               str = str + "<li class='mui-table-view-cell'>											" +
 "	                <div class='mui-table'>											" +
 "	                    <div class='mui-table-cell mui-col-xs-10'>											" +
 "	                        <h4 class='mui-ellipsis'><a href='sbt_yx_custdetail_yd.aspx?id=" + ds.Tables[0].Rows[i]["id"].ToString() + "'>" + ds.Tables[0].Rows[i]["custname"].ToString() + "</a></h4>											" +
 "	                        <h5>" + ds.Tables[0].Rows[i]["custtype"].ToString() + "；上月定级：" + ds.Tables[0].Rows[i]["custlevel"].ToString() + "；<br>本期标吨：" + ds.Tables[0].Rows[i]["bqnnumber"].ToString() + "；上期标吨：" + ds.Tables[0].Rows[i]["sqnnumber"].ToString() + "；<br>环比增长率：" + ds.Tables[0].Rows[i]["tart"].ToString() + "；</h5>											" +
 "	                        <p class='mui-h6 mui-ellipsis'>异动原因1：" + ds.Tables[0].Rows[i]["reason"].ToString() + "；竞争厂商：" + ds.Tables[0].Rows[i]["competitor"].ToString() + "</p>											" +
 "	                    </div>											" +
 "	                    <div class='mui-table-cell mui-col-xs-2 mui-text-right'>											" +
 "	                        <span class='mui-h5'><a href='sbt_yx_custdetail_yd.aspx?id=" + ds.Tables[0].Rows[i]["id"].ToString() + "'>编辑</a></span>											" +
 "	                    </div>											" +
 "	                </div>											" +
 "	            </li>											";
           }
            str = str + "</ul>";
           // str = ds.Tables[0].Rows[0]["id"].ToString();
           //OracleCommand OCMDQT = new OracleCommand(strSQLQT, connstring);
           //OCMDQT.ExecuteNonQuery();
            connstring.Close();
           return str;
        }
    }
}