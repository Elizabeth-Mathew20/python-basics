-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2023 at 10:54 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `erto`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=53 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user', 7, 'add_user'),
(26, 'Can change user', 7, 'change_user'),
(27, 'Can delete user', 7, 'delete_user'),
(28, 'Can view user', 7, 'view_user'),
(29, 'Can add police', 8, 'add_police'),
(30, 'Can change police', 8, 'change_police'),
(31, 'Can delete police', 8, 'delete_police'),
(32, 'Can view police', 8, 'view_police'),
(33, 'Can add checkpost', 9, 'add_checkpost'),
(34, 'Can change checkpost', 9, 'change_checkpost'),
(35, 'Can delete checkpost', 9, 'delete_checkpost'),
(36, 'Can view checkpost', 9, 'view_checkpost'),
(37, 'Can add vehicles', 10, 'add_vehicles'),
(38, 'Can change vehicles', 10, 'change_vehicles'),
(39, 'Can delete vehicles', 10, 'delete_vehicles'),
(40, 'Can view vehicles', 10, 'view_vehicles'),
(41, 'Can add fines', 11, 'add_fines'),
(42, 'Can change fines', 11, 'change_fines'),
(43, 'Can delete fines', 11, 'delete_fines'),
(44, 'Can view fines', 11, 'view_fines'),
(45, 'Can add fines_payment', 12, 'add_fines_payment'),
(46, 'Can change fines_payment', 12, 'change_fines_payment'),
(47, 'Can delete fines_payment', 12, 'delete_fines_payment'),
(48, 'Can view fines_payment', 12, 'view_fines_payment'),
(49, 'Can add complaints', 13, 'add_complaints'),
(50, 'Can change complaints', 13, 'change_complaints'),
(51, 'Can delete complaints', 13, 'delete_complaints'),
(52, 'Can view complaints', 13, 'view_complaints');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(9, 'e_rto', 'checkpost'),
(13, 'e_rto', 'complaints'),
(11, 'e_rto', 'fines'),
(12, 'e_rto', 'fines_payment'),
(8, 'e_rto', 'police'),
(7, 'e_rto', 'user'),
(10, 'e_rto', 'vehicles'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-06-02 07:00:38.775314'),
(2, 'auth', '0001_initial', '2023-06-02 07:00:40.031347'),
(3, 'admin', '0001_initial', '2023-06-02 07:00:40.306307'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-06-02 07:00:40.314685'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-06-02 07:00:40.322696'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-06-02 07:00:40.388403'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-06-02 07:00:40.412924'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-06-02 07:00:40.445885'),
(9, 'auth', '0004_alter_user_username_opts', '2023-06-02 07:00:40.462083'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-06-02 07:00:40.494776'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-06-02 07:00:40.494776'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-06-02 07:00:40.502854'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-06-02 07:00:40.535070'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-06-02 07:00:40.567663'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-06-02 07:00:40.600410'),
(16, 'auth', '0011_update_proxy_permissions', '2023-06-02 07:00:40.616420'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-06-02 07:00:40.648748'),
(18, 'e_rto', '0001_initial', '2023-06-02 07:00:40.712701'),
(19, 'sessions', '0001_initial', '2023-06-02 07:00:40.903613'),
(20, 'e_rto', '0002_police', '2023-06-02 09:20:46.197883'),
(21, 'e_rto', '0003_checkpost', '2023-06-02 09:26:56.660446'),
(22, 'e_rto', '0004_vehicles', '2023-06-04 13:15:58.730150'),
(23, 'e_rto', '0005_fines', '2023-06-04 17:12:19.155734'),
(24, 'e_rto', '0006_fines_payment', '2023-06-05 11:38:14.059990'),
(25, 'e_rto', '0007_complaints', '2023-06-05 12:16:31.285459');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2k2aq7fz762of53s0kdrkumjdofrmf2k', 'e30:1q7ruN:EJhns37q1nmw6tW2VHRkZ4EGYqM5wKOaFu5A19nrWDE', '2023-06-24 06:17:07.050814'),
('a99bccbbcybma3fp6mxh6dgin7delhmz', 'eyJsb2dpbnRkZXRhaWwiOiJydG9AZ21haWwuY29tIiwicnRvIjoicnRvIn0:1q5nmq:vDxucaay3z9OB1roLAH5giVCRjoOzBjuwAW3TAIOBsk', '2023-06-18 13:28:48.672420'),
('aab5rqicrr2uoj3c6c53jem7dtn1nkn1', 'eyJwaWQiOjEsInBuYW1lIjoiUGFsYXJpdmF0dG9tIFN0YXRpb24iLCJwZW1haWwiOiJwQGdtYWlsLmNvbSJ9:1q69A8:8am8n86tXBgCl4iz1eG5tRNY1nOeFY5qQbaD5TGOv3Q', '2023-06-19 12:18:16.481066'),
('jdew18sb3utsfqwudt8dlo6nx4arobav', 'eyJsb2dpbnRkZXRhaWwiOiJydG9AZ21haWwuY29tIiwicnRvIjoicnRvIn0:1q6Qly:QZzlZZEQ-Ip1E0LvX2Zc9VY0-hsOaPRDJ3SYQ-5ulxY', '2023-06-20 07:06:30.864986'),
('qxu9bs3yh03szo71byzyo6er4uj07mnz', 'e30:1q9iie:FHMQeTMjH9Tt7UOSJdyGnLqJN8iqhuboYJQXvsT9pOE', '2023-06-29 08:52:40.398530'),
('uoj19gjjvvp24hzr12zu2wzzbnwspv5r', 'e30:1q5rYI:4Nm0zjczZuCrTzvjw4dYPDkFR-6y05oNuComjIY_OgQ', '2023-06-18 17:30:02.199439'),
('zu0grcpp47gxr188f98fgw91wbpa3dn9', 'eyJ1aWQiOjEsInVuYW1lIjoiamVpcm4iLCJ1ZW1haWwiOiJqQGdtYWlsLmNvbSJ9:1q52sH:RZaT0c4qUi2IacMbhX3sHuXCiwhKOBQPDHfJ0T58sO4', '2023-06-16 11:23:17.570523');

-- --------------------------------------------------------

--
-- Table structure for table `e_rto_checkpost`
--

CREATE TABLE IF NOT EXISTS `e_rto_checkpost` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `e_rto_checkpost`
--

INSERT INTO `e_rto_checkpost` (`id`, `name`, `email`, `phone`, `address`, `password`) VALUES
(1, 'Valayar Check Post', 'valayar@gmail.com', '0463-3728828', 'Valayar', '123');

-- --------------------------------------------------------

--
-- Table structure for table `e_rto_complaints`
--

CREATE TABLE IF NOT EXISTS `e_rto_complaints` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `reg_no` varchar(100) NOT NULL,
  `uid` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `checkpost_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `e_rto_complaints`
--

INSERT INTO `e_rto_complaints` (`id`, `reg_no`, `uid`, `date`, `reason`, `checkpost_id`) VALUES
(1, 'KL 07 AC 1378', 'jeirn', '2023-06-05', 'Over Speed', 'Valayar Check Post');

-- --------------------------------------------------------

--
-- Table structure for table `e_rto_fines`
--

CREATE TABLE IF NOT EXISTS `e_rto_fines` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `reg_no` varchar(100) NOT NULL,
  `uid` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `checkpost_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `e_rto_fines`
--

INSERT INTO `e_rto_fines` (`id`, `reg_no`, `uid`, `date`, `reason`, `amount`, `checkpost_id`) VALUES
(1, 'KL 07 AC 1378', 'jeirn', '2023-06-04', 'Insurance Expired', '2000', 'Valayar Check Post'),
(2, 'KL 02 AC 3456', 'Babu', '2023-06-04', 'Pollution Expired', '2000', 'Valayar Check Post');

-- --------------------------------------------------------

--
-- Table structure for table `e_rto_fines_payment`
--

CREATE TABLE IF NOT EXISTS `e_rto_fines_payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `reg_no` varchar(100) NOT NULL,
  `uid` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `card_type` varchar(100) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `card_name` varchar(100) NOT NULL,
  `card_no` varchar(100) NOT NULL,
  `cvv` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `e_rto_fines_payment`
--

INSERT INTO `e_rto_fines_payment` (`id`, `reg_no`, `uid`, `date`, `card_type`, `amount`, `card_name`, `card_no`, `cvv`) VALUES
(1, 'KL 07 AC 1378', 'jeirn', '2023-06-05', 'Debit', '2000', 'Jerin', '87654323657880', '767');

-- --------------------------------------------------------

--
-- Table structure for table `e_rto_police`
--

CREATE TABLE IF NOT EXISTS `e_rto_police` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `e_rto_police`
--

INSERT INTO `e_rto_police` (`id`, `name`, `email`, `phone`, `address`, `password`) VALUES
(1, 'Palarivattom Station', 'p@gmail.com', '0463-3728828', 'Palarivattom,Ernakulam', '123');

-- --------------------------------------------------------

--
-- Table structure for table `e_rto_user`
--

CREATE TABLE IF NOT EXISTS `e_rto_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `dob` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `e_rto_user`
--

INSERT INTO `e_rto_user` (`id`, `name`, `email`, `phone`, `address`, `dob`, `password`) VALUES
(1, 'jeirn', 'j@gmail.com', '9865986589', 'Konni', '1998-01-09', '123'),
(2, 'Babu', 'b@gmail.com', '9645277457', 'Kollam', '2023-06-11', '123');

-- --------------------------------------------------------

--
-- Table structure for table `e_rto_vehicles`
--

CREATE TABLE IF NOT EXISTS `e_rto_vehicles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(100) NOT NULL,
  `reg_no` varchar(100) NOT NULL,
  `ownwer_name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `cmpny_name` varchar(100) NOT NULL,
  `vehicle_type` varchar(100) NOT NULL,
  `fuel_type` varchar(100) NOT NULL,
  `engine_cc` varchar(100) NOT NULL,
  `ins_exdate` varchar(100) NOT NULL,
  `pollution_edate` varchar(100) NOT NULL,
  `reg_edate` varchar(100) NOT NULL,
  `ins` varchar(100) NOT NULL,
  `pollution` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `e_rto_vehicles`
--

INSERT INTO `e_rto_vehicles` (`id`, `uid`, `reg_no`, `ownwer_name`, `address`, `cmpny_name`, `vehicle_type`, `fuel_type`, `engine_cc`, `ins_exdate`, `pollution_edate`, `reg_edate`, `ins`, `pollution`) VALUES
(1, 'jeirn', 'KL 07 AC 1378', 'Jobin', 'Ernakulam', 'Suzuki', 'Four Wheeler', 'Petrol', '1200', '2023-06-14', '2023-06-28', '2025-10-15', 'map.png', 'RoyalPost.png'),
(2, 'Babu', 'KL 02 AC 3456', 'Babu', 'Kollam', 'Tata', 'Four Wheeler', 'Diesel', '1500', '2023-06-22', '2023-06-10', '2023-06-15', 'map_5IacRE8.png', 'map_3oT0AG7.png');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
