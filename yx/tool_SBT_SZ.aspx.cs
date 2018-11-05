using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;
using System.Data;
using System.Net;
using System.IO;
using System.Text;
using System.Drawing;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Security.Cryptography;


namespace WebApp.yx
{
    public partial class tool_SBT_SZ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {


                string mobile = Request.QueryString["usercode"];

                TxtMobile.Text = mobile;
                TextBox1.Text = mobile;
                int DW = Convert.ToInt32(TxtDW.Text.ToString());

            }

        }

        public static string DesDecrypt(string decryptString)
        {

            string key = "xxzx@123";
            byte[] keyBytes = Encoding.UTF8.GetBytes(key.Substring(0, 8));
            byte[] keyIV = keyBytes;
            byte[] inputByteArray = Convert.FromBase64String(Encoding.UTF8.GetBytes(decryptString.Substring(0, 8)).ToString());
            DESCryptoServiceProvider provider = new DESCryptoServiceProvider();
            MemoryStream mStream = new MemoryStream();
            CryptoStream cStream = new CryptoStream(mStream, provider.CreateDecryptor(keyBytes, keyIV), CryptoStreamMode.Write);
            cStream.Write(inputByteArray, 0, inputByteArray.Length);
            cStream.FlushFinalBlock();
            return Encoding.UTF8.GetString(mStream.ToArray());
        }



        public void GetURLText(string Url)
        {
            string sException = null;
            string sRslt = null;
            WebResponse oWebRps = null;
            WebRequest oWebRqst = WebRequest.Create(Url);
            oWebRqst.Timeout = 50000;
            try
            {
                oWebRps = oWebRqst.GetResponse();
            }
            catch (WebException e)
            {
                sException = e.Message.ToString();
                Response.Write(sException);
            }
            catch (Exception e)
            {
                sException = e.ToString();
                Response.Write(sException);
            }
            finally
            {
                if (oWebRps != null)
                {
                    StreamReader oStreamRd = new StreamReader(oWebRps.GetResponseStream(), Encoding.GetEncoding("UTF-8"));
                    sRslt = oStreamRd.ReadToEnd();
                    oStreamRd.Close();
                    oWebRps.Close();
                }
            }
            //   Literal1.Text = sRslt;
        }
        protected void InsertValue()
        {

            OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringTool"].ConnectionString);
            connstring.Open();
            //SqlConnection connstringAPP = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringApp"].ConnectionString);
            //connstringAPP.Open();
            //string strAPPHre = "select '' MarketingProvinces,'' SalesDept,RealName,IDNumber from Com_Member where IDNumber ='" + TextBox1.Text + "'";
            //SqlCommand sqlCMD = new SqlCommand(strAPPHre, connstringAPP);
            //SqlDataAdapter adapter = new SqlDataAdapter(sqlCMD);
            //DataSet dsAPP = new DataSet();
            //adapter.Fill(dsAPP);
            //connstringAPP.Close();
            string StrTBR = "";
            string StrWrokcode = TextBox1.Text;
            string StrDept = "";
            string StrSub = "";
            string StrScur = "";
            //if (dsAPP.Tables[0].Rows.Count > 0)
            //{
            //    StrProvice = dsAPP.Tables[0].Rows[0]["MarketingProvinces"].ToString();
            //    StrYXB = dsAPP.Tables[0].Rows[0]["SalesDept"].ToString();
            //    StrTBR = dsAPP.Tables[0].Rows[0]["RealName"].ToString();
            //    StrWrokcode = dsAPP.Tables[0].Rows[0]["IDNumber"].ToString();

            //    ////根据人员编码取OA人员的组织架构
            //    //OracleConnection connstringOA = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringOA"].ConnectionString);
            //    //connstringOA.Open();
            //    //string strOA = "select c.subcompanyname,b.departmentname,a.lastname,a.seclevel from  oa30.hrmresource a ,oa30.hrmdepartment b,oa30.hrmsubcompany c  where workcode= '" + StrWrokcode + "' and a.departmentid=b.id and a.subcompanyid1=c.id";
            //    ////     OracleCommand sqlOACMD = new OracleCommand(strAPPHre, connstringAPP);
            //    //OracleDataAdapter adapterOA = new OracleDataAdapter(strOA, connstringOA);
            //    ////DataSet dsOA = new DataSet();
            //    //adapterOA.Fill(dsOA);
            //    //if (dsOA.Tables[0].Rows.Count > 0)
            //    //{
            //    //    StrDept = dsOA.Tables[0].Rows[0]["departmentname"].ToString();
            //    //    StrSub = dsOA.Tables[0].Rows[0]["subcompanyname"].ToString();
            //    //    StrTBR = dsOA.Tables[0].Rows[0]["lastname"].ToString();
            //    //    StrScur = dsOA.Tables[0].Rows[0]["seclevel"].ToString();
            //    //}
            //    //connstringOA.Close();


            //}
            /*修改三胞胎，不存人员信息，报表改取主数据 by 文师贤*/
            StrDept = "";
            StrSub = "";
            StrTBR = "";
            StrScur = "";
            //表头PK
            string strpk = "select to_char(sysdate, 'yyyyMMddHHmmss')||" + StrWrokcode + "  from dual ";
            OracleDataAdapter ODA = new OracleDataAdapter(strpk, connstring);
            DataSet ds = new DataSet();
            ODA.Fill(ds);

            string str_pk_sz_JBXX = ds.Tables[0].Rows[0][0].ToString();
            TextPK.Text = ds.Tables[0].Rows[0][0].ToString();
            //删除当天重复数据，先删除辅表，再删除主表
            string strSQLChongFuZB = "delete T_SZ_JBXX  where yhmobile='" + TxtPhone.Value + "' and ksrq='" + TxtKSRQ.Text + "'";
            string strSQLChongFuFB = "delete t_sz_szsj where pk_sz_jbxx in (select pk_sz_jbxx from t_sz_jbxx where yhmobile='" + TxtPhone.Value + "' and ksrq='" + TxtKSRQ.Text + "')";

            //基本信息

            string strSQLjbxx = "insert into t_sz_jbxx (PK_SZ_JBXX,title, PROVICE, YXB, SZLB, NAME, ADDRESS, PHONE, TBR, TS,ksrq,yhMobile,ZJ,IMAGENAME,workcode,seclevel)" +
            " values ('" + str_pk_sz_JBXX + "','三胞胎','" + StrSub + "', '" + StrDept + "', '', '" + TxtName.Value + "', '" + TxtAdd.Value + "', '" + TxtMobile.Text + "', '" + StrTBR + "',  to_char(sysdate,'yyyy-mm-dd hh24:mi:ss'),'" + TxtKSRQ.Text + "','" + TxtPhone.Value + "','" + TxtZJ.Value + "','" + TxtImageID.Text + "','" + StrWrokcode + "','" + StrScur + "')";

            //表体SBT  PK

            // object objpkY = DBUtility.DbHelperOra.GetSingle(strpkY);
            // string str_pk_sz_SZSJY = objpk.ToString();
            //三胞胎实证
            //判断是否为浓缩料,如果是浓缩料增值乘4x
            if (TxtSBTX.Text.IndexOf("浓") != 0)
            {
                LitBZZ.Text = (float.Parse(LitBZZ.Text) * 4).ToString();
            }

            string strSQLSBT = "insert into T_SZ_SZSJ (PK_SZ_JBXX,free1 ,TOUS, CJZ, MJZ, ZYL, YLTS, TJYL, SLJG, RCSL, RZZ, LRB, JRB, BZZ, ZZ,type, TS,free2,free3)" +
        " values ( '" + str_pk_sz_JBXX + "','" + TxtSBTX.Text + "','" + TxtTS1.Text + "', '" + TxtCJZ1.Text + "', '" + TxtMJZ1.Text + "', '" + TxtZYL1.Text + "', '" + TxtYLTS1.Text + "', '" + TxtTJYL1.Text + "', '" + TxtCLJG1.Text + "', '" + TxtCSL1.Text + "', '" + TxtRZZ1.Text + "', '" + TxtLRB1.Text + "', '" + TxtJRB1.Text + "', '" + TxtBZZ1.Text + "', '" + LitBZZ.Text + "','Y', to_char(sysdate,'yyyy-mm-dd hh24:mi:ss')" + ",'" + MZTS.Value + "','" + JZR.Value+"')";

            //表体竞争对手  PK
            //  string strpkN = "select pk_t_sz.nextval from dual ";
            // object objpkN = DBUtility.DbHelperOra.GetSingle(strpkN);
            // string str_pk_sz_SZSJN = objpk.ToString();

            //其他公司实证
            string strSQLQT = "insert into T_SZ_SZSJ ( PK_SZ_JBXX, free1,TOUS, CJZ, MJZ, ZYL, YLTS, TJYL, SLJG, RCSL, RZZ, LRB, JRB, BZZ, ZZ,type, TS)" +
        " values ('" + str_pk_sz_JBXX + "','" + TxtJXSX.Text + "', '" + TxtTS2.Text + "', '" + TxtCJZ2.Text + "', '" + TxtMJZ2.Text + "', '" + TxtZYL2.Text + "', '" + TxtYLTS2.Text + "', '" + TxtTJYL2.Text + "', '" + TxtCLJG2.Text + "', '" + TxtCSL2.Text + "', '" + TxtRZZ2.Text + "', '" + TxtLRB2.Text + "', '" + TxtJRB2.Text + "', '" + TxtBZZ2.Text + "', '" + LitBZZ.Text + "','N', to_char(sysdate,'yyyy-mm-dd hh24:mi:ss'))";


            //     OracleDataAdapter ODAJB = new OracleDataAdapter(strpk, connstring);
            //删除重复数据，当天的且养户电话相同
            OracleCommand OCMDDelChongFuFB = new OracleCommand(strSQLChongFuFB, connstring);
            OCMDDelChongFuFB.ExecuteNonQuery();
            OracleCommand OCMDDelChongFuZB = new OracleCommand(strSQLChongFuZB, connstring);
            OCMDDelChongFuZB.ExecuteNonQuery();
            OracleCommand OCMD = new OracleCommand(strSQLjbxx, connstring);
            OCMD.ExecuteNonQuery();
            OracleCommand OCMDSBT = new OracleCommand(strSQLSBT, connstring);
            OCMDSBT.ExecuteNonQuery();
            OracleCommand OCMDQT = new OracleCommand(strSQLQT, connstring);
            OCMDQT.ExecuteNonQuery();

            //    object obj = DBUtility.DbHelperOra.ExecuteSql(strSQLjbxx);
            //   object objSBT = DBUtility.DbHelperOra.ExecuteSql(strSQLSBT);
            //   object objQT = DBUtility.DbHelperOra.ExecuteSql(strSQLQT);
            connstring.Close();
            //  Response.Write(StrProvice + StrYXB + StrTBR);

        }
        protected void JiSuan()
        {
            int DW = Convert.ToInt32(TxtDW.Text.ToString());
            if (float.Parse(TxtMJZ1.Text) <= float.Parse(TxtCJZ1.Text))
            {
                Common.MessageBox.Show(this, "末重不允许小于或等于初重");
                return;
            }
            if (float.Parse(TxtMJZ2.Text) <= float.Parse(TxtCJZ2.Text))
            {
                Common.MessageBox.Show(this, "末重不允许小于或等于初重");
                return;
            }
            //头均用料（斤）计算公式：总用料/头数
            TxtTJYL1.Text = (float.Parse(TxtZYL1.Text) / float.Parse(TxtTS1.Text)).ToString("0.00");
            TxtTJYL2.Text = (float.Parse(TxtZYL2.Text) / float.Parse(TxtTS2.Text)).ToString("0.00");

            //日采食量（斤）计算公式：总用料/总用料/头数
            TxtCSL1.Text = ((float.Parse(TxtZYL1.Text) / float.Parse(TxtYLTS1.Text)) / float.Parse(TxtTS1.Text)).ToString("0.00");
            TxtCSL2.Text = ((float.Parse(TxtZYL2.Text) / float.Parse(TxtYLTS2.Text)) / float.Parse(TxtTS2.Text)).ToString("0.00");

            //日增重  计算公式：（末重-初重）/用料天数
            TxtRZZ1.Text = ((float.Parse(TxtMJZ1.Text) - float.Parse(TxtCJZ1.Text)) / float.Parse(TxtYLTS1.Text)).ToString("0.00");
            TxtRZZ2.Text = ((float.Parse(TxtMJZ2.Text) - float.Parse(TxtCJZ2.Text)) / float.Parse(TxtYLTS2.Text)).ToString("0.00");



            //价肉比（X:1） 计算公式：饲料价格（斤）*头均用料（斤）/（末均重（斤）-初均重（斤）)
            TxtJRB1.Text = (float.Parse(TxtCLJG1.Text) / DW * float.Parse(TxtTJYL1.Text) / (float.Parse(TxtMJZ1.Text) - float.Parse(TxtCJZ1.Text))).ToString("0.00");
            TxtJRB2.Text = (float.Parse(TxtCLJG2.Text) / DW * float.Parse(TxtTJYL2.Text) / (float.Parse(TxtMJZ2.Text) - float.Parse(TxtCJZ2.Text))).ToString("0.00");

            //吨长猪 计算公式：
            TxtBZZ1.Text = (DW / float.Parse(TxtLRB1.Text)).ToString("0.00");
            TxtBZZ2.Text = (DW / float.Parse(TxtLRB2.Text)).ToString("0.00");

            //吨增值 
            if (TxtSBTX.Text.IndexOf("浓") != 0)
            {
                LitBZZ.Text = (((float.Parse(TxtBZZ1.Text) - float.Parse(TxtBZZ2.Text)) * float.Parse(TxtZJ.Value)) - (float.Parse(TxtCLJG1.Text) - float.Parse(TxtCLJG2.Text))).ToString("0.00");
                LitBZZ.Text = (float.Parse(LitBZZ.Text) * 4).ToString();
            } if (string.IsNullOrEmpty(TxtSBTX.Text) && string.IsNullOrEmpty(TxtJXSX.Text))
            {
                return;
            }
            else
            {
              //  SPANID.Attributes.Remove("hidden");
                LitSBT.Text = TxtSBTX.Text;
                LitQT.Text = TxtJXSX.Text;
            }
        }

        protected bool JiaoYan()
        {
            string match = @"^(?ni:(?=\d)((?'year'((1[6-9])|([2-9]\d))\d\d)(?'sep'[/.-])(?'month'0?[1-9]|1[012])\2(?'day'((?<!(\2((0?[2469])|11)\2))31)|(?<!\2(0?2)\2)(29|30)|((?<=((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|(16|[2468][048]|[3579][26])00)\2\3\2)29)|((0?[1-9])|(1\d)|(2[0-8])))(?:(?=\x20\d)\x20|$))?((?<time>((0?[1-9]|1[012])(:[0-5]\d){0,2}(\x20[AP]M))|([01]\d|2[0-3])(:[0-5]\d){1,2}))?)$";

            if (!Regex.IsMatch(TxtKSRQ.Text, match))
            {
                Common.MessageBox.Show(this, "日期格式不正确，请重新填写");
                return false;
            }


            if (string.IsNullOrEmpty(TxtMobile.Text))
            {
                Common.MessageBox.Show(this, "身份验证未通过，请清理缓存，重新登录！");
                return false;
            }

            //OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringTool"].ConnectionString);
            //string strSQL = "select count(*) from T_SZ_DIC where pk_id='" + TxtSBTID.Text + "'";
            //connstring.Open();
            //OracleDataAdapter OdAp = new OracleDataAdapter(strSQL, connstring);
            //DataSet ds = new DataSet();
            //OdAp.Fill(ds);
            //string obj = ds.Tables[0].Rows[0][0].ToString();
            ////  string obj = DBUtility.DbHelperOra.GetSingle(strSQL).ToString();
            //string strJXSSQL = "select count(*) from T_SZ_DIC where pk_id='" + TxtJXSID.Text + "'";
            //OracleDataAdapter OdApJXSSQL = new OracleDataAdapter(strJXSSQL, connstring);
            //DataSet dsJXSSQL = new DataSet();
            //OdApJXSSQL.Fill(dsJXSSQL);

            //string objJXS = dsJXSSQL.Tables[0].Rows[0][0].ToString();
            //connstring.Close();
            //if (string.IsNullOrEmpty(obj) || obj == "0")
            //{
            //    Common.MessageBox.Show(this, "对比指标中三胞胎品牌未填写或不存在！");

            //    return false;
            //}



            //// object objJXS = DBUtility.DbHelperOra.GetSingle(strJXSSQL);
            //if (string.IsNullOrEmpty(objJXS) || objJXS == "0")
            //{
            //    Common.MessageBox.Show(this, "对比指标中对比厂商未填写或不存在！");

            //    return false;
            //}


            if (string.IsNullOrEmpty(TxtTS1.Text) && TxtTS1.Text != "0")
            {
                Common.MessageBox.Show(this, "三胞胎品牌头数未填写！");
                return false;
            }

            if (string.IsNullOrEmpty(TxtCJZ1.Text) && TxtCJZ1.Text != "0")
            {
                Common.MessageBox.Show(this, "三胞胎品牌初均重未填写！");
                return false;
            }
            if (string.IsNullOrEmpty(TxtMJZ1.Text) && TxtMJZ1.Text != "0")
            {
                Common.MessageBox.Show(this, "三胞胎品牌末均重未填写！");
                return false;
            }

            if (string.IsNullOrEmpty(TxtZYL1.Text) && TxtZYL1.Text != "0")
            {
                Common.MessageBox.Show(this, "三胞胎品牌总用料未填写！");
                return false;
            }
            if (string.IsNullOrEmpty(TxtYLTS1.Text) && TxtYLTS1.Text != "0")
            {
                Common.MessageBox.Show(this, "三胞胎品牌用料天数未填写！");
                return false;
            }
            if (string.IsNullOrEmpty(TxtTJYL1.Text) && TxtTJYL1.Text != "0")
            {
                Common.MessageBox.Show(this, "三胞胎品牌头均用料未填写！");
                return false;
            }
            if (string.IsNullOrEmpty(TxtCLJG1.Text) && TxtCLJG1.Text != "0")
            {
                Common.MessageBox.Show(this, "三胞胎品牌饲料价格未填写！");
                return false;
            }

            if (string.IsNullOrEmpty(TxtZJ.Value) && TxtZJ.Value != "0")
            {
                Common.MessageBox.Show(this, "猪价未填写！");
                return false;
            }

            if (string.IsNullOrEmpty(TxtName.Value) && TxtName.Value != "0")
            {
                Common.MessageBox.Show(this, "养户（猪场）未填写！");
                return false;
            }
            if (string.IsNullOrEmpty(TxtPhone.Value) && TxtPhone.Value != "0")
            {
                Common.MessageBox.Show(this, "电话未填写！");
                return false;
            }
            if (string.IsNullOrEmpty(TxtAdd.Value) && TxtAdd.Value != "0")
            {
                Common.MessageBox.Show(this, "地址未填写！");
                return false;
            }
            if (string.IsNullOrEmpty(TxtKSRQ.Text) && TxtKSRQ.Text != "0")
            {
                Common.MessageBox.Show(this, "开始日期未填写！");
                return false;
            }
            //竞争厂商校难
            if (string.IsNullOrEmpty(TxtTS2.Text) && TxtTS2.Text != "0")
            {
                Common.MessageBox.Show(this, "对比厂商头数未填写！");
                return false;
            }

            if (string.IsNullOrEmpty(TxtCJZ2.Text) && TxtCJZ2.Text != "0")
            {
                Common.MessageBox.Show(this, "对比厂商初均重未填写！");
                return false;
            }
            if (string.IsNullOrEmpty(TxtMJZ2.Text) && TxtMJZ2.Text != "0")
            {
                Common.MessageBox.Show(this, "对比厂商末均重未填写！");
                return false;
            }

            if (string.IsNullOrEmpty(TxtZYL2.Text) && TxtZYL2.Text != "0")
            {
                Common.MessageBox.Show(this, "对比厂商总用料未填写！");
                return false;
            }
            if (string.IsNullOrEmpty(TxtYLTS2.Text) && TxtYLTS2.Text != "0")
            {
                Common.MessageBox.Show(this, "对比厂商用料天数未填写！");
                return false;
            }
            if (string.IsNullOrEmpty(TxtTJYL2.Text) && TxtTJYL2.Text != "0")
            {
                Common.MessageBox.Show(this, "对比厂商头均用料未填写！");
                return false;
            }
            if (string.IsNullOrEmpty(TxtCLJG2.Text) && TxtCLJG2.Text != "0")
            {
                Common.MessageBox.Show(this, "对比厂商饲料价格未填写！");
                return false;
            }
            //料肉比（X:1） 计算公式：总用料/（末均重（斤）-初均重（斤）/头数 

            TxtLRB1.Text = ((float.Parse(TxtZYL1.Text) / (float.Parse(TxtMJZ1.Text) - float.Parse(TxtCJZ1.Text))) / float.Parse(TxtTS1.Text)).ToString("0.00");
            TxtLRB2.Text = ((float.Parse(TxtZYL2.Text) / (float.Parse(TxtMJZ2.Text) - float.Parse(TxtCJZ2.Text))) / float.Parse(TxtTS2.Text)).ToString("0.00");

            //if (float.Parse(TxtLRB1.Text) >= 4 || float.Parse(TxtLRB1.Text) <= 1)
            //{
            //    Common.MessageBox.Show(this, "三胞胎料肉比超出范围,请核对数据");
            //    return false;
            //}
            //if (float.Parse(TxtLRB2.Text) >= 9 || float.Parse(TxtLRB2.Text) <= 1)
            //{
            //    Common.MessageBox.Show(this, "对比指标料肉比超出范围，请核对数据");
            //    return false;
            //}

            return true;
        }
        protected void BtnJS_Click(object sender, EventArgs e)
        {

            if (JiaoYan())
            {
                JiSuan();
                InsertValue();
                //TxtName.Value = "";
                //TxtPhone.Value = "";
                //TxtAdd.Value = "";
                //TxtKSRQ.Text = "";
                //// string StrURL = "http://59.55.142.211:9527/RDP/ReportServer?reportlet=/SBT/[8425][9500][5206][6790]/[79f0][732a][7b97][8d26].cpt&__parameters__={'_':'1408606310269','__pi__':'true','REPORTNAME':'%25E7%25A7%25B0%25E7%258C%25AA%25E6%25B1%2587%25E6%2580%25BB.cpt','__LOCALE__':'zh_CN','REPORTLET':'[79f0][732a][6c47][603b].cpt','OP':'view','xh':" + TextPK.Text + "}";
                string StrURL = "http://yf.sbtjt.com/ReportServer?reportlet=SanBT_CZ.cpt&op=view&PK_SZ_JBXX=" + TextPK.Text;
           
                ////   Common.MessageBox.Show(this, "保存成功");
                Common.MessageBox.ShowAndRedirect(this, "保存成功", StrURL);
                //Response.Redirect(StrURL);
                //Common.MessageBox.Show(this, "保存成功");

            }
            // InsertValue();
        }

        //protected void TxtSBTX_TextChanged(object sender, EventArgs e)
        //{
        //    OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringTool"].ConnectionString);


        //    string strSQL = "select pk_id from T_SZ_DIC where sz_name like '%" + TxtSBTX.Text + "%'";
        //    connstring.Open();
        //    OracleDataAdapter ODB = new OracleDataAdapter(strSQL, connstring);
        //    DataSet ds = new DataSet();
        //    ODB.Fill(ds);
        //    string obj = null;
        //    if (ds.Tables[0].Rows.Count > 0)
        //    {
        //        obj = ds.Tables[0].Rows[0][0].ToString();
        //    }
        //    if (!string.IsNullOrEmpty(obj))
        //    {
        //        TxtSBTID.Text = obj.ToString();
        //    }
        //    connstring.Close();
        //}

        //protected void TxtJXSX_TextChanged(object sender, EventArgs e)
        //{
        //    OracleConnection connstring = new OracleConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionStringTool"].ConnectionString);

        //    string strSQL = "select pk_id from T_SZ_DIC where sz_name like '%" + TxtJXSX.Text + "%'";
        //    connstring.Open();
        //    OracleDataAdapter ODA = new OracleDataAdapter(strSQL, connstring);
        //    DataSet ds = new DataSet();
        //    ODA.Fill(ds);
        //    string obj = "";
        //    if (ds.Tables[0].Rows.Count > 0)
        //    {
        //        obj = ds.Tables[0].Rows[0][0].ToString();
        //    }
        //    if (!string.IsNullOrEmpty(obj))
        //    {
        //        TxtJXSID.Text = obj.ToString();
        //    }
        //}

        protected void BtnHid_Click(object sender, EventArgs e)
        {
            if (JiaoYan())
            {
                JiSuan();

            }


        }

        protected void upload_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(TxtPhone.Value))
            {
                Common.MessageBox.Show(this, "养户联系电话未填写！");
                return;
            }

            string fullFileName = this.FileUpload1.FileName;
            //Common.MessageBox.Show(this,this.FileUpload1.FileName);
            string fileName = fullFileName.Substring(fullFileName.LastIndexOf("\\") + 1);
            this.FileUpload1.PostedFile.SaveAs(Server.MapPath("~/UpLoad") + "\\" + fileName);

            //string fileName = FileUpload1.FileName;
            string tempExt = System.IO.Path.GetExtension(fileName);  // 获取后缀
            //string ImgPath = FileUpload1.PostedFile.FileName;
            //string ImgName = ImgPath.Substring(ImgPath.LastIndexOf("\\") + 1);
            //int FileLen = this.FileUpload1.PostedFile.ContentLength;
            HttpPostedFile hp = FileUpload1.PostedFile;//创建访问客户端上传文件的对象 
            Stream sr = null;
            try
            {
                sr = hp.InputStream;//创建数据流对象 
            }
            catch (Exception error)
            {

                Common.MessageBox.Show(this, error.Message);
            }

            //  Stream sr = null;//创建数据流对象 
            string savePath = Server.MapPath("~/upload/image/");
            if (string.IsNullOrEmpty(fileName))
            {
                Common.MessageBox.Show(this, "未找到图片！");
                return;
            }
            else
            {
                fileName = TxtPhone.Value + tempExt;
            }
            FileOperatpr(fileName, savePath);
            try
            {

                // FileUpload1.SaveAs(savePath + fileName);
                //  UploadFiles up = new UploadFiles("../upload/image/", FileUpload1, null, fileName, tempExt);
                //创建缩略图
                UploadFiles UpLoadPic = new UploadFiles("../upload/image", FileUpload1, null, fileName, sr);
                try
                {
                    UpLoadPic.SaveThumbnailsPic(200, 200);
                }
                catch (Exception err)
                {
                    Common.MessageBox.Show(this, err.Message);
                }


            }
            catch (Exception ex)
            {
                Common.MessageBox.Show(ex.ToString(), 1);
            }


            TxtImageID.Text = fileName;
            img.Src = "../upload/image/" + fileName;
            Common.MessageBox.Show(this, "上传成功");
        }

        private void FileOperatpr(string fileName, string savePath)
        {
            if (!Directory.Exists(savePath))
            {
                Directory.CreateDirectory(savePath);
            }
            if (File.Exists(savePath + fileName))
            {
                File.Delete(savePath + fileName);
            }
        }


    }
}