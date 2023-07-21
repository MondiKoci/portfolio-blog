package com.maswell

class DevRole {
    String name
    String description

    static hasMany = [projects: Project]

    static constraints = {
        name blank: false
        description blank: true
    }
}
