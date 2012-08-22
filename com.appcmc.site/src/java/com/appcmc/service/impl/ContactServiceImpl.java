/**
 * 
 */
package com.appcmc.service.impl;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.appcmc.domain.sub.Contacts;
import com.appcmc.query.utils.ContactsQueryUtils;
import com.appcmc.service.ContactService;
import com.appcmc.utils.HibernateUtils;
import org.hibernate.Query;

/**
 * @author Sudarsan
 * 
 */
public class ContactServiceImpl implements ContactService {
	private static Logger LOG = Logger.getLogger(ContactServiceImpl.class);

	@Override
	public void create(Contacts contacts) {
		Session session = HibernateUtils.currentSession();
		Transaction tx = null;
		boolean rollback = true;
		try {
			tx = session.beginTransaction();
			session.saveOrUpdate(contacts);
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
	public Contacts findById(Long id) {
		LOG.debug("Student Id in ContactsService : " + id);
		Contacts contacts = null;
		Session session = HibernateUtils.currentSession();
		Transaction tx = null;
		boolean rollback = true;
		try {
			tx = session.beginTransaction();
			contacts = (Contacts) session.get(Contacts.class, id);
			tx.commit();
			rollback = false;
		} catch (Exception exception) {
			LOG.warn("Exception", exception);
			HibernateUtils.closeSession();
		} finally {
			if (rollback && tx != null) {
				tx.rollback();
			}
		}

		return contacts;
	}
        
        @Override
        public Contacts findByEnrollmentNumber(String enrollmentNumber){
            Contacts contacts = null;
            
            Session session = HibernateUtils.currentSession();
            
            try{
                Query query = session.createQuery(ContactsQueryUtils.FIND_CONTACTS_BY_ENROLLMENT_NUMBER);
                query.setParameter("EnrollmentNumber", enrollmentNumber);
                contacts = (Contacts) query.uniqueResult();
            }catch(Exception exception){
                LOG.debug("Contacts Ex", exception);
            }finally{
                HibernateUtils.closeSession();
            }
            
            
            return contacts;
        }

}
