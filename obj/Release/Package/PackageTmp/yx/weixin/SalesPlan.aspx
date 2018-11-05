<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalesPlan.aspx.cs" Inherits="WebApp.yx.weixin.SalesPlan" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta content="initial-scale=1.0,maximum-scale=2,minimum-scale=1,width=device-width" name="viewport" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="../js/prototype.js" type="text/javascript"></script>
    
    <title>经销商提货计划</title>
    <style>
       table td {
            font-size: 12px;
        }

        body {
            font-size: 12px;
            color: #2E4B5D;
        }

        .selectColor {
            background-color: #b0d4ea;
        }

        #tableList {
            table-layout: fixed;
            empty-cells: show;
            border-collapse: collapse;
            background-color: #fff;
        }

        #tableList td {
            border-bottom: solid 1px #a1bad8;
            border-right: solid 1px #a1bad8;
            border-left: solid 1px #a1bad8;
            padding-left: 5px;
            padding-right: 5px;
            text-align: left;
            height: 24px;
            overflow: hidden;
            text-overflow: ellipsis;
        }
     
        #closeMate {
             text-align: left;
        }
        .btnSave
        {
	        font-size: 12px;
	        color: #003366;
	        width: 50px;
	        height: 22px;
	        padding-top: 4px;
	        margin: 0;
	        border: solid 1px #f1ad6c;
	        background-color: #f9efcb;
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
        function checkValue() {
            document.getElementById("hidNewDt").value = "";
            var j = 1;
            for (var i = 1; i <= document.getElementsByName("totilCount").length; i++) {
                if (document.getElementById("TextWLJBDA" + i).value == "") {
                    alert("读取物料基本信息失败，请联系系统管理员！");
                    return false;
                }
                if (document.getElementById("TextBS"+i).value > 0) {
                    if (j != 1) {
                        document.getElementById("hidNewDt").value += ";";
                    }
                    //document.getElementById("hidNewDt").value += document.getElementById("TextGCBH" + i).value;
                    //document.getElementById("hidNewDt").value += ",";
                    document.getElementById("hidNewDt").value += document.getElementById("TextKSZJ" + i).value;
                    document.getElementById("hidNewDt").value += ",";
                    document.getElementById("hidNewDt").value += document.getElementById("TextKSBH" + i).value;
                    document.getElementById("hidNewDt").value += ",";
                    document.getElementById("hidNewDt").value += document.getElementById("TextKSMC" + i).value;
                    document.getElementById("hidNewDt").value += ",";
                    document.getElementById("hidNewDt").value += document.getElementById("TextWLJBDA" + i).value;
                    document.getElementById("hidNewDt").value += ",";
                    document.getElementById("hidNewDt").value += document.getElementById("TextWLGLDA" + i).value;
                    document.getElementById("hidNewDt").value += ",";
                    //document.getElementById("hidNewDt").value += document.getElementById("TextTHGC" + i).value;
                    //document.getElementById("hidNewDt").value += ",";
                    document.getElementById("hidNewDt").value += document.getElementById("TextWL" + i).value;
                    document.getElementById("hidNewDt").value += ",";
                    document.getElementById("hidNewDt").value += document.getElementById("TextBS" + i).value;
                    document.getElementById("hidNewDt").value += ",";
                    document.getElementById("hidNewDt").value += document.getElementById("TextUNTWT" + i).value;
                    //document.getElementById("hidNewDt").value += ",";
                    //document.getElementById("hidNewDt").value += document.getElementById("TextTHRQ" + i).value;                  
                    j++;
                }
            }
            return true;
        }
        //校验业务逻辑
        function isvalid(currowixd) {
            var cont = 0;
            for (var i = 1; i <= document.getElementsByName('totilCount').length; i++) {
                if (document.getElementById("TextBS" + i).value != "" && document.getElementById("TextBS" + i).value > 0) {
                    cont = cont + 1;
                    if (cont > 5) {
                        document.getElementById("TextBS" + currowixd).value = "";
                        alert("应NC订单要求,每个计划最多只能预订5个料型！");
                        return;
                    }
                }
            }
            IsSameStorname(currowixd);
        }
        ///校验属于同一仓库
        var Storname = "";
        function IsSameStorname(curRow) { //控制开单物料在同一工厂逻辑
            if (document.getElementById("TextBS" + curRow).value == 0 || document.getElementById("TextBS" + curRow).value == "") {
                for (var i = 1; i <= document.getElementsByName("totilCount").length; i++) {
                    if (document.getElementById("TextBS" + i).value >0) {
                        Storname = document.getElementById("TxtTHCK" + i).value;
                        break;
                    }
                    if (i == document.getElementsByName("totilCount").length) {
                        Storname = "";
                    }
                }
            }
            else {
                if (Storname != "" && Storname != document.getElementById("TxtTHCK" + curRow).value) {
                    document.getElementById("TextBS" + curRow).value = "";
                    alert("所选商品应属于同一仓库，不同仓库的商品应分开下单！");
                    return;
                }
                else {
                    Storname = document.getElementById("TxtTHCK" + curRow).value;
                }
            }
        }
        //今日库存数字校验
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
        //提货日期逻辑控制 
        function clearNoNumDate() {
            var param = "taget=xsjh&thrq=" + document.getElementById("TextTHRQ").value;
            var options = {
                method: 'post',
                parameters: param,
                asynchronous: false, //同步
                onComplete: confirmContent
            }
            new Ajax.Request('/Handler/Ajax.aspx', options);            
        }
        function confirmContent(request) {
            var backText = request.responseText;
                document.getElementById("TextTHRQ").value = backText;
           
            
        }
        function setCaretAtEnd(field) {
            if (field.createTextRange) {
                var r = field.createTextRange();
                r.moveStart('character', field.value.length);
                r.collapse();
                r.select();
            }
        }
      
    </script>
</head>
<body>
      <form id="form1" runat="server">
          <div class="buttonLine">
              <table width="98%" align="center" border="0" cellpadding="5" cellspacing="1">
                  <tr>
                      <td style="font-size: 14px;">
                            <a id="GoBackIn" href="SalePlanList.aspx?usercode=<%=log_user%>&pk_corp=<%=DplTHGC.SelectedIndex ==0?"":DplTHGC.Items[DplTHGC.SelectedIndex].Value %>" ><<<返回列表</a> 
                      </td>
                      <td style="font-size: 12px;">
                        <span >提货工厂:</span>  
                          <select Width="90" id="DplTHGC" name="DplTHGC" runat="server" onchange="javascript:document.getElementById('hidRefre').click();"  />
                          <asp:Button runat="server" id="hidRefre" style="display:none;"  OnClick="hidRefre_Click" />
                         <%-- <asp:DropDownList Width="90" ID="DplTHGC" runat="server" OnSelectedIndexChanged="DplTHGC_Changed" AutoPostBack="true"></asp:DropDownList>--%>
                      </td>
                       <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnableScriptGlobalization="true" ScriptMode="Release"></ajaxToolkit:ToolkitScriptManager>
                      <td style="font-size: 12px;">
                          <span >提货日期:</span>
                          <asp:TextBox ID="TextTHRQ" Width="80" runat="server" onblur="clearNoNumDate()" ></asp:TextBox>
                          <ajaxToolkit:CalendarExtender CssClass="MyCalendar" Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="TextTHRQ"></ajaxToolkit:CalendarExtender>
                      </td>
                       <td align="right">
                           
                            <asp:Button class="btnSave"  ID="btnUpdate" runat="server" Text="提交" OnClick="btnUpdate_Click" OnClientClick="return checkValue()" />
                       </td>
                  </tr>
             </table>
        </div>
                        
              
        <div style="overflow-y:scroll; overflow-x:hidden; height: auto; width: 100%; float: left;">
            <table width="98%" align="center" border="0" cellpadding="5" cellspacing="1" bgcolor="#ffffff" style="font-size: 12px;">
                <tr>
                    <th align="center" bgcolor="#ffffff" style="width: 4%;display:none; background: #ddd;">序号</th>

                   <%-- <th align="center" bgcolor="#ffffff" style="width: 8%; background: #ddd;display:none;">工厂编号</th>--%>
                    <th align="center" bgcolor="#ffffff" style="width: 8%; background: #ddd;display:none;">客商主键</th>
                    <th align="center" bgcolor="#ffffff" style="width: 8%; background: #ddd;display:none;">客商编号</th>
                    <th align="center" bgcolor="#ffffff" style="width: 8%; background: #ddd;display:none;">客商名称</th>
                    <th align="center" bgcolor="#ffffff" style="width: 8%; background: #ddd;display:none;">物料基本档案</th>
                    <th align="center" bgcolor="#ffffff" style="width: 8%; background: #ddd;display:none;">物料管理档案</th>
                    <th align="center" bgcolor="#ffffff" style="width: 8%; background: #ddd;display:none;">物料包公斤数</th>

                    <%--<th align="center" bgcolor="#ffffff" style="width: 4%; background: #ddd;">提货工厂</th>--%>
                    <th align="center" bgcolor="#ffffff" style="width: 8%; background: #ddd;">物料</th>
                    <th align="center" bgcolor="#ffffff" style="width: 4%; background: #ddd;">预订数量(包)</th>
                   <%-- <th align="center" bgcolor="#ffffff" style="width: 4%; background: #ddd;">提货日期</th>  --%>
                    <th align="center" bgcolor="#ffffff" style="width: 4%; background: #ddd;">提货仓库</th>     
                   
                    
                </tr>
            </table>
        </div>
  <div id="form1Table" style="overflow-y:scroll; overflow-x: hidden; height: 100%; width: 100%; float: left;">
            <table width="98%" align="center" border="0" cellpadding="0" cellspacing="1" id="tableList">
              
                <asp:Repeater ID="rptPlan" runat="server">
                    <ItemTemplate>
                        <tr onmouseover="this.className='selectColor'" onmouseout="this.className=''">
                            <td align="center" style="width: 4%;display:none; text-align: center;"><%#Container.ItemIndex + 1 %></td>

                             <%--<td align="center" style="width: 8%; text-align: center;display:none;"><input type="text" ID="TextGCBH<%#Container.ItemIndex + 1 %>" value="<%#Eval("gcbh") %>" ></td>--%>
                             <td align="center" style="width: 8%; text-align: center;display:none;"><input type="text" ID="TextKSZJ<%#Container.ItemIndex + 1 %>" value="<%#Eval("pk_cubasdoc") %>" ></td>
                             <td align="center" style="width: 8%; text-align: center;display:none;"><input type="text" ID="TextKSBH<%#Container.ItemIndex + 1 %>" value="<%#Eval("custcode") %>" ></td>
                             <td align="center" style="width: 8%; text-align: center;display:none;"><input type="text" ID="TextKSMC<%#Container.ItemIndex + 1 %>" value="<%#Eval("custname") %>" ></td>
                             <td align="center" style="width: 8%; text-align: center;display:none;"><input type="text" ID="TextWLJBDA<%#Container.ItemIndex + 1 %>" value="<%#Eval("pk_invbasdoc") %>" ></td>
                             <td align="center" style="width: 8%; text-align: center;display:none;"><input type="text" ID="TextWLGLDA<%#Container.ItemIndex + 1 %>" value="<%#Eval("pk_invmandoc") %>" ></td>
                             <td align="center" style="width: 8%; text-align: center;display:none;"><input type="text" ID="TextUNTWT<%#Container.ItemIndex + 1 %>" value="<%#Eval("unitweight") %>" ></td>

                            <%--<td align="center" style="width: 4%; text-align: center;"><input type="text" style="display:none" readonly="true"   ID="TextTHGC<%#Container.ItemIndex + 1 %>" value="<%#Eval("thgc")%>"/><%#Eval("thgc")%></td>--%>
                            <td align="center" style="width: 8%; text-align: center;"><input type="text" style="display:none" readonly="true"  name="totilCount" ID="TextWL<%#Container.ItemIndex + 1 %>" value="<%#Eval("wl") %>"/><%#Eval("wl")%></td>
                            <td align="center" style="width: 4%; text-align: center;padding:0;"><input type="text"  ID='TextBS<%#Container.ItemIndex + 1 %>'  onkeyup="clearNoNum(this)" onafterpaste="clearNoNum(this)" onblur='isvalid(<%#Container.ItemIndex + 1 %>);'/></td>
                           <%-- <td align="center" style="width: 4%; text-align: center;padding:0;">
                                                                
                                 <input type="text"  ID="TextTHRQ<%#Container.ItemIndex + 1 %>" value="<%#Eval("thrq")%>" onblur="clearNoNumDate(<%#Container.ItemIndex + 1 %>)" ONFOCUS="setCaretAtEnd(this)" />
                               
                            </td>--%>
                            <td align="center" style="width: 4%; text-align: center;"><input type="text" style="display:none" readonly="true"  ID="TxtTHCK<%#Container.ItemIndex + 1 %>" value="<%#Eval("storname")%>"/><%#Eval("storname")%></td>
                           
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
          <input type="hidden" runat="server" id="hidNewDt" />
    </form>
</body>
</html>
