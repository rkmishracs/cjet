-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.0.45-community-nt - MySQL Community Edition (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2012-08-27 10:49:51
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for app
DROP DATABASE IF EXISTS `app`;
CREATE DATABASE IF NOT EXISTS `app` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `app`;


-- Dumping structure for table app.app_user
DROP TABLE IF EXISTS `app_user`;
CREATE TABLE IF NOT EXISTS `app_user` (
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Dumping data for table app.app_user: ~1 rows (approximately)
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
REPLACE INTO `app_user` (`usr_uid`, `usr_guid`, `usr_email`, `usr_enrollment_number`, `usr_password`, `usr_screen_name`, `usr_first_name`, `usr_last_name`, `usr_status_id`, `usr_gender`, `usr_time_zone`, `usr_type`, `usr_created_on`, `usr_created_by`, `usr_modified_on`, `usr_modified_by`, `usr_security_question`, `usr_security_answer`, `usr_active`) VALUES
	(1, '1A4C6D9C-0AED-7CCB-C0FA-5F629A5026E3', 'admin@appcmc.com', '999', 'pwd', 'Admin', 'Admin', 'Admin', 1, 'm', '2012-07-10 17:42:15', 'admin', '2012-07-11 12:56:40', 1, '2012-08-13 16:21:24', 1, 'What Town Were You Born In?', 'Vijayawada', 1);
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;


-- Dumping structure for table app.app_user_contacts
DROP TABLE IF EXISTS `app_user_contacts`;
CREATE TABLE IF NOT EXISTS `app_user_contacts` (
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table app.app_user_contacts: ~0 rows (approximately)
/*!40000 ALTER TABLE `app_user_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_user_contacts` ENABLE KEYS */;


-- Dumping structure for table app.app_user_educational_qualifications
DROP TABLE IF EXISTS `app_user_educational_qualifications`;
CREATE TABLE IF NOT EXISTS `app_user_educational_qualifications` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table app.app_user_educational_qualifications: ~0 rows (approximately)
/*!40000 ALTER TABLE `app_user_educational_qualifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_user_educational_qualifications` ENABLE KEYS */;


-- Dumping structure for table app.app_user_profile
DROP TABLE IF EXISTS `app_user_profile`;
CREATE TABLE IF NOT EXISTS `app_user_profile` (
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
  `profile_created_on` datetime NOT NULL,
  `profile_created_by` bigint(10) unsigned NOT NULL,
  `profile_modified_on` datetime NOT NULL,
  `profile_modified_by` bigint(10) unsigned NOT NULL,
  `profile_active` tinyint(1) unsigned NOT NULL,
  `Column 15` int(10) default NULL,
  PRIMARY KEY  (`profile_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table app.app_user_profile: ~0 rows (approximately)
/*!40000 ALTER TABLE `app_user_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_user_profile` ENABLE KEYS */;


-- Dumping structure for table app.app_user_student
DROP TABLE IF EXISTS `app_user_student`;
CREATE TABLE IF NOT EXISTS `app_user_student` (
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table app.app_user_student: ~0 rows (approximately)
/*!40000 ALTER TABLE `app_user_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_user_student` ENABLE KEYS */;


-- Dumping database structure for testdump
DROP DATABASE IF EXISTS `testdump`;
CREATE DATABASE IF NOT EXISTS `testdump` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `testdump`;


-- Dumping structure for table testdump.student
DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `sno` varchar(50) default NULL,
  `pic` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table testdump.student: ~0 rows (approximately)
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
