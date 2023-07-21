<div class="mxw-content ms-3">
    <span id="logoutLink" style="display: none;">
        <g:link elementId='_logout' controller='logout'>Logout</g:link>
    </span>

    <span id="loginLink" class="float-right position-relative">
        <sec:ifLoggedIn>
            Logged in as <sec:username/> (<g:link elementId='logout' controller='logout'>Logout</g:link>)
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
            <a href="#" class="btn btn-themed" onclick="showLogin(); return false;">Login</a>
            <g:link class="btn btn-info" controller="register">Register</g:link>
        </sec:ifNotLoggedIn>
    </span>
</div>

    <div id="ajaxLogin" class="jqmWindow" style="z-index: 3000;">
        <div class="inner">
            <div class="fheader">Please Login..</div>
            <form action="${request.contextPath}/login/authenticate" method="POST"
                  id="ajaxLoginForm" name="ajaxLoginForm" class="cssform" autocomplete="off">
                <p>
                    <label for="username">Username:</label>
                    <input type="text" class="text_" name="username" id="username" />
                </p>
                <p>
                    <label for="password">Password</label>
                    <input type="password" class="text_" name="password" id="password" />
                </p>
                <p>
                    <label for="remember_me">Remember me</label>
                    <input type="checkbox" class="chk" id="remember_me" name="remember-me"/>
                </p>
                <p>
                    <input type="submit" id="authAjax" name="authAjax"
                           value="Login" class="ajaxLoginButton" />
                    <input type="button" id="cancelLogin" value="Cancel"
                           class="ajaxLoginButton" />
                </p>
            </form>
            <div style="display: none; text-align: left;" id="loginMessage"></div>
        </div>
    </div>
