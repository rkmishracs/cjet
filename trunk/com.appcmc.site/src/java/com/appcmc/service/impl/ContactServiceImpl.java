/**
 * 
 */
package com.appcmc.service.impl;

import com.appcmc.domain.sub.Contacts;
import com.appcmc.query.utils.ContactsQueryUtils;
import com.appcmc.service.ContactService;
import com.appcmc.utils.HibernateUtils;
import java.util.List;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 * @author Sudarsan
 * 
 */
public class ContactServiceImpl implements ContactService {
	private static Logger LOG = Logger.getLogger(ContactServiceImpl.class);

	/**
     *
     * @param contacts
     */
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
			LOG.warn("ContactServieImpl", exception);
		} finally {
			if (rollback && tx != null) {
				tx.rollback();
			}
			HibernateUtils.closeSession();
		}
	}

	/**
     *
     * @param id
     * @return
     */
    @Override
	public Contacts findById(Long id) {
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
			LOG.warn("ContactServiceImpl", exception);
			} finally {
			if (rollback && tx != null) {
				tx.rollback();
			}
                        HibernateUtils.closeSession();
		}

		return contacts;
	}
        
        /**
     *
     * @param enrollmentNumber
     * @return
     */
    @Override
        public Contacts findByEnrollmentNumber(String enrollmentNumber){
            Contacts contacts = null;
            
            Session session = HibernateUtils.currentSession();
            
            try{
                Query query = session.createQuery(ContactsQueryUtils.FIND_CONTACTS_BY_ENROLLMENT_NUMBER);
                query.setParameter("EnrollmentNumber", enrollmentNumber);
                contacts = (Contacts) query.uniqueResult();
            }catch(Exception exception){
                LOG.debug("ContactServiceImpl", exception);
            }finally{
                HibernateUtils.closeSession();
            }
            return contacts;
        }

    /**
     *
     * @param mobile
     * @return
     */
    @Override
    public List<Contacts> findByMobile(String mobile) {
         List<Contacts> contactList = null;
            
            Session session = HibernateUtils.currentSession();
            
            try{
                Query query = session.createQuery(ContactsQueryUtils.FIND_CONTACTS_BY_MOBILE);
                query.setParameter("Mobile", mobile);
                contactList = (List<Contacts>) query.list();
            }catch(Exception exception){
                LOG.debug("ContactServiceImpl", exception);
            }finally{
                HibernateUtils.closeSession();
            }
        
        return contactList;
    }

}
