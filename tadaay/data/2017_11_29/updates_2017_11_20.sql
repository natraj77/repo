
ALTER TABLE `app_polyglot_course` ADD `course_fee` INT(6) NOT NULL AFTER `duration_type`;

ALTER TABLE `app_polyglot_course` ADD `attr_realtime_projects` VARCHAR(1)  AFTER `course_fee`;

ALTER TABLE `app_polyglot_course` ADD `attr_fee_in_installments` VARCHAR(1)  AFTER `attr_realtime_projects`;
ALTER TABLE `app_polyglot_course` ADD `attr_lab_assistance` VARCHAR(1)  AFTER `attr_fee_in_installments`;
ALTER TABLE `app_polyglot_course` ADD `attr_placement_assistance` VARCHAR(1)  AFTER `attr_lab_assistance`;


ALTER TABLE `app_polyglot_batch` CHANGE `ply_batch_no` `ply_batch_no` VARCHAR(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL;
CREATE TABLE `app_polyglot_user_profile` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `partner_id` int(11) NOT NULL,
 `institute_name` varchar(100) NOT NULL,
 `established_date` varchar(20) NOT NULL,
 `founder_name` varchar(50) DEFAULT NULL,
 `phone_number` varchar(10) NOT NULL,
 `email` varchar(50) NOT NULL,
 `about` varchar(250) NOT NULL,
 `is_photo_uploaded` varchar(1) NOT NULL,
 `photo_uri` varchar(50) DEFAULT NULL,
 `website_url` varchar(50) DEFAULT NULL,
 `facebook_page` varchar(50) DEFAULT NULL,
 `twitter` varchar(50) DEFAULT NULL,
 `google_plus` varchar(50) DEFAULT NULL,
 `linkedin` varchar(50) DEFAULT NULL,
 `pintrest` varchar(50) DEFAULT NULL,
 `instagram` varchar(50) DEFAULT NULL,
 `password` varchar(50) NOT NULL,
 `password_changed_date` varchar(20) NOT NULL,
 `last_insrt_upd_ts` datetime NOT NULL,
 `last_insrt_upd_usr_id` int(11) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1