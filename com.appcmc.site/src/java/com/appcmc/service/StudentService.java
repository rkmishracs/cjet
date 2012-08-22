package com.appcmc.service;

import com.appcmc.domain.sub.AppUser;
import java.util.List;

import com.appcmc.domain.sub.Student;

public interface StudentService {
	void create(Student student);

	List<Student> getAll();

	Student findStudentByEnrollmentNumber(String enrollmentNumber);

	Student findStudentByGuid(String guid);
	
	Student findById(Long id);
        
        List<Student> getByCurrentWeek();
        
        List<Student> getByCurrentMonth();
        
        List<Student> getByDay();
        
        List<Student> findByName(String name);

}
