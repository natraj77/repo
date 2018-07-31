CREATE TABLE `polyglot`.`app_email_templates` ( `id` INT NOT NULL , `template_name` VARCHAR(100) NOT NULL , `file_name` VARCHAR(100) NOT NULL , `is_active` VARCHAR(1) NOT NULL , `last_insrt_upd_ts` DATETIME NOT NULL , `last_insrt_upd_usr_id` INT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;
ALTER TABLE `app_email_templates` ADD `partner_id` INT NOT NULL AFTER `id`;

ALTER TABLE `app_email_templates` ADD CONSTRAINT `fk_user_email_tempalte` FOREIGN KEY (`partner_id`) REFERENCES `app_users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

drop table `app_polyglot_demo`;

CREATE TABLE `polyglot`.`app_polyglot_demo` ( `id` INT NOT NULL AUTO_INCREMENT , `partner_id` INT NOT NULL , `course_name` VARCHAR(100) NOT NULL , `mode` VARCHAR(20) NOT NULL , `branch_name` VARCHAR(50) NOT NULL , `faculty_name` VARCHAR(50) NOT NULL , `date_time` VARCHAR(20) NOT NULL , `fee` DOUBLE NOT NULL , `last_insrt_upd_ts` DATETIME NOT NULL , `last_insrt_upd_usr_id` INT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;
ALTER TABLE `app_polyglot_demo` ADD CONSTRAINT `fk_partner_demo` FOREIGN KEY (`partner_id`) REFERENCES `app_users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `app_polyglot_demo` ADD `is_active` VARCHAR(1) NOT NULL AFTER `fee`;