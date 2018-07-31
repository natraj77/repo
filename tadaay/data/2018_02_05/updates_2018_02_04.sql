drop table if exists `app_users_education_details`;
CREATE TABLE `app_users_education_details` ( 
`id` INT NOT NULL AUTO_INCREMENT , 
`appuserId` INT NOT NULL , 
`college_name` VARCHAR(100) NOT NULL , 
`degree` VARCHAR(20) NOT NULL , 
`specialization` VARCHAR(5) NOT NULL , 
`percentage` DOUBLE NOT NULL , 
`passed_out_year` INT NOT NULL , 
`last_insrt_upd_ts` DATETIME NOT NULL , 
`last_insrt_upd_usr_id` INT NOT NULL , 
PRIMARY KEY (`id`), INDEX (`appuserId`)) ENGINE = InnoDB;

ALTER TABLE `app_users_education_details` ADD CONSTRAINT `fk_app_users_edu_details` FOREIGN KEY (`appuserId`) REFERENCES `app_users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `app_users_education_details` 
ADD COLUMN `verified` VARCHAR(1) NULL AFTER `specialization`,
ADD COLUMN `verified_by_name` VARCHAR(32) NULL AFTER `verified`,
ADD COLUMN `verified_datetime` DATETIME NULL AFTER `verified_by_name`,
ADD COLUMN `proof_path` VARCHAR(128) NULL AFTER `verified_datetime`;

ALTER TABLE `app_users_experience_details` 
ADD COLUMN `verified` VARCHAR(1) NULL AFTER `designation`,
ADD COLUMN `verified_by_name` VARCHAR(32) NULL AFTER `verified`,
ADD COLUMN `verified_datetime` DATETIME NULL AFTER `verified_by_name`,
ADD COLUMN `proof_path` VARCHAR(128) NULL AFTER `verified_datetime`;

drop table if exists app_users_social_media;
CREATE TABLE `app_users_social_media` ( 
`id` INT NOT NULL AUTO_INCREMENT , 
`appuserId` INT NOT NULL , 
`photo_uri` VARCHAR(50) NULL , 
`website_url` VARCHAR(50) NULL , 
`facebook_page` VARCHAR(50) NULL , 
`twitter` VARCHAR(50) NULL , 
`google_plus` VARCHAR(50) NULL , 
`linkedin` VARCHAR(50) NULL , 
`pintrest` VARCHAR(50) NULL , 
`instagram` VARCHAR(50) NULL , 
`last_insrt_upd_ts` DATETIME NOT NULL , 
`last_insrt_upd_usr_id` INT NOT NULL , 
PRIMARY KEY (`id`)) ENGINE = InnoDB;

ALTER TABLE `app_users_social_media` ADD UNIQUE(`appuserId`);
ALTER TABLE `app_users_social_media` ADD CONSTRAINT `fk_social_media_app_user` FOREIGN KEY (`appuserId`) REFERENCES `app_users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
