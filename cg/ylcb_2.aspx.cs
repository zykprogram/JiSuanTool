using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;


namespace WebApp.cg
{
    public partial class ylcb_2 : System.Web.UI.Page
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
                string strZJ = "select * from ylxs order by material_name ";
                OracleDataAdapter adapterOA = new OracleDataAdapter(strZJ, ConnectionStringWb_erp);
                DataSet dsZJLB = new DataSet();
                ConnectionStringWb_erp.Close();
                adapterOA.Fill(dsZJLB);
                //    if (dsZJLB != null && dsZJLB.Tables[0].Rows.Count > 0)
                //   {
                DataTable dt = dsZJLB.Tables[0];
                rptZJList.DataSource = dt;
                rptZJList.DataBind();
            }
            catch (Exception e)
            {
                Response.Write(e.Message);
            }
            finally {
                ConnectionStringWb_erp.Close();
            }
            // DataView abv = dt.DefaultView;
            
            //   }
        }
    }
}