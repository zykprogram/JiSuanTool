<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PigCost.aspx.cs" Inherits="WebApp.yx.PigCost.PigCost" %>

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
            font-size: 25px;
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
        tr {
        height:5%;
        }
     
    </style>
    <script>
        function Caculate() {
            //赋值
            document.getElementById("TxtSJ5").value = document.getElementById("TxtSJ1").value;
            document.getElementById("TxtSJ2").value = document.getElementById("TxtSJ1").value;
            document.getElementById("TxtSJ3").value = document.getElementById("TxtSJ1").value;
            document.getElementById("TxtSJ4").value = document.getElementById("TxtSJ1").value;


            document.getElementById("TxtTs2").value = document.getElementById("TxtTs1").value;
            document.getElementById("TxtTs3").value = document.getElementById("TxtTs1").value;
            document.getElementById("TxtTs4").value = document.getElementById("TxtTs1").value;
            document.getElementById("TxtTs5").value = document.getElementById("TxtTs1").value;


            //存活头数
            var CHTS1 = (document.getElementById("TxtCHL1").value * document.getElementById("TxtTs1").value);
            var CHTS2 = (document.getElementById("TxtCHL2").value * document.getElementById("TxtTs2").value);
            var CHTS3 = (document.getElementById("TxtCHL3").value * document.getElementById("TxtTs3").value);
            var CHTS4 = (document.getElementById("TxtCHL4").value * document.getElementById("TxtTs4").value);
            var CHTS5 = (document.getElementById("TxtCHL5").value * document.getElementById("TxtTs5").value);
            //计算上市B级猪头数与净重

            //头数
            var TS1 = (CHTS1 * (1 - 0.99));
            var TS2 = (CHTS2 * (1 - 0.99));
            var TS3 = (CHTS3 * (1 - 0.99));
            var TS4 = (CHTS4 * (1 - 0.99));
            var TS5 = (CHTS5 * (1 - 0.99));
            //净重
            var JZ1 = (TS1 * 140);
            var JZ2 = (TS2 * 140);
            var JZ3 = (TS3 * 140);
            var JZ4 = (TS4 * 140);
            var JZ5 = (TS5 * 140);

            //计算上市正品猪头数与净重
            //头数
            var ZPTS1 = (CHTS1 * 0.99);
            var ZPTS2 = (CHTS2 * 0.99);
            var ZPTS3 = (CHTS3 * 0.99);
            var ZPTS4 = (CHTS4 * 0.99);
            var ZPTS5 = (CHTS5 * 0.99);
            // 净重
            var ZPJZ1 = (ZPTS1 * document.getElementById("TxtJZ1").value);
            var ZPJZ2 = (ZPTS2 * document.getElementById("TxtJZ2").value);
            var ZPJZ3 = (ZPTS3 * document.getElementById("TxtJZ3").value);
            var ZPJZ4 = (ZPTS4 * document.getElementById("TxtJZ4").value);
            var ZPJZ5 = (ZPTS5 * document.getElementById("TxtJZ5").value);
            //汇总B级猪与正品猪净重
            SumJZ1 = JZ1 + ZPJZ1;
            SumJZ2 = JZ2 + ZPJZ2;
            SumJZ3 = JZ3 + ZPJZ3;
            SumJZ4 = JZ4 + ZPJZ4;
            SumJZ5 = JZ5 + ZPJZ5;
            //实际均重
            SJJZ1 = SumJZ1 / CHTS1
            SJJZ2 = SumJZ2 / CHTS2
            SJJZ3 = SumJZ3 / CHTS3
            SJJZ4 = SumJZ4 / CHTS4
            SJJZ5 = SumJZ5 / CHTS5

            //计算上市重量
            document.getElementById("LitZL1").innerHTML = (document.getElementById("TxtTs1").value * SJJZ1 * document.getElementById("TxtCHL1").value).toFixed(0);
            document.getElementById("LitZL2").innerHTML = (document.getElementById("TxtTs2").value * SJJZ2 * document.getElementById("TxtCHL2").value).toFixed(0);
            document.getElementById("LitZL3").innerHTML = (document.getElementById("TxtTs3").value * SJJZ3 * document.getElementById("TxtCHL3").value).toFixed(0);
            document.getElementById("LitZL4").innerHTML = (document.getElementById("TxtTs4").value * SJJZ4 * document.getElementById("TxtCHL4").value).toFixed(0);
            document.getElementById("LitZL5").innerHTML = (document.getElementById("TxtTs5").value * SJJZ5 * document.getElementById("TxtCHL5").value).toFixed(0);

            var DZLBS1;
            var DZLBS2;
            var DZLBS3;
            var DZLBS4;
            var DZLBS5;
            //用料包数
            if (document.getElementById("TxtJZ1").value < 220) {
                SLBS1 = document.getElementById("TxtTs1").value * 5.55;
                DZLBS1 = document.getElementById("TxtTs1").value * 2;
            }
            else {
                DZLBS1 = document.getElementById("TxtTs1").value * 2.3 + (document.getElementById("TxtJZ1").value - 220) * document.getElementById("TxtTs1").value * 3.5 / 80;
                SLBS1 = document.getElementById("TxtTs1").value * 3.55 + DZLBS1;
            }
            if (document.getElementById("TxtJZ2").value < 220) {
                SLBS2 = document.getElementById("TxtTs2").value * 5.55;
                DZLBS2 = document.getElementById("TxtTs2").value * 2;
            }
            else {
                DZLBS2 = document.getElementById("TxtTs2").value * 2.3 + (document.getElementById("TxtJZ2").value - 220) * document.getElementById("TxtTs2").value * 3.5 / 80;
                SLBS2 = document.getElementById("TxtTs2").value * 3.55 + DZLBS2;
            }
            if (document.getElementById("TxtJZ3").value < 220) {
                SLBS3 = document.getElementById("TxtTs3").value * 5.55;
                DZLBS3 = document.getElementById("TxtTs3").value * 2;
            }
            else {
                DZLBS3 = document.getElementById("TxtTs3").value * 2.3 + (document.getElementById("TxtJZ3").value - 220) * document.getElementById("TxtTs3").value * 3.5 / 80;
                SLBS3 = document.getElementById("TxtTs3").value * 3.55 + DZLBS3;
            }
            if (document.getElementById("TxtJZ4").value < 220) {
                SLBS4 = document.getElementById("TxtTs4").value * 5.55;
                DZLBS4 = document.getElementById("TxtTs4").value * 2;
            }
            else {
                DZLBS4 = document.getElementById("TxtTs4").value * 2.3 + (document.getElementById("TxtJZ4").value - 220) * document.getElementById("TxtTs4").value * 3.5 / 80;
                SLBS4 = document.getElementById("TxtTs4").value * 3.55 + DZLBS4;
            }
            if (document.getElementById("TxtJZ5").value < 220) {
                SLBS5 = document.getElementById("TxtTs5").value * 5.55;
                DZLBS5 = document.getElementById("TxtTs5").value * 2;
            }
            else {
                DZLBS5 = document.getElementById("TxtTs5").value * 2.3 + (document.getElementById("TxtJZ5").value - 220) * document.getElementById("TxtTs5").value * 3.5 / 80;
                SLBS5 = document.getElementById("TxtTs5").value * 3.55 + DZLBS5;
            }

            //计算料肉比
            document.getElementById("LitLRB1").innerHTML = (SLBS1 * 80 / (SumJZ1 - document.getElementById("TxtTs1").value * 13)).toFixed(2);
            document.getElementById("LitLRB2").innerHTML = (SLBS2 * 80 / (SumJZ2 - document.getElementById("TxtTs2").value * 13)).toFixed(2);
            document.getElementById("LitLRB3").innerHTML = (SLBS3 * 80 / (SumJZ3 - document.getElementById("TxtTs3").value * 13)).toFixed(2);
            document.getElementById("LitLRB4").innerHTML = (SLBS4 * 80 / (SumJZ4 - document.getElementById("TxtTs4").value * 13)).toFixed(2);
            document.getElementById("LitLRB5").innerHTML = (SLBS5 * 80 / (SumJZ5 - document.getElementById("TxtTs5").value * 13)).toFixed(2);



            //猪苗成本
            CBA1 = document.getElementById("TxtTs1").value * 380;
            CBA2 = document.getElementById("TxtTs2").value * 380;
            CBA3 = document.getElementById("TxtTs3").value * 380;
            CBA4 = document.getElementById("TxtTs4").value * 380;
            CBA5 = document.getElementById("TxtTs5").value * 380;
            //药物成本
            CBB1 = (document.getElementById("TxtTs1").value * 33 / 1.1).toFixed(0);
            CBB2 = (document.getElementById("TxtTs2").value * 33 / 1.1).toFixed(0);
            CBB3 = (document.getElementById("TxtTs3").value * 33 / 1.1).toFixed(0);
            CBB4 = (document.getElementById("TxtTs4").value * 33 / 1.1).toFixed(0);
            CBB5 = (document.getElementById("TxtTs5").value * 33 / 1.1).toFixed(0);
            //饲料成本
            CBC1 = document.getElementById("TxtTs1").value * (0.05 * 270 + 0.5 * 155.9 + 1 * 139.5 + 2 * 122.4) + DZLBS1 * 118.5;
            CBC2 = document.getElementById("TxtTs2").value * (0.05 * 270 + 0.5 * 155.9 + 1 * 139.5 + 2 * 122.4) + DZLBS2 * 118.5;
            CBC3 = document.getElementById("TxtTs3").value * (0.05 * 270 + 0.5 * 155.9 + 1 * 139.5 + 2 * 122.4) + DZLBS3 * 118.5;
            CBC4 = document.getElementById("TxtTs4").value * (0.05 * 270 + 0.5 * 155.9 + 1 * 139.5 + 2 * 122.4) + DZLBS4 * 118.5;
            CBC5 = document.getElementById("TxtTs5").value * (0.05 * 270 + 0.5 * 155.9 + 1 * 139.5 + 2 * 122.4) + DZLBS5 * 118.5;

            //养户利润
            CB1 = CBA1 * 1 + CBB1 * 1 + CBC1 * 1 + CHTS1 * 160 * 1;
            CB2 = CBA2 * 1 + CBB2 * 1 + CBC2 * 1 + CHTS2 * 160 * 1;
            CB3 = CBA3 * 1 + CBB3 * 1 + CBC3 * 1 + CHTS3 * 160 * 1;
            CB4 = CBA4 * 1 + CBB4 * 1 + CBC4 * 1 + CHTS4 * 160 * 1;
            CB5 = CBA5 * 1 + CBB5 * 1 + CBC5 * 1 + CHTS5 * 160 * 1;
            //单斤成本
            document.getElementById("LitDJCB1").innerHTML = (CB1 / SumJZ1).toFixed(2);
            document.getElementById("LitDJCB2").innerHTML = (CB2 / SumJZ2).toFixed(2);
            document.getElementById("LitDJCB3").innerHTML = (CB3 / SumJZ3).toFixed(2);
            document.getElementById("LitDJCB4").innerHTML = (CB4 / SumJZ4).toFixed(2);
            document.getElementById("LitDJCB5").innerHTML = (CB5 / SumJZ5).toFixed(2);
            //单斤毛利（元/斤）
            document.getElementById("LitDJML1").innerHTML = (parseFloat(document.getElementById("TxtSJ1").value) - parseFloat(document.getElementById("LitDJCB1").innerHTML)).toFixed(2);
            document.getElementById("LitDJML2").innerHTML = (parseFloat(document.getElementById("TxtSJ2").value) - parseFloat(document.getElementById("LitDJCB2").innerHTML)).toFixed(2);
            document.getElementById("LitDJML3").innerHTML = (parseFloat(document.getElementById("TxtSJ3").value) - parseFloat(document.getElementById("LitDJCB3").innerHTML)).toFixed(2);
            document.getElementById("LitDJML4").innerHTML = (parseFloat(document.getElementById("TxtSJ4").value) - parseFloat(document.getElementById("LitDJCB4").innerHTML)).toFixed(2);
            document.getElementById("LitDJML5").innerHTML = (parseFloat(document.getElementById("TxtSJ5").value) - parseFloat(document.getElementById("LitDJCB5").innerHTML)).toFixed(2);
            //单头毛利
            document.getElementById("LitDTML1").innerHTML = (SJJZ1 * document.getElementById("LitDJML1").innerHTML).toFixed(2);
            document.getElementById("LitDTML2").innerHTML = (SJJZ2 * document.getElementById("LitDJML2").innerHTML).toFixed(2);
            document.getElementById("LitDTML3").innerHTML = (SJJZ3 * document.getElementById("LitDJML3").innerHTML).toFixed(2);
            document.getElementById("LitDTML4").innerHTML = (SJJZ4 * document.getElementById("LitDJML4").innerHTML).toFixed(2);
            document.getElementById("LitDTML5").innerHTML = (SJJZ5 * document.getElementById("LitDJML5").innerHTML).toFixed(2);
            //上市数利润
            document.getElementById("LitLR1").innerHTML = (document.getElementById("TxtTs1").value * document.getElementById("LitDTML1").innerHTML * document.getElementById("TxtCHL1").value / 10000).toFixed(2);
            document.getElementById("LitLR2").innerHTML = (document.getElementById("TxtTs2").value * document.getElementById("LitDTML2").innerHTML * document.getElementById("TxtCHL2").value / 10000).toFixed(2);
            document.getElementById("LitLR3").innerHTML = (document.getElementById("TxtTs3").value * document.getElementById("LitDTML3").innerHTML * document.getElementById("TxtCHL3").value / 10000).toFixed(2);
            document.getElementById("LitLR4").innerHTML = (document.getElementById("TxtTs4").value * document.getElementById("LitDTML4").innerHTML * document.getElementById("TxtCHL4").value / 10000).toFixed(2);
            document.getElementById("LitLR5").innerHTML = (document.getElementById("TxtTs5").value * document.getElementById("LitDTML5").innerHTML * document.getElementById("TxtCHL5").value / 10000).toFixed(2);
           
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td colspan="5" style="text-align: center; color: blue; font-size: 30px"><strong>肉猪成本与利润测算</strong></td>
                </tr>
                <tr style="background-color: #3399FF">
                    <td style="width: 20%"><b>项目</b></td>
                    <td style="width: 16%"><b>情况一</b></td>
                    <td style="width: 16%"><b>情况二</b></td>
                    <td style="width: 16%"><b>情况三</b></td>
                    <td style="width: 16%" ><b>情况四</b></td>
                    <td style="width: 16%;display:none"><b>情况五</b></td>
                </tr>
                <tr style="font-size: 30px">
                    <td style="background-color: yellow"><b>上市头数</b></td>
                    <td colspan="4">
                        <input id="TxtTs1" type="tel" style="font-size: 30px" value="500" onfocus="javascript:document.getElementById('TxtTs1').value = ''" /></td>
                    <td style="display: none">
                        <input id="TxtTs2" type="tel" value="500" onfocus="javascript:document.getElementById('TxtTs2').value = ''" /></td>
                    <td style="display: none">
                        <input id="TxtTs3" type="tel" value="500" onfocus="javascript:document.getElementById('TxtTs3').value = ''" /></td>
                    <td style="display: none">
                        <input id="TxtTs4" type="tel" value="500" onfocus="javascript:document.getElementById('TxtTs4').value = ''" /></td>
                    <td style="display: none">
                        <input id="TxtTs5" type="tel" value="500" onfocus="javascript:document.getElementById('TxtTs5').value = ''" /></td>
                </tr>
                <tr style="display: none;">
                    <td><b>成活率</b></td>
                    <td>
                        <input id="TxtCHL1" type="tel" value="0.95" readonly="true" /></td>
                    <td>
                        <input id="TxtCHL2" type="tel" value="0.95" readonly="true" /></td>
                    <td>
                        <input id="TxtCHL3" type="tel" value="0.95" readonly="true" /></td>
                    <td class="auto-style1">
                        <input id="TxtCHL4" type="tel" value="0.95" readonly="true" /></td>
                    <td>
                        <input id="TxtCHL5" type="tel" value="0.95" readonly="true" /></td>
                </tr>

                <tr>
                    <td style="background-color: yellow"><b>销售单价</b></td>
                    <td colspan="4">
                        <input id="TxtSJ1" type="tel" value="7.5" style="font-size: 30px" onfocus="javascript:document.getElementById('TxtSJ1').value = ''" /></td>
                    <td style="display: none">
                        <input id="TxtSJ2" type="tel" value="7.5" onfocus="javascript:document.getElementById('TxtSJ2').value = ''" /></td>
                    <td style="display: none">
                        <input id="TxtSJ3" type="tel" value="7.5" onfocus="javascript:document.getElementById('TxtSJ3').value = ''" /></td>
                    <td style="display: none">
                        <input id="TxtSJ4" type="tel" value="7.5" onfocus="javascript:document.getElementById('TxtSJ4').value = ''" /></td>
                    <td style="display: none">
                        <input id="TxtSJ5" type="tel" value="7.5" onfocus="javascript:document.getElementById('TxtSJ5').value = ''" /></td>
                </tr>
                <tr>
                    <td style="background-color: yellow"><b>上市均重</b></td>
                    <td>
                        <input id="TxtJZ1" type="tel" style="font-size: 30px" value="210" onfocus="javascript:document.getElementById('TxtJZ1').value = ''" /></td>
                    <td>
                        <input id="TxtJZ2" type="tel" style="font-size: 30px" value="220" onfocus="javascript:document.getElementById('TxtJZ2').value = ''" /></td>
                    <td>
                        <input id="TxtJZ3" type="tel" style="font-size: 30px" value="230" onfocus="javascript:document.getElementById('TxtJZ3').value = ''" /></td>
                    <td class="auto-style1">
                        <input id="TxtJZ4" type="tel" style="font-size: 30px" value="240" onfocus="javascript:document.getElementById('TxtJZ4').value = ''" /></td>
                    <td style="display:none">
                        <input id="TxtJZ5" type="tel" style="font-size: 30px" value="250" onfocus="javascript:document.getElementById('TxtJZ5').value = ''" /></td>
                </tr>
                <tr>
                    <td><b>上市重量</b></td>
                    <td>
                        <asp:Label ID="LitZL1" runat="server" Text="99418"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="LitZL2" runat="server" Text="104120"></asp:Label></td>
                    <td>
                        <asp:Label ID="LitZL3" runat="server" Text="108823"></asp:Label></td>
                    <td class="auto-style1">
                        <asp:Label ID="LitZL4" runat="server" Text="113525"></asp:Label></td>
                    <td style="display:none">
                        <asp:Label ID="LitZL5" runat="server" Text="118228"></asp:Label></td>
                </tr>
                <tr>
                    <td><b>料肉比</b></td>
                    <td>
                        <asp:Label ID="LitLRB1" runat="server" Text="2.39"></asp:Label></td>
                    <td>
                        <asp:Label ID="LitLRB2" runat="server" Text="2.40"></asp:Label></td>
                    <td>
                        <asp:Label ID="LitLRB3" runat="server" Text="2.46"></asp:Label></td>
                    <td class="auto-style1">
                        <asp:Label ID="LitLRB4" runat="server" Text="2.51"></asp:Label></td>
                    <td style="display:none">
                        <asp:Label ID="LitLRB5" runat="server" Text="2.56"></asp:Label></td>
                </tr>
                <tr>
                    <td><b>单斤成本</b></td>
                    <td>
                        <asp:Label ID="LitDJCB1" runat="server" Text="6.41"></asp:Label></td>
                    <td>
                        <asp:Label ID="LitDJCB2" runat="server" Text="6.29"></asp:Label></td>
                    <td>
                        <asp:Label ID="LitDJCB3" runat="server" Text="6.26"></asp:Label></td>
                    <td class="auto-style1">
                        <asp:Label ID="LitDJCB4" runat="server" Text="6.23"></asp:Label></td>
                    <td style="display:none">
                        <asp:Label ID="LitDJCB5" runat="server" Text="6.20"></asp:Label></td>
                </tr>
                <tr>
                    <td><b>单斤毛利</b></td>
                    <td>
                        <asp:Label ID="LitDJML1" runat="server" Text="1.09 "></asp:Label></td>
                    <td>
                        <asp:Label ID="LitDJML2" runat="server" Text="1.21"></asp:Label></td>
                    <td>
                        <asp:Label ID="LitDJML3" runat="server" Text="1.24"></asp:Label></td>
                    <td class="auto-style1">
                        <asp:Label ID="LitDJML4" runat="server" Text="1.27"></asp:Label></td>
                    <td style="display:none">
                        <asp:Label ID="LitDJML5" runat="server" Text="1.30"></asp:Label></td>
                </tr>
                <tr>
                    <td><b>单头毛利</b></td>
                    <td>
                        <asp:Label ID="LitDTML1" runat="server" Text="228.14"></asp:Label></td>
                    <td>
                        <asp:Label ID="LitDTML2" runat="server" Text="265.23"></asp:Label></td>
                    <td>
                        <asp:Label ID="LitDTML3" runat="server" Text="284.08"></asp:Label></td>
                    <td class="auto-style1">
                        <asp:Label ID="LitDTML4" runat="server" Text="303.53"></asp:Label></td>
                    <td style="display:none">
                        <asp:Label ID="LitDTML5" runat="server" Text="323.57"></asp:Label></td>
                </tr>
                <tr>
                    <td class="auto-style1"><strong>上市利润</strong><span class="auto-style3"><strong><br />
                        (万元)</strong></span></td>
                    <td style="color: red;">
                        <b>
                            <asp:Label ID="LitLR1" runat="server" Text="10.84"></asp:Label></b></td>
                    <td style="color: red">
                        <b>
                            <asp:Label ID="LitLR2" runat="server" Text="12.60"></asp:Label></b></td>
                    <td style="color: red;">
                        <b>
                            <asp:Label ID="LitLR3" runat="server" Text="13.49"></asp:Label></b></td>
                    <td style="color: red;">
                        <b>
                            <asp:Label ID="LitLR4" runat="server" Text="14.42"></asp:Label></b></td>
                    <td style="color: red;display:none">
                        <b>
                            <asp:Label ID="LitLR5" runat="server" Text="15.37"></asp:Label></b></td>
                </tr>
                <tr><td colspan="5">说明：领苗头数、销售单价、上市均重可修改变量；</td></tr>

            </table>

            <div style="text-align: center">
                <input id="Button1" type="reset" value="重 置" style="width: 25%" />&nbsp;&nbsp;&nbsp;&nbsp;
            <input id="Button2" type="button" value="计 算" onclick="Caculate()" style="width: 25%" />
            </div>
            
        </div>
    </form>
</body>
</html>
