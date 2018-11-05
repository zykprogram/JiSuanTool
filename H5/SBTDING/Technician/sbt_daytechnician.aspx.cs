using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
//using Oracle.ManagedDataAccess.Client;
using System.Data.OracleClient;

namespace WebApp.H5.SBTDING.sbtproject
{
    public partial class sbt_daytechnician : System.Web.UI.Page
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

        public void GetCustList()
        {
            OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringWb_erp"].ConnectionString);
            connstring.Open();
            string strpk = "select custcode,custname from wb_erp.zsj_so_custmoerrelatsalesman a"
                           + " where a.PSNCODEMANA_TECHNICAL = '" + User_ID + "'"
                           + " or a.PSNCODE2_TECHNICAL = '" + User_ID + "'"
                           + " or a.PSNCODE1_TECHNICAL = '" + User_ID + "'";
            OracleDataAdapter ODA = new OracleDataAdapter(strpk, connstring);
            DataSet ds = new DataSet();
            ODA.Fill(ds, "DropDownList1");
            DropDownList1.DataSource = ds.Tables["DropDownList1"].DefaultView;
            DropDownList1.DataValueField = ds.Tables["DropDownList1"].Columns[0].ColumnName;
            DropDownList1.DataTextField = ds.Tables["DropDownList1"].Columns[1].ColumnName;
            DropDownList1.DataBind();
            ds.Dispose();

        }

        [System.Web.Services.WebMethod]
        public static string GetCustInfo()
        {
            OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringWb_erp"].ConnectionString);
            connstring.Open();
            string strpk = "select custcode,custname from wb_erp.zsj_so_custmoerrelatsalesman a"
                           + " where a.PSNCODEMANA_TECHNICAL = '"+ User_ID + "'"
                           + " or a.PSNCODE2_TECHNICAL = '"+ User_ID + "'"
                           + " or a.PSNCODE1_TECHNICAL = '"+ User_ID + "'";
            OracleDataAdapter ODA = new OracleDataAdapter(strpk, connstring);
            DataSet ds = new DataSet();
            ODA.Fill(ds);
            if (ds == null || ds.Tables.Count <= 0 || ds.Tables[0].Rows.Count <= 0)
            {
                return "";
            }
            return JsonConvert.SerializeObject(ds);
        }

        //前一天数据信息获取
        //[System.Web.Services.WebMethod]
        //public static string GetValue(string custcode, string datechoose)
        //{
        //    OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringWb_erp"].ConnectionString);
        //    connstring.Open();
        //    string strpk = "select jcmz,fmszz,byszz,yfsrz from wb_erp.app_main_daytechnician where CreateTime < '"+ datechoose + "' and custcode ='" + custcode + "'";
        //    OracleDataAdapter ODA = new OracleDataAdapter(strpk, connstring);
        //    DataSet ds = new DataSet();
        //    ODA.Fill(ds);
        //    if (ds == null || ds.Tables.Count <= 0 || ds.Tables[0].Rows.Count <= 0)
        //    {
        //        return "";
        //    }
        //    return GetJsonByDataset(ds);
        //}

        //前一天数据信息获取
        [System.Web.Services.WebMethod]
        public static string GetTodayInfo(string custcode,string datechoose)
        {
            OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringWb_erp"].ConnectionString);
            connstring.Open();
            string strpk = "select * from wb_erp.app_main_daytechnician where CreateTime = '"+ datechoose + "' and custcode ='" + custcode + "'";
            OracleDataAdapter ODA = new OracleDataAdapter(strpk, connstring);
            DataSet ds = new DataSet();
            ODA.Fill(ds);
            if (ds == null || ds.Tables.Count <= 0 || ds.Tables[0].Rows.Count <= 0)
            {
                return "";
            }
            return GetJsonByDataset(ds);
        }

        //获取客户是否有客户信息
        [System.Web.Services.WebMethod]
        public static bool GetBaseInfo(string custcode)
        {
            OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringWb_erp"].ConnectionString);
            connstring.Open();
            string strque = "select count(*) as num from app_main_daytechnicianbase where custcode = '" + custcode + "'";
            OracleDataAdapter ODA = new OracleDataAdapter(strque, connstring);
            DataSet ds = new DataSet();
            ODA.Fill(ds);
            if (Convert.ToInt32(ds.Tables[0].Rows[0][0]) >= 1)
            {
                return true;
            }
            return false;
        }

        //插入本日数据
        [System.Web.Services.WebMethod]
        public static string InsertValue(double gzcl,double hbgz, double wphbz, double mzsw, double mztt, double tcmz, double xzpzmz, double xzpzhb, double fqmz, double lcmz, double fmmz, double totalchz, double totalcjz, double fmszzst, double dnmz, double dnzz, double byjl, double zzyf, double byxs, double byst, double yfjl,double grzm,double yfzhb, double yfxs, double yfst, double mzl, double sb, double yfl, double totalnumber, string zhyzym, string dbsfsy, string v_5s, string sgnr,string custcode, string datechoose)
        {
            OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringWb_erp"].ConnectionString);
            connstring.Open();
            string strque = "select count(*) as num from app_main_daytechnician where custcode = '" + custcode + "' and CreateTime = '" + datechoose + "'";
            OracleDataAdapter ODA = new OracleDataAdapter(strque, connstring);
            DataSet ds = new DataSet();
            ODA.Fill(ds);
            if (Convert.ToInt32(ds.Tables[0].Rows[0][0]) >= 1)
            {
                //删除历史数据
                string strdel = "delete from app_main_daytechnician where custcode = '" + custcode + "' and CreateTime ='"+ datechoose + "'";
                OracleCommand delCM = new OracleCommand(strdel, connstring);
                delCM.ExecuteNonQuery();
            }
            //表头PK
            string str = "insert into app_main_daytechnician(ID,CreateTime,gzcl,hbgz,wphbz,mzsw,mztt,tcmz,xzpzmz,xzpzhb,fqmz,lcmz,fmmz,totalchz,totalcjz,fmszzst,dnmz,dnzz,byjl,zzyf,byxs,byst,yfjl,grzm,yfzhb,yfxs,yfst,mzl,sb,yfl,totalnumber,zhyzym,dbsfsy,v_5s,sgnr,UserID,custcode) "
                       + " Values('" + Guid.NewGuid().ToString() + "','"+ datechoose + "'," + gzcl + "," + hbgz + "," + wphbz + "," + mzsw + "," + mztt + "," + tcmz + "," + xzpzmz + "," + xzpzhb + "," + fqmz + "," + lcmz + "," + fmmz + "," + totalchz + "," + totalcjz + "," + fmszzst + "," + dnmz + "," + dnzz + "," + byjl + "," + zzyf + "," + byxs + "," + byst + "," + yfjl + "," + grzm + "," + yfzhb + "," + yfxs + "," + yfst + "," + mzl + "," + sb + "," + yfl + "," + totalnumber + ",'" + zhyzym + "','" + dbsfsy + "','" + v_5s + "','" + sgnr + "','" + User_ID + "','" + custcode + "')";
            OracleCommand OCMDQT = new OracleCommand(str, connstring);
            OCMDQT.ExecuteNonQuery();
            connstring.Close();
            return "保存成功！";
        }

        //DataSet转Json格式
        public static string GetJsonByDataset(DataSet ds)
        {
            StringBuilder sb = new StringBuilder();
            foreach (DataTable dt in ds.Tables)
            {
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
            }
            sb.Remove(sb.ToString().LastIndexOf(','), 1);
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