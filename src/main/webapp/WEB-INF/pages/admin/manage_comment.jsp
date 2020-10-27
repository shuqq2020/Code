<%--
  Created by IntelliJ IDEA.
  User: SQQ
  Date: 2020/10/26
  Time: 8:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>评论管理 - CodeHouse(Admin)后台管理系统</title>
    <link rel="icon" href="\${pageContext.request.contextPath}/../../static/images/Code_House.png" type="image/png">
    <link href="\${pageContext.request.contextPath}/../../static/css/bootstrap.css" rel="stylesheet">
    <link href="\${pageContext.request.contextPath}/../../static/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="\${pageContext.request.contextPath}/../../static/css/style.min.css" rel="stylesheet">
</head>

<body>
<div class="lyear-layout-web">
    <div class="lyear-layout-container">
        <!--左侧导航-->
        <aside class="lyear-layout-sidebar">

            <!-- logo -->
            <div id="logo" class="sidebar-header" style="text-align: center">
                <%--                <a href="javascript:void(0);"><img src="${pageContext.request.contextPath}/../../static/images/CodeHouse.png" title="CodeHouse" alt="CodeHouse" /></a>--%>
                <h1>CodeHouse</h1>
            </div>
            <div class="lyear-layout-sidebar-scroll">

                <nav class="sidebar-main">
                    <ul class="nav nav-drawer">
                        <li class="nav-item active"> <a href="adminIndex"><i class="mdi mdi-home"></i> 后台首页</a> </li>
                        <li class="nav-item nav-item-has-subnav active open">
                            <a href="javascript:void(0)"><i class="mdi mdi-format-align-justify"></i>后台管理</a>
                            <ul class="nav nav-subnav">
                                <li> <a href="manage_user">用户管理</a> </li>
                                <li> <a href="manage_movice">课程管理</a> </li>
                                <li class="active"> <a href="manage_comment">评论管理</a> </li>
                            </ul>
                        </li>
                    </ul>
                </nav>

                <div class="sidebar-footer">
                    <p class="copyright">Copyright &copy; 2020 CodeHouse.com All Rights Reserved.</p>
                </div>
            </div>

        </aside>
        <!--End 左侧导航-->

        <!--头部信息-->
        <header class="lyear-layout-header">

            <nav class="navbar navbar-default">
                <div class="topbar">

                    <div class="topbar-left">
                        <div class="lyear-aside-toggler">
                            <span class="lyear-toggler-bar"></span>
                            <span class="lyear-toggler-bar"></span>
                            <span class="lyear-toggler-bar"></span>
                        </div>
                        <span class="navbar-page-title"> 后台首页 </span>
                    </div>

                    <ul class="topbar-right">
                        <li class="dropdown dropdown-profile">
                            <a href="javascript:void(0)" data-toggle="dropdown">
                                <img class="img-avatar img-avatar-48 m-r-10" src="https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80" alt="CodeHouse" />
                                <span>CodeHouse<span class="caret"></span></span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <li> <a href="admin_changeInfo?id=${admin.uid}"><i class="mdi mdi-account"></i> 个人信息</a> </li>
                                <li> <a href="admin_changePass"><i class="mdi mdi-lock-outline"></i> 修改密码</a> </li>
                                <li> <a href="javascript:void(0);"><i class="mdi mdi-delete"></i> 清空缓存</a></li>
                                <li class="divider"></li>
                                <li> <a href="login"><i class="mdi mdi-logout-variant"></i> 退出登录</a> </li>
                            </ul>
                        </li>
                        <!--切换主题配色-->
                        <li class="dropdown dropdown-skin">
                            <span data-toggle="dropdown" class="icon-palette"><i class="mdi mdi-palette"></i></span>
                            <ul class="dropdown-menu dropdown-menu-right" data-stopPropagation="true">
                                <li class="drop-title"><p>主题</p></li>
                                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="site_theme" value="default" id="site_theme_1" checked>
                    <label for="site_theme_1"></label>
                  </span>
                                    <span>
                    <input type="radio" name="site_theme" value="dark" id="site_theme_2">
                    <label for="site_theme_2"></label>
                  </span>
                                    <span>
                    <input type="radio" name="site_theme" value="translucent" id="site_theme_3">
                    <label for="site_theme_3"></label>
                  </span>
                                </li>
                                <li class="drop-title"><p>LOGO</p></li>
                                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="logo_bg" value="default" id="logo_bg_1" checked>
                    <label for="logo_bg_1"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_2" id="logo_bg_2">
                    <label for="logo_bg_2"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_3" id="logo_bg_3">
                    <label for="logo_bg_3"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_4" id="logo_bg_4">
                    <label for="logo_bg_4"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_5" id="logo_bg_5">
                    <label for="logo_bg_5"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_6" id="logo_bg_6">
                    <label for="logo_bg_6"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_7" id="logo_bg_7">
                    <label for="logo_bg_7"></label>
                  </span>
                                    <span>
                    <input type="radio" name="logo_bg" value="color_8" id="logo_bg_8">
                    <label for="logo_bg_8"></label>
                  </span>
                                </li>
                                <li class="drop-title"><p>头部</p></li>
                                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="header_bg" value="default" id="header_bg_1" checked>
                    <label for="header_bg_1"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_2" id="header_bg_2">
                    <label for="header_bg_2"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_3" id="header_bg_3">
                    <label for="header_bg_3"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_4" id="header_bg_4">
                    <label for="header_bg_4"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_5" id="header_bg_5">
                    <label for="header_bg_5"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_6" id="header_bg_6">
                    <label for="header_bg_6"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_7" id="header_bg_7">
                    <label for="header_bg_7"></label>
                  </span>
                                    <span>
                    <input type="radio" name="header_bg" value="color_8" id="header_bg_8">
                    <label for="header_bg_8"></label>
                  </span>
                                </li>
                                <li class="drop-title"><p>侧边栏</p></li>
                                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="sidebar_bg" value="default" id="sidebar_bg_1" checked>
                    <label for="sidebar_bg_1"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_2" id="sidebar_bg_2">
                    <label for="sidebar_bg_2"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_3" id="sidebar_bg_3">
                    <label for="sidebar_bg_3"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_4" id="sidebar_bg_4">
                    <label for="sidebar_bg_4"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_5" id="sidebar_bg_5">
                    <label for="sidebar_bg_5"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_6" id="sidebar_bg_6">
                    <label for="sidebar_bg_6"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_7" id="sidebar_bg_7">
                    <label for="sidebar_bg_7"></label>
                  </span>
                                    <span>
                    <input type="radio" name="sidebar_bg" value="color_8" id="sidebar_bg_8">
                    <label for="sidebar_bg_8"></label>
                  </span>
                                </li>
                            </ul>
                        </li>
                        <!--切换主题配色-->
                    </ul>

                </div>
            </nav>

        </header>
        <!--End 头部信息-->

        <!--页面主要内容-->
        <main class="lyear-layout-content">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-toolbar clearfix">
                                <div class="toolbar-btn-action">
                                    <%--<a class="btn btn-danger" href="#!"><i class="mdi mdi-window-close"></i> 删除</a>--%>
                                </div>
                            </div>
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <%--复选框
                                            <th>
                                                <label class="lyear-checkbox checkbox-primary">
                                                    <input type="checkbox" id="check-all"><span></span>
                                                </label>
                                            </th>--%>
                                            <th>id</th>
                                            <th>评论者id</th>
                                            <th>视频id</th>
                                            <th>评论内容</th>
                                            <th>评论时间</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="comment" items="${commentPageInfo.list}">
                                            <tr>
                                                <%--复选框
                                                <td>
                                                    <label class="lyear-checkbox checkbox-primary">
                                                        <input type="checkbox" name="ids[]" value="${comment.cid}"><span></span>
                                                    </label>
                                                </td>--%>
                                                <td>${comment.cid}</td>
                                                <td>${comment.user_id}</td>
                                                <td>${comment.movice_id}</td>
                                                <td>${comment.content}</td>
                                                <td><fmt:formatDate value="${comment.time}" type="date" pattern="yyyy-MM--dd HH:mm:ss"/></td>
                                                <td>
                                                    <div class="btn-group">
                                                        <a class="btn btn-xs btn-default" href="javascript:void(0);" title="删除" onclick="delComment(${comment.cid})" data-toggle="tooltip"><i class="mdi mdi-window-close"></i></a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <ul class="pagination">
                                    <li>当前第[${commentPageInfo.pageNum}]页,共[${commentPageInfo.pages}]页,共[${commentPageInfo.total}]条记录</li>
                                    <c:if test="${commentPageInfo.pageNum<=1}">
                                        <li class="disabled"><a href="javascript:void(0);">«</a></li>
                                    </c:if>
                                    <c:if test="${commentPageInfo.pageNum>1}">
                                        <li><a href="manage_comment?Page=${commentPageInfo.prePage}">«</a></li>
                                    </c:if>
                                    <li class="active"><span>${commentPageInfo.pageNum}</span></li>
                                    <li><span><a href="manage_comment?Page=${commentPageInfo.pageNum+1}">${commentPageInfo.pageNum+1}</a></span></li>
                                    <li><span><a href="manage_comment?Page=${commentPageInfo.pageNum+2}">${commentPageInfo.pageNum+2}</a></span></li>
                                    <li><span><a href="manage_comment?Page=${commentPageInfo.pageNum+3}">${commentPageInfo.pageNum+3}</a></span></li>
                                    <li><span><a href="manage_comment?Page=${commentPageInfo.pageNum+4}">${commentPageInfo.pageNum+4}</a></span></li>
                                    <c:if test="${commentPageInfo.pageNum>=commentPageInfo.pages}">
                                        <li class="disabled"><a href="javascript:void(0);">»</a></li>
                                    </c:if>
                                    <c:if test="${commentPageInfo.pageNum<commentPageInfo.pages}">
                                        <li><a href="manage_comment?Page=${commentPageInfo.nextPage}">»</a></li>
                                    </c:if>

                                </ul>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </main>
        <!--End 页面主要内容-->
    </div>
</div>

<script type="text/javascript" src="\${pageContext.request.contextPath}/../../static/js/jquery.min.js"></script>
<script type="text/javascript" src="\${pageContext.request.contextPath}/../../static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="\${pageContext.request.contextPath}/../../static/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="\${pageContext.request.contextPath}/../../static/js/main.min.js"></script>
<script type="text/javascript">
    function delComment(cid) {
        $.ajax({
            url:"deleteComment",
            data:{
                "cid":cid
            },
            dataType:"json",
            success:function (data) {
                if (data){
                    alert("操作成功")
                    window.location.href="manage_comment";
                }else{
                    alert("删除失败")
                }
            },
            error:function () {
                alert("error!!")
            }
        })

    }
</script>

</body>
</html>
