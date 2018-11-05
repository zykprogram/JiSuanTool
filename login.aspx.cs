using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApp.unitClass;


namespace WebApp
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ServiceReference3.APIClient so = new ServiceReference3.APIClient();
            //so.changeAttrs("fuhuip@sbtjt.com", "password=xxzx@123");

            //ServiceReference2.UserInterfaceSoapClient so1 = new ServiceReference2.UserInterfaceSoapClient();
            //so1.Encrypto(
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            string name = A_Uid.Text;
            string pass = A_Pwd.Text;
            DataSet dsuser = new DataSet();
            using ( OracleConnection connstringWb_erp = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringWb_erp"].ConnectionString))
            {       
                try
                {
                    connstringWb_erp.Open();
                    string SQLString = "select * from wb_user where status='1' and user_name = '" + name + "' and password = '" + MD5Util.encryptMD5(pass,32) + "'";
                    OracleDataAdapter command = new OracleDataAdapter(SQLString, connstringWb_erp);
                    command.Fill(dsuser);
                }
                catch (System.Data.OracleClient.OracleException ex)
                {
                    connstringWb_erp.Close();
                    throw new Exception(ex.Message);
                }
                connstringWb_erp.Close();
            }
            if (dsuser.Tables[0] == null || dsuser.Tables[0].Rows.Count == 0)
            {
                lblMsg.Text = "用户名或密码错误!";
            }
            else
            {
                Session["username"] = Convert.ToString(dsuser.Tables[0].Rows[0]["USER_NAME"]);
                Response.Redirect("/menuCentre.aspx");
                //Session["username"] = Convert.ToString(dsuser.Tables[0].Rows[0]["USER_NAME"]);
                //Session["pk_corp"] = Convert.ToString(dsuser.Tables[0].Rows[0]["BM_PK"]);
                //if (dsuser.Tables[0].Rows[0]["ROLE"].ToString().Equals("原料库存管理"))
                //{
                //    Response.Redirect("/ylzjkcgl/ylkcForm.aspx"); //此处根据具体的角色来跳转
                //}
                //else if (dsuser.Tables[0].Rows[0]["ROLE"].ToString().Equals("销售计划上报"))
                //{
                //    Response.Redirect("/yx/weixin/SalesPlan.aspx"); //此处根据具体的角色来跳转
                //}
                //else if (dsuser.Tables[0].Rows[0]["ROLE"].ToString().Equals("下载中心"))
                //{
                //    Response.Redirect("http://wap.sbtjt.com/DownloadCenter.aspx"); //此处根据具体的角色来跳转
                //}
                //else {
                //    lblMsg.Text = "当前用户没分配合适角色!";
                //}
                
            }
        }
    }
}