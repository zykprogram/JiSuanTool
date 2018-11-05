<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sbt_daytechnician.aspx.cs" Inherits="WebApp.H5.SBTDING.sbtproject.sbt_daytechnician" %>


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
        <h1 class="mui-title">技术员日报填报</h1>
    </header>

    <div class="mui-content">
        <div class="mui-content-padded">
        </div>
    </div>
    <div class="mui-content-padded">
          <h5 class="mui-content-padded">客户：</h5>
           <form class="mui-input-group" runat="server">
            <div class="mui-input-row mui-select">
                <asp:DropDownList ID="DropDownList1" runat="server"  onchange="GetCustInfo(this.value,0)">
                </asp:DropDownList>
            </div>
        </form>
       <h5 class="mui-content-padded">时间：</h5>
        <button id='datechoose' data-options='{"type":"date"}' class="btn mui-btn mui-btn-block">选择日期 ...</button>
        <h5 class="mui-content-padded">填报情况:<a id="tbstatus" style="color: red"></a></h5>
        <form class="mui-input-group" >
            <div class="mui-card-footer" style="text-align: center">
                <a class="mui-card-link" style="width: 50%; text-align: center">选项</a>
                <a class="mui-card-link" style="width: 50%; text-align: center">当日</a>
            </div>
            <div class="mui-input-row">
                <label>公猪存栏</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="gzcl" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>
            </div>
            <div class="mui-input-row">
                <label>后备公猪</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="hbgz" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>
            </div>
            <div class="mui-input-row">
                <label>未配后备猪</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="wphbz" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>

            </div>
        </form>

    </div>
    <div class="mui-content-padded">

        <h5 class="mui-content-padded">母猪情况:<a style="color: red">*</a></h5>
        <form class="mui-input-group">

            <div class="mui-input-row">
                <label>母猪死亡数</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="mzsw" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>

            </div>
            <div class="mui-input-row">
                <label>母猪淘汰数</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="mztt" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>

            </div>
            <div class="mui-input-row">
                <label>脱产母猪数</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="tcmz" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>

            </div>
        </form>
    </div>
    <div class="mui-content-padded">
        <h5 class="mui-content-padded">配种情况:<a style="color: red">*</a></h5>
        <form class="mui-input-group">
            <div class="mui-input-row">
                <label>新增配种母猪</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="xzpzmz" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>
            </div>
            <div class="mui-input-row">
                <label>新增配种后备</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="xzpzhb" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>
            </div>
            <div class="mui-input-row">
                <label>返情母猪头数</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="fqmz" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>
            </div>
            <div class="mui-input-row">
                <label>流产母猪头数</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="lcmz" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>
            </div>
        </form>
    </div>
    <div class="mui-content-padded">
        <h5 class="mui-content-padded">分娩情况:<a style="color: red">*</a></h5>

        <form class="mui-input-group">
            <div class="mui-input-row">
                <label>分娩母猪头数</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="fmmz" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>
            </div>
            <div class="mui-input-row">
                <label>产活仔总数</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="totalchz" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>
            </div>
            <div class="mui-input-row">
                <label>产健仔总数</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="totalcjz" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>
            </div>
            <div class="mui-input-row">
                <label>分娩舍仔猪死淘数</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="fmszzst" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>
            </div>
        </form>
    </div>
    <div class="mui-content-padded">
        <h5 class="mui-content-padded">断奶情况:<a style="color: red">*</a></h5>

        <form class="mui-input-group">
            <div class="mui-input-row">
                <label>断奶母猪数</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="dnmz" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>
            </div>
            <div class="mui-input-row">
                <label>断奶仔猪数</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="dnzz" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>
            </div>
        </form>
    </div>
    <div class="mui-content-padded">
        <h5 class="mui-content-padded">保育情况:<a style="color: red">*</a></h5>

        <form class="mui-input-group">
            <div class="mui-input-row">
                <label>分娩舍转入数</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="byjl" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>
            </div>
            <div class="mui-input-row">
                <label>购入猪苗数</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="grzm" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>
            </div>
            <div class="mui-input-row">
                <label>转至育肥数</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="zzyf" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>
            </div>
            <div class="mui-input-row">
                <label>保育销售数</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="byxs" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>
            </div>
            <div class="mui-input-row">
                <label>保育死淘数</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="byst" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>
            </div>
        </form>
    </div>
    <div class="mui-content-padded">
        <h5 class="mui-content-padded">肥猪情况:<a style="color: red">*</a></h5>
        <form class="mui-input-group">
            <div class="mui-input-row">
                <label>育肥进栏数</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="yfjl" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>
            </div>
            <div class="mui-input-row">
                <label>育肥转后备数</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="yfzhb" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>
            </div>
            <div class="mui-input-row">
                <label>育肥销售数</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="yfxs" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>
            </div>
            <div class="mui-input-row">
                <label>育肥死淘数</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="yfst" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>
            </div>
        </form>
    </div>

    <div hidden class="mui-content-padded">
        <h5 class="mui-content-padded">饲料情况:<a style="color: red">*</a></h5>

        <form class="mui-input-group">
            <div class="mui-input-row">
                <label>母猪料(吨)</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="mzl" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>
            </div>
            <div class="mui-input-row">
                <label>三宝(吨)</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="sb" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>
            </div>
            <div class="mui-input-row">
                <label>育肥料(吨)</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="yfl" value="" />
                    <button class="mui-btn-numbox-plus" type="button">+</button>
                </div>
            </div>
            <div class="mui-input-row" hidden>
                <label>合计(吨)</label>
                <div class="mui-numbox" style="width: 50%;">
                    <button class="mui-btn-numbox-minus" hidden type="button">-</button>
                    <input class="mui-input-numbox" type="number" id="totalnumber" value="" hidden readonly="readonly" />
                    <button class="mui-btn-numbox-plus" hidden type="button">+</button>
                </div>
            </div>
        </form>
    </div>
    <div class="mui-content-padded">
        <h5 class="mui-content-padded">周会/月中/月末:<a style="color: red">*</a></h5>

        <form class="mui-input-group">
            <div class="mui-input-row" style="margin: 10px 5px;">
                <textarea id="zhyzym" rows="5"></textarea>
            </div>
        </form>
        <h5 class="mui-content-padded">对比/示范试验:<a style="color: red">*</a></h5>
        <form class="mui-input-group">

            <div class="mui-input-row" style="margin: 10px 5px;">
                <textarea id="dbsfsy" rows="5"></textarea>
            </div>
        </form>
        <h5 class="mui-content-padded">5S(含全场消毒):<a style="color: red">*</a></h5>
        <form class="mui-input-group">
            <div class="mui-input-row" style="margin: 10px 5px;">
                <textarea id="v_5s" rows="5"></textarea>
            </div>
        </form>
        <h5 class="mui-content-padded">三改内容:<a style="color: red">*</a></h5>
        <form class="mui-input-group">
            <div class="mui-input-row" style="margin: 10px 5px;">
                <textarea id="sgnr" rows="5"></textarea>
            </div>
        </form>
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
        datechoose.innerText = getNowFormatDate();
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
                        if (!(document.getElementById("datechoose").innerText == rs.text)) {
                            debugger;
                            GetCustInfo(0,rs.text);
                        }
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
            GetCustInfo(0, 0);
        });

        function clickok() {
            //插入数据
            mui.ajax('sbt_daytechnician.aspx/InsertValue', {
                data: {
                    gzcl: document.getElementById("gzcl").value==""?0:document.getElementById("gzcl").value,
                    hbgz: document.getElementById("hbgz").value==""?0:document.getElementById("hbgz").value,
                    wphbz: document.getElementById("wphbz").value==""?0:document.getElementById("wphbz").value,
                    mzsw: document.getElementById("mzsw").value==""?0:document.getElementById("mzsw").value,
                    mztt: document.getElementById("mztt").value==""?0:document.getElementById("mztt").value,
                    tcmz: document.getElementById("tcmz").value==""?0:document.getElementById("tcmz").value,
                    xzpzmz: document.getElementById("xzpzmz").value==""?0:document.getElementById("xzpzmz").value,
                    xzpzhb: document.getElementById("xzpzhb").value==""?0:document.getElementById("xzpzhb").value,
                    fqmz: document.getElementById("fqmz").value==""?0:document.getElementById("fqmz").value,
                    lcmz: document.getElementById("lcmz").value==""?0:document.getElementById("lcmz").value,
                    fmmz: document.getElementById("fmmz").value==""?0:document.getElementById("fmmz").value,
                    totalchz: document.getElementById("totalchz").value==""?0:document.getElementById("totalchz").value,
                    totalcjz: document.getElementById("totalcjz").value==""?0:document.getElementById("totalcjz").value,
                    fmszzst: document.getElementById("fmszzst").value==""?0:document.getElementById("fmszzst").value,
                    dnmz: document.getElementById("dnmz").value==""?0:document.getElementById("dnmz").value,
                    dnzz: document.getElementById("dnzz").value==""?0:document.getElementById("dnzz").value,
                    byjl: document.getElementById("byjl").value==""?0:document.getElementById("byjl").value,
                    grzm: document.getElementById("grzm").value==""?0:document.getElementById("grzm").value,
                    zzyf: document.getElementById("zzyf").value==""?0:document.getElementById("zzyf").value,
                    byxs: document.getElementById("byxs").value==""?0:document.getElementById("byxs").value,
                    byst: document.getElementById("byst").value==""?0:document.getElementById("byst").value,
                    yfjl: document.getElementById("yfjl").value==""?0:document.getElementById("yfjl").value,
                    yfzhb: document.getElementById("yfzhb").value==""?0:document.getElementById("yfzhb").value,
                    yfxs: document.getElementById("yfxs").value==""?0:document.getElementById("yfxs").value,
                    yfst: document.getElementById("yfst").value==""?0:document.getElementById("yfst").value,
                    mzl: document.getElementById("mzl").value==""?0:document.getElementById("mzl").value,
                    sb: document.getElementById("sb").value==""?0:document.getElementById("sb").value,
                    yfl: document.getElementById("yfl").value==""?0:document.getElementById("yfl").value,
                    totalnumber: document.getElementById("totalnumber").value==""?0:document.getElementById("totalnumber").value,
                    zhyzym: document.getElementById("zhyzym").value,
                    dbsfsy: document.getElementById("dbsfsy").value,
                    v_5s: document.getElementById("v_5s").value,
                    sgnr: document.getElementById("sgnr").value,
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
                    debugger;
                    //异常处理；
                    console.log(type);
                }
            });
        }

        function GetCustInfo(c,d) {
            var custcode = c==0?document.getElementById("DropDownList1").value:c;
            var datechoose = d==0?document.getElementById("datechoose").innerText:d;
            debugger;
            //判断客户基础数据
            mui.ajax('sbt_daytechnician.aspx/GetBaseInfo', {
                dataType: 'json',//服务器返回json格式数据
                data: { custcode: custcode, datechoose: datechoose},
                type: 'post',//HTTP请求类型
                timeout: 10000,//超时时间设置为10秒；
                headers: { 'Content-Type': 'application/json' },
                success: function (data) {
                    if (!data.d) {
                        alert("请先填写初始化数据后再填写猪场数据！");
                    }
                },
                error: function (xhr, type, errorThrown) {
                    //异常处理；
                    console.log(type);
                }
            });

            //当天历史数据获取
            mui.ajax('sbt_daytechnician.aspx/GetTodayInfo', {
                dataType: 'json',//服务器返回json格式数据
                data: { custcode: custcode, datechoose: datechoose},
                type: 'post',//HTTP请求类型
                timeout: 10000,//超时时间设置为10秒；
                headers: { 'Content-Type': 'application/json' },
                success: function (data) {
                    if (data.d != "") {
                         debugger;
                        //alert(data.d);
                        var jsonstr = JSON.parse(data.d);
                        document.getElementById("gzcl").value = jsonstr.GZCL;
                        document.getElementById("hbgz").value = jsonstr.HBGZ;
                        document.getElementById("wphbz").value = jsonstr.WPHBZ;
                        document.getElementById("mzsw").value = jsonstr.MZSW;
                        document.getElementById("mztt").value = jsonstr.MZTT;
                        document.getElementById("tcmz").value = jsonstr.TCMZ;
                        document.getElementById("xzpzmz").value = jsonstr.XZPZMZ;
                        document.getElementById("xzpzhb").value = jsonstr.XZPZHB;
                        document.getElementById("fqmz").value = jsonstr.FQMZ;
                        document.getElementById("lcmz").value = jsonstr.LCMZ;
                        document.getElementById("fmmz").value = jsonstr.FMMZ;
                        document.getElementById("totalchz").value = jsonstr.TOTALCHZ;
                        document.getElementById("totalcjz").value = jsonstr.TOTALCJZ;
                        document.getElementById("fmszzst").value = jsonstr.FMSZZST;
                        document.getElementById("dnmz").value = jsonstr.DNMZ;
                        document.getElementById("dnzz").value = jsonstr.DNZZ;
                        document.getElementById("byjl").value = jsonstr.BYJL;
                        document.getElementById("grzm").value = jsonstr.GRZM;
                        document.getElementById("zzyf").value = jsonstr.ZZYF;
                        document.getElementById("byxs").value = jsonstr.BYXS;
                        document.getElementById("byst").value = jsonstr.BYST;
                        document.getElementById("yfjl").value = jsonstr.YFJL;
                        document.getElementById("yfzhb").value = jsonstr.YFZHB;
                        document.getElementById("yfxs").value = jsonstr.YFXS;
                        document.getElementById("yfst").value = jsonstr.YFST;
                        document.getElementById("mzl").value = jsonstr.MZL;
                        document.getElementById("sb").value = jsonstr.SB;
                        document.getElementById("yfl").value = jsonstr.YFL;
                        document.getElementById("totalnumber").value = jsonstr.TOTALNUMBER;
                        document.getElementById("zhyzym").value = jsonstr.ZHYZYM;
                        document.getElementById("dbsfsy").value = jsonstr.DBSFSY;
                        document.getElementById("v_5s").value = jsonstr.V_5S;
                        document.getElementById("sgnr").value = jsonstr.SGNR;
                        document.getElementById("tbstatus").innerHTML = "已填报";
                    }
                    else {
                        document.getElementById("gzcl").value = 0;
                        document.getElementById("hbgz").value = 0;
                        document.getElementById("wphbz").value = 0;
                        document.getElementById("mzsw").value = 0;
                        document.getElementById("mztt").value = 0;
                        document.getElementById("tcmz").value = 0;
                        document.getElementById("xzpzmz").value = 0;
                        document.getElementById("xzpzhb").value = 0;
                        document.getElementById("fqmz").value = 0;
                        document.getElementById("lcmz").value = 0;
                        document.getElementById("fmmz").value = 0;
                        document.getElementById("totalchz").value = 0;
                        document.getElementById("totalcjz").value = 0;
                        document.getElementById("fmszzst").value = 0;
                        document.getElementById("dnmz").value = 0;
                        document.getElementById("dnzz").value = 0;
                        document.getElementById("byjl").value = 0;
                        document.getElementById("grzm").value = 0;
                        document.getElementById("zzyf").value = 0;
                        document.getElementById("byxs").value = 0;
                        document.getElementById("byst").value = 0;
                        document.getElementById("yfjl").value = 0;
                        document.getElementById("yfzhb").value = 0;
                        document.getElementById("yfxs").value = 0;
                        document.getElementById("yfst").value = 0;
                        document.getElementById("mzl").value = 0;
                        document.getElementById("sb").value = 0;
                        document.getElementById("yfl").value = 0;
                        document.getElementById("totalnumber").value = 0;
                        document.getElementById("zhyzym").value = "";
                        document.getElementById("dbsfsy").value = "";
                        document.getElementById("v_5s").value = "";
                        document.getElementById("sgnr").value = "";
                        document.getElementById("tbstatus").innerHTML = "未填报";
                    }
                },
                error: function (xhr, type, errorThrown) {
                    //异常处理；
                    console.log(type);
                }
            });
        }
    </script>

</body>


</html>
