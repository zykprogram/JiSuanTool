<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SBTMap.aspx.cs" Inherits="WebApp.yx.SBTMap" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <script src="js/prototype.js" type="text/javascript"></script>
    <script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <style type="text/css">
        body, html, #allmap {
            width: 100%;
            height: 100%;
            overflow: hidden;
            margin: 0;
            font-family: "微软雅黑";
        }

        #l-map {
            height: 100%;
            width: 78%;
            float: left;
            border-right: 2px solid #bcbcbc;
        }

        #r-result {
            height: 100%;
            width: 20%;
            float: left;
        }
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=F2459f5345ee78c16487f813240c119b"></script>
    <title>业务员拜访轨迹</title>
</head>
<body>
    <form id="form1" runat="server">

        <div style="text-align: center" runat="server">
            <span>开始日期</span>
            <asp:TextBox ID="KSRQ" runat="server" placeholder="开始日期" ></asp:TextBox>
            <span>结束日期</span>
            <asp:TextBox ID="JSRQ" runat="server" placeholder="结束日期"  ></asp:TextBox>
            <span>人员姓名或编码</span>
            <asp:TextBox ID="UserName" runat="server" placeholder="请输入人员姓名或编码"></asp:TextBox>
            <input type="button" class="button" id="btnUpdate" value="查 询" onclick="inserchMAPP();" />
        </div>
        <div id="allmap"></div>
    </form>

    <script type="text/javascript">

        var map = new BMap.Map("allmap");
      //  var point = new BMap.Point(115.983148, 28.699291);
        // map.centerAndZoom(point, 15);
        function addMarker(point) {
            var marker = new BMap.Marker(point);
            map.addOverlay(marker);
        }
        //var bounds = map.getBounds();
        //var sw = bounds.getSouthWest();
        //var ne = bounds.getNorthEast();
        //var lngSpan = Math.abs(sw.lng - ne.lng);
        //var latSpan = Math.abs(ne.lat - sw.lat);
        //for (var i = 0; i < 20; i++) {
        //    var point = new BMap.Point(sw.lng + lngSpan * (Math.random() * 0.7), ne.lat - latSpan * (Math.random() * 0.7));
        //    addMarker(point);
        //    var opts = {
        //        position: point,
        //        offset: new BMap.Size(0, -20)
        //    }
        //    var label = new BMap.Label("150T", opts);
        //    map.addOverlay(label);
        //}

        //$(document).ready(function() {
        //    jQuery("#StrJson").bind("propertychange",function())
        //    {
        //        if(jQuery("#StrJson").length>0){
        //        }	
        //    }
        //    });
        function inserchMAPP() {
            if (document.getElementById("UserName").value == "") {
                alert("请输入人员编码！");
                return;
            }
            var username = document.getElementById("UserName").value;
            var ksrq = document.getElementById("KSRQ").value;
            var jsrq = document.getElementById("JSRQ").value;
            var param = "taget=cxzb&username=" + username + "&ksrq=" + ksrq + "&jsrq=" + jsrq;
            var options = {
                method: 'post',
                parameters: param,
                dateType: 'json',
                asynchronous: false, //同步
                onComplete: confirmContent
            }
            new Ajax.Request('SBTMap.aspx', options);
        }
        function confirmContent(request) {
            var map = new BMap.Map("allmap");
            var json = request.responseText;
            json = eval('(' + request.responseText + ')');
            json = json.Table;
            var PointArray = new Array();
            var waypointsPointArray = new Array();
            if (json.length <= 0)
            {
                alert("该期间无拜访记录！");
                return;
            }
            for (var i = 0; i < json.length; i++) {
                //添加点
                if (i == 0) {
                    var point = new BMap.Point(json[i].VISIT_JD, json[i].VISIT_WD);
                    map.centerAndZoom(point, 10);
                    PointArray[i] = point;
                }

                var point = new BMap.Point(json[i].VISIT_JD, json[i].VISIT_WD);
                var marker = new BMap.Marker(point);
                PointArray[i] = point;;
                //图标样式
           //     map.addOverlay(marker);
                //设置标注的图标
                //var icon = new BMap.Icon("", new BMap.Size(150, 150));
                //map.addOverlay(icon);
                //添加点注释
                var opts = {
                    position: point,
                    offset: new BMap.Size(0, 5)
                }
                var sm = json[i].RQ;
               var label = new BMap.Label(sm, opts);
               map.addOverlay(label);

            }
            for (var i = 1; i < PointArray.length-1; i++)
            {
                waypointsPointArray[i-1] = PointArray[i];
            }
            var driving = new BMap.DrivingRoute(map, { renderOptions: { map: map, autoViewport:true } });
            driving.search(PointArray[0], PointArray[json.length - 1], { waypoints: waypointsPointArray });
            //driving.search(PointArray[0], PointArray[json.length-1]);
        }

    </script>

</body>
</html>
