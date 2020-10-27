<%--
  Created by IntelliJ IDEA.
  User: SQQ
  Date: 2020/10/20
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Serach</title>
    <link rel="icon" href="../static/images/Code_House.png" type="image/png">
    <link rel="stylesheet" href="../static/css/header.css">
    <link rel="stylesheet" href="../static/css/index.css">
    <link rel="stylesheet" href="../static/css/bootstrap.min.css">
    <link rel="stylesheet" href="../static/css/bootstrap-theme.min.css">
    <script src="../static/js/jquery-3.3.1.min.js"></script>
    <script src="../static/js/bootstrap.min.js"></script>
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
                        window.location.href="list";
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
                        window.location.href="list";
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
                    window.location.href="list";
                },
                error:function () {
                    alert("未知错误!!!!")
                }
            });
        }
    </script>
</head>
<body>
<!--header-->
<header class="header" style="top: 0;background-color: #fff">
    <section class="header__wrap">
        <div class="header__logo"><a href="${pageContext.request.contextPath}/user/introduce" style="text-decoration: none">CodeHouse</a></div>
        <div class="header__item">
            <span><a href="${pageContext.request.contextPath}/movice/findPage">全部课程</a></span>
        </div>
        <form action="findSearch">
            <div style="position: absolute;right: 130px;top: 28px;" >

                <input type="text" id="search" name="search">
                <button type="submit"  style="border: none;background-color: #fff"><span class="glyphicon glyphicon-search">search</span></button>
            </div>
        </form>
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
<div class="container-fluid" style="margin-bottom: 3%;width: 70%">
    <div class="row">
        <div class="col-md-12 row" style="margin-top: 100px">
            <h2>全站搜索结果</h2>
            <c:forEach var="a" items="${list}">
                <div  style="margin-bottom: 2%;border-bottom: 1px solid #bbb;padding-bottom: 20px">
                    <!--Regular if23-->
                    <div class="movice-box">
                        <a target="_blank" href="${pageContext.request.contextPath}/movice/play?id=${a.mid}">
                            <div class="row">
                                <img src="<c:url value="${a.movice_cover}"/>" data-src="" alt="课程图片" class="col-lg-2">
                                <div class="col-lg-6">
                                    <h4>${a.mname}</h4>
                                    <span>${a.introduction}</span>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
