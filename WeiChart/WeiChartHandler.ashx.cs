using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace WebApp.WeiChart
{
    /// <summary>
    /// WeiChartHandler 的摘要说明
    /// </summary>
    public class WeiChartHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            //校验get方法
            if (context.Request.HttpMethod.ToLower().Equals("get"))
            {
                //校验URL
                ValiDateURL();
            }
        }

        private void ValiDateURL()
        {
            /*signature  微信加密签名，signature结合了开发者填写的token参数和请求中的timestamp参数、nonce参数。  
            timestamp  时间戳  
            nonce  随机数  
            echostr  随机字符串  
            */
            //接收请求过来的参数
            HttpContext context = HttpContext.Current;
            string signature = context.Request["signature"];
            string timestamp = context.Request["timestamp"];
            string nonce = context.Request["nonce"];
            string echostr = context.Request["echostr"];

            /*加密/校验流程如下：
            1. 将token、timestamp、nonce三个参数进行字典序排序
            2. 将三个参数字符串拼接成一个字符串进行sha1加密
            3. 开发者获得加密后的字符串可与signature对比，标识该请求来源于微信
            */

            //排序
            string token = ConfigurationSettings.AppSettings["token"];
            string[] temp1 = { token, timestamp, nonce };
            Array.Sort(temp1);

            //SHA1加密
            //将数组进行字符格式化
            string temp2 = string.Join("", temp1);
            string temp3 = FormsAuthentication.HashPasswordForStoringInConfigFile(temp2, "SHA1");
            if (temp3.ToLower().Equals(signature))
            {
                context.Response.Write(echostr);
            }

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