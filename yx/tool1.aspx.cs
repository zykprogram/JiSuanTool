using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.yx
{
    public partial class tool1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hidzsq.Value = litzsq.Text;
            DBCommon.DbHelperOra.LoginLog("", Request.ServerVariables.Get("REMOTE_ADDR"), "双胞胎62040+5PK某农小工具");
        }

        protected void btnSave1_Click(object sender, EventArgs e)
        {
            double rznfcb;//乳猪奶粉成本
            double rzcb;//乳猪成本
            double zizcb;//仔猪成本
            double zhongzcb;//中猪成本
            double zongcb;//全程总成本

            double rznfcb0;//乳猪胖成本
            double rzcb0;//951成本
            double zizcb0;//952成本
            double zhongzcb0;//953成本
            double zongcb0;//全程总成本

            double mjsq;//每斤省钱

            /*计算双胞胎“62040+5”模式的饲料成本*/
            rznfcb = Convert.ToDouble(txtrznfbs.Value) * Convert.ToDouble(txtrznfbj.Value); /*乳猪奶粉*/
            txtrznfcb.Value = rznfcb.ToString("0");
            rzcb = Convert.ToDouble(txtrzbs.Value) * Convert.ToDouble(txtrzbj.Value);/*乳猪料*/
            txtrzcb.Value = rzcb.ToString("0");
            zizcb = Convert.ToDouble(txtzizbs.Value) * Convert.ToDouble(txtzizbj.Value);/*仔猪料*/
            txtzizcb.Value = zizcb.ToString("0");
            zhongzcb = Convert.ToDouble(txtzhongzbs.Value) * Convert.ToDouble(txtzhongzbj.Value);/*中猪料*/
            txtzhongzcb.Value = zhongzcb.ToString("0");
            zongcb = Convert.ToDouble(txtrznfcb.Value) + Convert.ToDouble(txtrzcb.Value) + Convert.ToDouble(txtzizcb.Value) + Convert.ToDouble(txtzhongzcb.Value);/*饲料成本*/
            txtslcb.Value = zongcb.ToString("0");


            /*计算大某农“4133”模式的饲料成本*/
            rznfcb0 = Convert.ToDouble(txtrznfbs0.Value) * Convert.ToDouble(txtrznfbj0.Value);
            txtrznfcb0.Value = rznfcb0.ToString("0");

            rzcb0 = Convert.ToDouble(txtrzbs0.Value) * Convert.ToDouble(txtrzbj0.Value);
            txtrzcb0.Value = rzcb0.ToString("0");

            zizcb0 = Convert.ToDouble(txtzizbs0.Value) * Convert.ToDouble(txtzizbj0.Value);
            txtzizcb0.Value = zizcb0.ToString("0");

            zhongzcb0 = Convert.ToDouble(txtzhongzbs0.Value) * Convert.ToDouble(txtzhongzbj0.Value);
            txtzhongzcb0.Value = zhongzcb0.ToString("0");

            zongcb0 = Convert.ToDouble(txtrznfcb0.Value) + Convert.ToDouble(txtrzcb0.Value) + Convert.ToDouble(txtzizcb0.Value) + Convert.ToDouble(txtzhongzcb0.Value);
            txtslcb0.Value = zongcb0.ToString("0");
            /*62040阶段料肉比*/
            litjdlrb.Text = ((Convert.ToDouble(txtrznfbs.Value) * 20 + Convert.ToDouble(txtrzbs.Value) * 40 + Convert.ToDouble(txtzizbs.Value) * 40) / 410).ToString("0.00");
            /*62040+5全阶段料肉比*/
            litqclrb.Text = ((Convert.ToDouble(txtrznfbs.Value) * 20 + Convert.ToDouble(txtrzbs.Value) * 40 + Convert.ToDouble(txtzizbs.Value) * 40 + Convert.ToDouble(txtzhongzbs.Value) * 40) / 1160).ToString("0.00");
            /*413阶段*/
            litjdlrb0.Text = ((Convert.ToDouble(txtrznfbs0.Value) * 20 + Convert.ToDouble(txtrzbs0.Value) * 40 + Convert.ToDouble(txtzizbs0.Value) * 40) / 855).ToString("0.00");
            /*4133全阶段*/
            litqclrb0.Text = ((Convert.ToDouble(txtrznfbs0.Value) * 20 + Convert.ToDouble(txtrzbs0.Value) * 40 + Convert.ToDouble(txtzizbs0.Value) * 40 + Convert.ToDouble(txtzhongzbs0.Value) * 40) / 1205).ToString("0.00");
            /*62040阶段价肉比*/
            litjdjrb.Text = ((rznfcb + rzcb + zizcb) / 820).ToString("0.00");
            /*62040+5全程价肉比*/
            litqcjrb.Text = ((rznfcb + rzcb + zizcb + zhongzcb) / 2320).ToString("0.00");
            /*413阶段价肉比*/
            litjdjrb0.Text = ((rznfcb0 + rzcb0 + zizcb0) / 1710).ToString("0.00");
            /*4133全程价肉比*/
            litqcjrb0.Text = ((rznfcb0 + rzcb0 + zizcb0 + zhongzcb0) / 2410).ToString("0.00");

            /*每长一斤猪省钱多少*/
            mjsq = Convert.ToDouble(litqcjrb0.Text) - Convert.ToDouble(litqcjrb.Text);
            // mjsq = zongcb0 / 2370 - zongcb / 2320;
            // litmjsq.Text = mjsq.ToString("0.00");
            /*每长230斤猪省钱多少*/
            litzsq.Text = (mjsq * 230 * 10).ToString("0");
            litzjs.Text = (Convert.ToDouble(litgm.Value) * mjsq * 230).ToString("0");
        }

        protected void btnReset1_Click(object sender, EventArgs e)
        {
            Response.Redirect("tool1.aspx");
        }
    }
}