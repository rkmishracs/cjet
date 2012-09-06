/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.service;

import com.appcmc.domain.sub.AppUser;
import com.appcmc.web.forms.EmailProfileForm;
import java.util.List;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.mail.javamail.JavaMailSender;

/**
 *
 * @author Sudarsan
 */
public interface AppMailService {
    
    void setMailSender(JavaMailSender mailSender);
    
    void setVelocityEngine(VelocityEngine velocityEngine);
    
    void sendMail(final AppUser appUser,final List<String> imageList);
    
    void sendResume(final EmailProfileForm emailProfileForm);
    
    void sendPassword(final AppUser appUser);
}
