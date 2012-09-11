/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.web.controller;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.FBUser;
import com.appcmc.utils.AppContext;
import com.appcmc.web.forms.FaceBookStatusForm;
import java.io.InputStream;
import java.util.Properties;
import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.scribe.builder.ServiceBuilder;
import org.scribe.builder.api.FacebookApi;
import org.scribe.model.OAuthRequest;
import org.scribe.model.Response;
import org.scribe.model.Token;
import org.scribe.model.Verb;
import org.scribe.model.Verifier;
import org.scribe.oauth.OAuthService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

/**
 *
 * @author Sudarsan
 */
@Controller
@RequestMapping("/social")
public class SocialController {

   private static Logger LOG = Logger.getLogger(SocialController.class);
   private Properties properties = null;
   private InputStream inputStream = null;
   private static final String PROTECTED_RESOURCE_URL = "https://graph.facebook.com/me";
   private static final String SCOPE = "email,offline_access,user_status,publish_actions,publish_stream,read_friendlists";
   private static final Token EMPTY_TOKEN = null;
   private OAuthService service;
   private Token accessToken = null;
   private FBUser fbUser = null;
   private String fbUserId = null;
   private Verifier verifier = null;
   @RequestMapping(method = RequestMethod.GET)
   public String showFaceBookHome(WebRequest request) {
      LOG.debug("==============In Social Controller=========");
      try {
         inputStream = Thread.currentThread().getContextClassLoader().getResourceAsStream("social.properties");
         properties = new Properties();
         properties.load(inputStream);

         service = new ServiceBuilder()
                 .provider(FacebookApi.class)
                 .apiKey(properties
                 .getProperty("app.config.oauth.facebook.apikey"))
                 .apiSecret(
                 properties.getProperty("app.config.oauth.facebook.apisecret"))
                 .callback(properties.getProperty("app.config.oauth.facebook.callback"))
                 .build();

         String authorizationUrl = service.getAuthorizationUrl(EMPTY_TOKEN);
         
         LOG.debug("AuthorizationURL ===================="+authorizationUrl);
         return "redirect:" + authorizationUrl+"&scope="+SCOPE;

      } catch (Exception exception) {
         LOG.debug("SocialController", exception);
      } finally {
         if (inputStream != null) {
            try {
               inputStream.close();
            } catch (Exception exception) {
               LOG.debug("SocialController", exception);
            }

         }
      }

      return "";
   }

   @RequestMapping(method = RequestMethod.GET, params = {"code"})
   public String fbLogin(WebRequest request, String code, @ModelAttribute FaceBookStatusForm faceBookStatusForm) {
      verifier = new Verifier(request.getParameter("code"));

      accessToken = service.getAccessToken(EMPTY_TOKEN, verifier);

      OAuthRequest oAuthRequest = new OAuthRequest(Verb.GET,
              PROTECTED_RESOURCE_URL);
      service.signRequest(accessToken, oAuthRequest);
      Response oAuthResponse = oAuthRequest.send();

      JSONObject jSONObject = null;
      try {
         jSONObject = new JSONObject(oAuthResponse.getBody());
         
         LOG.debug(jSONObject.toString());

         fbUser = (FBUser) AppContext.APPCONTEXT.getBean(ContextIdNames.FB_USER);
         fbUser.setId(Long.parseLong(jSONObject.getString("id")));
         //fbUser.setFirstName(jSONObject.getString("first_name"));
         //fbUser.setName(jSONObject.getString("name"));
         //fbUser.setTimeZone(jSONObject.getString("timezone"));
         //fbUser.setUserName(jSONObject.getString("username"));
         //fbUser.setEmail(jSONObject.getString("email"));
         //fbUser.setVerified(Boolean.parseBoolean(jSONObject
           //      .getString("verified")));
         //fbUser.setLocale(jSONObject.getString("locale"));
         //fbUser.setLink(jSONObject.getString("link"));
         //fbUser.setLastName(jSONObject.getString("last_name"));
         fbUser.setGender(jSONObject.getString("gender"));
         //fbUser.setUpdatedTime(jSONObject.getString("updated_time"));

         this.fbUserId = String.valueOf(fbUser.getId());
         
         LOG.debug("FbUser : =================" + fbUser);

         request.setAttribute("fbUser", fbUser, WebRequest.SCOPE_SESSION);
         return "/avtar/fbProfileView";

      } catch (Exception exception) {
         LOG.debug("SocialController", exception);
      }

      return "";
   }
   
   @RequestMapping(method = RequestMethod.POST,value = "/updateStatus")
   @ResponseBody
   public String postMessageToFb(@ModelAttribute FaceBookStatusForm faceBookStatusForm){
      
      String PROTECTED_RESOURCE_URL_FEED = "https://graph.facebook.com/"+this.fbUserId+"/feed";
      
      
      service = new ServiceBuilder()
                  .provider(FacebookApi.class)
                 .apiKey(properties
                 .getProperty("app.config.oauth.facebook.apikey"))
                 .apiSecret(
                 properties.getProperty("app.config.oauth.facebook.apisecret"))
                 .callback(properties.getProperty("app.config.oauth.facebook.callback"))
                 .build();           
      
      OAuthRequest request = new OAuthRequest(Verb.POST, PROTECTED_RESOURCE_URL_FEED);      

      request.addHeader("Content-Type", "text/html");
      request.addBodyParameter("message", faceBookStatusForm.getStatusMessage());
      
      service.signRequest(accessToken, request);
      
      Response response = request.send();
      return response.getBody();
   }
   
   
}
