package com.maswell

import com.maswell.blog.Category
import grails.gorm.transactions.Transactional

@Transactional
class CategoryService {

    def findById(def categoryId){
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

    ArrayList<Category> getSetByIdsInList(ArrayList<Long> idList){
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
