using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PrivateSystem;
using HttpTool;
using QiyuesuoSDK;


namespace WebApp.Handler
{
    /// <summary>
    /// sbtht 的摘要说明
    /// </summary>
    public class sbtht : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            HttpRequest request = System.Web.HttpContext.Current.Request;
            Uri qstr = request.UrlReferrer;
            long contractID = long.Parse(System.Web.HttpContext.Current.Request.QueryString["contractID"]);
            string rturl="";
            context.Response.ContentType = "text/plain";
            string token = "Z4DLiOAUS4";
            string secret = "7DrT0qtmURPHR0HLrBnhIPsLZ9kx11";
            string url = "http://192.168.10.165:9082";
           //  long contractID = 2472607756301455386;
            PrivateSystem.Impl.ContractServiceImpl contractService = new PrivateSystem.Impl.ContractServiceImpl(new PrivateSystem.Bean.SDKClient(token, secret, url));
            try
            {
                rturl = contractService.View(contractID);
               //System.Diagnostics.Process.Start(url);
            }
            catch (Exception error)
            {

                context.Response.Write(error.Message);
                return;
            }
           
            context.Response.Write(rturl);
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