<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sbt_yx_custdetail_yd.aspx.cs" Inherits="WebApp.H5.SBTDING.sbtproject.sbt_yx_custdetail_yd" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>异动客户</title>
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
    <style>
        h5 {
            margin: 5px 7px;
        }
    </style>
</head>

<body>
    <%-- <header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-center"></a>
			<h1 class="mui-title">客户异动流失填报</h1>
		</header>--%>
    <div class="mui-content">
        <div class="mui-content-padded" style="margin: 5px;">
            <h5>异动客户填报：</h5>
            <form class="mui-input-group">
                <div class="mui-input-row">
                    <label>客户名称：</label>
                    <input type="text" class="mui-input-clear" readonly="true"  id="inputcust" runat="server">
                </div>

                <h5 class="mui-content-padded">异动原因1:<a style="color:red">*</a>  </h5>
                <button id='showUserPicker' class="mui-btn mui-btn-block" type='button' runat="server"></button>
                  <h5 class="mui-content-padded">异动原因2:(非必填项）</h5>
                <button id='showUserPicker2' class="mui-btn mui-btn-block" type='button' runat="server"></button>
                  <h5 class="mui-content-padded">异动原因3:(非必填项）</h5>
                <button id='showUserPicker3' class="mui-btn mui-btn-block" type='button' runat="server"></button>

                <h5 class="mui-content-padded">竞争对手:<a style="color:red">*</a>  </h5>
                <button id='showPicker' class="mui-btn mui-btn-block" type='button' runat="server"></button>
                <div class="mui-input-row" style="display: none" id="InputID" runat="server">
                    <label>其他厂商:</label>
                    <input id='otherCS' runat="server" type="text" class="mui-input-clear" placeholder="请输入">
                </div>
            </form>

        </div>

    </div>
  	<h5 class="mui-content-padded">是否可挽回</h5>
			<div class="mui-card">
				<form class="mui-input-group" id="radiongroupid" >
					<div class="mui-input-row mui-radio mui-left">
						<label>可挽回</label>
						<input name="radio1" runat="server" type="radio" value="可挽回" id="radiogroup1"/>
					</div>
					<div class="mui-input-row mui-radio mui-left">
						<label>不可挽回</label>
						<input name="radio1" runat="server" type="radio" value="不可挽回" id="radiogroup2" />
					</div>
				</form>
			</div>

    <h5>应对措施：<a style="color:red">*</a></h5>
    <div class="mui-input-row" style="margin: 10px 5px;">
        <textarea id="textarea" rows="3"   runat="server"></textarea>
    </div>
    <div class="mui-button-row">
        <button type="button" class="mui-btn mui-btn-primary" onclick="clickok()">确认</button>&nbsp;&nbsp;
        <button type="button" class="mui-btn mui-btn-danger" onclick="javascript:window.history.go(-1);">取消</button>
    </div>
    <form runat="server">
        <div style="display: none">
            <input id="pkid" type="text" runat="server" />
        </div>
    </form>


    <script src="../js/mui.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/mui.picker.js" type="text/javascript" charset="utf-8"> </script>
    <script src="../js/mui.poppicker.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/city.data.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/city.data-3.js" type="text/javascript" charset="utf-8"></script>
    <script>
        (function ($, doc) {
            $.init();
            $.ready(function () {

                var _getParam = function (obj, param) {
                    return obj[param] || '';
                };

                var userPicker = new $.PopPicker();
                userPicker.setData([{
                    value: '竞争对手买断',
                    text: '竞争对手买断'

                }, {
                    value: '产品质量',
                    text: '产品质量'

                }, {
                    value: '产品价格',
                    text: '产品价格'

                }, {
                    value: '金融问题',
                    text: '金融问题'

                }, {
                    value: '技术服务',
                    text: '技术服务'
                }, {
                    value: '市场秩序',
                    text: '市场秩序'

                }, {
                    value: '工厂服务',
                    text: '工厂服务'

                }, {
                    value: '客情关系',
                    text: '客情关系'

                }, {
                    value: '取消经营权',
                    text: '取消经营权'

                }, {
                    value: '猪场拆迁',
                    text: '猪场拆迁'

                }, {
                    value: '改行',
                    text: '改行'
                }
                , {
                    value: '并户',
                    text: '并户'
                }, {
                    value: '周期提货(非实质异动)',
                    text: '周期提货(非实质异动)'
                }
                ]
                );
                var showUserPickerButton = doc.getElementById('showUserPicker');
                var userResult = doc.getElementById('userResult');
                showUserPickerButton.addEventListener('tap', function (event) {
                    userPicker.show(function (items) {
                        // userResult = JSON.stringify(items[0]);
                        // document.getElementById("userResult").innerHTML = items[0].value;
                        document.getElementById("showUserPicker").innerText = items[0].value;
                        //返回 false 可以阻止选择框的关闭
                        //return false;
                    });
                }, false);
                
                var showUserPicker2Button = doc.getElementById('showUserPicker2');
                var userResult = doc.getElementById('userResult');
                showUserPicker2Button.addEventListener('tap', function (event) {
                    userPicker.show(function (items) {
                        // userResult = JSON.stringify(items[0]);
                        // document.getElementById("userResult").innerHTML = items[0].value;
                        document.getElementById("showUserPicker2").innerText = items[0].value;
                        //返回 false 可以阻止选择框的关闭
                        //return false;
                    });
                }, false);
                var showUserPicker3Button = doc.getElementById('showUserPicker3');
                var userResult = doc.getElementById('userResult');
                showUserPicker3Button.addEventListener('tap', function (event) {
                    userPicker.show(function (items) {
                        // userResult = JSON.stringify(items[0]);
                        // document.getElementById("userResult").innerHTML = items[0].value;
                        document.getElementById("showUserPicker3").innerText = items[0].value;
                        //返回 false 可以阻止选择框的关闭
                        //return false;
                    });
                }, false);


                var userPicker2 = new $.PopPicker();
                userPicker2.setData([{
                    value: '自配料',
                    text: '自配料'

                }, {
                    value: '安佑',
                    text: '安佑'

                }, {
                    value: '傲农',
                    text: '傲农'
                }, {
                    value: '大北农',
                    text: '大北农'

                }, {
                    value: '东方希望',
                    text: '东方希望'

                }, {
                    value: '格力特',
                    text: '格力特'

                }, {
                    value: '海大',
                    text: '海大'

                }, {
                    value: '禾丰',
                    text: '禾丰'

                }, {
                    value: '华农恒青',
                    text: '华农恒青'
                }
                , {
                    value: '慧农',
                    text: '慧农'
                }, {
                    value: '加大',
                    text: '加大'
                }, {
                    value: '九鼎',
                    text: '九鼎'
                }, {
                    value: '科恩',
                    text: '科恩'
                }, {
                    value: '漓源',
                    text: '漓源'
                }, {
                    value: '浏阳河',
                    text: '浏阳河'
                }, {
                    value: '普瑞纳',
                    text: '普瑞纳'
                }, {
                    value: '唐人神',
                    text: '唐人神'
                }, {
                    value: '特驱',
                    text: '特驱'
                }, {
                    value: '通威',
                    text: '通威'
                }, {
                    value: '湘大',
                    text: '湘大'
                }, {
                    value: '新希望',
                    text: '新希望'
                }, {
                    value: '扬翔',
                    text: '扬翔'
                }, {
                    value: '正邦',
                    text: '正邦'
                }, {
                    value: '正大康地',
                    text: '正大康地'
                }, {
                    value: '正虹',
                    text: '正虹'
                }, {
                    value: '中慧',
                    text: '中慧'
                }, {
                    value: '不养猪(拆迁/改行)',
                    text: '不养猪(拆迁/改行)'

                },
                {
                    value: '周期提货(非实质异动)',
                    text: '周期提货(非实质异动)'
            },
            {
                value: '其他厂家',
                text: '其他厂家'
            }
                ]
                );
                var PickerButton = doc.getElementById('showPicker');
                var userResult = doc.getElementById('userResult');

                PickerButton.addEventListener('tap', function (event) {
                    userPicker2.show(function (items) {
                        // userResult = JSON.stringify(items[0]);
                        // document.getElementById("userResult").innerHTML = items[0].value;
                        document.getElementById("showPicker").innerText = items[0].value;

                        if (items[0].value == '其他厂家') {
                            document.getElementById("InputID").style.display = "block";
                            document.getElementById("otherCS").value = "";
                        }
                        else {
                            document.getElementById("InputID").style.display = "none";
                        }
                        //返回 false 可以阻止选择框的关闭
                        //return false;
                    });
                }, false);

            });
        })(mui, document);



        function clickok() {
            var ischecked = 0;
            var checkedvalue = "";
            var os = document.getElementsByName("radio1");
            var len = os.length;
            for (var i = 0; i < len; i++) {
                if (os[i].checked) {
                    ischecked = 1;
                    checkedvalue = os[i].value;
                }

            }
            if (ischecked == 0) {
                mui.alert('是否可挽回未填写！', '温馨提示：', function () { });
                return;
            }
            if (document.getElementById("inputcust").value == "") {
                mui.alert('客户未填写！', '温馨提示：', function () { });
                return;
            }   

            if (document.getElementById("showUserPicker").innerText == "" ) {
                mui.alert('流失/异动原因未填写！', '温馨提示：', function () { });
                return;
            }
            if (document.getElementById("showPicker").innerText == "" ) {
                mui.alert('竞争对手未填写！', '温馨提示：', function () { });
                return;
            }
        //    alert(document.getElementById("InputID").style.display);
            if (document.getElementById("otherCS").value == "" && document.getElementById("InputID").style.display == "block") {
                mui.alert('其他厂商未填写！', '温馨提示：', function () { });
                return;
            }
            if (document.getElementById("textarea").value == "") {
                mui.alert('应对措施未填写！', '温馨提示：', function () { });
                return;
            }

            else {
                //alert(document.getElementById("showUserPicker").innerText);
                //alert(document.getElementById("showPicker").innerText);
                //alert(document.getElementById("textarea").value);
                //alert(document.getElementById("pkid").value);

                //alert(document.getElementById("otherCS").value);
                mui.ajax('sbt_yx_custdetail_yd.aspx/insertvalue', {
                    data: {
                        reason: document.getElementById("showUserPicker").innerText,
                        reason2: document.getElementById("showUserPicker2").innerText,
                        reason3: document.getElementById("showUserPicker3").innerText,

                        competitor: document.getElementById("showPicker").innerText,
                        othercs: document.getElementById("otherCS").value,
                        countermeasures: document.getElementById("textarea").value,
                        id: document.getElementById("pkid").value,
                        issave: checkedvalue
                        
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
                        console.log(type);
                    }
                });

            }
        }
    </script>
</body>


</html>
