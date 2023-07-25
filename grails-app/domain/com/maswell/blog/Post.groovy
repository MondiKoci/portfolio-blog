package com.maswell.blog

import com.maswell.security.Appuser

import java.text.SimpleDateFormat

class Post {

    String title
    String content
    Date dateCreated = new Date()
    Appuser author

    byte[] postImageBytes // <1>
    String postImageContentType // <2>

    static hasMany = [categories: Category]
    static mapping = {
        sort dateCreated: "desc"
    }

    static constraints = {
        title(blank: false, maxSize: 100)
        content(blank: false, maxSize: 5000)
        postImageBytes nullable: true
        postImageContentType nullable: true
    }
}
