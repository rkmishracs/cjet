/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.domain.sub.impl;

import com.appcmc.domain.sub.Events;
import java.util.Date;
import java.util.UUID;

/**
 *
 * @author cmc
 */
public class EventsImpl implements Events {

    private Long id;
    private String guid;
    private String eventName;
    private String eventType;
    private Date eventOn;
    private String eventLocation;
    private String eventTime;
    private String additionalInfo;
    private java.util.Date createdOn;
    private Long createdBy;
    private java.util.Date modifiedOn;
    private Long modifiedBy;
    private Short active;

    public EventsImpl() {
        setGuid(UUID.randomUUID().toString());
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getGuid() {
        return guid;
    }

    public void setGuid(String guid) {
        this.guid = guid;
    }

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

    public Date getEventOn() {
        return eventOn;
    }

    public void setEventOn(Date eventOn) {
        this.eventOn = eventOn;
    }

    public String getEventLocation() {
        return eventLocation;
    }

    public void setEventLocation(String eventLocation) {
        this.eventLocation = eventLocation;
    }

    public String getEventTime() {
        return eventTime;
    }

    public void setEventTime(String eventTime) {
        this.eventTime = eventTime;
    }

    public String getAdditionalInfo() {
        return additionalInfo;
    }

    public void setAdditionalInfo(String additionalInfo) {
        this.additionalInfo = additionalInfo;
    }

    public java.util.Date getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(java.util.Date createdOn) {
        this.createdOn = createdOn;
    }

    public Long getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Long createdBy) {
        this.createdBy = createdBy;
    }

    public java.util.Date getModifiedOn() {
        return modifiedOn;
    }

    public void setModifiedOn(java.util.Date modifiedOn) {
        this.modifiedOn = modifiedOn;
    }

    public Long getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(Long modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public Short getActive() {
        return active;
    }

    public void setActive(Short active) {
        this.active = active;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("EventsImpl [id=");
        builder.append(id);
        builder.append(", guid=");
        builder.append(guid);
        builder.append(", eventName=");
        builder.append(eventName);
        builder.append(", eventType=");
        builder.append(eventType);
        builder.append(", eventOn=");
        builder.append(eventOn);
        builder.append(", eventLocation=");
        builder.append(eventLocation);
        builder.append(", eventTime=");
        builder.append(eventTime);
        builder.append(", additionalInfo=");
        builder.append(additionalInfo);
        builder.append(", createdOn=");
        builder.append(createdOn);
        builder.append(", createdBy=");
        builder.append(createdBy);
        builder.append(", modifiedOn=");
        builder.append(modifiedOn);
        builder.append(", modifiedBy=");
        builder.append(modifiedBy);
        builder.append(", active=");
        builder.append(active);
        builder.append("]");
        return builder.toString();
    }
}
