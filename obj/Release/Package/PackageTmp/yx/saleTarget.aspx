<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="saleTarget.aspx.cs" Inherits="WebApp.yx.saleTarget" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
 <meta name="viewport" content="width=device-width,target-densitydpi=high-dpi, user-scalable=no" />
    <style type="text/css">
        a {
        font-size:large;
        color:blue
        }
        input {
        font-size:large
        }
        DropDownList {
        font-size:large
        }
      </style>
    <title></title>
    <script type="text/javascript">
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
    <div>
        <a >请选择客户：</a>
    </div>
   <div>
        <asp:DropDownList ID="DropDownList1"  Width="100%" Font-Size="Large" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true"> </asp:DropDownList>
    </div>
        <br />
        <div>
        <a style="color:red;width:30%">年度目标：</a>
        <input id="Text1" type="text" style="color:red;width:68%" runat="server" onkeyup="clearNoNum(this)" autocomplete="off"/>
        </div><br />
        <div>
           <a> 01月目标：</a>
        <input id="Text2" type="text" onkeyup="clearNoNum(this)" runat="server" autocomplete="off"/>
        </div><br />
        <div>
        <a>02月目标：</a>
        <input id="Text3" type="text" onkeyup="clearNoNum(this)" runat="server" autocomplete="off"/>
        </div><br />
        <div>
        <a>03月目标：</a>
        <input id="Text4" type="text" onkeyup="clearNoNum(this)" runat="server" autocomplete="off"/>
        </div><br />
        <div>
        <a>04月目标：</a>
        <input id="Text5" type="text" onkeyup="clearNoNum(this)" runat="server" autocomplete="off"/>
        </div><br />
        <div>
        <a>05月目标：</a>
        <input id="Text6" type="text" onkeyup="clearNoNum(this)" runat="server" autocomplete="off"/>
        </div><br />
        <div>
        <a>06月目标：</a>
        <input id="Text7" type="text" onkeyup="clearNoNum(this)" runat="server" autocomplete="off"/>
        </div><br />
        <div>
        <a>07月目标：</a>
        <input id="Text8" type="text" onkeyup="clearNoNum(this)" runat="server" autocomplete="off"/>
        </div><br />
        <div>
        <a>08月目标：</a>
        <input id="Text9" type="text" onkeyup="clearNoNum(this)" runat="server" autocomplete="off"/>
        </div><br />
        <div>
        <a>09月目标：</a>
        <input id="Text10" type="text" onkeyup="clearNoNum(this)" runat="server" autocomplete="off"/>
        </div><br />
           <div>
        <a>10月目标：</a>
        <input id="Text11" type="text" onkeyup="clearNoNum(this)" runat="server" autocomplete="off"/>
        </div><br />
           <div>
        <a>11月目标：</a>
        <input id="Text12" type="text" onkeyup="clearNoNum(this)" runat="server" autocomplete="off"/>
        </div><br />
           <div>
        <a>12月目标：</a>
        <input id="Text13" type="text" onkeyup="clearNoNum(this)" runat="server" autocomplete="off"/>
        </div><br />
        <div>
            <asp:Button ID="Button1" runat="server" Text="提交"  Width="98%" OnClick="Button1_Click"/>
        </div>
    </form>
</body>
</html>
