using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

namespace WebApp.yx
{
    public partial class saleTarget : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string userid = Request.QueryString["userid"];
              //  userid = "015513";
                getCustomer(userid);
              DropDownList1_SelectedIndexChanged(null, null);
               // Common.MessageBox.Show(this, DropDownList1.SelectedIndex.ToString());
            }
        }

        protected void getCustomer(string userid)
        {
            OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringTool"].ConnectionString);
            connstring.Open();
            string str = "select custcode,custname from wb_erp.bd_cubasdoc where custcode='" + userid + "' union all " +
                "select distinct b.custcode1, b.custname1 from wb_erp.bd_custcode_view b where b.CUSTCODE3 in (select custcode from wb_erp.zsj_so_custmoerrelatsalesman a   where a.psncode = '" + userid + "'   and type = 'Y')";
            OracleDataAdapter adapter = new OracleDataAdapter(str, connstring);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                DropDownList1.DataSource = ds.Tables[0].DefaultView;
                //设置DropDownList空间显示项对应的字段名,假设表里面有两列,一列绑定下拉列表的Text,另一列绑定Value
                DropDownList1.DataValueField = ds.Tables[0].Columns[0].ColumnName;
                DropDownList1.DataTextField = ds.Tables[0].Columns[1].ColumnName;
                DropDownList1.DataBind();

            }
            connstring.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                getTarget(ds.Tables[0].Rows[0]["custcode"].ToString());
            }
        }

 
        protected void getTarget(string custcode)
        {
            OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringTool"].ConnectionString);
            connstring.Open();
            string str = "select custcode,sum(year) yearnum,sum(month1) month1,sum(month2) month2,sum(month3) month3,sum(month4) month4,sum(month5) month5,sum(month6) month6,sum(month7) month7,sum(month8) month8,sum(month9) month9,sum(month10) month10,sum(month11) month11,sum(month12) month12" +
 " from (select custcode," +
  " case when a.monthyear = '2017' then  sum(target)   end year," +
  " case when a.monthyear = '2017-01' then sum(target) end month1," +
  " case when a.monthyear = '2017-02' then sum(target) end month2," +
  " case when a.monthyear = '2017-03' then sum(target) end month3," +
 "  case when a.monthyear = '2017-04' then sum(target) end month4," +
 "  case when a.monthyear = '2017-05' then sum(target) end month5," +
  " case when a.monthyear = '2017-06' then sum(target) end month6," +
  " case when a.monthyear = '2017-07' then sum(target) end month7," +
 "  case when a.monthyear = '2017-08' then sum(target) end month8," +
 "  case when a.monthyear = '2017-09' then sum(target) end month9," +
 "  case when a.monthyear = '2017-10' then sum(target) end month10," +
 "  case when a.monthyear = '2017-11' then sum(target) end month11," +
  " case when a.monthyear = '2017-12' then sum(target) end month12" +
  "  from wb_erp.saletarget_customer a" +
 "  where custcode = '" + custcode + "'" +
 " group by custcode,monthyear)" +
 " group by custcode";
            OracleDataAdapter adapter = new OracleDataAdapter(str, connstring);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Text1.Value = ds.Tables[0].Rows[0]["yearnum"].ToString();
                Text2.Value = ds.Tables[0].Rows[0]["month1"].ToString();
                Text3.Value = ds.Tables[0].Rows[0]["month2"].ToString();
                Text4.Value = ds.Tables[0].Rows[0]["month3"].ToString();
                Text5.Value = ds.Tables[0].Rows[0]["month4"].ToString();
                Text6.Value = ds.Tables[0].Rows[0]["month5"].ToString();
                Text7.Value = ds.Tables[0].Rows[0]["month6"].ToString();
                Text8.Value = ds.Tables[0].Rows[0]["month7"].ToString();
                Text9.Value = ds.Tables[0].Rows[0]["month8"].ToString();
                Text10.Value = ds.Tables[0].Rows[0]["month9"].ToString();
                Text11.Value = ds.Tables[0].Rows[0]["month10"].ToString();
                Text12.Value = ds.Tables[0].Rows[0]["month11"].ToString();

            }
            connstring.Close();
            
        }




        protected void InsertAndUpdateTarget(string custcode,string yearmonth,string target)
        {
            OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringTool"].ConnectionString);
            connstring.Open();
            string strSelete = "select * from wb_erp.saletarget_customer a where a.custcode='" + custcode + "' and a.monthyear='" + yearmonth + "'  ";
            OracleDataAdapter adapter = new OracleDataAdapter(strSelete, connstring);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            //if (ds.Tables[0].Rows.Count > 1)
            //{
                string StrDel = "delete from wb_erp.saletarget_customer t where t.custcode='" + custcode + "' and t.monthyear='" + yearmonth + "'";
                string StrInsert = "insert into wb_erp.saletarget_customer(custcode,monthyear,target)  values('" + custcode + "','" + yearmonth + "','" + target + "')";
                OracleCommand OCDDel = new OracleCommand(StrDel, connstring);
               OCDDel.ExecuteNonQuery();
                OracleCommand OCDInsert = new OracleCommand(StrInsert, connstring);
                OCDInsert.ExecuteNonQuery();


            connstring.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
                InsertAndUpdateTarget(DropDownList1.SelectedValue.ToString(), "2017", Text1.Value);

                InsertAndUpdateTarget(DropDownList1.SelectedValue.ToString(), "2017-01", Text2.Value);
            
                InsertAndUpdateTarget(DropDownList1.SelectedValue.ToString(), "2017-02", Text3.Value);

                InsertAndUpdateTarget(DropDownList1.SelectedValue.ToString(), "2017-03", Text4.Value);

                InsertAndUpdateTarget(DropDownList1.SelectedValue.ToString(), "2017-04", Text5.Value);
 
                InsertAndUpdateTarget(DropDownList1.SelectedValue.ToString(), "2017-05", Text6.Value);
    
                InsertAndUpdateTarget(DropDownList1.SelectedValue.ToString(), "2017-06", Text7.Value);

                InsertAndUpdateTarget(DropDownList1.SelectedValue.ToString(), "2017-07", Text8.Value);

                InsertAndUpdateTarget(DropDownList1.SelectedValue.ToString(), "2017-08", Text9.Value);

                InsertAndUpdateTarget(DropDownList1.SelectedValue.ToString(), "2017-09", Text10.Value);

                InsertAndUpdateTarget(DropDownList1.SelectedValue.ToString(), "2017-10", Text11.Value);

                InsertAndUpdateTarget(DropDownList1.SelectedValue.ToString(), "2017-11", Text12.Value);
  
                InsertAndUpdateTarget(DropDownList1.SelectedValue.ToString(), "2017-12", Text13.Value);
            
        }



        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string userid = DropDownList1.SelectedValue.ToString();
        //  userid = "BCAD1055";
            getTarget(userid);
         //   Common.MessageBox.Show(this, DropDownList1.SelectedValue.ToString());
        }
    }
}