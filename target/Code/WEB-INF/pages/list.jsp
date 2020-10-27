<%--
  Created by IntelliJ IDEA.
  User: SQQ
  Date: 2020/10/20
  Time: 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>课程分类</title>
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
        var c =Request["c"];

       $(document).ready(function () {
            $.ajax({
                url:"findPage",
                data:{
                    "c":c,
                },
                success:function () {
                }
            })
       })
    </script>
    <style>
        .nav{
            list-style: none;
        }
        .nav li{
            float: left;
        }
        .nav li a:hover{
            color: #f40;
        }

    </style>
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
                        window.location.href="finPage";
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
                        window.location.href="findPage";
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
                    window.location.href="findPage";
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
                    <button type="submit" style="border: none;background-color: #fff"><span class="glyphicon glyphicon-search">search</span></button>
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
<div style="margin-top: 5%;">
    <div>
        <ul class="nav" style="position: fixed;z-index: 3;background-color: #fff;">
            <li><span style="display: inline-block;line-height: 18px;font-weight: bold;padding: 10px 15px;">分类:</span></li>
            <li>
                <a href="${pageContext.request.contextPath}/movice/findPage">全部</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/movice/findPage?c=计算机">计算机网络</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/movice/findPage?c=HTML">HTML/CSS</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/movice/findPage?c=JavaScript">JavaScript</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/movice/findPage?c=UI">UI设计</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/movice/findPage?c=Vue">Vue.js</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/movice/findPage?c=React">React.js</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/movice/findPage?c=Node">Node.js</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/movice/findPage?c=jQuery">jQuery</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/movice/findPage?c=BootStrap">BootStrap</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/movice/findPage?c=小程序">小程序</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/movice/findPage?c=SpringBoot">SpringBoot</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/movice/findPage?c=c语言">C语言</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/movice/findPage?c=Android">Android</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/movice/findPage?c=MySql">Mysql</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/movice/findPage?c=Redis">Redis</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/movice/findPage?c=Java">Java</a>
            </li>
        </ul>
    </div>
</div>
<%--<div class="container-fluid" style="margin-bottom: 8%;width: 80%">
    <div class="row" style="margin-top: 5%">
        <div class="col-md-12 row" >
            <c:forEach var="all" items="${alls}">
                <div class="col-md-3" style="margin-bottom: 2%;height: 208px;">
                    <!--Regular if23-->
                    <div class="movice-box">
                        <a target="_blank" href="${pageContext.request.contextPath}/movice/play?id=${all.mid}">
                            <div>
                                <img src="<c:url value="${all.movice_cover}"/>" data-src="" alt="课程图片">
                                <div>
                                    <h4>${all.mname}</h4>
                                </div>
                                <div>
                                    <span>${all.introduction}</span>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

</div>--%>
<%--分页处理--%>

<div class="container-fluid" style="margin-bottom: 3%;width: 80%">
    <div class="row" style="margin-top: 8%;">
        <div class="col-md-12 row" >
            <h5></h5>
            <c:forEach var="a" items="${pageInfo.list}">
                <div class="col-md-3" style="margin-bottom: 2%;height: 208px">
                    <!--Regular if23-->
                    <div class="movice-box">
                        <a target="_blank" href="${pageContext.request.contextPath}/movice/play?id=${a.mid}">
                            <div>
                                <img src="<c:url value="${a.movice_cover}"/>" data-src="" alt="课程图片">
                                <div>
                                    <h4>${a.mname}</h4>
                                </div>
                                <div>
                                    <span>${a.introduction}</span>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="box-footer">
        <div class="pull-left">
            <div class="form-group form-inline">
                总共${pageInfo.pages}页，共${pageInfo.total}条数据。
                每页
                <select class="form-control" onchange="gotoPage(1,this.value)">
                    <c:forEach var="temp" begin="1" end="12">
                        <option ${pageInfo.pageSize==temp?'selected':''} value="${temp}">${temp}</option>
                    </c:forEach>
                </select>
                条

            </div>
        </div>

        <div class="box-tools pull-right">
            <ul class="pagination">
                <li><a href="javascript:gotoPage(1,'${pageInfo.pageSize}')" aria-label="Previous">首页</a></li>
                <li><a href="javascript:gotoPage('${pageInfo.prePage}','${pageInfo.pageSize}')">上一页</a></li>

                <%--处理页码--%>
                <c:forEach var="num"
                           begin="${(pageInfo.pageNum-5>0?(pageInfo.pageNum-5):1)}"
                           end="${(pageInfo.pageNum+5<=pageInfo.pages)?(pageInfo.pageNum+5):pageInfo.pages}">

                    <li>
                        <a href="javascript:gotoPage('${num}','${pageInfo.pageSize}')">
                                <%--判断：主要是为了给当前页显示红色--%>
                            <c:choose>
                                <c:when test="${num==pageInfo.pageNum}">
                                    <span style="color: #ff0000">${num}</span>
                                </c:when>
                                <c:otherwise>${num}</c:otherwise>
                            </c:choose>

                        </a>
                    </li>

                </c:forEach>
                <li><a href="javascript:gotoPage('${pageInfo.nextPage}','${pageInfo.pageSize}')">下一页</a></li>
                <li><a href="javascript:gotoPage('${pageInfo.pages}','${pageInfo.pageSize}')" aria-label="Next">尾页</a></li>
            </ul>
        </div>

    </div>


</div>
<form id="page" action="findPage" method="post">
    <input type="hidden" name="pageNum" id="pageNum">
    <input type="hidden" name="pageSize" id="pageSize">
    <input type="hidden" name="c" id="c">
</form>

<script type="text/javascript">
    //分页的方法
    //参数1：当前类
    //参数2：当前页
    //参数3：页大小
    function gotoPage(pageNum,pageSize){
        // 给表单隐藏域赋值
        $("#pageNum").val(pageNum);
        $("#pageSize").val(pageSize);
        $("#c").val(c);
        // 提交表单
        // document.forms[0] 获取页面的第一个表单
        document.forms[3].submit();
    }
</script>
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
<script type="text/javascript" src="../static/js/login.js"></script>
</body>
</html>
