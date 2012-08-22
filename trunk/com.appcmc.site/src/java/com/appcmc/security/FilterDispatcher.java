/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.security;

import com.appcmc.domain.sub.AppUser;
import com.appcmc.utils.ProtectedAppURIS;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LENOVO
 */
public class FilterDispatcher implements Filter {

    private FilterConfig config = null;

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

        
        
             if (uri.equalsIgnoreCase(req.getContextPath() + ProtectedAppURIS.APP_USER_MASTER)||
                uri.equalsIgnoreCase(req.getContextPath() + ProtectedAppURIS.APP_USER_AVTAR)|| 
                uri.equalsIgnoreCase(req.getContextPath() + ProtectedAppURIS.APP_USER_AVTAR_UPDATE_PROFILE )){
            
             if (user == null) {
                res.sendRedirect(req.getContextPath()+"/appHome");
                return;
            }
        

        } 

        chain.doFilter(req, res);
    }

    @Override
    public void destroy() {
    }
}
