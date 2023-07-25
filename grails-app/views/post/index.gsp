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
<div class="row mx-point-one">
    <div class="p-4 p-md-5 mb-2 rounded text-body-emphasis bg-body-secondary">
        <div class="col-lg-6 px-0">
            <h1 class="display-5 fst-italic">A blog post title!</h1>
            <p class="lead my-3">This is where the content of the blog post goes..</p>
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
<div class="row g-5">
    <div class="col-md-8">
        <h3 class="pb-4 mb-4 fst-italic border-bottom">
            Straight from the Oven
        </h3>
        <g:each in="${blogPosts}" var="blogPost">
            <article class="blog-post">
                <h2 class="display-5 link-body-emphasis mb-1">${blogPost.title}</h2>
                <p class="blog-post-meta">${blogPost.date}<a href="#"> ${blogPost.author.username}</a></p>
                <p>${blogPost.content}</p>
                <g:if test="${blogPost.categories != null}">
                    <div class="d-flex justify-content-start">
                        <g:each in="${blogPost.categories}" var="cat">
                            <span class="font-monospace font-weight-light mx-1 text-bg-primary rounded-pill px-1" style="font-size:12px;">${cat.name}</span>
                        </g:each>
                    </div>
                </g:if>
                <g:else>
                    <span class="badge text-bg-primary rounded-pill">Uncategorized</span>
                </g:else>
                <g:link action="editPostImage" id="${blogPost.id}">Edit Post Image</g:link>
                <hr class="mt-1 mb-1">
            </article>
        </g:each>

        <div class="pagination">
            <g:paginate total="${postCount ?: 0}" />
        </div>
        <nav class="blog-pagination" aria-label="Pagination">
            <a class="btn btn-outline-primary rounded-pill" href="#">Older</a>
            <a class="btn btn-outline-secondary rounded-pill disabled">Newer</a>
        </nav>
    </div>

    <div class="col-md-4">
        <div class="position-sticky" style="top: 2rem;">
            <div class="p-4 mb-3 bg-body-tertiary rounded">
                <h4 class="fst-italic">Today's Reflection</h4>
                %{--                <p class="mb-0">Impossible to obtain something that doesn't exist! Even more harmful is the skewed perception that perfection is a good thing.</p>--}%
                <p class="mb-0">At the end of the day give yourself a few minutes to think about what you thought during the day. Can you find any fallacies?</p>
            </div>

            <div>
                <h4 class="fst-italic">Recent posts</h4>
                <ul class="list-unstyled">
                    <g:each in="${blogPosts}" var="blogPost">
                        <li>
                            <a class="d-flex flex-column flex-lg-row gap-3 align-items-start align-items-lg-center py-3 link-body-emphasis text-decoration-none border-top" href="#">
                                <g:if test="${blogPost.postImageBytes}">
                                    <div class="image-container">
                                        <img class="post" src="<g:createLink controller="post" action="postImage" id="${blogPost.id}"/>"/>
                                    </div>
                                </g:if>
                                <g:else>
                                    <svg class="bd-placeholder-img" width="100%" height="96" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
                                </g:else>

                                <div class="col-lg-8">
                                    <h6 class="mb-0">${blogPost.title}</h6>
                                    <small class="text-body-secondary">${blogPost.date}</small>
                                </div>
                            </a>
                        </li>
                    </g:each>
                </ul>
            </div>

            <div class="p-4">
                <h4 class="fst-italic">Archives</h4>
                <ol class="list-unstyled mb-0">
                    <li><a href="#">March 2021</a></li>
                    <li><a href="#">February 2021</a></li>
                    <li><a href="#">January 2021</a></li>
                    <li><a href="#">December 2020</a></li>
                    <li><a href="#">November 2020</a></li>
                    <li><a href="#">October 2020</a></li>
                    <li><a href="#">September 2020</a></li>
                    <li><a href="#">August 2020</a></li>
                    <li><a href="#">July 2020</a></li>
                    <li><a href="#">June 2020</a></li>
                    <li><a href="#">May 2020</a></li>
                    <li><a href="#">April 2020</a></li>
                </ol>
            </div>

            <div class="p-4">
                <h4 class="fst-italic">Elsewhere</h4>
                <ol class="list-unstyled">
                    <li><a href="#">GitHub</a></li>
                    <li><a href="#">Twitter</a></li>
                    <li><a href="#">Facebook</a></li>
                </ol>
            </div>
        </div>
    </div>
</div>

<g:link class="btn btn-primary" action="create">Create New Post</g:link>
<br/>
<g:link class="btn btn-success" action="categories">View Categories</g:link>
</body>
</html>