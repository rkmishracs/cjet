/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.security;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.AppUser;
import com.appcmc.domain.sub.Contacts;
import com.appcmc.domain.sub.Student;
import com.appcmc.service.AppUserService;
import com.appcmc.service.ContactService;
import com.appcmc.service.StudentService;
import com.appcmc.utils.AppCmcSpringContext;
import com.appcmc.utils.AppContext;
import com.appcmc.utils.ProtectedAppURIS;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 *
 * @author LENOVO
 */
public class FilterDispatcher implements Filter {

    private FilterConfig config = null;
    private static Logger LOG = Logger.getLogger(FilterDispatcher.class);
    private AppUserService appUserService = null;
    private StudentService studentService = null;
    private Student student = null;
    private ContactService contactService = null;
    private Contacts contacts = null;
    private AppUser appUser = null;

    @Override
    public void init(FilterConfig config) {
        this.config = config;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        HttpSession session = req.getSession();
        AppUser user = (AppUser) session.getAttribute("user");


        if (uri.equalsIgnoreCase(req.getContextPath() + ProtectedAppURIS.APP_USER_MASTER)
                || uri.equalsIgnoreCase(req.getContextPath() + ProtectedAppURIS.APP_USER_MASTER_ENROLLMENT)
                || uri.equalsIgnoreCase(req.getContextPath() + ProtectedAppURIS.App_USER_MASTER_VIEW_ALL_PROFILES)
                || uri.equalsIgnoreCase(req.getContextPath() + ProtectedAppURIS.APP_USER_MASTER_VIEW_ALL_ENROLLS)
                || uri.equalsIgnoreCase(req.getContextPath() + ProtectedAppURIS.APP_USER_MASTER_VIEW_ALL_MONTHLY_REPORTS)
                || uri.equalsIgnoreCase(req.getContextPath() + ProtectedAppURIS.APP_USER_MASTER_VIEW_ALL_WEEKLY_REPORTS)
                || uri.equalsIgnoreCase(req.getContextPath() + ProtectedAppURIS.APP_USER_MASTER_VIEW_ALL_DAILY_REPORTS)
                || uri.equalsIgnoreCase(req.getContextPath() + ProtectedAppURIS.APP_USER_MASTER_SEARCH)
                || uri.equalsIgnoreCase(req.getContextPath() + ProtectedAppURIS.APP_USER_AVTAR)
                || uri.equalsIgnoreCase(req.getContextPath() + ProtectedAppURIS.APP_USER_AVTAR_UPDATE_PROFILE)
                || uri.equalsIgnoreCase(req.getContextPath() + ProtectedAppURIS.APP_USER_AVTAR_UPLOAD_RESUME)
                || uri.equalsIgnoreCase(req.getContextPath() + ProtectedAppURIS.APP_USER_AVTAR_VIEW_RESUME)
                || uri.equalsIgnoreCase(req.getContextPath() + ProtectedAppURIS.APP_USER_AVTAR_EMAIL_RESUME)
                || uri.equalsIgnoreCase(req.getContextPath() + ProtectedAppURIS.APP_USER_AVTAR_UPDATE_EDUCATION)) {

            if (user == null) {
                res.sendRedirect(req.getContextPath() + "/appHome");

                return;
            }
        }

        
        chain.doFilter(req, res);
    }

    @Override
    public void destroy() {
    }
}
