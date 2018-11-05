<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeedContrast.aspx.cs" Inherits="WebApp.yx.FeedContrast.FeedContrast" %>

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
            font-size:20px;
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
        }
    </style>
    <script>
        function changeValue() {

        }
        function back() {
            //document.getElementById("Div2").style.display = "none";
            //document.getElementById("Div1").style.display = "block";
        }
        function Cal() {
            //document.getElementById("Div2").style.display = "block";
            //document.getElementById("Div1").style.display = "none";
            //计算自配料吨价
            document.getElementById("TelXZZPL").value = jisuan(0.71, 0.22, 0.03, 0.04, 0, document.getElementById("InPriceYHLXZ").value);
            document.getElementById("TelZZZPL").value = jisuan(0.67, 0.25, 0.04, 0.04, 0, document.getElementById("InPriceYHLZZ").value);
            document.getElementById("TelDZZPL").value = jisuan(0.62, 0.27, 0.07, 0.04, 0.01, document.getElementById("InPriceYHLDZ").value);
            //计算饲料吨价
            document.getElementById("TelXZSL").value = document.getElementById("InPriceXZ").value * 25;
            document.getElementById("TelZZSL").value = document.getElementById("InPriceZZ").value * 25;
            document.getElementById("TelDZSL").value = document.getElementById("InPriceDZ").value * 25;

            //计算吨差价
            document.getElementById("TelXZDCJ").value = -(document.getElementById("TelXZSL").value - document.getElementById("TelXZZPL").value).toFixed(1);
            document.getElementById("TelZZDCJ").value = -(document.getElementById("TelZZSL").value - document.getElementById("TelZZZPL").value).toFixed(1);
            document.getElementById("TelDZDCJ").value = -(document.getElementById("TelDZSL").value - document.getElementById("TelDZZPL").value).toFixed(1);

            //计算包差价
            document.getElementById("TelXZBCJ").value = (document.getElementById("TelXZDCJ").value / 25).toFixed(1);
            document.getElementById("TelZZBCJ").value = (document.getElementById("TelZZDCJ").value / 25).toFixed(1);
            document.getElementById("TelDZBCJ").value = (document.getElementById("TelDZDCJ").value / 25).toFixed(1);

            //计算节约成本
            document.getElementById("TelXZCB").value = document.getElementById("TelXZBCJ").value;
            document.getElementById("TelZZCB").value = document.getElementById("TelZZBCJ").value * 2;
            document.getElementById("TelDZCB").value = (document.getElementById("TelDZBCJ").value * 3).toFixed(1);

            //总成本
            document.getElementById("InputCB").value = (parseFloat(document.getElementById("TelXZCB").value) + parseFloat(document.getElementById("TelZZCB").value) + parseFloat(document.getElementById("TelDZCB").value)).toFixed(1).toString() + "元";
        }
        function jisuan(i, j, m, n, p, q) {
            return parseFloat(document.getElementById("InPriceYM").value) * i + parseFloat(document.getElementById("InPriceDP").value, 1) * j + parseFloat(document.getElementById("InPriceFP").value) * m + q * n + parseFloat(document.getElementById("InPriceDY").value) * p + parseFloat(document.getElementById("InPriceJGF").value);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <div id="Div1">
            <table>
                <tr>
                    <td colspan="3" ><span style="font-size: 25px;color:blue"><strong>自配料—全价料价格指数表</strong></span></td>
                </tr>

                <tr>
                    <td style="width:30%"><strong>费用项目</strong></td>
                    <td style="width:35%"><strong>价格（元/吨）</strong></td>
                    <td style="width:35%"><strong>占比说明</strong></td>

                </tr>
                <tr>
                    <td><strong>玉米</strong></td>
                    <td>
                        <input id="InPriceYM" type="tel" value="2600" onblur="changeValue()" onfocus="javascript:document.getElementById('InPriceYM').value = ''" /></td>

                    <td>
                        <ul>
                            <li>小猪：71%</li>
                            <li>中猪：67%</li>
                            <li>大猪：62%</li>
                        </ul>
                    </td>

                </tr>
                <tr>
                    <td><strong>豆粕</strong></td>
                    <td>
                        <input id="InPriceDP" type="tel" value="2650" onblur="changeValue()" onfocus="javascript:document.getElementById('InPriceDP').value = ''" /></td>

                    <td>

                        <ul>
                            <li>小猪：22%</li>
                            <li>中猪：25%</li>
                            <li>大猪：27%</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td><strong>麸皮</strong></td>
                    <td>
                        <input id="InPriceFP" type="tel" value="1310" onblur="changeValue()" onfocus="javascript:document.getElementById('InPriceFP').value = ''" /></td>

                    <td>
                        <ul>
                            <li>小猪：3%</li>
                            <li>中猪：4%</li>
                            <li>大猪：7%</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td><strong>豆油</strong></td>
                    <td>
                        <input id="InPriceDY" type="tel" value="6000" onfocus="javascript:document.getElementById('InPriceDY').value = ''" /></td>

                    <td>
                        <ul>
                            <li>大猪：1%</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td><strong>小猪料预混料</strong></td>

                    <td>
                        <input id="InPriceYHLXZ" type="tel" value="6000" onfocus="javascript:document.getElementById('InPriceYHLXZ').value = ''" /></td>

                    <td rowspan="3">
                        <ul>
                            <li>小猪：4%</li>
                            <li>中猪：4%</li>
                            <li>大猪：4%</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td><strong>中猪料预混料</strong></td>

                    <td>
                        <input id="InPriceYHLZZ" type="tel" value="6000" onfocus="javascript:document.getElementById('InPriceYHLZZ').value = ''" /></td>
                </tr>
                <tr>
                    <td><strong>大猪料预混料</strong></td>

                    <td>
                        <input id="InPriceYHLDZ" type="tel" value="6000" onfocus="javascript:document.getElementById('InPriceYHLDZ').value = ''" /></td>
                </tr>

                <tr>
                    <td><strong>加工费</strong></td>

                    <td colspan="2">
                        <input id="InPriceJGF" readonly="true" type="tel" value="130" /></td>
                </tr>
                <tr>
                    <td><strong>小猪料包价</strong></td>

                    <td colspan="2">
                        <input id="InPriceXZ" type="tel" value="109.4" onfocus="javascript:document.getElementById('InPriceXZ').value = ''" /></td>
                </tr>
                <tr>
                    <td><strong>中猪料包价</strong></td>

                    <td colspan="2">
                        <input id="InPriceZZ" type="tel" value="103.2" onfocus="javascript:document.getElementById('InPriceZZ').value = ''" /></td>
                </tr>
                <tr>
                    <td><strong>大猪料包价</strong></td>

                    <td colspan="2">
                        <input id="InPriceDZ" type="tel" value="103.6" onfocus="javascript:document.getElementById('InPriceDZ').value = ''" /></td>
                </tr>
            </table>
        </div>
        <div id="Div2">
            <table>
                <tr>
                    <td colspan="7"><span style="font-size: 30px; color: red"><strong>结果一览表</strong></span></td>
                </tr>
                <tr>
                    <td style="width: 15%"><b>品种</b></td>
                    <td style="width: 15%"><b>自配料<br />
                        (元/吨)</b></td>
                    <td style="width: 15%"><b>饲料<br />
                        (元/吨)</b></td>
                    <td style="width: 15%"><b>吨价差<br />
                        (元)</b></td>
                    <td style="width: 15%"><strong>包价差<br />
                        (元)</strong></td>
                    <td style="width: 10%"><b>头猪<br />
                        用量</b></td>
                    <td style="width: 15%"><b>节省<br />
                        (元)</b></td>
                </tr>
                <tr>
                    <td>小猪料</td>
                    <td>
                        <input id="TelXZZPL" type="tel" value="" readonly="true" /></td>
                    <td>
                        <input id="TelXZSL" type="tel" value="" readonly="true" /></td>
                    <td>
                        <input id="TelXZDCJ" type="tel" value="" readonly="true" /></td>
                    <td>
                        <input id="TelXZBCJ" type="tel" value="" readonly="true" /></td>
                    <td>1</td>
                    <td>
                        <input id="TelXZCB" type="tel" value="" readonly="true" /></td>
                </tr>
                <tr>
                    <td>中猪料</td>
                    <td>
                        <input id="TelZZZPL" type="tel" value="" readonly="true" /></td>
                    <td>
                        <input id="TelZZSL" type="tel" value="" readonly="true" /></td>
                    <td>
                        <input id="TelZZDCJ" type="tel" value="" readonly="true" /></td>
                    <td class="auto-style2">
                        <input id="TelZZBCJ" type="tel" value="" readonly="true" /></td>
                    <td>2</td>
                    <td>
                        <input id="TelZZCB" type="tel" value="" readonly="true" /></td>
                </tr>
                <tr>
                    <td>大猪料</td>
                    <td>
                        <input id="TelDZZPL" type="tel" value="" readonly="true" /></td>
                    <td>
                        <input id="TelDZSL" type="tel" value="" readonly="true" /></td>
                    <td>
                        <input id="TelDZDCJ" type="tel" value="" readonly="true" /></td>
                    <td>
                        <input id="TelDZBCJ" type="tel" value="" readonly="true" /></td>
                    <td>3</td>
                    <td>
                        <input id="TelDZCB" type="tel" value="" readonly="true" /></td>
                </tr>
                <tr>
                    <td colspan="4"><span style="color: blue; font-size: 25px"><strong>单头猪可结余成本</strong></span></td>

                    <td colspan="3">
                        <input type="text" id="InputCB" style="color: red; font-size: 25px" /></td>
                </tr>
            </table>
        </div>
        <div style="text-align: center">
            <input id="Button1" type="reset" value="重 置" style="width: 25%" />
            <input id="Button2" type="button" value="计 算" onclick="Cal()" style="width: 25%" />
        </div>
    </form>
</body>
</html>
