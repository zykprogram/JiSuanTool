<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Farmprofit.aspx.cs" Inherits="WebApp.yf.Farmprofit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width,target-densitydpi=high-dpi, user-scalable=no" />
    <title></title>
    <style>
        td {
            border: 1px solid #757575;
            font-size: 20px;
            text-align: center;
        }

        input {
            text-align: center;
            width: 90%;
            height: 98%;
            font-size: 20px;
            margin-bottom: 0px;
        }

        text {
            text-align: center;
            width: 90%;
            height: 30px;
        }

        table {
            width: 98%;
            border: 1px solid #757575;
            background-color: ActiveBorder;
        }

        .auto-style1 {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td colspan="6" style="font-size: 25px; color: aqua; background-color: red"><strong>猪场利润预测</strong></td>

            </tr>
            <tr>
                <td colspan="6" style="text-align: left; background-color: blue"><strong>一、基础数据</strong></td>

            </tr>
            <tr>
                <td><strong>非生产天数</strong></td>
                <td>
                    <input id="fscts" type="tel" value="30" onfocus="javascript:document.getElementById('fscts').value = ''" /></td>
                <td><strong>哺乳天数</strong></td>
                <td>
                    <input id="brts" type="tel" value="23" onfocus="javascript:document.getElementById('brts').value = ''" /></td>
                <td><strong>胎产健仔</strong></td>
                <td>
                    <input id="tcjz" type="tel" value="10" onfocus="javascript:document.getElementById('tcjz').value = ''" /></td>
            </tr>
            <tr>
                <td><b>基础母猪</b></td>
                <td>
                    <input id="jcmz" type="tel" value="1200" onfocus="javascript:document.getElementById('jcmz').value = ''" /></td>
                <td><strong>分娩胎数</strong></td>
                <td>
                    <input id="fmts" type="tel" value="2.19"  readonly="true"/></td>
                <td><strong>猪价</strong></td>
                <td>
                    <input id="zj" type="tel" value="18" onfocus="javascript:document.getElementById('zj').value = ''" /></td>
            </tr>
               <tr>
                <td><strong>其他费用</strong></td>
                <td colspan="5">
                    <input id="qtfy" type="tel" value="300" onfocus="javascript:document.getElementById('qtfy').value = ''" /></td>
               
            <tr>
                <td colspan="6" style="text-align: left; background-color: blue"><strong>二、数据指标</strong></td>

            </tr>
            <tr>
                <td class="auto-style1">项目</td>
                <td><b>哺乳仔猪</b></td>
                <td><b>保育猪</b></td>
                <td><b>小猪</b></td>
                <td><b>中猪</b></td>
                <td><b>大猪</b></td>
            </tr>
            <tr>
                <td><b>重量(kg)</b></td>
                <td>
                    <input id="zl1" type="tel" value="6" onfocus="javascript:document.getElementById('zl1').value = ''" /></td>
                <td>
                    <input id="zl2" type="tel" value="25" onfocus="javascript:document.getElementById('zl2').value = ''" /></td>
                <td>
                    <input id="zl3" type="tel" value="60" onfocus="javascript:document.getElementById('zl3').value = ''" /></td>
                <td>
                    <input id="zl4" type="tel" value="90" onfocus="javascript:document.getElementById('zl4').value = ''" /></td>
                <td>
                    <input id="zl5" type="tel" value="115" onfocus="javascript:document.getElementById('zl5').value = ''" /></td>
            </tr>
            <tr>
                <td><b>阶段价值</b></td>
                <td>
                    <input id="jdjz1" type="tel" value="222" onfocus="javascript:document.getElementById('jdjz1').value = ''" /></td>
                <td>
                    <input id="jdjz2" onfocus="javascript:document.getElementById('jdjz2').value = ''" type="tel" value="378" /></td>
                <td>
                    <input id="jdjz3" onfocus="javascript:document.getElementById('jdjz3').value = ''" type="tel" value="664" /></td>
                <td>
                    <input id="jdjz4" onfocus="javascript:document.getElementById('jdjz4').value = ''" type="tel" value="943" /></td>
                <td>
                    <input id="jdjz5" onfocus="javascript:document.getElementById('jdjz5').value = ''" type="tel" value="1199" /></td>
            </tr>
            <tr>
                <td><b>饲料单价</b></td>
                <td>
                    <input id="sldj1" onfocus="javascript:document.getElementById('sldj1').value = ''" type="tel" value="7500" /></td>
                <td>
                    <input id="sldj2" onfocus="javascript:document.getElementById('sldj2').value = ''" type="tel" value="4500" /></td>
                <td>
                    <input id="sldj3" onfocus="javascript:document.getElementById('sldj3').value = ''" type="tel" value="3800" /></td>
                <td>
                    <input id="sldj4" onfocus="javascript:document.getElementById('sldj4').value = ''" type="tel" value="3300" /></td>
                <td>
                    <input id="sldj5" onfocus="javascript:document.getElementById('sldj5').value = ''" type="tel" value="3250" /></td>
            </tr>
            <tr>
                <td><b>料肉比</b></td>
                <td>
                    <input id="lrb1" onfocus="javascript:document.getElementById('lrb1').value = ''" type="tel" value="0.2" /></td>
                <td>
                    <input id="lrb2" onfocus="javascript:document.getElementById('lrb2').value = ''" type="tel" value="1.65" /></td>
                <td>
                    <input id="lrb3" onfocus="javascript:document.getElementById('lrb3').value = ''" type="tel" value="2" /></td>
                <td>
                    <input id="lrb4" onfocus="javascript:document.getElementById('lrb4').value = ''" type="tel" value="2.6" /></td>
                <td>
                    <input id="lrb5" onfocus="javascript:document.getElementById('lrb5').value = ''" type="tel" value="3" /></td>
            </tr>
            <tr>
                <td><b>天数</b></td>
                <td>
                    <input id="ts1" onfocus="javascript:document.getElementById('ts1').value = ''" type="tel" value="23" /></td>
                <td>
                    <input id="ts2" onfocus="javascript:document.getElementById('ts2').value = ''" type="tel" value="37" /></td>
                <td>
                    <input id="ts3" onfocus="javascript:document.getElementById('ts3').value = ''" type="tel" value="53" /></td>
                <td>
                    <input id="ts4" onfocus="javascript:document.getElementById('ts4').value = ''" type="tel" value="37" /></td>
                <td>
                    <input id="ts5" onfocus="javascript:document.getElementById('ts5').value = ''" type="tel" value="25" /></td>
            </tr>
            <tr>
                <td><b>死亡率</b></td>
                <td>
                    <input id="swl1" onfocus="javascript:document.getElementById('swl1').value = ''" type="tel" value="0.03" /></td>
                <td>
                    <input id="swl2" onfocus="javascript:document.getElementById('swl2').value = ''" type="tel" value="0.02" /></td>
                <td>
                    <input id="swl3" onfocus="javascript:document.getElementById('swl3').value = ''" type="tel" value="0.01" /></td>
                <td>
                    <input id="swl4" onfocus="javascript:document.getElementById('swl4').value = ''" type="tel" value="0.01" /></td>
                <td>
                    <input id="swl5" onfocus="javascript:document.getElementById('swl5').value = ''" type="tel" value="0" /></td>
            </tr>
            <tr>
                <td><b>饲料浪费</b></td>
                <td>
                    <input id="sllf1" onfocus="javascript:document.getElementById('sllf1').value = ''" type="tel" value="0" /></td>
                <td>
                    <input id="sllf2" onfocus="javascript:document.getElementById('sllf2').value = ''" type="tel" value="0.05" /></td>
                <td>
                    <input id="sllf3" onfocus="javascript:document.getElementById('sllf3').value = ''" type="tel" value="0.05" /></td>
                <td>
                    <input id="sllf4" onfocus="javascript:document.getElementById('sllf4').value = ''" type="tel" value="0.05" /></td>
                <td>
                    <input id="sllf5" onfocus="javascript:document.getElementById('sllf5').value = ''" type="tel" value="0.05" /></td>
            </tr>
            <tr>
                <td><b>日增重</b></td>
                <td>
                    <input id="rzz1" onfocus="javascript:document.getElementById('rzz1').value = ''" type="tel" value="204" /></td>
                <td>
                    <input id="rzz2" onfocus="javascript:document.getElementById('rzz2').value = ''" type="tel" value="514" /></td>
                <td>
                    <input id="rzz3" onfocus="javascript:document.getElementById('rzz3').value = ''" type="tel" value="660" /></td>
                <td>
                    <input id="rzz4" onfocus="javascript:document.getElementById('rzz4').value = ''" type="tel" value="811" /></td>
                <td>
                    <input id="rzz5" onfocus="javascript:document.getElementById('rzz5').value = ''" type="tel" value="1000" /></td>
            </tr>
            <tr>
                <td><b>阶段饲料成本</b></td>
                <td>
                    <input id="jdslcb1" onfocus="javascript:document.getElementById('jdslcb1').value = ''" type="tel" value="7" /></td>
                <td>
                    <input id="jdslcb2" onfocus="javascript:document.getElementById('jdslcb2').value = ''" type="tel" value="148" /></td>
                <td>
                    <input id="jdslcb3" onfocus="javascript:document.getElementById('jdslcb3').value = ''" type="tel" value="279" /></td>
                <td>
                    <input id="jdslcb4" onfocus="javascript:document.getElementById('jdslcb4').value = ''" type="tel" value="270" /></td>
                <td>
                    <input id="jdslcb5" onfocus="javascript:document.getElementById('jdslcb5').value = ''" type="tel" value="256" /></td>
            </tr>
            <tr>
                <td><b>阶段死亡损失<br />
                    (万元）</b></td>
                <td>
                    <input id="jdswss1" onfocus="javascript:document.getElementById('jdswss1').value = ''" type="tel" value="17.5" /></td>
                <td>
                    <input id="jdswss2" onfocus="javascript:document.getElementById('jdswss2').value = ''" type="tel" value="19.22" /></td>
                <td>
                    <input id="jdswss3" onfocus="javascript:document.getElementById('jdswss3').value = ''" type="tel" value="16.55" /></td>
                <td>
                    <input id="jdswss4" onfocus="javascript:document.getElementById('jdswss4').value = ''" type="tel" value="23.29" /></td>
                <td>
                    <input id="jdswss5" onfocus="javascript:document.getElementById('jdswss5').value = ''" type="tel" value="0" /></td>
            </tr>
            <tr>
                <td colspan="6" style="text-align: left; background-color: blue"><strong>三、结果预测栏</strong></td>

            </tr>
             <tr>
                <td><strong>年上市<br />
                    商品猪数</strong></td>
                <td colspan="5">
                    <input id="nssspzs" onfocus="javascript:document.getElementById('nssspzs').value = ''" type="tel" value="20.36" /></td>
               
            </tr>
        </table>
    </form>
</body>
</html>
