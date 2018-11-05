<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApp.yf.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta content="initial-scale=1.0,maximum-scale=2,minimum-scale=1,width=device-width" name="viewport" />


    <title>研发计算</title>
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
            font-size:20px;
            text-align: center;
        }

        input {
            width: 95%;
            font-size:20px;
            text-align: center;
        }
    </style>
    <script type="text/javascript">
        var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
        document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F2123a4fb16f09170f5b548ded90669bc' type='text/javascript'%3E%3C/script%3E"));
</script>

    <script language="JavaScript" type="text/javascript">
        function JiSuan()
        {
            //体重=（体长+3）* 胸围*胸围/12225+15
            var a =  parseFloat(document.getElementById("TC").value) + 3;
            document.getElementById("TZ").value = (((a * parseFloat(document.getElementById("XW").value) * parseFloat(document.getElementById("XW").value)) / 12225 + 15).toFixed(2))*2;
        }
    </script>
   

</head>

<body>
    <form id="form1" runat="server">
        <div style="text-align: center">
            <table>
                <tr>
                    <td colspan="2" style="font-size: 30px">母猪体重测算器</td>
                </tr>
                <tr>
                    <td><strong>体长(CM)</strong></td>
                    <td>
                        <input id="TC" type="text" /></td>
                </tr>
                <tr>
                    <td><strong>胸围(CM)</strong></td>
                    <td>
                        <input id="XW" type="text" /></td>
                </tr>
                <tr>
                    <td><strong>身高(CM)</strong></td>
                    <td>
                        <input id="YW" type="text" /></td>
                </tr>
                <tr>
                    <td><strong>体重(斤)</strong></td>
                    <td>
                        <input id="TZ" type="text" style="border:0px" readonly="readonly" /></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center" >
                        <input id="Button1" type="button"   value="计算体重" onclick="JiSuan()" style="width:150px;" /></td>
                </tr>
            </table>
        </div>
    </form>
</body>
   

</html>
