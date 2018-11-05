var KeyCodeList_1 = "阿杜广告策划公司,阿尔泰科技发展有限公司,艾波特环保科技股份有限公司";
var KeyCodeList_2 = "阿杜广告策划公司,阿尔泰科技发展有限公司,艾波特环保科技股份有限公司";
var KeyCodeList_3 = "阿杜广告策划公司,阿杜广告策划分公司,阿尔泰科技发展有限公司,阿志成软件公司,艾波特环保科技股份有限公司";
var KeyCodeList_4 = "阿杜广告策划公司,阿尔泰科技发展有限公司,艾波特环保科技股份有限公司";
var KeyCodeList_5 = "阿杜广告策划公司,阿尔泰科技发展有限公司,艾波特环保科技股份有限公司";
var KeyCodeList_6 = "阿杜广告策划公司,阿杜广告策划分公司,阿尔泰科技发展有限公司,阿志成软件公司,艾波特环保科技股份有限公司";
var KeyCodeList_7 = "阿杜广告策划公司,阿杜广告策划分公司,阿尔泰科技发展有限公司,阿志成软件公司,艾波特环保科技股份有限公司";
var KeyCodeList_8 = "阿杜广告策划公司,阿杜广告策划分公司,阿尔泰科技发展有限公司,阿志成软件公司,艾波特环保科技股份有限公司";
var CodeList_1 = "阿杜广告策划公司,阿尔泰科技发展有限公司,艾波特环保科技股份有限公司";
var CodeList_2 = "阿杜广告策划公司,阿尔泰科技发展有限公司,艾波特环保科技股份有限公司";
var CodeList_3 = "阿杜广告策划公司,阿尔泰科技发展有限公司,艾波特环保科技股份有限公司";
var CodeList_4 = "阿杜广告策划公司,阿尔泰科技发展有限公司,艾波特环保科技股份有限公司";
var CodeList_5 = "阿杜广告策划公司,阿尔泰科技发展有限公司,艾波特环保科技股份有限公司";
var CodeList_6 = "阿杜广告策划公司,阿尔泰科技发展有限公司,艾波特环保科技股份有限公司";
var CodeList_7 = "阿杜广告策划公司,阿尔泰科技发展有限公司,艾波特环保科技股份有限公司";
var CodeList_8 = "阿杜广告策划公司,阿尔泰科技发展有限公司,艾波特环保科技股份有限公司";

function SearchAjax1(keyword)
{   
    jQuery.ajax({
       type: "POST",
       async:false, //改为同步，执行完才执行后面的js
       url: "/Handler/Ajax.aspx",
       data: "taget=SBTSL&keyword=" + keyword,
       success: function(msg){
           KeyCodeList_1 = msg;
       }
    });
}

function SearchAjax2(keyword) {
    jQuery.ajax({
        type: "POST",
        async: false, //改为同步，执行完才执行后面的js
        url: "/Handler/Ajax.aspx",
        data: "taget=JXSSL&keyword=" + keyword,
        success: function (msg) {
            KeyCodeList_2 = msg;
        }
    });
}

if (mosi == null) { var mosi = {} };
mosi=
{
       LastNo:null
               ,
       SPACECHAR:null
               ,
       CodeList:null
               ,
      CodeListStr:null
               ,
       KeyList:null
       ,
       KeyCodeList:null
       ,
       LastValue:null
       ,
	   Initialize:function (){
            LastNo=0;
            SPACECHAR=" "; // 空白字元。
            CodeList=CodeList_1.split(',');
            KeyList=KeyCodeList_1.split(',');
            KeyCodeList=KeyCodeList_1;
            CodeListStr=CodeList_1;
            LastValue="";
            
            var hid_key=jQuery("#hid_key").val();
            switch(hid_key)
            {
                case "SBTSL":
                {   
                    SearchAjax1(jQuery("#TxtSBTX").val());
                    KeyList=KeyCodeList_1.split(',');
                    break;
                }
                case "JXSSL":
                    {
                        SearchAjax2(jQuery("#TxtJXSX").val());
                        KeyList = KeyCodeList_2.split(',');
                        break;
                    }
            } 
       }
        ,
      SendStr:function (s) {
           s=s.toLowerCase();
           if (s=="")
            {
             jQuery("#key_tip").hide();
             return;
             }
           if(LastValue==s){ return }
           mosi.Grep(s);
      }
      ,
      ImeKeyUp: function (e) {   
         var hidkey=jQuery("#hid_key").val();
          //修改开始
         if (jQuery(e).val() == "") {
             jQuery("#key_tip").hide();
             return;
         }
         //修改结束
     	 mosi.Initialize();
     	 jQuery("#key_tip").css("top", jQuery(e).position().top + jQuery(e).outerHeight()).css("left", jQuery(e).position().left).hide();
     	 var s = jQuery(e).val();
         //修改开始
         mosi.GetStrChineseList(s);
         //修改结束
         return(true);
       }
       ,
       setWD:function (key)
       {
           if (jQuery("#hid_key").val() == "SBTSL") {
               jQuery("#TxtSBTX").val(key);

           }
           else {
               jQuery("#TxtJXSX").val(key);
           }
           jQuery("#key_tip").hide();
        }
   ,
  GetStr:function GetStr(No, s){
      var sTmp="",sChi="";
      var i;
      var str="";
        str+='<table cellspacing="0" cellpadding="2" style="width: 282px;">';
        str+='<tbody>';
      //都是
      if(/^[a-zA-Z]*$/.test(s))
      {
             //alert(s);
             var ss=s.toLowerCase();
             for(i=0;i<=9;i++)
             {
                if(No+i>CodeList.length-1)
                {break;}
                sTmp=CodeList[No+i];
                if(sTmp.indexOf(ss)==0)
                {
                     sChi=CodeList[No+i];
                     str+='<tr onmouseover="this.style.background=\'#EBEBEB\'" onmouseout="this.style.background=\'#ffffff\'" onclick="mosi.setWD(\''+sChi.split(' ')[1]+'\');">';
                     //str+='<td style=\'cursor:pointer\'>'+sTmp+'</td>';
                     str+='<td style=\'cursor:pointer; text-align:left; width: 282px;\'>'+sChi.split(' ')[1]+'</td>';
                     str+='</tr>';  
                }
                else
                {
                  break;
                }
            } 
      }
     
    str+='</tbody>';
    str+='</table>';
    if(i>0)
    {
     jQuery("#key_tip").html("");
     jQuery("#key_tip").html(str);
     jQuery("#key_tip").show(); 
    }
      //alert(i+":"+CodeList[No+i].split(' ')[1]);
    if(i==1&&s==CodeList[No].split(' ')[0])
    {
     jQuery("#key_tip").hide(); 
    }
    
}
,
GetStrChinese:function (No, s){
  var sTmp="",sChi="";
  var i;
    var str="";
    str+='<table cellspacing="0" cellpadding="2" style="width: 282px;">';
    str+='<tbody>';
         for(i=0;i<=9;i++)
         {
            if(No+i>KeyList.length-1)
            {break;}
            sTmp=KeyList[No+i];
            //alert(sTmp);
            if(sTmp.indexOf(s)==0)
            {
             str+='<tr onmouseover="this.style.background=\'#EBEBEB\'" onmouseout="this.style.background=\'#ffffff\'" onclick="mosi.setWD(\''+sTmp+'\');">';
             str+='<td style=\'cursor:pointer; text-align:left; width: 282px;\'>'+sTmp+'</td>';
             str+='</tr>';  
            }
            else
            {
              break;
            }
        } 
    str+='</tbody>';
    str+='</table>';
    if(i>0)
    {
     jQuery("#key_tip").html("");
     jQuery("#key_tip").html(str);
     jQuery("#key_tip").show(); 
    }
  
    if(i==1&&s==KeyList[No])
    {
     jQuery("#key_tip").hide(); 
    }
}
,
GetStrChineseList:function (s){ //此处我自己临时加的
  var sTmp="";
  var i; 
  var j=-1;
    var str="";
    str+='<table cellspacing="0" cellpadding="2" style="width: 282px;">';
    str+='<tbody>';
         for(i=0;i<=9;i++)
         {
            if(i>KeyList.length-1)
            {break;}
            sTmp=KeyList[i];
            if(sTmp.indexOf(s)>=0) //if(sTmp.indexOf(s)==0)表示从头匹配 这是之前的
            {
             j = i;
             str+='<tr onmouseover="this.style.background=\'#EBEBEB\'" onmouseout="this.style.background=\'#ffffff\'" onclick="mosi.setWD(\''+sTmp+'\');">';
             str+='<td style=\'cursor:pointer; text-align:left; width: 282px;\'>'+sTmp+'</td>';
             str+='</tr>';  
            }
        } 
    str+='</tbody>';
    str+='</table>';
    if(j>-1)
    {
     jQuery("#key_tip").html("");
     jQuery("#key_tip").html(str);
     jQuery("#key_tip").show(); 
    }
    if(s==KeyList[j])
    {
     jQuery("#key_tip").hide(); 
    }
}
,
Grep:function Grep(s){
  
  
  var No=-1;
  if(s!="")
  {
    
    if(/^[a-zA-Z]*$/.test(s))
    {
       No=mosi.FindInEng(s);
      
        if(No>=0)
        {
        mosi.GetStr(No, s);
        }
        else
        {
        jQuery("#key_tip").hide();
        }
    }
    else
    {
    	 
        No=mosi.FindInChinese(s);
        
        if(No>=0)
        {
        	//alert(No);
        mosi.GetStrChinese(No, s);
        }
    }
    
  }
}
,

// 二分搜索法
FindIn:function (s) {		
var find=-1,low=0,mid=0,high=CodeList.length;
var sEng="";

  while(low<high){
    mid=(low+high)/2;
    mid=Math.floor(mid);
    sEng=CodeList[mid];
    if(sEng.indexOf(s,0)==0){find=mid;break;}
    sEng=CodeList[mid-1];
    if(sEng.indexOf(s,0)==0){find=mid;break;}
    if(sEng<s){low=mid+1;}else{high=mid-1;}
  }
  
  while(find>0){
    sEng=CodeList[find-1];
    if(sEng.indexOf(s,0)==0){find--;}else{break;}
  }
  
  return(find);
}
,
// 搜索法新的思路
FindInEng:function (s) {
    var find=-1,low=0,mid=0,high=CodeListStr.length;
    var Gnum=0;
    Gnum=CodeListStr.replace(","+s,","+s+"$").length-CodeListStr.length;
    if(Gnum>0)//有
    {
    var gList=CodeListStr.replace(","+s,","+s+"$").split('$')[0].split(',');
    find=gList.length-1;
    }
      return(find);
    }
,
// 搜索法新的思路
FindInChinese:function (s) {
    var find=-1,low=0,mid=0,high=KeyCodeList.length;
    var Gnum=0;
    Gnum=KeyCodeList.replace(","+s,","+s+"$").length-KeyCodeList.length;
    if(Gnum>0)//有
    {
    var gList=KeyCodeList.replace(","+s,","+s+"$").split('$')[0].split(',');
    
    find=gList.length-1;
    }
      return(find);
    }    
}

function closekey_tip(evt){
jQuery("#key_tip").hide(); 
}
document.onclick = closekey_tip;
