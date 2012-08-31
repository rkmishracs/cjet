/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.web.forms;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 *
 * @author cmc
 */
public class EmailProfileForm {

    private String emailTo;
    private String emailFrom;
    private String emailSubject;
    private CommonsMultipartFile emailAttachment;
    private String emailMessage;

    public String getEmailTo() {
        return emailTo;
    }

    public void setEmailTo(String emailTo) {
        this.emailTo = emailTo;
    }

    public String getEmailFrom() {
        return emailFrom;
    }

    public void setEmailFrom(String emailFrom) {
        this.emailFrom = emailFrom;
    }

    public String getEmailSubject() {
        return emailSubject;
    }

    public void setEmailSubject(String emailSubject) {
        this.emailSubject = emailSubject;
    }

    public CommonsMultipartFile getEmailAttachment() {
        return emailAttachment;
    }

    public void setEmailAttachment(CommonsMultipartFile emailAttachment) {
        this.emailAttachment = emailAttachment;
    }

    public String getEmailMessage() {
        return emailMessage;
    }

    public void setEmailMessage(String emailMessage) {
        this.emailMessage = emailMessage;
    }
}
