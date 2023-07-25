<%--
  Created by IntelliJ IDEA.
  User: mondi
  Date: 2023-07-20
  Time: 1:10 a.m.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Create New Post</title>
    <meta name="layout" content="main"/>
</head>
<body>
<h1>Create New Post</h1>
<g:form action="create">

    <div class="mb-3">
        <label for="title" class="form-label">Post title</label>
        <input type="text" class="form-control" name="title" id="title" required>
    </div>
    <div class="mb-3">
        <label for="content" class="form-label">Content</label>
        <g:textArea name="content" required="true" class="form-control" id="content" rows="3"/>
    </div>

    <div class="mb-3 d-flex flex-column gap-2">
        <label for="categories">Category:</label>
        <select id="categories" name="categories" multiple>
            <option></option>
            <g:each in="${categories}" var="category">
                <option value="${category.id}">${category.name}</option>
            </g:each>
        </select>
    </div>



    <g:submitButton class="btn btn-primary" name="create" value="Create"/>

</g:form>
<g:link action="index">Back to Blog</g:link>
<script>
    $(document).ready(function() {
        // Initialize Select2 on the multi-select box
        $('#categories').select2({
            placeholder: "Select a Category",
            allowClear: true,
            width: 'resolve' // need to override the changed default
        });
    });
</script>
</body>
</html>