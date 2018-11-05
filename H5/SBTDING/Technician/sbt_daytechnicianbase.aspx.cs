using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using Oracle.ManagedDataAccess.Client;
using System.Data.OracleClient;

namespace WebApp.H5.SBTDING.Technician
{
    public partial class sbt_daytechnicianbase : System.Web.UI.Page
    {
        public static string User_ID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                User_ID = Request.QueryString["userid"].ToString();
                GetCustList();
            }
        }

        //获取当前业务员客户列表
        public void GetCustList()
        {
            OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringWb_erp"].ConnectionString);
            connstring.Open();
            string strpk = "select custcode,custname from wb_erp.zsj_so_custmoerrelatsalesman a"
                           + " where a.PSNCODEMANA_TECHNICAL = '" + User_ID + "'"
                           + " or a.PSNCODE2_TECHNICAL = '" + User_ID + "'"
                           + " or a.PSNCODE1_TECHNICAL = '" + User_ID + "'"
                           + " or a.PSNCODE3_TECHNICAL = '" + User_ID + "'"
                           + " or a.PSNCODE4_TECHNICAL = '" + User_ID + "'";
            OracleDataAdapter ODA = new OracleDataAdapter(strpk, connstring);
            DataSet ds = new DataSet();
            ODA.Fill(ds, "DropDownList1");
            DropDownList1.DataSource = ds.Tables["DropDownList1"].DefaultView;
            DropDownList1.DataValueField = ds.Tables["DropDownList1"].Columns[0].ColumnName;
            DropDownList1.DataTextField = ds.Tables["DropDownList1"].Columns[1].ColumnName;
            DropDownList1.DataBind();
            ds.Dispose();
        }

        //获取猪场基础数据
        [System.Web.Services.WebMethod]
        public static string GetBaseInfo(string custcode)
        {
            OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringWb_erp"].ConnectionString);
            connstring.Open();
            string strpk = "select * from wb_erp.app_main_daytechnicianbase where custcode ='" + custcode + "'";
            OracleDataAdapter ODA = new OracleDataAdapter(strpk, connstring);
            DataSet ds = new DataSet();
            ODA.Fill(ds);
            if (ds == null || ds.Tables.Count <= 0 || ds.Tables[0].Rows.Count <= 0)
            {
                return "";
            }
            return GetJsonByDataset(ds);
        }

        //插入基础数据行
        [System.Web.Services.WebMethod]
        public static string InsertValue(double jcmz,double fmszz,double byszz,double yfsrz,string custcode,string datechoose)
        {
            OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringWb_erp"].ConnectionString);
            //OracleConnection connstring = new OracleConnection("User ID=wb_erp;Password=xxzx192837wberp;Data Source=(DESCRIPTION = (ADDRESS_LIST= (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.10.124)(PORT = 1521))) (CONNECT_DATA = (SERVICE_NAME = sbtrdp)));Unicode=true");
            connstring.Open();
            string strque = "select count(*) as num from app_main_daytechnicianbase where custcode = '" + custcode + "'";
            OracleDataAdapter ODA = new OracleDataAdapter(strque, connstring);
            DataSet ds = new DataSet();
            ODA.Fill(ds);
            if (Convert.ToInt32(ds.Tables[0].Rows[0][0]) >= 1)
            {
                //删除历史数据
                string strdel = "delete from app_main_daytechnicianbase where custcode = '" + custcode + "'";
                OracleCommand delCM = new OracleCommand(strdel, connstring);
                delCM.ExecuteNonQuery();
            }
            //表头PK
            string str = "insert into app_main_daytechnicianbase(ID,CreateTime,jcmz,fmszz,byszz,yfsrz,UserID,custcode,ts) "
                       + " Values('" + Guid.NewGuid().ToString() + "',to_char(sysdate,'yyyy-mm-dd')," + jcmz + "," + fmszz + "," + byszz + "," + yfsrz + ",'" + User_ID + "','" + custcode + "','"+ datechoose + "')";
            OracleCommand OCMDQT = new OracleCommand(str, connstring);
            OCMDQT.ExecuteNonQuery();
            connstring.Close();
            return "保存成功！";
        }

        //DataSet转Json格式
        public static string GetJsonByDataset(DataSet ds)
        {
            StringBuilder sb = new StringBuilder();
            //sb.Append("{");
            foreach (DataTable dt in ds.Tables)
            {
                //sb.Append(string.Format("\"{0}\":[", dt.TableName));

                foreach (DataRow dr in dt.Rows)
                {
                    sb.Append("{");
                    for (int i = 0; i < dr.Table.Columns.Count; i++)
                    {
                        sb.AppendFormat("\"{0}\":\"{1}\",", dr.Table.Columns[i].ColumnName.Replace("\"", "\\\"").Replace("\'", "\\\'"), ObjToStr(dr[i]).Replace("\"", "\\\"").Replace("\'", "\\\'")).Replace(Convert.ToString((char)13), "\\r\\n").Replace(Convert.ToString((char)10), "\\r\\n");
                    }
                    sb.Remove(sb.ToString().LastIndexOf(','), 1);
                    sb.Append("},");
                }

                //sb.Remove(sb.ToString().LastIndexOf(','), 1);
                //sb.Append("],");
            }
            sb.Remove(sb.ToString().LastIndexOf(','), 1);
            //sb.Append("}");
            return sb.ToString();
        }

        public static string ObjToStr(object ob)
        {
            if (ob == null)
            {
                return string.Empty;
            }
            else
                return ob.ToString();
        }
    }
}