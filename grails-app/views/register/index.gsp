<%--
  Created by IntelliJ IDEA.
  User: mondi
  Date: 2023-07-21
  Time: 8:45 a.m.
--%>

<%@ page import="com.maswell.security.Role" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title>Register</title>
</head>

<body>
<div class="row">
    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
            <div class="card-body gap-1">
                <h5 class="card-title text-center">Register Here</h5>
                <g:if test='${flash.message}'>
                    <div class="alert alert-danger" role="alert">${flash.message}</div>
                </g:if>
                <form class="form-signin d-flex flex-column gap-3" action="register" method="POST" id="loginForm" autocomplete="off">
                    <div class="form-group">
                        <label for="role">Role</label>
                        <g:select class="form-control" name="role.id"
                                  from="${Role.list()}"
                                  optionKey="id"
                                default="Select Role"/>
                    </div>

                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" placeholder="Your username" class="form-control" name="username" id="username" autocapitalize="none"/>
                    </div>

                    <div class="form-group">
                        <input type="password" placeholder="Your password" class="form-control" name="password" id="password" aria-placeholder="password"/>
                    </div>

                    <div class="form-group">
                        <label for="confirmPassword">Re-Enter Password</label>
                        <input type="password" placeholder="Re-enter password" class="form-control" name="confirmPassword" id="confirmPassword"/>
                    </div>

                    <div class="form-group">
                        <label for="fullName">Full Name</label>
                        <input type="text" placeholder="Your full name" class="form-control" name="fullName" id="fullName" autocapitalize="none"/>
                    </div>

                    <button id="submit" class="btn btn-sm btn-primary btn-block  mt-2 text-uppercase" type="submit">Register</button>
                    <hr class="my-4">
                    <p>Already have an account? <g:link controller="login" action="auth">Login</g:link></p>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function(event) {
        document.forms['loginForm'].elements['username'].focus();
    });
</script>
</body>
</html>