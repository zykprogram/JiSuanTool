<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApp.login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>手机APP工具</title>
<meta content="initial-scale=1.0,maximum-scale=1,minimum-scale=1,width=device-width" name="viewport" />
<link href="Css/style.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div id="wrapper_ygl">
	        <div class="logo"></div>
            <p>
                <asp:TextBox ID="A_Uid" runat="server" placeholder="用户名"></asp:TextBox>
            </p>
            <p>
                <asp:TextBox ID="A_Pwd" runat="server" TextMode="password" placeholder="密码"></asp:TextBox>
            </p>
            <p>
                <asp:Button ID="Button1" runat="server" Text="登陆" CssClass="btn" OnClick="Button1_Click1"/>
            </p>
            <p>
                <asp:Button ID="ImageButton2" runat="server" CssClass="btn2" Text="重置"  />
            </p>
            <p>
                <asp:Label ID="lblMsg" runat="server" ForeColor="white"></asp:Label>
            </p>
        </div>
    </form>
</body>
</html>
