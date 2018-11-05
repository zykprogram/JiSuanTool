using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.H5.SBTDING.sbtproject
{
    public partial class sbt_custdingtalk_cost_detail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string custcode_query = Request.QueryString["custcode"];
                getCustname(custcode_query);
            }
        }

        protected void getCustname(string custcode_query)
        {
            OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringWb_erp"].ConnectionString);
            connstring.Open();
            //表头PK
            string strpk = "select b.custcode, b.custname, case when a.custcode_cost is null then '未填写,请填写！' else '已填写！' end iswrite,a.* " +
                         " from wb_erp.sbt_dingtalk_cost a, wb_erp.bd_cubasdoc b " +
                            "  where b.custcode = a.custcode_cost(+) " +
                     " and b.custcode='"+custcode_query+"' ";
            OracleDataAdapter ODA = new OracleDataAdapter(strpk, connstring);
            DataSet ds = new DataSet();
            ODA.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
              custname.Value=  ds.Tables[0].Rows[0]["custname"].ToString();
              custcode.Value = ds.Tables[0].Rows[0]["custcode"].ToString();
              NUMBER1.Value = ds.Tables[0].Rows[0]["NUMBER1"].ToString();
              NUMBER2.Value = ds.Tables[0].Rows[0]["NUMBER2"].ToString();
              NUMBER3.Value = ds.Tables[0].Rows[0]["NUMBER3"].ToString();
              NUMBER4.Value = ds.Tables[0].Rows[0]["NUMBER4"].ToString();
              NUMBER5.Value = ds.Tables[0].Rows[0]["NUMBER5"].ToString();
              NUMBER6.Value = ds.Tables[0].Rows[0]["NUMBER6"].ToString();
              NUMBER7.Value = ds.Tables[0].Rows[0]["NUMBER7"].ToString();
              NUMBER8.Value = ds.Tables[0].Rows[0]["NUMBER8"].ToString();
              NUMBER9.Value = ds.Tables[0].Rows[0]["NUMBER9"].ToString();
              NUMBER10.Value = ds.Tables[0].Rows[0]["NUMBER10"].ToString();
              NUMBER11.Value = ds.Tables[0].Rows[0]["NUMBER10"].ToString();
              NUMBER12.Value = ds.Tables[0].Rows[0]["NUMBER12"].ToString();
              NUMBER13.Value = ds.Tables[0].Rows[0]["NUMBER13"].ToString();
              NUMBER14.Value = ds.Tables[0].Rows[0]["NUMBER14"].ToString();
              NUMBER15.Value = ds.Tables[0].Rows[0]["NUMBER15"].ToString();
              NUMBER16.Value = ds.Tables[0].Rows[0]["NUMBER16"].ToString();
              NUMBER17.Value = ds.Tables[0].Rows[0]["NUMBER17"].ToString();
              NUMBER18.Value = ds.Tables[0].Rows[0]["NUMBER18"].ToString();
              NUMBER19.Value = ds.Tables[0].Rows[0]["NUMBER19"].ToString();
              NUMBER20.Value = ds.Tables[0].Rows[0]["NUMBER20"].ToString();
              NUMBER21.Value = ds.Tables[0].Rows[0]["NUMBER21"].ToString();
              NUMBER22.Value = ds.Tables[0].Rows[0]["NUMBER22"].ToString();
            }
            connstring.Close();
        }

       


        [System.Web.Services.WebMethod]
        public static string insertvalue(string custcode, string number1, string number2, string number3, string number4, string number5, string number6, string number7, string number8, string number9, string number10, string number11, string number12, string number13, string number14, string number15, string number16, string number17, string number18, string number19, string number20, string number21, string number22)
        {
   
            OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringWb_erp"].ConnectionString);
            connstring.Open();
         
            //表头PK
            //先删除客户相关的数据
            string strdelete = "delete from wb_erp.sbt_dingtalk_cost where custcode_cost ='" + custcode + "'";
            OracleCommand OCMDQT = new OracleCommand(strdelete, connstring);
            OCMDQT.ExecuteNonQuery();

            //写入数据
            string strinsert = "insert into wb_erp.sbt_dingtalk_cost (CUSTCODE_COST, number1, number2, number3, number4, number5, number6, number7, number8, number9, number10, number11, number12, number13, number14, number15, number16, number17, number18, number19, number20, number21, number22, TS) "+
            " values ('" + custcode + "', '" + number1 + "','" + number2 + "','" + number3 + "','" + number4 + "','" + number5 + "','" + number6 + "','" + number7 + "','" + number8 + "','" + number9 + "','" + number10 + "','" + number11 + "','" + number12 + "','" + number13 + "','" + number14 + "','" + number15 + "','" + number16 + "','" + number17 + "','" + number18 + "','" + number19 + "','" + number20 + "','" + number21 + "','" + number22 + "',to_char(sysdate,'yyyy-mm-dd hh24:mi:ss'))";
            OCMDQT = new OracleCommand(strinsert, connstring);
            Console.Out.WriteLine(strinsert);
            OCMDQT.ExecuteNonQuery();
            connstring.Close();
            return strinsert;
        }
    }
}