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
    public partial class sbt_salary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            
               string usercode = Request.QueryString["userid"];
               if (string.IsNullOrEmpty(usercode))
               {
                      usercode = "017418";
               }
               usercode=GetPower(usercode);
                GetSalary(usercode);
            }
        }
        public string GetPower(string usercode)
        {
            OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringTool"].ConnectionString);
            connstring.Open();

            string StrSQL = "select usercode from wb_erp.app_zbxx_user   b where b.deptname='集团' and b.mangercode='"+usercode+"'";
            OracleDataAdapter ODA = new OracleDataAdapter(StrSQL, connstring);
            DataSet ds = new DataSet();
            ODA.Fill(ds);
            if (ds.Tables[0].Rows.Count == 1)
            { 
                usercode = "017418";
                Common.MessageBox.Show(this,"鉴于您不属于营销部，系统自动分配一个模拟数据");
            }
            connstring.Close();
            return usercode;
        }
        public void GetSalary(string usercode)
        {
            OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringTool"].ConnectionString);
            connstring.Open();

            string StrSQL = "select distinct a.*,b.display_name"
             + " from wb_erp.salarysize a, wb_erp.zsj_ddm_userinfo b"
             + " where a.postname = b.postname"
             + " and a.yxb = b.zzname"
             + " and instr(b.bmname, a.type) != 0"
             + " and b.user_name = '" + usercode + "'";
            OracleDataAdapter ODA = new OracleDataAdapter(StrSQL, connstring);
            DataSet ds = new DataSet();
            ODA.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                Lit5.Text = ds.Tables[0].Rows[0]["size1"].ToString();
                Lit6.Text = ds.Tables[0].Rows[0]["size2"].ToString();
                Lit7.Text = ds.Tables[0].Rows[0]["size3"].ToString();
                username.Text = ds.Tables[0].Rows[0]["display_name"].ToString();
            }
            else
            {
                Lit5.Text = "0";
                Lit6.Text = "0";
                Lit7.Text = "0";
                username.Text = "";
            }

        //获取本人本月奖励
            StrSQL = "select sum(size1) size1, sum(size2) size2, sum(size3) size3 "
                  +" from (select case "
               +"   when substr(d.memo, 2, 20) = '奶粉' then "
              +"     a.nnumber "
              +"  end size1, "
              +"  case "
              +"    when substr(d.memo, 2, 20) = '奶粉' then "
              +"     a.nnumber "
              +"  end size2, "
              +"  case "
              +"    when substr(d.memo, 2, 20) != '奶粉' and "
              +"         substr(d.memo, 2, 20) != '浓缩料' then "
              +"     a.nnumber "
              +"  end size3 "
                +"   from wb_erp.so_custdetail_v20140901 a, "
             +"   wb_erp.bd_invbasdoc            c, "
              +"  wb_erp.bd_defdoc               d "
                +"   where a.custcode in (select custcode "
               +"                  from wb_erp.zsj_so_custmoerrelatsalesman b "
               + "                 where (b.psncode = '" + usercode + "' or managercode='" + usercode + "')) "
              +"   and substr(dbilldate, 0, 7) = to_char(sysdate, 'yyyy-mm') "
              + "   and a.pk_invbasdoc = c.pk_invbasdoc "
                 +"   and c.def3 = d.pk_defdoc)";
             ODA = new OracleDataAdapter(StrSQL, connstring);
             ds = new DataSet();
            ODA.Fill(ds);
            if (ds.Tables[0].Rows[0]["size1"].ToString().Equals(""))
            {
                Lsize1.Text = "0";
            }
            else
            {
                Lsize1.Text = ds.Tables[0].Rows[0]["size1"].ToString();
            }
            if (ds.Tables[0].Rows[0]["size2"].ToString().Equals(""))
            {
                Lsize2.Text = "0";
            }
            else
            {
                Lsize2.Text = ds.Tables[0].Rows[0]["size2"].ToString();
            } if (ds.Tables[0].Rows[0]["size3"].ToString().Equals(""))
            {
                Lsize3.Text = "0";
            }
            else
            {
                Lsize3.Text = ds.Tables[0].Rows[0]["size3"].ToString();
            }
                double d=Convert.ToDouble(Lsize1.Text)+Convert.ToDouble(Lsize2.Text)+Convert.ToDouble(Lsize3.Text);
                Lsize4.Text=d.ToString();
           double m = Convert.ToDouble(Lit5.Text) * Convert.ToDouble(Lsize1.Text);
           double n = Convert.ToDouble(Lit6.Text) * Convert.ToDouble(Lsize2.Text);
           double p = Convert.ToDouble(Lit7.Text) * Convert.ToDouble(Lsize3.Text);
           Lit9.Text = (m+n+p).ToString();
           TxtMZS.Focus();
           connstring.Close();
        }
    }
}