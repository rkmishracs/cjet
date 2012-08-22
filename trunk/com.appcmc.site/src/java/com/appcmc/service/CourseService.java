package com.appcmc.service;

import java.util.List;

import com.appcmc.domain.sub.Course;

public interface CourseService {

	void create(Course course);

	List<Course> getAll();

	Course findByCourseName(String courseName);

	Course findByCourseGuid(String guid);

}
