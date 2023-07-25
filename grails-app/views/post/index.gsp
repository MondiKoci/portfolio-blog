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
<div class="row pt-2">
    <div class="col-md-8">
        <h3 class="pb-4 mb-4 fst-italic border-bottom">
            Straight from the Oven
        </h3>
        <g:each in="${blogPosts}" var="blogPost">
            <article class="blog-post">
                <h2 class="display-5 link-body-emphasis mb-1">${blogPost.title}</h2>
                <p>${blogPost.content}</p>
                <g:if test="${blogPost.categories != null || blogPost.categories.size() != 0}">
                    <div class="d-flex flex-row justify-content-between align-items-end">
                        <div class="mxw-content">
                            <span class="fs-8 text-nowrap text-lowercase bg-secondary-subtle px-1 py-1 rounded-1">${blogPost.date}</span>
                        </div>
                        <div class="d-flex justify-content-end">
                            <g:each in="${blogPost.categories}" var="cat" status="i">
                                <a href="#" class="fs-8 text-nowrap text-lowercase text-primary px-1 text-decoration-none hover-decoration">
                                    <g:if test="${i < blogPost.categories.size() - 1}">
                                        ${cat.name},
                                    </g:if>
                                    <g:else>
                                        ${cat.name}
                                    </g:else>
                                </a>
                            </g:each>
                        </div>
                    </div>
                </g:if>
                <g:else>
                    <span class="badge text-bg-primary rounded-pill">Uncategorized</span>
                </g:else>
                <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_SUPER_ADMIN'>
                    <g:link action="editPostImage" id="${blogPost.id}">Edit Post Image</g:link>
                </sec:ifAnyGranted>
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
                <p class="mb-0">Few of us are walking on the rope. The rest we are hanging to it; either carrying the heavy weight or holding tight so the wind doesn't blow us away. We are rope walkers.</p>
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