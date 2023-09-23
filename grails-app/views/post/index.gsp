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
    <div class="row">
        <h3 class="pb-4 mb-4 fst-italic border-bottom">
            Straight from the Oven
            <sec:ifAllGranted roles="ROLE_ADMIN">
                <g:link class="btn btn-sm me-1 btn-primary max-c" action="create">Create New Post</g:link>
                <g:link class="btn btn-sm  btn-success max-c" action="categories">View Categories</g:link>
            </sec:ifAllGranted>

        </h3>
    </div>

    <div class="col-md-8">
        <g:render template="/includes/post" collection="${blogPosts}" var="blogPost"/>
        <div class="pagination">
            <g:paginate total="${postCount ?: 0}" />
        </div>
    </div>

    <div class="col-md-4">
        <div class="position-sticky" style="top: 2rem;">
            <div class="p-4 mb-3 bg-body-tertiary rounded">
                <h4 class="fst-italic">Today's Quote</h4>
                <p class="mb-0">"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."
                "There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain..."</p>
            </div>

            <div>
                <h4 class="fst-italic">Recent posts</h4>
                <ul class="list-unstyled">
                    <g:render template="/includes/recentPost" collection="${latestPosts}" var="blogPost"/>
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
<script>
%{--    $(()=>{--}%
%{--        var $prevLink = $('.prevLink');--}%
%{--        var $nextLink = $('.nextLink')--}%
%{--        if($prevLink != null){--}%
%{--            $prevLink.addClass('btn btn-outline-primary rounded-pill')--}%
%{--        }--}%
%{--        if($nextLink != null){--}%
%{--            $nextLink.addClass('btn btn-outline-primary rounded-pill')--}%
%{--        }--}%
%{--    })--}%
</script>
</body>
</html>