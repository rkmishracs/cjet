/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.service.impl;

import com.appcmc.domain.sub.Events;
import com.appcmc.query.utils.EventsQueryUtils;
import com.appcmc.service.EventsService;
import com.appcmc.utils.HibernateUtils;
import java.util.List;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author cmc
 */
public class EventsServiceImpl implements EventsService{

    private static Logger LOG = Logger.getLogger(EventsServiceImpl.class);
    
    @Override
    public void create(Events events) {
        // TODO Auto-generated method stub
        Session session = HibernateUtils.currentSession();
        Transaction tx = null;
        boolean rollback = true;
        try {
            tx = session.beginTransaction();
            session.saveOrUpdate(events);
            tx.commit();
            rollback = false;

        } catch (Exception exception) {
            LOG.warn("exception", exception);
        } finally {
            if (rollback && tx != null) {
                tx.rollback();
            }
            HibernateUtils.closeSession();
        }
    }

    @Override
    public List<Events> getAll() {
        Session session = HibernateUtils.currentSession();
        List<Events> eventsList = null;
        try{
            Query query = session.createQuery(EventsQueryUtils.GET_ALL);
            eventsList = (List<Events>) query.list();
            
        }catch(Exception exception){
            LOG.warn("exception", exception);
        }finally{
           HibernateUtils.closeSession(); 
        }
        
        return eventsList;
    }

}
