package com.maswell

class Project {

    String name
    String description
    Date startDate = null
    Date endDate = null
    DevRole role

    static hasMany = [tasks: Task]

    static constraints = {
        name blank: false
        role nullable: false
        description blank: false
        startDate nullable: true
        endDate nullable: true
    }
}