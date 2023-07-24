<asset:stylesheet src="sign-in.css"/>
<div id="ajaxLogin" class="jqmWindow" style="z-index: 3000;">
    <div class="w-100 m-auto" style="width:100%;max-width:500px;">
        <div class="card card-signin my-5">
            <div class="card-body">
                <div class="fheader">Please Login..</div>
                <form action="${request.contextPath}/login/authenticate" method="POST"
                      id="ajaxLoginForm" name="ajaxLoginForm" class="form-signin" autocomplete="off">
                    <div class="form-floating">
                        <label for="username">Username:</label>
                        <input type="text" class="form-control text_" name="username" id="username" />
                    </div>
                    <div class="form-floating">
                        <label for="password">Password</label>
                        <input type="password" class="form-control text_" name="password" id="password" />
                    </div>
                    <div class="form-check">
                        <label class="form-label" for="remember_me">Remember me</label>
                        <input type="checkbox" class="chk" id="remember_me" name="remember-me"/>
                    </div>
                    <p>
                        <input type="submit" id="authAjax" name="authAjax"
                               value="Login" class="ajaxLoginButton btn btn-sm btn-primary" />
                        <input type="button" id="cancelLogin" value="Cancel"
                               class="ajaxLoginButton btn btn-sm btn-secondary" />
                    </p>
                </form>
                <div style="display: none; text-align: left;" id="loginMessage"></div>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <nav class="navbar navbar-expand-lg bg-body-tertiary rounded mt-1" aria-label="Eleventh navbar example">
        <div class="container-fluid">
            <a class="navbar-brand" href="/"><asset:image src="logo-2.png"/> </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample09" aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarsExample09">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Main</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled">Disabled</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">Dropdown</a>
                        <ul class="dropdown-menu">

                            <li><g:link class="dropdown-item" controller="post" action="create">Post</g:link></li>
                            <li><g:link class="dropdown-item" controller="post" action="show">Show</g:link></li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                </ul>
                <form role="search">
                    <input class="form-control" type="search" placeholder="Search" aria-label="Search">
                </form>
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
            </div>
        </div>
    </nav>
</div>
