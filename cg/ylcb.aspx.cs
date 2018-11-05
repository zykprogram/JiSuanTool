using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;
using System.Text;


namespace WebApp.cg
{
    public partial class ylcb : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindzjkcDataList();
            }
        }
        /// <summary>
        /// 
        /// </summary>
        private void BindzjkcDataList()
        {
            //查询当前质检库存
           
             OracleConnection ConnectionStringWb_erp = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringWb_erp"].ConnectionString);               
             try
            {
                 ConnectionStringWb_erp.Open();
                 string strYLXS_X = "select * from ylxs where lx='1' order by orderby,MATERIAL_NAME ";//双小
                 string strYLXS_Z = "select * from ylxs where lx='2' order by orderby,MATERIAL_NAME ";//双中
                 string strYLXS_Y = "select * from ylxs where lx='3'  order by orderby,MATERIAL_NAME ";//双孕
                 string strYLJG = "select * from yljg t  order by orderid ,MATERIAL_MC";
                OracleDataAdapter adapterOA_X = new OracleDataAdapter(strYLXS_X, ConnectionStringWb_erp);
                OracleDataAdapter adapterOA_Z = new OracleDataAdapter(strYLXS_Z, ConnectionStringWb_erp);
                OracleDataAdapter adapterOA_Y = new OracleDataAdapter(strYLXS_Y, ConnectionStringWb_erp);
                OracleDataAdapter adapterJG = new OracleDataAdapter(strYLJG, ConnectionStringWb_erp);
                DataSet dsZJLB_X = new DataSet();
                DataSet dsZJLB_Z = new DataSet();
                DataSet dsZJLB_Y = new DataSet();
                DataSet dsJGLB = new DataSet();
                adapterOA_X.Fill(dsZJLB_X);
                adapterOA_Z.Fill(dsZJLB_Z);
                adapterOA_Y.Fill(dsZJLB_Y);
                adapterJG.Fill(dsJGLB);
                           
                DataTable dt_X = dsZJLB_X.Tables[0];
                DataTable dt_Z = dsZJLB_Z.Tables[0];
                DataTable dt_Y = dsZJLB_Y.Tables[0];
                DataTable dts = dsJGLB.Tables[0];
                rptZJList.DataSource = dt_X;
                rptZJList.DataBind();
                rptZJList_Z.DataSource = dt_Z;
                rptZJList_Z.DataBind();
                rptZJList_Y.DataSource = dt_Y;
                rptZJList_Y.DataBind();

                BinYLJG(dts); //绑定原料价格
                BinCGLB(dt_X);//绑定采购价格列表
                BinJYCB(dt_X);//绑定结果列表
            }
            catch (Exception e)
            {
                Response.Write(e.Message);
            }
            finally {
                ConnectionStringWb_erp.Close();
            }
           
        }
        //原料价格列表
        public void BinYLJG(DataTable dts)
        {
            LiteralYLJG.Text = "";
            for (int i = 0; i < dts.Rows.Count; i++)
            {
                if ("1".Equals(dts.Rows[i]["SFXS"].ToString()))
                {
                    LiteralYLJG.Text += "<tr style=\"display:none\"> <td style=\"text-align: center\">" + dts.Rows[i]["MATERIAL_MC"].ToString() + "</td> <td> <input id=\"TextYL" + (i + 1) + "\" type=\"text\" value=\"" + dts.Rows[i]["MATERIAL_JG"].ToString() + "\" /></td> </tr>";
                }else {
                    LiteralYLJG.Text += "<tr> <td style=\"text-align: center\">" + dts.Rows[i]["MATERIAL_MC"].ToString() + "</td> <td> <input id=\"TextYL" + (i + 1) + "\" type=\"text\" value=\"" + dts.Rows[i]["MATERIAL_JG"].ToString() + "\" /></td> </tr>";
                }
          }
        }
        public void BinCGLB(DataTable dt) {
            cgylCount.Value = dt.Rows.Count.ToString();
            litCGJG.Text = "";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                litCGJG.Text += "<tr > <td style=\"text-align: center\">" + dt.Rows[i]["MATERIAL_NAME"].ToString() + "</td> <td> <input id=\"TextLB"+(i+1)+"\" type=\"text\"  /></td> </tr >";
            }
        }

        public void BinJYCB(DataTable dt)
        {
            LiteralSXYS.Text = "";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                LiteralSXYS.Text += " <tr id=\"SXjg" + (i + 1) + "\" ><td style=\"text-align: center;width: 25%;\">" + dt.Rows[i]["MATERIAL_NAME"].ToString() + "</td><td style=\"text-align: center;width: 25%;\"><span id=\"spanSXJG" + (i + 1) + "\" ></span></td>"
                    + "<td style=\"text-align: center;width: 25%;\"><span id=\"spanSZJG" + (i + 1) + "\" ></span></td><td style=\"text-align: center;width: 25%;\"><span id=\"spanHYJG" + (i + 1) + "\" ></span></td></tr>";
                //LiteralSZYS.Text += " <tr id=\"SZjg" + (i + 1) + "\" ><td style=\"text-align: center\">" + dt.Rows[i]["MATERIAL_NAME"].ToString() + "</td><td style=\"text-align: center;\"><span id=\"spanSZJG" + (i + 1) + "\" ></span></td> </tr>";
                //LiteralHYYS.Text += " <tr id=\"HYjg" + (i + 1) + "\" ><td style=\"text-align: center\">" + dt.Rows[i]["MATERIAL_NAME"].ToString() + "</td><td style=\"text-align: center;\"><span id=\"spanHYJG" + (i + 1) + "\" ></span></td> </tr>";
            }
        }

        public String addBUM()
        {
               OracleConnection ConnectionStringWb_erp = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringWb_erp"].ConnectionString);
               string restr = "";  
            try
               {
                   String userIP = getIp();//HttpContext.Current.Request.UserHostAddress;
                  // String userIP=HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString(); 
                   ConnectionStringWb_erp.Open();
                   string strYLJG = "insert into ylbj_fwtj(IP,TS)VALUES('" + userIP + "',to_char(sysdate,'yyyy-MM-dd HH24:mi:ss'))";
                   OracleCommand OCOinertMBZ = new OracleCommand(strYLJG, ConnectionStringWb_erp);
                  restr=  OCOinertMBZ.ExecuteNonQuery().ToString();
               }
               catch (Exception e)
               {
                   Response.Write(e.Message);
               }
               finally
               {
                   ConnectionStringWb_erp.Close();
               }
               return restr;
        }

        private String  getIp()
        {
            if (System.Web.HttpContext.Current.Request.ServerVariables["HTTP_VIA"] != null)
                return System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].Split(new char[] { ',' })[0];
            else
                return System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        }
     
    }
}