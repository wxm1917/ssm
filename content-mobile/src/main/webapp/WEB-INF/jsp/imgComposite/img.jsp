<!DOCTYPE html>
<%@page contentType="text/html;charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit"/>
    <meta content="width=device-width, initial-scale=1.00, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no"
          name="viewport"/>
    <meta name="description" content="">
    <title>demo2</title>
    <link rel="stylesheet" href="">
    <link rel="stylesheet" href="${ctx}/resources/css/semantic.min.css">
    <!--[if lt IE 9]>
    <link rel="stylesheet" href="${ctx}/resources/css/IE8.css">
    <script src="${ctx}/resources/js/html5shiv.js"></script>
    <script src="${ctx}/resources/js/respond.min.js"></script>
    <![endif]-->
    <script src="${ctx}/resources/js/jquery-1.10.1.min.js"></script>

    <script src="${ctx}/resources/js/semantic.min.js"></script>
    <script src="${ctx}/resources/js/imgComposite2.js"></script>
    <script src="${ctx}/resources/js/watermark.js"></script>
    <style>
        #content {
            width: 100%;
            margin: auto;
        }

        .bg-img {
            width: 200px;
            float: left;
            margin: 10px;
        }

        .adver-img {
            width: 200px;
            float: left;
            margin: 10px;
        }

        ul {
            margin: 0;
            padding: 0;
        }

        ul li {
            list-style-type: none;
            margin: 10px 0px;
            background-color: lightgray;
            width: 200px;
            cursor: pointer;
        }

        ul li img {
            max-width: 200px;
        }

        .inner_pc {
            width: 800px;
            float: left;
        }

        #imgCompositeModal {
            width: 800px;
        }

        .work_tab {
            width: 700px;
            float: left;
            margin-right: 5px;
        }

        .param {
            width: 100px;
            float: left;
        }

        .show_tab {
            display: inline-block;
            margin: 10px 0px;
            min-width: 600px;
        }

        table tr td {
            width: 50px;
        }

        table tr td input {
            width: 50px;
        }
    </style>
</head>
<body>
<div id="content">
    <div class="fade_content">
        <div class="fade_content_two">
            <table align="left">
                <tr>
                    <td bgcolor="#6495ed" colspan="6" align="center">
                        广告合成过程演示
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#ff8c00" colspan="6">
                        >>>&nbsp;&nbsp;1、请点击挑选一张您需要的底图。
                    </td>
                </tr>
                <tr>
                    <td>
                        <img src="${ctx}/images/d1.png" width="200" class="aaa" tmp="bbb">
                    </td>
                    <td>
                        <img src="${ctx}/images/d2.png" width="200" class="aaa" tmp="bbb">
                    </td>
                    <td>
                        <img src="${ctx}/images/d3.png" width="200" class="aaa" tmp="bbb">
                    </td>
                    <td>
                        <img src="${ctx}/images/d4.png" width="200" class="aaa" tmp="bbb">
                    </td>
                    <td>
                        <img src="${ctx}/images/d5.png" width="200" class="aaa" tmp="bbb">
                    </td>
                    <td>
                        <img src="${ctx}/images/d6.png" width="200" class="aaa" tmp="bbb">
                    </td>
                </tr>
            </table>
        </div>
        <%--底图列表END--%>
    </div>


</div>

<div class="fade_content">
    <div class="fade_content_two">
        <table align="left">
            <tr>
                <td bgcolor="#ff8c00" colspan="6">
                    >>>&nbsp;&nbsp;2、再点击选取一张遮盖的广告图
                </td>
            </tr>
            <tr>
                <td>
                    <img src="${ctx}/images/a1.png" class="aaa cccc">
                </td>
                <td>
                    <img src="${ctx}/images/a2.png" class="aaa cccc">
                </td>
                <td>
                    <img src="${ctx}/images/a3.png" class="aaa cccc">
                </td>
                <td>
                    <img src="${ctx}/images/a4.png" class="aaa cccc">
                </td>
                <td>
                    <img src="${ctx}/images/a5.png" class="aaa cccc">
                </td>
            </tr>
        </table>
    </div>
    <%--底图列表END--%>
</div>

<table align="left">
    <tr>
        <td bgcolor="#ff8c00" colspan="6">
            >>>&nbsp;&nbsp;3、请拖拽或滚动鼠标来调整位置和大小
        </td>
    </tr>
    <tr>
        <td>
            <div class="img" id="imgCompositeModal" align="center">
                <img id="imgSrc" style="display: none;">
            </div>
        </td>
    </tr>
</table>

</body>
</html>



