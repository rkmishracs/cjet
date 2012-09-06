package com.appcmc.service.impl;

import com.appcmc.domain.sub.EducationalQualifications;
import com.appcmc.domain.sub.StudentProfile;
import com.appcmc.query.utils.EducationalQualificationsQueryUtils;
import com.appcmc.service.EducationalQualificationsService;
import com.appcmc.utils.HibernateUtils;
import java.util.List;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class EducationalQualificationsServiceImpl implements EducationalQualificationsService{

    private static Logger LOG = Logger.getLogger(StudentProfile.class);
    
    /**
     *
     * @param educationalQualifications
     */
    @Override
    public void create(EducationalQualifications educationalQualifications) {
       Session session = HibernateUtils.currentSession();
        Transaction tx = null;
        boolean rollback = true;
        try {
            tx = session.beginTransaction();
            session.saveOrUpdate(educationalQualifications);
            tx.commit();
            rollback = false;

        } catch (Exception exception) {
            LOG.warn("EducationalQualificationsServiceImpl", exception);
        } finally {
            if (rollback && tx != null) {
                tx.rollback();
            }
            HibernateUtils.closeSession();
        }
    }

    /**
     *
     * @return
     */
    @Override
    public List<EducationalQualifications> getAll() {
        Session session = HibernateUtils.currentSession();
        List<EducationalQualifications> educationalQualificationsList = null;
        try{
            Query query = session.createQuery(EducationalQualificationsQueryUtils.GETALL);
            educationalQualificationsList = (List<EducationalQualifications>) query.list();
        }catch(Exception exception){
            LOG.warn("EducationalQulaificationsServiceImpl", exception);
        }finally{
            HibernateUtils.closeSession();
        }
        return educationalQualificationsList;
    }

    /**
     *
     * @param enrollmentNumber
     * @return
     */
    @Override
    public EducationalQualifications findEducationalQualificationsByEnrollmentNumber(String enrollmentNumber) {
        Session session = HibernateUtils.currentSession();
        EducationalQualifications educationalQualifications = null;
        try{
            Query query = session.createQuery(EducationalQualificationsQueryUtils.FIND_EDUCATIONAL_QUALIFICATIONS_BY_ENROLLMENTNUBER);
            query.setParameter("EnrollmentNumber", enrollmentNumber);
            educationalQualifications = (EducationalQualifications) query.uniqueResult();
        }catch(Exception exception){
            LOG.warn("EducationalQulaificationsServiceImpl", exception);
        }finally{
            HibernateUtils.closeSession();
        }
        
        return educationalQualifications;
    }
    
    
    
}
