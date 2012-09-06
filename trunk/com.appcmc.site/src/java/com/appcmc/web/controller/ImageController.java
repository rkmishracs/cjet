/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.appcmc.web.controller;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.Student;
import com.appcmc.service.StudentService;
import com.appcmc.utils.AppContext;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;

@Controller
@RequestMapping("/picture")
public class ImageController extends HttpServlet {
    
    private static Logger LOG = Logger.getLogger(AvtarHomeController.class);
    
    @RequestMapping(method = RequestMethod.GET,params="id")
    public void showPicture(HttpServletResponse response,WebRequest request,@RequestParam String id) throws IOException {
        
        response.setContentType("image/jpeg");
        OutputStream outputStream = null;
        try {
            StudentService studentService = 
                    (StudentService)AppContext.APPCONTEXT.getBean(ContextIdNames.STUDENT_SERVICE);
            Student studentInfo = studentService.findStudentByEnrollmentNumber(id);
            byte[] image = studentInfo.getProfilePic();
            response.setContentLength(image.length);
            outputStream = response.getOutputStream();
            outputStream.write(image);
        } catch (Exception exception) {
            LOG.error("ImageController", exception);
        } finally {
            if (outputStream != null) {
                outputStream.close();
            }
        }
        
    }
}
