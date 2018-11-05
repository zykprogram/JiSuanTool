<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tool2.aspx.cs" Inherits="WebApp.yx.tool2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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

        .auto-style1 {
            height: 30px;
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
            //总饲料成本
            document.getElementById("litzjs").innerHTML = document.getElementById("hidzsq").value * document.getElementById("litgm").value / 10;

            document.getElementById("txtslcb").value = parseFloat(document.getElementById("txtzhongzcb").value) + parseFloat(document.getElementById("txtzizcb").value) + parseFloat(document.getElementById("txtrzcb").value) + parseFloat(document.getElementById("txtrznfcb").value);
            document.getElementById("txtslcb0").value = parseFloat(document.getElementById("txtzhongzcb0").value) + parseFloat(document.getElementById("txtzizcb0").value) + parseFloat(document.getElementById("txtrzcb0").value) + parseFloat(document.getElementById("txtrznfcb0").value) + parseFloat(document.getElementById("txt553cb").value);

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table width="98%" align="center" style="text-align: center; font-size: 12px;" cellspacing="0" cellpadding="0">

            <tr>
                <td colspan="4" bgcolor="#FFC1A4" class="auto-style1">
                    <div align="center"><strong><font size="5">双胞胎“62040+5”模式</font></strong></div>
                    <td colspan="2" class="auto-style1"><font size="3"><strong><font size="5"><span style="font-size: 30px; color: red; font-style: oblique;">PK</span><br />
                       <font size="2">(以一窝10头猪为标准）</font></font></strong></font></td>
                </td>
                <td colspan="4" bgcolor="#CCFF99" class="auto-style1">
                    <div align="center"><strong><font size="5">某大“三宝+552+553”模式</font></strong></div>
                </td>
            </tr>
            <tr>
                <td bgcolor="#99FFCC">
                    <div align="center"><strong>生长阶段</strong></div>
                </td>
                <td bgcolor="#99FFCC"><strong>产品</strong></td>
                <td bgcolor="#99FFCC"><strong>用料包数<br />
                    （包/窝）</strong></td>
                <td bgcolor="#99FFCC">
                    <div align="center">
                        <strong>包零售价<br />
                            （元/包）</strong>
                    </div>
                </td>
                <td bgcolor="#99FFCC">
                    <div align="center">
                        <strong>饲料成本<br />
                            （元/窝）</strong>
                    </div>
                </td>
                <td bgcolor="#99FFCC" class="auto-style1">
                    <div align="center"><strong>生长阶段</strong></div>
                </td>
                <td bgcolor="#99FFCC" class="auto-style1"><strong>产品</strong></td>
                <td bgcolor="#99FFCC"><strong>用料包数<br />
                    （包/窝）</strong></td>
                <td bgcolor="#99FFCC">
                    <div align="center">
                        <strong>包零售价<br />
                            （元/包）</strong>
                    </div>
                </td>
                <td bgcolor="#99FFCC">
                    <div align="center">
                        <strong>饲料成本<br />
                            (元/窝）</strong>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div align="center"><strong style="font-size: 20px">13斤</strong></div>
                </td>
                <td colspan="4"></td>

                <td class="auto-style1">
                    <div align="center"><strong style="font-size: 20px">13斤</strong></div>
                </td>
                <td colspan="4"></td>

            </tr>
            <tr>
                <td rowspan="2"><span style="color: rgb(0, 0, 0); font-family: Tahoma, Arial, Helvetica, sans-serif, SimSun; font-size: 25px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 26px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">↓</span></td>
                <td>
                    <div align="center"><strong>乳猪奶粉</strong></div>
                </td>
                <td class="auto-style1">
                    <input id="txtrznfbs" value="3" type="text" runat="server" style="border: 0" onblur="getPrice('txtrznfbs',3)" readonly="readonly" /></td>
                <td class="auto-style1">
                    <input id="txtrznfbj" value="175" type="text" runat="server" style="background-color: #CCCCCC; text-decoration: underline;" onkeyup="value=this.value.replace(/\D+/g,'')" onblur="getPrice('txtrznfbj',175)" onfocus="javascript:document.getElementById('txtrznfbj').value = ''" /></td>
                <td class="auto-style1">
                    <input id="txtrznfcb" value="525" type="text" runat="server" style="border: 0" readonly="readonly" /></td>
                <td rowspan="2" class="auto-style1"><span style="color: rgb(0, 0, 0); font-family: Tahoma, Arial, Helvetica, sans-serif, SimSun; font-size: 25px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 26px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">↓</span></td>
                <td class="auto-style1">
                    <div align="center"><strong>代乳宝</strong></div>
                </td>
                <td class="auto-style1">
                    <input id="txtrznfbs0" value="3" type="text" runat="server" style="border: 0" onblur="getPrice('txtrznfbs0',3)" readonly="readonly" /></td>
                <td class="auto-style1">
                    <input id="txtrznfbj0" value="220" type="text" runat="server" style="background-color: #CCCCCC; text-decoration: underline;" onkeyup="value=this.value.replace(/\D+/g,'')" onblur="getPrice('txtrznfbj0',220)" onfocus="javascript:document.getElementById('txtrznfbj0').value = ''" /></td>
                <td class="auto-style1">
                    <input id="txtrznfcb0" value="660" type="text" runat="server" style="border: 0" readonly="readonly" /></td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <div align="center"><strong>乳猪料</strong></div>
                </td>
                <td class="auto-style1">
                    <input id="txtrzbs" value="5" type="text" runat="server" style="border: 0" onblur="getPrice('txtrzbs',5)" readonly="readonly" /></td>
                <td class="auto-style1">
                    <input id="txtrzbj" value="195" type="text" runat="server" style="background-color: #CCCCCC; text-decoration: underline;" onkeyup="value=this.value.replace(/\D+/g,'')" onblur="getPrice('txtrzbj',195)" onfocus="javascript:document.getElementById('txtrzbj').value = ''" /></td>
                <td class="auto-style1">
                    <input id="txtrzcb" value="975" type="text" runat="server" style="border: 0" readonly="readonly" /></td>
                <td class="auto-style1">
                    <div align="center"><strong>乳猪宝 </strong></div>
                </td>
                <td class="auto-style1">
                    <input id="txtrzbs0" value="6" type="text" runat="server" style="border: 0" onblur="getPrice('txtrzbs0',6)" readonly="readonly" /></td>
                <td class="auto-style1">
                    <input id="txtrzbj0" value="270" type="text" runat="server" style="background-color: #CCCCCC; text-decoration: underline;" onkeyup="value=this.value.replace(/\D+/g,'')" onblur="getPrice('txtrzbj0',270)" onfocus="javascript:document.getElementById('txtrzbj0').value = ''" /></td>
                <td class="auto-style1">
                    <input id="txtrzcb0" value="1620" type="text" runat="server" style="border: 0" readonly="readonly" /></td>
            </tr>
            <tr>
                <td>
                    <div align="center"><strong style="font-size: 20px">50斤</strong></div>
                </td>
                <td colspan="4"></td>

                <td class="auto-style1">
                    <div align="center"><strong style="font-size: 20px">60斤</strong></div>
                </td>
                <td colspan="4"></td>

            </tr>
            <tr>
                <td><span style="color: rgb(0, 0, 0); font-family: Tahoma, Arial, Helvetica, sans-serif, SimSun; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 26px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">↓</span></td>
                <td>
                    <div align="center"><strong>仔猪料</strong></div>
                </td>
                <td>
                    <input id="txtzizbs" value="10" type="text" runat="server" style="border: 0" onblur="getPrice('txtzizbs',10)" readonly="readonly" /></td>
                <td>
                    <input id="txtzizbj" value="170" type="text" runat="server" style="background-color: #CCCCCC; text-decoration: underline;" onkeyup="value=this.value.replace(/\D+/g,'')" onblur="getPrice('txtzizbj',170)" onfocus="javascript:document.getElementById('txtzizbj').value = ''" /></td>
                <td>
                    <input id="txtzizcb" value="1700" type="text" runat="server" style="border: 0" readonly="readonly" /></td>
                <td class="auto-style1"><span style="color: rgb(0, 0, 0); font-family: Tahoma, Arial, Helvetica, sans-serif, SimSun; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 26px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">↓</span></td>
                <td class="auto-style1">
                    <div align="center"><strong>仔猪宝 </strong></div>
                </td>
                <td>
                    <input id="txtzizbs0" value="9" type="text" runat="server" style="border: 0" onblur="getPrice('txtzizbs0',9)" readonly="readonly" /></td>
                <td>
                    <input id="txtzizbj0" value="230" type="text" runat="server" style="background-color: #CCCCCC; text-decoration: underline;" onkeyup="value=this.value.replace(/\D+/g,'')" onblur="getPrice('txtzizbj0',230)" onfocus="javascript:document.getElementById('txtzizbj0').value = ''" /></td>
                <td>
                    <input id="txtzizcb0" value="2070" type="text" runat="server" style="border: 0" readonly="readonly" /></td>
            </tr>
            <tr>
                <td>
                    <div align="center"><strong style="font-size: 20px">95斤</strong></div>
                </td>
                <td colspan="4"></td>

                <td class="auto-style1">
                    <div align="center"><strong style="font-size: 20px">100斤</strong></div>
                </td>
                   <td class="auto-style1">
                    <div align="center"><strong>552</strong></div>
                </td>
                <td class="auto-style2">
                    <input id="txtzhongzbs0" value="40" type="text" runat="server" style="border: 0" onblur="getPrice('txtzhongzbs0',50)" readonly="readonly" /></td>
                <td class="auto-style2">
                    <input id="txtzhongzbj0" value="140" type="text" runat="server" style="background-color: #CCCCCC; text-decoration: underline;" onkeyup="value=this.value.replace(/\D+/g,'')" onblur="getPrice('txtzhongzbj0',140)" onfocus="javascript:document.getElementById('txtzhongzbj0').value = ''" /></td>
                <td class="auto-style2">
                    <input id="txtzhongzcb0" value="5600" type="text" runat="server" style="border: 0" readonly="readonly" /></td>
              

            </tr>
            <tr>
                <td class="auto-style2"><span style="color: rgb(0, 0, 0); font-family: Tahoma, Arial, Helvetica, sans-serif, SimSun; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 26px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">↓</span></td>
                <td class="auto-style2">
                    <div align="center"><strong>中猪料</strong></div>
                </td>
                <td class="auto-style2">
                    <input id="txtzhongzbs" value="50" type="text" runat="server" style="border: 0" onblur="getPrice('txtzhongzbs',50)" onfocus="javascript:document.getElementById('txtzhongzbs').value = ''" readonly="readonly" /></td>
                <td class="auto-style2">
                    <input id="txtzhongzbj" value="135" type="text" runat="server" style="background-color: #CCCCCC; text-decoration: underline;" onkeyup="value=this.value.replace(/\D+/g,'')" onblur="getPrice('txtzhongzbj',135)" onfocus="javascript:document.getElementById('txtzhongzbj').value = ''" /></td>
                <td class="auto-style2">
                    <input id="txtzhongzcb" value="6750" type="text" runat="server" style="border: 0" readonly="readonly" /></td>
                <td class="auto-style1"><span style="color: rgb(0, 0, 0); font-family: Tahoma, Arial, Helvetica, sans-serif, SimSun; font-size: 20px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 26px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">↓</span></td>
          <td class="auto-style1">
                    <div align="center"><strong>553</strong></div>
                </td>
                <td class="auto-style2">
                    <input id="txt553bs" value="10" type="text" runat="server" style="border: 0" onblur="getPrice('txt553bs',1)" readonly="readonly" /></td>
                <td class="auto-style2">
                    <input id="txt553bj" value="138" type="text" runat="server" style="background-color: #CCCCCC; text-decoration: underline;" onkeyup="value=this.value.replace(/\D+/g,'')" onblur="getPrice('txt553bj',138)" onfocus="javascript:document.getElementById('txt553bj').value = ''" /></td>
                <td class="auto-style2">
                    <input id="txt553cb" value="1380" type="text" runat="server" style="border: 0" readonly="readonly" /></td>
            </tr>
            <tr>
                <td>
                    <div align="center"><strong style="font-size: 20px">245斤</strong></div>
                </td>
                <td colspan="3" bgcolor="#99FFCC">
                    <div align="center"><strong>饲料成本（元）</strong></div>
                </td>
                <td>
                    <input id="txtslcb" value="9950" type="text" runat="server" style="border: 0" readonly="readonly" /></td>
                <td class="auto-style1">
                    <div align="center"><strong style="font-size: 20px">250斤</strong></div>
                </td>
                <td colspan="3" bgcolor="#99FFCC">
                    <div align="center"><strong>饲料成本（元）</strong></div>
                </td>
                <td>
                    <input id="txtslcb0" value="11330" type="text" runat="server" style="border: 0" readonly="readonly" /></td>
            </tr>
            <tr>
                <td colspan="5"><strong><font size="3">62040阶段：料肉比<asp:Literal ID="litjdlrb" runat="server" Text="1.61"></asp:Literal>
                    &nbsp;&nbsp; 价肉比<asp:Literal ID="litjdjrb" runat="server" Text="3.90"></asp:Literal>
                    元/斤</font></strong></td>
                <td colspan="5"><strong><font size="3">三宝阶段：料肉比<asp:Literal ID="litjdlrb0" runat="server" Text="1.52"></asp:Literal>
                    &nbsp; 价肉比<asp:Literal ID="litjdjrb0" runat="server" Text="5.00"></asp:Literal>
                    元/斤</font></strong></td>
            </tr>
            <tr>
                <td colspan="5"><strong><font size="3">62040+5全程：料肉比<asp:Literal ID="litqclrb" runat="server" Text="2.30"></asp:Literal>
                    &nbsp;&nbsp; 价肉比<span style="color: red; font-size: 25px;"><asp:Literal ID="litqcjrb" runat="server" Text="4.29"></asp:Literal></span>
                    元/斤</font></strong> </td>
                <td colspan="5"><strong><font size="3">三宝+552+553全程：料肉比<asp:Literal ID="litqclrb0" runat="server" Text="2.24"></asp:Literal>
                    &nbsp; 价肉比<span style="color: red"><asp:Literal ID="litqcjrb0" runat="server" Text="4.78"></asp:Literal></span>元/斤</font></strong></td>
            </tr>
            <tr>
                <td height="100" colspan="10" style="text-align: center;"><strong><font size="5"><span style="color: red">双胞胎</span>一窝节省<span style="color: red; font-size: 35px;"><asp:Label ID="litzsq" runat="server" Text="1127"></asp:Label></span></span>
                    元 
                    <br />
                    如您的猪场年出栏肉猪为<input id="litgm" runat="server" onblur="getPrice('litgm',100)" onfocus="javascript:document.getElementById('litgm').value = ''" onkeyup="value=this.value.replace(/\D+/g,'')" style="border: 0px; width: 100px; font-size: 25px; text-decoration: underline;" type="text" value="100" />头，则<span style="color: red">双胞胎</span>为您节省<span style="color: red; font-size: 25px"><asp:Label ID="litzjs" runat="server" Text="11270"></asp:Label></span>
                    元<br />
                    <span style="color: red; font-style: italic; font-size: 30px;">您选对了吗？<br />
                        浪费的饲料成本冤不冤?<br />
                        不算不知道，一算吓一跳!</span></font></strong></td>
            </tr>
            <tr>
                <td colspan="10" class="auto-style1">
                    <asp:Button ID="btnSave" runat="server" Text="计   算" Style="width: 60px; height: 21px;" OnClick="btnSave_Click" />

                    &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnReset" runat="server" Text="重   置" OnClick="btnReset_Click" Style="width: 60px; height: 21px;" />
                </td>

            </tr>
            <tr>
                <td colspan="10"><a href="index.aspx" target="_self"><strong style="font-size: 15px">首页</strong></a></td>
            </tr>
 
        </table>
        <input type="hidden" runat="server" id="hidzsq" value="" />
    </form>
</body>
</html>
