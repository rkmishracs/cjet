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
public class AvtarResumeForm {

    private String enrollmentNumber;
    private CommonsMultipartFile resumeDoc;

    public String getEnrollmentNumber() {
        return enrollmentNumber;
    }

    public void setEnrollmentNumber(String enrollmentNumber) {
        this.enrollmentNumber = enrollmentNumber;
    }

    public CommonsMultipartFile getResumeDoc() {
        return resumeDoc;
    }

    public void setResumeDoc(CommonsMultipartFile resumeDoc) {
        this.resumeDoc = resumeDoc;
    }
}
