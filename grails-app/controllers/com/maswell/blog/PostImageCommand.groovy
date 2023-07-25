package com.maswell.blog

import grails.validation.Validateable
import org.springframework.web.multipart.MultipartFile

class PostImageCommand implements Validateable {
    MultipartFile postImageFile
    Long id
    Integer version

    static constraints = {
        id nullable: false
        version nullable: false
        postImageFile  validator: { val, obj ->
            if ( val == null ) {
                return false
            }
            if ( val.empty ) {
                return false
            }

            ['jpeg', 'jpg', 'png'].any { extension -> // <1>
                val.originalFilename?.toLowerCase()?.endsWith(extension)
            }
        }
    }
}
