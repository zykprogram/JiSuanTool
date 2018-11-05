<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sbt_custdingtalk_salecost_target.aspx.cs" Inherits="WebApp.H5.SBTDING.sbtproject.sbt_custdingtalk_salecost_target" %>

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
        html,
        body,
        .mui-content {
            height: 0px;
            margin: 0px;
            background-color: #efeff4;
        }

        h5.mui-content-padded {
            margin-left: 0px !important;
            margin-top: 20px !important;
        }

        .mui-card {
            margin: 0px;
        }
    </style>
</head>

<body>
    <header class="mui-bar mui-bar-nav">
        <%--        <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>--%>
        <h1 class="mui-title">客户毛利目标、销量目标填报</h1>
    </header>
    <div class="mui-content">
        <div class="mui-content-padded" style="margin: 5px;">
            <form class="mui-input-group"  runat="server">
                <div class="mui-input-row">
                    <div class="mui-card-footer">
                        <a class="mui-card-link" style="width: 40%">客户</a>
                        <a class="mui-card-link" style="width: 30%">毛利(万元)</a>
                        <a class="mui-card-link" style="width: 30%">销量(吨)</a>
                    </div>
                </div>
                <div id="divHTML" runat="server"></div>
                <div>
                    <div class="mui-button-row">
                        <button type="button" class="mui-btn mui-btn-primary" onclick="clickok()" >确认</button>&nbsp;&nbsp;
                     <button type="button" class="mui-btn mui-btn-danger" onclick="javascript:window.history.go(-1);">取消</button>
                    </div>
                </div>
              <div style="display:none" >
                     <button type="button"  onclick="BtnOK()" runat="server"  id="btnid">确认</button>
                     <input id="Userid" type="text"  runat="server" />
                    <input  id ="YearMonth" type="text" runat="server"/>
                </div>
            </form>
        </div>
    </div>

 <script src="../js/mui.min.js" type="text/javascript" charset="utf-8"></script>
    <script>
        var i = 0;
        document.getElementById("Userid").value = localStorage.getItem("sbtuserid");
        //document.getElementById("Userid").value = "003255";
        document.getElementById("YearMonth").value = localStorage.getItem("yearmonth");
        //document.getElementById("YearMonth").value = "2017-11";
        document.getElementById("btnid").click();
        function clickok() {
           //alert(document.getElementById("YearMonth").value);
            for (i = 0; i < document.getElementById("CN").value; i++) {
                var label = document.getElementById(i);
                var custlist = label.innerText.split(":");
                var cust = custlist[1];
                //var cust = $("#" + i).html();
                //var cust = document.getElementById(i).text;
                var salen = document.getElementById("SALENUMBER" + i).value;
                var costn = document.getElementById("COSTNUMBER" + i).value;
                if ((costn != 0 && costn != '') || (salen != 0 && costn != '')) {
                    //   alert((costn != 0 && costn != '') || (salen != 0 && costn != ''));
                    //if (i == 0) { alert(cust); }
                    mui.ajax('sbt_custdingtalk_salecost_target.aspx/insertvalue', {
                        data: {
                            custcode: cust,
                            COSTNUMBER: costn,
                            SALENUMBER: salen,
                            yearmonth: document.getElementById("YearMonth").value
                        },
                        dataType: 'json',//服务器返回json格式数据
                        type: 'post',//HTTP请求类型
                        timeout: 10000,//超时时间设置为10秒；
                        headers: { 'Content-Type': 'application/json' },
                        success: function (data) {
                            //服务器返回响应，根据响应结果，分析是否登录成功；
                            //获取返回成功的json类型的数据，并赋值到div里面形成列表（后端html注入）
                          //  alert(eval(data).d);
                            //    mui.alert('保存成功！', '恭喜你：', function () { });


                        },
                        error: function (xhr, type, errorThrown) {
                            //异常处理；
                            //  alert("数据请求失败");

                            console.log(type);
                        }
                    });
                   
                }
             
            }
            alert("保存成功");
            window.history.go(-1);
        }

        function BtnOK() {
         
                mui.ajax('sbt_custdingtalk_salecost_target.aspx/getCustname', {
                    data: {
                        userid: document.getElementById("Userid").value,
                        yearmonth: document.getElementById("YearMonth").value
                    },
                    dataType: 'json',//服务器返回json格式数据
                    type: 'post',//HTTP请求类型
                    timeout: 10000,//超时时间设置为10秒；
                    headers: { 'Content-Type': 'application/json' },
                    success: function (data) {
                        //服务器返回响应，根据响应结果，分析是否登录成功；
                        //获取返回成功的json类型的数据，并赋值到div里面形成列表（后端html注入）
                        //alert(eval(data).d);
                        document.getElementById("divHTML").innerHTML = eval(data).d;
                        //    mui.alert('保存成功！', '恭喜你：', function () { });


                    },
                    error: function (xhr, type, errorThrown) {
                        //异常处理；
                        alert("数据请求失败:"+errorThrown);
                        console.log(type);
                    }
                });
            
            }
    </script>
</body>

</html>
