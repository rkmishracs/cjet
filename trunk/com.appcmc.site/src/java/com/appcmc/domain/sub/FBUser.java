package com.appcmc.domain.sub;

import com.appcmc.domain.Domain;

public interface FBUser extends Domain {

   void setName(String name);

   String getName();

   void setFirstName(String firstName);

   String getFirstName();

   void setTimeZone(String timeZone);

   String getTimeZone();

   void setUserName(String userName);

   String getUserName();

   void setEmail(String email);

   String getEmail();

   void setVerified(boolean verified);

   boolean isVerified();

   void setLocale(String locale);

   String getLocale();

   void setLink(String link);

   String getLink();

   void setLastName(String lastName);

   String getLastName();

   void setGender(String gender);

   String getGender();

   void setUpdatedTime(String updatedTime);

   String getUpdatedTime();
}
