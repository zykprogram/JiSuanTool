<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tool4.aspx.cs" Inherits="WebApp.yx.tool4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <meta content="initial-scale=1.0,maximum-scale=2,minimum-scale=1,width=device-width" name="viewport" />
    <style type="text/css">
        td {
            width: 10%;
            border: 1px solid #757575;
            height: 30px;
        }

        input {
            text-align: center;
            width: 90%;
        }

        table {
            border: 1px solid #757575;
        }
    </style>
    <script type="text/javascript" language="javascript">
        //增加聚焦事件，属性改变事件


        function getPrice(txtid, txtval) {
            if (document.getElementById(txtid).value == "") {
                document.getElementById(txtid).value = txtval;
            }
            document.getElementById("txtrznfcb").value = document.getElementById("txtrznfbs").value * document.getElementById("txtrznfbj").value;
            document.getElementById("txtrznfcb0").value = document.getElementById("txtrznfbs0").value * document.getElementById("txtrznfbj0").value;
            document.getElementById("txtrzcb0").value = document.getElementById("txtrzbs0").value * document.getElementById("txtrzbj0").value;
            document.getElementById("txtrzcb").value = document.getElementById("txtrzbs").value * document.getElementById("txtrzbj").value;
            document.getElementById("txtzizcb").value = document.getElementById("txtzizbs").value * document.getElementById("txtzizbj").value;
            document.getElementById("txtzizcb0").value = document.getElementById("txtzizbs0").value * document.getElementById("txtzizbj0").value;
            document.getElementById("txtzhongzcb").value = document.getElementById("txtzhongzbs").value * document.getElementById("txtzhongzbj").value;
            document.getElementById("txtzhongzcb0").value = document.getElementById("txtzhongzbs0").value * document.getElementById("txtzhongzbj0").value;

            document.getElementById("txthuaiycb").value = document.getElementById("txthuaiybs").value * document.getElementById("txthuaiybj").value;
            document.getElementById("txthuaiycb0").value = document.getElementById("txthuaiybs0").value * document.getElementById("txthuaiybj0").value;
            document.getElementById("txtpurcb").value = document.getElementById("txtpurbs").value * document.getElementById("txtpurbj").value;
            document.getElementById("txtpurcb0").value = document.getElementById("txtpurbs0").value * document.getElementById("txtpurbj0").value;

            document.getElementById("txtslcb").value = parseFloat(document.getElementById("txtzhongzcb").value) + parseFloat(document.getElementById("txtzizcb").value) + parseFloat(document.getElementById("txtrzcb").value) + parseFloat(document.getElementById("txtrznfcb").value) + parseFloat(document.getElementById("txthuaiycb0").value) + parseFloat(document.getElementById("txtpurcb0").value);
            document.getElementById("txtslcb0").value = parseFloat(document.getElementById("txtzhongzcb0").value) + parseFloat(document.getElementById("txtzizcb0").value) + parseFloat(document.getElementById("txtrzcb0").value) + parseFloat(document.getElementById("txtrznfcb0").value) + parseFloat(document.getElementById("txthuaiycb").value) + parseFloat(document.getElementById("txtpurcb").value);
            document.getElementById("litzsq").innerHTML = parseFloat(document.getElementById("txtslcb0").value) - parseFloat(document.getElementById("txtslcb").value);
            var inttemp = 0;
            document.getElementById("litzjs").innerHTML =  (parseFloat(document.getElementById("TxtTaiShu").value)*parseFloat(document.getElementById("litzsq").innerHTML)  * parseFloat(document.getElementById("litgm").value)).toFixed(0);
        }
        function initjisuan() {
            document.getElementById("txtrznfcb").value = document.getElementById("txtrznfbs").value * document.getElementById("txtrznfbj").value;
            document.getElementById("txtrznfcb0").value = document.getElementById("txtrznfbs0").value * document.getElementById("txtrznfbj0").value;
            document.getElementById("txtrzcb0").value = document.getElementById("txtrzbs0").value * document.getElementById("txtrzbj0").value;
            document.getElementById("txtrzcb").value = document.getElementById("txtrzbs").value * document.getElementById("txtrzbj").value;
            document.getElementById("txtzizcb").value = document.getElementById("txtzizbs").value * document.getElementById("txtzizbj").value;
            document.getElementById("txtzizcb0").value = document.getElementById("txtzizbs0").value * document.getElementById("txtzizbj0").value;
            document.getElementById("txtzhongzcb").value = document.getElementById("txtzhongzbs").value * document.getElementById("txtzhongzbj").value;
            document.getElementById("txtzhongzcb0").value = document.getElementById("txtzhongzbs0").value * document.getElementById("txtzhongzbj0").value;

            document.getElementById("txthuaiycb").value = document.getElementById("txthuaiybs").value * document.getElementById("txthuaiybj").value;
            document.getElementById("txthuaiycb0").value = document.getElementById("txthuaiybs0").value * document.getElementById("txthuaiybj0").value;
            document.getElementById("txtpurcb").value = document.getElementById("txtpurbs").value * document.getElementById("txtpurbj").value;
            document.getElementById("txtpurcb0").value = document.getElementById("txtpurbs0").value * document.getElementById("txtpurbj0").value;
            document.getElementById("txtslcb").value = parseFloat(document.getElementById("txtzhongzcb").value) + parseFloat(document.getElementById("txtzizcb").value) + parseFloat(document.getElementById("txtrzcb").value) + parseFloat(document.getElementById("txtrznfcb").value) + parseFloat(document.getElementById("txthuaiycb0").value) + parseFloat(document.getElementById("txtpurcb0").value);
            document.getElementById("txtslcb0").value = parseFloat(document.getElementById("txtzhongzcb0").value) + parseFloat(document.getElementById("txtzizcb0").value) + parseFloat(document.getElementById("txtrzcb0").value) + parseFloat(document.getElementById("txtrznfcb0").value) + parseFloat(document.getElementById("txthuaiycb").value) + parseFloat(document.getElementById("txtpurcb").value);
            document.getElementById("litzsq").innerHTML = parseFloat(document.getElementById("txtslcb0").value) - parseFloat(document.getElementById("txtslcb").value);
            document.getElementById("litzjs").innerHTML = (parseFloat(document.getElementById("TxtTaiShu").value) * parseFloat(document.getElementById("litzsq").innerHTML) * parseFloat(document.getElementById("litgm").value)).toFixed(0);
        }
    </script>
</head>
<body onload="initjisuan();">
    <form id="form1" runat="server">
        <table width="98%" align="center" style="text-align: center; font-size: 12px;" cellspacing="0" cellpadding="0">

            <tr>
                <td colspan="3" style="background-color: #FFC1A4"><strong><font size="5">猪三乐“36950+55”模式</font></strong><br />
                </td>
                <td colspan="2"><font size="3"><strong><font size="5"><span style="font-size: 30px; color: red; font-style: oblique;">PK</span>
                    <br />
                    <font size="2">(以一窝10头猪为标准）</font></font></strong></font></td>
                <td colspan="3" bgcolor="#CCFF99"><strong><font size="5"><strong><font size="5"><strong><font size="5"><input id="TxtJP" value="XX" type="text" runat="server" style="border: 0px; width: 100px; font-size: 25px; text-decoration: underline;background-color:#CCFF99" onblur="javascript:document.getElementById('lbdfsl').innerHTML=this.value"  onfocus="javascript:document.getElementById('TxtJP').value = ''" />饲料</font></strong></font></strong>“36950+55”模式</font></strong><br />
                </td>
            </tr>
            <tr>
                <td bgcolor="#99FFCC"><strong>产品</strong></td>
                <td bgcolor="#99FFCC"><strong>用料包数<br />
                    （包）</strong></td>
                <td bgcolor="#99FFCC" class="auto-style2"><strong>包零售价<br />
                    （元/包）</strong></td>
                <td bgcolor="#99FFCC"><strong>饲料成本<br />
                    （元）</strong></td>
                <td bgcolor="#99FFCC"><strong>产品</strong></td>
                <td bgcolor="#99FFCC"><strong>用料包数<br />
                    （包）</strong></td>
                <td bgcolor="#99FFCC"><strong>包零售价<br />
                    （元/包）</strong></td>
                <td bgcolor="#99FFCC"><strong>饲料成本<br />
                    （元）</strong></td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <strong>代乳乐</strong></td>
                <td class="auto-style1">
                    <input id="txtrznfbs" value="3" type="text" runat="server" style="border: 0" onkeyup="value=this.value.replace(/\D+/g,'')" onblur="getPrice('txtrznfbs',3)" readonly="readonly" /></td>
                <td class="auto-style1">
                    <input id="txtrznfbj" value="230" type="text" runat="server" style="background-color: #CCCCCC; text-decoration: underline;" onkeyup="value=this.value.replace(/\D+/g,'')" onblur="getPrice('txtrznfbj','230')" onfocus="javascript:document.getElementById('txtrznfbj').value = ''" /></td>
                <td class="auto-style1">
                    <input id="txtrznfcb" value="690" type="text" runat="server" style="border: 0" readonly="readonly" /></td>
                <td class="auto-style1">
                    <strong>教槽料</strong></td>
                <td class="auto-style1">
                    <input id="txtrznfbs0" value="3" type="text" runat="server" style="border: 0" onblur="getPrice('txtrznfbs0',3)" readonly="readonly" /></td>
                <td class="auto-style1">
                    <input id="txtrznfbj0" value="220" type="text" runat="server" style="background-color: #CCCCCC; text-decoration: underline;" onkeyup="value=this.value.replace(/\D+/g,'')" onblur="getPrice('txtrznfbj0',220)" onfocus="javascript:document.getElementById('txtrznfbj0').value = ''" /></td>
                <td class="auto-style1">
                    <input id="txtrznfcb0" value="660" type="text" runat="server" style="border: 0" readonly="readonly" /></td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <strong>乳猪乐</strong></td>
                <td class="auto-style1">
                    <input id="txtrzbs" value="6" type="text" runat="server" style="border: 0" onblur="getPrice('txtrzbs',6)" readonly="readonly" /></td>
                <td class="auto-style1">
                    <input id="txtrzbj" value="245" type="text" runat="server" style="background-color: #CCCCCC; text-decoration: underline;" onkeyup="value=this.value.replace(/\D+/g,'')" onblur="getPrice('txtrzbj',245)" onfocus="javascript:document.getElementById('txtrzbj').value = ''" /></td>
                <td class="auto-style1">
                    <input id="txtrzcb" value="1470" type="text" runat="server" style="border: 0" readonly="readonly" /></td>
                <td class="auto-style1">
                    <strong>乳猪料前期</strong></td>
                <td class="auto-style1">
                    <input id="txtrzbs0" value="6" type="text" runat="server" style="border: 0" onblur="getPrice('txtrzbs0',6)" readonly="readonly" /></td>
                <td class="auto-style1">
                    <input id="txtrzbj0" value="290" type="text" runat="server" style="background-color: #CCCCCC; text-decoration: underline;" onkeyup="value=this.value.replace(/\D+/g,'')" onblur="getPrice('txtrzbj0',290)" onfocus="javascript:document.getElementById('txtrzbj0').value = ''" /></td>
                <td class="auto-style1">
                    <input id="txtrzcb0" value="1740" type="text" runat="server" style="border: 0" readonly="readonly" /></td>
            </tr>
            <tr>
                <td>
                    <strong>仔猪乐</strong></td>
                <td>
                    <input id="txtzizbs" value="9" type="text" runat="server" style="border: 0" onblur="getPrice('txtzizbs',9)" readonly="readonly" /></td>
                <td class="auto-style2">
                    <input id="txtzizbj" value="190" type="text" runat="server" style="background-color: #CCCCCC; text-decoration: underline;" onkeyup="value=this.value.replace(/\D+/g,'')" onblur="getPrice('txtzizbj',190)" onfocus="javascript:document.getElementById('txtzizbj').value = ''" /></td>
                <td>
                    <input id="txtzizcb" value="1710" type="text" runat="server" style="border: 0" readonly="readonly" /></td>
                <td>
                    <strong>乳猪料后期</strong></td>
                <td><strong></strong>
                    <input id="txtzizbs0" value="9" type="text" runat="server" style="border: 0" onblur="getPrice('txtzizbs0',9)" readonly="readonly" /></td>
                <td>
                    <input id="txtzizbj0" value="235" type="text" runat="server" style="background-color: #CCCCCC; text-decoration: underline;" onkeyup="value=this.value.replace(/\D+/g,'')" onblur="getPrice('txtzizbj0',235)" onfocus="javascript:document.getElementById('txtzizbj0').value = ''" /></td>
                <td>
                    <input id="txtzizcb0" value="2115" type="text" runat="server" style="border: 0" readonly="readonly" /></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <strong>中猪料</strong></td>
                <td class="auto-style2">
                    <input id="txtzhongzbs" value="50" type="text" runat="server" style="border: 0" onblur="getPrice('txtzhongzbs',50)" readonly="readonly" /></td>
                <td class="auto-style2">
                    <input id="txtzhongzbj" value="150" type="text" runat="server" style="background-color: #CCCCCC; text-decoration: underline;" onkeyup="value=this.value.replace(/\D+/g,'')" onblur="getPrice('txtzhongzbj',150)" onfocus="javascript:document.getElementById('txtzhongzbj').value = ''" /></td>
                <td>
                    <input id="txtzhongzcb" value="7500" type="text" runat="server" style="border: 0" readonly="readonly" /></td>
                <td class="auto-style2">
                    <strong>小/中猪料</strong></td>
                <td class="auto-style2">
                    <input id="txtzhongzbs0" value="50" type="text" runat="server" style="border: 0" onblur="getPrice('txtzhongzbs0',50)" readonly="readonly" /></td>
                <td class="auto-style2">
                    <input id="txtzhongzbj0" value="159" type="text" runat="server" style="background-color: #CCCCCC; text-decoration: underline;" onkeyup="value=this.value.replace(/\D+/g,'')" onblur="getPrice('txtzhongzbj0',159)" onfocus="javascript:document.getElementById('txtzhongzbj0').value = ''" /></td>
                <td class="auto-style2">
                    <input id="txtzhongzcb0" value="7950" type="text" runat="server" style="border: 0" readonly="readonly" /></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <strong>怀孕料</strong></td>
                <td class="auto-style2">
                    <input id="txthuaiybs0" value="5" type="text" runat="server" style="border: 0" onblur="getPrice('txthuaiybs0',5)" readonly="readonly" /></td>
                <td class="auto-style2">
                    <input id="txthuaiybj0" value="151" type="text" runat="server" style="background-color: #CCCCCC; text-decoration: underline;" onkeyup="value=this.value.replace(/\D+/g,'')" onblur="getPrice('txthuaiybj0',151)" onfocus="javascript:document.getElementById('txthuaiybj0').value = ''" /></td>
                <td>
                    <input id="txthuaiycb0" value="6750" type="text" runat="server" style="border: 0" readonly="readonly" /></td>
                <td class="auto-style2">
                    <strong>怀孕料</strong></td>
                <td class="auto-style2">
                    <input id="txthuaiybs" value="5" type="text" runat="server" style="border: 0" onblur="getPrice('txthuaiybs',5)" readonly="readonly" /></td>
                <td class="auto-style2">
                    <input id="txthuaiybj" value="154" type="text" runat="server" style="background-color: #CCCCCC; text-decoration: underline;" onkeyup="value=this.value.replace(/\D+/g,'')" onblur="getPrice('txthuaiybj',154)" onfocus="javascript:document.getElementById('txthuaiybj').value = ''" /></td>
                <td class="auto-style2">
                    <input id="txthuaiycb" value="4260" type="text" runat="server" style="border: 0" readonly="readonly" /></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <strong>哺乳料</strong></td>
                <td class="auto-style2">
                    <input id="txtpurbs0" value="5" type="text" runat="server" style="border: 0" onblur="getPrice('txtpurbs0',5)" readonly="readonly" /></td>
                <td class="auto-style2">
                    <input id="txtpurbj0" value="161" type="text" runat="server" style="background-color: #CCCCCC; text-decoration: underline;" onkeyup="value=this.value.replace(/\D+/g,'')" onblur="getPrice('txtpurbj0',161)" onfocus="javascript:document.getElementById('txtpurbj0').value = ''" /></td>
                <td>
                    <input id="txtpurcb0" value="805" type="text" runat="server" style="border: 0" readonly="readonly" /></td>
                <td class="auto-style2">
                    <strong>哺乳料</strong></td>
                <td class="auto-style2">
                    <input id="txtpurbs" value="5" type="text" runat="server" style="border: 0" onblur="getPrice('txtpurbj',5)" readonly="readonly" /></td>
                <td class="auto-style2">
                    <input id="txtpurbj" value="167" type="text" runat="server" style="background-color: #CCCCCC; text-decoration: underline;" onkeyup="value=this.value.replace(/\D+/g,'')" onblur="getPrice('txtpurbj',167)" onfocus="javascript:document.getElementById('txtpurbj').value = ''" /></td>
                <td class="auto-style2">
                    <input id="txtpurcb" value="835" type="text" runat="server" style="border: 0" readonly="readonly" /></td>
            </tr>
            <tr>
                <td colspan="3" bgcolor="#99FFCC" class="auto-style4"><strong>饲料成本（元）</strong></td>
                <td>
                    <input id="txtslcb" value="9950" type="text" runat="server" style="border: 0" readonly="readonly" /></td>
                <td colspan="3" bgcolor="#99FFCC" class="auto-style4"><strong>饲料成本（元）</strong></td>
                <td class="auto-style4">
                    <input id="txtslcb0" value="11342" type="text" runat="server" style="border: 0" readonly="readonly" /></td>
            </tr>
            <tr>
                <td colspan="8" style="text-align: center;" class="auto-style1"><strong><font size="5"><span style="color: red">猪三乐</span>比<span style="color: red"><asp:Label ID="lbdfsl" runat="server" Text="XX"></asp:Label></span>饲料每窝节省<span style="color: red; font-size: 35px"><asp:Label ID="litzsq" runat="server" Text="1140"></asp:Label></span>
                    元  
                    <br />
                    <input id="litgm" value="100" type="text" runat="server" style="border: 0px; width: 50px; font-size: 25px; text-decoration: underline;" onkeyup="value=this.value.replace(/\D+/g,'')" onblur="getPrice('litgm',100)" onfocus="javascript:document.getElementById('litgm').value = ''" />头母猪每年节省<span style="color: red; font-size: 25px; font-size: 35px"><asp:Label ID="litzjs" runat="server" Text="250800"></asp:Label></span>
                    元<span style="font-size:15px">（按1头母猪1年<strong><font size="5"><input id="TxtTaiShu" value="2.2" type="text" runat="server" style="border: 0px; width: 25px; font-size: 15px; text-decoration: underline;" onblur="getPrice('TxtTaiShu',2.2)" onfocus="javascript:document.getElementById('TxtTaiShu').value = ''" /></font></strong>胎计算）</span><br />
                    <span style="color: red;  font-size: 25px; font-family: 微软雅黑;">您选对了吗？<br />
                        不算不知道，一算吓一跳!猪三乐饲料是您最好的选择！</span></font></strong></td>
            </tr>
        </table>
    </form>
    <input type="hidden" runat="server" id="hidzsq" value="" />
</body>
</html>
