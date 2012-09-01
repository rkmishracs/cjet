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
                || uri.equalsIgnoreCase(req.getContextPath() + ProtectedAppURIS.APP_USER_AVTAR)
                || uri.equalsIgnoreCase(req.getContextPath() + ProtectedAppURIS.APP_USER_AVTAR_UPDATE_PROFILE)) {

            if (user == null) {
                res.sendRedirect(req.getContextPath() + "/appHome");
                return;
            }

        }


        if (uri.equalsIgnoreCase(req.getContextPath() + "/")) {
            String guid = null;
            Cookie[] cookies = req.getCookies();
            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {
                    Cookie c = cookies[i];
                    if ("guid".equals(c.getName())) {
                        guid = c.getValue();
                        LOG.debug(c.getValue());
                        break;
                    }

                }

            }
            if (guid == null) {
                res.sendRedirect(req.getContextPath() + "/appHome");
                return;
            }
            AppCmcSpringContext.init();

            appUserService = (AppUserService) AppContext.APPCONTEXT
                    .getBean(ContextIdNames.APP_USER_SERVICE);
            appUser = appUserService.findByGuid(guid);
            if (appUser == null) {
                return;
            }
            LOG.debug("=================AppUser" + appUser);
            if (appUser.getType().equalsIgnoreCase("admin")) {
                session.setAttribute("user", appUser);
                res.sendRedirect(req.getContextPath() + "/master");
                return;
            }

            studentService = (StudentService) AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_SERVICE);
            contactService = (ContactService) AppContext.APPCONTEXT.getBean(ContextIdNames.CONTACT_SERVICE);

            student = studentService.findStudentByEnrollmentNumber(appUser.getEnrollmentNumber());
            contacts = contactService.findByEnrollmentNumber(appUser.getEnrollmentNumber());
            LOG.debug("=================Student" + student);
            LOG.debug("=================Contacts" + contacts);
            session.setAttribute("user", appUser);
            session.setAttribute("student", student);
            session.setAttribute("contacts", contacts);
            LOG.debug(req.getContextPath() + "/avtar");
            res.sendRedirect(req.getContextPath() + "/avtar");
            return;
        }


        chain.doFilter(req, res);
    }

    @Override
    public void destroy() {
    }
}
