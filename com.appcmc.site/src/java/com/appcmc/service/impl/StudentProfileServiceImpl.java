/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.service.impl;

import com.appcmc.domain.sub.StudentProfile;
import com.appcmc.query.utils.StudentProfileQueryUtils;
import com.appcmc.service.StudentProfileService;
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
public class StudentProfileServiceImpl implements StudentProfileService {

    private static Logger LOG = Logger.getLogger(StudentProfile.class);

    @Override
    public void create(StudentProfile studentProfile) {
        // TODO Auto-generated method stub
        Session session = HibernateUtils.currentSession();
        Transaction tx = null;
        boolean rollback = true;
        try {
            tx = session.beginTransaction();
            session.saveOrUpdate(studentProfile);
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
    public List<StudentProfile> getAll() {
        Session session = HibernateUtils.currentSession();
        List<StudentProfile> studentProfileList = null;
        try {
            Query query = session.createQuery(StudentProfileQueryUtils.GETALL);
            studentProfileList = (List<StudentProfile>) query.list();
        } catch (Exception exception) {
            LOG.warn("exception", exception);
        } finally {
            HibernateUtils.closeSession();
        }

        return studentProfileList;
    }

    @Override
    public StudentProfile findStudentProfileByEnrollmentNumber(String enrollmentNumber) {
        Session session = HibernateUtils.currentSession();
        StudentProfile studentProfile = null;
        try {
            Query query = session.createQuery(StudentProfileQueryUtils.FIND_STUDENT_PROFILE_BY_ENROLLMENTNUBER);
            query.setParameter("EnrollmentNumber", enrollmentNumber);
            studentProfile = (StudentProfile) query.uniqueResult();
        } catch (Exception exception) {
            LOG.warn("exception", exception);
        } finally {
            HibernateUtils.closeSession();
        }

        return studentProfile;
    }
}
