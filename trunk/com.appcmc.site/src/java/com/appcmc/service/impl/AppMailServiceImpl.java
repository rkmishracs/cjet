/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.service.impl;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.AppUser;
import com.appcmc.service.AppMailService;
import com.appcmc.utils.AppContext;
import com.appcmc.web.controller.EmailProfileController;
import com.appcmc.web.forms.EmailProfileForm;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.mail.internet.MimeMessage;
import org.apache.log4j.Logger;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.ui.velocity.VelocityEngineUtils;

/**
 *
 * @author Sudarsan
 */
public class AppMailServiceImpl implements AppMailService {
    private static Logger LOG = Logger.getLogger(EmailProfileController.class);
    private JavaMailSender mailSender;
    private VelocityEngine velocityEngine;
    private OutputStream os = null;

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
                mimeMessageHelper.setText("Your Password is:"+appUser.getPassword(),true);
            }
        };

        this.mailSender.send(mimeMessagePreparator);
    }

    @Override
    public void sendResume(final EmailProfileForm emailProfileForm){
        MimeMessagePreparator mimeMessagePreparator = new MimeMessagePreparator() {
            @Override
            public void prepare(MimeMessage mimeMessage) throws Exception {

                MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, MimeMessageHelper.MULTIPART_MODE_MIXED);
                
                mimeMessageHelper.setTo(emailProfileForm.getEmailTo());
                mimeMessageHelper.setFrom(emailProfileForm.getEmailFrom());
                mimeMessage.setSubject(emailProfileForm.getEmailSubject());
                Date sentDate = (Date) AppContext.APPCONTEXT.getBean(ContextIdNames.DATE);
                mimeMessage.setSentDate(sentDate);

                File file = new File(emailProfileForm.getEmailAttachment().getOriginalFilename());
                byte[] bytes = emailProfileForm.getEmailAttachment().getBytes();
                LOG.debug(bytes.length);
                
                LOG.debug(file.getAbsolutePath());
                try{
                    os = new FileOutputStream(file);
                    os.write(bytes);
                    LOG.debug(file.length());
                }catch(Exception exception){
                    LOG.warn("exception", exception);
                }finally{
                    if(os != null){
                        os.close();
                    }
                }
                

            }
        };

        this.mailSender.send(mimeMessagePreparator);


    }
}
