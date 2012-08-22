package com.appcmc.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.appcmc.domain.sub.Course;
import com.appcmc.domain.sub.impl.CourseImpl;
import com.appcmc.query.utils.CourseQueryUtils;
import com.appcmc.service.CourseService;
import com.appcmc.utils.HibernateUtils;

/**
 * @author GANESH
 * 
 */
public class CourseServiceImpl implements CourseService {
	private static Logger LOG = Logger.getLogger(CourseServiceImpl.class);
	private static List<Course> courseList = new ArrayList<Course>();
	Course course = new CourseImpl();

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.appcmc.service.CourseService#create(com.appcmc.domain.sub.Course) To
	 * Save Or Update Course Details in this App
	 */
	@Override
	public void create(Course course) {
		Session session = HibernateUtils.currentSession();
		Transaction tx = null;
		boolean rollback = true;
		try {
			tx = session.beginTransaction();
			session.saveOrUpdate(course);
			tx.commit();
			rollback = false;
		} catch (Exception exception) {
			LOG.warn("exception",exception);
		} finally {
			if (rollback && tx != null) {
				tx.rollback();
			}
			HibernateUtils.closeSession();
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.appcmc.service.CourseService#getAll() To Get All course Details
	 * in this App
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Course> getAll() {
		// TODO Auto-generated method stub
		Session session = HibernateUtils.currentSession();
		try {
			Query query = session.createQuery(CourseQueryUtils.GETALL);
			courseList = (List<Course>) query.list();
		} catch (Exception exception) {
			// to do log4j
			LOG.warn(exception.toString());
		} finally {
			HibernateUtils.closeSession();
		}
		return courseList;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.appcmc.service.CourseService#findByCourseName(java.lang.String)
	 * To Get Particular course Details By use CourseName in this App
	 */
	@Override
	public Course findByCourseName(String courseName) {
		// TODO Auto-generated method stub
		Session session = HibernateUtils.currentSession();
		try {
			Query query = session
					.createQuery(CourseQueryUtils.FINDBY_COURSENAME);
			query.setString("CourseName", courseName);
			course = (Course) query.uniqueResult();
			if (course == null) {
				return course;
			}
		} catch (Exception exception) {			
			LOG.warn("exception", exception);
		} finally {
			HibernateUtils.closeSession();
		}
		return course;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.appcmc.service.CourseService#findByCourseGuid(java.lang.String)
	 * To Get Particular course Details By use Guid in this App
	 */
	@Override
	public Course findByCourseGuid(String guid) {
		// TODO Auto-generated method stub
		Session session = HibernateUtils.currentSession();
		try {
			Query query = session
					.createQuery(CourseQueryUtils.FINDBYCOURSEGUID);
			query.setString("guid", guid);
			course = (Course) query.uniqueResult();
			if (course == null) {
				return course;
			}
		} catch (Exception exception) {
			LOG.warn("exception",exception);
		} finally {
			HibernateUtils.closeSession();
		}

		return course;
	}
}
