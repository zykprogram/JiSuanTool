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
    public partial class sbt_custdingtalk_cost : System.Web.UI.Page
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
            //异步请求数据量大后，请求失败，故只限rownum<76
           string strpk = "select b.custcode, b.custname, case when a.custcode_cost is null then '未填写！' else '已填写！' end iswrite,a.* "+
                         " from wb_erp.sbt_dingtalk_cost a, wb_erp.bd_cubasdoc b "+
                            "  where b.custcode = a.custcode_cost(+) "+
                            "   and b.custcode in (select distinct  custcode "+
                    "       from wb_erp.zsj_so_custmoerrelatsalesman c "+
                         "    where c.psncode = '" + userid + "' and c.custname like '%" + name + "%' and type='Y' and isrecently='Y'  and rownum<50)" +
                 "order by a.ts";
;
           OracleDataAdapter ODA = new OracleDataAdapter(strpk, connstring);
           DataSet ds = new DataSet();
           ODA.Fill(ds);
           str = "<ul class='mui-table-view mui-table-view-striped mui-table-view-condensed'>";
           for (i = 0; i < ds.Tables[0].Rows.Count; i++)
           {
               str = str + "<li class='mui-table-view-cell'>											" +
    "	                <div class='mui-table'>											" +
    "	                    <div class='mui-table-cell mui-col-xs-10'>											" +
    "	                        <h4 class='mui-ellipsis'><a href='sbt_custdingtalk_cost_detail.aspx?custcode=" + ds.Tables[0].Rows[i]["custcode"].ToString() + "'>" + ds.Tables[0].Rows[i]["custname"].ToString() + "</a></h4>											" +
    "	                        <h5 style='color:green'>" + ds.Tables[0].Rows[i]["iswrite"].ToString() + "</h5>											" +
    "	                        <p class='mui-h6 mui-ellipsis'>A01仔浓料：" + ds.Tables[0].Rows[i]["NUMBER1"].ToString() + "；A02浓缩料：" + ds.Tables[0].Rows[i]["NUMBER2"].ToString() + "；A04人工乳：" + ds.Tables[0].Rows[i]["NUMBER3"].ToString() + "</p>											" +
    "	                    </div>											" +
    "	                    <div class='mui-table-cell mui-col-xs-2 mui-text-right'>											" +
    "	                        <span class='mui-h5'><a href='sbt_custdingtalk_cost_detail.aspx?custcode=" + ds.Tables[0].Rows[i]["custcode"].ToString() + "'>编辑</a></span>											" +
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