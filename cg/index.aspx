<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApp.cg.index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta content="initial-scale=1.0,maximum-scale=2,minimum-scale=1,width=device-width" name="viewport" />
    <title></title>
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

 
    </style>
    <script language="JavaScript" type="text/javascript">

     
      var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
        document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F52d8ec9e1c397292d12c02fea902cf56' type='text/javascript'%3E%3C/script%3E"));
        /*********************************************
        功能: 通用DIV切换函数
        参数: divID --当前DIV的ID号；divName --要改变的这一组DIV的命名前缀；zDivCount --这一组DIV的个数-1
        
        *********************************************/
        function ChangeDiv(divId, divName, zDivCount) {
            for (i = 1; i <= zDivCount; i++) {

                document.getElementById(divName + i).style.display = "none";

            }
            document.getElementById(divName + divId).style.display = "block";
        }
        function JiSuanValue(LabId) {
            //1、(大豆到港成本-100)/0.367433*1.03*1.13*汇率-CNF贴水干粮价格=潮粮收购价格*2000/[1-(潮粮水分-14%)*损耗系数]=CBOT大豆价格
            //   if (LabId == 1 && (document.getElementById("Txt11").value == ""||document.getElementById("Txt11").value = "NaN") && document.getElementById("Txt12").value != "" && document.getElementById("Txt13").value != "" && document.getElementById("Lab1").value != "" document.getElementById("Txt12").value != "NaN" && document.getElementById("Txt13").value != "NaN" && document.getElementById("Lab1").value != "NaN")

            //  document.getElementById("Lab1").value = ((parseFloat(document.getElementById("Txt11").value) + parseFloat(document.getElementById("Txt12").value)) * 0.367433 * 1.03 * 1.13 * parseFloat(document.getElementById("Txt13").value) + 100).toFixed(2);
            //     document.getElementById("Txt11").value = "2222";
            //1、大豆到港成本=（CBOT大豆价格+CNF贴水）*0.367433*1.03*1.13*汇率+100
            if (LabId == 1)
                document.getElementById("Lab1").innerHTML = ((parseFloat(document.getElementById("Txt11").value) + parseFloat(document.getElementById("Txt12").value)) * 0.367437 * 1.03 * 1.13 * parseFloat(document.getElementById("Txt13").value) + 100).toFixed(2);

            //2、压榨利润=（豆油价格*0.185+豆粕价格*0.785）-大豆价格-150
            if (LabId == 2)
                document.getElementById("Lab2").innerHTML = ((parseFloat(document.getElementById("Txt21").value) * 0.185 + parseFloat(document.getElementById("Txt22").value) * 0.785) - parseFloat(document.getElementById("Txt23").value) - 150).toFixed(2);
            //3、自行加工生产膨化大豆利润=外购膨化大豆粉成本-购买大豆成本*1.025-150
            if (LabId == 3)
                document.getElementById("Lab3").innerHTML = (parseFloat(document.getElementById("Txt31").value) - parseFloat(document.getElementById("Txt32").value) * 1.025 - 150).toFixed(2);
            //4、油脂和43豆粕配比与外购膨化大豆利润=外购膨化大豆成本-购买四级豆油成本*0.185-购买43%豆粕*0.185
            if (LabId == 4)
                document.getElementById("Lab4").innerHTML = (parseFloat(document.getElementById("Txt41").value) - parseFloat(document.getElementById("Txt42").value) * 0.185 - parseFloat(document.getElementById("Txt43").value) * 0.185).toFixed(2);
            //5、油脂和43豆粕配比与自行生产膨化大豆利润=购买大豆成本*1.025+150-购买四级豆油成本*0.185-购买43%豆粕成本*0.185
            if (LabId == 5)
                document.getElementById("Lab5").innerHTML = (parseFloat(document.getElementById("Txt51").value) * 1.025 + 150 - parseFloat(document.getElementById("Txt52").value) * 0.185 - parseFloat(document.getElementById("Txt53").value) * 0.185).toFixed(2);
            // //6、干粮价格=潮粮收购价格*2000/[1-(潮粮水分-14%)*损耗系数]
            if (LabId == 6) {

                document.getElementById("Lab6").innerHTML = (parseFloat(document.getElementById("Txt61").value) * 2000 / (1 - ((parseFloat(document.getElementById("Txt62").value) - 14.5)) * parseFloat(document.getElementById("Txt63").value)) / 100 + parseFloat(document.getElementById("Txt64").value)).toFixed(2);
            }
            // //7、进口高粱一口价=CNF价*汇率*1.02*1.13+80
            if (LabId == 7) {
            
                    document.getElementById("Lab7").innerHTML = (parseFloat(document.getElementById("Txt71").value) * parseFloat(document.getElementById("Txt72").value) * GetRadioValue("RadButLis7") * 1.11 + 80).toFixed(2);
                    //进口高粱升贴水价=（升贴水+CBOT价）*0.39368*汇率*1.02*1.11+80
           
            }
            if (LabId == 14) {
            
                    document.getElementById("Lab7").innerHTML = (parseFloat(document.getElementById("Txt71").value) * parseFloat(document.getElementById("Txt72").value) * GetRadioValue("RadButLis7") * 1.17 + 200).toFixed(2);

       
            }
            if (LabId == 8)
                document.getElementById("Lab8").innerHTML = ((parseFloat(document.getElementById("Txt81").value) + parseFloat(document.getElementById("Txt82").value)) * 0.39368 * parseFloat(document.getElementById("Txt83").value) * GetRadioValue("RadButLis8") * 1.13 + 80).toFixed(2);
            //8、进口DDGS=CNF价*汇率*1.05+84
            if (LabId == 9)
                document.getElementById("Lab9").innerHTML = (parseFloat(document.getElementById("Txt91").value) * parseFloat(document.getElementById("Txt92").value) * 1.05 + 84).toFixed(2);
            //9、进口散船大麦价=CNF价*汇率*1.03*1.13+80
            if (LabId == 10)
                document.getElementById("Lab10").innerHTML = (parseFloat(document.getElementById("Txt101").value) * parseFloat(document.getElementById("Txt102").value) * 1.03 * 1.13 + 80).toFixed(2);
            if (LabId == 11)
                document.getElementById("Lab11").innerHTML = (parseFloat(document.getElementById("Txt111").value) * parseFloat(document.getElementById("Txt112").value) + 230).toFixed(2);
            if (LabId == 12) {

                if (GetRadioValue("RadButLis12") == "深圳") {
                    document.getElementById("Txt122").value = "15";
                    document.getElementById("Txt123").value = "50"
                    document.getElementById("Txt124").value = "40"
                }
                if (GetRadioValue("RadButLis12") == "南通") {
                    document.getElementById("Txt122").value = "15";
                    document.getElementById("Txt123").value = "45"
                    document.getElementById("Txt124").value = "12"
                }
                if (GetRadioValue("RadButLis12") == "漳州") {
                    document.getElementById("Txt122").value = "15";
                    document.getElementById("Txt123").value = "55"
                    document.getElementById("Txt124").value = "30"
                }
                if (GetRadioValue("RadButLis12") == "湛江" || GetRadioValue("RadButLis12") == "阳江" || GetRadioValue("RadButLis12") == "茂名") {
                    document.getElementById("Txt122").value = "15";
                    document.getElementById("Txt123").value = "67"
                    document.getElementById("Txt124").value = "25"
                }
                if (GetRadioValue("RadButLis12") == "海口" || GetRadioValue("RadButLis12") == "钦州") {
                    document.getElementById("Txt122").value = "15";
                    document.getElementById("Txt123").value = "70"
                    document.getElementById("Txt124").value = "32"
                }
                if (GetRadioValue("RadButLis12") == "揭阳") {
                    document.getElementById("Txt122").value = "15";
                    document.getElementById("Txt123").value = "93"
                    document.getElementById("Txt124").value = "13"
                }
                document.getElementById("Lab12").innerHTML = (parseFloat(document.getElementById("Txt121").value) + 15 / parseFloat(document.getElementById("Txt122").value) + parseFloat(document.getElementById("Txt123").value) + parseFloat(document.getElementById("Txt124").value)).toFixed(2);
            }
            if (LabId = 13) {

                var dgcb = 95.84 + parseFloat(document.getElementById("Txt132").value) + parseFloat(document.getElementById("Txt131").value);//到港成本
                document.getElementById("Lab13").innerHTML = (dgcb - parseFloat(document.getElementById("Txt133").value)).toFixed(2);
            }

        }
        //特殊计算：第12个
        function JiSuanValue_2(LabId) {
            if (LabId == 12) {
                document.getElementById("Lab12").innerHTML = (parseFloat(document.getElementById("Txt121").value) + 15 / parseFloat(document.getElementById("Txt122").value) + parseFloat(document.getElementById("Txt123").value) + parseFloat(document.getElementById("Txt124").value)).toFixed(2);
            }
        }
        //特殊处理：干粮价格根据水份带出损耗系数及烘干成本
        function JiSuanValue_1(LabId) {
            // //6、干粮价格=潮粮收购价格*2000/[1-(潮粮水分-14%)*损耗系数]
            if (LabId == 6) {
                var shuifen = parseFloat(document.getElementById("Txt62").value);

                if (shuifen >= 30) {
                    document.getElementById("Txt63").value = 1.3;
                    document.getElementById("Txt64").value = 60;
                }
                if (shuifen < 30 && shuifen >= 25) {
                    document.getElementById("Txt63").value = 1.25;
                    document.getElementById("Txt64").value = 50;
                }
                if (shuifen < 25 && shuifen >= 22) {
                    document.getElementById("Txt63").value = 1.2;
                    document.getElementById("Txt64").value = 40;
                }
                if (shuifen < 22) {
                    document.getElementById("Txt63").value = 1.1;
                    document.getElementById("Txt64").value = 25;
                }
                document.getElementById("Lab6").innerHTML = (parseFloat(document.getElementById("Txt61").value) * 2000 / (1 - (parseFloat(document.getElementById("Txt62").value) - 14.5) * parseFloat(document.getElementById("Txt63").value) / 100) + parseFloat(document.getElementById("Txt64").value)).toFixed(2);
            }


        }
        function GetRadioValue(RadioName) {
            var obj;
            obj = document.getElementsByName(RadioName);
            if (obj != null) {
                var i;
                for (i = 0; i < obj.length; i++) {
                    if (obj[i].checked)
                        return obj[i].value;
                }
            }
            return null;
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">

        <table style="text-align: left; border: 1px solid Red;" align="center">
            <tr>
                <td colspan="2" style="text-align: center" ><a style="font-size: 20px; color: blue" onclick="ChangeDiv(1,'jm',3)"><strong style="text-decoration: underline; color: blue">进口原料</strong></a>  
                     |   <a style="font-size: 20px" onclick="ChangeDiv(2,'jm',3)"><strong style="text-decoration: underline; color: blue">原料替代</strong></a>
                     |   <a style="font-size: 20px" onclick="ChangeDiv(3,'jm',3)"><strong style="text-decoration: underline; color: blue" >期货模型</strong></a>

                </td>
            </tr>
        </table>
        <div id="jm1" style="text-align: center">
            <table style="text-align: left; height: 240px; border: 1px solid Red;" align="center">
                <tr>
                    <td colspan="2" style="width: 400px"><span onmousedown="ChangeDiv(1,'Numb',13)"><strong>1、进口大豆到港成本</strong></span></td>

                </tr>
                <tr>
                    <td colspan="2" style="width: 400px"><span onmousedown="ChangeDiv(2,'Numb',13)"><strong>2、大豆加工压榨利润</strong></span></td>
                </tr>

                <tr>

                    <td colspan="2"><span onmousedown="ChangeDiv(6,'Numb',13)"><strong>3、玉米干粮成本</strong></span></td>
                </tr>
                <tr>

                    <td colspan="2" style="width: 400px"><span onmousedown="ChangeDiv(7,'Numb',13)"><strong>4、进口谷物到港成本（CNF价）</strong></span></td>
                </tr>
                <tr>

                    <td colspan="2" style="width: 400px"><span onmousedown="ChangeDiv(8,'Numb',13)"><strong>5、进口谷物到港成本(CBOT价）</strong></span></td>
                </tr>
                <tr>

                    <td colspan="2" style="width: 400px"><span onmousedown="ChangeDiv(9,'Numb',13)"><strong>6、进口DDGS</strong></span></td>
                </tr>


                <tr>
                    <td colspan="2" style="width: 400px"><span onmousedown="ChangeDiv(11,'Numb',13)"><strong>7、进口鱼粉到港成本</strong></span></td>
                </tr>
                <tr>
                    <td colspan="2" style="width: 400px"><span onmousedown="ChangeDiv(12,'Numb',13)"><strong>8、南方港口成本价</strong></span></td>
                </tr>
            </table>
        </div>
        <div id="jm2" style="display: none; text-align: center">
            <table style="text-align: left; border: 1px solid Red;" align="center">
                <tr>

                    <td colspan="2" style="width: 400px"><span onmousedown="ChangeDiv(3,'Numb',13)"><strong>1、加工膨化大豆比采购膨化大豆价格优势</strong></span></td>
                </tr>
                <tr>

                    <td colspan="2" style="width: 400px"><span onmousedown="ChangeDiv(4,'Numb',13)"><strong>2、加工膨化豆粕比采购膨化大豆价格优势</strong></span></td>
                </tr>
                <tr>

                    <td colspan="2" style="width: 400px"><span onmousedown="ChangeDiv(5,'Numb',13)"><strong>3、加工膨化豆粕比加工膨化大豆价格优势</strong></span></td>
                </tr>
            </table>
        </div>
         <div id="jm3" style="display: none; text-align: center">
            <table style="text-align: left; border: 1px solid Red;" align="center">
                     <tr>
                    <td colspan="2" style="width: 400px"><span onmousedown="ChangeDiv(13,'Numb',13)"><strong>1、北港对深圳收购基差模型</strong></span></td>

                </tr>
                <tr>
                    <td colspan="2" style="width: 400px"><span onmousedown="ChangeDiv(13,'Numb',13)"><strong>2、预留1
                    </strong></span></td>
                </tr>

                <tr>

                    <td colspan="2"><span onmousedown="ChangeDiv(13,'Numb',13)"><strong>3、预留2</strong></span></td>
                </tr>
                <tr>

                    <td colspan="2" style="width: 400px"><span onmousedown="ChangeDiv(13,'Numb',13)"><strong>4、预留3</strong></span></td>
                </tr>
                <tr>

                    <td colspan="2" style="width: 400px"><span onmousedown="ChangeDiv(13,'Numb',13)"><strong>5、预留4</strong></span></td>
                </tr>
            </table>
        </div>
        <div id="Numb1" style="display: none; text-align: center">
            <table style="text-align: center; border: 1px solid Red;" align="center">
                <tr>
                    <td colspan="2" style="color: blue; font-size: 30px; text-align: center">进口大豆到港成本</td>
                </tr>
                <tr>
                    <td style="text-align: center">CBOT大豆价格</td>
                    <td>
                        <input id="Txt11" type="text" onblur="JiSuanValue('1') " /></td>
                </tr>
                <tr>
                    <td style="text-align: center">CNF贴水</td>
                    <td>
                        <input id="Txt12" type="text" onblur="JiSuanValue('1') " /></td>
                </tr>
                <tr>
                    <td style="text-align: center">汇率</td>
                    <td>
                        <input id="Txt13" type="text" onblur="JiSuanValue('1') " /></td>
                </tr>
                <tr>
                    <td style="color: blue"><strong>大豆到港成本</strong></td>
                    <td style="text-align: center">
                        <asp:Label ID="Lab1" runat="server"></asp:Label>



                    </td>

                </tr>
                <tr>
                    <td colspan="2" style="color: red"><strong>（CBOT大豆价格+CNF贴水）*0.367437*1.03*1.13*汇率+100</strong></td>
                </tr>
            </table>
        </div>
        <div id="Numb2" style="display: none; text-align: center">
            <table style="text-align: center; border: 1px solid Red;" align="center">

                <tr>
                    <td colspan="2" style="color: blue; font-size: 30px; text-align: center">大豆加工压榨利润</td>
                </tr>
                <tr>
                    <td style="text-align: center">豆油价格</td>
                    <td>
                        <input id="Txt21" type="text" onblur="JiSuanValue('2') " /></td>

                </tr>
                <tr>
                    <td style="text-align: center">豆粕价格</td>
                    <td>
                        <input id="Txt22" type="text" onblur="JiSuanValue('2') " /></td>
                </tr>
                <tr>
                    <td style="text-align: center">大豆价格</td>
                    <td>
                        <input id="Txt23" type="text" onblur="JiSuanValue('2') " /></td>
                </tr>
                <tr>
                    <td style="color: blue"><strong>压榨利润 </strong></td>
                    <td>
                        <asp:Label ID="Lab2" runat="server" Text=""></asp:Label>

                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="color: red"><strong>（豆油价格*0.185+豆粕价格*0.785）-大豆价格-150</strong></td>
                </tr>
            </table>
        </div>
        <div id="Numb3" style="display: none; text-align: center">
            <table style="text-align: center; border: 1px solid Red;" align="center">
                <tr>
                    <td colspan="2" style="color: blue; font-size: 30px; text-align: center">加工膨化大豆比采购膨化大豆价格优势</td>
                </tr>
                <tr>
                    <td style="text-align: center">外购膨化大豆粉成本</td>
                    <td>
                        <input id="Txt31" type="text" onblur="JiSuanValue('3') " /></td>


                </tr>
                <tr>
                    <td style="text-align: center">购买大豆成本</td>
                    <td>
                        <input id="Txt32" type="text" onblur="JiSuanValue('3')" /></td>
                </tr>
                <tr>
                    <td style="color: blue"><strong>自行加工生产膨化大豆利润</strong></td>
                    <td>
                        <asp:Label ID="Lab3" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="2" style="color: red"><strong>外购膨化大豆粉成本-购买大豆成本*1.025-150</strong></td>
                </tr>
            </table>
        </div>
        <div id="Numb4" style="display: none; text-align: center">
            <table style="text-align: center; border: 1px solid Red;" align="center">
                <tr>
                    <td colspan="2" style="color: blue; font-size: 30px; text-align: center">加工膨化豆粕比采购膨化大豆价格优势</td>
                </tr>
                <tr>
                    <td style="text-align: center">外购膨化大豆成本</td>
                    <td>
                        <input id="Txt41" type="text" onblur="JiSuanValue('4')" /></td>


                </tr>
                <tr>
                    <td style="text-align: center">购买四级豆油成本</td>
                    <td>
                        <input id="Txt42" type="text" onblur="JiSuanValue('4')" /></td>
                </tr>
                <tr>
                    <td style="text-align: center">购买43%豆粕</td>
                    <td>
                        <input id="Txt43" type="text" onblur="JiSuanValue('4')" /></td>
                </tr>
                <tr>
                    <td style="color: blue; text-align: center"><strong>油脂和43豆粕配比与外购膨化大豆利润</strong></td>
                    <td>
                        <asp:Label ID="Lab4" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="2" style="color: red"><strong>外购膨化大豆成本-购买四级豆油成本*0.185-购买43%豆粕*0.185</strong></td>
                </tr>
            </table>
        </div>
        <div id="Numb5" style="display: none; text-align: center">
            <table style="text-align: center; border: 1px solid Red;" align="center">
                <tr>
                    <td colspan="2" style="color: blue; font-size: 30px; text-align: center">加工膨化豆粕比加工膨化大豆价格优势</td>
                </tr>
                <tr>
                    <td style="text-align: center">购买大豆成本</td>
                    <td>
                        <input id="Txt51" type="text" onblur="JiSuanValue('5')" /></td>


                </tr>
                <tr>
                    <td style="text-align: center">购买四级豆油成本</td>
                    <td>
                        <input id="Txt52" type="text" onblur="JiSuanValue('5')" /></td>
                </tr>
                <tr>
                    <td style="text-align: center">购买43%豆粕成本</td>
                    <td>
                        <input id="Txt53" type="text" onblur="JiSuanValue('5')" /></td>
                </tr>
                <tr>
                    <td style="color: blue; text-align: center"><strong>油脂和43豆粕配比与自行生产膨化大豆利润</strong></td>
                    <td>
                        <asp:Label ID="Lab5" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="2" style="color: red"><strong>购买大豆成本*1.025+150-购买四级豆油成本*0.185-购买43%豆粕成本*0.185</strong></td>
                </tr>
            </table>
        </div>
        <div id="Numb6" style="display: none; text-align: center">
            <table style="text-align: center; border: 1px solid Red;" align="center">
                <tr>
                    <td colspan="2" style="color: blue; font-size: 30px; text-align: center">玉米干粮成本</td>
                </tr>
                <tr>
                    <td>潮粮收购价格</td>
                    <td>
                        <input id="Txt61" type="text" onblur="JiSuanValue('6')" /></td>


                </tr>
                <tr>
                    <td>潮粮水分</td>
                    <td>
                        <input id="Txt62" type="text" onblur="JiSuanValue_1('6')" /></td>
                </tr>
                <tr>
                    <td>损耗系数</td>
                    <td>
                        <input id="Txt63" type="text" onblur="JiSuanValue('6')" /></td>
                </tr>
                <tr>
                    <td>烘干塔成本</td>
                    <td>
                        <input id="Txt64" type="text" onblur="JiSuanValue('6')" /></td>
                </tr>

                <tr>
                    <td style="color: blue"><strong>干粮价格</strong></td>
                    <td>
                        <asp:Label ID="Lab6" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="2" style="color: red"><strong>潮粮收购价格*2000/[1-(潮粮水分-标准水分)/100*损耗系数]+烘干塔成本</strong></td>
                </tr>
            </table>
        </div>
        <div id="Numb7" style="display:block; text-align: center">
            <table style="text-align: center; border: 1px solid Red;" align="center">
                <tr>
                    <td colspan="2" style="color: blue; font-size: 30px; text-align: center">进口谷物到港成本（CNF价）</td>
                </tr>
                <tr>
                    <td>CNF价</td>
                    <td>
                        <input id="Txt71" type="text" onblur="JiSuanValue('7')" /></td>


                </tr>
                <tr>
                    <td>汇率</td>
                    <td>
                        <input id="Txt72" type="text" onblur="JiSuanValue('7')" /></td>
                </tr>


                <tr>
                    <td colspan="2">

                        <table id="Table2" class="radiotable" style="width: 100%;">
                            <tr>



                                <td colspan="2">
                                    <table style="border: 0px; width: 100%">
                                        <tr>
                                            <td >
                                                <label for="RadButLis12_0"   id="ymgs" style="text-align: right">玉米关税</label><input id="Radio1" style="border: 0px" type="radio" name="RadButLis7" value="1.01" checked="checked" onclick="JiSuanValue(7)" />
                                            </td>
                                            <td>
                                                <label for="RadButLis12_1"  id="glgs" style="text-align: right">高粱关税</label><input id="Radio2" style="border: 0px" type="radio" name="RadButLis7" value="1.02" onclick="JiSuanValue(7)" />
                                            </td>
                                            <td>
                                                <label for="RadButLis12_2"  id="dmgs" style="text-align: right">大麦关税</label><input id="Radio3" style="border: 0px" type="radio" name="RadButLis7" value="1.03" onclick="JiSuanValue(7)" />
                                            </td>
                                               <td>
                                                <label for="RadButLis12_3"  id="rqfgs" style="text-align: right">乳清粉关税</label><input id="Radio14" style="border: 0px" type="radio" name="RadButLis7" value="1.02" onclick="JiSuanValue(14)" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                        </table>

                    </td>
                </tr>
                <tr>
                    <td style="color: blue"><strong>进口谷物一口价</strong></td>
                    <td>
                        <asp:Label ID="Lab7" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="2" style="color: red"><strong>CNF价*汇率*关税*1.11+80</strong><br />
                        玉米：1.01；高粱：1.02；大麦：1.03；乳清粉：1.02</td>
                </tr>
            </table>
        </div>
        <div id="Numb8" style="display: none; text-align: center">
            <table style="text-align: center; border: 1px solid Red;" align="center">
                <tr>
                    <td colspan="2" style="color: blue; font-size: 30px; text-align: center">进口谷物到港成本（CBOT价）</td>
                </tr>
                <tr>
                    <td>升贴水</td>
                    <td>
                        <input id="Txt81" type="text" onblur="JiSuanValue('8')" /></td>

                </tr>
                <tr>
                    <td class="auto-style2">CBOT价</td>
                    <td class="auto-style2">
                        <input id="Txt82" type="text" onblur="JiSuanValue('8')" /></td>
                </tr>
                <tr>

                    <td>汇率</td>
                    <td>
                        <input id="Txt83" type="text" onblur="JiSuanValue('8')" /></td>
                </tr>
                <tr>
                    <td colspan="2">

                        <table id="Table3" class="radiotable" style="width: 100%;">
                            <tr>


                                <td colspan="2">
                                    <table style="border: 0px; width: 100%">
                                        <tr>
                                            <td>
                                                <label for="RadButLis12_0" style="text-align: right">玉米关税</label><input id="Radio4" style="border: 0px" type="radio" name="RadButLis8" value="1.01" checked="checked" onclick="JiSuanValue(8)" />
                                            </td>
                                            <td>
                                                <label for="RadButLis12_1" style="text-align: right">高粱关税</label><input id="Radio5" style="border: 0px" type="radio" name="RadButLis8" value="1.02" onclick="JiSuanValue(8)" />
                                            </td>

                                        </tr>
                                    </table>
                                </td>
                            </tr>

                        </table>

                    </td>
                </tr>

                <tr>
                    <td style="color: blue"><strong>进口高粱升贴水价</strong></td>
                    <td>
                        <asp:Label ID="Lab8" runat="server" Text=""></asp:Label></td>
                </tr>

                <tr>
                    <td colspan="2" style="color: red"><strong>（升贴水+CBOT价）*0.39368*汇率*关税*1.13+80</strong><br />
                        玉米：1.01；高粱：1.02</td>
                </tr>
            </table>
        </div>
        <div id="Numb9" style="display: none; text-align: center">
            <table style="text-align: center; border: 1px solid Red;" align="center">
                <tr>
                    <td colspan="2" style="color: blue; font-size: 30px; text-align: center">进口DDGS</td>
                </tr>
                <tr>
                    <td>CNF价</td>
                    <td>
                        <input id="Txt91" type="text" onblur="JiSuanValue('9')" /></td>


                </tr>
                <tr>
                    <td>汇率</td>
                    <td>
                        <input id="Txt92" type="text" onblur="JiSuanValue('9')" /></td>
                </tr>
                <tr>
                    <td style="color: blue"><strong>进口DDGS</strong></td>
                    <td>
                        <asp:Label ID="Lab9" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="2" style="color: red"><strong>CNF价*汇率*1.05+84</strong></td>
                </tr>
            </table>
        </div>
        <div id="Numb10" style="display: none; text-align: center">
            <table style="text-align: center; border: 1px solid Red;" align="center">
                <tr>
                    <td colspan="2" style="color: blue; font-size: 30px; text-align: center">进口散船大麦价</td>
                </tr>
                <tr>
                    <td>CNF价</td>
                    <td>
                        <input id="Txt101" type="text" onblur="JiSuanValue('10')" /></td>

                </tr>
                <tr>
                    <td>汇率</td>
                    <td>
                        <input id="Txt102" type="text" onblur="JiSuanValue('10')" /></td>
                </tr>
                <tr>
                    <td style="color: blue"><strong>进口散船大麦价</strong></td>
                    <td>
                        <asp:Label ID="Lab10" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="2" style="color: red"><strong>CNF价*汇率*1.03*1.13+80</strong></td>
                </tr>

            </table>
        </div>
        <div id="Numb11" style="display: none; text-align: center">
            <table style="text-align: center; border: 1px solid Red;" align="center">
                <tr>
                    <td colspan="2" style="color: blue; font-size: 30px; text-align: center">进口鱼粉到港成本</td>
                </tr>
                <tr>
                    <td>CNF价</td>
                    <td>
                        <input id="Txt111" type="text" onblur="JiSuanValue('11')" /></td>

                </tr>
                <tr>
                    <td>汇率</td>
                    <td>
                        <input id="Txt112" type="text" onblur="JiSuanValue('11')" /></td>
                </tr>
                <tr>
                    <td style="color: blue"><strong>进口鱼粉到港成本</strong></td>
                    <td>
                        <asp:Label ID="Lab11" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="2" style="color: red"><strong>CNF*汇率+230</strong></td>
                </tr>

            </table>
        </div>
        <div id="Numb12" style="display: none; text-align: center">
            <table style="text-align: center; border: 1px solid Red;" align="center">
                <tr>
                    <td colspan="2" style="color: blue; font-size: 30px; text-align: center">南方港口成本价</td>
                </tr>
                <tr>

                    <td colspan="2">
                        <div style="text-align: center">
                            <table id="Table1" class="radiotable" style="width: 100%;">
                                <tr>
                                    <td>
                                        <label for="RadButLis12_0">深圳</label><input id="RadButLis12_0" type="radio" name="RadButLis12" value="深圳" checked="checked" onclick="JiSuanValue(12)" /></td>
                                    <td>
                                        <label for="RadButLis12_1">南通</label><input id="RadButLis12_1" type="radio" name="RadButLis12" value="南通" onclick="JiSuanValue(12)" /></td>
                                    <td>
                                        <label for="RadButLis12_2">漳州</label><input id="RadButLis12_2" type="radio" name="RadButLis12" value="漳州" onclick="JiSuanValue(12)" /></td>
                                    <td>
                                        <label for="RadButLis12_3">湛江</label><input id="RadButLis12_3" type="radio" name="RadButLis12" value="湛江" onclick="JiSuanValue(12)" /></td>
                                    <td>
                                        <label for="RadButLis12_4">茂名</label><input id="RadButLis12_4" type="radio" name="RadButLis12" value="茂名" onclick="JiSuanValue(12)" /></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="RadButLis12_5">阳江</label><input id="RadButLis12_5" type="radio" name="RadButLis12" value="阳江" onclick="JiSuanValue(12)" /></td>
                                    <td>
                                        <label for="RadButLis12_6">海口</label><input id="RadButLis12_6" type="radio" name="RadButLis12" value="海口" onclick="JiSuanValue(12)" /></td>
                                    <td>
                                        <label for="RadButLis12_7">钦州</label><input id="RadButLis12_7" type="radio" name="RadButLis12" value="钦州" onclick="JiSuanValue(12)" /></td>
                                    <td>
                                        <label for="RadButLis12_8">揭阳</label><input id="RadButLis12_8" type="radio" name="RadButLis12" value="揭阳" onclick="JiSuanValue(12)" /></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>北方平仓价</td>
                    <td>
                        <input id="Txt121" type="text" onblur="JiSuanValue('12')" /></td>

                </tr>
                <tr>
                    <td>吨利息损耗</td>
                    <td>
                        <input id="Txt122" type="text" onblur="JiSuanValue_2('12')" /></td>
                </tr>
                <tr>

                    <td>海运费</td>
                    <td>
                        <input id="Txt123" type="text" onblur="JiSuanValue_2('12')" /></td>
                </tr>

                <tr>

                    <td>港杂</td>
                    <td>
                        <input id="Txt124" type="text" onblur="JiSuanValue_2('12')" /></td>
                </tr>

                <tr>
                    <td style="color: blue"><strong>南方港口成本价</strong></td>
                    <td>
                        <asp:Label ID="Lab12" runat="server" Text=""></asp:Label></td>
                </tr>

                <tr>
                    <td colspan="2" style="color: red"><strong>北方平仓价+15元/吨利息损耗+海运费+港杂</strong></td>
                </tr>
            </table>
        </div>
        
         <div id="Numb13" style="display:none; text-align: center">
            <table style="text-align: center; border: 1px solid Red;" align="center">
                <tr>
                    <td colspan="2" style="color: blue; font-size: 30px; text-align: center">南方港口成本价</td>
                </tr>
                <tr>

                    <td colspan="2">
                        <div style="text-align: center">
                            <table id="Table4" class="radiotable" style="width: 100%;">
                                <tr>
                                    <td>
                                        <label for="RadButLis12_0">锦州</label><input id="Radio6" type="radio" name="RadButLis12" value="深圳" checked="checked" onclick="JiSuanValue(12)" /></td>
                                    <td>
                                        <label for="RadButLis12_1">鲅鱼圈</label><input id="Radio7" type="radio" name="RadButLis12" value="南通" onclick="JiSuanValue(12)" /></td>
                                    <td>
                                        <label for="RadButLis12_2">葫芦岛</label><input id="Radio8" type="radio" name="RadButLis12" value="漳州" onclick="JiSuanValue(12)" /></td>
                                    <td>
                                        <label for="RadButLis12_3">绥中</label><input id="Radio9" type="radio" name="RadButLis12" value="湛江" onclick="JiSuanValue(12)" /></td>
                                    <td>
                                        <label for="RadButLis12_4">盘锦</label><input id="Radio10" type="radio" name="RadButLis12" value="茂名" onclick="JiSuanValue(12)" /></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="RadButLis12_5">北良</label><input id="Radio11" type="radio" name="RadButLis12" value="阳江" onclick="JiSuanValue(12)" /></td>
                                    <td>
                                        <label for="RadButLis12_6">大窑湾</label><input id="Radio12" type="radio" name="RadButLis12" value="海口" onclick="JiSuanValue(12)" /></td>
                                    <td>
                                        <label for="RadButLis12_7">丹东</label><input id="Radio13" type="radio" name="RadButLis12" value="钦州" onclick="JiSuanValue(12)" /></td>
           
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>港口收购价</td>
                    <td>
                        <input id="Txt131" type="text" onblur="JiSuanValue('13')" /></td>

                </tr>
                <tr>
                    <td>北方港杂费</td>
                    <td>
                        <input id="Txt132" type="text" onblur="JiSuanValue('13')" /></td>
                </tr>
                <tr>

                    <td>深圳港现货价格</td>
                    <td>
                        <input id="Txt133" type="text" onblur="JiSuanValue('13')" /></td>
                </tr>

               
                <tr>
                    <td style="color: blue"><strong>深圳基差</strong></td>
                    <td>
                        <asp:Label ID="Lab13" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td  colspan="2" style="text-align:left">
                        <strong>
                        1、资金利息=(港口收购价*30天资金占用时间*4.35%);
                     <br />
                        2、人力费用=1.5
                            <br />
                        3、税费成本=5    <br />
                        4、海运费=40    <br />
                        5、船运损耗=4.23    <br />
                        6、深圳港杂=40    <br />
                        升贴水=资金利息+人力费用+税费成本+船运损耗+深圳港杂

                                                       </strong>
                    </td>
                </tr>

            </table>
          
        </div>
        <div id="Div1" style="display: block; text-align: center">
            <table style="text-align: center; border: 0px;" align="center">
                <tr>
                    <td colspan="2" style="border: 0px"></td>
                </tr>
                <tr>
                    <td colspan="2" style="border: 0px"></td>
                </tr>
                  <tr>
                    <td colspan="2" style="border: 0px"></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
