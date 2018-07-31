CREATE TABLE `app_polyglot_lead_demo_status` ( `id` INT NOT NULL AUTO_INCREMENT , `partner_id` INT NOT NULL , `lead_id` INT NOT NULL , `demo_id` INT NOT NULL , `email_id` VARCHAR(100) NULL , `invite_status` VARCHAR(20) NOT NULL , `last_insrt_upd_usr_id` INT NOT NULL , `last_insrt_upd_ts` DATETIME NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

ALTER TABLE `app_polyglot_demo` ADD `demo_status` VARCHAR(10) NOT NULL AFTER `is_active`;

ALTER TABLE `app_polyglot_lead_demo_status` ADD `first_name` VARCHAR(50) NOT NULL AFTER `invite_status`, ADD `last_name` VARCHAR(50) NOT NULL AFTER `first_name`;