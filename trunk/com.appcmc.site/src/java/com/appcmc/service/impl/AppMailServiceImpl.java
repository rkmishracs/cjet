/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.service.impl;

import com.appcmc.domain.sub.AppUser;
import com.appcmc.service.AppMailService;
import java.util.HashMap;
import java.util.Map;
import javax.mail.internet.MimeMessage;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.ui.velocity.VelocityEngineUtils;

/**
 *
 * @author Sudarsan
 */
public class AppMailServiceImpl implements AppMailService {
    
    private JavaMailSender mailSender;
    private VelocityEngine velocityEngine;
    
    @Override
    public void setMailSender(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }
    
    @Override
    public void setVelocityEngine(VelocityEngine velocityEngine) {
        this.velocityEngine = velocityEngine;
    }
    
    @Override
    public void sendMail(final AppUser appUser) {
        MimeMessagePreparator mimeMessagePreparator = new MimeMessagePreparator() {
            @Override
            public void prepare(MimeMessage mimeMessage) throws Exception {
                
                MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage);
                mimeMessageHelper.setTo(appUser.getEmail());
                mimeMessageHelper.setFrom("zarvis.a@gmail.com");
                Map model = new HashMap();
                model.put("user", appUser);
                String text = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, "/mailTemplate.vm", model);
                mimeMessageHelper.setText(text, true);
            }
        };
        
        this.mailSender.send(mimeMessagePreparator);
    }
}
