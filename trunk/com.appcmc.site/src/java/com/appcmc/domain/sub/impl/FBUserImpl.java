package com.appcmc.domain.sub.impl;

import com.appcmc.domain.sub.FBUser;
import java.util.Date;
import java.util.UUID;

public class FBUserImpl implements FBUser {

   private Long id;
   private String guid;
   private String name;
   private String firstName;
   private String timeZone;
   private String userName;
   private String email;
   private boolean verified;
   private String locale;
   private String link;
   private String lastName;
   private String gender;
   private String updatedTime;
   private Date createdOn;
   private Long createdBy;
   private Date modifiedOn;
   private Long modifiedBy;
   private Short active;

   public FBUserImpl() {
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

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getFirstName() {
      return firstName;
   }

   public void setFirstName(String firstName) {
      this.firstName = firstName;
   }

   public String getTimeZone() {
      return timeZone;
   }

   public void setTimeZone(String timeZone) {
      this.timeZone = timeZone;
   }

   public String getUserName() {
      return userName;
   }

   public void setUserName(String userName) {
      this.userName = userName;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public boolean isVerified() {
      return verified;
   }

   public void setVerified(boolean verified) {
      this.verified = verified;
   }

   public String getLocale() {
      return locale;
   }

   public void setLocale(String locale) {
      this.locale = locale;
   }

   public String getLink() {
      return link;
   }

   public void setLink(String link) {
      this.link = link;
   }

   public String getLastName() {
      return lastName;
   }

   public void setLastName(String lastName) {
      this.lastName = lastName;
   }

   public String getGender() {
      return gender;
   }

   public void setGender(String gender) {
      this.gender = gender;
   }

   public String getUpdatedTime() {
      return updatedTime;
   }

   public void setUpdatedTime(String updatedTime) {
      this.updatedTime = updatedTime;
   }

   public Date getCreatedOn() {
      return createdOn;
   }

   public void setCreatedOn(Date createdOn) {
      this.createdOn = createdOn;
   }

   public Long getCreatedBy() {
      return createdBy;
   }

   public void setCreatedBy(Long createdBy) {
      this.createdBy = createdBy;
   }

   public Date getModifiedOn() {
      return modifiedOn;
   }

   public void setModifiedOn(Date modifiedOn) {
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
      return "FBUserImpl{" + "id=" + id + ", guid=" + guid + ", name=" + name + ", firstName=" + firstName + ", timeZone=" + timeZone + ", userName=" + userName + ", email=" + email + ", verified=" + verified + ", locale=" + locale + ", link=" + link + ", lastName=" + lastName + ", gender=" + gender + ", updatedTime=" + updatedTime + ", createdOn=" + createdOn + ", createdBy=" + createdBy + ", modifiedOn=" + modifiedOn + ", modifiedBy=" + modifiedBy + ", active=" + active + '}';
   }
   
   
}
