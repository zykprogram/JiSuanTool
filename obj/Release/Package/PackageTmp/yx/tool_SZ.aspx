<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tool_SZ.aspx.cs" Inherits="WebApp.yx.tool_SZ" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <%-- <link rel="stylesheet" href="css/cabel-v1.css" type="text/css" />
    <script src="js/FancyZoom.js" type="text/javascript"></script>
    <script src="js/FancyZoomHTML.js" type="text/javascript"></script>--%>
       <meta name="viewport" content="width=device-width,target-densitydpi=high-dpi, user-scalable=no" />
    <%--  <meta content="initial-scale=1.0,maximum-scale=2,minimum-scale=1,width=device-width" name="viewport" />--%>
    <style type="text/css">
        td {
            width: 8.3%;
            border: 1px solid #757575;
            font-size: 15px;
        }


        input {
            text-align: center;
            width: 90%;
            margin-bottom: 0px;
        }

        text {
            text-align: center;
            width: 90%;
            height: 30px;
        }

        table {
            width: 98%;
            border: 1px solid #757575;
        }


        .XHX {
            border-bottom: 1px solid red;
            border-right: 0px solid red;
            border-top: 0px solid red;
            border-left: 0px solid red;
        }

        .MyCalendar .ajax__calendar_container {
            border: 1px solid #646464;
            background-color: lemonchiffon;
            color: red;
        }

        .MyCalendar .ajax__calendar_other .ajax__calendar_day, .MyCalendar .ajax__calendar_other .ajax__calendar_year {
            color: black;
        }

        .MyCalendar .ajax__calendar_hover .ajax__calendar_day, .MyCalendar .ajax__calendar_hover .ajax__calendar_month, .MyCalendar .ajax__calendar_hover .ajax__calendar_year {
            color: black;
        }

        .MyCalendar .ajax__calendar_active .ajax__calendar_day, .MyCalendar .ajax__calendar_active .ajax__calendar_month, .MyCalendar .ajax__calendar_active .ajax__calendar_year {
            color: black;
            font-weight: bold;
        }
        .auto-style1 {
            height: 25px;
        }
    </style>
    <script type="text/javascript">
        var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
        document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F66915d34a1ab24cbfd56d0d0c13fc186' type='text/javascript'%3E%3C/script%3E"));
    </script>
    <script type="text/javascript">

        function ChangeStyle() {
           
            if (document.getElementById("ListDate").value == "三胞胎") {
                document.getElementById("Litid").innerHTML = "价格(吨/元)";
                document.getElementById("LabZZ").innerHTML = "吨长猪(斤)"
                document.getElementById("LabDW").innerHTML = "吨";
                document.getElementById("TxtDW").innerText = "1000";
                
                
            }
            else {
                document.getElementById("Litid").innerHTML = "价格(包/元)";
                document.getElementById("LabZZ").innerHTML = "包长猪(斤)"
                document.getElementById("LabDW").innerHTML = "包";
                document.getElementById("TxtDW").innerText = "80";
            }
        }

        function checknum() {
            if (document.getElementById("ListDate").value == "-请选择-") {
                alert("请选择本公司品牌双胞胎/金苹果/三胞胎！");
                document.getElementById("TxtCLJG1").innerHTML = "";
            }
        }

        function ClearValue(obj) {
            obj.value = "";
        }
        function clearNoNum(obj) {

            //先把非数字的都替换掉，除了数字和.
            obj.value = obj.value.replace(/[^\d.]/g, "");
            //必须保证第一个为数字而不是.
            obj.value = obj.value.replace(/^\./g, "");
            //保证只有出现一个.而没有多个.
            obj.value = obj.value.replace(/\.{2,}/g, ".");
            //保证.只出现一次，而不能出现两次以上
            obj.value = obj.value.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");
        }

        //增加日期格式 付辉平 2014-08-22
        function clearNoNumDate(obj) {
            var str = obj.value;
            if (str.length != 0) {
                var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/;
                var r = str.match(reg);
                if (r == null)
                    document.getElementById("TxtKSRQ").value = '';
            }
        }

        var wait = 15;
        function time(o) {

            if (wait == 0) {
                o.removeAttribute("disabled");
                o.value = "计 算";
                wait = 15;
            }
            else {
                if (wait == 13) {
                    var state = true;
                    if (state) {
                        document.getElementById("BtnJS").click();
                    }
                }
                o.setAttribute("disabled", true); o.value = "倒计时(" + wait + ")";
                wait--;
                setTimeout(function () { time(o) }, 1000)
            }
        }
        function timeUpLoad(o) {
            o.value = "上传中…";
        }
    </script>
</head>
<body>
    <%--  <body onload="setupZoom();">--%>
    <form id="form1" runat="server">

        <%--  <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        <asp:Literal ID="Literal2" runat="server"></asp:Literal>
             <asp:Literal ID="Literal3" runat="server"></asp:Literal>
        <asp:Literal ID="Literal4" runat="server"></asp:Literal>
             <asp:Literal ID="Literal5" runat="server"></asp:Literal>--%>



        <table style="text-align: center">

            <tr>
                <td colspan="12" style="border: 0px"><a style="font-size: 22px;"><strong>双胞胎饲料称猪对比数据表</strong></a></td>
            </tr>
            <%-- <tr>
            <td colspan="12" style="text-align: left; background-color: #EEEEEE"><span style="font-size: 20px;">&nbsp;     基本信息</span></td>
            </tr>
            <tr>
                <td colspan="3"><strong>省区</strong></td>
                <td colspan="3">
                    <asp:TextBox ID="TxtProvi" runat="server"></asp:TextBox></td>
                <td colspan="3"><strong>营销部</strong></td>
                <td colspan="3">
                    <asp:TextBox ID="TxtYXB" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="3" ><strong>实证类别</strong></td>
                <td colspan="3" >
                    <asp:TextBox ID="TxtSZLB" runat="server"></asp:TextBox></td>
                <td colspan="3" ><strong>示范户姓名</strong></td>
                <td colspan="3" >
                    <asp:TextBox ID="TxtSFHXM" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="3"><strong>地址</strong></td>

                <td colspan="9">
                    <asp:TextBox ID="TxtADDRE" runat="server" Width="97%"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="3"><strong>电话号码</strong></td>
                <td colspan="3">
                    <asp:TextBox ID="TxtTELE" runat="server"></asp:TextBox></td>
                <td colspan="3"><strong>填单人</strong></td>
                <td colspan="3">
                    <asp:TextBox ID="TxtTDR" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="3"><strong>初重日期</strong></td>
                <td colspan="3">
                    <asp:TextBox ID="TxtCZRQ" runat="server"></asp:TextBox></td>
                <td colspan="3"><strong>末重日期</strong></td>
                <td colspan="3">
                    <asp:TextBox ID="TxtMZRQ" runat="server"></asp:TextBox></td>
            </tr>--%>
            <tr>
                <td colspan="4" style="border: 0px; text-align: right"><strong style="font-family: 华文楷体; font-size: 20px;">猪场养户:</strong></td>
                <td colspan="8" style="border: 0px">
                    <input id="TxtName" type="text" runat="server" class="XHX" /></td>


            </tr>
            <tr>
                <td colspan="4" style="border: 0px; text-align: right"><strong style="font-family: 华文楷体; font-size: 20px">联系电话:</strong></td>
                <td colspan="8" style="border: 0px">
                    <input id="TxtPhone" type="text" runat="server" onkeyup="clearNoNum(this)" class="XHX" /></td>
            </tr>
            <tr>
                <td colspan="4" style="border: 0px; text-align: right"><strong style="font-family: 华文楷体; font-size: 20px">养户地址:</strong></td>
                <td colspan="8" style="border: 0px">
                    <input id="TxtAdd" type="text" runat="server" class="XHX" /></td>
            </tr>
            <tr>

                <td colspan="4" style="border: 0px; text-align: right"><strong style="font-family: 华文楷体; font-size: 20px">开始日期:</strong></td>
                <td colspan="8" style="border: 0px">
                    <asp:TextBox ID="TxtKSRQ" runat="server" CssClass="XHX" onkeyup="clearNoNumDate(this)"></asp:TextBox>

                    <ajaxToolkit:CalendarExtender CssClass="MyCalendar" Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="TxtKSRQ"></ajaxToolkit:CalendarExtender>

                </td>

            </tr>
            <tr>
                <td colspan="4" rowspan="2" style="text-align: center; background-color: #EEEEEE;"><span style="font-size: 20px">指标</span></td>
                <td colspan="8" style="text-align: center;"><span style="font-size: 20px; color: red"><strong>饲料品牌</strong> </span></td>

            </tr>

            <tr>
                <td colspan="4">
                    <select id="ListDate" name="abc" style="width: 90%; text-align: center; color: red; font-size: 20px" onblur="ChangeStyle()">
                        <option value="">-请选择-</option>
                        <option value="双胞胎">双胞胎</option>
                        <option value="金苹果">金苹果</option>
                        <option value="三胞胎">三胞胎</option>
                    </select>
                </td>
                <td colspan="4" style="text-align: center;"><span style="font-size: 20px; color: blue"><strong>对比厂</strong> </span></td>
            </tr>
            <tr>
                <td colspan="4" style="background-color: #6699FF;"><strong>产品名称</strong></td>
                <td colspan="4"><span><strong>
                    <ajaxToolkit:ToolkitScriptManager runat="server" EnableScriptGlobalization="true" ScriptMode="Release"></ajaxToolkit:ToolkitScriptManager>
                    <asp:TextBox ID="TxtSBTX" runat="server" OnTextChanged="TxtSBTX_TextChanged" Text="（请选择）" onclick="ClearValue(this)"></asp:TextBox>
                    <ajaxToolkit:AutoCompleteExtender runat="server" ID="AjaxCom" TargetControlID="TxtSBTX" CompletionSetCount="5" MinimumPrefixLength="1" CompletionInterval="100" ServicePath="WebService1.asmx" ServiceMethod="GetSBTCompleteList"></ajaxToolkit:AutoCompleteExtender>
                </strong>
                </span></td>
                <td colspan="4">
                    <asp:TextBox ID="TxtJXSX" runat="server" OnTextChanged="TxtJXSX_TextChanged" Text="（请选择）" onclick="ClearValue(this)"></asp:TextBox>
                    <ajaxToolkit:AutoCompleteExtender runat="server" ID="AutoCompleteExtender1" TargetControlID="TxtJXSX" CompletionSetCount="5" MinimumPrefixLength="1" CompletionInterval="100" ServicePath="WebService1.asmx" ServiceMethod="GetJXSCompleteList"></ajaxToolkit:AutoCompleteExtender>
                </td>

            </tr>


            <tr>
                <td colspan="4" style="color: blue"><strong>头数</strong> </td>
                <td colspan="4">
                    <asp:TextBox ID="TxtTS1"  name="tel" runat="server" onkeyup="clearNoNum(this)"></asp:TextBox></td>
                <td colspan="4">
                    <asp:TextBox ID="TxtTS2" name="tel" runat="server" onkeyup="clearNoNum(this)"></asp:TextBox></td>

            </tr>
            <tr>
                <td colspan="4" style="color: blue"><strong>初均重(斤)</strong></td>
                <td colspan="4">
                    <asp:TextBox ID="TxtCJZ1" name="tel" runat="server" onkeyup="clearNoNum(this)"></asp:TextBox></td>
                <td colspan="4">
                    <asp:TextBox ID="TxtCJZ2" name="tel" runat="server" onkeyup="clearNoNum(this)"></asp:TextBox></td>

            </tr>
            <tr>
                <td colspan="4" style="color: blue"><strong>末均重(斤)</strong></td>
                <td colspan="4">
                    <asp:TextBox ID="TxtMJZ1" name="tel" runat="server" onkeyup="clearNoNum(this)"></asp:TextBox></td>
                <td colspan="4">
                    <asp:TextBox ID="TxtMJZ2" name="tel" runat="server" onkeyup="clearNoNum(this)" onchange=""></asp:TextBox></td>

            </tr>
            <tr>
                <td colspan="4" style="color: blue"><strong>总用料</strong> </td>
                <td colspan="4">
                    <asp:TextBox ID="TxtZYL1" name="tel" runat="server" onkeyup="clearNoNum(this)"></asp:TextBox></td>
                <td colspan="4">

                    <asp:TextBox ID="TxtZYL2" name="tel" runat="server" onkeyup="clearNoNum(this)"> </asp:TextBox></td>

            </tr>
            <tr>
                <td colspan="4" style="color: blue"><strong>对比天数</strong> </td>
                <td colspan="4">
                    <asp:TextBox ID="TxtYLTS1" name="tel" runat="server" onkeyup="clearNoNum(this)"></asp:TextBox></td>
                <td colspan="4">
                    <asp:TextBox ID="TxtYLTS2" name="tel" runat="server" onkeyup="clearNoNum(this)"></asp:TextBox></td>

            </tr>

            <tr>
                <td colspan="4" style="color: blue">
                    <asp:Label ID="Litid" runat="server" Text="价格"></asp:Label></td>
                <td colspan="4">
                    <asp:TextBox ID="TxtCLJG1" name="tel" runat="server" onkeyup="clearNoNum(this)" ></asp:TextBox></td>
                <td colspan="4">
                    <asp:TextBox ID="TxtCLJG2" name="tel" runat="server" onkeyup="clearNoNum(this)"></asp:TextBox></td>

            </tr>
            <tr>
                <td colspan="4" style="color: blue"><strong>猪价(元/斤)</strong></td>
                <td colspan="8">
                    <input id="TxtZJ" type="text" runat="server" onkeyup="clearNoNum(this)" /></td>
            </tr>
            <tr>
                <td colspan="4" style="color: blue" class="auto-style2"><strong>头均用料(斤)</strong></td>
                <td colspan="4">
                    <asp:TextBox ID="TxtTJYL1" runat="server" ReadOnly="true" onkeyup="clearNoNum(this)" Text="自动计算"></asp:TextBox></td>
                <td colspan="4">
                    <asp:TextBox ID="TxtTJYL2" runat="server" ReadOnly="true" onkeyup="clearNoNum(this)" Text="自动计算"></asp:TextBox></td>

            </tr>
            <tr>
                <td colspan="4" style="background-color: #FFFF99"><span><strong>日采食量(斤)</strong> </span></td>
                <td colspan="4" style="background-color: #FFFF99">
                    <asp:TextBox ID="TxtCSL1" runat="server" ReadOnly="true" Text="自动计算"></asp:TextBox></td>
                <td colspan="4" style="background-color: #FFFF99">
                    <asp:TextBox ID="TxtCSL2" runat="server" ReadOnly="true" Text="自动计算"></asp:TextBox></td>

            </tr>
            <tr>
                <td colspan="4" style="background-color: #FFFF99"><span><strong>日增重（斤)</strong> </span></td>
                <td colspan="4" style="background-color: #FFFF99">
                    <asp:TextBox ID="TxtRZZ1" runat="server" ReadOnly="true" Text="自动计算"></asp:TextBox></td>
                <td colspan="4" style="background-color: #FFFF99">
                    <asp:TextBox ID="TxtRZZ2" runat="server" ReadOnly="true" Text="自动计算"></asp:TextBox></td>

            </tr>
            <tr>
                <td colspan="4" style="background-color: #FFFF99"><span><strong>料肉比(X:1</strong></span><strong>)</strong></td>
                <td colspan="4" style="background-color: #FFFF99">
                    <asp:TextBox ID="TxtLRB1" runat="server" ReadOnly="true" Text="自动计算"> </asp:TextBox></td>
                <td colspan="4" style="background-color: #FFFF99">
                    <asp:TextBox ID="TxtLRB2" runat="server" ReadOnly="true" Text="自动计算"></asp:TextBox></td>

            </tr>

            <tr>
                <td colspan="4" style="background-color: #FFFF99" class="auto-style1"><span><strong>价肉比(X:1)</strong></span></td>
                <td colspan="4" style="background-color: #FFFF99" class="auto-style1">
                    <asp:TextBox ID="TxtJRB1" runat="server" ReadOnly="true" Text="自动计算"></asp:TextBox></td>
                <td colspan="4" style="background-color: #FFFF99" class="auto-style1">
                    <asp:TextBox ID="TxtJRB2" runat="server" ReadOnly="true" Text="自动计算"></asp:TextBox></td>

            </tr>
            <tr>
                <td colspan="4">
                    <asp:Label ID="LabZZ" runat="server" Text="长猪"></asp:Label></td>
                <td colspan="4">
                    <asp:TextBox ID="TxtBZZ1" runat="server" ReadOnly="true" Text="自动计算"></asp:TextBox></td>
                <td colspan="4">
                    <asp:TextBox ID="TxtBZZ2" runat="server" ReadOnly="true" Text="自动计算"></asp:TextBox></td>

            </tr>


            <tr>

                <td colspan="12"><span style="font-size: 26px; color: red;" hidden="hidden" id="SPANID" runat="server">用<asp:Literal ID="LitSBT" runat="server" Text="?"></asp:Literal>比<asp:Literal ID="LitQT" runat="server" Text="?"></asp:Literal>每<asp:Label ID="LabDW" runat="server" Text="包"></asp:Label>多赚
                    <asp:Literal ID="LitBZZ" runat="server" Text="?"></asp:Literal>元</span></td>

            </tr>



            <tr>
                <td colspan="8" rowspan="2" style="width: 66.6%">

                    <img alt="" src="images/noing.gif" id="img" runat="server" style="height: 90%" /></td>
                <td colspan="4">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>


            </tr>
            <tr>

                <td colspan="4">
                    <asp:Button ID="upload" type="button" Text="上  传" runat="server" OnClick="upload_Click" OnClientClick="timeUpLoad(this)" />
                    <asp:TextBox ID="TextBox1" runat="server" ReadOnly="true"></asp:TextBox>
                </td>

            </tr>
            <tr>
                <td colspan="12">
                    <input id="Button1" type="button"  runat="server" value="计   算" style="width: 40%" onclick="document.getElementById('BtnHid').click()" />
                    <input id="Button2" type="button" runat="server" value="保   存" style="width: 40%" onclick="    if (time(this)); else return false;" />

                </td>
            </tr>
            <tr>
                <td colspan="12"><span style="color: red"><strong>温馨提示：</strong></span>操作步骤：1、先选择图片；2、点击上传；3、点击计算：校验数据；4、点击保存</td>
            </tr>
             <tr>
                <td colspan="12"><asp:TextBox ID="TxtDW"  name="tel" runat="server"  ReadOnly="true" Text="80"></asp:TextBox></td>
            </tr>
            


            <asp:TextBox ID="TxtSBTID" runat="server" Visible="false"></asp:TextBox>
            <asp:TextBox ID="TxtJXSID" runat="server" Visible="false"></asp:TextBox>
            <asp:TextBox ID="TxtMobile" runat="server" Visible="false"></asp:TextBox>
            <asp:TextBox ID="TxtImageID" runat="server" Visible="false"></asp:TextBox>
            <asp:TextBox ID="TextPK" runat="server" Visible="false"></asp:TextBox>
            
          
           
        </table>
        <div style="display: none">
            <asp:Button ID="BtnHid" runat="server" Width="20%" Text="保 存" CssClass="button" OnClick="BtnHid_Click" />
        </div>
        <div style="display: none">
            <asp:Button ID="BtnJS" runat="server" Width="20%" Text="保 存" CssClass="button" OnClick="BtnJS_Click" />
        </div>
         
    </form>
   
</body>
</html>
