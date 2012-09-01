package com.appcmc.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.appcmc.domain.sub.AppUser;
import com.appcmc.query.utils.AppUserQueryUtils;
import com.appcmc.service.AppUserService;
import com.appcmc.utils.HibernateUtils;

/**
 * @author GANESH
 *
 */
public class AppUserServiceImpl implements AppUserService {

    private static Logger LOG = Logger.getLogger(AppUserServiceImpl.class);
    private static List<AppUser> appUserList = new ArrayList<AppUser>();

    /*
     * (non-Javadoc)
     * 
     * @see com.appcmc.service.AppUserService#authenticate(java.lang.String,
     * java.lang.String) To authenticate App User in the Application
     */
    @Override
    public AppUser authenticate(String enrollmentNumber, String password) {
        AppUser appUser = null;
        Session session = HibernateUtils.currentSession();

        try {

            Query query = session.createQuery(AppUserQueryUtils.AUTHENTICATE);
            query.setString("EnrollmentNumber", enrollmentNumber);
            query.setString("Password", password);
            appUser = (AppUser) query.uniqueResult();
            if (appUser == null) {
                return appUser;
            }
        } catch (Exception exception) {
            LOG.warn(exception.toString());

        } finally {
            HibernateUtils.closeSession();
        }
        return appUser;

    }

    /*
     * (non-Javadoc)
     * 
     * @see com.appcmc.service.AppUserService#getAll() To get the All App Users
     * in the Application
     */
    @SuppressWarnings("unchecked")
    public List<AppUser> getAll() {
        try {

            Session session = HibernateUtils.currentSession();
            Query query = session.createQuery(AppUserQueryUtils.GETALL);
            appUserList = (List<AppUser>) query.list();
        } catch (Exception exception) {
            LOG.warn(exception.toString());

        } finally {
            HibernateUtils.closeSession();
        }
        return appUserList;

    }

    /*
     * (non-Javadoc)
     * 
     * @see com.appcmc.service.AppUserService#findByUserEmail(java.lang.String)
     * To get the App User By email in the Application
     */
    @Override
    public AppUser findByUserEmail(String email) {
        // TODO Auto-generated method stud
        AppUser appUser = null;
        try {

            Session session = HibernateUtils.currentSession();
            Query query = session.createQuery(AppUserQueryUtils.FINDBYEMAIL);
            query.setString("Email", email);
            appUser = (AppUser) query.uniqueResult();
            if (appUser == null) {
                return appUser;
            }
        } catch (Exception exception) {
            // TO DO PrintStack Trace with Log4J
            LOG.warn(exception.toString());
        } finally {
            HibernateUtils.closeSession();
        }
        return appUser;
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.appcmc.service.AppUserService#create(com.appcmc.domain.sub.AppUser)
     * To create an App User in the Application
     */
    public void create(AppUser appUser) {
        Session session = HibernateUtils.currentSession();
        Transaction tx = null;
        boolean rollback = true;
        try {
            tx = session.beginTransaction();
            session.saveOrUpdate(appUser);
            tx.commit();
            rollback = false;
        } catch (Exception exception) {
            LOG.warn("Exception", exception);

        } finally {
            if (rollback && tx != null) {
                tx.rollback();
            }
            HibernateUtils.closeSession();
        }
    }

    @Override
    public AppUser findByEnrollmentNumber(String enrollmentNumber) {

        Session session = HibernateUtils.currentSession();
        AppUser appUser = null;
        try {
            Query query = session
                    .createQuery(AppUserQueryUtils.FIND_BY_ENROLLMENT_NUMBER);
            query.setParameter("EnrollmentNumber", enrollmentNumber);
            appUser = (AppUser) query.uniqueResult();
        } catch (Exception exception) {
            LOG.warn("APPUSER SERVICE", exception);
        } finally {
            HibernateUtils.closeSession();
        }

        return appUser;
    }

    @Override
    public AppUser findByGuid(String guid) {
        Session session = HibernateUtils.currentSession();
        AppUser appUser = null;
        try {
            Query query = session.createQuery(AppUserQueryUtils.FIND_BY_GUID);
            query.setParameter("Guid", guid);
            appUser = (AppUser) query.uniqueResult();
        } catch (Exception exception) {
            LOG.warn("APPUSER SERVICE", exception);
        } finally {
            HibernateUtils.closeSession();
        }

        return appUser;
    }
}
