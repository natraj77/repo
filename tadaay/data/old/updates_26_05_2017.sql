truncate table app_polyglot_course;
ALTER TABLE `app_polyglot_course` ADD `partner_id` INT NOT NULL AFTER `id`;
ALTER TABLE `app_polyglot_course` ADD INDEX(`partner_id`);

ALTER TABLE `app_polyglot_course` ADD CONSTRAINT `fk_partner_id_courses` FOREIGN KEY (`partner_id`) REFERENCES `app_users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;


--app_polyglot_branch
--app_polyglot_lead

truncate table app_polyglot_lead;
DELETE FROM `app_polyglot_branch` WHERE 1;
ALTER TABLE `app_polyglot_branch` ADD `partner_id` INT NOT NULL AFTER `id`, ADD INDEX `indx_partner_id` (`partner_id`);
ALTER TABLE `app_polyglot_branch` ADD CONSTRAINT `fk_partner_id_branches` FOREIGN KEY (`partner_id`) REFERENCES `app_users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--app_polyglot_batch
--app_pplyglot_faculty
DELETE FROM `app_polyglot_batch` WHERE 1;
DELETE FROM `app_polyglot_faculty` WHERE 1;
ALTER TABLE `app_polyglot_faculty` ADD `partner_id` INT NOT NULL AFTER `id`, ADD INDEX `indx_partner_id_faculty` (`partner_id`);
ALTER TABLE `app_polyglot_faculty` ADD CONSTRAINT `fk_partner_id_faculty` FOREIGN KEY (`partner_id`) REFERENCES `app_users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `app_polyglot_batch` ADD `partner_id` INT NOT NULL AFTER `ply_batch_no`, ADD INDEX `indx_partner_id_batch` (`partner_id`);
ALTER TABLE `app_polyglot_batch` ADD CONSTRAINT `fk_partner_id_batch` FOREIGN KEY (`partner_id`) REFERENCES `app_users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--app_polyglot_student
DELETE FROM `app_polyglot_student` WHERE 1;
ALTER TABLE `app_polyglot_student` ADD `partner_id` INT NOT NULL AFTER `id`, ADD INDEX `indx_partner_id_student` (`partner_id`);
ALTER TABLE `app_polyglot_student` ADD CONSTRAINT `fk_partner_id_student` FOREIGN KEY (`partner_id`) REFERENCES `app_users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--app_polyglot_payment
DELETE FROM `app_polyglot_payment` WHERE 1;
ALTER TABLE `app_polyglot_payment` ADD `partner_id` INT NOT NULL AFTER `id`, ADD INDEX `indx_partner_id_payment` (`partner_id`);
ALTER TABLE `app_polyglot_payment` ADD CONSTRAINT `fk_partner_id_payment` FOREIGN KEY (`partner_id`) REFERENCES `app_users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--app_polyglot_lead
ALTER TABLE `app_polyglot_lead` ADD `partner_id` INT NOT NULL AFTER `id`;

CREATE TABLE `dmn_courses_tests` (
  `courseId` int(11) NOT NULL,
  `testId` int(11) NOT NULL,
  `question` varchar(145) DEFAULT NULL,
  `choice_a` varchar(145) DEFAULT NULL,
  `correct_choice` varchar(1) DEFAULT NULL,
  `dsbl_in` varchar(1) DEFAULT NULL,
  `last_insrt_upd_ts` datetime DEFAULT NULL,
  `choice_b` varchar(45) DEFAULT NULL,
  `choice_c` varchar(45) DEFAULT NULL,
  `choice_d` varchar(45) DEFAULT NULL,
  `question_no` int(11) NOT NULL,
  PRIMARY KEY (`question_no`,`courseId`,`testId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

