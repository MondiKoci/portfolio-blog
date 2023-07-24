package com.maswell.blog

import com.maswell.security.Appuser

class Post {

    String title
    String content
    Date dateCreated = new Date()
    Appuser author

    static hasMany = [categories: Category]
    static mapping = {
        sort dateCreated: "desc"
    }

    static constraints = {
        title(blank: false, maxSize: 100)
        content(blank: false, maxSize: 5000)
    }
}
