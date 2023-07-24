package com.maswell.security

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured('IS_AUTHENTICATED_FULLY')
class LoginSuccessController {

    def springSecurityService

    def index() {
        Appuser appuser = springSecurityService.currentUser
        def roles = appuser.getAuthorities()
        redirect([controller:'post'])
    }
}
