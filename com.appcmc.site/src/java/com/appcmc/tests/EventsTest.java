/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.tests;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.Events;
import com.appcmc.service.EventsService;
import com.appcmc.utils.AppCmcSpringContext;
import com.appcmc.utils.AppContext;
import java.util.List;
import org.apache.log4j.Logger;

/**
 *
 * @author cmc
 */
public class EventsTest {

    private static Logger LOG = Logger.getLogger(EventsTest.class);
    
    public static void main(String[] args) {
        AppCmcSpringContext.init();
        EventsService eventsService = (EventsService) AppContext.APPCONTEXT.getBean(ContextIdNames.EVENT_SERVICE);
        
        /*Events events = (Events) AppContext.APPCONTEXT.getBean(ContextIdNames.EVENTS);
        
        events.setEventName("wipro Job Fest");
        events.setEventType("JobFare");
        events.setEventOn(new java.util.Date());
        events.setEventLocation("Hyd");
        events.setEventTime("10AM");
        events.setAdditionalInfo("nothing");
        events.setCreatedOn(new java.util.Date());
        events.setCreatedBy(1L);
        events.setModifiedOn(new java.util.Date());
        events.setModifiedBy(1L);
        events.setActive(Short.parseShort("1"));
        
        eventsService.create(events);*/
        
        /*List<Events> eventsList = eventsService.getAll();
        for(Events event : eventsList){
            LOG.debug(event);
            
        }*/
        
        Events events = eventsService.findById(3L);
        if(events == null){
            LOG.debug("=============Record Not found");
        }else{
            LOG.debug(events);
        }
    }
}
