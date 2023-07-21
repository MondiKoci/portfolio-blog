<%--
  Created by IntelliJ IDEA.
  User: mondi
  Date: 2023-07-20
  Time: 1:10 a.m.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Categories</title>
</head>
<meta name="layout" content="main"/>
<body>
<h1>Categories</h1>
<ul>
    <g:each var="category" in="${categories}">
        <li>${category.name}</li>
    </g:each>
</ul>
<g:link action="index">Back to Blog</g:link>
</body>
</html>