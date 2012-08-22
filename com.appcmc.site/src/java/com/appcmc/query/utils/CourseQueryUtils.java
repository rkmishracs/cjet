package com.appcmc.query.utils;

public interface CourseQueryUtils {

	public static final String GETALL = "from Course course";
	public static final String FINDBY_COURSENAME = "from Course course where course.courseName=:CourseName";
	public static final String FINDBYCOURSEGUID = "from Course course where course.guid =:Guid";
}
