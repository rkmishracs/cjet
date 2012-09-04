/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.web.controller;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.AppUser;
import com.appcmc.domain.sub.Events;
import com.appcmc.service.EventsService;
import com.appcmc.utils.AppContext;
import com.appcmc.web.forms.EventCreationFrom;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

/**
 *
 * @author HOME
 */

@Controller
@RequestMapping("/event")
public class EventController {
    
    static Logger LOG = Logger.getLogger(ReportsController.class);
    private Events events = null;
    private EventsService eventsService = null;
    private Date eventdate = null;
    private Date date  = null;
    private List<Events> eventsList = null;
    
    @RequestMapping(method= RequestMethod.GET)
    public String showEventsPage(){
        
        LOG.debug("In Event Controller");
        
        return "/master/eventsHome";
    }
    
    @RequestMapping(method= RequestMethod.GET, value="/showCreateEvent")
    public String showCreateEventPage(@ModelAttribute EventCreationFrom eventCreationFrom){
        return "/master/createEvent";
    }
    
    @RequestMapping(method= RequestMethod.GET, value="/showViewAllEvents")
    public String showAllEvents(WebRequest request){
        
        eventsService = (EventsService) AppContext.APPCONTEXT.getBean(ContextIdNames.EVENT_SERVICE);
        
        eventsList = eventsService.getAll();
        
        request.setAttribute("eventsList", eventsList, WebRequest.SCOPE_REQUEST);
        return "master/viewAllEvents";
    }
    
    
    @RequestMapping(method= RequestMethod.POST, value="/createEvent")
    @ResponseBody
    public String createEvent(@ModelAttribute EventCreationFrom eventCreationFrom, WebRequest request){
        
        date = (Date) AppContext.APPCONTEXT.getBean(ContextIdNames.DATE);
        
        
       LOG.debug("In create Event");

        SimpleDateFormat simpleDateFormat = (SimpleDateFormat) AppContext.APPCONTEXT.getBean(ContextIdNames.SIMPLE_DATE_FORMAT);
        try {

            eventdate = simpleDateFormat.parse(eventCreationFrom.getEventDate());
        } catch (ParseException parseException) {
            LOG.debug("exception", parseException);
        }

        AppUser appUser = (AppUser) request.getAttribute("user", WebRequest.SCOPE_SESSION);
        
        LOG.debug(appUser);
        
        eventsService = (EventsService) AppContext.APPCONTEXT.getBean(ContextIdNames.EVENT_SERVICE);
        
        events = (Events) AppContext.APPCONTEXT.getBean(ContextIdNames.EVENTS);
        
        events.setEventName(eventCreationFrom.getEventName());
        events.setEventType(eventCreationFrom.getEventType());
        events.setEventOn(eventdate);
        events.setEventTime(eventCreationFrom.getEventTime()+" "+eventCreationFrom.getEventTimeSpecific());
        events.setEventLocation(eventCreationFrom.getEventLocation());
        events.setAdditionalInfo(eventCreationFrom.getEventAdditionalInformation());
        events.setCreatedOn(date);
        events.setModifiedOn(date);
        events.setCreatedBy(appUser.getCreatedBy());
        events.setModifiedBy(appUser.getModifiedBy());
        events.setActive(Short.parseShort("1"));
        
        eventsService.create(events);
        
        return "success";
    }
}
