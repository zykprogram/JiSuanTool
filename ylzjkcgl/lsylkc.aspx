<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lsylkc.aspx.cs" Inherits="WebApp.ylzjkcgl.lsylkc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <meta content="initial-scale=1.0,maximum-scale=2,minimum-scale=1,width=device-width" name="viewport" />
    
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
        #tableList th {
        padding:5px 0;
        border:1px solid #a1bad8;
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
	        width: 84px;
	        height: 25px;
	        padding-top: 4px;
	        margin: 0;
	        border: solid 1px #f1ad6c;
	        background-color: #f9efcb;
        }
      
    </style>
    <script type="text/javascript">
        //校验填报数据
        function checkValue() {
            document.getElementById("hidNewDt").value = "";
            for (var i = 1; i <= document.getElementsByName("totilCount").length; i++) {
             
                if (i != 1) {
                    document.getElementById("hidNewDt").value += ";";
                }
                document.getElementById("hidNewDt").value += document.getElementById("txtpc" + i).value;
                document.getElementById("hidNewDt").value += ",";
              //  document.getElementById("hidNewDt").value += document.getElementById("txtjrkc" + i).value;
              //  document.getElementById("hidNewDt").value += ",";
                if (document.getElementById("gbbz" + i).checked == true || document.getElementById("gbbz" + i).checked == "checked") {
                    document.getElementById("hidNewDt").value += "0";//选中后 打开后台标志为0
                }
                else {
                    document.getElementById("hidNewDt").value += "1";//未选 关闭后台标志为1
                }

            }
            return true;
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

       </script>
</head>
<body>
      <form id="form1" runat="server">
          <div class="buttonLine">
              <table width="98%" align="center" border="0" cellpadding="5" cellspacing="1">
                  <tr>
                      <td style="font-size: 16px;">
                            <a id="closeMate" href="dqylkc.aspx?wllx=<%=chose_wllx%>" ><<<返回当前原料</a> 
                      </td>
                       <td style="font-size: 16px;">
                            <a id="corpname" ><asp:Literal ID="gcmcLit" runat="server"></asp:Literal></a> 
                      </td>
                       <td align="right">
                            <asp:Button class="btnSave"  ID="btnUpdate" runat="server" Text="保存" OnClick="btnUpdate_Click" OnClientClick="return checkValue()" />
                       </td>
                  </tr>
             </table>
        </div>
                             
     <%--   <div style="overflow-y:scroll; overflow-x:hidden; height: auto; width: 100%; float: left;">
            <table width="98%" align="center" border="0" cellpadding="5" cellspacing="1" bgcolor="#ffffff" style="font-size: 12px;">
                <tr>
                    <th align="center" bgcolor="#ffffff" style="width: 2%;display:none; background: #ddd;">序号</th>
                    <th align="center" bgcolor="#ffffff" style="width: 4%; background: #ddd;word-break:break-all">批次</th>
                    <th align="center" bgcolor="#ffffff" style="width: 4%; background: #ddd;word-break:break-all">原料</th>
                    <th align="center" bgcolor="#ffffff" style="width: 10%; background: #ddd;word-break:break-all">指标信息</th>
                    <th align="center" bgcolor="#ffffff" style="width: 4%; background: #ddd;word-break:break-all">昨日库存</th>
                    <th align="center" bgcolor="#ffffff" style="width: 4%; background: #ddd;word-break:break-all">今日库存</th>
                    <th align="center" bgcolor="#ffffff" style="width: 2%; background: #ddd;word-break:break-all">库号</th>
                    <th align="center" bgcolor="#ffffff" style="width: 4%; background: #ddd;word-break:break-all">生产品种</th>
                    <th align="center" bgcolor="#ffffff" style="width: 4%; background: #ddd;word-break:break-all">配方版本</th>
                    <th align="center" bgcolor="#ffffff" style="width: 3%; background: #ddd;word-break:break-all">打开</th>
                    
                </tr>
            </table>
        </div>--%>
  <div id="form1Table" >
            <table width="98%" align="center" border="0" cellpadding="0" cellspacing="1" id="tableList">
                 <tr>
                    <th align="center" bgcolor="#ffffff" style="width: 2%;display:none; background: #ddd;">序号</th>
                    <th align="center" bgcolor="#ffffff" style="width: 4%; background: #ddd;word-break:break-all">批次</th>
                    <th align="center" bgcolor="#ffffff" style="width: 3%; background: #ddd;word-break:break-all">原料</th>
                    <th align="center" bgcolor="#ffffff" style="width: 8%; background: #ddd;word-break:break-all">指标信息</th>
                    <th align="center" bgcolor="#ffffff" style="width: 3%; background: #ddd;word-break:break-all">昨日库存</th>
                    <th align="center" bgcolor="#ffffff" style="width: 3%; background: #ddd;word-break:break-all">今日库存</th>
                    <th align="center" bgcolor="#ffffff" style="width: 4%; background: #ddd;word-break:break-all">库号</th>
                    <th align="center" bgcolor="#ffffff" style="width: 6%; background: #ddd;word-break:break-all">生产品种</th>
                    <th align="center" bgcolor="#ffffff" style="width: 4%;display:none; background: #ddd;word-break:break-all">配方版本</th>
                    <th align="center" bgcolor="#ffffff" style="width: 2%; background: #ddd;word-break:break-all">打开</th>
                    
                </tr>
                <asp:Repeater ID="rptZJList" runat="server">
                    <ItemTemplate>
                        <tr onmouseover="this.className='selectColor'" onmouseout="this.className=''">
                            <td align="center" style="width: 2%;display:none; text-align: center;"><%#Container.ItemIndex + 1 %></td>
                            <td align="center" style="width: 4%; text-align: center;word-break:break-all"><%#Eval("pc") %> <input type="hidden" name="totilCount" id="txtpc<%#Container.ItemIndex + 1 %>" value='<%#Eval("pc") %>' /></td>
                            <td align="center" style="width: 3%; text-align: center;word-break:break-all"><%#Eval("yl") %></td>
                            <td align="center" style="width: 8%; text-align: center;word-break:break-all"><%#Eval("zbxx") %></td>
                            <td align="center" style="width: 3%; text-align: center;word-break:break-all"><%#Eval("zrkc") %></td>
                            <td align="center" style="width: 3%; text-align: center;word-break:break-all"><%#Eval("jrkc") %></td>
                            <td align="center" style="width: 4%; text-align: center;word-break:break-all"><%#Eval("kh") %></td>
                            <td align="center" style="width: 6%; text-align: center;word-break:break-all"><%#Eval("scpz") %></td>
                            <td align="center" style="width: 4%; text-align: center;display:none; word-break:break-all"><%#Eval("pfbb") %></td>
                            <td align="center" style="width: 2%; text-align: center;word-break:break-all">
                                <input type="checkbox"  id='gbbz<%#Container.ItemIndex + 1 %>' style=" text-align: center;" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
          <input type="hidden" runat="server" id="hidNewDt" />
    </form>
</body>
</html>
