<%--
  Created by IntelliJ IDEA.
  User: mondi
  Date: 2023-07-24
  Time: 8:29 p.m.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Upload Post Image</title>
    <meta name="layout" content="main"/>
</head>

<body>

<g:uploadForm name="uploadPostImage" action="uploadPostImage">
    <g:hiddenField name="id" value="${this.post?.id}" />
    <g:hiddenField name="version" value="${this.post?.version}" />
    <input type="file" name="postImageFile" />
    <fieldset class="buttons">
        <input class="save" type="submit" value="Upload"/>
    </fieldset>
</g:uploadForm>
</body>
</html>