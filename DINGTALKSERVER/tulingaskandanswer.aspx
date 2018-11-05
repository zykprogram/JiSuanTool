<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tulingaskandanswer.aspx.cs" Inherits="WebApp.DINGTALKSERVER.tulingaskandanswer" %>

<!DOCTYPE html>
<!-- saved from url=(0067)http://www.tuling123.com/experience/exp_virtual_robot.jhtml?nav=exp -->
<html lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>虚拟机器人-体验</title>
<meta name="Author" content="TURING Team">
<meta name="Copyright" content="TURING">
<meta name="keywords" content="图灵机器人,智能机器人,turingos,图灵os,聊天机器人,机器人,智能,人工智能,机器人操作系统,AI,自动回复">
<meta name="description" content="图灵机器人平台，基于自然语言处理、知识库和云计算等技术，为广大开发者、合作伙伴提供的一系列智能语义处理能力（包括语义理解、智能问答、知识库对接等）的服务平台。可以让所有专业和非专业的IT人员快速开发出智能机器人、聊天机器人，实现企业客服系统的自动回复。">
    <link rel="icon" href="http://www.tuling123.com/experience/favicon.ico" type="image/x-icon">
    <link href="../CSS/reset.css" rel="stylesheet" type="text/css">
    <link href="../CSS/header.css" rel="stylesheet" type="text/css">
    <link href="../CSS/footer.css" rel="stylesheet" type="text/css">
    <link href="../CSS/experience.css" rel="stylesheet" type="text/css">
    <script src="../CSS/jquery-1.11.1.min.js.下载"></script>
<link rel="stylesheet" href="../CSS/layer.css" id="layui_layer_skinlayercss"><script src="../CSS/share.js.下载"></script><link rel="stylesheet" href="../CSS/share_style0_16.css"><link rel="stylesheet" href="../CSS/weixin_popup.css"></head>
<body>
<script type="text/javascript" src="../CSS/browser.js.下载"></script>
<script src="../CSS/layer.js.下载"></script>
<div class="header">
    <div class="logo"><a href="http://www.tuling123.com/"><img src="../CSS/index_logo.png" alt="" data-bd-imgshare-binded="1"></a></div>
    <div class="by"><img src="../CSS/by.png" alt="" data-bd-imgshare-binded="1"></div>
    <div class="application">
        <div class="imgs" style="background: url(/resources/web/v4/img/personalCen/icon36.png) left center no-repeat;background-size:100% 100%;">
            <div class="sel">
                <a href="http://www.tuling123.com/member/center/">个人中心</a>
                <a href="http://www.tuling123.com/logout/">退出登录</a>
            </div>
        </div>
    </div>
    <ul class="mainMenu">
        <li>
            <a href="http://www.tuling123.com/">
                <div class="menu ">首页</div>
            </a>
        </li>
        <li>
            <div class="menu active spe" style="+position: relative;">
                产品<span class="toDown sprite1"></span>
                <div class="selectBox clearfix">
                    <div class="l">
                        <p class="tit">核心产品</p>
                        <a href="http://www.tuling123.com/os/index.jhtml?nav=prod" class="con">Turing OS</a>
                        <a href="http://www.tuling123.com/products/pro_turing_robot.jhtml?nav=prod" class="con">图灵机器人</a>
                    </div>
                    <div class="r">
                        <p class="tit">应用场景</p>
                        <a href="http://www.tuling123.com/products/pro_smart_home.jhtml?nav=prod" class="con">智能家居</a>
                        <a href="http://www.tuling123.com/products/pro_intel_service.jhtml?nav=prod" class="con">智能客服</a>
                        <a href="http://www.tuling123.com/products/pro_smart_watch.jhtml?nav=prod" class="con active">智能手表</a>
                        <a href="http://www.tuling123.com/products/pro_intel_vehicle.jhtml?nav=prod" class="con">智能车载</a>
                        <a href="http://www.tuling123.com/products/pro_virtual_robot.jhtml?nav=prod" class="con">虚拟机器人</a>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <a href="http://www.tuling123.com/experience/experience.jhtml?nav=exp">
                <div class="menu special">体验</div>
            </a>
        </li>
        <li>
            <a href="http://www.tuling123.com/help/help_center.jhtml?nav=doc">
                <div class="menu">帮助中心</div>
            </a>
        </li>
        <li>
            <a href="http://bbs.tuling123.com/">
                <div class="menu">社区</div>
            </a>
        </li>
    </ul>
</div>
    <div class="con">
        <div class="close"></div>
        <p class="tit">你可以这样问我</p>
        <p class="btm1" style="display: none;">开始成语接龙</p>
        <p class="btm2" style="display: none;"></p>
        <p class="btm3" style="display: none;"></p>
    </div>
</div>
<div class="wapper_ex">
    <div class="con">
        <div class="wap clearfix">
            <div class="message">
                <div class="top">
                    <span></span>
                    <p>图图</p>
                </div>
                <div class="btm">
                    <p>喜欢的事</p>
                    <div class="clearfix">
                        <span class="col1">爱聊天</span>
                        <span class="active col2">见义勇为</span>
                        <span class="col3">工作狂</span>
                        <span class="active col4">唱歌</span>
                    </div>
                    <p>讨厌的事</p>
                    <div class="clearfix">
                        <span class="col1">被冤枉</span>
                        <span class="active col2">无所事事</span>
                        <span class="col3">没钱花</span>
                        <span class="active col4">吵架</span>
                    </div>
                </div>
            </div>
            <div class="dialogue">
                <div class="roll" style="display: none;"><span class="point" style="top: 326px;"></span></div>
                <div class="displayArea">
                    <div class="diswap">
                        <div class="rotWord clearfix"> <span></span> <p id="member">你好，最近过得怎么样？<i></i></p></div>
                    <div class="rotWord clearfix"> <span></span> <p>好吧，我自己玩去了。。<i></i></p></div><div class="rotWord clearfix"> <span></span> <p>喂，怎么不说话了<i></i></p></div><div class="mWord clearfix"><span></span><p>笑话<i></i></p></div><div class="rotWord clearfix"> <span></span> <p>一个小孩来问我：“阿姨，您是卖书的吗？”“是的。” 我回答。“那请您给我查一查，上帝坐地是什么牌子的轿车？”<i></i></p></div><div class="rotWord clearfix"> <span></span> <p>咦，人去哪儿了？<i></i></p></div><div class="mWord clearfix"><span></span><p>开始成语接龙<i></i></p></div><div class="rotWord clearfix"> <span></span> <p>进入成语接龙模式：绝裙而去<i></i></p></div></div>
                </div>
                <div class="writeArea clearfix">
                    <input type="text" maxlength="200" placeholder="">
                    <span>发 送</span>
                </div>
                <div class="bdsharebuttonbox bdshare-button-style0-16" data-tag="share_1" id="share" data-bd-bind="1491029811449">
                    <em class="sp">分享</em>
                    <a class="sp1" data-cmd="weixin" title="分享到微信"></a>
                    <a class="sp2" data-cmd="tsina" title="分享到新浪微博"></a>
                    <a class="sp3" data-cmd="qzone" title="分享到QQ空间"></a>
                    <em class="sp4">接入图灵机器人</em>
                </div>
                <script>
                    window._bd_share_config = {
                        common: {
                            bdText: '每一款产品，都可以接入一个智能的虚拟机器人',
                            bdDesc: '每一款产品，都可以接入一个智能的虚拟机器人',
                            bdUrl: 'http://www.tuling123.com/experience/exp_virtual_robot.jhtml',
                            bdPic: 'http://www.tuling123.com/resources/web/v4/img/index/index_logo.png'
                        },
                        share: [{
                            "bdSize": 16
                        }],
                        image: [{
                            viewType: 'list',
                            viewPos: 'top',
                            viewColor: 'black',
                        }]
                    }
                    with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion=' + ~(-new Date() / 36e5)];
                </script>
            </div>
            <div class="example">
                <ul class="clearfix">
                    <li value1="你好，你是美女么？" value2="挖掘机技术哪家强？">
                        <span class="spic1"></span>
                        <p>聊天</p>
                    </li>
                    <li value1="讲个笑话" value2="冷笑话">
                        <span class="spic2"></span>
                        <p>笑话</p>
                    </li>
                    <li value1="刘亦菲的图片">
                        <span class="spic3"></span>
                        <p>图片</p>
                    </li>
                    <li value1="北京今天的天气" value2="北京今天的空气质量">
                        <span class="spic4"></span>
                        <p>天气</p>
                    </li>
                    <li value1="地球到月球的距离" value2="感冒应该怎么办" value3="虎皮鹦鹉吃什么">
                        <span class="spic5"></span>
                        <p>问答</p>
                    </li>
                    <li value1="百科周杰伦" value2="李连杰的介绍">
                        <span class="spic6"></span>
                        <p>百科</p>
                    </li>
                    <li value1="讲个故事" value2="讲个白雪公主的故事">
                        <span class="spic7"></span>
                        <p>故事</p>
                    </li>
                    <li value1="我要看新闻" value2="体育新闻" value3="周杰伦的新闻">
                        <span class="spic8"></span>
                        <p>新闻</p>
                    </li>
                    <li value1="红烧肉怎么做" value2="辣子鸡丁的菜谱">
                        <span class="spic9"></span>
                        <p>菜谱</p>
                    </li>
                    <li value1="天蝎座明天的运势" value2="现在是什么星座" value3="今年属牛的运势">
                        <span class="spic10"></span>
                        <p>星座</p>
                    </li>
                    <li value1="周杰伦这个名字好不好" value2="10086凶吉">
                        <span class="spic11"></span>
                        <p>凶吉</p>
                    </li>
                    <li value1="3乘以5等于多少" value2="25*25等多少">
                        <span class="spic12"></span>
                        <p>计算</p>
                    </li>
                    <li value1="顺丰快递">
                        <span class="spic13"></span>
                        <p>快递</p>
                    </li>
                    <li value1="明天从北京到上海的航班">
                        <span class="spic14"></span>
                        <p>飞机</p>
                    </li>
                    <li value1="明天从北京到石家庄的火车">
                        <span class="spic15"></span>
                        <p>列车</p>
                    </li>
                    <li value1="开始成语接龙">
                        <span class="spic16"></span>
                        <p>成语接龙</p>
                    </li>

                </ul>
                <p class="more">
                    <a href="http://www.tuling123.com/products/pro_virtual_robot.jhtml?nav=prod">了解更多</a>
                </p>
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <div class="wapper">
        <div class="sns">
            <a href="https://www.facebook.com/turingrobot/" target="_blank"><span class="sprite1 index_foot_icon01"></span></a>
            <a href="http://www.linkedin.com/company/10366133/" target="_blank"><span class="sprite1 index_foot_icon02"></span></a>
            <a href="https://twitter.com/turing2016/" target="_blank"><span class="sprite1 index_foot_icon03"></span></a>
            <span class="sprite1 index_foot_icon04"><div class="code"></div></span>
        </div>
       <p class="log-check"><a href="http://www.tuling123.com/recruitment/index.jhtml" target="_blank">面试结果查询</a></p>
        <p class="msg">
            <span class="mailbox sprite1 index_foot_icon06">邮箱地址: tuling123@uzoo.cn</span>
            <span class="qq sprite1 index_foot_icon07">QQ技术交流群: 481949674</span>
        </p>
        <p class="part">
                <a href="http://www.haoservice.com/" target="_blank">Haoservice</a>
                <a href="http://www.apicloud.com/" target="_blank">APICloud</a>
                <a href="http://xfyun.cn/" target="_blank">讯飞开放平台</a>
                <a href="http://www.weixinyunduan.com/" target="_blank">微讯云端</a>
                <a href="http://www.yuntongxun.com/" target="_blank">容联云通讯</a>
                <a href="http://apistore.baidu.com/" target="_blank">API Store</a>
                <a href="http://www.rongcloud.cn/" target="_blank">融云即时通讯云</a>
                <a href="http://cqp.cc/forum.php" target="_blank">酷Q社区</a>
                <a href="http://www.phpchina.com/" target="_blank">PHPChina</a>
                <a href="http://yuyin.baidu.com/" target="_blank">百度语音</a>
                <a href="http://www.xiaoweirobot.com/" target="_blank">小微机器人</a>
                <a href="http://www.jikexueyuan.com/" target="_blank">极客学院</a>
        </p>
        <p class="permission">
            许可证号：京ICP备14018272号&nbsp;&nbsp;&nbsp;&nbsp;备案编号：京公网安备110108020115812号&nbsp;&nbsp;Copyright&nbsp;©&nbsp;2014-2016&nbsp;图灵机器人（雷风）&nbsp;All&nbsp;rights&nbsp;Reserved
        </p>
        <p class="about">
            <a href="http://www.tuling123.com/about/contact_us.jhtml?nav=no">联系我们</a>
        <span></span>
        <a href="http://www.tuling123.com/about/about_us.jhtml?nav=no">关于我们</a>
        <span></span>
        <a href="http://www.tuling123.com/about/conperative_partner.jhtml?nav=no">合作伙伴</a>
        <span></span>
        <a href="http://www.tuling123.com/about/friends_link.jhtml?nav=no">友情链接</a>
        </p>
    </div>
</div>

<script>
    if (!window.localStorage.getItem("_userid")) {
        window.localStorage.setItem("_userid", 'd1fe831c-035a-4a13-ba1b-ca6f24ab74dc');
    }
    var userid = window.localStorage.getItem("_userid");

    function member() {
        var memArr = ['你好，最近过得怎么样？', '嗨，最近想我没有？[羞涩]', 'HI，[记忆系统]已上线，从今天起我会牢记您的大名！来试试看吧~', '嗨，有什么想对我聊聊么？', ];
        var num = Math.floor(Math.random() * memArr.length);
        $('#member').html(memArr[num] + '<i></i>')
    }
    member()
    var arrPLace = ['你好呀，想我了吗？', '跟我聊聊吧，你可以问我姚明多高？', '做什么呢？对我说讲笑话，我就会逗你开心哦', '快告诉我天蝎座明天的运势怎么样', '给我查查明天北京到上海的航班'];
    var num = Math.floor(Math.random() * 5);
    $('.writeArea input').attr('placeholder', arrPLace[num]);

    var webTuring = {
        point: function () {
            var sum = 0;
            $('.roll span').mousedown(function (ev) {
                var startT = ev.pageY;
                var t = parseFloat($('.point').css('top'));
                add();
                $('.wapper_ex').addClass('stop');
                $(document).mousemove(function (ev) {
                    var moveT = ev.pageY;
                    var m = t + moveT - startT;
                    if (m < 0) {
                        m = 0;
                    }
                    if (m > 326) {
                        m = 326;
                    }
                    $('.point').css('top', m);
                    var newM = m / 326 * (sum - 364);
                    $('.displayArea').scrollTop(newM);
                })
                $(document).mouseup(function () {
                    $('.wapper_ex').removeClass('stop');
                    $(document).unbind('mousemove');
                })
            })
            function add() {
                sum = 0;
                $('.diswap>div').each(function () {
                    sum += $(this).outerHeight(true);
                })
            }
            $('.displayArea').scroll(function () {
                add();
                $('.point').css('top', $('.displayArea').scrollTop() / (sum - 364) * 326);
            })

            $('.example li').click(function () {
                $('.bg_ex').show();
                $('.btm1').html($(this).attr('value1')).show();
                if ($(this).attr('value2')) $('.btm2').html($(this).attr('value2')).show();
                if ($(this).attr('value3')) $('.btm3').html($(this).attr('value3')).show();
            })
            $('.close').click(function () {
                $('.bg_ex').hide();
                $('.btm1').hide();
                $('.btm2').hide();
                $('.btm3').hide();
            })
            var timerTenMin = null;
            var memNum = 0;
            function memberth() {
                var memArr = ['喂，怎么不说话了', '人呢？', '理一下我嘛。。', '咦，人去哪儿了？', '是不是觉得很无聊呀', '回答我呀？', '好吧，我自己玩去了。。', ];
                var num = Math.floor(Math.random() * memArr.length);
                return memArr[num];
            }
            function timeTenMin() {
                if (memNum >= 3) {
                    return;
                }
                clearInterval(timerTenMin);
                timerTenMin = setInterval(function () {
                    var yhy = memberth();
                    $('.diswap').append('<div class="rotWord clearfix"> <span></span> <p>' + yhy + '<i></i></p></div>');
                    memNum++;
                    if (memNum >= 3) {
                        clearInterval(timerTenMin);
                        return;
                    }
                    scrollBtm();
                }, 60000)
            }
            timeTenMin();
            $('.bg_ex p:not(.tit)').click(function () {
                $('.diswap').append('<div class="mWord clearfix"><span></span><p>' + $(this).html() + '<i></i></p></div>');
                scrollBtm();
                $('.close').click();
                submitvalues($(this).html());
                timeTenMin();
            })
            $('.writeArea span').click(function () {
                timeTenMin();
                var val = $.trim($('.writeArea input').val());
                if (val == '') {
                    return;
                }
                if (val == '绑定') {
                    $('.diswap').append('<div class="mWord clearfix"><span></span><p>' + val + '<i></i></p></div>');
                    $('.diswap').append('<div class="rotWord clearfix"> <span></span> <p>' + userid + '<i></i></p></div>');
                    $('.writeArea input').val('');
                    scrollBtm();
                    return;
                }
                $('.writeArea input').attr('placeholder', '');
                $('.diswap').append('<div class="mWord clearfix"><span></span><p>' + val + '<i></i></p></div>');
                scrollBtm();
                submitvalues(val);
                $('.writeArea input').val('');
            })
            $('.displayArea').mouseover(function () {
                if (sum > 374) $('.roll').show();
            })
            $('.displayArea').mouseout(function () {
                if (sum > 374) $('.roll').hide();
            })
            $('.roll').mouseover(function () {
                $('.roll').show();
            })
            $(window).keydown(function (event) {
                switch (event.keyCode) {
                    case 13: $('.writeArea span').click();
                        break;
                }
            })
            function scrollBtm() {
                add();
                if (sum - 364 < 0) return;
                $('.displayArea').scrollTop(sum - 364);
            }

            function submitvalues(content) {
                // content = content.replace('+', "%2B");
                // content = content.replace('&', "%26");
                // content = content.replace('%', "%25");
                $.ajax({
                    url: "/api/product_exper/chat.jhtml",
                    data: { "info": content, 'userid': userid, "_xsrf": '' },
                    type: "POST",
                    dataType: "xml",
                    cache: false,
                    success: function (data) {
                        var xml = data;
                        if ($(xml).find('MsgType').text() == 'text') {
                            var content = $(xml).find("Content").text().replace(/\n/g, "<br>");
                            if (content.indexOf('#@#') > 0) {
                                var contentArr = content.split('#@#');
                                $('.diswap').append('<div class="rotWord clearfix"> <span></span> <p>' + contentArr[0] + '<i></i></p></div>');
                                setTimeout(function () {
                                    $('.diswap').append('<div class="rotWord clearfix"> <span></span> <p>' + contentArr[1] + '<i></i></p></div>');
                                    scrollBtm();
                                }, 300)
                            } else {
                                $('.diswap').append('<div class="rotWord clearfix"> <span></span> <p>' + content + '<i></i></p></div>');
                            }
                        } else if ($(xml).find('MsgType').text() == 'news') {
                            if ($(xml).find('Articles item PicUrl').eq(1).text() == '') {
                                if ($(xml).find('Articles item Url').eq(1).text() == '') {
                                    $('.diswap').append('<div class="rotWord1 clearfix"> <span></span> <div class="findMsg"> <i></i> <div class="main"><div class="info"> <a href="javascript:;"> <div class="make">' + $(xml).find("item").eq(0).find("Title").text() + '-' + $(xml).find("item").eq(0).find("Description").text() + '</div> </a></div> <div class="line"></div> <div class="info"> <a href="javascript:;"> <div class="make">' + $(xml).find("item").eq(1).find("Title").text() + '-' + $(xml).find("item").eq(1).find("Description").text() + '</div> </a></div> <div class="line"></div> <div class="info"> <a href="javascript:;"> <div class="make">' + $(xml).find("item").eq(2).find("Title").text() + '-' + $(xml).find("item").eq(2).find("Description").text() + '</div> </a> </div></div> </div> </div>')
                                } else {
                                    $('.diswap').append('<div class="rotWord1 clearfix"> <span></span> <div class="findMsg"> <i></i> <div class="main"><div class="info"> <a href="' + $(xml).find("item").eq(0).find("Url").text() + '"> <div class="make">' + $(xml).find("item").eq(0).find("Title").text() + '-' + $(xml).find("item").eq(0).find("Description").text() + '-' + $(xml).find("item").eq(0).find("Description").text() + '</div> </a></div> <div class="line"></div><div class="info"> <a href="' + $(xml).find("item").eq(1).find("Url").text() + '"> <div class="make">' + $(xml).find("item").eq(1).find("Title").text() + '-' + $(xml).find("item").eq(1).find("Description").text() + '</div> </a></div> <div class="line"></div> <div class="info"> <a href="' + $(xml).find("item").eq(2).find("Url").text() + '"> <div class="make">' + $(xml).find("item").eq(2).find("Title").text() + '-' + $(xml).find("item").eq(2).find("Description").text() + '</div> </a></div></div> </div> </div>')
                                }
                            } else {
                                if ($(xml).find('Articles item Url').eq(1).text() == '') {
                                    $('.diswap').append('<div class="rotWord1 clearfix"> <span></span> <div class="findMsg"> <i></i> <div class="main"> <div class="pic"><p>' + $(xml).find("item").eq(0).find("Title").text() + '</p><a href="' + $(xml).find("item").eq(0).find("Url").text() + '"><img src="' + $(xml).find("item").eq(0).find("PicUrl").text() + '" alt=""></a> </div> <div class="info"> <a href="javascript:;"> <div class="make">' + $(xml).find("item").eq(1).find("Title").text() + '</div> </a><a href="javascript:;"><img src="' + $(xml).find("item").eq(1).find("PicUrl").text() + '" alt=""></a> </div> <div class="line"></div> <div class="info"> <a href="javascript:;"> <div class="make">' + $(xml).find("item").eq(2).find("Title").text() + '</div> </a> <a href="javascript:;"><img src="' + $(xml).find("item").eq(2).find("PicUrl").text() + '" alt=""></a> </div></div> </div> </div>')
                                } else {
                                    $('.diswap').append('<div class="rotWord1 clearfix"> <span></span> <div class="findMsg"> <i></i> <div class="main"> <div class="pic"><p>' + $(xml).find("item").eq(0).find("Title").text() + '</p> <a href="' + $(xml).find("item").eq(0).find("Url").text() + '"><img src="' + $(xml).find("item").eq(0).find("PicUrl").text() + '" alt=""></a> </div> <div class="info"> <a href="' + $(xml).find("item").eq(1).find("Url").text() + '"> <div class="make">' + $(xml).find("item").eq(1).find("Title").text() + '</div> </a><a href="' + $(xml).find("item").eq(1).find("Url").text() + '"><img src="' + $(xml).find("item").eq(1).find("PicUrl").text() + '" alt=""></a> </div> <div class="line"></div> <div class="info"> <a href="' + $(xml).find("item").eq(2).find("Url").text() + '"> <div class="make">' + $(xml).find("item").eq(2).find("Title").text() + '</div> </a> <a href="' + $(xml).find("item").eq(2).find("Url").text() + '"><img src="' + $(xml).find("item").eq(2).find("PicUrl").text() + '" alt=""></a> </div></div> </div> </div>')
                                }
                            }
                        }
                        $('.diswap a').attr("target", "_blank");
                        scrollBtm();
                    }
                });
            }
            return this;
        }
    }

    webTuring.point();
    $('#share .sp4').click(function () {
        window.location = '/member/center/index.jhtml';
    })
</script>
</html>
<script type="text/javascript">
    $(function () {
        $("#btn").click(function () {
            $("#txt").append("本人  " + new Date().format("yyyy-MM-dd hh:mm:ss") + "\r\n");
            $("#txt").append("" + document.getElementById("ans").value + "\r\n");
            //   document.getElementById("ans").value="";
            $.post("tuling.ashx", { ans: $("#ans").val() }, function (data) {
                if (data.text) {
                    $("#txt").append("小智  " + new Date().format("yyyy-MM-dd hh:mm:ss") + "\r\n");
                    $("#txt").append("" + data.text + "\r\n");
                    if (data.list) {
                        $("#txt").append(data.list + "\r");
                    }
                    $("#ans").val("");
                }

            }, "json");
        });
    })

    Date.prototype.format = function (fmt) {
        var o = {
            "M+": this.getMonth() + 1,                 //月份 
            "d+": this.getDate(),                    //日 
            "h+": this.getHours(),                   //小时 
            "m+": this.getMinutes(),                 //分 
            "s+": this.getSeconds(),                 //秒 
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
            "S": this.getMilliseconds()             //毫秒 
        };
        if (/(y+)/.test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        }
        for (var k in o) {
            if (new RegExp("(" + k + ")").test(fmt)) {
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            }
        }
        return fmt;
    }
</script>
