/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.query.utils;

/**
 *
 * @author Sudarsan
 */
public interface ContactsQueryUtils {
    
    public static final String FIND_CONTACTS_BY_ENROLLMENT_NUMBER = "from Contacts contacts where contacts.enrollmentNumber=:EnrollmentNumber";
    
}
