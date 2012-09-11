/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.web.controller;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.service.AppMailService;
import com.appcmc.utils.AppContext;
import com.appcmc.web.forms.EmailProfileForm;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;

/**
 *
 * @author cmc
 */
@Controller
@RequestMapping("/emailProfile")
public class EmailProfileController {

    private AppMailService appMailService = null;
    private static Logger LOG = Logger.getLogger(EmailProfileController.class);

    @RequestMapping(method = RequestMethod.GET)
    public String emailProfileView(@ModelAttribute EmailProfileForm emailProfileForm) {
        return "/avtar/emailProfileView";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/sendEmail")
    public String getEmailProfile(@ModelAttribute EmailProfileForm emailProfileForm, WebRequest request) {

        try {
            if (!emailProfileForm.getEmailAttachment().getOriginalFilename().endsWith(".doc")) {
                request.setAttribute("resumeFailureResponse", "Resume Must '.doc' file", WebRequest.SCOPE_REQUEST);
                return "/avtar/emailProfileView";
            }
            appMailService = (AppMailService) AppContext.APPCONTEXT.getBean(ContextIdNames.APP_MAIL_SERVICE);
            appMailService.sendResume(emailProfileForm);
            request.setAttribute("resumeSuccessResponse", "Resume Sent Successfully", WebRequest.SCOPE_REQUEST);

            return "/avtar/emailProfileView";
        } catch (Exception exception) {
            LOG.warn("EmailProfileController", exception);
            request.setAttribute("resumeFailureResponse", "Some Internal Problem, Try Again", WebRequest.SCOPE_REQUEST);
            return "/avtar/emailProfileView";
        }

    }
}
