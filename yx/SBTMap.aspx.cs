using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.IO;
using System.Text;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Common;
using System.Data.OracleClient;

namespace WebApp.yx
{
    public partial class SBTMap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime now = DateTime.Now;
            DateTime d1 = new DateTime(now.Year, now.Month, 1);
            DateTime d2 = d1.AddMonths(1).AddDays(-1);

            KSRQ.Text = d1.ToString("yyyy-MM-dd");
            JSRQ.Text = d2.ToString("yyyy-MM-dd");
            string Taget = Request.Form["taget"];
            switch (Taget)
            {
                case "cxzb":
                    Button1_Click1(Request.Form["username"], Request.Form["ksrq"], Request.Form["jsrq"]);
                    break;
                default:
                    break;
            }
        }




        protected void Button1_Click1(string username, string ksrq, string jsrq)
        {

            OracleConnection connstringWb_erp = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringWb_erp"].ConnectionString);
            connstringWb_erp.Open();
            string strOA = "select psncode," +
          "b.display_name," +
          "a.visit_jd," +
           " a.visit_wd," +
          " substr(a.visitime, 0, 10) visitime," +
           " substr(visitime,9,2)||'号' rq" +
          " from wb_erp.app_maincust_visit a, wb_erp.zsj_ddm_userinfo b" +
          " where a.psncode = b.user_name" +
          " and (b.display_name = '" + username + "' or a.psncode = '" + username + "')" +
                //  "and substr(a.visitime, 0, 7) = to_char(sysdate, 'yyyy-mm')" +
                " and a.visitime>='" + ksrq + "'" +
                 " and substr(a.visitime,0,10)<='" + jsrq + "'" +
          " order by a.ts asc";
            OracleDataAdapter adapterOA = new OracleDataAdapter(strOA, connstringWb_erp);
            DataSet tblDatas = new DataSet();
            adapterOA.Fill(tblDatas);
            connstringWb_erp.Close();
            string JsonStr = JsonConvert.SerializeObject(tblDatas);
            Response.Clear();
            Response.Write(JsonStr);
            Response.End();

        }



        public int now { get; set; }
    }
}