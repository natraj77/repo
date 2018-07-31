ALTER TABLE `app_polyglot_batch` 
ADD COLUMN `fee` DOUBLE NOT NULL AFTER `mode`;
ALTER TABLE `app_polyglot_course` 
DROP COLUMN `course_fee`,
DROP COLUMN `duration_type`,
DROP COLUMN `duration`,
DROP COLUMN `schedule`,
ADD COLUMN `attr_online` VARCHAR(1) NULL AFTER `dmn_course_id`,
ADD COLUMN `attr_classroom` VARCHAR(1) NULL AFTER `attr_online`,
ADD COLUMN `attr_corporate` VARCHAR(1) NULL AFTER `attr_classroom`;


CREATE TABLE `app_users_education_details` ( `id` INT NOT NULL AUTO_INCREMENT , `partner_id` INT NOT NULL , `ssc_school_name` VARCHAR(100) NULL , `ssc_percentage` DOUBLE NULL , `inter_college_name` VARCHAR(100) NULL , `inter_specialization` VARCHAR(10) NULL , `inter_percentage` DOUBLE NULL , `diploma_college_name` VARCHAR(100) NULL , `diploma_specialization` VARCHAR(10) NULL , `diploma_percentage` DOUBLE NULL , `ug_college_name` VARCHAR(100) NULL , `ug_degree` VARCHAR(10) NULL , `ug_specialization` VARCHAR(10) NULL , `ug_percentage` DOUBLE NULL , `pg_college_name` VARCHAR(100) NULL , `pg_degree` VARCHAR(10) NULL , `pg_specialization` INT(10) NULL , `pg_percentage` DOUBLE NULL , `last_insrt_upd_ts` DATETIME NOT NULL , `last_insrt_upd_usr_id` INT NOT NULL , PRIMARY KEY (`id`), UNIQUE `partner_id` (`partner_id`)) ENGINE = InnoDB;
ALTER TABLE `app_users_education_details` ADD CONSTRAINT `fk_education_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `app_users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

