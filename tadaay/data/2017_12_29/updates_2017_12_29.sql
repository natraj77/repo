drop table dmn_params;
COMMIT;
CREATE TABLE `dmn_params` (
  `id` int(45) NOT NULL,
  `section` varchar(45) DEFAULT NULL,
  `keyname` varchar(45) DEFAULT NULL,
  `keyvalue` varchar(45) DEFAULT NULL,
  `dsbld_in` varchar(1) DEFAULT NULL,
  `last_insrt_upd_usr_id` int(11) DEFAULT NULL,
  `last_insrt_upd_ts` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `app_users` ADD COLUMN `about_us` VARCHAR(1024) NULL AFTER `status`;
ALTER TABLE `app_polyglot_course` ADD COLUMN `dmn_course_id` INT(11) NULL AFTER `partner_id`;