using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;

namespace WebApp.DINGTALKSERVER
{
    /// <summary>
    /// tuling 的摘要说明
    /// </summary>
    public class tuling : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string ans = context.Request.Params["ans"];
            string res = string.Empty;
            if (!string.IsNullOrEmpty(ans))
            {
                WebRequest wq = WebRequest.Create("http://www.tuling123.com/openapi/api?key=1f4cc32abefa4a03b500f05e598af919&info=" + ans);
                WebResponse wp = wq.GetResponse();
                res = new StreamReader(wp.GetResponseStream()).ReadToEnd();
            }
            context.Response.ContentType = "text/plain";
            context.Response.Write(res);  

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