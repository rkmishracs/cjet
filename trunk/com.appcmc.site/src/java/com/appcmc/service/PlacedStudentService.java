/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.service;

import com.appcmc.domain.sub.PlacedStudent;
import java.util.List;

/**
 *
 * @author cmc
 */
public interface PlacedStudentService {
    
    void create(PlacedStudent placedStudent);
    
    List<PlacedStudent> getAll();
}
