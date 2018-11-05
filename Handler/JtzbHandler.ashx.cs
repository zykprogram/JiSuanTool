using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using Newtonsoft.Json;
//using Oracle.ManagedDataAccess.Client;
using System.Data.OracleClient;

namespace WebApp.Handler
{
    /// <summary>
    /// JtzbHandler 的摘要说明
    /// </summary>
    public class JtzbHandler : IHttpHandler
    {
        protected OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringWb_erp"].ConnectionString);
        public void ProcessRequest(HttpContext context)
        {
            string id, user_id, months, weeks, title, type, content, rate, str;
            OracleCommand OCMDQT;
            OracleDataAdapter ODA;
            DataSet ds;
            context.Response.ContentType = "application/json";
            string method = context.Request.Params["Type"].ToString();
            string json = "";
            switch (method)
            {
                case "GetInfo":
                    user_id = context.Request.Params["user_id"].ToString();
                    string nowYear = DateTime.Now.ToString("yyyy");
                    string nowMonth = DateTime.Now.Month.ToString();
                    string nowDay = DateTime.Now.ToString("dd");
                    months = nowYear + "-" + nowMonth;
                    weeks = ((Convert.ToInt32(nowDay) - 1) / 7 + 1).ToString();
                    connstring.Open();
                    str = "select count(*) as numbers from wb_erp.app_main_workreport where userid = '" + user_id + "' and month ='" + months + "' and week = '" + weeks + "'";
                    ODA = new OracleDataAdapter(str, connstring);
                    ds = new DataSet();
                    ODA.Fill(ds);
                    if (ds == null || ds.Tables.Count <= 0 || ds.Tables[0].Rows.Count <= 0)
                    {
                        json = "";
                    }
                    else
                    {
                        json = GetJsonByDataset(ds);
                    }
                    break;
                case "Get":
                    id = context.Request.Params["id"].ToString();
                    connstring.Open();
                    str = "select * from wb_erp.app_main_workreport where id = " + id;
                    ODA = new OracleDataAdapter(str, connstring);
                    ds = new DataSet();
                    ODA.Fill(ds);
                    if (ds == null || ds.Tables.Count <= 0 || ds.Tables[0].Rows.Count <= 0)
                    {
                        json = "";
                    }
                    else
                    {
                        json = GetJsonByDataset(ds);
                    }
                    break;
                case "Add":
                    user_id = context.Request.Params["user_id"].ToString();
                    months = context.Request.Params["months"].ToString();
                    weeks = context.Request.Params["weeks"].ToString();
                    title = context.Request.Params["title"].ToString();
                    type = context.Request.Params["types"].ToString();
                    content = context.Request.Params["content"].ToString();
                    rate = context.Request.Params["rate"].ToString();
                    connstring.Open();
                    str = "insert into app_main_workreport(ID,month,week,title,type,content,rate,UserID,CreateTime,status)"
                       + " Values(BILL_SEQ_ID.Nextval,'" + months + "'," + weeks + ",'" + title + "','" + type + "','" + content + "'," + rate + ",'" + user_id + "',to_char(sysdate,'yyyy-mm-dd'),0)";
                    OCMDQT = new OracleCommand(str, connstring);
                    OCMDQT.ExecuteNonQuery();
                    connstring.Close();
                    json = "{\"result\" : \"保存成功\" }";
                    break;
                case "Edit":
                    id = context.Request.Params["id"].ToString();
                    title = context.Request.Params["title"].ToString();
                    type = context.Request.Params["types"].ToString();
                    content = context.Request.Params["content"].ToString();
                    rate = context.Request.Params["rate"].ToString();
                    connstring.Open();
                    str = "update app_main_workreport set title = '" + title + "',type='" + type + "',content='" + content + "',rate = " + rate + " where id ='" + id + "'";
                    OCMDQT = new OracleCommand(str, connstring);
                    OCMDQT.ExecuteNonQuery();
                    connstring.Close();
                    json = "{\"result\" : \"保存成功\" }";
                    break;
                case "Del":
                    json = "4";
                    break;
                case "GetList":
                    user_id = context.Request.Params["user_id"].ToString();
                    months = context.Request.Params["months"].ToString();
                    weeks = context.Request.Params["weeks"].ToString();
                    connstring.Open();
                    str = "select * from wb_erp.app_main_workreport where userid = '" + user_id + "' and month ='" + months + "' and week = '" + weeks + "'";
                    ODA = new OracleDataAdapter(str, connstring);
                    ds = new DataSet();
                    ODA.Fill(ds);
                    if (ds == null || ds.Tables.Count <= 0 || ds.Tables[0].Rows.Count <= 0)
                    {
                        json = "";
                    }
                    else
                    {
                        json = JsonConvert.SerializeObject(ds);
                    }
                    break;
                case "GetAll":
                    user_id = context.Request.Params["user_id"].ToString();
                    connstring.Open();
                    str = "select * from wb_erp.app_main_workreport where userid = '" + user_id + "' and rownum < 20 order by month,week desc";
                    ODA = new OracleDataAdapter(str, connstring);
                    ds = new DataSet();
                    ODA.Fill(ds);
                    if (ds == null || ds.Tables.Count <= 0 || ds.Tables[0].Rows.Count <= 0)
                    {
                        json = "";
                    }
                    else
                    {
                        json = JsonConvert.SerializeObject(ds);
                    }
                    break;
                case "Submit":
                    user_id = context.Request.Params["user_id"].ToString();
                    months = context.Request.Params["months"].ToString();
                    weeks = context.Request.Params["weeks"].ToString();
                    connstring.Open();
                    str = "update app_main_workreport set status = 1,submittime = to_char(sysdate,'yyyy-mm-dd') where userid = '" + user_id + "' and month ='" + months + "' and week = '" + weeks + "'";
                    OCMDQT = new OracleCommand(str, connstring);
                    OCMDQT.ExecuteNonQuery();
                    connstring.Close();
                    json = "{\"result\" : \"提交成功\" }";
                    break;
                default:
                    break;
            }
            context.Response.Write(json);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        //DataSet转Json格式
        protected static string GetJsonByDataset(DataSet ds)
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

        protected static string ObjToStr(object ob)
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