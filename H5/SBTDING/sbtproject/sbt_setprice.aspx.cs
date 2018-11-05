using System;
using System.Collections.Generic;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.H5.SBTDING.sbtproject
{
    public partial class sbt_setprice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public static string insertvalue(string Province,string City,string County,string Type,string Price)
        {

            OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringWb_erp"].ConnectionString);
            //OracleConnection connstring = new OracleConnection("User ID=wb_erp;Password=xxzx192837wberp;Data Source=(DESCRIPTION = (ADDRESS_LIST= (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.10.124)(PORT = 1521))) (CONNECT_DATA = (SERVICE_NAME = sbtrdp)));Unicode=true");
            connstring.Open();

            //表头PK
            string str = "insert into app_main_pigprice(Province,City,County,PIGTYPE,PRICE,DBILLDATE) values('" + Province + "','" + City + "','" + County + "','" + Type + "'," + Price + ",to_char(sysdate,'yyyy-mm-dd'))";
            OracleCommand OCMDQT = new OracleCommand(str, connstring);
            OCMDQT.ExecuteNonQuery();
            connstring.Close();
            return str;
        }
    }
}