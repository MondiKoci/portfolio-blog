package com.maswell.blog

import com.maswell.security.Appuser
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
class PostController {
    def springSecurityService

    def index() {
        def blogPosts = Post.list()
        def xyz = 123
        [blogPosts: blogPosts]
    }


    @Transactional
    def create() {
        if (request.method == 'POST') {
            Appuser u = springSecurityService.currentUser
            def title = params.title
            def content = params.content
            def category = Category.get(params?.category?.id as Double)
            def blogPost = new Post()
            blogPost.author = u
            blogPost.title = title
            blogPost.content = content
            blogPost.addToCategories(category)
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

    def show(Long id) {
        def blogPost = Post.get(id)
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
