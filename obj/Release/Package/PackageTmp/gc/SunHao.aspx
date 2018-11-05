<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SunHao.aspx.cs" Inherits="WebApp.gc.SunHao" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta content="initial-scale=1.0,maximum-scale=2,minimum-scale=1,width=device-width" name="viewport" />
    <title>损耗率计算</title>
    <style type="text/css">
        table {
            width: 98%;
            text-align: left;
            border: 1px solid #757575;
        }


        td {
            width: 48%;
            border: 1px solid #757575;
            height: 30px;
            font-size: 20px;
            text-align: center;
            font-weight: 700;
        }

        input {
            width: 95%;
            font-size: 20px;
            text-align: center;
        }

        .auto-style1 {
            height: 30px;
        }
    </style>
    <script type="text/javascript">
        function JISUAN() {
            var temp;
            temp = parseFloat(document.getElementById("TLSL").value) + parseFloat(document.getElementById("JRHL").value);
            // document.getElementById("SHS").value = temp - parseFloat(document.getElementById("CCHL").value) - parseFloat(document.getElementById("CCPS").value);
            document.getElementById("SHS").value = temp - parseFloat(document.getElementById("CCHL").value) - parseFloat(document.getElementById("CCPSL").value);
            document.getElementById("SHL").value = (parseFloat(document.getElementById("SHS").value) / (parseFloat(document.getElementById("TLSL").value) + parseFloat(document.getElementById("JRHL").value))).toFixed(5);

            if (parseFloat(document.getElementById("SHL").value) > 0.007) {
                document.getElementById("sunh").style.backgroundColor = "#FF0000";
                document.getElementById("Lab").innerHTML = "报 警"
            }
            else if (parseFloat(document.getElementById("SHL").value) >= 0.005 && parseFloat(document.getElementById("SHL").value) <= 0.007) {
                document.getElementById("sunh").style.backgroundColor = "#FFFF00";
                document.getElementById("Lab").innerHTML = "警 告"
            }
            else {
                document.getElementById("sunh").style.backgroundColor = "#72F433";
                document.getElementById("Lab").innerHTML = "正 常"
            }
            if (!isNaN(document.getElementById("SHL").value)) {
                document.getElementById("SHL").value = (parseFloat(document.getElementById("SHL").value) * 1000).toFixed(2) + '‰'
            }
        }
        function clearNoNum(obj) {
            //先把非数字的都替换掉，除了数字和.
            obj.value = obj.value.replace(/[^\d.]/g, "");
            //必须保证第一个为数字而不是.
            obj.value = obj.value.replace(/^\./g, "");
            //保证只有出现一个.而没有多个.
            obj.value = obj.value.replace(/\.{2,}/g, ".");
            //保证.只出现一次，而不能出现两次以上
            obj.value = obj.value.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");

        }


    </script>
    <script>
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "//hm.baidu.com/hm.js?29c8a0b9e2c3f53062c9be65497ad4a9";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>

</head>

<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td colspan="2" style="font-size: 23px">工厂损耗率计算
                    </td>
                </tr>
                <tr>
                    <td>

                        <strong>投料数量</strong></td>
                    <td>
                        <input id="TLSL" onblur="JISUAN()" onkeyup="clearNoNum(this)" />
                    </td>
                </tr>
                <tr>
                    <td>

                        <strong>加入回料</strong></td>
                    <td>
                        <input id="JRHL" onblur="JISUAN()" onkeyup="clearNoNum(this)" />
                    </td>
                </tr>
                <tr>
                    <td>产出回料</td>
                    <td>
                        <input id="CCHL" onblur="JISUAN()" onkeyup="clearNoNum(this)" />
                    </td>
                </tr>
                <tr>
                    <td>产成品入库数量</td>
                    <td>
                        <input id="CCPSL" onblur="JISUAN()" onkeyup="clearNoNum(this)" />
                    </td>
                </tr>
                <tr>
                    <td style="background-color: #FFFF79">损耗数</td>
                    <td style="background-color: #FFFF79">
                        <input id="SHS" value="自动计算" readonly="true" />
                    </td>
                </tr>
                <tr>
                    <td style="background-color: #FFFF79">损耗率</td>
                    <td style="background-color: #FFFF79">
                        <input id="SHL" value="自动计算" readonly="true" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="color: white; background-color: #72F433" id="sunh">
                        <asp:Label ID="Lab" runat="server" Text="Label">正 常</asp:Label></td>
                </tr>

            </table>
        </div>
    </form>
</body>
</html>
