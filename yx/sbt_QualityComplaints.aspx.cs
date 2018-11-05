using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.yx
{
    public partial class sbt_QualityComplaints : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = Request.QueryString["username"];
            if (string.IsNullOrEmpty(username))
            {
                username = Request.QueryString["userid"];
            }
            if (string.IsNullOrEmpty(username))
            {
                username = Request.QueryString["usercode"];
            }

            if (string.IsNullOrEmpty(username))
            {
                Common.MessageBox.Show(this, "未能获取到人员账号！");
            }
            else
            {
                DataSet ds = GetUserName(username);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    TxtUsername.Value = ds.Tables[0].Rows[0]["DISPLAY_NAME"].ToString();
                    TxtYXB.Value = ds.Tables[0].Rows[0]["ZZNAME"].ToString();
                }
                Txtusetcode.Value = username;
                DateTime dt = DateTime.Now;
                TxtKSRQ.Text = dt.ToString("yyyy-MM-dd");

            }
        }

        public DataSet GetUserName(string username)
        {

            OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringTool"].ConnectionString);
            connstring.Open();

            string StrSQL = "select * from wb_erp.zsj_ddm_userinfo where user_name='" + username + "'";
            OracleDataAdapter ODA = new OracleDataAdapter(StrSQL, connstring);
            DataSet ds = new DataSet();
            ODA.Fill(ds);
            return ds;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string StrTYPE = "";
            if (string.IsNullOrEmpty(TxtKSRQ.Text))
            {
                Common.MessageBox.Show(this, "反馈日期未填写");
                return;
            }
            if (string.IsNullOrEmpty(DropXXLB.Text))
            {
                Common.MessageBox.Show(this, "信息类别未填写！");
                return;
            }
            else
            {
                for (int i = 0; i < DropXXLB.Items.Count; i++)
                    if (DropXXLB.Items[i].Selected)
                    {
                        StrTYPE += DropXXLB.Items[i].Value;
                        StrTYPE += ",";
                    }
            }
            if (string.IsNullOrEmpty(TxtCustname.Value))
            {
                Common.MessageBox.Show(this, "客户姓名未填写！");
                return;
            }

            if (string.IsNullOrEmpty(TxtTel.Value))
            {
                Common.MessageBox.Show(this, "客户电话未填写！");
                return;
            }
            if (string.IsNullOrEmpty(TxtMemo.Value))
            {
                Common.MessageBox.Show(this, "反馈内容未填写！");
                return;
            }
            if (string.IsNullOrEmpty(TxtTYPE.Value))
            {
                Common.MessageBox.Show(this, "客户类别未填写！");
                return;
            }

            OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringTool"].ConnectionString);
            connstring.Open();
            string strSQLjbxx = "insert into wb_erp.QualityComplaints"
                        + "  (ID, DBILLDATE, TELEPHONE, CUSTNAME, TYPE, PSNCODE,YXB,MEMO,CUSTTYPE, TS)"
                        + " values"
                         + "  ('" + Txtusetcode.Value + "'||to_char(sysdate,'yyyymmddhh24miss'), '" + TxtKSRQ.Text + "', '" + TxtTel.Value + "', '" + TxtCustname.Value + "', '" + StrTYPE + "', '" + Txtusetcode.Value + "', '" + TxtYXB.Value + "', '" + TxtMemo.Value + "', '" + TxtTYPE.Value + "', to_char(sysdate,'yyyy-mm-dd hh24:mi:ss'))";
            OracleCommand OCMDDelChongFuFB = new OracleCommand(strSQLjbxx, connstring);
            OCMDDelChongFuFB.ExecuteNonQuery();
            Common.MessageBox.Show(this, "反馈提交成功！");
            TxtMemo.Value = "";
            TxtCustname.Value = "";
            TxtTel.Value = "";
            TxtKSRQ.Text = "";
            DropXXLB.Text = "";
            TxtTYPE.Value = "";
            TxtSuss.Value = "问题反馈成功！感谢您的支持！";
            connstring.Close();

        }
    }
}