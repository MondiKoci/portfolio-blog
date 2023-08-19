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