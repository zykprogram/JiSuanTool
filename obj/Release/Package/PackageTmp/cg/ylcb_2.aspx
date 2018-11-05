<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ylcb_2.aspx.cs" Inherits="WebApp.cg.ylcb_2" %>

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
                countValue();
            } else if (type == 2) {
                document.getElementById("Numb1").style.display = "block";
                document.getElementById("Numb2").style.display = "block";
                document.getElementById("Numb3").style.display = "none";
                
            }
          else {
                alert("不明确操作，请联系系统管理员");
            }
            
        }
        function countValue() {
            for (var i = 1; i <= 20; i++) {
                var xzsyj = document.getElementById("txtym"+i).value * document.getElementById("TextYM").value +
               document.getElementById("txt43dp" + i).value * document.getElementById("Text43DP").value +
               document.getElementById("txtdy" + i).value * document.getElementById("TextDY").value +
               document.getElementById("txtlaias"+i).value * document.getElementById("TextLAIAS").value +
               document.getElementById("txtdanas"+i).value * document.getElementById("TextDANAS").value +
               document.getElementById("txtsuas"+i).value * document.getElementById("TextSUAS").value +
               document.getElementById("txtseas"+i).value * document.getElementById("TextSEAS").value +
               document.getElementById("txtsf"+i).value * document.getElementById("TextSF").value +
               document.getElementById("txtlsqg" + i).value * document.getElementById("TextLSQG").value;
                if (i ==1) {
                    var js = (xzsyj - document.getElementById("Text46DP").value) * 10 * document.getElementById("txtsxbl" + i).value;
                    if (document.getElementById("Text46DP").value > 0) {
                        document.getElementById("span46DP").innerText = js.toFixed(1);
                    } else {
                        document.getElementById("jg14").style.display = "none";
                    }
                } else if (i == 2) {
                    var js = (xzsyj - document.getElementById("TextDDGS").value) * 10 * document.getElementById("txtsxbl" + i).value;
                    if (document.getElementById("TextDDGS").value > 0) {
                        document.getElementById("spanDDGS").innerText = js.toFixed(1);
                    } else {
                        document.getElementById("jg13").style.display = "none";
                    }
                } else if (i == 3) {
                    var js = (xzsyj - document.getElementById("TextCP").value) * 10 * document.getElementById("txtsxbl" + i).value;
                    if (document.getElementById("TextCP").value > 0) {
                        document.getElementById("spanCP").innerText = js.toFixed(1);
                    } else {
                        document.getElementById("jg16").style.display = "none";
                    }                   
                } else if (i == 4) {
                    var js = (xzsyj - document.getElementById("TextCM").value) * 10 * document.getElementById("txtsxbl" + i).value;
                    if (document.getElementById("TextCM").value > 0) {
                        document.getElementById("spanCM").innerText = js.toFixed(1);
                    } else {
                        document.getElementById("jg10").style.display = "none";
                    }
                } else if (i == 5) {
                    var js = (xzsyj - document.getElementById("TextCDG").value) * 10 * document.getElementById("txtsxbl" + i).value;
                    if (document.getElementById("TextCDG").value > 0) {
                        document.getElementById("spanCDG").innerText = js.toFixed(1);
                    } else {
                        document.getElementById("jg9").style.display = "none";
                    }
                } else if (i == 6) {
                    var js = (xzsyj - document.getElementById("TextCF").value) * 10 * document.getElementById("txtsxbl" + i).value;
                    if (document.getElementById("TextCF").value > 0) {
                        document.getElementById("spanCF").innerText = js.toFixed(1);
                    } else {
                        document.getElementById("jg6").style.display = "none";
                    }
                } else if (i == 7) {
                    var js = (xzsyj - document.getElementById("TextDM").value) * 10 * document.getElementById("txtsxbl" + i).value;
                    if (document.getElementById("TextDM").value > 0) {
                        document.getElementById("spanDM").innerText = js.toFixed(1);
                    } else {
                        document.getElementById("jg2").style.display = "none";
                    }
                } else if (i == 8) {
                    var js = (xzsyj - document.getElementById("TextGL").value) * 10 * document.getElementById("txtsxbl" + i).value;
                    if (document.getElementById("TextGL").value > 0) {
                        document.getElementById("spanGL").innerText = js.toFixed(1);
                    } else {
                        document.getElementById("jg1").style.display = "none";
                    }
                } else if (i == 9) {
                    var js = (xzsyj - document.getElementById("TextHSP").value) * 10 * document.getElementById("txtsxbl" + i).value;
                    if (document.getElementById("TextHSP").value > 0) {
                        document.getElementById("spanHSP").innerText = js.toFixed(1);
                    } else {
                        document.getElementById("jg19").style.display = "none";
                    }
                } else if (i == 10) {
                    var js = (xzsyj - document.getElementById("TextKP").value) * 10 * document.getElementById("txtsxbl" + i).value;
                    if (document.getElementById("TextKP").value > 0) {
                        document.getElementById("spanKP").innerText = js.toFixed(1);
                    } else {
                        document.getElementById("jg4").style.display = "none";
                    }
                } else if (i == 11) {
                    var js = (xzsyj - document.getElementById("TextMPK").value) * 10 * document.getElementById("txtsxbl" + i).value;
                    if (document.getElementById("TextMPK").value > 0) {
                        document.getElementById("spanMPK").innerText = js.toFixed(1);
                    } else {
                        document.getElementById("jg3").style.display = "none";
                    }
                } else if (i == 12) {
                    var js = (xzsyj - document.getElementById("TextMP").value) * 10 * document.getElementById("txtsxbl" + i).value;
                    if (document.getElementById("TextMP").value > 0) {
                        document.getElementById("spanMP").innerText = js.toFixed(1);
                    } else {
                        document.getElementById("jg17").style.display = "none";
                    }
                } else if (i == 13) {
                    var js = (xzsyj - document.getElementById("TextPHDDF").value) * 10 * document.getElementById("txtsxbl" + i).value;
                    if (document.getElementById("TextPHDDF").value > 0) {
                        document.getElementById("spanPHDDF").innerText = js.toFixed(1);
                    } else {
                        document.getElementById("jg15").style.display = "none";
                    }
                } else if (i == 14) {
                    var js = (xzsyj - document.getElementById("TextSM").value) * 10 * document.getElementById("txtsxbl" + i).value;
                    if (document.getElementById("TextSM").value > 0) {
                        document.getElementById("spanSM").innerText = js.toFixed(1);
                    } else {
                        document.getElementById("jg11").style.display = "none";
                    }
                } else if (i == 15) {
                    var js = (xzsyj - document.getElementById("TextXM").value) * 10 * document.getElementById("txtsxbl" + i).value;
                    if (document.getElementById("TextXM").value > 0) {
                        document.getElementById("spanXM").innerText = js.toFixed(1);
                    } else {
                        document.getElementById("jg7").style.display = "none";
                    }
                } else if (i == 16) {
                    var js = (xzsyj - document.getElementById("TextYANM").value) * 10 * document.getElementById("txtsxbl" + i).value;
                    if (document.getElementById("TextYANM").value > 0) {
                        document.getElementById("spanYANM").innerText = js.toFixed(1);
                    } else {
                        document.getElementById("jg8").style.display = "none";
                    }
                } else if (i == 17) {
                    var js = (xzsyj - document.getElementById("TextYMDF").value) * 10 * document.getElementById("txtsxbl" + i).value;
                    if (document.getElementById("TextYMDF").value > 0) {
                        document.getElementById("spanYMDF").innerText = js.toFixed(1);
                    } else {
                        document.getElementById("jg12").style.display = "none";
                    }
                } else if (i == 18) {
                    var js = (xzsyj - document.getElementById("TextYMPYP").value) * 10 * document.getElementById("txtsxbl" + i).value;
                    if (document.getElementById("TextYMPYP").value > 0) {
                        document.getElementById("spanYMPYP").innerText = js.toFixed(1);
                    } else {
                        document.getElementById("jg20").style.display = "none";
                    }
                } else if (i == 19) {
                    var js = (xzsyj - document.getElementById("TextZGRP").value) * 10 * document.getElementById("txtsxbl" + i).value;
                    if (document.getElementById("TextZGRP").value > 0) {
                        document.getElementById("spanZGRP").innerText = js.toFixed(1);
                    } else {
                        document.getElementById("jg18").style.display = "none";
                    }
                } else if (i == 20) {
                    var js = (xzsyj - document.getElementById("TextFP").value) * 10 * document.getElementById("txtsxbl" + i).value;
                    if (document.getElementById("TextFP").value > 0) {
                        document.getElementById("spanFP").innerText = js.toFixed(1);
                    } else {
                        document.getElementById("jg5").style.display = "none";
                    }
                }
            }
            
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">

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
            </table>
        </div>

         <div id="Numb1" style="display: block; text-align: center">
            <table style="text-align: center; border: 1px solid Red;" align="center">
                 <tr>
                    <td colspan="2" style="color: blue; font-size: 25px; text-align: center">
                        <input  type="button" value="计 算" onclick="divChange(1);" style="color: blue; font-size: 25px; text-align: center"/> 
                    </td>                
                </tr>
                <tr>
                    <td colspan="2" style=" font-size: 20px; text-align: center"><strong>原料价格</strong>   
                    </td>                
                </tr>
                <tr>
                    <td style="text-align: center">原料</td>
                   
                    <td style="text-align: center">价格(元/Kg)</td>

                </tr>
                <tr>
                    <td style="text-align: center">玉米</td>
                    <td>
                        <input id="TextYM" type="text"  /></td>
                </tr>
                  <tr>
                    <td style="text-align: center">43豆粕</td>
                    <td>
                        <input id="Text43DP" type="text"  /></td>
                </tr>
                <tr style="display:none">
                    <td style="text-align: center">豆油</td>
                    <td>
                        <input id="TextDY" type="text" value="6.21" /></td>
                </tr>
                  <tr style="display:none">
                    <td style="text-align: center">赖氨酸（70%）</td>
                    <td>
                        <input id="TextLAIAS" type="text" value="4.8"  /></td>
                </tr>
                  <tr style="display:none">
                    <td style="text-align: center">蛋氨酸</td>
                    <td>
                        <input id="TextDANAS" type="text" value="22.5"  /></td>
                </tr>
                  <tr style="display:none">
                    <td style="text-align: center">苏氨酸</td>
                    <td>
                        <input id="TextSUAS" type="text" value="12" /></td>
                </tr>
                 <tr style="display:none">
                    <td style="text-align: center">色氨酸</td>
                    <td>
                        <input id="TextSEAS" type="text" value="71" /></td>
                </tr>
                 <tr style="display:none">
                    <td style="text-align: center">石粉</td>
                    <td>
                        <input id="TextSF" type="text" value="0.2"  /></td>
                </tr>
               
                 <tr style="display:none">
                    <td style="text-align: center">磷酸氢钙</td>
                    <td>
                        <input id="TextLSQG" type="text" value="1.8" /></td>
                </tr>    
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
                    <td colspan="2" style=" font-size: 20px; text-align: center"><strong>原料采购价格</strong>   
                    </td>                
                </tr>
                <tr>
                    <td style="text-align: center">原料</td>
                   
                    <td style="text-align: center">价格(元/Kg)</td>

                </tr>
                  <tr id="xs1">
                    <td style="text-align: center">高粱</td>
                    <td>
                        <input id="TextGL" type="text"  /></td>
                </tr >
                  <tr id="xs2">
                    <td style="text-align: center">大麦</td>
                    <td>
                        <input id="TextDM" type="text"  /></td>
                </tr>
                  <tr id="xs3">
                    <td style="text-align: center">米皮糠</td>
                    <td>
                        <input id="TextMPK" type="text" /></td>
                </tr>
                  <tr id="xs4">
                    <td style="text-align: center">糠粕</td>
                    <td>
                        <input id="TextKP" type="text" /></td>
                </tr>
                  <tr id="xs5">
                    <td style="text-align: center">麸皮</td>
                    <td>
                        <input id="TextFP" type="text" /></td>
                </tr>
                  <tr id="xs6">
                    <td style="text-align: center">次粉</td>
                    <td>
                        <input id="TextCF" type="text" /></td>
                </tr>
                  <tr id="xs7">
                    <td style="text-align: center">小麦</td>
                    <td>
                        <input id="TextXM" type="text" /></td>
                </tr>
                 <tr id="xs8">
                    <td style="text-align: center">燕麦</td>
                    <td>
                        <input id="TextYANM" type="text" /></td>
                </tr>             
                 <tr id="xs9">
                    <td style="text-align: center">陈稻谷</td>
                    <td>
                        <input id="TextCDG" type="text" /></td>
                </tr>
                   <tr id="xs10">
                    <td style="text-align: center">糙米</td>
                    <td>
                        <input id="TextCM" type="text" /></td>
                </tr>
                   <tr id="xs11">
                    <td style="text-align: center">碎米</td>
                    <td>
                        <input id="TextSM" type="text" /></td>
                </tr>
                   <tr id="xs12">
                    <td style="text-align: center">玉米淀粉</td>
                    <td>
                        <input id="TextYMDF" type="text" /></td>
                </tr>
                   <tr id="xs13">
                    <td style="text-align: center">DDGS</td>
                    <td>
                        <input id="TextDDGS" type="text" /></td>
                </tr>
                   <tr id="xs14">
                    <td style="text-align: center">46豆粕</td>
                    <td>
                        <input id="Text46DP" type="text" /></td>
                </tr>
                   <tr id="xs15">
                    <td style="text-align: center">膨化大豆粉</td>
                    <td>
                        <input id="TextPHDDF" type="text" /></td>
                </tr>
                <tr id="xs16">
                    <td style="text-align: center">菜粕</td>
                    <td>
                        <input id="TextCP" type="text" /></td>
                </tr>
                <tr id="xs17">
                    <td style="text-align: center">棉粕（47%）</td>
                    <td>
                        <input id="TextMP" type="text" /></td>
                </tr>
                <tr id="xs18">
                    <td style="text-align: center">棕榈仁粕</td>
                    <td>
                        <input id="TextZGRP" type="text" /></td>
                </tr>
                   <tr id="xs19">
                    <td style="text-align: center">花生粕（48%）</td>
                    <td>
                        <input id="TextHSP" type="text" /></td>
                </tr>
                   <tr id="xs20">
                    <td style="text-align: center">玉米胚芽粕</td>
                    <td>
                        <input id="TextYMPYP" type="text" /></td>
                </tr>                          
                <tr>
                    <td colspan="2" style="color: red"><strong>所填数据保留小数点后两位既可</strong></td>
                </tr>
            </table>
        </div>

         <div id="Numb3" style="display: none; text-align: center">
            <table style="text-align: center; border: 1px solid Red;" align="center">
                  <tr>
                    <td colspan="2" style="color: blue; font-size: 25px; text-align: center">
                        <input  type="button" value="重新计算" onclick="divChange(2);" style="color: blue; font-size: 25px; text-align: center"/> 
                    </td>                
                </tr>
                <tr>
                    <td colspan="2" style=" font-size: 20px; text-align: center"><strong>按配方使用上限测算可节约成本</strong> 
                    </td>                
                </tr>
                <tr>
                    <td style="text-align: center">原料</td>
                   
                    <td style="text-align: center">双小优势(元/吨)</td>

                </tr>
                <tr id="jg1">
                    <td style="text-align: center">高粱</td>
                    <td>
                        <span id="spanGL" ></span></td>
                </tr>
                  <tr id="jg2">
                    <td style="text-align: center">大麦</td>
                    <td>
                       <span id="spanDM" ></span></td>
                </tr>
                <tr id="jg3">
                    <td style="text-align: center">米皮糠</td>
                    <td>
                     <span id="spanMPK" ></span></td>
                </tr>
                  <tr id="jg4">
                    <td style="text-align: center">糠粕</td>
                    <td>
                       <span id="spanKP" ></span></td>
                </tr>
                  <tr id="jg5">
                    <td style="text-align: center">麸皮</td>
                    <td>
                        <span id="spanFP" ></span></td>
                </tr>
                  <tr id="jg6">
                    <td style="text-align: center">次粉</td>
                    <td>
                        <span id="spanCF" ></span></td>
                </tr>
                 <tr id="jg7">
                    <td style="text-align: center">小麦</td>
                    <td>
                        <span id="spanXM" ></span></td>
                </tr>
                 <tr id="jg8">
                    <td style="text-align: center">燕麦</td>
                    <td>
                        <span id="spanYANM" ></span></td>
                </tr>             
                 <tr id="jg9">
                    <td style="text-align: center">陈稻谷</td>
                    <td>
                        <span id="spanCDG" ></span></td>
                </tr>
                   <tr id="jg10">
                    <td style="text-align: center">糙米</td>
                    <td>
                        <span id="spanCM" ></span></td>
                </tr>
                   <tr id="jg11">
                    <td style="text-align: center">碎米</td>
                    <td>
                        <span id="spanSM" ></span></td>
                </tr>
                   <tr id="jg12">
                    <td style="text-align: center">玉米淀粉</td>
                    <td>
                        <span id="spanYMDF" ></span></td>
                </tr>
                   <tr id="jg13">
                    <td style="text-align: center">DDGS</td>
                    <td>
                       <span id="spanDDGS" ></span></td>
                </tr>
                   <tr id="jg14">
                    <td style="text-align: center">46豆粕</td>
                    <td>
                       <span id="span46DP" ></span></td>
                </tr>
                   <tr id="jg15">
                    <td style="text-align: center">膨化大豆粉</td>
                    <td>
                        <span id="spanPHDDF" ></span></td>
                </tr>
                <tr id="jg16">
                    <td style="text-align: center">菜粕</td>
                    <td>
                        <span id="spanCP" ></span></td>
                </tr>
                <tr id="jg17">
                    <td style="text-align: center">棉粕（47%）</td>
                    <td>
                        <span id="spanMP" ></span></td>
                </tr>
                <tr id="jg18">
                    <td style="text-align: center">棕榈仁粕</td>
                    <td>
                        <span id="spanZGRP" ></span></td>
                </tr>
                   <tr id="jg19">
                    <td style="text-align: center">花生粕（48%）</td>
                    <td>
                       <span id="spanHSP" ></span></td>
                </tr>
                   <tr id="jg20">
                    <td style="text-align: center">玉米胚芽粕</td>
                    <td>
                        <span id="spanYMPYP" ></span></td>
                </tr>        
                <tr>
                    <td colspan="2" style="color: red"><strong>所填数据保留小数点后两位既可</strong></td>
                </tr>
            </table>
        </div>

    </form>
</body>
</html>
