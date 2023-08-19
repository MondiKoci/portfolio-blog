package com.maswell

import com.maswell.blog.Post
import com.maswell.security.Appuser
import grails.gorm.transactions.Transactional

import java.text.SimpleDateFormat

@Transactional
class PostService {
    def springSecurityService
    def categoryService

    def create(String title, String content, ArrayList<Long> categoryList){
        boolean result = false
        Post p
        try{
            Appuser author = springSecurityService.currentUser?:null
            if(author){
                ArrayList catSet = categoryService.getSetByIdsInList(categoryList)
                p = new Post(title:title, content:content,author:author)
                p.categories = catSet
                if(p.save(flush:true,failOnError:true)){
                    result = true
                }
            }
        }catch(Exception e){
           log.error("Error while creating a post: $e")
        }
        [result:result, post:p]
    }

    def get(Long id){
        Post.get(id)
    }

    def update(def postId, String title, String content){
        boolean result = false
        Post p
        try{
            p = Post.get(postId)
            if(p){
                p.title = title
                p.content = content
                if(p.save(flush:true,failOnError:true)){
                    result = true
                }
            }
        }catch(Exception e){
            log.error("Error while updating post: $e")
        }

        [result:result, post:p]
    }

    Post update(Serializable id, byte[] imageBytes, String imageContentType){
        Post p = Post.get(id)
        p.postImageBytes = imageBytes
        p.postImageContentType = imageContentType
        p.save()
    }

    boolean delete(def postId){
        boolean result = false
        try{
            Post p = Post.get(postId)
            if(p.delete()){
                result = true
            }
        }catch(Exception e){
            log.error("Error while deleting a post: $e")
        }
        result
    }

    def getPostForView(def postId){
        def postMap = null
        try{
            Post p = Post.get(postId)
            if(p){
                postMap = postForView(p)
            }
        }catch(Exception e){
            log.error("Error while getPostForView $postId : $e")
        }
        postMap
    }

    //Get the full list of posts
    ArrayList<LinkedHashMap<String,Object>> getPostList(def max = 10, def offset = 0){
        def result = []
        def postList = Post.list(max:max, offset:offset)
        postList.each{Post p ->
            result.add(postForView(p))
        }
        result
    }

    def postForView = { Post p ->
        def tempMap = [:]
        def categoryList = p.categories.collect{ cat -> [id:cat.id.toLong(), name:cat.name]}
        tempMap.put("id", p.id)
        tempMap.put("title", p.title)
        tempMap.put("content", p.content)
        tempMap.put("postImageBytes", p.postImageBytes)
        tempMap.put("date", convertDateToStringPattern(p.dateCreated))
        tempMap.put("author", [id:p.author.id,username:p.author.username, name:p.author.displayName])
        tempMap.put("categories", categoryList)
        return tempMap
    }

    def convertDateToStringPattern(Date dateCreated){
        String pattern = "MMMM d, yyyy"
        SimpleDateFormat sdf = new SimpleDateFormat(pattern)
        sdf.format(dateCreated)
    }

}
