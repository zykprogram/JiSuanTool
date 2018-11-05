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

namespace WebApp.ylzjkcgl
{
    public partial class ylkcForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
            if (Session["username"] != null)
            {             
                DBCommon.DbHelperOra.LoginLog(Session["username"].ToString(), Request.ServerVariables.Get("REMOTE_ADDR"), "原料质检库存小工具");
            }
            else
            {
                Response.Redirect("../login.aspx");
            }
            if (!IsPostBack)
            {
                veriModel(); //读取功能模块信息
            }
        }
        /// <summary>
        /// 功能加载
        /// </summary>
        protected void veriModel()
        {
            StringBuilder strReturn = new StringBuilder();//功能菜单控件
            string menuSQL = " select * from wb_module t where is_hidden='0' and parent_id in(";
            menuSQL += " select module_id from wb_module t where display_name='工厂原料管理') and module_id in(";
            menuSQL += " select module_id from wb_module_role where ";
            menuSQL += " role_id in( select role_id";
            menuSQL += " from wb_user_role";
            menuSQL += " where user_id in";
            menuSQL += " (select user_id from wb_user t where user_name = '" + Session["username"].ToString() + "'))) order by order_index ";
            DataSet dsuser = new DataSet();
            DataTable menudt = new DataTable();
            using (OracleConnection connstringWb_erp = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringWb_erp"].ConnectionString))
            {
                try
                {
                    connstringWb_erp.Open();

                    OracleDataAdapter command = new OracleDataAdapter(menuSQL, connstringWb_erp);
                    command.Fill(dsuser);
                }
                catch (System.Data.OracleClient.OracleException ex)
                {
                    connstringWb_erp.Close();
                    throw new Exception(ex.Message);
                }
                connstringWb_erp.Close();
            }
            menudt = dsuser.Tables[0];
            for (int i = 0; i < menudt.Rows.Count; i++)
            {
                
                strReturn.Append("<li>");
                strReturn.AppendFormat("<a href=\"javascript:choseWLLX({0});\" id=\"wllx{0}\" >{1}</a>", menudt.Rows[i]["order_index"].ToString(), menudt.Rows[i]["APP_MENU"].ToString());
                strReturn.Append("</li>");
               

            }
            modelLit.Text = strReturn.ToString();
        }
    
    }
}