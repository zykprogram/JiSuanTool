<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sbt_custdingtalk_cost_detail.aspx.cs" Inherits="WebApp.H5.SBTDING.sbtproject.sbt_custdingtalk_cost_detail" %>

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
        <h1 class="mui-title">客户标准毛利填报</h1>
    </header>
    <div class="mui-content">
        <div class="mui-content-padded" style="margin: 5px;">
            <form class="mui-input-group">
                <div class="mui-input-row">
                    <label>客户编码：</label>
                    <input type="text" class="mui-input-clear" runat="server" id="custcode" readonly="true">
                </div>
                
            </form>
        </div>
    </div>
     <div class="mui-content">
        <div class="mui-content-padded" style="margin: 5px;">
            <form class="mui-input-group">
              <div class="mui-input-row">
                    <label>客户名称：</label>
                    <input type="text" class="mui-input-clear" runat="server" id="custname" readonly="true">
                </div>
            </form>
        </div>
    </div>
    <div class="mui-content">
        <div class="mui-content-padded" style="margin: 5px;">
            <form class="mui-input-group">
                <div class="mui-input-row">
                    <div class="mui-card-footer">
                        <a class="mui-card-link">销售分类</a>
                        <a class="mui-card-link">毛利标准(元/吨)</a>
                    </div>
                </div>
                <div class="mui-input-row">
                    <label>A01仔浓料:</label>
                    <input class="mui-input-numbox" runat="server"  id="NUMBER1" />
                </div>

                <div class="mui-input-row">
                    <label>A02浓缩料:</label>

                    <input class="mui-input-numbox" runat="server" id="NUMBER2" />
                </div>

                <div class="mui-input-row">
                    <label>A04人工乳:</label>

                    <input class="mui-input-numbox" runat="server" id="NUMBER3" />
                </div>

                <div class="mui-input-row">
                    <label>A05乳猪奶粉:</label>

                    <input class="mui-input-numbox" runat="server" id="NUMBER4" />
                </div>

                <div class="mui-input-row">
                    <label>A06乳猪料:</label>

                    <input class="mui-input-numbox" runat="server" id="NUMBER5" />
                </div>

                <div class="mui-input-row">
                    <label>A07猪场乳:</label>

                    <input class="mui-input-numbox" runat="server" id="NUMBER6" />
                </div>

                <div class="mui-input-row">
                    <label>A07仔猪料:</label>

                    <input class="mui-input-numbox" runat="server" id="NUMBER7" />
                </div>
                <div class="mui-input-row">
                    <label>A08小猪料:</label>

                    <input class="mui-input-numbox" runat="server" id="NUMBER8" />
                </div>

                <div class="mui-input-row">
                    <label>A09中猪料:</label>

                    <input class="mui-input-numbox" runat="server" id="NUMBER9" />
                </div>

                <div class="mui-input-row">
                    <label>A10怀孕料:</label>

                    <input class="mui-input-numbox" runat="server" id="NUMBER10" />
                </div>

                <div class="mui-input-row">
                    <label>A11哺乳料:</label>

                    <input class="mui-input-numbox" runat="server" id="NUMBER11" />
                </div>

                <div class="mui-input-row">
                    <label>A12大猪料:</label>

                    <input class="mui-input-numbox" runat="server" id="NUMBER12" />
                </div>

                <div class="mui-input-row">
                    <label>A15预混料:</label>

                    <input class="mui-input-numbox" runat="server" id="NUMBER13" />
                </div>

                <div class="mui-input-row">
                    <label>B01小鸡料:</label>

                    <input class="mui-input-numbox" runat="server" id="NUMBER14" />
                </div>

                <div class="mui-input-row">
                    <label>B02中大鸡:</label>

                    <input class="mui-input-numbox" runat="server" id="NUMBER15" />
                </div>

                <div class="mui-input-row">
                    <label>B03蛋鸡料:</label>

                    <input class="mui-input-numbox" runat="server" id="NUMBER16" />
                </div>
                <div class="mui-input-row">
                    <label>B03鸡浓缩:</label>

                    <input class="mui-input-numbox" runat="server" id="NUMBER17" />
                </div>
                <div class="mui-input-row">
                    <label>C01小鸭料:</label>

                    <input class="mui-input-numbox" runat="server" id="NUMBER18" />
                </div>

                <div class="mui-input-row">
                    <label>C02中大鸭:</label>

                    <input class="mui-input-numbox" runat="server" id="NUMBER19" />
                </div>

                <div class="mui-input-row">
                    <label>C03蛋鸭料:</label>

                    <input class="mui-input-numbox" runat="server" id="NUMBER20" />
                </div>

                <div class="mui-input-row">
                    <label>D02沉水鱼:</label>

                    <input class="mui-input-numbox" runat="server" id="NUMBER21" />
                </div>
                <div class="mui-input-row">
                    <label>D03浮水鱼:</label>

                    <input class="mui-input-numbox" runat="server" id="NUMBER22" />
                </div>
                <div>
                    <div class="mui-button-row">
                        <button type="button" class="mui-btn mui-btn-primary" onclick="clickok()">确认</button>&nbsp;&nbsp;
        <button type="button" class="mui-btn mui-btn-danger" onclick="javascript:window.history.go(-1);">取消</button>
                    </div>
                </div>
            </form>
        </div>
    </div>


    <script src="../js/mui.min.js"></script>
    <script>
        function clickok() {
            mui.ajax('sbt_custdingtalk_cost_detail.aspx/insertvalue', {
                data: {
                    custcode: document.getElementById("custcode").value,
                    number1: document.getElementById("NUMBER1").value,
                    number2: document.getElementById("NUMBER2").value,
                    number3: document.getElementById("NUMBER3").value,
                    number4: document.getElementById("NUMBER4").value,
                    number5: document.getElementById("NUMBER5").value,
                    number6: document.getElementById("NUMBER6").value,
                    number7: document.getElementById("NUMBER7").value,
                    number8: document.getElementById("NUMBER8").value,
                    number9: document.getElementById("NUMBER9").value,
                    number10: document.getElementById("NUMBER10").value,
                    number11: document.getElementById("NUMBER11").value,
                    number12: document.getElementById("NUMBER12").value,
                    number13: document.getElementById("NUMBER13").value,
                    number14: document.getElementById("NUMBER14").value,
                    number15: document.getElementById("NUMBER15").value,
                    number16: document.getElementById("NUMBER16").value,
                    number17: document.getElementById("NUMBER17").value,
                    number18: document.getElementById("NUMBER18").value,
                    number19: document.getElementById("NUMBER19").value,
                    number20: document.getElementById("NUMBER20").value,
                    number21: document.getElementById("NUMBER21").value,
                    number22: document.getElementById("NUMBER22").value
                },
                dataType: 'json',//服务器返回json格式数据
                type: 'post',//HTTP请求类型
                timeout: 10000,//超时时间设置为10秒；
                headers: { 'Content-Type': 'application/json' },
                success: function (data) {
                    //服务器返回响应，根据响应结果，分析是否登录成功；
                    //获取返回成功的json类型的数据，并赋值到div里面形成列表（后端html注入）
                    alert("保存成功");
                    //    mui.alert('保存成功！', '恭喜你：', function () { });
                    window.history.go(-1);

                },
                error: function (xhr, type, errorThrown) {
                    //异常处理；
                    alert("数据填写错误");
                    console.log(type);
                }
            });

        }
    </script>
</body>

</html>
