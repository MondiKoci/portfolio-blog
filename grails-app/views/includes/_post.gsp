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