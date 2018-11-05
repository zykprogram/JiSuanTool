<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sbt_daytechnicianbase.aspx.cs" Inherits="WebApp.H5.SBTDING.Technician.sbt_daytechnicianbase" %>

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
    <!-- <link rel="stylesheet" type="text/css" href="../css/app.css" /> -->
    <link rel="stylesheet" href="../css/mui.min.css">
    <!--App自定义的css-->
    <link rel="stylesheet" type="text/css" href="../css/app.css" />
    <link href="../css/mui.picker.css" rel="stylesheet" />
    <link href="../css/mui.poppicker.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="../css/mui.picker.min.css" />

    <style>
        h5 {
            margin: 5px 7px;
        }
    </style>
</head>
<body>
    <header class="mui-bar mui-bar-nav">
        <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-center"></a>
        <h1 class="mui-title">期初数据填报</h1>
    </header>

    <div class="mui-content">
        <div class="mui-content-padded">
        </div>
    </div>
    <div class="mui-content-padded">
          <h5 class="mui-content-padded">客户：</h5>
           <form class="mui-input-group" runat="server">
            <div class="mui-input-row mui-select">
                <asp:DropDownList ID="DropDownList1" runat="server"  onchange="GetCustInfo(this.value)">
                </asp:DropDownList>
            </div>
        </form>
        <h5 class="mui-content-padded">期初时间（首次填写日报的前一天）：</h5>
        <button id='datechoose' data-options='{"type":"date"}' class="btn mui-btn mui-btn-block">选择日期 ...</button>
        <h5 class="mui-content-padded">存栏情况:<a style="color: red">*</a></h5>
        <form class="mui-input-group" >
            <div id="jcmzinfo" class="mui-input-row">
                <label>基础母猪数</label>
                <div class="mui-numbox" style="width: 50%; text-align: center">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="jcmz" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>
            </div>
            <div id="fmszzinfo" class="mui-input-row">
                <label>分娩舍仔猪</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="fmszz" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>

            </div>
            <div id="byszzinfo" class="mui-input-row">
                <label>保育舍仔猪</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="byszz" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>

            </div>
            <div id="yfsrzinfo" class="mui-input-row">
                <label>育肥舍肉猪</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="yfsrz" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>

            </div>
            <div class="mui-input-row" hidden>
                <label>全场存栏数</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" hidden type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="qccl" value="" hidden readonly="readonly" />
                    <button class="mui-btn-numbox-plus" hidden type="button">+</button>
                </div>
            </div>
        </form>
    </div>
    <div class="mui-content-padded">
        <form class="mui-input-group">
            <div class="mui-button-row">
                <button type="button" class="mui-btn mui-btn-primary" onclick="clickok()">确认</button>&nbsp;&nbsp;
                <button type="button" class="mui-btn mui-btn-danger" onclick="javascript:window.history.go(-1);">取消</button>
            </div>
        </form>
    </div>
    <script src="../js/mui.min.js"></script>
    <script src="../js/mui.picker.min.js"></script>
    <script>
        function getNowFormatDate() {
            var date = new Date();
            var seperator1 = "-";
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            var strDate = date.getDate();
            if (month >= 1 && month <= 9) {
                month = "0" + month;
            }
            if (strDate >= 0 && strDate <= 9) {
                strDate = "0" + strDate;
            }
            var currentdate = year + seperator1 + month + seperator1 + strDate;
            return currentdate;
        }
        //datechoose.innerText = getNowFormatDate();
        (function ($) {
            $.init();
            var result = $('#result')[0];
            var btns = $('.btn');
            btns.each(function (i, btn) {
                btn.addEventListener('tap', function () {
                    var optionsJson = this.getAttribute('data-options') || '{}';
                    var options = JSON.parse(optionsJson);
                    var id = this.getAttribute('id');
                    /*
                     * 首次显示时实例化组件
                     * 示例为了简洁，将 options 放在了按钮的 dom 上
                     * 也可以直接通过代码声明 optinos 用于实例化 DtPicker
                     */
                    var picker = new $.DtPicker(options);
                    picker.show(function (rs) {
                        /*
                         * rs.value 拼合后的 value
                         * rs.text 拼合后的 text
                         * rs.y 年，可以通过 rs.y.vaue 和 rs.y.text 获取值和文本
                         * rs.m 月，用法同年
                         * rs.d 日，用法同年
                         * rs.h 时，用法同年
                         * rs.i 分（minutes 的第二个字母），用法同年
                         */
                        datechoose.innerText =  rs.text;
                        /* 
                         * 返回 false 可以阻止选择框的关闭
                         * return false;
                         */
                        /*
                         * 释放组件资源，释放后将将不能再操作组件
                         * 通常情况下，不需要示放组件，new DtPicker(options) 后，可以一直使用。
                         * 当前示例，因为内容较多，如不进行资原释放，在某些设备上会较慢。
                         * 所以每次用完便立即调用 dispose 进行释放，下次用时再创建新实例。
                         */
                        picker.dispose();
                    });
                }, false);
            });
        })(mui);
    </script>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
    <script src="../js/mui.picker.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/mui.poppicker.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/city.data.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/city.data-3.js" type="text/javascript" charset="utf-8"></script>
    <script>
        $(document).ready(function () {
            GetCustInfo(document.getElementById("DropDownList1").value);
        });

        function GetCustInfo(custcode) {
            //获取当前客户猪场初始化信息
            mui.ajax('sbt_daytechnicianbase.aspx/GetBaseInfo', {
                dataType: 'json',//服务器返回json格式数据
                data: { custcode: custcode},
                type: 'post',//HTTP请求类型
                timeout: 10000,//超时时间设置为10秒；
                headers: { 'Content-Type': 'application/json' },
                success: function (data) {
                    if (data.d != "") {
                        var jsonstr = JSON.parse(data.d);
                        document.getElementById("jcmz").value = jsonstr.JCMZ;
                        document.getElementById("fmszz").value = jsonstr.FMSZZ;
                        document.getElementById("byszz").value = jsonstr.BYSZZ;
                        document.getElementById("yfsrz").value = jsonstr.YFSRZ;
                        document.getElementById("datechoose").innerText = jsonstr.TS;
                    }
                    else {
                        document.getElementById("jcmz").value = 0;
                        document.getElementById("fmszz").value = 0;
                        document.getElementById("byszz").value = 0;
                        document.getElementById("yfsrz").value = 0;
                        document.getElementById("datechoose").innerText = "";
                    }
                },
                error: function (xhr, type, errorThrown) {
                    //异常处理；
                    console.log(type);
                }
            });
        }

        function clickok() {
            if (document.getElementById("DropDownList1").value == "" || document.getElementById("DropDownList1").value == null) {
                alert("请先选择客户后再提交！");
            }
            else {
                //插入数据
                //debugger;
                mui.ajax('sbt_daytechnicianbase.aspx/InsertValue', {
                    data: {
                        jcmz: document.getElementById("jcmz").value,
                        fmszz: document.getElementById("fmszz").value,
                        byszz: document.getElementById("byszz").value,
                        yfsrz: document.getElementById("yfsrz").value,
                        custcode: document.getElementById("DropDownList1").value,
                        datechoose: document.getElementById("datechoose").innerText
                    },
                    dataType: 'json',//服务器返回json格式数据
                    type: 'post',//HTTP请求类型
                    timeout: 10000,//超时时间设置为10秒；
                    headers: { 'Content-Type': 'application/json' },
                    success: function (data) {
                        //debugger;
                        alert("保存成功");
                        window.history.go(-1);
                    },
                    error: function (xhr, type, errorThrown) {
                        //异常处理；
                        console.log(type);
                    }
                });
            }
        }
    </script>
</body>
</html>
