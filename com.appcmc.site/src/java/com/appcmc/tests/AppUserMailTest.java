/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.tests;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.AppUser;
import com.appcmc.service.AppMailService;
import com.appcmc.utils.AppCmcSpringContext;
import com.appcmc.utils.AppContext;

/**
 *
 * @author Sudarsan
 */
public class AppUserMailTest {

    public static void main(String args[]) {

        AppCmcSpringContext.init();

        AppUser appUser = (AppUser) AppContext.APPCONTEXT.getBean(ContextIdNames.APP_USER);
        AppMailService appMailService = (AppMailService) AppContext.APPCONTEXT.getBean(ContextIdNames.APP_MAIL_SERVICE);
        
        appUser.setEmail("zarvis.a@gmail.com");
        appUser.setEnrollmentNumber("123");
        appUser.setPassword("default");
        appUser.setScreenName("firstName");
        appUser.setFirstName("Last Name");
        appUser.setLastName("lastName");
        appUser.setStatusId(1L);
        appUser.setGender("gender");
        appUser.setTimeZone("timeZone");
        appUser.setType("student");
        appUser.setCreatedOn(new java.util.Date());
        appUser.setCreatedBy(1L);
        appUser.setModifiedOn(new java.util.Date());
        appUser.setModifiedBy(1L);
        appUser.setActive(new Short("1"));
        
        appMailService.sendMail(appUser);


    }
}
