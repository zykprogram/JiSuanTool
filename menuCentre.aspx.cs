using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OracleClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class menuCentre : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                creterMenu();//创建权限菜单
               
            }
            else
            {
                Response.Redirect("login.aspx");
            }
            if (!IsPostBack)
            {
                //读取功能模块信息
                creterMenu();//创建权限菜单

            }

        }
        protected void creterMenu() {
             StringBuilder strReturn = new StringBuilder() ;//功能菜单控件
             string menuSQL = " select * from wb_module t where is_hidden='0' and parent_id in(";
                    menuSQL +=" select module_id from wb_module t where display_name='手机APP工具') and module_id in(";
                    menuSQL +=" select module_id from wb_module_role where ";
                    menuSQL +=" role_id in( select role_id";
                    menuSQL +=" from wb_user_role";
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
                        if ((i+3)%2==1)
                        {
                            strReturn.Append("<tr >");
                        }
                        strReturn.Append("<td >");
                        //strReturn.AppendFormat("<input type=\"button\"  value=\"{0}\" onclick=\"location.href = '{1}'\"  />", menudt.Rows[i]["APP_MENU"].ToString(), menudt.Rows[i]["APP_PACKAGE"].ToString());
                        strReturn.AppendFormat("<p><a href=\"{0}\"><img class=\"aligncenter\" src=\"{1}\"   /></a></p>", menudt.Rows[i]["APP_PACKAGE"].ToString(), menudt.Rows[i]["DISPLAY_ICON"].ToString());
                        strReturn.AppendFormat("<p><span ><a href=\"{0}\">{1}</a></span></p>", menudt.Rows[i]["APP_PACKAGE"].ToString(), menudt.Rows[i]["APP_MENU"].ToString());

                        strReturn.Append("</td >");
                        if ((i + 3) % 2 == 0)
                        {
                            strReturn.Append("</tr >");
                        }
                        if (i+1 == menudt.Rows.Count)
                        {
                            strReturn.Append("</tr >");
                        }
                    
                    }
                    menuLit.Text = strReturn.ToString();
                        //return strReturn.ToString();
        }
    }
}