<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QHJS.aspx.cs" Inherits="WebApp.cg.QHJS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta content="initial-scale=1.0,maximum-scale=2,minimum-scale=1,width=device-width" name="viewport" />
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
    <script type="text/javascript"  >
        function ChangeDiv(divId, divName, zDivCount) {
        for (i = 1; i <= zDivCount; i++) {

            document.getElementById(divName + i).style.display = "none";

        }
        document.getElementById(divName + divId).style.display = "block";

        }
        function JiSuanValue( LabId)
        {
            //Txt11  港口收购价
            //Txt12 北方港杂费
            //Txt13  深圳港现货价格
            //Lab1深圳基差
            if (LabId == 1)

                var dgcb = 95.84 + parseFloat(document.getElementById("Txt12").value) + parseFloat(document.getElementById("Txt11").value);//到港成本
          //  alert(dgcb);
            document.getElementById("Lab1").innerHTML = (dgcb-parseFloat(document.getElementById("Txt13").value)).toFixed(2);
                 //document.getElementById("Lab1").innerHTML = ((parseFloat(document.getElementById("Txt11").value) + parseFloat(document.getElementById("Txt12").value)) * 0.367437 * 1.03 * 1.13 * parseFloat(document.getElementById("Txt13").value) + 100).toFixed(2);
             //  document.getElementById("Lab1").innerHTML = document.getElementById("Txt11").value + document.getElementById("Txt12").value;
        }

    </script>
    <title>北港对深圳收购基差模型</title>
</head>
    
<body>
    <form id="form1" runat="server">
     <table style="text-align: left; border: 1px solid Red;" align="center">
            <tr>
                <td colspan="2" style="text-align: center" class="auto-style1"><a style="font-size: 20px; color: blue" ><strong style="text-decoration: underline; color: blue">北港对深圳收购基差模型</strong></a>  </td>
            </tr>
        </table>
         <div id="jm1" style="text-align: center">
            <table style="text-align: left; height: 240px; border: 1px solid Red;" align="center">
                <tr>
                    <td colspan="2" style="width: 400px"><span onmousedown="ChangeDiv(1,'Numb',5)"><strong>1、北港对深圳收购基差模型</strong></span></td>

                </tr>
                <tr>
                    <td colspan="2" style="width: 400px"><span onmousedown="ChangeDiv(2,'Numb',5)"><strong>2、预留1
                    </strong></span></td>
                </tr>

                <tr>

                    <td colspan="2"><span onmousedown="ChangeDiv(3,'Numb',5)"><strong>3、预留2</strong></span></td>
                </tr>
                <tr>

                    <td colspan="2" style="width: 400px"><span onmousedown="ChangeDiv(4,'Numb',5)"><strong>4、预留3</strong></span></td>
                </tr>
                <tr>

                    <td colspan="2" style="width: 400px"><span onmousedown="ChangeDiv(5,'Numb',5)"><strong>5、预留4</strong></span></td>
                </tr>
               
            </table>
        </div>
     
         <div id="Numb1" style="display:block; text-align: center">
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
                                        <label for="RadButLis12_0">锦州</label><input id="RadButLis12_0" type="radio" name="RadButLis12" value="深圳" checked="checked" onclick="JiSuanValue(12)" /></td>
                                    <td>
                                        <label for="RadButLis12_1">鲅鱼圈</label><input id="RadButLis12_1" type="radio" name="RadButLis12" value="南通" onclick="JiSuanValue(12)" /></td>
                                    <td>
                                        <label for="RadButLis12_2">葫芦岛</label><input id="RadButLis12_2" type="radio" name="RadButLis12" value="漳州" onclick="JiSuanValue(12)" /></td>
                                    <td>
                                        <label for="RadButLis12_3">绥中</label><input id="RadButLis12_3" type="radio" name="RadButLis12" value="湛江" onclick="JiSuanValue(12)" /></td>
                                    <td>
                                        <label for="RadButLis12_4">盘锦</label><input id="RadButLis12_4" type="radio" name="RadButLis12" value="茂名" onclick="JiSuanValue(12)" /></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="RadButLis12_5">北良</label><input id="RadButLis12_5" type="radio" name="RadButLis12" value="阳江" onclick="JiSuanValue(12)" /></td>
                                    <td>
                                        <label for="RadButLis12_6">大窑湾</label><input id="RadButLis12_6" type="radio" name="RadButLis12" value="海口" onclick="JiSuanValue(12)" /></td>
                                    <td>
                                        <label for="RadButLis12_7">丹东</label><input id="RadButLis12_7" type="radio" name="RadButLis12" value="钦州" onclick="JiSuanValue(12)" /></td>
           
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>港口收购价</td>
                    <td>
                        <input id="Txt11" type="text" onblur="JiSuanValue('1')" /></td>

                </tr>
                <tr>
                    <td>北方港杂费</td>
                    <td>
                        <input id="Txt12" type="text" onblur="JiSuanValue('1')" /></td>
                </tr>
                <tr>

                    <td>深圳港现货价格</td>
                    <td>
                        <input id="Txt13" type="text" onblur="JiSuanValue('1')" /></td>
                </tr>

               
                <tr>
                    <td style="color: blue"><strong>深圳基差</strong></td>
                    <td>
                        <asp:Label ID="Lab1" runat="server" Text=""></asp:Label></td>
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

        <div id="Numb2" style="display: none; text-align: center">
            <table style="text-align: center; border: 1px solid Red;" align="center">

                <tr>
                    <td colspan="2" style="color: blue; font-size: 30px; text-align: center">2222222222222</td>
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
                    <td colspan="2" style="color: blue; font-size: 30px; text-align: center">333333333333333333333</td>
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
                    <td colspan="2" style="color: blue; font-size: 30px; text-align: center">4444444444444444444</td>
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
                    <td colspan="2" style="color: blue; font-size: 30px; text-align: center">5555555555555555</td>
                </tr>
                <tr>
                    <td style="text-align: center">外购膨化大豆成本</td>
                    <td>
                        <input id="Text1" type="text" onblur="JiSuanValue('4')" /></td>


                </tr>
                <tr>
                    <td style="text-align: center">购买四级豆油成本</td>
                    <td>
                        <input id="Text2" type="text" onblur="JiSuanValue('4')" /></td>
                </tr>
                <tr>
                    <td style="text-align: center">购买43%豆粕</td>
                    <td>
                        <input id="Text3" type="text" onblur="JiSuanValue('4')" /></td>
                </tr>
                <tr>
                    <td style="color: blue; text-align: center"><strong>油脂和43豆粕配比与外购膨化大豆利润</strong></td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="2" style="color: red"><strong>外购膨化大豆成本-购买四级豆油成本*0.185-购买43%豆粕*0.185</strong></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
