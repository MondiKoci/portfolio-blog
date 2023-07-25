package com.maswell.blog

import com.maswell.security.Appuser

import java.text.SimpleDateFormat

class Post {

    String title
    String content
    Date dateCreated = new Date()
    Appuser author

    byte[] postImageBytes
    String postImageContentType

    static hasMany = [categories: Category]
    static mapping = {
        sort dateCreated: "desc"
    }

    static constraints = {
        title(blank: false, maxSize: 100)
        content(blank: false, maxSize: 5000)
        postImageBytes nullable: true, maxSize: 1024 * 1024 * 4
        postImageContentType nullable: true
    }
}
