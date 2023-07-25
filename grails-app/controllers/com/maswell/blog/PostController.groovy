package com.maswell.blog

import com.maswell.security.Appuser
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class PostController {
    def springSecurityService
    def categoryService
    def postService

    def index() {
        def maxPerPage = params.max?:10
        def page = params.page?:1
        def blogPosts = postService.getPostList(maxPerPage, page)
        [
                blogPosts: blogPosts,
                postCount:Post.count()
        ]
    }

    @Transactional
    def create() {
        if (request.method == 'POST') {
            Appuser u = springSecurityService.currentUser
            def title = params.title
            def content = params.content
            def selectedCategories = params.list('categories')
            def categoryList = categoryService.getSetByIdsInList(selectedCategories)

            def blogPost = new Post()
            Date d = new Date()
            blogPost.author = u
            blogPost.title = title
            blogPost.content = content
            blogPost.dateCreated = d
            blogPost.categories = []
            blogPost.categories.addAll(categoryList)
            if (blogPost.save(flush:true)) {
                flash.message = "Blog post created successfully."
                redirect(action: 'index')
            } else {
                render(view: 'create', model: [blogPost: blogPost, categories: Category.list()])
            }
        } else {
            return [blogPost: new Post(), categories: Category.list()]
        }
    }

    def postImage(Long id) {
        Post p = Post.get(id)
        if (!p || p.postImageBytes == null) {
            return
        }
        render file: p.postImageBytes,
                contentType: p.postImageContentType
    }

    def editPostImage() {
        Long id = params.id.toLong()
        Post post = postService.get(id)
        if (!post) {
            redirect(action:'index')
            return
        }
        [post: post]
    }

    // tag::uploadFeaturedImage[]
    def uploadPostImage(PostImageCommand cmd) {
        if (cmd == null) {
            return
        }

        if (cmd.hasErrors()) {
            respond(cmd.errors, model: [restaurant: cmd], view: 'editFeaturedImage')
            return
        }

        Post post = postService.update(cmd.id,
                cmd.postImageFile.bytes,
                cmd.postImageFile.contentType)

        if (post == null) {
            return
        }

        redirect(action: 'show', id:post.id)
    }
    // end::uploadFeaturedImage[]

    def show(Long id) {
        def blogPost = postService.getPostForView(id)
        if (blogPost) {
            [blogPost: blogPost]
        } else {
            flash.message = "Blog post not found."
            redirect(action: 'index')
        }
    }

    def categories() {
        def categories = Category.list()
        [categories: categories]
    }
}
