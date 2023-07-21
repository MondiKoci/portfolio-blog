package com.maswell

class Task {
    String name

    static belongsTo = [project: Project]
    // other properties and constraints
}