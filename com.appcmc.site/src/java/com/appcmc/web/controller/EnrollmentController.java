/**
 *
 */
package com.appcmc.web.controller;

import com.appcmc.utils.EnrollmentNumberGenarator;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author Sudarsan
 *
 */
@Controller
@RequestMapping("/enrl-home")
public class EnrollmentController {

    private static Logger LOG = Logger.getLogger(EnrollmentController.class);

    @RequestMapping(method = RequestMethod.GET, value = "/enrl-number")
    @ResponseBody
    public String genarateEnrollmentNumber() {
        return EnrollmentNumberGenarator.genarateEnrollmentNumber();
    }

}
