<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApp.yx.index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/cabel-v1.css" type="text/css" />
    <script src="js/FancyZoom.js" language="JavaScript" type="text/javascript"></script>
    <script src="js/FancyZoomHTML.js" language="JavaScript" type="text/javascript"></script>
    <script type="text/javascript">
        var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
        document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fa9ebfa56a1fec24c9e70c5795f9f6b4f' type='text/javascript'%3E%3C/script%3E"));
</script>

    <style type="text/css">
        td {
            border: 1px solid #757575;
            height: 30px;
            text-align: center;
        }

        table {
            border: 0px solid #757575;
        }

        tr {
            border: 1px;
        }
    </style>
</head>
<body onload="setupZoom();">
    <form id="form1" runat="server">
        <table >
            <tr>
                <td colspan="3" style="border-width: 0px;font-size:50px;color:blue;text-align:center">养猪模式大PK</td>
            </tr>
            <tr >
                
                <td colspan="3" style="border-width: 0px">
                    <a href="tool1.aspx" target="_blank" style="font-size:25px">双胞胎PK大某农</a>&nbsp; |&nbsp; <a href="tool2.aspx" target="_blank" style="font-size:25px">双胞胎PK某大</a>
                </td>
               
            </tr>
            <tr><td colspan="3" style=" border-width: 0px;"> </td></tr>
            <tr>
                   <td style="width:400px"> <a href="images/4133.jpg"><img src="images/4133.jpg" width="400px" height="147px" border="0" alt="" id="img1" class="photo" /></a></td>
                    <td style="width:400px"><a href="images/62040.jpg"><img src="images/62040.jpg" width="400px" height="147px" border="0" alt="" id="img-mwsf-2" class="photo" /></a></td>
                   <td style="width:400px"><a href="images/2355模式.jpg"><img src="images/2355模式.jpg" width="400px" height="147px" border="0" alt="" id="img2" class="photo" /></a></td>
            </tr>
            <tr> 
            <td style="font-size:20px;width:400px" class="auto-style1"><strong><a href="tool1.aspx">大某农4133模式图</a> <a href="images/大某农模式宣传.jpg"><img src="images/大某农模式宣传.jpg" width="26" width="34px" border="0" alt="" id="img3" class="photo" /></a></strong></td>
              
                <td style="font-size:20px;width:400px" class="auto-style1"><strong>双胞胎62040模式图</strong></td>
                 <td style="font-size:20px;width:400px" class="auto-style1"> <strong><a href="tool2.aspx">某大3694010模式图</a><a href="images/某大模式宣传.jpg"><img src="images/某大模式宣传.jpg" width="26" width="34px" border="0" alt="" id="img4" class="photo" /></a></strong></td>
            </tr>

            <tr>
                   <td style="width:400px"> <a href="images/4133.jpg"><img src="images/4133.jpg" width="400px" height="147px" border="0" alt="" id="img7" class="photo" /></a></td>
                    <td style="width:400px"><a href="images/369.jpg"><img src="images/369.jpg" width="400px" height="147px" border="0" alt="" id="img8" class="photo" /></a></td>
                   <td style="width:400px"><a href="images/2355模式.jpg"><img src="images/2355模式.jpg" width="400px" height="147px" border="0" alt="" id="img9" class="photo" /></a></td>
            </tr>
            <tr> 
            <td style="font-size:20px;width:400px" class="auto-style1"><strong><a href="tool4.aspx">猪三乐36950+55模式PK某饲料</a> <a href="images/大某农模式宣传.jpg"><img src="images/大某农模式宣传.jpg" width="26" width="34px" border="0" alt="" id="img5" class="photo" /></a></strong></td>
              
                <td style="font-size:20px;width:400px" class="auto-style1"><strong>猪三乐36950+55模式图</strong></td>
                 <td style="font-size:20px;width:400px" class="auto-style1"> <strong><a href="tool3.aspx">猪三乐36950+55模式PK正大饲料</a><a href="images/某大模式宣传.jpg"><img src="images/某大模式宣传.jpg" width="26" width="34px" border="0" alt="" id="img6" class="photo" /></a></strong></td>
            </tr>
           
        </table>
    </form>
</body>
</html>
