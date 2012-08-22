# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                 127.0.0.1
# Database:             app
# Server version:       5.0.45-community-nt
# Server OS:            Win32
# Target-Compatibility: MySQL 5.0
# max_allowed_packet:   1048576
# HeidiSQL version:     3.1 RC1 Revision: 1064
# --------------------------------------------------------

/*!40100 SET CHARACTER SET latin1*/;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0*/;


#
# Database structure for database 'app'
#

DROP DATABASE IF EXISTS `app`;
CREATE DATABASE `app` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `app`;


#
# Table structure for table 'app_user'
#

CREATE TABLE `app_user` (
  `usr_uid` bigint(10) unsigned NOT NULL auto_increment,
  `usr_guid` varchar(64) NOT NULL,
  `usr_email` varchar(255) NOT NULL,
  `usr_enrollment_number` varchar(255) NOT NULL,
  `usr_password` varchar(255) NOT NULL,
  `usr_screen_name` varchar(255) NOT NULL,
  `usr_first_name` varchar(255) NOT NULL,
  `usr_last_name` varchar(255) NOT NULL,
  `usr_status_id` bigint(10) unsigned NOT NULL,
  `usr_gender` varchar(32) NOT NULL default 'M',
  `usr_time_zone` varchar(255) NOT NULL,
  `usr_type` varchar(64) NOT NULL,
  `usr_created_on` datetime NOT NULL,
  `usr_created_by` bigint(10) unsigned NOT NULL,
  `usr_modified_on` datetime NOT NULL,
  `usr_modified_by` bigint(10) unsigned NOT NULL,
  `usr_security_question` varchar(255) default NULL,
  `usr_security_answer` varchar(255) default NULL,
  `usr_active` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`usr_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 /*!40100 DEFAULT CHARSET=latin1*/;



#
# Dumping data for table 'app_user'
#

/*!40000 ALTER TABLE `app_user` DISABLE KEYS*/;
LOCK TABLES `app_user` WRITE;
INSERT INTO `app_user` (`usr_uid`, `usr_guid`, `usr_email`, `usr_enrollment_number`, `usr_password`, `usr_screen_name`, `usr_first_name`, `usr_last_name`, `usr_status_id`, `usr_gender`, `usr_time_zone`, `usr_type`, `usr_created_on`, `usr_created_by`, `usr_modified_on`, `usr_modified_by`, `usr_security_question`, `usr_security_answer`, `usr_active`) VALUES
	('1','1A4C6D9C-0AED-7CCB-C0FA-5F629A5026E3','admin@appcmc.com','999','pwd','Admin','Admin','Admin','1','m','2012-07-10 17:42:15','admin','2012-07-11 12:56:40','1','2012-08-13 16:21:24','1','What Town Were You Born In?','Vijayawada',1),
	('11','871bcfe5-246b-4bc9-9309-7a8ccde67132','sudarsan.a@live.com','CJET235442012','aaa','Ambatipudi','Ambatipudi','Chakravarthy','1','Male','timeZone','student','2012-08-04 10:57:31','1','2012-08-19 11:19:59','1','What Town Were You Born In?','Vijayawada',1),
	('18','9a5441bf-f62c-45a7-a71e-5eb5ddeb805d','bhaskar.gedala@gmail.com','CJET212232012','default','dfgdfgdf','dfgdfgdf','dfgdfgfd','1','male','timeZone','student','2012-08-19 10:39:09','1','2012-08-19 10:39:09','1',NULL,NULL,1),
	('19','4b044191-9ceb-48d1-8a80-5517b40ddec4','bhaskar.gedala@gmail.com','CJET129262012','default','ramya','ramya','k','1','female','timeZone','student','2012-08-19 10:51:55','1','2012-08-19 10:51:55','1',NULL,NULL,1),
	('20','4262226c-9ae1-4e5e-ad0d-642342be39d3','bhaskar.gedala@gmail.com','CJET198902012','default','bhaskar','bhaskar','gedalal','1','male','timeZone','student','2012-08-19 11:22:02','1','2012-08-19 11:22:02','1',NULL,NULL,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `app_user` ENABLE KEYS*/;


#
# Table structure for table 'app_user_contacts'
#

CREATE TABLE `app_user_contacts` (
  `contact_uid` bigint(10) unsigned NOT NULL auto_increment,
  `contact_guid` varchar(64) NOT NULL,
  `contact_city` varchar(255) NOT NULL,
  `contact_enrollmentNumber` varchar(255) NOT NULL,
  `contact_state` varchar(255) NOT NULL,
  `contact_country` varchar(35) NOT NULL,
  `contact_email` varchar(35) NOT NULL,
  `contact_alternative_email` varchar(35) NOT NULL,
  `contact_mobile` varchar(255) NOT NULL,
  `contact_landPhone` varchar(255) NOT NULL,
  `contact_address` varchar(255) NOT NULL,
  `contact_pin` varchar(255) NOT NULL,
  `contact_created_on` datetime NOT NULL,
  `contact_created_by` bigint(10) unsigned NOT NULL,
  `contact_modified_on` datetime NOT NULL,
  `contact_modified_by` bigint(10) unsigned NOT NULL,
  `contact_active` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`contact_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 /*!40100 DEFAULT CHARSET=latin1*/;



#
# Dumping data for table 'app_user_contacts'
#

/*!40000 ALTER TABLE `app_user_contacts` DISABLE KEYS*/;
LOCK TABLES `app_user_contacts` WRITE;
INSERT INTO `app_user_contacts` (`contact_uid`, `contact_guid`, `contact_city`, `contact_enrollmentNumber`, `contact_state`, `contact_country`, `contact_email`, `contact_alternative_email`, `contact_mobile`, `contact_landPhone`, `contact_address`, `contact_pin`, `contact_created_on`, `contact_created_by`, `contact_modified_on`, `contact_modified_by`, `contact_active`) VALUES
	('4','c2903e81-8446-4911-a317-2835a7cb40f7','VSP','CJET235442012','AP','India','sudarsan.a@live.com','zarvis.a@gmail.com','9676534400','08662805991','Some Address','530016','2012-08-04 10:57:29','1','2012-08-04 10:57:29','1',1),
	('5','2efb40cb-7f33-4d11-9477-6a608774b479','Vijayawada','CJET101122012','Ap','India','raghu@gmail.com','raghu@live.com','9676534400','02735795','Some Street','530001','2012-08-06 16:54:34','1','2012-08-06 16:54:34','1',1),
	('6','bae5bd89-48df-45e5-893a-e6784efec4f9','vizag','CJET256082012','ap','india','bhaskar.gedala@gmail.com','basu@cmc.com','9956663294','0891273456','dsfdfdd','530016','2012-08-19 10:10:14','1','2012-08-19 10:10:14','1',1),
	('7','ea9937e7-e7bb-4c36-a59e-7948c7d69750','vizag','CJET272872012','ap','india','bhaskar.gedala@gmail.com','uday@gmail.com','9966644455','2345678909','sdsdfsdfsd','530001','2012-08-19 10:18:37','1','2012-08-19 10:18:37','1',1),
	('8','bf6cbb63-5c78-4d13-ab3a-50ffd75228c6','vizag','CJET104602012','ap','india','bhaskar.gedala@gmail.com','ravi@gmail.com','9977766655','98756432178','dsgfdfgdf','530014','2012-08-19 10:31:24','1','2012-08-19 10:31:24','1',1),
	('9','92687810-bfb1-481a-a427-6250aea5af32','ertert','CJET212232012','ertert','erterter','bhaskar.gedala@gmail.com','dfgdf@gmail.com','1234567890','1234567899','sdfdfgdfgfd','530016','2012-08-19 10:39:09','1','2012-08-19 10:39:09','1',1),
	('10','0508764c-ea99-4f87-957a-ccd36ce47f99','vizag','CJET129262012','ap','india','bhaskar.gedala@gmail.com','ramya@gmail.com','7676766690','23434534564','dfsdfsd','530016','2012-08-19 10:51:55','1','2012-08-19 10:51:55','1',1),
	('11','7c9cc136-626b-4cd2-8699-39cbe4628eac','fklajskjq','CJET198902012','klkljak','jkajksakl','bhaskar.gedala@gmail.com','kiran@gmail.com','9898989898','90898878','klkfadjkfjashd','530001','2012-08-19 11:22:02','1','2012-08-19 11:22:02','1',1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `app_user_contacts` ENABLE KEYS*/;


#
# Table structure for table 'app_user_educational_qualifications'
#

CREATE TABLE `app_user_educational_qualifications` (
  `edu_uid` bigint(10) unsigned NOT NULL auto_increment,
  `edu_guid` varchar(64) NOT NULL,
  `edu_enrollment_number` varchar(255) NOT NULL,
  `edu_one_qualification` varchar(255) default NULL,
  `edu_one_year_of_pass` varchar(255) default NULL,
  `edu_one_university` varchar(255) default NULL,
  `edu_one_grade` varchar(255) default NULL,
  `edu_two_qualification` varchar(255) default NULL,
  `edu_two_year_of_pass` varchar(255) default NULL,
  `edu_two_university` varchar(255) default NULL,
  `edu_two_grade` varchar(255) default NULL,
  `edu_three_qualification` varchar(255) default NULL,
  `edu_three_specialization` varchar(255) default NULL,
  `edu_three_year_of_pass` varchar(255) default NULL,
  `edu_three_university` varchar(255) default NULL,
  `edu_three_grade` varchar(255) default NULL,
  `edu_four_qualification` varchar(255) default NULL,
  `edu_four_specialization` varchar(255) default NULL,
  `edu_four_year_of_pass` varchar(255) default NULL,
  `edu_four_university` varchar(255) default NULL,
  `edu_four_grade` varchar(255) default NULL,
  `edu_additional_qualification` varchar(255) default NULL,
  `edu_created_on` datetime NOT NULL,
  `edu_created_by` bigint(10) unsigned NOT NULL,
  `edu_modified_on` datetime NOT NULL,
  `edu_modified_by` bigint(10) unsigned NOT NULL,
  `edu_active` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (`edu_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 /*!40100 DEFAULT CHARSET=latin1*/;



#
# Dumping data for table 'app_user_educational_qualifications'
#

/*!40000 ALTER TABLE `app_user_educational_qualifications` DISABLE KEYS*/;
LOCK TABLES `app_user_educational_qualifications` WRITE;
INSERT INTO `app_user_educational_qualifications` (`edu_uid`, `edu_guid`, `edu_enrollment_number`, `edu_one_qualification`, `edu_one_year_of_pass`, `edu_one_university`, `edu_one_grade`, `edu_two_qualification`, `edu_two_year_of_pass`, `edu_two_university`, `edu_two_grade`, `edu_three_qualification`, `edu_three_specialization`, `edu_three_year_of_pass`, `edu_three_university`, `edu_three_grade`, `edu_four_qualification`, `edu_four_specialization`, `edu_four_year_of_pass`, `edu_four_university`, `edu_four_grade`, `edu_additional_qualification`, `edu_created_on`, `edu_created_by`, `edu_modified_on`, `edu_modified_by`, `edu_active`) VALUES
	('1','64027922-b3a9-42a9-bbed-0439633e0f9c','CJET235442012','SSC','2003','SSC','A','Inter','2005','Inter','B','B.sc','I.T','2008','AU','B','MCA','I.T','I.T','AU','B','No','2012-08-21 11:34:55','1','2012-08-21 11:34:55','1',1),
	('2','f39e2558-2ac5-4f20-b983-1a7282914a59','CJET212232012','SSC','2003','SSC','A','Inter','2005','Inter','B','B.sc','C.S.E','2008','JNTU','B','MCA','C.S.E','2011','JNTU','B','No','2012-08-21 11:55:54','1','2012-08-21 11:55:54','1',1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `app_user_educational_qualifications` ENABLE KEYS*/;


#
# Table structure for table 'app_user_profile'
#

CREATE TABLE `app_user_profile` (
  `profile_uid` bigint(10) unsigned NOT NULL auto_increment,
  `profile_guid` varchar(64) NOT NULL,
  `profile_enrollment_number` varchar(255) NOT NULL,
  `profile_title` varchar(255) default NULL,
  `profile_total_experience` varchar(255) default NULL,
  `profile_key_skills` varchar(255) default NULL,
  `profile_current_employer` varchar(255) default NULL,
  `profile_role` varchar(255) default NULL,
  `profile_previous_employer` varchar(255) default NULL,
  `profile_created_on` datetime NOT NULL,
  `profile_created_by` bigint(10) unsigned NOT NULL,
  `profile_modified_on` datetime NOT NULL,
  `profile_modified_by` bigint(10) unsigned NOT NULL,
  `profile_active` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY  (`profile_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 /*!40100 DEFAULT CHARSET=latin1*/;



#
# Dumping data for table 'app_user_profile'
#

/*!40000 ALTER TABLE `app_user_profile` DISABLE KEYS*/;
LOCK TABLES `app_user_profile` WRITE;
INSERT INTO `app_user_profile` (`profile_uid`, `profile_guid`, `profile_enrollment_number`, `profile_title`, `profile_total_experience`, `profile_key_skills`, `profile_current_employer`, `profile_role`, `profile_previous_employer`, `profile_created_on`, `profile_created_by`, `profile_modified_on`, `profile_modified_by`, `profile_active`) VALUES
	('1','fb870eb0-4507-46a8-be79-01d9928fde92','CJET198902012','Developer','3','JAVA ORACLE','CMC LTD','Developer','Wipro','2012-08-19 17:14:17','1','2012-08-19 17:14:17','1',1),
	('2','041d85c3-67dd-4506-97f9-a2fda50ff2ac','CJET198902012','Developer','3','JAVA ORACLE','CMC LTD','Developer','Wipro','2012-08-19 17:19:58','1','2012-08-19 17:19:58','1',1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `app_user_profile` ENABLE KEYS*/;


#
# Table structure for table 'app_user_student'
#

CREATE TABLE `app_user_student` (
  `student_uid` bigint(10) unsigned NOT NULL auto_increment,
  `student_guid` varchar(64) NOT NULL,
  `student_enrollment_number` varchar(255) NOT NULL,
  `student_email` varchar(255) NOT NULL,
  `student_gender` varchar(255) NOT NULL,
  `student_father_name` varchar(255) NOT NULL,
  `student_mother_name` varchar(255) NOT NULL,
  `student_date_of_birth` datetime NOT NULL,
  `student_category` varchar(255) NOT NULL,
  `student_first_name` varchar(32) NOT NULL,
  `student_last_name` varchar(255) NOT NULL,
  `student_occupation` varchar(255) NOT NULL,
  `student_income` double NOT NULL,
  `student_nationality` varchar(255) NOT NULL,
  `student_marital_status` varchar(64) NOT NULL,
  `student_profile_pic` mediumblob,
  `student_created_on` datetime NOT NULL,
  `student_created_by` bigint(10) unsigned NOT NULL,
  `student_modified_on` datetime NOT NULL,
  `student_modified_by` bigint(10) unsigned NOT NULL,
  `student_active` tinyint(1) unsigned NOT NULL default '1',
  `student_contacts_student` bigint(10) unsigned default NULL,
  PRIMARY KEY  (`student_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 /*!40100 DEFAULT CHARSET=latin1*/;



#
# Dumping data for table 'app_user_student'
#

/*!40000 ALTER TABLE `app_user_student` DISABLE KEYS*/;
LOCK TABLES `app_user_student` WRITE;
INSERT INTO `app_user_student` (`student_uid`, `student_guid`, `student_enrollment_number`, `student_email`, `student_gender`, `student_father_name`, `student_mother_name`, `student_date_of_birth`, `student_category`, `student_first_name`, `student_last_name`, `student_occupation`, `student_income`, `student_nationality`, `student_marital_status`, `student_profile_pic`, `student_created_on`, `student_created_by`, `student_modified_on`, `student_modified_by`, `student_active`, `student_contacts_student`) VALUES
	('1','ccd8b9e9-9067-4e63-bc2d-46533688ba8f','CJET235442012','sudarsan.a@live.com','Male','Satyanarayana Sarma','Bharathi','1984-08-14 00:00:00','Genral','Ambatipudi','Chakravarthy','Employee','1000','Indian','Married',NULL,'2012-08-04 10:57:29','1','2012-08-04 10:57:29','1',1,'4'),
	('7','843365f6-92aa-46f8-80b3-87cec1064d46','CJET129262012','bhaskar.gedala@gmail.com','female','raviraj','revathi','2012-08-09 00:00:00','Genaral','ramya','k','sads','233443','indian','unMarried',NULL,'2012-08-19 10:51:55','1','2012-08-19 10:51:55','1',1,'10'),
	('8','ea1b4272-9ac3-4a6a-acd2-787789cda13f','CJET198902012','bhaskar.gedala@gmail.com','male','kljkafjfajk','jkafjklj','2012-08-19 00:00:00','BC','bhaskar','gedalal','jkjaklj','897776','indan','married',NULL,'2012-08-19 11:22:02','1','2012-08-19 11:22:02','1',1,'11');
UNLOCK TABLES;
/*!40000 ALTER TABLE `app_user_student` ENABLE KEYS*/;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS*/;
