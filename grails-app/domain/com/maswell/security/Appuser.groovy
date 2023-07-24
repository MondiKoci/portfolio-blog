package com.maswell.security

import com.maswell.blog.Post
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class Appuser implements Serializable {

    private static final long serialVersionUID = 1
    transient String displayName
    String username
    String password
    String firstName
    String lastName
    String email
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    Set<Role> getAuthorities() {
        (AppuserRole.findAllByAppuser(this) as List<AppuserRole>)*.role as Set<Role>
    }

    Set<Post> getPosts(){
        Post.findAllByAuthor(this) as Set<Post>
    }

    static constraints = {
        password nullable: false, blank: false, password: true
        username nullable: false, blank: false, unique: true
    }

    static mapping = {
	    password column: '`password`'
    }

    def onLoad(){
        displayName = "$firstName $lastName"
    }

    def getDisplayName(){
        this.displayName
    }
}
