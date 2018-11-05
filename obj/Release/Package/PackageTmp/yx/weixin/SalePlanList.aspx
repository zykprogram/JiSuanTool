<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalePlanList.aspx.cs" Inherits="WebApp.yx.weixin.SalePlanList" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta content="initial-scale=1.0,maximum-scale=2,minimum-scale=1,width=device-width" name="viewport" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title></title>
<style type="text/css">
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

.btnSave {
    font-size: 12px;
    color: #003366;
    width: 50px;
    height: 22px;
    padding-top: 4px;
    margin: 0;
    border: solid 1px #f1ad6c;
    background-color: #f9efcb;
}

.list p {
    padding: 5px 0;
    margin: 0;
    line-height: 20px;
    color: #666666;
    border-bottom: 1px solid #c9d6df;
    border-right: 1px solid #c9d6df;
    border-left: 1px solid #c9d6df;
}

.list span {
    float: left;
}

.list span a {
    text-decoration:none;
    color:#666;
}

.list span strong {
    font-weight:200;
    display: block;
}

.list span b {
    font-weight:200;
    color: #2E4B5D!important;
    display: block;
}

.list span input {
    width: 50px;
    text-align:center;
}

.tag {
line-height: 22px!important;
margin-top: 5px!important;
border-top: 1px solid #c9d6df !important;
border-right: 1px solid #c9d6df !important;
border-left: 1px solid #c9d6df !important;
background-color: #ddd;
}

.w4 {
width: 40%;
}

.w2 {
width: 20%;
}

.clear:after {
content: ''; /* content:'.';在底部或者最外层的话，会有多余空白出现 */
clear: both;
display: block;
height: 0;
line-height: 0;
visibility: hidden;
}

.clear {
*zoom: 1; /* for IE6 IE7 */
}

.hide {
display: none!important;
}
</style>
<script type="text/javascript">
    //校验填报数据
    function checkValue() {
        document.getElementById("hidNewDt").value = "";
        var j = 1;
        for (var i = 1; i <= document.getElementsByName("totilCount").length; i++) {
            if (document.getElementById("TextVPTCODE" + i).value==null||document.getElementById("TextVPTCODE" + i).value=="") {//是表体数据
            if (document.getElementById("TextBS" + i).value == "" || document.getElementById("TextBS" + i).value <= 0) {
                alert("请填报正确物料包数,输入合法的正整数！");
                return false;
            }
            if (j != 1) {
                document.getElementById("hidNewDt").value += ";";
            }
            document.getElementById("hidNewDt").value += document.getElementById("TextPK_BH_B" + i).value;
            document.getElementById("hidNewDt").value += ",";
            document.getElementById("hidNewDt").value += document.getElementById("TextBS" + i).value;
            document.getElementById("hidNewDt").value += ",";
            j++;
        }
        }
        return true;
    }
    //校验业务逻辑
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
    window.onload = function () {
        var obj = document.getElementsByTagName("p");
        var leng = obj.length;
        for (i = 0; i < leng; i++) {
            if (obj[i].getElementsByClassName("con")[0].textContent) {
                var bid = obj[i].className.replace('clear', '').trim();
                obj[i].className += " tag";
                obj[i].setAttribute('onclick', document.all && !document.documentMode ? eval(function () { show() }) : 'javascript:show("' + bid + '")');
                var obj_2 = obj[i].getElementsByTagName("span");
                var leng_2 = obj_2.length;
                for (j = 0; j < leng_2; j++) {
                    if (j <= 2) {
                        obj_2[j].className = obj_2[j].className.replace("hide", "");
                    } else {
                        obj_2[j].className = "hide";
                    }
                }
            } else {
                obj[i].style.display = 'none';
            }
        }
    }
    function show(a) {
        var obj = document.getElementsByClassName(a);
        var length = obj.length;
        for (j = 1; j < length; j++) {
            if (obj[j].style.display == 'block') {
                obj[j].style.display = 'none';
            }
            else {
                obj[j].style.display = 'block';
            }
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
                            <a id="GoBackIn" href="SalesPlan.aspx?usercode=<%=log_user%>" ><<<返回填报</a> 
                      </td>
                       <td align="right">
                            <asp:Button class="btnSave"  ID="btnUpdate" runat="server" Text="保存" OnClick="btnUpdate_Click" OnClientClick="return checkValue()" />
                       </td>
                  </tr>
             </table>
        </div>
            <div class="list">
                <asp:Repeater ID="rptPlanList" runat="server">
                    <ItemTemplate>
                        <p class="clear <%#Eval("PK_TMP_NC_XSJH") %> "  style="display:block;">
                            <input type="text" style="display:none" id="TextFLAG<%#Container.ItemIndex + 1 %>" value='<%#Eval("Flag") %>' />
                            <input type="text" style="display:none" id="TextPK_BH_B<%#Container.ItemIndex + 1 %>" value='<%#Eval("PK_BH") %>' />
                            <span class="vreceiptcode hide" style="width: 36%; text-align: center;"><b class="con" style="color: #0033CC"><input type="text" style="display:none" id="TextVPTCODE<%#Container.ItemIndex + 1 %>" value='<%#Eval("VRECEIPTCODE") %>' /><%#Eval("VRECEIPTCODE") %></b></span>
                            <span class="gcmc hide" style="width: 42%; text-align: center;"><b><%#Eval("GCMC") %></b></span>
                            <span class="thrq hide" style="text-align: center;width:20%;"><b><%#Eval("THRQ") %></b></span>
                            <span style="width: 36%; text-align: center;"><%#Eval("WL") %>&nbsp;</span>
                            <span style="width: 42%; text-align: center;padding:0;">
                                <input type="text" name="totilCount" id="TextBS<%#Container.ItemIndex + 1 %>" value='<%#Eval("BS") %>' onkeyup="clearNoNum(this)" onafterpaste="clearNoNum(this)" <%#Eval("Flag").ToString()=="1"?"disabled='disabled'":"" %>/>&nbsp;包
                            </span>                 
                            <span style="text-align: center;width:22%;">
                                <asp:LinkButton ID="lbtnDelete" CommandArgument='<%#Eval("PK_BH") %>' OnClientClick=" return confirm('确认要删除此提货计划吗？');" OnCommand="Delete_Command" runat="server" CssClass='<%#Eval("Flag").ToString()=="1"?"hide":"" %>' >删除</asp:LinkButton>
                                <b <%#Eval("Flag").ToString()=="0"?"class='hide'":"" %>>已审核</b>
                            </span>
                        </p>
                    </ItemTemplate>
                </asp:Repeater>
       <%--         <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <p class="clear <%#Eval("PK_TMP_NC_XSJH") %> "  style="display:block;">
                            <span class="vreceiptcode hide" style="width: 36%; text-align: center;"><b class="con" style="color: #0033CC"><%#Eval("VRECEIPTCODE") %></b><strong>物料</strong></span>
                            <span class="gcmc hide" style="width: 44%; text-align: center;"><b><%#Eval("GCMC") %></b><strong>包数</strong></span>
                            <span class="thrq hide" style="text-align: center;width:20%;"><b><%#Eval("THRQ") %></b><strong>操作</strong></span>
                            <span style="width: 36%; text-align: center;"><%#Eval("WL") %>&nbsp;</span>
                            <span style="width: 44%; text-align: center;padding:0;"><input type="text" name="totilCount"   id="TextBS<%#Container.ItemIndex + 1 %>" value='<%#Eval("BS") %>' onkeyup="clearNoNum(this)" onafterpaste="clearNoNum(this)"/></span>                 
                            <span style="text-align: center;width:20%;"><asp:LinkButton ID="lbtnDelete" CommandArgument='<%#Eval("PK_BH") %>' OnClientClick=" return confirm('确认要删除此提货计划吗？');" OnCommand="Delete_Command" runat="server">删除</asp:LinkButton></span>
                        </p>
                    </ItemTemplate>
                </asp:Repeater>--%>
            </div>
          <input type="hidden" runat="server" id="hidNewDt" />
    </form>
</body>
</html>
