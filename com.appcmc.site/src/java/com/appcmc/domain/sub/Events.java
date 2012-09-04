/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.domain.sub;

import com.appcmc.domain.Domain;
import java.util.Date;

/**
 *
 * @author cmc
 */
public interface Events extends Domain{
    
    void setEventName(String eventName);
    
    String getEventName();
    
    void setEventType(String eventType);
    
    String getEventType();
    
    void setEventOn(Date eventOn);
    
    Date getEventOn();
    
    void setEventLocation(String eventLocation);
    
    String getEventLocation();
    
    void setEventTime(String eventTime);
    
    String getEventTime();
    
    void setAdditionalInfo(String additionalInfo);
    
    String getAdditionalInfo();
    
    
    
}
