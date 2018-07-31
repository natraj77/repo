ALTER TABLE `app_users` 
DROP COLUMN `qualification`,
DROP COLUMN `branch`,
DROP COLUMN `passoutYr`,
DROP COLUMN `percentage`,
DROP COLUMN `compName`,
DROP COLUMN `designation`,
DROP COLUMN `yrsofexp`,
DROP COLUMN `skills`,
DROP COLUMN `contact_person`,
DROP COLUMN `contact_email`,
DROP COLUMN `contact_landline`,
DROP COLUMN `contact_mobile`;

ALTER TABLE `app_users_experience_details` 
DROP COLUMN `key_skill`,
DROP COLUMN `years`;

ALTER TABLE `app_users_experience_details` CHANGE  COLUMN `partner_id`  `appuserId` INT(11) NOT NULL;

CREATE TABLE `app_users_skillset_details` (
  `id` int(11) NOT NULL,
  `appuserId` int(11) NOT NULL,
  `key_skill` varchar(45) DEFAULT NULL,
  `years` int(4) DEFAULT NULL,
  `last_insrt_upd_ts` datetime DEFAULT NULL,
  `last_insrt_upd_usr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appuserDetails_idx` (`appuserId`),
  CONSTRAINT `appuserDetails` FOREIGN KEY (`appuserId`) REFERENCES `app_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;