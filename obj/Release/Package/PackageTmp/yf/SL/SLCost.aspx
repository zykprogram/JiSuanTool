<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SLCost.aspx.cs" Inherits="WebApp.yf.SL.SLCost" %>

<!DOCTYPE html>
<html >
<head runat="server">
    <meta name="viewport" content="width=device-width,target-densitydpi=high-dpi, user-scalable=no" />
    <title></title>
    <style>
        td {
            border: 1px solid #757575;
            font-size: 25px;
            text-align: center;
            width: 30%;
        }

        tr.locktop {
            position: relative;
            top: expression((this.offsetParent.scrollTop>this.parentElement.parentElement.offsetTop?this.offsetParent.scrollTop-this.parentElement.parentElement.offsetTop-1:0)-1);
        }

        input {
            text-align: center;
            width: 90%;
            height: 98%;
            font-size: 30px;
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

        .auto-style2 {
            width: 40%;
            height: 56px;
        }
        .auto-style3 {
            height: 56px;
        }
    </style>
    <script>
        function Caculate() {
            document.getElementById("TxtYMCB1").value = ((document.getElementById("TxtYMJG14").value - document.getElementById("TxtYMJG15").value) * document.getElementById("TxtYMSYL1").value * document.getElementById("TxtLRB1").value / 1000).toFixed(2);
            document.getElementById("TxtDPCB1").value = ((document.getElementById("TxtDPJG14").value - document.getElementById("TxtDPJG15").value) * document.getElementById("TxtDPSYL1").value * document.getElementById("TxtLRB1").value / 1000).toFixed(2);
            document.getElementById("TxtYLTDCB1").value = ((document.getElementById("TxtYMJG15").value - document.getElementById("TxtGLJG15").value) * document.getElementById("TxtYMSYL1").value * document.getElementById("TxtLRB1").value * document.getElementById("TxtBL1").value / 1000).toFixed(2);
            document.getElementById("TxtCB1").value = (parseFloat(document.getElementById("TxtYMCB1").value) + parseFloat(document.getElementById("TxtDPCB1").value) + parseFloat(document.getElementById("TxtYLTDCB1").value)).toFixed(2);
           
            document.getElementById("TxtYMCB2").value = ((document.getElementById("TxtYMJG14").value - document.getElementById("TxtYMJG15").value) * document.getElementById("TxtYMSYL2").value / 1000).toFixed(2);
            document.getElementById("TxtDPCB2").value = ((document.getElementById("TxtDPJG14").value - document.getElementById("TxtDPJG15").value) * document.getElementById("TxtDPSYL2").value / 1000).toFixed(2);
            document.getElementById("TxtYLTDCB2").value = ((document.getElementById("TxtYMJG15").value - document.getElementById("TxtDM15").value) * document.getElementById("TxtYMSYL2").value * document.getElementById("TxtBL2").value / 1000).toFixed(2);
            document.getElementById("TxtCB2").value = (parseFloat(document.getElementById("TxtYMCB2").value) + parseFloat(document.getElementById("TxtDPCB2").value) + parseFloat(document.getElementById("TxtYLTDCB2").value)).toFixed(2);

        }
        function Click()
        {
            document.getElementById("Button3").click();
        }
    </script>
</head>
<body>
    <form>
        <table>
            <tr class="locktop">
                <td colspan="3" style="text-align: center; color: blue; font-size: 30px"><strong>饲料成本测算</strong></td>
            </tr>
            <tr class="locktop" style="background-color: #66CCFF">
                <td class="auto-style2">猪场</td>
                <td class="auto-style3">猪场(肉猪)</td>
                <td class="auto-style3">猪场(母猪)</td>
            </tr>
            <tr>
                <td>本年上市猪数</td>
                <td>
                    <input id="TxtTS1" type="tel" placeholder="填写" required="required"  value="38000" onfocus="javascript:document.getElementById('TxtTS1').value = ''"/></td>
                <td>
                    <input id="TxtTS2" type="tel" placeholder="填写" required="required"  value="1200" onfocus="javascript:document.getElementById('TxtTS2').value = ''"/>
                </td>
            </tr>
            <tr>
                <td>本年上市重量</td>
                <td>
                    <input id="TxtZL1" type="tel" placeholder="填写" required="required" value="570000" onfocus="javascript:document.getElementById('TxtZL1').value = ''"/></td>
                <td>
                    <input id="TxtZL2" type="tel" value="—" /></td>
            </tr>
            <tr>
                <td>玉米价格(上年)</td>
                <td colspan="2">
                    <input id="TxtYMJG14" type="tel" placeholder="请填写14年玉米价格" required="required" value="2550"  onfocus="javascript:document.getElementById('TxtYMJG14').value = ''"/></td>

            </tr>
                    <tr>
                <td>玉米价格(本年)</td>
                <td colspan="2">
                    <input id="TxtYMJG15" type="tel" placeholder="请填写15年玉米价格" required="required" value="2280" onfocus="javascript:document.getElementById('TxtYMJG15').value = ''" /></td>
            </tr>
            <tr>
                <td>豆粕价格(上年)</td>
                <td colspan="2">
                    <input id="TxtDPJG14" type="tel" placeholder="请填写14年豆粕价格" required="required" value="3800"  onfocus="javascript:document.getElementById('TxtDPJG14').value = ''"/></td>

            </tr>
                 <tr>
                <td>豆粕价格(本年)</td>
                <td colspan="2">
                    <input id="TxtDPJG15" type="tel" placeholder="请填写15年豆粕价格" required="required" value="2520"  onfocus="javascript:document.getElementById('TxtDPJG15').value = ''"/></td>

            </tr>
             <tr>
                <td>高梁价格(本年)</td>
                <td colspan="2">
                    <input id="TxtGLJG15" type="tel" placeholder="请填写15年高梁价格" required="required" value="2120"  onfocus="javascript:document.getElementById('TxtGLJG15').value = ''"/></td>

            </tr>
            <tr>
                <td>大麦价格(本年)</td>
                <td colspan="2">
                    <input id="TxtDM15" type="tel" placeholder="请填写15年大麦价格" required="required" value="2010"  onfocus="javascript:document.getElementById('TxtDM15').value = ''"/></td>

            </tr>
            <tr>
                <td>上年玉米<br />
                    使用比例</td>
                <td>
                    <input id="TxtYMSYL1" type="tel" placeholder="肉猪使用玉米比率" required="required" value="0.7"  onfocus="javascript:document.getElementById('TxtYMSYL1').value = ''"/></td>
                <td>
                    <input id="TxtYMSYL2" type="tel" placeholder="母猪使用玉米比率" required="required" value="0.7" onfocus="javascript:document.getElementById('TxtYMSYL2').value = ''" /></td>
            </tr>
            <tr>
                <td>上年豆粕<br />
                    使用比例</td>
                <td>
                    <input id="TxtDPSYL1" type="tel" placeholder="肉猪使用豆粕比率" required="required" value="0.2"  onfocus="javascript:document.getElementById('TxtDPSYL1').value = ''"/></td>
                <td>
                    <input id="TxtDPSYL2" type="tel" placeholder="母猪使用豆粕比率" required="required" value="0.16" onfocus="javascript:document.getElementById('TxtDPSYL2').value = ''" /></td>
            </tr>
    
       
           
            <tr>
                <td >替代比例</td>
                <td >
                    <input id="TxtBL1" type="tel" placeholder="请填写替代比例" required="required" value="0.8" onfocus="javascript:document.getElementById('TxtBL1').value = ''"/></td>
                <td >
                    <input id="TxtBL2" type="tel" placeholder="请填写替代比例" required="required" value="0.3"  onfocus="javascript:document.getElementById('TxtBL2').value = ''"/></td>
            </tr>
            <tr>
                <td>料肉比</td>
                <td>
                    <input id="TxtLRB1" type="tel" placeholder="请填写料肉比" required="required" value="3.21" onfocus="javascript:document.getElementById('TxtLRB1').value = ''"/></td>
                <td>
                    <input id="TxtLRB2" type="tel" value="—" /></td>
            </tr>
            <tr>
                <td>玉米价格下降<br />
                    影响成本</td>
                <td>
                    <input id="TxtYMCB1" type="tel" placeholder="自动计算" readonly="true" /></td>
                <td>
                    <input id="TxtYMCB2" type="tel" placeholder="自动计算" readonly="true" /></td>
            </tr>
          <tr>
                <td>豆粕价格下降<br />
                    影响成本</td>
                <td>
                    <input id="TxtDPCB1" type="tel" placeholder="自动计算" readonly="true" /></td>
                <td>
                    <input id="TxtDPCB2" type="tel" placeholder="自动计算" readonly="true" /></td>
            </tr>
             <tr>
                <td>原料替代<br />
                    影响成本</td>
                <td>
                    <input id="TxtYLTDCB1" type="tel" placeholder="自动计算" readonly="true" /></td>
                <td>
                    <input id="TxtYLTDCB2" type="tel" placeholder="自动计算" readonly="true" /></td>
            </tr>
                 <tr style="color:red">
                <td>总成本下降</td>
                <td>
                    <input id="TxtCB1" type="tel" placeholder="自动计算" readonly="true" /></td>
                <td>
                    <input id="TxtCB2" type="tel" placeholder="自动计算" readonly="true" /></td>
            </tr>
            <tr>
                <td colspan="3">
                    <input id="Button1" type="reset" value="重 置" style="width: 25%" />&nbsp;&nbsp;&nbsp;&nbsp;
            <input id="Button2" type="button" value="计 算"  onclick="Click()" style="width: 25%" />
                    <input id="Button3" type="button" value="button" onclick="Caculate()" style="display:none"/></td>

            </tr>

        </table>


    </form>
</body>
</html>
