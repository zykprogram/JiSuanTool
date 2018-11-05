<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TulingAsk.aspx.cs" Inherits="WebApp.DINGTALKSERVER.TulingAsk" %>

<!DOCTYPE html>

<html>  
<head>  
       <meta name="viewport" content="width=device-width,target-densitydpi=high-dpi, user-scalable=no" />
    <title>双胞胎小智</title>  
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.1.min.js"></script>  
    <style>  
        #txt {  
            width:500px;  
            height:300px;  
        }  
    </style>  
</head>  
<body>  
    <textarea id="txt" style="width:98%"></textarea>  
    <br />  
    <input type="text" id="ans" style="width:85%"/>  
    <input type="button" value="发送" id="btn"   />  
</body>  
</html>  
<script type="text/javascript">
    $(function () {
        $("#btn").click(function () {
            $("#txt").append("本人  " + new Date().format("yyyy-MM-dd hh:mm:ss") + "\r\n");
            $("#txt").append("" + document.getElementById("ans").value + "\r\n");
         //   document.getElementById("ans").value="";
            $.post("tuling.ashx", { ans: $("#ans").val() }, function (data) {
                if (data.text) {
                    $("#txt").append("小智  " + new Date().format("yyyy-MM-dd hh:mm:ss") + "\r\n");
                    $("#txt").append( ""+data.text + "\r\n");
                    if (data.list) {
                        $("#txt").append(data.list + "\r");
                    }
                    $("#ans").val("");
                }

            }, "json");
        });
    })

    Date.prototype.format = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1,                 //月份 
            "d+": this.getDate(),                    //日 
            "h+": this.getHours(),                   //小时 
            "m+": this.getMinutes(),                 //分 
            "s+": this.getSeconds(),                 //秒 
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
            "S": this.getMilliseconds()             //毫秒 
        };
        if (/(y+)/.test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        }
        for (var k in o) {
            if (new RegExp("(" + k + ")").test(fmt)) {
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            }
        }
        return fmt;
    }
</script>  