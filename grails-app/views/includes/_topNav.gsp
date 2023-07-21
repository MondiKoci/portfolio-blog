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
                <g:render template='/includes/ajaxLogin'/>
            </div>
        </div>
    </nav>
</div>
