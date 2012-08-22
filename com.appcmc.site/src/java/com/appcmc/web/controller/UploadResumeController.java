/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.web.controller;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.AppUser;
import com.appcmc.service.AppUserService;
import com.appcmc.utils.AppCmcSpringContext;
import com.appcmc.utils.AppContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;

/**
 *
 * @author cmc
 */
@Controller
@RequestMapping("/resume")
public class UploadResumeController {
    private AppUserService appUserService = null;
    private AppUser appUser = null;
    @RequestMapping(method= RequestMethod.GET)
    public String showResumeUploadView(WebRequest request){
        
        AppCmcSpringContext.init();
        appUserService = (AppUserService) AppContext.APPCONTEXT.getBean(ContextIdNames.APP_USER_SERVICE);
        
        appUser = (AppUser) request.getAttribute("user", WebRequest.SCOPE_SESSION);
        appUser = appUserService.findByEnrollmentNumber(appUser.getEnrollmentNumber());
        if(appUser == null){
            //TODO
            return "";
        }
        
        return "/avtar/uploadResume";
    }
    
}
