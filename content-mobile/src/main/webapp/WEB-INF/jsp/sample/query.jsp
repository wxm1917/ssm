<%@include file="/WEB-INF/commons/include.jsp"%>
<html>
<head>
    <title>sample query</title>
</head>
<body>
    <span>result:</span>
    <table>
        <tbody>
            <c:forEach items="${accountList}" var="account">
                <tr>
                    <td>${account.id}</td>
                    <td>${account.company}</td>
                </tr>
            </c:forEach>
        </tbody>

    </table>
</body>
</html>
