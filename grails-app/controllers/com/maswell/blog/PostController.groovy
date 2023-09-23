package com.maswell.blog

import com.maswell.security.Appuser
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import io.micronaut.http.HttpResponse
import io.micronaut.http.annotation.Get
import org.springframework.web.servlet.ModelAndView

@Secured('permitAll')
class PostController {
    def springSecurityService
    def categoryService
    def postService

    def index() {
        def max = params.max?:10
        def page = params.offset?:0
        params.max = max
        params.offset = page
        def catName = params.category
        def blogPosts = postService.getPostList(max, page, catName)
        def latestPosts = postService.getLatest()
        def postCount = catName?blogPosts.size():Post.count()
        [
                blogPosts: blogPosts,
                latestPosts: latestPosts,
                postCount:postCount
        ]
    }

    def create() {
        if (request.method == 'POST') {
            Appuser u = springSecurityService.currentUser
            def title = params.title
            def content = params.content
            def selectedCategories = params.list('categories')
            def categoryList = categoryService.getSetByIdsInList(selectedCategories)

            def result = postService.create(title, content, selectedCategories)

//            def blogPost = new Post()
//            Date d = new Date()
//            blogPost.author = u
//            blogPost.title = title
//            blogPost.content = content
//            blogPost.dateCreated = d
//            blogPost.categories = []
//            blogPost.categories.addAll(categoryList)
            if (result.result) {
                flash.message = "Blog post created successfully."
                redirect(action: 'index')
            } else {
                render(view: 'create', model: [blogPost: result.p, categories: Category.list()])
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
