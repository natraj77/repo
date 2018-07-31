INSERT INTO `dmn_params`
(`id`,
`section`,
`keyname`,
`keyvalue`,
`dsbld_in`,
`last_insrt_upd_usr_id`,
`last_insrt_upd_ts`)
VALUES ('1', 'TRAINER', 'T', 'Free Launcer', 'N', '1', NULL);
INSERT INTO `dmn_params`
(`id`,
`section`,
`keyname`,
`keyvalue`,
`dsbld_in`,
`last_insrt_upd_usr_id`,
`last_insrt_upd_ts`)
VALUES ('2', 'TRAINER', 'P', 'Training Institute', 'N', '1', NULL);

CREATE TABLE `app_polyglot_trainer_subscription` (
  `id` int(11) NOT NULL,
  `partner_id` varchar(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `course_id` varchar(11) DEFAULT NULL,
  `subscribed` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

COMMIT;

CREATE TABLE `app_polyglot_branch_dtls` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `partner_id` INT(11) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `address_line_1` VARCHAR(50) NOT NULL,
  `address_line_2` VARCHAR(50) NULL,
  `location` VARCHAR(50) NULL,
  `city` VARCHAR(50) NOT NULL,
  `zipcode` VARCHAR(6) NOT NULL,
  `contact_name` VARCHAR(50) NOT NULL,
  `contact_mobile` VARCHAR(20) NOT NULL,
  `contact_email` VARCHAR(50) NOT NULL,
  `last_insrt_upd_ts` DATETIME NOT NULL,
  `last_insrt_upd_usr_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`));
ALTER TABLE `app_polyglot_course` 
DROP COLUMN `name`;
ALTER TABLE `app_polyglot_faculty` 
ADD COLUMN `faculty_id` INT(11) NOT NULL AFTER `partner_id`;
ALTER TABLE `app_polyglot_faculty` 
DROP COLUMN `emailId`,
DROP COLUMN `mobile`,
DROP COLUMN `name`;
ALTER TABLE `app_polyglot_faculty` 
ADD COLUMN `is_private` VARCHAR(1) NULL AFTER `courseId`;