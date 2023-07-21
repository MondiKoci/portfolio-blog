<%--
  Created by IntelliJ IDEA.
  User: mondi
  Date: 2023-07-21
  Time: 8:44 a.m.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <asset:stylesheet src="sign-in.css"/>
</head>

<body class="d-flex align-items-center py-4 bg-body-tertiary">
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
                <div class="card-body">
                    <h5 class="card-title text-center">Please login</h5>
                    <form  action="${postUrl ?: '/login/authenticate'}" class="form-signin" method="POST" id="loginForm" autocomplete="off">
                        <g:if test='${flash.message}'>
                            <div class="alert alert-danger" role="alert">${flash.message}</div>
                        </g:if>
                        <div class="form-floating">
                            <input class="form-control" name="${usernameParameter ?: 'username'}" id="username" autocapitalize="none">
                            <label for="username">Username</label>
                        </div>
                        <div class="form-floating">
                            <input type="password" class="form-control" name="${passwordParameter ?: 'password'}" id="password"/>
                            <label for="password">Password</label>
                        </div>

                        <div class="form-check text-start my-3">
                            <input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault">
                            <label class="form-check-label" for="flexCheckDefault">
                                Remember me
                            </label>
                        </div>
                        <button class="btn btn-primary w-100 py-2" type="submit">Sign in</button>
                        <hr class="my-4">
                        <p>Don't have an account? <g:link controller="register">Register</g:link></p>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>