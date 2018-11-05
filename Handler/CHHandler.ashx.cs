using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
//using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Data.OracleClient;

namespace WebApp.Handler
{
    /// <summary>
    /// CHHandler 的摘要说明
    /// </summary>
    public class CHHandler : IHttpHandler
    {
        protected OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringWb_erp"].ConnectionString);

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "json/plain";
            string method = context.Request.Params["method"].ToString();
            string json = "";
            OracleCommand OCMDQT;
            OracleDataAdapter ODA;
            DataSet ds;
            string str = "";
            switch (method)
            {
                case "Get":
                    connstring.Open();
                    string id = context.Request.Params["id"].ToString();
                    str = "select * from wb_erp.app_main_archives where id ='" + id + "'";
                    ODA = new OracleDataAdapter(str, connstring);
                    ds = new DataSet();
                    ODA.Fill(ds);
                    json = JsonConvert.SerializeObject(ds.Tables[0]);
                    connstring.Close();
                    break;
                case "Edit":
                    connstring.Open();
                    //刷新旧修改数据
                    str = "update wb_erp.app_main_archives set editflag = 2 where editflag = 1 and edit_user ='"+ context.Request.Params["User_id"].ToString() + "'";
                    OCMDQT = new OracleCommand(str, connstring);
                    OCMDQT.ExecuteNonQuery();
                    //刷新
                    str = "update wb_erp.app_main_archives set type = '" + context.Request.Params["Type"].ToString() + "',Address='" + context.Request.Params["Address"].ToString() + "',LinkMan='" + context.Request.Params["Linkman"].ToString() + "',Phone='" + context.Request.Params["Phone"].ToString() + "',Status='" + context.Request.Params["Status"].ToString() + "',Brand='" + context.Request.Params["Brand"].ToString() + "',TotalCl = " + Convert.ToDouble(context.Request.Params["TotalCl"].ToString()==""?"0": context.Request.Params["TotalCl"].ToString()) + ",Mccl = " + Convert.ToDouble(context.Request.Params["Mccl"].ToString()==""?"0": context.Request.Params["Mccl"].ToString()) + ",Cl = " + Convert.ToDouble(context.Request.Params["Cl"].ToString()==""?"0": context.Request.Params["Cl"].ToString()) + ",editflag = 1,edit_user = '"+ context.Request.Params["User_id"].ToString() + "' where id ='" + context.Request.Params["id"].ToString() + "'";
                    OCMDQT = new OracleCommand(str, connstring);
                    OCMDQT.ExecuteNonQuery();
                    json = "{\"result\" : \"保存成功\" }";
                    connstring.Close();
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
    }
}