using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using Common;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.ylzjkcgl
{
    public partial class dqylkc : System.Web.UI.Page
    {
        protected string chose_wllx = "";//操作的物料类型
        protected string cur_corp = "";//登陆人工厂
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                cur_corp = get_corp();
                chose_wllx = Request.QueryString["wllx"];
                //DBCommon.DbHelperOra.LoginLog(Session["username"].ToString(), Request.ServerVariables.Get("REMOTE_ADDR"), "原料质检库存小工具");
            }
            else
            {
                Response.Redirect("../login.aspx");
            }
            if (!IsPostBack)
            {
                
                BindzjkcDataList();
                txtjrbz.Value = getBZXX();
                
            }
        }
        /// <summary>
        /// 获取人员所属工厂
        /// </summary>
        protected string get_corp()
        {
            DataSet dsuser = new DataSet();
            using (OracleConnection connstringNC = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringNC"].ConnectionString))
            {
                try
                {
                    connstringNC.Open();
                    string SQLString = " select ps.pk_corp,ps.psncode,ps.psnname,nvl(cp.unitshortname, cp.memo) unitname from nc.bd_psndoc ps,nc.bd_corp cp ";
                    SQLString+=" where ps.pk_corp=cp.pk_corp and  ps.psnclscope='0' and ps.PSNCODE='" + Session["username"].ToString() + "' ";
                    OracleDataAdapter command = new OracleDataAdapter(SQLString, connstringNC);
                    command.Fill(dsuser);
                }
                catch (System.Data.OracleClient.OracleException ex)
                {
                    connstringNC.Close();
                    throw new Exception(ex.Message);
                }
                if (dsuser.Tables[0] == null || dsuser.Tables[0].Rows.Count == 0)
                {
                    MessageBox.Show(this, "解析工厂信息失败，请联系系统维护人员！");

                }
                connstringNC.Close();
            }
            gcmcLit.Text = dsuser.Tables[0].Rows[0]["unitname"].ToString();
            return dsuser.Tables[0].Rows[0]["pk_corp"].ToString();

        }
        /// <summary>
        /// 增加工厂备注信息  刘志刚 2014-12-19
        /// </summary>
        /// <returns></returns>

        protected string getBZXX()
        {
            string strBZ = "";
            OracleConnection connstringRDP = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringTool"].ConnectionString);
            connstringRDP.Open();
            string strCORP = "select bc.BZ  from t_zj_gcxx bc where bc.pk_corp='" + cur_corp + "' ";
            OracleDataAdapter adapterNC = new OracleDataAdapter(strCORP, connstringRDP);
            DataSet dsZJLB = new DataSet();
            adapterNC.Fill(dsZJLB);
            connstringRDP.Close();
            if (dsZJLB != null && dsZJLB.Tables[0].Rows.Count > 0)
            {
                strBZ = dsZJLB.Tables[0].Rows[0]["BZ"].ToString();
            }
            return strBZ;
        }
        #region 绑定数据列表 刘志刚 2014-10-20
        private void BindzjkcDataList()
        {
            //查询当前质检库存
            
            OracleConnection connstringRDP = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringTool"].ConnectionString);
            connstringRDP.Open();
            string strZJ = "select t.* from t_zj_ylkc t where t.pk_corp='" + cur_corp + "' and t.sfgb='0' and t.wllx='" + chose_wllx + "' order by t.pc desc";
            OracleDataAdapter adapterOA = new OracleDataAdapter(strZJ, connstringRDP);
            DataSet dsZJLB = new DataSet();
            adapterOA.Fill(dsZJLB);
            connstringRDP.Close();
        //    if (dsZJLB != null && dsZJLB.Tables[0].Rows.Count > 0)
         //   {
                DataTable dt = dsZJLB.Tables[0];
                DataView abv = dt.DefaultView;
                rptZJList.DataSource = abv;
                rptZJList.DataBind();
        //    }
        }
        #endregion

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
           
            string [] curupdateDate = hidNewDt.Value.Split(';');
            OracleConnection connstringRDP = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringTool"].ConnectionString);
            connstringRDP.Open();

            string strdelGCXX = "delete t_zj_gcxx bc where bc.pk_corp='" + cur_corp + "'";
            string strinetGCXX = " insert into  t_zj_gcxx(PK_CORP,BILLDATE,BZ,TS) values('" + cur_corp + "','" + DateTime.Now.ToString("yyyy-MM-dd") + "','" + txtjrbz.Value + "','" + DateTime.Now.ToString() + "') ";
            // string strinetGCXX = "insert into t_zj_gcxx bc where bc.pk_corp='" + Session["username"].ToString() + "' and bc.billdate='" + DateTime.Now.ToString("yyyy-MM-dd") + "'";
            OracleCommand OCOdelMBZ = new OracleCommand(strdelGCXX, connstringRDP);
            OCOdelMBZ.ExecuteNonQuery();
            OracleCommand OCOinertMBZ = new OracleCommand(strinetGCXX, connstringRDP);
            OCOinertMBZ.ExecuteNonQuery();
            //string strGBBZ = "0";
            for (int i = 0; i < curupdateDate.Length; i++)
            {
                string[] curRowDate = curupdateDate[i].Split(',');
                //strGBBZ= curRowDate[5] == null || curRowDate[5].Equals("") ? "0" : curRowDate[5] ;
                string strZJ = "update t_zj_ylkc t set t.jrkc='" + curRowDate[1] + "',t.kh='" + curRowDate[2] + "',t.scpz='" + curRowDate[3] + "',t.pfbb='" + curRowDate[4] + "' , t.sfgb='" + curRowDate[5] + "'";
                strZJ += "  where t.pk_corp='" + cur_corp + "' and t.wllx='" + chose_wllx + "' and t.pc='" + curRowDate[0] + "'";
                OracleCommand OCOMZJYL = new OracleCommand(strZJ, connstringRDP);
                int exIn = OCOMZJYL.ExecuteNonQuery();
              //  OracleDataAdapter adapterOA = new OracleDataAdapter(strZJ, connstringRDP);
              //  DataSet dsZJLB = new DataSet();
              //  adapterOA.Fill(dsZJLB);
            }
            connstringRDP.Close();
            BindzjkcDataList();
           // MessageBox.ShowAndRedirect(this, "保存数据成功！", "dqylkc.aspx");          

        }
    }
}