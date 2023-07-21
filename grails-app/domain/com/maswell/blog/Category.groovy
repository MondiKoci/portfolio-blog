package com.maswell.blog

class Category {

    String name

    static constraints = {
        name(blank: false, maxSize: 50)
    }

    String toString() {
        name
    }
}
