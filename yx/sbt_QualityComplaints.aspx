<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sbt_QualityComplaints.aspx.cs" Inherits="WebApp.yx.sbt_QualityComplaints" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta name="MobileOptimized" content="240" />
    <meta name="viewport" content="width=device-width,target-densitydpi=high-dpi, user-scalable=no" />
    <title></title>

    <style type="text/css">
        td {
            border: 1px solid #757575;
            font-size: 15px;
            text-align: center;
        }

        input {
            text-align: center;
            width: 98%;
            margin-bottom: 0px;
        }

        text {
            text-align: center;
            width: 98%;
            height: 30px;
        }

        table {
            width: 98%;
            height: 98%;
            border: 1px solid #757575;
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
    </style>
    <script type="text/javascript">
        function checkMobile() {
            var sMobile = document.getElementById("TxtTel").value;
            if (!(/^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/.test(sMobile))) {
                alert("手机号码输入有误");
                document.getElementById("TxtTel").focus();
                document.getElementById("TxtTel").value = "";
                return false;
            }
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center; width: 98%; font-size: large">
            质量反馈表
        </div>
        <div>
            <input id="Txtusetcode" type="text" runat="server" readonly="true"  hidden="hidden"/>
        </div>
        <table>
            <tr>
                <td style="width: 33%"><strong>反馈人姓名：</strong></td>
                <td style="border: 0px; width: 67%">
                    <input id="TxtUsername" type="text" runat="server" readonly="true" /></td>
            </tr>
            <tr>
                <td><strong>所属营销部：</strong></td>
                <td>
                    <input id="TxtYXB" type="text" runat="server" readonly="true" /></td>
            </tr>
            <tr>
                <td><strong>反馈日期:</strong></td>
                <td>
                    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnableScriptGlobalization="true" ScriptMode="Release"></ajaxToolkit:ToolkitScriptManager>
                    <asp:TextBox ID="TxtKSRQ" runat="server" CssClass="XHX" autocomplete="off"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender CssClass="MyCalendar" Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="TxtKSRQ"></ajaxToolkit:CalendarExtender>
                     
                </td>
            </tr>

            <tr>
                <td><strong>信息类别:</strong></td>

                <td>
                    <asp:CheckBoxList ID="DropXXLB" runat="server" RepeatDirection="Horizontal" RepeatColumns="3" BorderStyle="None">
                        <asp:ListItem>拉稀</asp:ListItem>
                        <asp:ListItem>采食量</asp:ListItem>
                        <asp:ListItem>长势</asp:ListItem>
                        <asp:ListItem>皮毛</asp:ListItem>
                        <asp:ListItem>发霉</asp:ListItem>
                        <asp:ListItem>破包</asp:ListItem>
                        <asp:ListItem>过期料</asp:ListItem>
                        <asp:ListItem>含粉</asp:ListItem>
                        <asp:ListItem>其它</asp:ListItem>
                    </asp:CheckBoxList>
                  </td>
            </tr>
            <tr>
                <td><strong>客户类别:</strong></td>
                <td>

                    <select id="TxtTYPE" style="width: 98%; text-align: center" runat="server">
                        <option></option>
                        <option>直销</option>
                        <option>分销</option>


                    </select>
                </td>
            </tr>
            <tr>
                <td><strong>客户姓名:</strong></td>
                <td>
                    <input id="TxtCustname" type="text" runat="server" autocomplete="off" /></td>
            </tr>

            <tr>
                <td><strong>客户电话:</strong></td>
                <td>
                    <input id="TxtTel" type="text" runat="server" autocomplete="off" onchange="checkMobile()" /></td>
            </tr>

            <tr>
                <td colspan="2" style="text-align: left"><strong>具体情况描述:</strong></td>
            </tr>
            <tr>
                <td colspan="2">
                    <textarea id="TxtMemo" cols="20" name="S1" rows="5" runat="server" style="width: 98%"></textarea></td>
            </tr>
        </table>
        <div>
            <asp:Button ID="Button1" runat="server" Text="提交反馈意见" Font-Size="Larger" OnClick="Button1_Click" />
        </div>
        <div>
            <input id="TxtSuss" type="text" runat="server" style="font-size: larger; color: red; text-align: center" />
        </div>
    </form>
</body>
</html>
