using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Newtonsoft.Json;
using ICSharpCode.SharpZipLib.GZip;
using Oracle.ManagedDataAccess.Client;
using System.Text;
using System.IO;
using WebApp.H5.SBTDING.YLBG;
using ICSharpCode.SharpZipLib.Zip;
using ICSharpCode.SharpZipLib.Checksums;
//using System.Data.OracleClient;

namespace WebApp.Handler
{
    /// <summary>
    /// YLHandler 的摘要说明
    /// </summary>
    public class YLHandler : IHttpHandler
    {
        OracleConnection conn = new OracleConnection(ConfigurationManager.ConnectionStrings["ConnStrNewWb_erp"].ConnectionString);
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "json/plain";
            string method = context.Request.Params["method"].ToString();
            string json = "";
            OracleCommand OCMDQT;
            OracleDataAdapter ODA;
            OracleDataReader read;
            DataSet ds;
            string str = "";
            switch (method)
            {
                case "GetCustInfo"://获取客户列表
                    conn.Open();
                    str = "select ID,NAME from app_main_ylcustbase";
                    ODA = new OracleDataAdapter(str, conn);
                    ds = new DataSet();
                    ODA.Fill(ds);
                    json = JsonConvert.SerializeObject(ds.Tables[0]);
                    conn.Close();
                    break;
                case "GetBaseInfo"://获取基础数据的基础信息
                    conn.Open();
                    str = "select NAME,SUPPLIER,AREA,DEPTH,ZENGYJ,TOUEJ,T_RENT,ELETRIC,LABORCOST from app_main_ylcustbase where id ='" + context.Request.Params["id"].ToString() + "'";
                    ODA = new OracleDataAdapter(str, conn);
                    ds = new DataSet();
                    ODA.Fill(ds);
                    json = JsonConvert.SerializeObject(ds.Tables[0]);
                    conn.Close();
                    break;
                case "GetBaseImg"://获取基础数据的图片信息
                    conn.Open();
                    str = "select photo from app_main_ylcustbase where id ='" + context.Request.Params["id"].ToString() + "'";
                    OCMDQT = new OracleCommand(str, conn);
                    read = OCMDQT.ExecuteReader();
                    if (read.Read())
                    {
                        json = json = "{\"result\" : \"" + DecompressString((byte[])read["Photo"]) + "\" }";
                        break;
                    }
                    conn.Close();
                    break;
                case "AddBase"://添加基础数据
                    conn.Open();
                    str = string.Format(
                        "insert into app_main_ylcustbase(id,name,supplier,area,depth,zengyj,t_rent,eletric,laborcost,touej,photo,ts,user_id) Values('{0}','{1}','{2}',{3},{4},{5},{6},{7},{8},{9},:temp,to_char(sysdate,'yyyy-mm-dd'),'{10}')",
                        Guid.NewGuid().ToString(),
                        context.Request.Params["Name"].ToString(),
                        context.Request.Params["Supplier"].ToString(),
                        context.Request.Params["Area"].ToString(),
                        context.Request.Params["Depth"].ToString(),
                        context.Request.Params["Zengyj"].ToString(),
                        context.Request.Params["T_rent"].ToString(),
                        context.Request.Params["Eletric"].ToString(),
                        context.Request.Params["Laborcost"].ToString(),
                        context.Request.Params["Touej"].ToString(),
                        context.Request.Params["UserId"].ToString());
                    OCMDQT = new OracleCommand(str, conn);
                    //图片二进制后压缩传递给sql语句
                    OracleParameter a_param = OCMDQT.Parameters.Add(":temp", OracleDbType.Blob);
                    a_param.Direction = ParameterDirection.Input;
                    a_param.Value = CompressString(context.Request.Params["Photo"].ToString());
                    OCMDQT.ExecuteNonQuery();
                    conn.Close();
                    json = "{\"result\" : \"保存成功\" }";
                    break;
                case "EditBase"://修改基础数据
                    conn.Open();
                    str = string.Format(
                        "update app_main_ylcustbase set name = '{0}',supplier = '{1}',area = {2},depth = {3},zengyj = {4},t_rent = {5},eletric = {6},laborcost = {7},touej = {8},user_id='{9}',photo = :temp where id = '{10}'",
                        context.Request.Params["Name"].ToString(),
                        context.Request.Params["Supplier"].ToString(),
                        context.Request.Params["Area"].ToString(),
                        context.Request.Params["Depth"].ToString(),
                        context.Request.Params["Zengyj"].ToString(),
                        context.Request.Params["T_rent"].ToString(),
                        context.Request.Params["Eletric"].ToString(),
                        context.Request.Params["Laborcost"].ToString(),
                        context.Request.Params["Touej"].ToString(),
                        context.Request.Params["UserId"].ToString(),
                        context.Request.Params["id"].ToString());
                    OCMDQT = new OracleCommand(str, conn);
                    OracleParameter e_param = OCMDQT.Parameters.Add(":temp", OracleDbType.Blob);
                    e_param.Direction = ParameterDirection.Input;
                    e_param.Value = CompressString(context.Request.Params["Photo"].ToString());
                    OCMDQT.ExecuteNonQuery();
                    conn.Close();
                    json = "{\"result\" : \"修改成功\" }";
                    break;
                case "GetDetailInfo"://获取日填报数据（期初数据内容）
                    conn.Open();
                    string type = context.Request.Params["type"].ToString();
                    str = "select CY1_Standard,CY1_Weight,CY1_Price,CY2_Standard,CY2_Weight,CY2_Price,CY3_Standard,CY3_Weight,CY3_Price,HL_Standard,HL_Weight,HL_Price,BL_Standard,BL_Weight,BL_Price,LI_Standard,LI_Weight,LI_Price,BY_Standard,BY_Weight,BY_Price,LY_Standard,LY_Weight,LY_Price,LFY_Standard,LFY_Weight,LFY_Price,HY_Standard,HY_Weight,HY_Price,ZY_Standard,ZY_Weight,ZY_Price from app_main_ylcustdetail where BaseId ='" + context.Request.Params["custid"].ToString() + "' and Type = '" + type + "'";
                    if (type == "1")
                    {
                        str += " and dbilldate = '" + context.Request.Params["time"].ToString() + "'";
                    }
                    ODA = new OracleDataAdapter(str, conn);
                    ds = new DataSet();
                    ODA.Fill(ds);
                    json = JsonConvert.SerializeObject(ds.Tables[0]);
                    conn.Close();
                    break;
                case "SubmitDetailInfo"://上交日填报数据（期初数据）
                    conn.Open();
                    str = "Delete from app_main_ylcustdetail where baseid = :custid and type = :type and dbilldate = :time";
                    OCMDQT = new OracleCommand(str, conn);
                    OCMDQT.Parameters.Add(":custid", OracleDbType.Varchar2,
                        context.Request.Params["custid"].ToString(), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":type", OracleDbType.Varchar2,
                        context.Request.Params["type"].ToString(), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":time", OracleDbType.Varchar2,
                        context.Request.Params["time"].ToString(), ParameterDirection.Input);
                    OCMDQT.ExecuteNonQuery();
                    str = "insert into app_main_ylcustdetail(id,baseid,type,cy1_standard,cy1_weight,cy1_price,cy2_standard,cy2_weight,cy2_price,cy3_standard,cy3_weight,cy3_price,hl_standard,hl_weight,hl_price,bl_standard,bl_weight,bl_price,li_standard,li_weight,li_price,by_standard,by_weight,by_price,ly_standard,ly_weight,ly_price,lfy_standard,lfy_weight,lfy_price,hy_standard,hy_weight,hy_price,zy_standard,zy_weight,zy_price,user_id,dbilldate,ts) values(:id,:baseid,:type,:cy1_standard,:cy1_weight,:cy1_price,:cy2_standard,:cy2_weight,:cy2_price,:cy3_standard,:cy3_weight,:cy3_price,:hl_standard,:hl_weight,:hl_price,:bl_standard,:bl_weight,:bl_price,:li_standard,:li_weight,:li_price,:by_standard,:by_weight,:by_price,:ly_standard,:ly_weight,:ly_price,:lfy_standard,:lfy_weight,:lfy_price,:hy_standard,:hy_weight,:hy_price,:zy_standard,:zy_weight,:zy_price,:userid,:dbilldate,to_char(sysdate,'yyyy-mm-dd'))";
                    OCMDQT = new OracleCommand(str, conn);
                    OCMDQT.Parameters.Add(":id", OracleDbType.Varchar2, Guid.NewGuid().ToString(), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":baseid", OracleDbType.Varchar2, context.Request.Params["custid"].ToString(), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":type", OracleDbType.Varchar2, context.Request.Params["type"].ToString(), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":cy1_standard", OracleDbType.Double, Double.Parse(context.Request.Params["cy1_standard"] == null ? "0" : context.Request.Params["cy1_standard"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":cy1_weight", OracleDbType.Double, Double.Parse(context.Request.Params["cy1_weight"] == null ? "0" : context.Request.Params["cy1_weight"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":cy1_price", OracleDbType.Double, Double.Parse(context.Request.Params["cy1_price"] == null ? "0" : context.Request.Params["cy1_price"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":cy2_standard", OracleDbType.Double, Double.Parse(context.Request.Params["cy2_standard"] == null ? "0" : context.Request.Params["cy2_standard"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":cy2_weight", OracleDbType.Double, Double.Parse(context.Request.Params["cy2_weight"] == null ? "0" : context.Request.Params["cy2_weight"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":cy2_price", OracleDbType.Double, Double.Parse(context.Request.Params["cy2_price"] == null ? "0" : context.Request.Params["cy2_price"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":cy3_standard", OracleDbType.Double, Double.Parse(context.Request.Params["cy3_standard"] == null ? "0" : context.Request.Params["cy3_standard"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":cy3_weight", OracleDbType.Double, Double.Parse(context.Request.Params["cy1_standard"] == null ? "0" : context.Request.Params["cy1_standard"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":cy3_price", OracleDbType.Double, Double.Parse(context.Request.Params["cy3_price"] == null ? "0" : context.Request.Params["cy3_price"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":hl_standard", OracleDbType.Double, Double.Parse(context.Request.Params["hl_standard"] == null ? "0" : context.Request.Params["hl_standard"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":hl_weight", OracleDbType.Double, Double.Parse(context.Request.Params["hl_weight"] == null ? "0" : context.Request.Params["hl_weight"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":hl_price", OracleDbType.Double, Double.Parse(context.Request.Params["hl_price"] == null ? "0" : context.Request.Params["hl_price"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":bl_standard", OracleDbType.Double, Double.Parse(context.Request.Params["bl_standard"] == null ? "0" : context.Request.Params["bl_standard"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":bl_weight", OracleDbType.Double, Double.Parse(context.Request.Params["bl_weight"] == null ? "0" : context.Request.Params["bl_weight"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":bl_price", OracleDbType.Double, Double.Parse(context.Request.Params["bl_price"] == null ? "0" : context.Request.Params["bl_price"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":li_standard", OracleDbType.Double, Double.Parse(context.Request.Params["li_standard"] == null ? "0" : context.Request.Params["li_standard"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":li_weight", OracleDbType.Double, Double.Parse(context.Request.Params["li_weight"] == null ? "0" : context.Request.Params["li_weight"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":li_price", OracleDbType.Double, Double.Parse(context.Request.Params["li_price"] == null ? "0" : context.Request.Params["li_price"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":by_standard", OracleDbType.Double, Double.Parse(context.Request.Params["by_standard"] == null ? "0" : context.Request.Params["by_standard"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":by_weight", OracleDbType.Double, Double.Parse(context.Request.Params["by_weight"] == null ? "0" : context.Request.Params["by_weight"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":by_price", OracleDbType.Double, Double.Parse(context.Request.Params["by_price"] == null ? "0" : context.Request.Params["by_price"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":ly_standard", OracleDbType.Double, Double.Parse(context.Request.Params["ly_standard"] == null ? "0" : context.Request.Params["ly_standard"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":ly_weight", OracleDbType.Double, Double.Parse(context.Request.Params["ly_weight"] == null ? "0" : context.Request.Params["ly_weight"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":ly_price", OracleDbType.Double, Double.Parse(context.Request.Params["ly_price"] == null ? "0" : context.Request.Params["ly_price"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":lfy_standard", OracleDbType.Double, Double.Parse(context.Request.Params["lfy_standard"] == null ? "0" : context.Request.Params["lfy_standard"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":lfy_weight", OracleDbType.Double, Double.Parse(context.Request.Params["lfy_weight"] == null ? "0" : context.Request.Params["lfy_weight"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":lfy_price", OracleDbType.Double, Double.Parse(context.Request.Params["lfy_price"] == null ? "0" : context.Request.Params["lfy_price"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":hy_standard", OracleDbType.Double, Double.Parse(context.Request.Params["hy_standard"] == null ? "0" : context.Request.Params["hy_standard"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":hy_weight", OracleDbType.Double, Double.Parse(context.Request.Params["hy_weight"] == null ? "0" : context.Request.Params["hy_weight"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":hy_price", OracleDbType.Double, Double.Parse(context.Request.Params["hy_price"] == null ? "0" : context.Request.Params["hy_price"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":zy_standard", OracleDbType.Double, Double.Parse(context.Request.Params["zy_standard"] == null ? "0" : context.Request.Params["zy_standard"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":zy_weight", OracleDbType.Double, Double.Parse(context.Request.Params["zy_weight"] == null ? "0" : context.Request.Params["zy_weight"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":zy_price", OracleDbType.Double, Double.Parse(context.Request.Params["zy_price"] == null ? "0" : context.Request.Params["zy_price"].ToString()), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":userid", OracleDbType.Varchar2, context.Request.Params["userid"].ToString(), ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":dbilldate", OracleDbType.Varchar2, context.Request.Params["time"].ToString(), ParameterDirection.Input);
                    OCMDQT.ExecuteNonQuery();
                    conn.Close();
                    json = "{\"result\" : \"提交成功\" }";
                    break;
                case "GetDetail_SampleBaseInfo"://获取打样基础信息
                    conn.Open();
                    str = "select syts,tlcs,dyws,dyzz_number,dyzz_price,dyjz_number,dyjz_price,phtl_number,phtl_price,cstl_number,cstl_price,phrt_number,phrt_price,csrt_number,csrt_price,ygct_number,ygct_price,tbsy_number,tbsy_price,dbfy_number,dbfy_price from APP_MAIN_YLCUSTDETAIL_SAMPLE where baseid ='" + context.Request.Params["custid"].ToString() + "' and dbilldate = '"+ context.Request.Params["time"].ToString() + "'";
                    ODA = new OracleDataAdapter(str, conn);
                    ds = new DataSet();
                    ODA.Fill(ds);
                    json = JsonConvert.SerializeObject(ds.Tables[0]);
                    conn.Close();
                    break;
                case "GetDetail_SampleImg"://获取打样图片信息
                    conn.Open();
                    str = "select photo from APP_MAIN_YLCUSTDETAIL_SAMPLE where baseid ='" + context.Request.Params["custid"].ToString() + "' and dbilldate = '" + context.Request.Params["time"].ToString() + "'";
                    OCMDQT = new OracleCommand(str, conn);
                    read = OCMDQT.ExecuteReader();
                    if (read.Read())
                    {
                        json = json = "{\"result\" : \"" + DecompressString((byte[])read["Photo"]) + "\" }";
                        break;
                    }
                    conn.Close();
                    break;
                case "SubmitDetail_Sample"://提交打样数据
                    conn.Open();
                    str = "Delete from APP_MAIN_YLCUSTDETAIL_SAMPLE where baseid ='" + context.Request.Params["custid"].ToString() + "' and dbilldate = '" + context.Request.Params["time"].ToString() + "'";
                    OCMDQT = new OracleCommand(str,conn);
                    OCMDQT.ExecuteNonQuery();
                    str = "insert into APP_MAIN_YLCUSTDETAIL_SAMPLE(id,baseid,dbilldate,user_id,syts,tlcs,dyws,dyzz_number,dyzz_price,dyjz_number,dyjz_price,phtl_number,phtl_price,cstl_number,cstl_price,phrt_number,phrt_price,csrt_number,csrt_price,ygct_number,ygct_price,tbsy_number,tbsy_price,dbfy_number,dbfy_price,photo,ts) values(:id,:baseid,:dbilldate,:user_id,:syts,:tlcs,:dyws,:dyzz_number,:dyzz_price,:dyjz_number,:dyjz_price,:phtl_number,:phtl_price,:cstl_number,:cstl_price,:phrt_number,:phrt_price,:csrt_number,:csrt_price,:ygct_number,:ygct_price,:tbsy_number,:tbsy_price,:dbfy_number,:dbfy_price,:photo,to_char(sysdate,'yyyy-mm-dd'))";
                    OCMDQT = new OracleCommand(str,conn);
                    OCMDQT.Parameters.Add(":id", OracleDbType.Varchar2, Guid.NewGuid().ToString(),
                        ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":baseid", OracleDbType.Varchar2, context.Request.Params["custid"].ToString(),
                        ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":dbilldate", OracleDbType.Varchar2, context.Request.Params["time"].ToString(),
                        ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":user_id", OracleDbType.Varchar2, context.Request.Params["userid"].ToString(),
                        ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":syts", OracleDbType.Double,double.Parse(context.Request.Params["syts"] ==null?"0": context.Request.Params["syts"].ToString()),
                        ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":tlcs", OracleDbType.Double, double.Parse(context.Request.Params["tlcs"] == null ? "0" : context.Request.Params["tlcs"].ToString()),
                        ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":dyws", OracleDbType.Double, double.Parse(context.Request.Params["dyws"] == null ? "0" : context.Request.Params["dyws"].ToString()),
                        ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":dyzz_number", OracleDbType.Double, double.Parse(context.Request.Params["dyzz_number"] == null ? "0" : context.Request.Params["dyzz_number"].ToString()),
                        ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":dyzz_price", OracleDbType.Double, double.Parse(context.Request.Params["dyzz_price"] == null ? "0" : context.Request.Params["dyzz_price"].ToString()),
                        ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":dyjz_number", OracleDbType.Double, double.Parse(context.Request.Params["dyjz_number"] == null ? "0" : context.Request.Params["dyjz_number"].ToString()),
                        ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":dyjz_price", OracleDbType.Double, double.Parse(context.Request.Params["dyjz_price"] == null ? "0" : context.Request.Params["dyjz_price"].ToString()),
                        ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":phtl_number", OracleDbType.Double, double.Parse(context.Request.Params["phtl_number"] == null ? "0" : context.Request.Params["phtl_number"].ToString()),
                        ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":phtl_price", OracleDbType.Double, double.Parse(context.Request.Params["phtl_price"] == null ? "0" : context.Request.Params["phtl_price"].ToString()),
                        ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":cstl_number", OracleDbType.Double, double.Parse(context.Request.Params["cstl_number"] == null ? "0" : context.Request.Params["cstl_number"].ToString()),
                        ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":cstl_price", OracleDbType.Double, double.Parse(context.Request.Params["cstl_price"] == null ? "0" : context.Request.Params["cstl_price"].ToString()),
                        ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":phrt_number", OracleDbType.Double, double.Parse(context.Request.Params["phrt_number"] == null ? "0" : context.Request.Params["phrt_number"].ToString()),
                        ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":phrt_price", OracleDbType.Double, double.Parse(context.Request.Params["phrt_price"] == null ? "0" : context.Request.Params["phrt_price"].ToString()),
                        ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":csrt_number", OracleDbType.Double, double.Parse(context.Request.Params["csrt_number"] == null ? "0" : context.Request.Params["csrt_number"].ToString()),
                        ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":csrt_price", OracleDbType.Double, double.Parse(context.Request.Params["csrt_price"] == null ? "0" : context.Request.Params["csrt_price"].ToString()),
                        ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":ygct_number", OracleDbType.Double, double.Parse(context.Request.Params["ygct_number"] == null ? "0" : context.Request.Params["ygct_number"].ToString()),
                        ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":ygct_price", OracleDbType.Double, double.Parse(context.Request.Params["ygct_price"] == null ? "0" : context.Request.Params["ygct_price"].ToString()),
                        ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":tbsy_number", OracleDbType.Double, double.Parse(context.Request.Params["tbsy_number"] == null ? "0" : context.Request.Params["tbsy_number"].ToString()),
                        ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":tbsy_price", OracleDbType.Double, double.Parse(context.Request.Params["tbsy_price"] == null ? "0" : context.Request.Params["tbsy_price"].ToString()),
                        ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":dbfy_number", OracleDbType.Double, double.Parse(context.Request.Params["dbfy_number"] == null ? "0" : context.Request.Params["dbfy_number"].ToString()),
                        ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":dbfy_price", OracleDbType.Double, double.Parse(context.Request.Params["dbfy_price"] == null ? "0" : context.Request.Params["dbfy_price"].ToString()),
                        ParameterDirection.Input);
                    OCMDQT.Parameters.Add(":photo", OracleDbType.Blob, CompressString(context.Request.Params["photo"].ToString()),
                        ParameterDirection.Input);
                    OCMDQT.ExecuteNonQuery();
                    json = "{\"result\" : \"提交成功\" }";
                    conn.Close();
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

        /// <summary>
        /// 用压缩算法压缩一个字符串
        /// </summary>
        /// <param name="input">输入的字符串.</param>
        /// <returns>返回字节</returns>
        public byte[] CompressString(string input)
        {
            return CompressBytes(Encoding.UTF8.GetBytes(input));
        }
        /// <summary>
        /// Decompress a byte stream of a string that was formerly 
        /// compressed with the CompressString() routine with the ZIP algorithm.
        /// </summary>
        /// <param name="input">The buffer that contains the compressed
        /// stream with the string.</param>
        /// <returns>Returns the decompressed string.</returns>
        public string DecompressString(
            byte[] input)
        {
            return Encoding.UTF8.GetString(DecompressBytes(input));
        }

        /// <summary>
        /// 用压缩算法压缩字节
        /// </summary>
        /// <param name="input">需要压缩的字节</param>
        /// <returns>返回压缩的字节</returns>
        public byte[] CompressBytes(byte[] input)
        {
            using (MemoryStream buf = new MemoryStream())
            using (ZipOutputStream zip = new ZipOutputStream(buf))
            {
                Crc32 crc = new Crc32();
                zip.SetLevel(9);    // 0..9.

                ZipEntry entry = new ZipEntry(string.Empty);
                entry.DateTime = DateTime.Now;
                entry.Size = input.Length;

                crc.Reset();
                crc.Update(input);

                entry.Crc = crc.Value;

                zip.PutNextEntry(entry);

                zip.Write(input, 0, input.Length);
                zip.Finish();

                // --

                byte[] c = new byte[buf.Length];
                buf.Seek(0, SeekOrigin.Begin);
                buf.Read(c, 0, c.Length);

                // --

                zip.Close();

                return c;
            }
        }

        /// <summary>
        /// Decompress a byte stream that was formerly compressed
        /// with the CompressBytes() routine with the ZIP algorithm.
        /// </summary>
        /// <param name="input">The buffer that contains the compressed
        /// stream with the bytes.</param>
        /// <returns>Returns the decompressed bytes.</returns>
        public byte[] DecompressBytes(
            byte[] input)
        {
            using (MemoryStream mem = new MemoryStream(input))
            using (ZipInputStream stm = new ZipInputStream(mem))
            using (MemoryStream mem2 = new MemoryStream())
            {
                ZipEntry entry = stm.GetNextEntry();
                if (entry != null)
                {
                    byte[] data = new byte[4096];

                    while (true)
                    {
                        int size = stm.Read(data, 0, data.Length);
                        if (size > 0)
                        {
                            mem2.Write(data, 0, size);
                        }
                        else
                        {
                            break;
                        }
                    }
                }

                using (BinaryReader r = new BinaryReader(mem2))
                {
                    byte[] c = new byte[mem2.Length];
                    mem2.Seek(0, SeekOrigin.Begin);
                    r.Read(c, 0, (int)mem2.Length);

                    return c;
                }
            }
        }
    }
}