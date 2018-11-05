using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;

using System.Data.OracleClient;



namespace WebApp.yx
{
    /// <summary>
    /// WebService1 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://sbtjt.jisuan.yh.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
    [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        [WebMethod]
        //双胞胎饲料
        public string[] GetSBTCompleteList(string prefixText, int count)
        {
            OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringTool"].ConnectionString);
            connstring.Open();
            string strSQL = "select sz_name from T_SZ_DIC where type='SBTSL' and sz_name like '%" + prefixText + "%'";

            OracleDataAdapter ODA = new OracleDataAdapter(strSQL, connstring);
            DataSet ds = new DataSet();
            ODA.Fill(ds);

            //  DataSet ds = DBUtility.DbHelperOra.Query("select sz_name from T_SZ_DIC where type='SBTSL' and sz_name like '%" + prefixText + "%'");


            string[] returnvalue = new string[ds.Tables[0].Rows.Count];
            for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
            {
                returnvalue[i - 1] = ds.Tables[0].Rows[i - 1][0].ToString();
            }
            connstring.Close();
            return (returnvalue);

        }
        //经销商饲料
        [WebMethod]
        public string[] GetJXSCompleteList(string prefixText, int count)
        {

            OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringTool"].ConnectionString);
            connstring.Open();
            string strSQL = "select sz_name from T_SZ_DIC where type='JXSSL' and sz_name like '%" + prefixText + "%'";

            OracleDataAdapter ODA = new OracleDataAdapter(strSQL, connstring);
            DataSet ds = new DataSet();
            ODA.Fill(ds);


            //  DataSet ds = DBUtility.DbHelperOra.Query("select sz_name from T_SZ_DIC where type='JXSSL' and sz_name like '%" + prefixText + "%'");
            string[] returnvalue = new string[ds.Tables[0].Rows.Count];
            for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
            {
                returnvalue[i - 1] = ds.Tables[0].Rows[i - 1][0].ToString();
            }
            connstring.Close();
            return (returnvalue);
        }



        //获取公司信息
        [WebMethod]
        public string[] GetPK_Corp(string prefixText, int count, string contextKey)
        {

            OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringNC"].ConnectionString);
            connstring.Open();
            //string strSQL = "select unitname "+
            //                " from nc.bd_corp p"+
            //                " where p.pk_corp in (select distinct pk_corp"+
            //                "  from nc.sbt_custinvlist lis"+
            //                "   where nvl(dr, 0) = 0"+
            //                "   and vdef20 = 'Y'"+
            //                "    and lis.cemployeeid in"+
            //                "    (select distinct a.pk_psndoc"+
            //                "     from nc.bd_psndoc a" +
            //                "    where a.psncode = '" + contextKey + "'))" +
            //                " and unitname like  '%" + prefixText + "%'";
            string strSQL = "select unitname from nc.bd_corp  where dr=0 and  unitname like '%" + prefixText + "%'";
            OracleDataAdapter ODA = new OracleDataAdapter(strSQL, connstring);
            DataSet ds = new DataSet();
            ODA.Fill(ds);


            //  DataSet ds = DBUtility.DbHelperOra.Query("select sz_name from T_SZ_DIC where type='JXSSL' and sz_name like '%" + prefixText + "%'");
            string[] returnvalue = new string[ds.Tables[0].Rows.Count];
            for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
            {
                returnvalue[i - 1] = ds.Tables[0].Rows[i - 1][0].ToString();
            }
            connstring.Close();
            return (returnvalue);
        }

        //获取客商信息
        [WebMethod]
        public string[] GetCubasdoc(string prefixText, int count, string contextKey)
        {
         //   contextKey = "江西双胞胎实业有限公司";需要根据人员过滤客商
            string strSQL= "select cub.custcode || '_' || cub.custname"+
            " from nc.bd_cubasdoc cub" +
            "  where cub.pk_cubasdoc in"+
              "      (select pk_cubasdoc"+
                "       from nc.bd_cumandoc cuman"+
                   "   where cuman.pk_cumandoc in"+
                   "         (select distinct a.ccustmanid"+
                    "           from nc.sbt_custinvlist a"+
                     "         where a.cemployeeid in"+
                       "             (select pk_psndoc"+
                        "               from nc.bd_psndoc b"+
                         "             where b.outdutydate is null"+
                          //               --  and nvl(b.isreferenced,'N')='N'
                         "               and b.psncode = '" + contextKey + "')))";

            OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringNC"].ConnectionString);
            connstring.Open();
         //   string strSQL = "select custcode||'-'||custname from  nc.bd_cubasdoc where dr=0 and  custname like  '%" + prefixText + "%'";
         //string strSQL = "select custcode||'-'||custname  from  nc.bd_cubasdoc where dr=0 and  custname like  '%" + prefixText + "%'";

            OracleDataAdapter ODA = new OracleDataAdapter(strSQL, connstring);
            DataSet ds = new DataSet();
            ODA.Fill(ds);



            string[] returnvalue = new string[ds.Tables[0].Rows.Count];
            for (int i = 1; i <= ds.Tables[0].Rows.Count; i++)
            {
                returnvalue[i - 1] = ds.Tables[0].Rows[i - 1][0].ToString();
            }
            connstring.Close();
            return (returnvalue);
        }
    }
}
