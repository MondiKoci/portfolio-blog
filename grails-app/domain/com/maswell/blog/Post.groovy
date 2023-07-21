package com.maswell.blog

import com.maswell.security.Appuser
import grails.plugin.springsecurity.SpringSecurityService

import java.text.SimpleDateFormat

class Post {

    String title
    String content
    Date dateCreated = new Date()
    Appuser author

    static hasMany = [categories: Category]

    static constraints = {
        title(blank: false, maxSize: 100)
        content(blank: false, maxSize: 5000)
    }

    def getDateCreated(){
        String pattern = "MMMM d, yyyy"
        SimpleDateFormat sdf = new SimpleDateFormat(pattern)
        sdf.format(dateCreated)
    }
}
