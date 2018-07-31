CREATE TABLE `app_polyglot_events` (
  `id` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `organizer` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `recurring` varchar(45) DEFAULT NULL,
  `image_path` varchar(45) DEFAULT NULL,
  `venue` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `city` int(5) DEFAULT NULL,
  `country` int(5) DEFAULT NULL,
  `template` int(5) DEFAULT NULL,
  `meta_title` varchar(64) DEFAULT NULL,
  `meta_description` varchar(45) DEFAULT NULL,
  `meta_keywords` varchar(45) DEFAULT NULL,
  `is_active` varchar(45) DEFAULT NULL,
  `event_identifier` varchar(45) DEFAULT NULL,
  `schedule` datetime DEFAULT NULL,
  `created_datetime` datetime DEFAULT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `last_modified_user_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_idx` (`city`),
  KEY `country_idx` (`country`),
  KEY `template_idx` (`template`),
  CONSTRAINT `city` FOREIGN KEY (`city`) REFERENCES `dmn_cities` (`city_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `country` FOREIGN KEY (`country`) REFERENCES `dmn_cntry` (`cntry_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `template` FOREIGN KEY (`template`) REFERENCES `app_polyglot_templates` (`template_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `app_polyglot_templates` (
  `template_id` int(11) NOT NULL,
  `template_type` varchar(20) DEFAULT NULL,
  `template_name` varchar(24) DEFAULT NULL,
  `template_content` varchar(16392) DEFAULT NULL,
  `is_active` varchar(1) DEFAULT NULL,
  `last_insrt_upd_ts` datetime DEFAULT NULL,
  `last_insrt_upd_usr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
