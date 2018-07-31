ALTER TABLE `dmn_course_list` ADD `priorty_no` INT(6)  NULL AFTER `courseDesc`;
CREATE TABLE `app_polyglot_banners` (
  `bannerId` int(11) NOT NULL,
  `position` int(4) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `is_active` varchar(1) DEFAULT NULL,
  `image_path` varchar(145) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bannerId`),
  KEY `city_fk_idx` (`city_id`),
  KEY `partner_fk_idx` (`partner_id`),
  KEY `course_fk_idx` (`course_id`),
  CONSTRAINT `city_fk` FOREIGN KEY (`city_id`) REFERENCES `dmn_cities` (`city_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `course_fk` FOREIGN KEY (`course_id`) REFERENCES `dmn_course_list` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `partner_fk` FOREIGN KEY (`partner_id`) REFERENCES `app_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
;