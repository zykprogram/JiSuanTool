<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ylcb.aspx.cs" Inherits="WebApp.cg.ylcb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta content="initial-scale=1.0,maximum-scale=2,minimum-scale=1,width=device-width" name="viewport" />

    <title>原料比价工具</title>
    <style type="text/css">
        table {
            width: 98%;
            text-align: left;
            border: 1px solid #757575;
        }
        tr {
            width: 100%;
        }

        td {
            width: 50%;
            border: 1px solid #757575;
            height: 30px;
        }

        input {
            width: 90%;
        }


        .radiotable td {
            text-align: center;
            border: 0px;
            width: 60px;
        }

        .auto-style1 {
            width: 400px;
            height: 30px;
        }

        .auto-style2 {
            width: 60px;
        }
        .s_center {
        width: auto;
         height:100%;
        padding: 0 34%;
        margin: 0;
        font-size: 20px;
        color:blue;
        }
        .s_center option{
        text-align: center;
       
      
        }

    </style>
    <script language="JavaScript" type="text/javascript">


        /*********************************************
        功能: 通用DIV切换函数
        参数: divID --当前DIV的ID号；divName --要改变的这一组DIV的命名前缀；zDivCount --这一组DIV的个数-1
        
        *********************************************/
        
        function divChange(type) {
            if(type==1){
                document.getElementById("Numb1").style.display = "none";
                document.getElementById("Numb2").style.display = "none";
                document.getElementById("Numb3").style.display = "block";
                    countValue_x();//双小             
                    countValue_z();//双中
                    countValue_y();//怀孕                       
                    document.getElementById("txtNum").value = "<%=addBUM()%>";//统计访问量
            } else if (type == 2) {
                document.getElementById("Numb1").style.display = "block";
                document.getElementById("Numb2").style.display = "block";
                document.getElementById("Numb3").style.display = "none";
            
                
            }
          else {
                alert("不明确操作，请联系系统管理员");
            }
            
        }
        function countValue_x() {
            for (var i = 1; i <= document.getElementById("cgylCount").value ; i++) {
                var xzsyj = document.getElementById("txtym" + i).value * document.getElementById("TextYL1").value +
               document.getElementById("txt43dp" + i).value * document.getElementById("TextYL2").value +
               document.getElementById("txtdy" + i).value * document.getElementById("TextYL3").value +
               document.getElementById("txtlaias" + i).value * document.getElementById("TextYL4").value +
               document.getElementById("txtdanas" + i).value * document.getElementById("TextYL5").value +
               document.getElementById("txtsuas" + i).value * document.getElementById("TextYL6").value +
               document.getElementById("txtseas" + i).value * document.getElementById("TextYL7").value +
               document.getElementById("txtsf" + i).value * document.getElementById("TextYL8").value +
               document.getElementById("txtlsqg" + i).value * document.getElementById("TextYL9").value;
               // if (i ==1) {
                    var js = (xzsyj - document.getElementById("TextLB"+i).value) * 10 * document.getElementById("txtsxbl" + i).value;
                    if (document.getElementById("TextLB" + i).value > 0) {
                        document.getElementById("spanSXJG" + i).innerText = js.toFixed(1);
                        //document.getElementById("jg" + i).style.display = "block";
                    } else {
                        document.getElementById("SXjg"+i).style.display = "none";
                    }
            }
        }

        function countValue_z() {
            for (var i = 1; i <= document.getElementById("cgylCount").value ; i++) {
                var xzsyj = document.getElementById("txtymz" + i).value * document.getElementById("TextYL1").value +
               document.getElementById("txt43dpz" + i).value * document.getElementById("TextYL2").value +
               document.getElementById("txtdyz" + i).value * document.getElementById("TextYL3").value +
               document.getElementById("txtlaiasz" + i).value * document.getElementById("TextYL4").value +
               document.getElementById("txtdanasz" + i).value * document.getElementById("TextYL5").value +
               document.getElementById("txtsuasz" + i).value * document.getElementById("TextYL6").value +
               document.getElementById("txtseasz" + i).value * document.getElementById("TextYL7").value +
               document.getElementById("txtsfz" + i).value * document.getElementById("TextYL8").value +
               document.getElementById("txtlsqgz" + i).value * document.getElementById("TextYL9").value;
                // if (i ==1) {
                var js = (xzsyj - document.getElementById("TextLB" + i).value) * 10 * document.getElementById("txtsxblz" + i).value;
                if (document.getElementById("TextLB" + i).value > 0) {
                    document.getElementById("spanSZJG" + i).innerText = js.toFixed(1);
                    //document.getElementById("jg" + i).style.display = "block";
                } 
                //else {
                //    document.getElementById("SZjg" + i).style.display = "none";
                //}
            }
        }

        function countValue_y() {
            for (var i = 1; i <= document.getElementById("cgylCount").value ; i++) {
                var xzsyj = document.getElementById("txtymy" + i).value * document.getElementById("TextYL1").value +
               document.getElementById("txt43dpy" + i).value * document.getElementById("TextYL2").value +
               document.getElementById("txtdyy" + i).value * document.getElementById("TextYL3").value +
               document.getElementById("txtlaiasy" + i).value * document.getElementById("TextYL4").value +
               document.getElementById("txtdanasy" + i).value * document.getElementById("TextYL5").value +
               document.getElementById("txtsuasy" + i).value * document.getElementById("TextYL6").value +
               document.getElementById("txtseasy" + i).value * document.getElementById("TextYL7").value +
               document.getElementById("txtsfy" + i).value * document.getElementById("TextYL8").value +
               document.getElementById("txtlsqgy" + i).value * document.getElementById("TextYL9").value;
                // if (i ==1) {
                var js = (xzsyj - document.getElementById("TextLB" + i).value) * 10 * document.getElementById("txtsxbly" + i).value;
                if (document.getElementById("TextLB" + i).value > 0) {
                    document.getElementById("spanHYJG" + i).innerText = js.toFixed(1);
                    //document.getElementById("jg" + i).style.display = "block";
                }
                //else {
                //    document.getElementById("HYjg" + i).style.display = "none";
                //}
            }
        }
 
           
            
       

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input id="txtNum" style="display:none;">
           <div style="display:none" id="form1Table" >
                <table width="98%" align="center" border="0" cellpadding="0" cellspacing="1" id="tableList">
                     <tr>
                        <th align="center" bgcolor="#ffffff" style="width: 2%;display:none; background: #ddd;">序号</th>
                        <th align="center" bgcolor="#ffffff" style="width: 4%; background: #ddd;word-break:break-all">原料</th>
                        <th align="center" bgcolor="#ffffff" style="width: 3%; background: #ddd;word-break:break-all">玉米%</th>
                        <th align="center" bgcolor="#ffffff" style="width: 8%; background: #ddd;word-break:break-all">43豆粕%</th>
                        <th align="center" bgcolor="#ffffff" style="width: 3%; background: #ddd;word-break:break-all">豆油%</th>
                        <th align="center" bgcolor="#ffffff" style="width: 3%; background: #ddd;word-break:break-all">赖氨酸%</th>
                        <th align="center" bgcolor="#ffffff" style="width: 4%; background: #ddd;word-break:break-all">蛋氨酸%</th>
                        <th align="center" bgcolor="#ffffff" style="width: 6%; background: #ddd;word-break:break-all">苏氨酸%</th>
                        <th align="center" bgcolor="#ffffff" style="width: 4%; background: #ddd;word-break:break-all">色氨酸%</th>
                        <th align="center" bgcolor="#ffffff" style="width: 2%; background: #ddd;word-break:break-all">石粉</th>
                        <th align="center" bgcolor="#ffffff" style="width: 2%; background: #ddd;word-break:break-all">磷酸氢钙</th>      
                         <th align="center" bgcolor="#ffffff" style="width: 2%; background: #ddd;word-break:break-all">上限比例</th>              
                    </tr>
                    <asp:Repeater ID="rptZJList" runat="server">
                        <ItemTemplate>
                            <tr onmouseover="this.className='selectColor'" onmouseout="this.className=''">
                                <td align="center" style="width: 2%;display:none; text-align: center;"><%#Container.ItemIndex + 1 %></td>
                                <td align="center" style="width: 4%; text-align: center;word-break:break-all"><%#Eval("MATERIAL_NAME") %> <input type="hidden" id="txtname<%#Container.ItemIndex + 1 %>" value='<%#Eval("MATERIAL_NAME") %>' /></td>
                                <td align="center" style="width: 3%; text-align: center;word-break:break-all"><%#Eval("RAITO_YM") %><input type="hidden" id="txtym<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_YM") %>' /></td>
                                <td align="center" style="width: 8%; text-align: center;word-break:break-all"><%#Eval("RAITO_43DP") %><input type="hidden" id="txt43dp<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_43DP") %>' /></td>
                                <td align="center" style="width: 3%; text-align: center;word-break:break-all"><%#Eval("RAITO_DY") %><input type="hidden" id="txtdy<%#Container.ItemIndex + 1 %>"value='<%#Eval("RAITO_DY") %>' /></td>
                                <td align="center" style="width: 3%; text-align: center;word-break:break-all"><%#Eval("RAITO_LAIAS") %><input type="hidden" id="txtlaias<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_LAIAS") %>' /></td>
                                <td align="center" style="width: 4%; text-align: center;word-break:break-all"><%#Eval("RAITO_DANAS") %><input type="hidden" id="txtdanas<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_DANAS") %>' /></td>
                                <td align="center" style="width: 6%; text-align: center;word-break:break-all"><%#Eval("RAITO_SUAS") %><input type="hidden" id="txtsuas<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_SUAS") %>' /></td>
                                <td align="center" style="width: 4%; text-align: center;word-break:break-all"><%#Eval("RAITO_SEAS") %><input type="hidden" id="txtseas<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_SEAS") %>' /></td>
                                <td align="center" style="width: 2%; text-align: center;word-break:break-all"><%#Eval("RAITO_SF") %><input type="hidden" id="txtsf<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_SF") %>' /></td>
                                <td align="center" style="width: 2%; text-align: center;word-break:break-all"><%#Eval("RAITO_LSQG") %><input type="hidden" id="txtlsqg<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_LSQG") %>' /></td>                            
                                <td align="center" style="width: 2%; text-align: center;word-break:break-all"><%#Eval("RAITO_SXBL") %><input type="hidden" id="txtsxbl<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_SXBL") %>' /></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:Repeater ID="rptZJList_Z" runat="server">
                        <ItemTemplate>
                            <tr onmouseover="this.className='selectColor'" onmouseout="this.className=''">
                                <td align="center" style="width: 2%;display:none; text-align: center;"><%#Container.ItemIndex + 1 %></td>
                                <td align="center" style="width: 4%; text-align: center;word-break:break-all"><%#Eval("MATERIAL_NAME") %> <input type="hidden" id="txtnamez<%#Container.ItemIndex + 1 %>" value='<%#Eval("MATERIAL_NAME") %>' /></td>
                                <td align="center" style="width: 3%; text-align: center;word-break:break-all"><%#Eval("RAITO_YM") %><input type="hidden" id="txtymz<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_YM") %>' /></td>
                                <td align="center" style="width: 8%; text-align: center;word-break:break-all"><%#Eval("RAITO_43DP") %><input type="hidden" id="txt43dpz<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_43DP") %>' /></td>
                                <td align="center" style="width: 3%; text-align: center;word-break:break-all"><%#Eval("RAITO_DY") %><input type="hidden" id="txtdyz<%#Container.ItemIndex + 1 %>"value='<%#Eval("RAITO_DY") %>' /></td>
                                <td align="center" style="width: 3%; text-align: center;word-break:break-all"><%#Eval("RAITO_LAIAS") %><input type="hidden" id="txtlaiasz<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_LAIAS") %>' /></td>
                                <td align="center" style="width: 4%; text-align: center;word-break:break-all"><%#Eval("RAITO_DANAS") %><input type="hidden" id="txtdanasz<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_DANAS") %>' /></td>
                                <td align="center" style="width: 6%; text-align: center;word-break:break-all"><%#Eval("RAITO_SUAS") %><input type="hidden" id="txtsuasz<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_SUAS") %>' /></td>
                                <td align="center" style="width: 4%; text-align: center;word-break:break-all"><%#Eval("RAITO_SEAS") %><input type="hidden" id="txtseasz<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_SEAS") %>' /></td>
                                <td align="center" style="width: 2%; text-align: center;word-break:break-all"><%#Eval("RAITO_SF") %><input type="hidden" id="txtsfz<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_SF") %>' /></td>
                                <td align="center" style="width: 2%; text-align: center;word-break:break-all"><%#Eval("RAITO_LSQG") %><input type="hidden" id="txtlsqgz<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_LSQG") %>' /></td>                            
                                <td align="center" style="width: 2%; text-align: center;word-break:break-all"><%#Eval("RAITO_SXBL") %><input type="hidden" id="txtsxblz<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_SXBL") %>' /></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:Repeater ID="rptZJList_Y" runat="server">
                        <ItemTemplate>
                            <tr onmouseover="this.className='selectColor'" onmouseout="this.className=''">
                                <td align="center" style="width: 2%;display:none; text-align: center;"><%#Container.ItemIndex + 1 %></td>
                                <td align="center" style="width: 4%; text-align: center;word-break:break-all"><%#Eval("MATERIAL_NAME") %> <input type="hidden" id="txtnamey<%#Container.ItemIndex + 1 %>" value='<%#Eval("MATERIAL_NAME") %>' /></td>
                                <td align="center" style="width: 3%; text-align: center;word-break:break-all"><%#Eval("RAITO_YM") %><input type="hidden" id="txtymy<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_YM") %>' /></td>
                                <td align="center" style="width: 8%; text-align: center;word-break:break-all"><%#Eval("RAITO_43DP") %><input type="hidden" id="txt43dpy<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_43DP") %>' /></td>
                                <td align="center" style="width: 3%; text-align: center;word-break:break-all"><%#Eval("RAITO_DY") %><input type="hidden" id="txtdyy<%#Container.ItemIndex + 1 %>"value='<%#Eval("RAITO_DY") %>' /></td>
                                <td align="center" style="width: 3%; text-align: center;word-break:break-all"><%#Eval("RAITO_LAIAS") %><input type="hidden" id="txtlaiasy<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_LAIAS") %>' /></td>
                                <td align="center" style="width: 4%; text-align: center;word-break:break-all"><%#Eval("RAITO_DANAS") %><input type="hidden" id="txtdanasy<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_DANAS") %>' /></td>
                                <td align="center" style="width: 6%; text-align: center;word-break:break-all"><%#Eval("RAITO_SUAS") %><input type="hidden" id="txtsuasy<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_SUAS") %>' /></td>
                                <td align="center" style="width: 4%; text-align: center;word-break:break-all"><%#Eval("RAITO_SEAS") %><input type="hidden" id="txtseasy<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_SEAS") %>' /></td>
                                <td align="center" style="width: 2%; text-align: center;word-break:break-all"><%#Eval("RAITO_SF") %><input type="hidden" id="txtsfy<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_SF") %>' /></td>
                                <td align="center" style="width: 2%; text-align: center;word-break:break-all"><%#Eval("RAITO_LSQG") %><input type="hidden" id="txtlsqgy<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_LSQG") %>' /></td>                            
                                <td align="center" style="width: 2%; text-align: center;word-break:break-all"><%#Eval("RAITO_SXBL") %><input type="hidden" id="txtsxbly<%#Container.ItemIndex + 1 %>" value='<%#Eval("RAITO_SXBL") %>' /></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>

         <div id="Numb1" style="display: block; text-align: center">
            <table style="text-align: center; border: 1px solid Red;" align="center">
                 <tr>
                    
                    <td colspan="2" style="color: blue; font-size: 25px; text-align: center">
                        <input  type="button" value="计 算"  style="color: blue; font-weight:600; font-size: 20px; text-align: center;width:100%"  onclick="divChange(1);" /> 
                       
                         </td>                
                </tr>
                
                <tr>
                    <td colspan="2" style=" font-size: 18px; text-align: center">
                        <strong>原料价格</strong>   
                    </td>                
                </tr>
                <tr>
                    <td style="text-align: center">原料</td>
                   
                    <td style="text-align: center">价格(元/Kg)</td>

                </tr>
                <asp:Literal ID="LiteralYLJG" runat="server"></asp:Literal>  
        
            </table>
        </div>

         <div id="Numb2" style="display: block; text-align: center">
            <table style="text-align: center; border: 1px solid Red;" align="center">
               <%--   <tr>
                    <td colspan="2" style="color: blue; font-size: 25px; text-align: center">
                        <input  type="button" value="计 算" onclick="divChange(2);" style="color: blue; font-size: 25px; text-align: center"/> 
                    </td>                
                </tr>--%>
                <tr>
                    
                    <td colspan="2" style=" font-size: 18px; text-align: center"><strong>原料采购价格</strong>  <input style="display:none" runat="server" type="text" id="cgylCount"/> 
                    </td>                
                </tr>
                <tr>
                    <td style="text-align: center">原料</td>
                   
                    <td style="text-align: center">价格(元/Kg)</td>

                </tr>

                <asp:Literal ID="litCGJG" runat="server"></asp:Literal>   
                      
                <tr>
                    <td colspan="2" style="color: red"><strong>所填数据保留小数点后两位既可</strong></td>
                </tr>
            </table>
        </div>

         <div id="Numb3"  style=" display:none; text-align: center;">
            <table style="text-align: center; border: 1px solid Red;" align="center">
                  <tr>
                    <td colspan="4" style="color: blue; font-size: 25px; text-align: center">
                        <input  type="button" value="重新计算" onclick="divChange(2);" style="font-weight:600; color: blue; font-size: 20px; text-align: center;width:100%"/> 
                    </td>                
                </tr>
                <tr>
                    <td colspan="4" style=" font-size: 18px; text-align: center"><strong>按配方使用上限测算可节约成本(元/吨)</strong> 
                    </td>                
                </tr>
                <tr>
                    <td style="font-size: 16px;text-align: center ;width: 25%;"><strong>原料</strong></td>
                   
                    <td style="font-size: 16px;text-align: center;width: 25%;"><strong>双小</strong></td>

                     <td style="font-size: 16px;text-align: center;width: 25%;"><strong>双中</strong></td>

                    <td style="font-size: 16px;text-align: center;width: 25%;"><strong>怀孕</strong></td>

                </tr>

                <asp:Literal ID="LiteralSXYS" runat="server"></asp:Literal>  

                 <tr>
                    <td colspan="4" style="color: red"><strong>结果只保留一位小数</strong></td>
                </tr>
                    
            </table>
            <%--  <table style="text-align: center; border: 1px solid Red;" align="center">
                 
                <tr>
                    <td style="font-size: 16px;text-align: center"><strong>原料</strong></td>
                   
                    <td style="font-size: 16px;text-align: center"><strong>双中优势(元/吨)</strong></td>

                </tr>

                <asp:Literal ID="LiteralSZYS" runat="server"></asp:Literal>  
       
               
            </table>
               <table style="text-align: center; border: 1px solid Red;" align="center">
                 
                <tr>
                    <td style="font-size: 16px;text-align: center"><strong>原料</strong></td>
                   
                    <td style="font-size: 16px;text-align: center"><strong>怀孕优势(元/吨)</strong></td>

                </tr>

                <asp:Literal ID="LiteralHYYS" runat="server"></asp:Literal>  
       
                <tr>
                    <td colspan="2" style="color: red"><strong>结果只保留一位小数</strong></td>
                </tr>
            </table>--%>
        </div>

    </form>
</body>
</html>
