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
    public partial class sbt_yx_custlist : System.Web.UI.Page
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
           string strpk = "select * from sbt_customerlose where   custcode in (select custcode    from wb_erp.zsj_so_custmoerrelatsalesman a where type='Y'   and a.salestr  in  (select bmname    from wb_erp.zsj_ddm_userinfo b  where b.user_name = '" + userid + "'        )) " +
         "and losemonth like '%" + name + "%'  order by losemonth desc";
           OracleDataAdapter ODA = new OracleDataAdapter(strpk, connstring);
           DataSet ds = new DataSet();
           ODA.Fill(ds);
           str = "<ul class='mui-table-view mui-table-view-striped mui-table-view-condensed'>";
           for (i = 0; i < ds.Tables[0].Rows.Count; i++)
           {
               str = str + "<li class='mui-table-view-cell'>											" +
 "	                <div class='mui-table'>											" +
 "	                    <div class='mui-table-cell mui-col-xs-10'>											" +
 "	                        <h4 class='mui-ellipsis'><a href='sbt_yx_custdetail.aspx?id=" + ds.Tables[0].Rows[i]["id"].ToString() + "'>" + ds.Tables[0].Rows[i]["custname"].ToString() + "</a></h4>											" +
 "	                        <h5>" + ds.Tables[0].Rows[i]["custtype"].ToString() + "；新开时间：" + ds.Tables[0].Rows[i]["opendate"].ToString() + "<br>定级标吨：" + ds.Tables[0].Rows[i]["djbd"].ToString() + "；流失月份：" + ds.Tables[0].Rows[i]["losemonth"].ToString() + "</h5>											" +
 "	                        <p class='mui-h6 mui-ellipsis'>流失原因1：" + ds.Tables[0].Rows[i]["reason"].ToString() + "；竞争厂商：" + ds.Tables[0].Rows[i]["competitor"].ToString() + "</p>											" +
 "	                    </div>											" +
 "	                    <div class='mui-table-cell mui-col-xs-2 mui-text-right'>											" +
 "	                        <span class='mui-h5'><a href='sbt_yx_custdetail.aspx?id=" + ds.Tables[0].Rows[i]["id"].ToString() + "'>编辑</a></span>											" +
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