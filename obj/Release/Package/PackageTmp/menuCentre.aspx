<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menuCentre.aspx.cs" Inherits="WebApp.menuCentre" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta content="initial-scale=1.0,maximum-scale=2,minimum-scale=1,width=device-width" name="viewport" />
    <title></title>
    <style type="text/css">
         table {
            width: 100%;
            border: 1px solid #757575;
        }
           tr {
            width: 100%;
            height:36px;
            border: 0px solid #757575;      
            font-size: 15px;
        }
          td {
            width: 50%;
            height:36px;
            border: 0px solid #757575;      
            
        }
        td input {
        background:padding-box;
        background-color: #FF9933;
        width:100%;
        height:100%;
        font-size: 18px;
        }
        a {
            text-decoration: none;
        }
        
        span {         
            text-align: center;
            display: block;
            font-weight: bold;
        }
        .aligncenter {
            width:50%;
            border: 0;
            clear: both;
            display: block;
            margin: auto;
        } 


       
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:100%">
        <table >
            <asp:Literal id="menuLit" runat="server"></asp:Literal>
            <%--<%=creterMenu() %>--%>
           <%--  <tr >
                <td >
                    <input type="button"  value="原料库存管理" onclick="location.href = '/ylzjkcgl/ylkcForm.aspx'"  />
                </td>
                <td >
                    <input  type="button" value="下载中心"/>
                </td>
           </tr>
             <tr >
                <td style="width:50%">
                    <input  type="button"  value="小刘测试"/>
                </td>               
            </tr>--%>
        </table>
    
    </div>
    </form>
</body>
</html>
