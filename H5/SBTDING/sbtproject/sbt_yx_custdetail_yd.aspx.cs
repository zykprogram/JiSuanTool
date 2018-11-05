using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.H5.SBTDING.sbtproject
{
    public partial class sbt_yx_custdetail_yd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string pkid = Request.QueryString["id"];
                getCustname(pkid);
            }
        }

        protected void getCustname(string id)
        {
            OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringWb_erp"].ConnectionString);
            connstring.Open();
            //表头PK
            string strpk = "select * from sbt_customerlose_yd a where id  ='" + id + "' ";
            OracleDataAdapter ODA = new OracleDataAdapter(strpk, connstring);
            DataSet ds = new DataSet();
            ODA.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                inputcust.Value = ds.Tables[0].Rows[0]["custname"].ToString();
                pkid.Value = ds.Tables[0].Rows[0]["id"].ToString();
                textarea.Value = ds.Tables[0].Rows[0]["countermeasures"].ToString();
                showPicker.InnerText = ds.Tables[0].Rows[0]["competitor"].ToString();
                showUserPicker.InnerText = ds.Tables[0].Rows[0]["reason"].ToString();
                showUserPicker2.InnerText = ds.Tables[0].Rows[0]["reason2"].ToString();
                showUserPicker3.InnerText = ds.Tables[0].Rows[0]["reason3"].ToString();
                otherCS.Value=ds.Tables[0].Rows[0]["othercompetitor"].ToString();
                if (ds.Tables[0].Rows[0]["issave"].ToString() == "可挽回")
                {
                    radiogroup1.Checked = true;
                }
                if (ds.Tables[0].Rows[0]["issave"].ToString() == "不可挽回")
                {
                    radiogroup2.Checked = true;
                }
              
            }
            connstring.Close();
        }

       


        [System.Web.Services.WebMethod]
        public static string insertvalue(string reason, string reason2, string reason3, string competitor, string countermeasures, string id, string othercs,string issave)
        {
   
            OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringWb_erp"].ConnectionString);
            connstring.Open();
         
            //表头PK
            string str = "update sbt_customerlose_yd set issave='" + issave + "', othercompetitor='" + othercs + "',ts=to_char(sysdate,'yyyy-mm-dd hh24:mi:ss'),reason2='" + reason2 + "',reason3='" + reason3 + "',reason='" + reason + "',competitor='" + competitor + "',countermeasures='" + countermeasures + "' where id='" + id + "'";
            OracleCommand OCMDQT = new OracleCommand(str, connstring);
            OCMDQT.ExecuteNonQuery();
            connstring.Close();
            return str;
        }
    }
}