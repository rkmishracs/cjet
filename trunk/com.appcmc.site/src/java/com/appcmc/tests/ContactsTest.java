/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.tests;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.Contacts;
import com.appcmc.service.ContactService;
import com.appcmc.utils.AppCmcSpringContext;
import com.appcmc.utils.AppContext;
import java.util.List;
import org.apache.log4j.Logger;

/**
 *
 * @author cmc
 */
public class ContactsTest {
    private static Logger LOG = Logger.getLogger(ContactsTest.class);
    public static void main(String[] args) {
        
       AppCmcSpringContext.init();
       ContactService contactService = (ContactService) AppContext.APPCONTEXT.getBean(ContextIdNames.CONTACT_SERVICE);
       
       List<Contacts> contactList = contactService.findByMobile("9966632943");
       for(Contacts contacts : contactList){
           LOG.debug(contacts);
       }
    }
}
