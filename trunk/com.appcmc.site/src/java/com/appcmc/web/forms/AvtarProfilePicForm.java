/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.web.forms;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 *
 * @author Sudarsan
 */
public class AvtarProfilePicForm {

    private String enrollmentNumber;
    private CommonsMultipartFile profilePic;

    public String getEnrollmentNumber() {
        return enrollmentNumber;
    }

    public void setEnrollmentNumber(String enrollmentNumber) {
        this.enrollmentNumber = enrollmentNumber;
    }

    public CommonsMultipartFile getProfilePic() {
        return profilePic;
    }

    public void setProfilePic(CommonsMultipartFile profilePic) {
        this.profilePic = profilePic;
    }
}
