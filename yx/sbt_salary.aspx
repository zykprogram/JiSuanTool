<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sbt_salary.aspx.cs" Inherits="WebApp.yx.sbt_salary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width,target-densitydpi=high-dpi, user-scalable=no" />
    <title></title>

    <style type="text/css">
        td {
            border: 1px solid #757575;
            font-size: 15px;
            width: 20%;
        }

        input {
            text-align: center;
            width: 90%;
            margin-bottom: 0px;
            text-decoration: underline
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
    <script type="text/javascript">
        function jisuan() {
            document.getElementById("TxtYLL").value = document.getElementById("TxtMZS").value * 0.5;
            var i = document.getElementById("TxtYLL").value / 50;
            //第一个月
            document.getElementById("Txt11").value = (i * 0.08).toFixed(2);
            document.getElementById("Txt21").value = (i * 1.8).toFixed(2);
            document.getElementById("Txt31").value = (i * 8.12).toFixed(2);
            //第二个月
            document.getElementById("Txt12").value = (i * 0.34).toFixed(2);
            document.getElementById("Txt22").value = (i * 2.88).toFixed(2);
            document.getElementById("Txt32").value = (i * 16.78).toFixed(2);
            //第三个月
            document.getElementById("Txt13").value = (i * 0.51).toFixed(2);
            document.getElementById("Txt23").value = (i * 4.32).toFixed(2);
            document.getElementById("Txt33").value = (i * 25.17).toFixed(2);
            //第四个月
            document.getElementById("Txt14").value = (i * 0.77).toFixed(2);
            document.getElementById("Txt24").value = (i * 5.4).toFixed(2);
            document.getElementById("Txt34").value = (i * 33.83).toFixed(2);
            changenumber();
               }
        function changenumber() {
            //第一月奖励
            document.getElementById("Lit1").innerHTML = (document.getElementById("Txt11").value * document.getElementById("Lit5").innerHTML + document.getElementById("Txt21").value * document.getElementById("Lit6").innerHTML + document.getElementById("Txt31").value * document.getElementById("Lit7").innerHTML).toFixed(0);
            //第二月奖励
            document.getElementById("Lit2").innerHTML = (document.getElementById("Txt12").value * document.getElementById("Lit5").innerHTML + document.getElementById("Txt22").value * document.getElementById("Lit6").innerHTML + document.getElementById("Txt32").value * document.getElementById("Lit7").innerHTML).toFixed(0);
            //第三月奖励
            document.getElementById("Lit3").innerHTML = (document.getElementById("Txt13").value * document.getElementById("Lit5").innerHTML + document.getElementById("Txt23").value * document.getElementById("Lit6").innerHTML + document.getElementById("Txt33").value * document.getElementById("Lit7").innerHTML).toFixed(0);
            //第四月奖励
            document.getElementById("Lit4").innerHTML = (document.getElementById("Txt14").value * document.getElementById("Lit5").innerHTML + document.getElementById("Txt24").value * document.getElementById("Lit6").innerHTML + document.getElementById("Txt34").value * document.getElementById("Lit7").innerHTML).toFixed(0);
            //汇总
            document.getElementById("Lit8").innerHTML = parseFloat(document.getElementById("Lit1").innerHTML) + parseFloat(document.getElementById("Lit2").innerHTML) + parseFloat(document.getElementById("Lit3").innerHTML) + parseFloat(document.getElementById("Lit4").innerHTML);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" >
    
            <div style="font-size: large">一、单个猪场带来的奖励</div>
            <table style="text-align: center">
                <tr>
                    <td colspan="2" ><strong>母猪头数</strong></td>
                    <td colspan="3">
                        <input id="TxtMZS"  type="text" value="100" onblur="jisuan()"  runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="2"><strong>标准用量</strong></td>
                    <td colspan="3">
                        <input id="TxtYLL" style="text-decoration:none " type="text" value="50" onblur="changenumber()" readonly="true" runat="server"/></td>
                </tr>
                <tr>
                    <td rowspan="2"><strong>月份</strong></td>
                    <td colspan="3"><strong>销量（吨）</strong></td>
                    <td><strong>奖金(元)</strong></td>
                </tr>
                <tr>
                    <td><strong>奶粉</strong></td>
                    <td><strong>浓乳料</strong></td>
                    <td><strong>全价料</strong></td>
                    <td><strong>业务员</strong></td>
                </tr>
                <tr>
                    <td><strong>第1个月</strong></td>
                    <td>
                        <input id="Txt11" type="text" value="0.08" onblur="changenumber()"/></td>
                    <td>
                        <input id="Txt21" type="text" value="1.80" onblur="changenumber()" /></td>
                    <td>
                        <input id="Txt31" type="text" value="8.12" onblur="changenumber()"/></td>
                    <td>
                        <asp:Label ID="Lit1" runat="server" Text="" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td><strong>第2个月</strong></td>
                    <td>
                        <input id="Txt12" type="text" value="0.34" onblur="changenumber()"/></td>
                    <td>
                        <input id="Txt22" type="text" value="2.88" onblur="changenumber()"/></td>
                    <td>
                        <input id="Txt32" type="text" value="16.78" onblur="changenumber()"/></td>
                    <td>

                        <asp:Label ID="Lit2" runat="server" Text="" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td><strong>第3个月</strong></td>
                    <td>
                        <input id="Txt13" type="text" value="0.51" onblur="changenumber()"/></td>
                    <td>
                        <input id="Txt23" type="text" value="4.32" onblur="changenumber()"/></td>
                    <td>
                        <input id="Txt33" type="text" value="25.17" onblur="changenumber()"/></td>
                    <td>

                        <asp:Label ID="Lit3" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td><strong>第4个月</strong></td>
                    <td>
                        <input id="Txt14" type="text" value="0.77" onblur="changenumber()"/></td>
                    <td>
                        <input id="Txt24" type="text" value="5.40" onblur="changenumber()"/></td>
                    <td>
                        <input id="Txt34" type="text" value="33.83" onblur="changenumber()"/></td>
                    <td>

                        <asp:Label ID="Lit4" runat="server" Text="" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td><strong>奖励标准</strong></td>
                    <td>
                        <asp:Label ID="Lit5" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Lit6" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Lit7" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>

                        <asp:Label ID="Lit8" runat="server" Text="" ></asp:Label>
                    </td>
                </tr>
              
            </table>
            <br />
            <div style="font-size: large">二、本月实际奖励测算</div>
            <table>
                <tr style="text-align: center">
                    <td rowspan="2">本月销量(吨)</td>
                    <td>奶粉</td>
                    <td>浓乳料</td>
                    <td>全价料</td>
                    <td>
                        合计</td>
                </tr>
                <tr style="text-align: center">

                    <td>
                        <asp:Label ID="Lsize1" runat="server" Text=""></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Lsize2" runat="server" Text=""></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Lsize3" runat="server" Text=""></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Lsize4" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr style="text-align:center;color:red"><td colspan="3">
                        <asp:Label ID="username" runat="server" Text=""></asp:Label>
                        本月奖励测算</td>
                    <td colspan="2">
                        <asp:Label ID="Lit9" runat="server" Text=""></asp:Label>
                    </td>
                   
                </tr>
                <tr>
                    <td colspan="5" style="text-align: left">说明：业务员本月应得奖励以最终奖励结算为准，具体结算需根据各营销部方案执行</td>
                </tr>
            </table>
            <asp:Label ID="LabUserCode" runat="server" Text="" Visible="False"></asp:Label>
            <asp:Label ID="LabPar" runat="server" Text="" Visible="False"></asp:Label>
    </form>
</body>
</html>
