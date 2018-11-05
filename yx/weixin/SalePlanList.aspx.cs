using Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OracleClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.yx.weixin
{
    public partial class SalePlanList : System.Web.UI.Page
    {
        protected string log_user = "";
        protected string log_corp = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["usercode"] != null)
            {
                log_user = Convert.ToString(Request.QueryString["usercode"]);
            }
            if (Request.QueryString["pk_corp"]!= null)
            {
                log_corp = Request.QueryString["pk_corp"];
            }
            else
            {
                Response.Redirect("/login.aspx");
            }
            if (!IsPostBack)
            {
                BindPlanDataList();
            }
        }
        /// <summary>
        /// 更新列表数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            string[] curupdateDate = hidNewDt.Value.Split(';');
            if (curupdateDate.Length == 0)
            { return; }
            OracleConnection ConnectionStringJXC = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringJXC"].ConnectionString);
            ConnectionStringJXC.Open();//打开链接
            OracleCommand cmd = new OracleCommand();//创建执行类
            cmd.Connection = ConnectionStringJXC;
            OracleTransaction tx = ConnectionStringJXC.BeginTransaction();
            cmd.Transaction = tx;//开启链接事务
            try
            {
                for (int i = 0; i < curupdateDate.Length; i++)
                {
                    string[] curRowDate = curupdateDate[i].Split(',');
                    string strSql = "update tmp_nc_xsjh_b t set t.NUM='" + curRowDate[1] + "'  where t.PK_TMP_NC_XSJH_B='" + curRowDate[0] + "'";
                    cmd.CommandText = strSql; 
                    int exIn = cmd.ExecuteNonQuery();
                }
                tx.Commit();
            }
            catch (System.Data.OracleClient.OracleException E)
            {
                 tx.Rollback();
                 MessageBox.ShowAndRedirect(this, "保存销售计划列表失败，请联系系统管理员！", "SalePlanList.aspx");
                 return;
            }
            ConnectionStringJXC.Close();
            BindPlanDataList();
            //MessageBox.ShowAndRedirect(this, "保存操作成功！", "SalePlanList.aspx");
        }

        protected void Delete_Command(object sender, CommandEventArgs e)
        {
            string strId = e.CommandArgument.ToString().Trim();
            OracleConnection ConnectionStringJXC = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringJXC"].ConnectionString);           
            ConnectionStringJXC.Open();//打开链接
            OracleCommand cmd = new OracleCommand();//创建执行类
            cmd.Connection = ConnectionStringJXC;
            OracleTransaction tx = ConnectionStringJXC.BeginTransaction();
            cmd.Transaction = tx;//开启链接事务   
            try
            {
                cmd.CommandText = "update tmp_nc_xsjh_b set dr='1' where PK_TMP_NC_XSJH_B='"+strId+"'";
                cmd.ExecuteNonQuery();
                cmd.CommandText="select t.PK_TMP_NC_XSJH from tmp_nc_xsjh_b t where t.dr=0 and t.PK_TMP_NC_XSJH in";
                cmd.CommandText+= "(select b.PK_TMP_NC_XSJH from tmp_nc_xsjh_b b where b.PK_TMP_NC_XSJH_B='" + strId + "') ";
                //OracleDataAdapter cmdSQL = new OracleDataAdapter(strSql.ToString(), ConnectionStringJXC);
                object ret=cmd.ExecuteOracleScalar();
                if (ret == null)//如果计划表体已经删光则删除表体
                {
                    cmd.CommandText = "update tmp_nc_xsjh t set t.dr='1' where t.PK_TMP_NC_XSJH in (select b.PK_TMP_NC_XSJH from tmp_nc_xsjh_b b where b.PK_TMP_NC_XSJH_B='" + strId + "' )";
                    cmd.ExecuteNonQuery();
                }
            }
            catch (System.Data.OracleClient.OracleException E)
            {
                tx.Rollback();
                ConnectionStringJXC.Close();
                MessageBox.ShowAndRedirect(this, "删除销售计划信息失败，请联系系统管理员！", "SalePlanList.aspx");
                BindPlanDataList();
            }
            tx.Commit();
            ConnectionStringJXC.Close();
            BindPlanDataList();
           // MessageBox.ShowAndRedirect(this, "删除成功！", "SalePlanList.aspx");
        }
        /// <summary>
        /// 绑定历史销售计划数据
        /// </summary>
        private void BindPlanDataList()
        {
            OracleConnection ConnectionStringJXC = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringJXC"].ConnectionString);
            ConnectionStringJXC.Open();
            StringBuilder strSql = new StringBuilder();
            //strSql.Append("select t.FREE3 GCMC,t.DBILLDATE THRQ,substr(t.VRECEIPTCODE,-4) NC_DJBH,b.PK_TMP_NC_XSJH_B PK_BH,b.CINVENTORYID CHGLDA,b.FREE1 WL,b.NUM BS from tmp_nc_xsjh t,tmp_nc_xsjh_b b where t.PK_TMP_NC_XSJH=b.PK_TMP_NC_XSJH");
            //strSql.Append(" and b.dr='0' and t.dr='0' and t.flag='0'"); ;
            //strSql.Append(" and b.blargessflag='N'");
            //strSql.Append(" and t.pk_corp='" + log_corp + "'  and  t.FREE1='" + log_user + "' order by t.DBILLDATE DESC,t.PK_TMP_NC_XSJH DESC ");

            strSql.Append("  select * from(select t.custname GCMC,");
            strSql.Append(" replace(t.DBILLDATE,'-','.') THRQ,");
            strSql.Append("  t.VRECEIPTCODE,");
            strSql.Append("  t.flag,to_char(t.PK_TMP_NC_XSJH) PK_TMP_NC_XSJH, null PK_BH,");
            strSql.Append("  '' CHGLDA,");
            strSql.Append("  '' WL,");
            strSql.AppendFormat("  null BS from tmp_nc_xsjh t where ");
            strSql.AppendFormat(" t.pk_corp='{0}'  and  t.custcode='{1}' AND t.dr='0'", log_corp, log_user);
            strSql.AppendFormat("  and t.PK_TMP_NC_XSJH in (select b.PK_TMP_NC_XSJH from tmp_nc_xsjh_b b where  b.dr='0'  and b.blargessflag='N' ) ");
            strSql.AppendFormat("  and t.dbilldate >to_char(sysdate - 30,'yyyy-MM-dd') ");
            
            strSql.Append(" union all select '' GCMC,");
            strSql.Append("  '' THRQ,");
            strSql.Append("  ''  VRECEIPTCODE , ");
            strSql.Append("  t.flag flag,to_char(b.PK_TMP_NC_XSJH) PK_TMP_NC_XSJH, b.PK_TMP_NC_XSJH_B PK_BH,");
            strSql.Append("  b.CINVENTORYID CHGLDA,");
            strSql.Append("  b.INVNAME WL,");
            strSql.Append("  b.NUM BS   from tmp_nc_xsjh_b b,tmp_nc_xsjh t where t.PK_TMP_NC_XSJH=b.PK_TMP_NC_XSJH and");
            strSql.AppendFormat("   b.dr='0'  and b.blargessflag='N' and t.pk_corp='{0}'  and t.dbilldate >to_char(sysdate - 30,'yyyy-MM-dd')   and  t.custcode='{1}' AND t.dr='0')xxhj", log_corp, log_user);
            strSql.Append("   order by xxhj.PK_TMP_NC_XSJH desc,xxhj.THRQ ");


            DataSet dsWLXX = new DataSet();
            OracleDataAdapter cmdSQL = new OracleDataAdapter(strSql.ToString(), ConnectionStringJXC);
            cmdSQL.Fill(dsWLXX);
            ConnectionStringJXC.Close();
            rptPlanList.DataSource = dsWLXX.Tables[0].DefaultView;
            rptPlanList.DataBind();
        }

    }
}