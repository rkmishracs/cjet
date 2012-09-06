package com.appcmc.service.impl;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.AppUser;
import com.appcmc.service.AppMailService;
import com.appcmc.utils.AppContext;
import com.appcmc.web.controller.EmailProfileController;
import com.appcmc.web.forms.EmailProfileForm;
import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.activation.DataSource;
import javax.mail.internet.MimeMessage;
import javax.mail.util.ByteArrayDataSource;
import org.apache.log4j.Logger;
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

   private static Logger LOG = Logger.getLogger(EmailProfileController.class);
   private JavaMailSender mailSender;
   private VelocityEngine velocityEngine;

    /**
     *
     * @param mailSender
     */
    @Override
   public void setMailSender(JavaMailSender mailSender) {
      this.mailSender = mailSender;
   }

    /**
     *
     * @param velocityEngine
     */
    @Override
   public void setVelocityEngine(VelocityEngine velocityEngine) {
      this.velocityEngine = velocityEngine;
   }

    /**
     *
     * @param appUser
     * @param imageList
     */
    @Override
   public void sendMail(final AppUser appUser, final List<String> imageList) {
      MimeMessagePreparator mimeMessagePreparator = new MimeMessagePreparator() {
         @Override
         public void prepare(MimeMessage mimeMessage) throws Exception {

            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, MimeMessageHelper.MULTIPART_MODE_MIXED);
            mimeMessageHelper.setTo(appUser.getEmail());
            mimeMessageHelper.setFrom("zarvis.a@gmail.com");
            for (int i = 0; i < imageList.size(); i++) {
               mimeMessageHelper.addInline("img" + i, new File(imageList.get(i)));
            }

            
            Map model = new HashMap();
            model.put("user", appUser);

            String text = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, "/mailTemplate.vm", model);
           
              mimeMessageHelper.setText(text, true);


         }
      };

      this.mailSender.send(mimeMessagePreparator);
   }

    /**
     *
     * @param appUser
     */
    @Override
   public void sendPassword(final AppUser appUser) {
      MimeMessagePreparator mimeMessagePreparator = new MimeMessagePreparator() {
         @Override
         public void prepare(MimeMessage mimeMessage) throws Exception {

            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage);
            mimeMessageHelper.setTo(appUser.getEmail());
            mimeMessageHelper.setFrom("cmcavtar@gmail.com");
            Map model = new HashMap();
            model.put("user", appUser);
            mimeMessageHelper.setText("Your Password is:" + appUser.getPassword(), true);



         }
      };

      this.mailSender.send(mimeMessagePreparator);
   }

    /**
     *
     * @param emailProfileForm
     */
    @Override
   public void sendResume(final EmailProfileForm emailProfileForm) {
      MimeMessagePreparator mimeMessagePreparator = new MimeMessagePreparator() {
         @Override
         public void prepare(MimeMessage mimeMessage) throws Exception {

            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, MimeMessageHelper.MULTIPART_MODE_MIXED);

            mimeMessageHelper.setTo(emailProfileForm.getEmailTo());
            mimeMessageHelper.setFrom(emailProfileForm.getEmailFrom());
            mimeMessage.setSubject(emailProfileForm.getEmailSubject());
            Date sentDate = (Date) AppContext.APPCONTEXT.getBean(ContextIdNames.DATE);
            mimeMessage.setSentDate(sentDate);

            DataSource dataSource = new ByteArrayDataSource(emailProfileForm.getEmailAttachment().getBytes(), emailProfileForm.getEmailAttachment().getContentType());
            mimeMessageHelper.addAttachment(emailProfileForm.getEmailAttachment().getOriginalFilename(), dataSource);
         }
      };

      this.mailSender.send(mimeMessagePreparator);


   }
}
