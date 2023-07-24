package projects

import com.maswell.security.Appuser
import com.maswell.security.AppuserRole
import com.maswell.security.Role
import grails.gorm.transactions.Transactional

@Transactional
class BootStrap {

    def init = { servletContext ->
        new Role(authority: 'ROLE_SUPER_ADMIN').save()
        new Role(authority: 'ROLE_USER').save()
        Appuser.withTransaction {

            Appuser u = new Appuser()
            u.username = "Admin"
            u.password = "test"
            u.firstName = "Edmond"
            u.lastName = "Koci"
            u.email = "mondi.s.koci@gmail.com"
            u.save(flush:true)

            Role r = new Role([name:"ROLE_ADMIN"])
            r.save(flush:true)

            Appuser au = Appuser.findByUsername("Admin")
            Role ro = Role.findByAuthority("ROLE_ADMIN")
            AppuserRole appuserRole = new AppuserRole([appuser:au, role:ro])
            appuserRole.save(flush:true)
        }

    }
    def destroy = {
    }
}
