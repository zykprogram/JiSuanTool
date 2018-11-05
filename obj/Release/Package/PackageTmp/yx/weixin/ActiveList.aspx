<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActiveList.aspx.cs" Inherits="WebApp.yx.weixin.ActiveList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta content="initial-scale=1.0,maximum-scale=2,minimum-scale=1,width=device-width" name="viewport" />
    <title>营销活动列表</title>
    <style>
        table {
            width: 98%;
            text-align: center;
        }

        tr {
            text-align: center;
        }

        input {
            width: 90%;
            height: 25px;        
           color:red;
             font-size: 22px;
        }

        td {
            text-align: left;
            height: 30px;
            font-size: 24px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="DivSelect">
            <table>
                <tr style="background-color: #C0C0C0"><td style="text-align:left;font-size:12px; text-decoration: underline;">当前位置:<br />营销活动>客户查询</td></tr>
                <tr>
                    <td style="text-align: center; font-size: 30px; color: blue"><strong>客户查询</strong></td>
                </tr>
                <tr>
                    <td style="font-style: oblique">客户名称：</td>
                </tr>
                <tr>
                    <td>
                        <input id="TxtCustName" type="text"  /></td>
                </tr>
                <tr>
                    <td style="font-style: oblique">客户编码：</td>
                </tr>
                <tr>
                    <td>
                        <input id="TxtCustcode" type="text"  /></td>
                </tr>
                <tr>
                    <td style="font-style: oblique">客户地址：</td>
                </tr>
                <tr>
                    <td>
                        <input id="TxtCustAddress" type="text"  /></td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <input id="Reset1" type="reset" value="重 置" style="width: 20%;color:black" />
                        <input id="Submit1" style="width: 20%;color:black" type="button" value="查 询" onclick="AjaxGet()" /></td>
                </tr>
            </table>
        </div>
    </form>
    <script>
        function ChooseCust()
        {
            
        }

        function OnChangeStyle(a) {
            // document.getElementById(a).style.borderColor = red;
        }

        function AjaxGet() {
            var param = "taget=AjaxGet";
            //  alert(param);return;
            var options = {
                method: 'post',
                parameters: param,
                asynchronous: false, //异步
                onComplete: confirmContent
            }
            new Ajax.Request('ActiveList.aspx', options);
            if(
        }
    </script>
</body>
</html>
