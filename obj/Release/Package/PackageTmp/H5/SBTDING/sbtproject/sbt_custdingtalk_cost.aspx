<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sbt_custdingtalk_cost.aspx.cs" Inherits="WebApp.H5.SBTDING.sbtproject.sbt_custdingtalk_cost" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!--标准mui.css-->
    <link rel="stylesheet" href="../css/mui.min.css">
    <!--App自定义的css-->
    <link rel="stylesheet" type="text/css" href="../css/app.css" />

    <style>
        .mui-table h4, .mui-table h5, .mui-table .mui-h5, .mui-table .mui-h6, .mui-table p {
            margin-top: 0;
        }

        .mui-table h4 {
            line-height: 21px;
            font-weight: 500;
        }

        .mui-table .oa-icon {
            position: absolute;
            right: 0;
            bottom: 0;
        }

        .mui-table .oa-icon-star-filled {
            color: #f14e41;
        }

        .mui-content-padded {
            margin: 10px;
        }
    </style>
</head>

<body>
    <form runat="server">
        <div class="mui-input-row mui-search">
            <input type="search" class="mui-input-clear" placeholder="客户名称" id="searchText" autocomplete="off">
            <button type="button" id="buttonOK" class="mui-btn mui-btn-block" style="width: 99%; text-align: center" runat="server" onclick="BtOK()">点击查询</button>
        </div>
    </form>
    <div id="divHTML" runat="server"></div>

</body>
<script src="../js/mui.min.js"></script>
<script>
    document.getElementById("buttonOK").click();
    
    function BtOK() {

        mui.ajax('sbt_custdingtalk_cost.aspx/VeryUserName', {
            data: {
                name: document.getElementById("searchText").value,
                userid: localStorage.getItem("sbtuserid")    
            },
            dataType: 'json',//服务器返回json格式数据
            type: 'post',//HTTP请求类型
            timeout: 20000,//超时时间设置为10秒；
            headers: { 'Content-Type': 'application/json' },
            success: function (data) {
                //服务器返回响应，根据响应结果，分析是否登录成功；
                //获取返回成功的json类型的数据，并赋值到div里面形成列表（后端html注入）
                document.getElementById("divHTML").innerHTML = eval(data).d;
            },
            error: function (xhr, type, errorThrown) {
                //异常处理；
                alert("请求数据失败");
                console.log(type);
            }
        });
    }
</script>

</html>
