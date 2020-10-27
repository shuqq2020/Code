<%--
  Created by IntelliJ IDEA.
  User: SQQ
  Date: 2020/10/19
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>课程播放</title>
    <link rel="icon" href="../static/images/Code_House.png" type="image/png">
    <link rel="stylesheet" href="../static/css/header.css">
    <link rel="stylesheet" href="../static/css/index.css">
    <link rel="stylesheet" href="../static/css/bootstrap.min.css">
    <link rel="stylesheet" href="../static/css/bootstrap-theme.min.css">
    <script src="../static/js/jquery-3.3.1.min.js"></script>
    <script src="../static/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function GetRequest() {
            var url = location.search; //获取url中"?"符后的字串
            var theRequest = new Object();
            if (url.indexOf("?") != -1) {
                var str = url.substr(1);
                strs = str.split("&");
                for(var i = 0; i < strs.length; i ++) {
                    theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
                }
            }
            return theRequest;
        }
        var Request = new Object();
        Request = GetRequest();
        // var 参数1,参数2,参数3,参数N;
        // 参数1 = Request['参数1'];
        var id =Request["id"];
        $(document).ready(function () {
            $.ajax({
                url:"play",
                data:{
                    "id":id,
                },
                success:function () {
                }
            })
        })
    </script>
    <script type="text/javascript">

        function register() {
            var email = $("#email2").val();//取值
            var password = $("#password2").val();
            var username = $("#username").val();
            var sex = $('input[name="sex"]:checked').val();
            var emailreg = /^[0-9a-zA-Z_.-]+[@][0-9a-zA-Z_.-]+([.][a-zA-Z]+){1,2}$/;
            if (emailreg.test(email)) {
                if (email == "" || email == null) {
                    alert("邮箱不可为空");
                    $("#email2").focus();//获取焦点
                    return;
                }
            } else {
                alert("请输入正确的邮箱");
                $("#email2").focus();//获取焦点
                return;
            }

            if (password == "" || password == null) {
                alert("密码不能为空");
                $("#password").focus();//获取焦点
                return;
            }
            if (username == "" || username == null) {
                alert("用户名不能为空");
                $("#username").focus();
                return;
            }
            $.ajax({
                //编写json格式，设置属性和值
                url: "${pageContext.request.contextPath}/user/save",
                data: {
                    "email": email,
                    "password": password,
                    "username": username,
                    "sex": sex
                },
                dataType: "json",
                type: "post",
                success: function (data) {

                    if (data == true) {
                        alert("注册成功!");
                        window.location.href="play?id="+id;
                    } else {
                        alert("注册失败!")
                    }
                },
                error: function (data) {
                    alert("注册失败请稍后尝试!");
                }
            });
        }
        function login() {
            var email = $("#email1").val();//取值
            var password = $("#password1").val();
            var emailreg = /^[0-9a-zA-Z_.-]+[@][0-9a-zA-Z_.-]+([.][a-zA-Z]+){1,2}$/;
            if (emailreg.test(email)) {
                if (email == "" || email == null) {
                    alert("邮箱不可为空");
                    $("#email2").focus();//获取焦点
                    return;
                }
            } else {
                alert("请输入正确的邮箱");
                $("#email2").focus();//获取焦点
                return;
            }

            if (password == "" || password == null) {
                alert("密码不能为空");
                $("#password").focus();//获取焦点
                return;
            }

            $.ajax({
                //编写json格式，设置属性和值
                url: "${pageContext.request.contextPath}/user/login",
                data: {
                    "email": email,
                    "password": password,
                },
                dataType: "json",
                type: "post",
                success: function (data) {
                    if (data) {
                        alert("登录成功!");
                        window.location.href="play?id="+id;
                    } else {
                        alert("邮箱或密码有误!")
                    }
                },
                error: function (data) {
                    alert("登录失败请稍后尝试!");
                }
            });
        }
        function cleanout() {
            $.ajax({
                url: "${pageContext.request.contextPath}/user/clean",
                type:"post",
                success:function () {
                    window.location.href="play?id="+id;
                },
                error:function () {
                    alert("未知错误!!!!")
                }
            });
        }

    </script>
</head>
<body class="body" id="body">
<!--header-->
<header class="header" style="top: 0;background-color: #fff">
    <section class="header__wrap">
        <div class="header__logo"><a href="${pageContext.request.contextPath}/user/introduce" style="text-decoration: none">CodeHouse</a></div>
        <div class="header__item">
            <span><a href="${pageContext.request.contextPath}/movice/findPage">全部课程</a></span>
        </div>
        <c:if test="${empty user}">
            <nav class="header__nav" id="loginreg">
                <a href="javascript:void(0);" onclick="showlogin()">登录</a>
                <span>&nbsp;|&nbsp;</span>
                <a href="javascript:void(0);" onclick="showregister()">注册</a>
            </nav>
        </c:if>
        <c:if test="${!empty user}">
            <div class="users" id="users">
                <a href="#"><img src="https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80" alt="您的头像" class="userphoto"></a>
                <div class="userslogout">
                    <ul>
                        <li>欢迎你:${user.username}</li>
                        <li><a href="#">修改信息</a></li>
                        <li><a href="javascript:void(0);" onclick="cleanout()">退出</a></li>
                    </ul>
                </div>
            </div>
        </c:if>

        <div class="login" id="login">
            <!--关闭登录界面-->
            <div class="close">
                <a href="javascript:void(0);" onclick="closeDiv()">
                    <img src="../static/images/close.png" alt="close">
                </a>
            </div>
            <!--登录表单-->
            <form id="form1" class="form" onsubmit="return false" method="post">
                <div class="box">
                    <div class="form-group">
                        <label for="email1">邮箱</label>
                        <input type="text" class="form-control" id="email1" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <label for="password1">密码</label>
                        <input type="password" class="form-control" id="password1" placeholder="Password">
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-success" value="登录" onclick="login()">
                        <%--   <button type="submit" class="btn btn-success">登录</button>--%>
                        <span style="margin-left: 326px;display: inline-block">还没有账号<a href="javascript:void(0);" onclick="showregister()">去注册?</a></span>
                    </div>
                </div>
            </form>
        </div>
        <div class="register" id="register">
            <!--关闭注册界面-->
            <div class="close">
                <a href="javascript:void(0);" onclick="closeDiv()">
                    <img src="../static/images/close.png" alt="close">
                </a>
            </div>
            <!--注册表单-->
            <form id="form2" class="form" onsubmit="return false" method="post">
                <div class="form-group">
                    <label for="email2">邮箱</label>
                    <input type="email" class="form-control" name="email" id="email2" placeholder="Email">
                </div>
                <div class="form-group">
                    <label for="password2">密码</label>
                    <input type="password" class="form-control" name="password" id="password2" placeholder="Password">
                </div>
                <div class="form-group">
                    <label for="username">用户名</label>
                    <input type="text" class="form-control" name="username" id="username" placeholder="UserName">
                </div>
                <div class="form-group">
                    <label class="radio-inline">
                        <input type="radio" name="sex" id="man" value="男" checked="checked"> 男
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="sex" id="wuman" value="女"> 女
                    </label>
                </div>
                <div class="form-group">
                    <input type="button" class="btn btn-info" value="注册" onclick="register()">
                    <%--         <button type="submit" class="btn btn-info" id="btnregister">注册</button>--%>
                </div>
            </form>
        </div>
    </section>
</header>
<div style="margin-top: 80px">
    <div style="padding-left: 150px">
        <h3>${play.mname}</h3>
        <span>${play.introduction}</span>
    </div>
    <div style="margin:0 auto;width: 80%;height: 700px;" >
        <video width="100%" height="100%" controls autoplay>
            <source src="${play.movice_path}" type="video/mp4">
        </video>
    </div>
</div>
<%--评论部分--%>
<div>
    <c:choose>
        <c:when test="${empty user}">
            <div style="width: 80%;margin: 0 auto;height: 100px;line-height: 100px;text-align: center;background-color: #bbb;margin-top: 15px;border-radius: 10px">
                <span>想要评论？请先<a href="javascript:void(0)" onclick="showlogin()">登录</a></span>
                <span>或者<a href="javascript:void(0)" onclick="showregister()">注册</a></span>
            </div>
        </c:when>
        <c:otherwise>
            <form action="${pageContext.request.contextPath}/comment/save" style="width: 80%;margin: 0 auto">
                <input name="user_id" type="hidden" id="user_id" value="${user.uid}">
                <input name="movice_id" type="hidden" id="movice_id" value="${play.mid}">
                <div class="form-group">
                    <label style="font-size: 20px">评论:</label>
                    <textarea name="content" class="form-control" id="content" rows="5" placeholder="不超过300个字" style="resize: none;"></textarea>
                </div>
                <input type="submit" class="btn" value="发表">
            </form>
        </c:otherwise>
    </c:choose>

</div>

<%--评论展示--%>

<%--<div>
    <c:if test="${empty moviceAndComments}">
        <span>暂无评论</span>
    </c:if>
    <c:if test="${!empty moviceAndComments}">
        <c:forEach var="m" items="${moviceAndComments}" varStatus="status">
            <div>
                <span>第${status.index+1}楼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                <span>${m.username}:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

                <span>${m.content}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

                <span>[<fmt:formatDate value="${m.time}" type="date" pattern="yyyy-MM--dd HH:mm:ss"/> ]</span>
            </div>
        </c:forEach>
    </c:if>


</div>--%>
<%--jstl和el表达式的使用--%>
<div>
    <c:choose>
        <c:when test="${empty moviceAndComments}">
            <div style="width: 80%;margin: 0 auto;height: 100px;line-height: 100px;text-align: center;margin-top: 15px;border-radius: 10px">
                <span style="color: #bbb">暂无评论,快来抢沙发吧</span>
            </div>

        </c:when>
        <c:otherwise>
            <c:forEach var="m" items="${moviceAndComments}" varStatus="status">
                <div style="width: 80%;margin: 0 auto;border-bottom: 1px solid #e5e9ef;padding: 0 20px;margin-bottom: 10px">

                    <p style="color: #00a1d6;margin: 0;font-size: 16px;font-weight: bold">${m.username}</p>

                    <span style="display: inline-block;text-indent: 3em;">${m.content}</span>

                    <p style="color: #bbb;font-size: 12px;position: relative">[<fmt:formatDate value="${m.time}" type="date" pattern="yyyy-MM--dd HH:mm:ss"/> ]<span style="position: absolute;right: 0">第${status.index+1}楼</span></p>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>


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
<script type="text/javascript" src="../static/js/login.js">
</script>
<%--从数据库获取视频资料
<script type="text/javascript">
    $(document).ready(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/movice/show",
            success:function () {
            }
        })
    })
</script>--%>
</body>
</html>

