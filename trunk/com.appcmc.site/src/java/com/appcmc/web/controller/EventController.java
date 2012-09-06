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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
    
    static Logger LOG = Logger.getLogger(EventController.class);
    private Events events = null;
    private EventsService eventsService = null;
    private Date eventdate = null;
    private Date date  = null;
    private List<Events> eventsList = null;
    List<Events> activeEventsList = null;
    private AppUser appUser = null;
    
    @RequestMapping(method= RequestMethod.GET)
    public String showEventsPage(){
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
        activeEventsList = new ArrayList<Events>();
        for(Events evnt : eventsList){
            if(evnt.getActive().equals(Short.parseShort("1"))){
                activeEventsList.add(evnt);
            }
        }
        request.setAttribute("eventsList", activeEventsList, WebRequest.SCOPE_REQUEST);
        
        return "master/viewAllEvents";
    }
    
    
    @RequestMapping(method= RequestMethod.POST, value="/createEvent")
    @ResponseBody
    public String createEvent(@ModelAttribute EventCreationFrom eventCreationFrom, WebRequest request){
        
        date = (Date) AppContext.APPCONTEXT.getBean(ContextIdNames.DATE);
        SimpleDateFormat simpleDateFormat = (SimpleDateFormat) AppContext.APPCONTEXT.getBean(ContextIdNames.SIMPLE_DATE_FORMAT);
        try {
            eventdate = simpleDateFormat.parse(eventCreationFrom.getEventDate());
        } catch (ParseException parseException) {
            LOG.debug("EventController", parseException);
        }
        appUser = (AppUser) request.getAttribute("user", WebRequest.SCOPE_SESSION);
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
    
    @RequestMapping(method = RequestMethod.GET, value = "/cancelEvent/{id}")
    public String cancelEvent(@PathVariable Long id, WebRequest request){
        
        date = (Date) AppContext.APPCONTEXT.getBean(ContextIdNames.DATE);
        appUser = (AppUser) request.getAttribute("user", WebRequest.SCOPE_SESSION);
        eventsService = (EventsService) AppContext.APPCONTEXT.getBean(ContextIdNames.EVENT_SERVICE);
        Events events1 = eventsService.findById(id);
        events = (Events) AppContext.APPCONTEXT.getBean(ContextIdNames.EVENTS);
        events.setId(events1.getId());
        events.setGuid(events1.getGuid());
        events.setEventName(events1.getEventName());
        events.setEventLocation(events1.getEventLocation());
        events.setEventOn(events1.getEventOn());
        events.setEventTime(events1.getEventTime());
        events.setEventType(events1.getEventType());
        events.setAdditionalInfo(events1.getAdditionalInfo());
        events.setCreatedBy(events1.getCreatedBy());
        events.setCreatedOn(events1.getCreatedOn());
        events.setModifiedBy(appUser.getId());
        events.setModifiedOn(date);
        events.setActive(Short.parseShort("0"));
        eventsService.create(events);
        
        eventsList = eventsService.getAll();
        activeEventsList = new ArrayList<Events>();
        for(Events evnt : eventsList){
            if(evnt.getActive().equals(Short.parseShort("1"))){
                activeEventsList.add(evnt);
            }
        }
        request.setAttribute("successCancelEvent", events1.getEventName()+" Is Successfully Canceled", WebRequest.SCOPE_REQUEST);
        request.setAttribute("eventsList", activeEventsList, WebRequest.SCOPE_REQUEST);

        return "master/viewAllEvents";
    }
}
