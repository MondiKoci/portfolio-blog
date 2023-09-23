package com.maswell

import com.maswell.blog.Category
import grails.gorm.transactions.Transactional

@Transactional
class CategoryService {

    def create(String name){
        result = false
        try{
            Category c = new Category(name:name)
            if(c.save()){
                result = true
            }
        }catch(Exception e){
            log.error("Error while creating category: $e")
        }
        result
    }

    def getById(def categoryId){
        boolean result = false
        Category c
        try{
            c = Category.get(categoryId)
            if(c){
                result = true
            }
        }catch(Exception e){
            log.error("Error while finding category by id $categoryId : $e")
        }
        [result:result, category:c]
    }

    def getByName(String name){
        Category cat = Category.findByName(name)
        cat
    }

    ArrayList<Category> getSetByIdsInList(def idList){
        ArrayList<Category> catSet = []

        idList.each{id ->
            Category c = Category.get(id)
            if(c){
                catSet.add(c)
            }
        }

        catSet
    }
}
