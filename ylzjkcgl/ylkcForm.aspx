<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ylkcForm.aspx.cs" Inherits="WebApp.ylzjkcgl.ylkcForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    <title></title>
    <meta content="initial-scale=1.0,maximum-scale=2,minimum-scale=1,width=device-width" name="viewport" />
 <script  type="text/javascript">
        function Iframe() {
                var iframe = document.getElementById("IFRAME1");
                var bHeight = iframe.contentWindow.document.body.scrollHeight;
                var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
                var height = Math.max(bHeight, dHeight);
                iframe.height = height;          
        }
        function choseWLLX( type) {
            choseAtt(document.getElementById("wllx" + type)); 
            document.getElementById("IFRAME1").setAttribute("src", "dqylkc.aspx?wllx=" + type);
        }
     //选中类型 样式互斥逻辑
        function choseAtt(cl) {
            var wllxList = document.getElementById("navlist").getElementsByTagName("li");
            for (var i=0;i<wllxList.length;i++){
                wllxList[i].getElementsByTagName("a")[0].style.cssText = "";//IE类浏览器
                wllxList[i].getElementsByTagName("a")[0].setAttribute("style", "");//火狐类浏览器
            }

            cl.style.cssText = "background:#fff;border-bottom:1px solid #fff;color:#000;";
            cl.setAttribute("style", "background:#fff;border-bottom:1px solid #fff;color:#000;");
        }
   
        
 </script> 
    <style>
        #navlist {
            border-bottom: 1px solid #ccc;
            margin: 0;
            padding-bottom: 19px;
            padding-left: 10px;
        }

            #navlist ul, #navlist li {
                display: inline;
                list-style-type: none;
                margin: 0;
                padding: 0;
            }

            #navlist a:link, #navlist a:visited {
                background: #ddd;
                border: 1px solid #ccc;
                color: #666;
                float: left;
                font-size: 16px;
                font-weight: normal;
                line-height: 14px;
                margin-right: 8px;
                padding: 2px 10px 2px 10px;
                text-decoration: none;
            }

                /*#navlist a:link#current, #navlist a:visited#current {
                    background: #fff;
                    border-bottom: 1px solid #fff;
                    color: #000;
                }*/

            #navlist a:hover {
                color: #f00;
            }

    </style>
</head>
<body>
    <div id="navcontainer">
        <%--<asp:Button id="Button1"  runat="server" Text="豆粕" OnClick="Button1_Click"></asp:Button> 
        <asp:Button id="Button2"  runat="server" Text="鱼粉、预混料"  OnClick="Button2_Click"></asp:Button> --%>
        <ul id="navlist">
            <%--<li><a href="javascript:choseWLLX(1);" id="wllx1" >豆粕</a></li>
            <li><a href="javascript:choseWLLX(2);"  id="wllx2" >预混料</a></li>
            <li><a href="javascript:choseWLLX(3);"  id="wllx3" >进口棒子</a></li>
            <li><a href="javascript:choseWLLX(4);"  id="wllx4" >高级高粱</a></li>--%>
            <asp:Literal ID="modelLit" runat="server"></asp:Literal>
        </ul>
         
    </div>
        <div style="width:100%;height:100%;">
            <iframe src="javascript:void(0);" id="IFRAME1" width="100%" scrolling="no" onload="javascript:Iframe();" frameborder="0" ></iframe>
        </div>
</body>
</html>
