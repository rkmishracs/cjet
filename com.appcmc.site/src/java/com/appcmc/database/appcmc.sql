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
) ENGINE=InnoDB AUTO_INCREMENT=22 /*!40100 DEFAULT CHARSET=latin1*/;



#
# Dumping data for table 'app_user'
#

/*!40000 ALTER TABLE `app_user` DISABLE KEYS*/;
LOCK TABLES `app_user` WRITE;
INSERT INTO `app_user` (`usr_uid`, `usr_guid`, `usr_email`, `usr_enrollment_number`, `usr_password`, `usr_screen_name`, `usr_first_name`, `usr_last_name`, `usr_status_id`, `usr_gender`, `usr_time_zone`, `usr_type`, `usr_created_on`, `usr_created_by`, `usr_modified_on`, `usr_modified_by`, `usr_security_question`, `usr_security_answer`, `usr_active`) VALUES
	('1','1A4C6D9C-0AED-7CCB-C0FA-5F629A5026E3','admin@appcmc.com','999','pwd','Admin','Admin','Admin','1','m','2012-07-10 17:42:15','admin','2012-07-11 12:56:40','1','2012-08-13 16:21:24','1','What Town Were You Born In?','Vijayawada',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 /*!40100 DEFAULT CHARSET=latin1*/;



#
# Dumping data for table 'app_user_contacts'
#

# (No data found.)



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
  `edu_two_specialization` varchar(255) default NULL,
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

# (No data found.)



#
# Table structure for table 'app_user_events'
#

CREATE TABLE `app_user_events` (
  `evnt_uid` bigint(20) unsigned NOT NULL auto_increment,
  `evnt_guid` varchar(255) NOT NULL,
  `evnt_event_name` varchar(255) default NULL,
  `evnt_event_type` varchar(255) default NULL,
  `evnt_event_on` datetime default NULL,
  `evnt_event_time` varchar(255) default NULL,
  `evnt_event_location` varchar(255) default NULL,
  `evnt_additional_info` varchar(255) default NULL,
  `evnt_created_on` datetime NOT NULL,
  `evnt_created_by` bigint(10) unsigned NOT NULL,
  `evnt_modified_on` datetime NOT NULL,
  `evnt_modified_by` bigint(10) unsigned NOT NULL,
  `evnt_active` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (`evnt_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 /*!40100 DEFAULT CHARSET=latin1*/;



#
# Dumping data for table 'app_user_events'
#

/*!40000 ALTER TABLE `app_user_events` DISABLE KEYS*/;
LOCK TABLES `app_user_events` WRITE;
INSERT INTO `app_user_events` (`evnt_uid`, `evnt_guid`, `evnt_event_name`, `evnt_event_type`, `evnt_event_on`, `evnt_event_time`, `evnt_event_location`, `evnt_additional_info`, `evnt_created_on`, `evnt_created_by`, `evnt_modified_on`, `evnt_modified_by`, `evnt_active`) VALUES
	('1','dbd553aa-3ff9-4924-a402-96cb6bd525f3','Satyam Fest','WalkIn','2012-09-04 14:03:19','9AM','vizag','nothing','2012-09-04 14:03:19','1','2012-09-04 14:03:19','1',1),
	('2','fc3b7c86-9e75-4e4a-a7dd-c2efc62f9aa6','wipro Job Fest','JobFare','2012-09-04 14:04:32','10AM','Hyd','nothing','2012-09-04 14:04:32','1','2012-09-04 14:04:32','1',1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `app_user_events` ENABLE KEYS*/;


#
# Table structure for table 'app_user_placed'
#

CREATE TABLE `app_user_placed` (
  `placed_uid` bigint(20) unsigned NOT NULL auto_increment,
  `placed_guid` varchar(64) NOT NULL,
  `placed_enrollment_number` varchar(255) NOT NULL,
  `placed_first_name` varchar(255) NOT NULL,
  `placed_last_name` varchar(255) NOT NULL,
  `placed_gender` varchar(32) NOT NULL default 'M',
  `placed_placed_company` varchar(255) NOT NULL,
  `placed_year_of_placement` varchar(255) NOT NULL,
  `placed_designation` varchar(255) NOT NULL,
  `placed_package_details` varchar(255) NOT NULL,
  `placed_other_details` varchar(255) NOT NULL,
  `placed_created_on` datetime NOT NULL,
  `placed_created_by` bigint(20) unsigned NOT NULL,
  `placed_modified_on` datetime NOT NULL,
  `placed_modified_by` bigint(20) unsigned NOT NULL,
  `placed_active` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY  (`placed_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 /*!40100 DEFAULT CHARSET=latin1*/;



#
# Dumping data for table 'app_user_placed'
#

/*!40000 ALTER TABLE `app_user_placed` DISABLE KEYS*/;
LOCK TABLES `app_user_placed` WRITE;
INSERT INTO `app_user_placed` (`placed_uid`, `placed_guid`, `placed_enrollment_number`, `placed_first_name`, `placed_last_name`, `placed_gender`, `placed_placed_company`, `placed_year_of_placement`, `placed_designation`, `placed_package_details`, `placed_other_details`, `placed_created_on`, `placed_created_by`, `placed_modified_on`, `placed_modified_by`, `placed_active`) VALUES
	('1','6973af87-0afb-4aaa-9ecb-bcae3cb3cb46','CJET130632012','Hasan','anwar','M','Infosys','2011','Developer','25000','add','2012-09-04 16:03:21','1','2012-09-04 16:03:21','1',1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `app_user_placed` ENABLE KEYS*/;


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
  `profile_resume` longblob,
  `profile_resume_filename` varchar(50) default NULL,
  `profile_resume_type` varchar(50) default NULL,
  `profile_created_on` datetime NOT NULL,
  `profile_created_by` bigint(10) unsigned NOT NULL,
  `profile_modified_on` datetime NOT NULL,
  `profile_modified_by` bigint(10) unsigned NOT NULL,
  `profile_active` tinyint(1) unsigned NOT NULL,
  `Column 15` int(10) default NULL,
  PRIMARY KEY  (`profile_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 /*!40100 DEFAULT CHARSET=latin1*/;



#
# Dumping data for table 'app_user_profile'
#

# (No data found.)



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
) ENGINE=InnoDB AUTO_INCREMENT=10 /*!40100 DEFAULT CHARSET=latin1*/;



#
# Dumping data for table 'app_user_student'
#

# (No data found.)

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS*/;
