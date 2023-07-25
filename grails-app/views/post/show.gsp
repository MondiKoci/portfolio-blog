<%--
  Created by IntelliJ IDEA.
  User: mondi
  Date: 2023-07-20
  Time: 1:10 a.m.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${blogPost.title}</title>
    <meta name="layout" content="main"/>
</head>
<body>
<div class="row g-5">
    <div class="col-md-8">
        <h3 class="pb-4 mb-4 fst-italic border-bottom">
            Straight from the Oven
        </h3>
        <g:if test="${blogPost != null}">
            <article class="blog-post">
                <h2 class="display-5 link-body-emphasis mb-1">${blogPost.title}</h2>
                <p class="blog-post-meta">${blogPost.date}<a href="#"> ${blogPost.author.username}</a></p>
                <g:if test="${blogPost.postImageBytes}">
                    <img src="<g:createLink controller="post" action="postImage" id="${blogPost.id}"/>" style="width:100%;max-width:max-content"/>
                </g:if>
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
        </g:if>
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
                    <li>
                        <a class="d-flex flex-column flex-lg-row gap-3 align-items-start align-items-lg-center py-3 link-body-emphasis text-decoration-none border-top" href="#">

                            <svg class="bd-placeholder-img" width="100%" height="96" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
                            <div class="col-lg-8">
                                <h6 class="mb-0">Example post post title</h6>
                                <small class="text-body-secondary">January 15, 2023</small>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a class="d-flex flex-column flex-lg-row gap-3 align-items-start align-items-lg-center py-3 link-body-emphasis text-decoration-none border-top" href="#">
                            <svg class="bd-placeholder-img" width="100%" height="96" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
                            <div class="col-lg-8">
                                <h6 class="mb-0">This is another post post title</h6>
                                <small class="text-body-secondary">January 14, 2023</small>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a class="d-flex flex-column flex-lg-row gap-3 align-items-start align-items-lg-center py-3 link-body-emphasis text-decoration-none border-top" href="#">
                            <svg class="bd-placeholder-img" width="100%" height="96" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
                            <div class="col-lg-8">
                                <h6 class="mb-0">Longer post post title: This one has multiple lines!</h6>
                                <small class="text-body-secondary">January 13, 2023</small>
                            </div>
                        </a>
                    </li>
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

<g:link class="btn btn-sm btn-primary" action="index">Back to Blog</g:link>
</body>
</html>