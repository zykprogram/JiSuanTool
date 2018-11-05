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
    public partial class sbt_custdingtalk_salecost_target : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
         
            }
        }

        [System.Web.Services.WebMethod]
        public static string insertvalue(string custcode, string yearmonth, string COSTNUMBER, string SALENUMBER)
        {
            string str2insert;
            string str1insert;

            try
            {
                OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringWb_erp"].ConnectionString);
                connstring.Open();

                //表头PK
                //删除销量目标 
                string str1delete = "delete from wb_erp.saletarget_customer where monthyear='" + yearmonth + "' and custcode ='" + custcode + "'";
                OracleCommand OCMDQT1 = new OracleCommand(str1delete, connstring);
                OCMDQT1.ExecuteNonQuery();
                //删除利润目标 
                string str2delete = "delete from wb_erp.costtarget_customer where monthyear='" + yearmonth + "' and custcode ='" + custcode + "'";
                OracleCommand OCMDQT2 = new OracleCommand(str2delete, connstring);
                OCMDQT2.ExecuteNonQuery();

                //写入利润数据
                str1insert = "insert into costtarget_customer (CUSTCODE,MONTHYEAR, TARGET) values ('" + custcode + "','" + yearmonth + "','" + COSTNUMBER + "')";
                OracleCommand OCMDQT3 = new OracleCommand(str1insert, connstring);
                OCMDQT3.ExecuteNonQuery();

                //写入销量数据
                str2insert = "insert into saletarget_customer (CUSTCODE,MONTHYEAR, TARGET) values ('" + custcode + "','" + yearmonth + "','" + SALENUMBER + "')";
                OracleCommand OCMDQT4 = new OracleCommand(str2insert, connstring);
                OCMDQT4.ExecuteNonQuery();
                connstring.Close();
                return str2insert;
            }
            catch (Exception e)
            {
                throw (e);
            }
            finally
            {

            }
            return str2insert;
        }

      

       [System.Web.Services.WebMethod]
        public static string getCustname(string userid, string yearmonth)
        {

            int i = 0;
            string str = "";
            OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringWb_erp"].ConnectionString);
            connstring.Open();
            //表头PK
            string strpk = "select distinct d.custcode1 as custcode, " +
               " d.custname1 as custname, " +
              "   psncode, " +
              "   nvl(b.target, 0) as saletarget, " +
             "    nvl(c.target, 0) as costtarget, " +
               "  c.monthyear, " +
               "  b.monthyear " +
  " from wb_erp.zsj_so_custmoerrelatsalesman a, " +
 "       (select * from wb_erp.saletarget_customer where monthyear = '"+yearmonth+"') b, " +
  "      (select * from wb_erp.costtarget_customer where monthyear = '"+yearmonth+"') c, " +
 "       wb_erp.bd_custcode_view d " +
 " where a.isrecently = 'Y' " +
 "   and a.custcode = d.custcode1 " +
 "   and a.custcode = c.custcode(+) " +
 "   and a.custcode = b.custcode(+) " +
 "   and a.type = 'Y' " +
 "   and a.psncode = '" + userid + "' order by nvl(c.target, 0) desc, nvl(b.target, 0) desc ";
            OracleDataAdapter ODA = new OracleDataAdapter(strpk, connstring);
            DataSet ds = new DataSet();
            ODA.Fill(ds);

            for (i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                str = str + "	<div class='mui-input-row'> " +
                    //     "  <label  style='width:40%' text='" + ds.Tables[0].Rows[i]["custcode"].ToString() + "'  id='" + i + "'>" + ds.Tables[0].Rows[i]["custname"].ToString() + ":</label> " +
                    //    "  <input style='width:30%' class='mui-input-clear'  placeholder='带清除按钮输入框' value='" + ds.Tables[0].Rows[i]["saletarget"].ToString() + "'  id='SALENUMBER" + i + "' /> " +
                    //     " <input style='width:30%' class='mui-input-clear'  value='" + ds.Tables[0].Rows[i]["costtarget"].ToString() + "'  id='COSTNUMBER" + i + "' /> " +
                    //"  </div>";
                        " <label style='width:40%;heigth:250px' value=" + ds.Tables[0].Rows[i]["custcode"].ToString() + " id=" + i + ">" + ds.Tables[0].Rows[i]["custname"].ToString() + "</br>:<a>" + ds.Tables[0].Rows[i]["custcode"].ToString() + "</a></label> " +
                    " 	<input style='width:30%' type='number' class='mui-input-clear'  value='" + ds.Tables[0].Rows[i]["saletarget"].ToString() + "'  id='SALENUMBER" + i + "' > " +
                     "    <input style='width:30%' type='number' class='mui-input-clear'  value='" + ds.Tables[0].Rows[i]["costtarget"].ToString() + "'  id='COSTNUMBER" + i + "'> " +
                    " </div> ";

            }
                           str = str + "  <div style='display:none' > " +
                   "     <input  id ='CN' type='text' runat='server' value='" + ds.Tables[0].Rows.Count + "'/>  " +
                 " </div>";
           // divHTML.InnerHtml = str;
            //CN.Value = ds.Tables[0].Rows.Count.ToString();
            connstring.Close();
            return str;
        }

  


    }
}