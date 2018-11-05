using Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.ylzjkcgl
{
    public partial class lsylkc : System.Web.UI.Page
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
                    SQLString += " where ps.pk_corp=cp.pk_corp and  ps.psnclscope='0' and ps.PSNCODE='" + Session["username"].ToString() + "' ";
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
        #region 绑定数据列表 刘志刚 2014-06-30
        private void BindzjkcDataList()
        {
            //查询当前质检库存
          
            OracleConnection connstringNC = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringTool"].ConnectionString);
            connstringNC.Open();
            string strZJ = "select t.* from t_zj_ylkc t where ts>sysdate-15 and t.pk_corp='" + cur_corp + "' and t.sfgb='1' and t.wllx='" +chose_wllx+ "' order by t.pc desc";
            OracleDataAdapter adapterOA = new OracleDataAdapter(strZJ, connstringNC);
            DataSet dsZJLB = new DataSet();
            adapterOA.Fill(dsZJLB);
        //    if (dsZJLB != null && dsZJLB.Tables[0].Rows.Count > 0)
         //   {
                DataTable dt = dsZJLB.Tables[0];
               // DataView abv = dt.DefaultView;
                rptZJList.DataSource = dt;
                rptZJList.DataBind();
         //   }
        }
        #endregion
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string[] curupdateDate = hidNewDt.Value.Split(';');
            OracleConnection connstringNC = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringTool"].ConnectionString);
            connstringNC.Open();
            for (int i = 0; i < curupdateDate.Length; i++)
            {
                string[] curRowDate = curupdateDate[i].Split(',');
                string strZJ = "update t_zj_ylkc t set t.sfgb='" + curRowDate[1] + "'  where t.pk_corp='" +cur_corp + "' and t.pc='" + curRowDate[0] + "' and t.wllx='" +chose_wllx+ "'";
                OracleCommand OCOMZJYL = new OracleCommand(strZJ, connstringNC);
                int exIn = OCOMZJYL.ExecuteNonQuery();
                //  OracleDataAdapter adapterOA = new OracleDataAdapter(strZJ, connstringNC);
                //  DataSet dsZJLB = new DataSet();
                //  adapterOA.Fill(dsZJLB);
            }
            connstringNC.Close();
            BindzjkcDataList();

        }
    }
}