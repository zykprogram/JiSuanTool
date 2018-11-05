using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;
using Common;
using System.Data;

namespace WebApp.yx.weixin
{
    public partial class SalesPlan : System.Web.UI.Page
    {
       protected  string log_user = "";
       // string log_corp = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["username"] != null )
            //{
            //    log_user = Convert.ToString(Session["username"]);
            //   // log_corp = Convert.ToString(Session["pk_corp"]);
            //}
            if (Request.QueryString["usercode"] != null)
            {
                log_user = Convert.ToString(Request.QueryString["usercode"]);
            }
            else
            {
                Response.Redirect("/login.aspx");
            }
            if (!IsPostBack)
            {
                GetGCXX();
              //  Common.PublicFun.BindData(DplTHGC, GetGCXX(), "thgc", "gcbh");
              //  log_corp = DplTHGC.SelectedItem.Value;//将选定的工厂加入seesion
              //  Session["pk_corp"] = log_corp;
              // TextTHRQ.Text = DateTime.Now.AddDays(3).ToString("yyyy-MM-dd");
                TextTHRQ.Text = DateTime.Now.AddHours(54.5).ToString("yyyy-MM-dd"); //17:30之后报后2天的数据
                BindSalesList();
            }
      
        }
        //选择工厂变化
        //protected void DplTHGC_Changed(object sender, EventArgs e)
        //{
        //  //  log_corp = DplTHGC.SelectedItem.Value;
        //  //  Session["pk_corp"] = log_corp;
        //    BindSalesList();
        //}
        //获取NC工厂信息
        protected void GetGCXX()
        {
            OracleConnection connstringNC = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringNC"].ConnectionString);
            connstringNC.Open();
            string strSql = "select cr.pk_corp gcbh, nvl(cr.unitshortname,cr.memo) thgc from  nc.bd_corp cr where cr.pk_corp in(SELECT sc.pk_corp FROM nc.sbt_custinvlist sc where sc.vdef20 = 'Y' and sc.ccustmanid in( ";
                  strSql+= " SELECT bcm.pk_cumandoc FROM nc.bd_cumandoc bcm WHERE bcm.pk_cubasdoc IN( ";
                  strSql += " select bcb.pk_cubasdoc from nc.bd_cubasdoc bcb where bcb.custcode='" + log_user + "')))  ";  ///// where cr.pk_corp='" + log_corp + "' ";
                  strSql += " union all select '' gcbh,'' thgc from dual ";//处理空指针异常
            DataSet dsWLXX = new DataSet();
            OracleDataAdapter cmdSQL = new OracleDataAdapter(strSql.ToString(), connstringNC);
            cmdSQL.Fill(dsWLXX);
            connstringNC.Close();
            DplTHGC.DataSource = dsWLXX.Tables[0];
            DplTHGC.DataTextField = "thgc";
            DplTHGC.DataValueField = "gcbh";
            DplTHGC.DataBind();

        }

        protected void BindSalesList()
        {
            OracleConnection connstringNC = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringNC"].ConnectionString);
            connstringNC.Open();
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select bcm.pk_corp gcbh,");
            //strSql.Append("nvl(cr.unitshortname,cr.memo) thgc,");
            strSql.Append("bcb.pk_cubasdoc,");  //加入cookie
            strSql.Append("ch.pk_invbasdoc,");  //加入cookie
            strSql.Append("ch.pk_measdoc,");
            strSql.Append("ch.pk_measdoc1,");
            strSql.Append("pro.pk_stordoc,");
            strSql.Append("bcm.pk_cumandoc,"); //加入cookie
            strSql.Append("invm.pk_invmandoc,"); //加入cookie
            strSql.Append("sc.cinvmanid,");
            strSql.Append("ch.pk_invcl,");
            strSql.Append("bcb.custcode,");
            strSql.Append("bcb.custname,");
            strSql.Append("ch.invcode,");
            strSql.Append("ch.invname wl,");
            strSql.Append("ch.invspec,");
            strSql.Append("ch.invtype,");
            strSql.Append("ch.unitweight,");
            strSql.Append("to_char(sysdate+3,'yyyy-MM-dd') thrq,");
            strSql.Append("ch.createtime,");
            //strSql.Append("a1.nprice0 ,");
            //strSql.Append("a1.nprice1,");
            //strSql.Append("a1.nprice2,");
            //strSql.Append("a1.nprice3,");
            //strSql.Append("a1.cpricetariffid,");//加入cookie价目表
            strSql.Append("nvl(stor.storname,'1#成品库') storname ");
            strSql.Append("from nc.sbt_custinvlist   sc,");
            strSql.Append("nc.bd_invbasdoc      ch,");
            strSql.Append("nc.bd_invmandoc      invm,");
            strSql.Append("nc.bd_produce        pro,");
            strSql.Append("nc.bd_stordoc        stor,");
            strSql.Append("nc.bd_cumandoc       bcm,");
            //strSql.Append("nc.bd_corp       cr,");
            strSql.Append("nc.bd_cubasdoc       bcb ");
            //strSql.Append("nc.prm_tariffcurlist a1 ");
            strSql.Append("where pro.pk_stordoc = stor.pk_stordoc(+) ");
            strSql.Append("and invm.pk_invmandoc = pro.pk_invmandoc ");
            strSql.Append("and sc.cinvmanid = invm.pk_invmandoc ");
            strSql.Append("and invm.pk_invbasdoc = ch.pk_invbasdoc ");
            strSql.Append("and sc.ccustmanid = bcm.pk_cumandoc ");
            strSql.Append("and bcm.pk_cubasdoc = bcb.pk_cubasdoc ");
            strSql.Append("and bcm.pk_corp = sc.pk_corp ");
            //strSql.Append("and bcm.pk_corp = cr.pk_corp ");
            //strSql.Append("and sc.cinvmanid = a1.cinventoryid ");
            //strSql.Append("and a1.pk_corp = bcm.pk_corp ");
            strSql.Append("and (substr(ch.invcode, 0, 4) = '1101' or substr(ch.invcode, 0, 4) = '1105') ");
            strSql.Append("and nvl(sc.dr, 0) = 0 ");
            strSql.Append("and sc.vdef20 = 'Y' "); //客户可售清单禁用标识；N为禁用，Y为启用
            strSql.AppendFormat("and sc.pk_corp = '{0}' ", DplTHGC.Items[DplTHGC.SelectedIndex].Value);
            strSql.AppendFormat("and bcm.pk_corp = '{0}' ",  DplTHGC.Items[DplTHGC.SelectedIndex].Value);
            strSql.AppendFormat("and bcb.custcode = '{0}' ", log_user);
            //   strSql.AppendFormat("and a1.cpricetariffid = '{0}' order by stor.storname", cpricetariffid);
            DataSet dsWLXX = new DataSet();
            OracleDataAdapter cmdSQL = new OracleDataAdapter(strSql.ToString(), connstringNC);
            cmdSQL.Fill(dsWLXX);
            connstringNC.Close();
            rptPlan.DataSource = dsWLXX.Tables[0].DefaultView;
            rptPlan.DataBind();          
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) {
                return;
            }
            string[] curupdateDate = hidNewDt.Value.Split(';');
            if (curupdateDate.Length == 0 || hidNewDt.Value=="")
            { return; }
            using (OracleConnection ConnectionStringJXC = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringJXC"].ConnectionString))
            {
                ConnectionStringJXC.Open();//打开链接
                OracleCommand cmd = new OracleCommand();//创建执行类
                cmd.Connection = ConnectionStringJXC;
                OracleTransaction tx = ConnectionStringJXC.BeginTransaction();
                cmd.Transaction = tx;//开启链接事务              
                string strSql = "";
                string strPK_TMP_NC_XSJH = "";
                ///插入销售计划表头信息
                try
                {
                    string[] curRowDate = curupdateDate[0].Split(',');
                   /* strSql = "select PK_TMP_NC_XSJH from  tmp_nc_xsjh where  dr='0' and DBILLDATE='" + curRowDate[9].ToString() + "' and pk_corp='" + log_corp + "'  and  FREE1='" + log_user + "' ";
                    cmd.CommandText = strSql;
                    object objPK_TMP_NC_XSJH = cmd.ExecuteOracleScalar();
                    if (objPK_TMP_NC_XSJH == null)
                    {*/
                        cmd.CommandText = "select tmp_nc_xsjh_seq.NextVal from dual ";
                        strPK_TMP_NC_XSJH = cmd.ExecuteOracleScalar().ToString();
                        ////如果不存在插入
                        
                        strSql = "insert into tmp_nc_xsjh (PK_TMP_NC_XSJH,DBILLDATE,CCUSTOMERID,PK_CORP,DR,VNOTE,";
                        strSql += " FREE1,FREE2,FREE3,FREE4,FREE5,TS,FLAG,ERRORMESSAGE,VRECEIPTCODE,CUSTCODE,CUSTNAME,CORPNAME)";
                        strSql += "values('" + strPK_TMP_NC_XSJH + "','" + TextTHRQ.Text + "','" + curRowDate[0].ToString() + "','" + DplTHGC.Items[DplTHGC.SelectedIndex].Value + "',0,'',";
                        strSql += "'','','','','',to_char(sysdate,'YYYY-MM-DD HH24:MI:SS'),'0','','" + createNCYDBH(cmd, TextTHRQ.Text) + "',";
                        strSql += "'" + curRowDate[1].ToString() + "','" + curRowDate[2].ToString() + "','" + DplTHGC.Items[DplTHGC.SelectedIndex].Text+ "')";
                        cmd.CommandText = strSql;
                        int exIn = cmd.ExecuteNonQuery();
                  /*  }
                    else //更新
                    {
                        strPK_TMP_NC_XSJH = objPK_TMP_NC_XSJH.ToString();
                        strSql = "update tmp_nc_xsjh set ts=to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') where  dr='0' and DBILLDATE='" + curRowDate[9].ToString() + "' and pk_corp='" + log_corp + "'  and  FREE1='" + log_user + "' ";
                        cmd.CommandText = strSql; 
                        cmd.ExecuteOracleScalar();
                    } */          
                }
                catch (System.Data.OracleClient.OracleException E) {
                    tx.Rollback();
                    MessageBox.ShowAndRedirect(this, "操作销售计划表头信息失败，请联系系统管理员！", "SalesPlan.aspx");
                    return;
                }
                ///插入销售计划表体信息
                try {
                    for (int i = 0; i < curupdateDate.Length; i++)
                    {
                        string[] curRowDate_b = curupdateDate[i].Split(',');
                        string strPK_TMP_NC_XSJH_B = "";//销售计划表体ID
                        ///校验物料是否存在，并创建销售计划表体ID
                        try
                        {
                            strPK_TMP_NC_XSJH_B = createPK_XSJH_B(cmd, curRowDate_b[4], TextTHRQ.Text);
                            //if (strPK_TMP_NC_XSJH_B.Substring(0, 4).Equals("exist"))
                            //{
                            //    tx.Rollback();
                            //    MessageBox.ShowAndRedirect(this, "当前物料:"+curRowDate_b[7].ToString()+"已经存在，请返回计划列表直接修改！", "SalesPlan.aspx");
                            //    return ;
                            //}
                        }
                        catch (System.Data.OracleClient.OracleException E)
                        {
                            tx.Rollback();
                            MessageBox.ShowAndRedirect(this, "创建销售表体ID失败，请联系系统管理员！", "SalesPlan.aspx");
                            return;
                        }
                        ///插入销售计划表体ID
                        strSql = " insert into tmp_nc_xsjh_b (PK_TMP_NC_XSJH_B,PK_TMP_NC_XSJH,BLARGESSFLAG,CINVBASDOCID,CINVENTORYID,FROWNOTE,DR";
                        strSql += " ,FREE1,FREE2,FREE3,FREE4,FREE5,TS,NUM,INVNAME,UNITWEIGHT)";
                        strSql += "values('" + strPK_TMP_NC_XSJH_B + "','" + strPK_TMP_NC_XSJH + "','N','" + curRowDate_b[3].ToString() + "','" + curRowDate_b[4].ToString() + "','','0',";
                        strSql += "'','','','','',to_char(sysdate,'YYYY-MM-DD HH24:MI:SS')," + curRowDate_b[6].ToString() + ",'" + curRowDate_b[5].ToString() + "'," + curRowDate_b[7].ToString() + ")";
                        cmd.CommandText = strSql;
                        int exIn = cmd.ExecuteNonQuery();
                    }
                    tx.Commit();
                }
                catch (System.Data.OracleClient.OracleException E)
                {
                    tx.Rollback();
                    MessageBox.ShowAndRedirect(this, "插入销售计划表头信息失败，请联系系统管理员！", "SalesPlan.aspx");
                    return;
                }


                ConnectionStringJXC.Close();
                BindSalesList();
                //MessageBox.ShowAndRedirect(this, "保存操作成功！", "SalesPlan.aspx");
            }
        }
        /// <summary>
        /// 创建销售计划表体ID
        /// </summary>
        /// <param name="cmd"></param>
        /// <returns>判断当前物料是否已经存在于客商的填报计划当中</returns>
        protected string createPK_XSJH_B(OracleCommand cmd, string chglda,string ydrq)
        {
            //string strSql = "select b.FREE1 from tmp_nc_xsjh t,tmp_nc_xsjh_b b where t.PK_TMP_NC_XSJH=b.PK_TMP_NC_XSJH and b.cinventoryid='" + chglda + "' and b.dr='0' and t.dr='0' and b.blargessflag='N' and t.DBILLDATE='" + ydrq + "' and t.pk_corp='" + log_corp + "'  and  t.FREE1='" + log_user + "' ";
            //cmd.CommandText = strSql;
            //object objPK_TMP_NC_XSJH = cmd.ExecuteOracleScalar();
            //if (objPK_TMP_NC_XSJH == null)
            //{
                cmd.CommandText = "select tmp_nc_xsjh_b_seq.NextVal from dual ";
                object  objPK_TMP_NC_XSJH = cmd.ExecuteOracleScalar();
                return objPK_TMP_NC_XSJH.ToString();
            //}
            //else {
            //    return "exist"+objPK_TMP_NC_XSJH.ToString();
            //}           
        }
        /// <summary>
        /// 创建NC预定单号
        /// </summary>
        /// <param name="cmd"></param>
        /// <returns>判断当前物料是否已经存在于客商的填报计划当中</returns>
        protected string createNCYDBH(OracleCommand cmd,  string ydrq)
        {
            string strSql = "select count(*)+1 sl from tmp_nc_xsjh t where t.DBILLDATE='" + ydrq + "' and t.pk_corp='" + DplTHGC.Items[DplTHGC.SelectedIndex].Value + "' ";
            cmd.CommandText = strSql;
            return "JH" + ydrq.Replace("-","") + cmd.ExecuteOracleScalar().ToString().PadLeft(4, '0');
            
        }

        /// <summary>
        /// 修改参选工厂刷新相应的物料数据
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void hidRefre_Click(object sender, EventArgs e)
        {
            BindSalesList();
        } 

    }
}