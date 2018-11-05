<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sbt_setprice.aspx.cs" Inherits="WebApp.H5.SBTDING.sbtproject.sbt_setprice" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>猪场价格</title>
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
	<!--<link rel="stylesheet" type="text/css" href="../css/mui.picker.min.css" />-->
	<style>
		.mui-btn {
			font-size: 16px;
			padding: 8px;
			margin: 3px;
		}
		h5.mui-content-padded {
			margin-left: 3px;
			margin-top: 20px !important;
		}
		h5.mui-content-padded:first-child {
			margin-top: 12px !important;
		}
		.ui-alert {
			text-align: center;
			padding: 20px 10px;
			font-size: 16px;
		}
        h5 {
            margin: 5px 7px;
        }
    </style>
</head>

<body>
    <div class="mui-content">
        <div class="mui-content-padded" style="margin: 5px;">
            <h5>猪场价格填报：</h5>
            <form class="mui-input-group">
                <div class="mui-input-row">
                    <label>日期：</label>
                    <input type="text"  readonly="readonly" id="NowTime" runat="server" value="123">
                </div>
                <div class="mycss">
                    <button style="width:33.5%;display:inline;text-align:left;border:none;position:relative;left:5px;" id='showCityPicker3' class="mui-btn mui-btn-block" type='button'>省市县:(点击选择)</button>
                    <div style="display:inline;position:relative;top:10px;width:66.5%;" id='cityResult3' class="ui-alert"></div>
                </div>
                <div class="mui-input-row" style="height:1px;">
                </div>
                <div class="mui-input-row">
                    <label style="display:inline-block;">猪只类型</label>
                    <select id="Type" style="height:40px;display:inline-block;">
                      <option value="">请输入</option>
                      <option value="仔猪">仔猪</option>
                      <option value="外三元">外三元</option>
                      <option value="内三元">内三元</option>
                      <option value="土杂">土杂</option>
                    </select>
                </div>
                <div class="mui-input-row" id="InputID" runat="server">
                    <label>价格：</label>
                    <input id='price' runat="server" type="number" class="mui-input-clear" placeholder="请输入">
                </div>
            </form>
        </div>
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
    <script src="../js/mui.min.js"></script>
		<!--<script src="../js/mui.picker.min.js"></script>-->
		<script src="../js/mui.picker.js"></script>
		<script src="../js/mui.poppicker.js"></script>
		<script src="../js/city.data.js" type="text/javascript" charset="utf-8"></script>
		<script src="../js/city.data-3.js" type="text/javascript" charset="utf-8"></script>
		<script>
            document.getElementById('NowTime').value = new Date().toLocaleDateString();
            var Province = '';
            var City = '';
            var COUNTY = '';

            (function($, doc) {
				$.init();
                $.ready(function () {
                    var _getParam = function(obj, param) {
						return obj[param] || '';
					};
                    var cityPicker3 = new $.PopPicker({
						layer: 3
					});
					cityPicker3.setData(cityData3);
					var showCityPickerButton = doc.getElementById('showCityPicker3');
					var cityResult3 = doc.getElementById('cityResult3');
					showCityPickerButton.addEventListener('tap', function(event) {
						cityPicker3.show(function(items) {
							cityResult3.innerText = "你选择的城市是:" + _getParam(items[0], 'text') + " " + _getParam(items[1], 'text') + " " + _getParam(items[2], 'text');
                            Province = _getParam(items[0], 'text');
                            City = _getParam(items[1], 'text');
                            COUNTY = _getParam(items[2], 'text');
                            //返回 false 可以阻止选择框的关闭
							//return false;
						});
					}, false);
				});
            })(mui, document);


            function clickok() {
                alert(Province);
                if (Province == "" && City == "" && COUNTY == "") {
                    mui.alert('城市未选择！', '温馨提示：', function () { });
                    return;
                }
                var sel = document.getElementById('Type');
                var index = sel.selectedIndex;
                var Type = sel.options[index].value;

                if (Type == "" ) {
                    mui.alert('猪只类型未选择！', '温馨提示：', function () { });
                    return;
                }
                
                if (document.getElementById("price").value == "" ) {
                    mui.alert('价格未填写！', '温馨提示：', function () { });
                    return;
                } 

                /**/
                else {
                    debugger;
                    mui.ajax('sbt_setprice.aspx/insertvalue', {
                        data: {
                            Province: Province,
                            City: City,
                            County: COUNTY,
                            Type: Type,
                            Price: document.getElementById("price").value
                        },
                        dataType: 'json',//服务器返回json格式数据
                        type: 'post',//HTTP请求类型
                        timeout: 10000,//超时时间设置为10秒；
                        headers: { 'Content-Type': 'application/json' },
                        success: function (data) {
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
