<%--
  Created by IntelliJ IDEA.
  User: SQQ
  Date: 2020/10/14
  Time: 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>CodeHouse</title>
    <link rel="icon" href="../static/images/Code_House.png" type="image/png">
    <link rel="stylesheet" href="../static/css/index.css">
    <link rel="stylesheet" href="../static/css/base.css">
    <link rel="stylesheet" href="../static/css/animate.css">
</head>
<body>
<div class="box">
    <!--header-->
    <header class="header">
        <section class="header__wrap">
            <div class="header__logo">CodeHouse</div>
            <nav class="header__nav">
                <a href="javascript:;" class="header__nav__item header__nav__item__status__active">实战案例</a>
                <a href="javascript:;" class="header__nav__item">商业案例</a>
                <a href="javascript:;" class="header__nav__item">课程体系</a>
                <a href="javascript:;" class="header__nav__item">学习环境</a>
                <a href="javascript:;" class="header__nav__item">云端学习</a>
                <a href="javascript:;" class="header__nav__item header__nav__item--study-now" id="study">立刻学习</a>
                <section class="header_nav_tip"></section>
            </nav>
        </section>
    </header>
    <!--screen1-->
    <section class="screen-1" id="study1">
        <section class="screen-1__practice-courses" ></section>
        <section class="container">
            <h2 class="screen-1__heading screen-1__heading_animate_init">实战课程重磅上线</h2>
            <p class="screen-1__heading-descrip screen-1__heading-descrip_animate_init">一键云学习,还在等待什么?</p>
        </section>

    </section>
    <!--screen2-->
    <section class="screen-2">
        <section class="container">
            <h1 class="screen-2__heading">每门课都是真实商业案例</h1>
            <section class="screen-2__sub-heading-tip"></section>
            <p class="screen-2__sub-heading">真实案例,真实场景,在实战中实践、操作、调试<br/>
                大牛带你体验BAT真实开发流程，所有开发过程一一为你呈现</p>
            <section class="screen-2__banner">
                <section class="screen-2__banner_i_1"></section>
                <section class="screen-2__banner_i_2"></section>
                <!--screen-2__banner_i_2人物图-->
                <section class="screen-2__banner_i_3"></section>
                <!--screen-2__banner_i_3火箭图-->
            </section>
        </section>
    </section>
    <!--screen3-->
    <section class="screen-3">
        <section class="screen-3__icon"></section>
        <section class="screen-3__content container">
            <section class="screen-3__content__heading">
                <h1>强大的语言课程体系支持</h1>
            </section>
            <section class="screen-3__content__tip"></section>
            <section class="screen-3__content__subheading">
                <p>学习环境与课程轻松对接,安装、调试、写入、部署、运行，一站式解决<br/>，让你体验开发全流程</p>
            </section>
            <section class="screen-3__content__items">
                <span class="screen-3__content__items-1">HTML5</span>
                <span class="screen-3__content__items-2">PHP</span>
                <span class="screen-3__content__items-3">JAVA</span>
                <span class="screen-3__content__items-4">PYTHON</span>
                <span class="screen-3__content__items-5">Node.js</span>
            </section>
        </section>
    </section>
    <!--screen4-->
    <section class="screen-4">
        <section class="screen-4__heading"><h2>省去到处翻阅资料的步骤</h2></section>
        <section class="screen-4__tips"></section>
        <section class="screen-4__subheading"><p>站内大神为您解惑</p></section>
        <section class="screen-4__items">
            <section class="screen-4__items-wrap1">
                <section class="screen-4__items-1-icon"></section>
                <section class="screen-4__items-title"><p>实战课程教您编码</p></section>
            </section>
            <section class="screen-4__items-wrap2">
                <section class="screen-4__items-2-icon"></section>
                <section class="screen-4__items-title"><p>提升学习兴趣</p></section>
            </section>
            <section class="screen-4__items-wrap3">
                <section class="screen-4__items-3-icon"></section>
                <section class="screen-4__items-title"><p>编译你的应用程序</p></section>
            </section>
            <section class="screen-4__items-wrap4">
                <section class="screen-4__items-4-icon"></section>
                <section class="screen-4__items-title"><p>学会如何完整的开发</p></section>
            </section>
        </section>
    </section>
    <!--screen5-->
    <section class="screen-5">
        <section class="screen-5_icon"></section>
        <section class="screen-5_heading">
            <h2>云端学习可以这样简单</h2>
        </section>
        <section class="screen-5_tip">

        </section>
        <section class="screen-5_subheading"><p>看视频、敲代码，一气呵成。为你提供的云学习平台，所见即所得。从此学习不一样</p></section>
    </section>
    <!--others-->
    <section class="screen-others">
        <a  class="screen-others_btn" href="${pageContext.request.contextPath}/movice/show">立即学习</a>
    </section>
    <!--footer-->
    <section class="footer">
        <nav class="footer_link">
            <a href="#">人才招聘</a>
            <a href="#">联系我们</a>
            <a href="#">高校联盟</a>
            <a href="#">关于我们</a>
            <a href="#">讲师招募</a>
            <a href="#">意见反馈</a>
        </nav>
        <p>Copyright &copy; 2020 CodeHouse.com All Rights Reserved |京ICP备 88888888号-8</p>
    </section>
    <!--outline-->
    <section class="outline">
        <a class="outline__nav" href="javascript:;">实战课程</a>
        <a class="outline__nav" href="javascript:;">商业案例</a>
        <a class="outline__nav" href="javascript:;">课程体现</a>
        <a class="outline__nav" href="javascript:;">学习环境</a>
        <a class="outline__nav" href="javascript:;">云端学习</a>
        <a class="outline__nav" href="#study">立刻学习</a>
    </section>
</div>

<script type="text/javascript" src="../static/js/index.js">

</script>
</body>
</html>
