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

    ArrayList<LinkedHashMap<String,Object>> getPostList(){
        def result = []
        def postList = Post.list()
        postList.each{Post p ->
            Appuser author = p.author
            def categoryList = p.categories.collect{ cat -> [id:cat.id.toLong(), name:cat.name]}
            def tempMap = [:]
            tempMap.put("id", p.id)
            tempMap.put("title", p.title)
            tempMap.put("content", p.content)
            tempMap.put("date", convertDateToStringPattern(p.dateCreated))
            tempMap.put("author", [id:author.id,username:author.username, name:author.displayName])
            tempMap.put("categories", categoryList)
            result.add(tempMap)
        }
        result
    }

    def convertDateToStringPattern(Date dateCreated){
        String pattern = "MMMM d, yyyy"
        SimpleDateFormat sdf = new SimpleDateFormat(pattern)
        sdf.format(dateCreated)
    }

}
