/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.service;

import com.appcmc.domain.sub.Events;
import java.util.List;

/**
 *
 * @author cmc
 */
public interface EventsService {
    
    void create(Events events);
    
    List<Events> getAll();
    
    Events findById(Long id);

}
