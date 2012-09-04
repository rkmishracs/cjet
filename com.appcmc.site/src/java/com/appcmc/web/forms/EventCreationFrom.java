/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.web.forms;

/**
 *
 * @author HOME
 */
public class EventCreationFrom {
    
    private String eventName;
    private String eventType;
    private String eventDate;
    private String eventTime;
    private String eventTimeSpecific;
    private String eventLocation;
    private String eventAdditionalInformation;

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getEventType() {
        return eventType;
    }

    public void setEventType(String eventType) {
        this.eventType = eventType;
    }

    public String getEventDate() {
        return eventDate;
    }

    public void setEventDate(String eventDate) {
        this.eventDate = eventDate;
    }

    public String getEventTime() {
        return eventTime;
    }

    public void setEventTime(String eventTime) {
        this.eventTime = eventTime;
    }

    public String getEventTimeSpecific() {
        return eventTimeSpecific;
    }

    public void setEventTimeSpecific(String eventTimeSpecific) {
        this.eventTimeSpecific = eventTimeSpecific;
    }
    
    public String getEventLocation() {
        return eventLocation;
    }

    public void setEventLocation(String eventLocation) {
        this.eventLocation = eventLocation;
    }

    public String getEventAdditionalInformation() {
        return eventAdditionalInformation;
    }

    public void setEventAdditionalInformation(String eventAdditionalInformation) {
        this.eventAdditionalInformation = eventAdditionalInformation;
    }
}
