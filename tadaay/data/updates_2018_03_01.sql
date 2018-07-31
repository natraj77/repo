ALTER TABLE `app_polyglot_lead` 
ADD COLUMN `created_datetime` DATETIME NULL AFTER `last_insrt_upd_ts`;
UPDATE app_polyglot_lead lead set lead.created_datetime = lead.last_insrt_upd_ts where lead.id <> 0;
CREATE TABLE `app_users_image_details` (
  `id` INT(11) NOT NULL,
  `app_user_id` INT(11) NULL,
  `profile_image_path` VARCHAR(200) NULL,
  `logo_path` VARCHAR(200) NULL,
  `thumbnail_path` VARCHAR(200) NULL,
  `created_datetime` DATETIME NULL,
  `is_active` VARCHAR(1) NULL,
  `app_users_image_detailscol` VARCHAR(45) NULL,
  `last_insrt_upd_usr_id` INT(11) NULL,
  `last_insrt_upd_ts` DATETIME NULL,
  PRIMARY KEY (`id`))