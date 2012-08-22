/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.service;

import com.appcmc.domain.sub.StudentProfile;
import java.util.List;

/**
 *
 * @author cmc
 */
public interface StudentProfileService {
    
    void create(StudentProfile studentProfile);
    
    List<StudentProfile> getAll();
    
    StudentProfile findStudentProfileByEnrollmentNumber(String enrollmentNumber);
}
