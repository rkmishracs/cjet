package com.appcmc.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.appcmc.domain.sub.Student;
import com.appcmc.domain.sub.impl.StudentImpl;
import com.appcmc.query.utils.StudentQueryUtils;
import com.appcmc.service.StudentService;
import com.appcmc.utils.HibernateUtils;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class StudentServiceImpl implements StudentService {

    private static Logger LOG = Logger.getLogger(StudentImpl.class);

    @Override
    public void create(Student student) {
        // TODO Auto-generated method stub
        Session session = HibernateUtils.currentSession();
        Transaction tx = null;
        boolean rollback = true;
        try {
            tx = session.beginTransaction();
            session.saveOrUpdate(student);
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

    @SuppressWarnings("unchecked")
    @Override
    public List<Student> getAll() {
        // TODO Auto-generated method stub
        Session session = HibernateUtils.currentSession();
        List<Student> studentList = null;
        try {
            Query query = session.createQuery(StudentQueryUtils.GETALL);
            studentList = (List<Student>) query.list();

        } catch (Exception exception) {
            LOG.warn("exception", exception);
        } finally {
            HibernateUtils.closeSession();
        }
        return studentList;
    }

    @Override
    public Student findStudentByEnrollmentNumber(String enrollmentNumber) {
        // TODO Auto-generated method stub
        Session session = HibernateUtils.currentSession();
        Student student = null;
        try {
            Query query = session
                    .createQuery(StudentQueryUtils.FIND_STUDENT_BY_ENROLLMENTNUBER);
            query.setParameter("EnrollmentNumber", enrollmentNumber);
            student = (Student) query.uniqueResult();
            if (student == null) {
                return student;
            }
        } catch (Exception exception) {
            LOG.warn("exception", exception);
        } finally {
            HibernateUtils.closeSession();
        }
        return student;
    }

    @Override
    public Student findStudentByGuid(String guid) {
        // TODO Auto-generated method stub
        Session session = HibernateUtils.currentSession();
        Student student = null;
        try {
            Query query = session
                    .createQuery(StudentQueryUtils.FIND_STUDENT_BY_STUDENTGUID);
            student = (Student) query.uniqueResult();
            if (student == null) {
                return student;
            }
        } catch (Exception exception) {
            LOG.warn("exception", exception);
        } finally {
            HibernateUtils.closeSession();
        }
        return student;
    }

    @Override
    public Student findById(Long id) {

        Session session = HibernateUtils.currentSession();
        Student student = null;
        try {
            student = (Student) session.get(Student.class, id);

        } catch (Exception exception) {
            LOG.warn("Exception", exception);
        } finally {
            HibernateUtils.closeSession();
        }
        return student;
    }

    @Override
    public List<Student> getByCurrentWeek() {

        List<Student> studentWeekList = new ArrayList<Student>();
        try {
            Calendar presentCalendar = Calendar.getInstance();
            Calendar createdCalendar = new GregorianCalendar();
            List<Student> studentList = getAll();
            if (studentList != null) {
                for (Student std : studentList) {
                    Date createdDate = std.getCreatedOn();
                    createdCalendar.setTime(createdDate);
                    if (createdCalendar.get(Calendar.YEAR) == presentCalendar.get(Calendar.YEAR) && createdCalendar.get(Calendar.MONTH) == presentCalendar.get(Calendar.MONTH)) {
                        if (createdCalendar.get(Calendar.DAY_OF_WEEK_IN_MONTH) == presentCalendar.get(Calendar.DAY_OF_WEEK_IN_MONTH)) {
                            studentWeekList.add(std);
                        }

                    }

                }
            }
        } catch (Exception exception) {
            LOG.warn("Exception", exception);
        }
        return studentWeekList;
    }

    @Override
    public List<Student> getByCurrentMonth() {
        List<Student> studentMonthList = new ArrayList<Student>();
        try {
            Calendar presentCalendar = Calendar.getInstance();
            Calendar createdCalendar = new GregorianCalendar();
            List<Student> studentList = getAll();
            if (studentList != null) {
                for (Student std : studentList) {
                    Date createdDate = std.getCreatedOn();
                    createdCalendar.setTime(createdDate);
                    if (createdCalendar.get(Calendar.YEAR) == presentCalendar.get(Calendar.YEAR) && createdCalendar.get(Calendar.MONTH) == presentCalendar.get(Calendar.MONTH)) {
                            studentMonthList.add(std);
                    }

                }
            }
        } catch (Exception exception) {
            LOG.warn("Exception", exception);
        }
        return studentMonthList;
    }

    @Override
    public List<Student> getByDay() {
        List<Student> studentDayList = new ArrayList<Student>();
        try {
            Calendar presentCalendar = Calendar.getInstance();
            Calendar createdCalendar = new GregorianCalendar();
            List<Student> studentList = getAll();
            if (studentList != null) {
                for (Student std : studentList) {
                    Date createdDate = std.getCreatedOn();
                    createdCalendar.setTime(createdDate);
                    if (createdCalendar.get(Calendar.YEAR) == presentCalendar.get(Calendar.YEAR) && createdCalendar.get(Calendar.MONTH) == presentCalendar.get(Calendar.MONTH)) {
                        if(createdCalendar.get(Calendar.DAY_OF_MONTH) == presentCalendar.get(Calendar.DAY_OF_MONTH)){
                            studentDayList.add(std);
                        }
                    }
                }
            }
        } catch (Exception exception) {
            LOG.warn("Exception", exception);
        }
        return studentDayList;
    }

    @Override
    public List<Student> findByName(String name) {
        
          
         Session session = HibernateUtils.currentSession();
        List<Student> studentList=null;
        
        try {
            Query query = session
                    .createQuery(StudentQueryUtils.GETALL);
            studentList = query.list();
            
        } catch (Exception exception) {
            LOG.warn("exception", exception);
        } finally {
            HibernateUtils.closeSession();
        }
        List<Student> list = new ArrayList<Student>();
        for(Student std:studentList){
            if(std.getFirstName().startsWith(name)||std.getLastName().startsWith(name)){
                list.add(std);
                LOG.debug(std.getFirstName() + "" + std.getLastName());
            }
        }
            
            
               
        return  list;
    }
}
