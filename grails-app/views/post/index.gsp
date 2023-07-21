<%--
  Created by IntelliJ IDEA.
  User: mondi
  Date: 2023-07-20
  Time: 1:09 a.m.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Web Blog</title>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="row mx-point-rem">
    <div class="p-4 p-md-5 mb-2 rounded text-body-emphasis bg-body-secondary">
        <div class="col-lg-6 px-0">
            <h1 class="display-5 fst-italic">How to wake up!</h1>
            <p class="lead my-3">Of course I am joking; who am I to know the answer the question that was asked by and tormented the most brilliant humans to ever live.</p>
            <p class="lead mb-0"><a href="#" class="text-body-emphasis fw-bold">Continue reading...</a></p>
        </div>
    </div>
</div>

<div class="row mb-2">
    <div class="col-md-6">
        <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
            <div class="col p-4 d-flex flex-column position-static">
                <strong class="d-inline-block mb-2 text-primary-emphasis">World</strong>
                <h3 class="mb-0">Featured post</h3>
                <div class="mb-1 text-body-secondary">Nov 12</div>
                <p class="card-text mb-auto">This is a wider card with supporting text below as a natural lead-in to additional content.</p>
                <a href="#" class="icon-link gap-1 icon-link-hover stretched-link">
                    Continue reading
                    <svg class="bi"><use xlink:href="#chevron-right"/></svg>
                </a>
            </div>
            <div class="col-auto d-none d-lg-block p-1">
                <img src="https://fastly.picsum.photos/id/927/200/250.jpg?hmac=fX0QKYA1ZWiePZWweWdMgfhxYZPk9LbJf53LH3WumlE" alt="picsum"/>
                %{--                    <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>--}%
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
            <div class="col p-4 d-flex flex-column position-static">
                <strong class="d-inline-block mb-2 text-success-emphasis">Design</strong>
                <h3 class="mb-0">Post title</h3>
                <div class="mb-1 text-body-secondary">Nov 11</div>
                <p class="mb-auto">This is a wider card with supporting text below as a natural lead-in to additional content.</p>
                <a href="#" class="icon-link gap-1 icon-link-hover stretched-link">
                    Continue reading
                    <svg class="bi"><use xlink:href="#chevron-right"/></svg>
                </a>
            </div>
            <div class="col-auto d-none d-lg-block">
                <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
            </div>
        </div>
    </div>
</div>
<h1>Web Blog</h1>
<g:if test="${blogPosts != null}">
    <ul>
        <g:each var="post" in="${blogPosts}">
            <li>
                <g:link action="show" id="${post.id}">${post.title}</g:link>
                <br/>Category: ${post.categories?.name ?: 'Uncategorized'}

                <g:if test="${post.categories != null}">
                    <div class="d-flex gap-2 justify-content-center py-5">
                        <g:each in="${post.categories}" var="cat">
                            <span class="badge text-bg-primary rounded-pill">${cat}</span>
                        %{--                    <span class="badge text-bg-secondary rounded-pill">Secondary</span>--}%
                        %{--                    <span class="badge text-bg-success rounded-pill">Success</span>--}%
                        %{--                    <span class="badge text-bg-danger rounded-pill">Danger</span>--}%
                        %{--                    <span class="badge text-bg-warning rounded-pill">Warning</span>--}%
                        %{--                    <span class="badge text-bg-info rounded-pill">Info</span>--}%
                        %{--                    <span class="badge text-bg-light rounded-pill">Light</span>--}%
                        %{--                    <span class="badge text-bg-dark rounded-pill">Dark</span>--}%
                        </g:each>
                    </div>
                </g:if>
                <g:else>
                    <span class="badge text-bg-primary rounded-pill">Uncategorized</span>
                </g:else>
            </li>
        </g:each>
    </ul>
</g:if>

<g:link class="btn btn-primary" action="create">Create New Post</g:link>
<br/>
<g:link class="btn btn-success" action="categories">View Categories</g:link>
</body>
</html>