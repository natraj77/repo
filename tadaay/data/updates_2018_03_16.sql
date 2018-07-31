ALTER TABLE `app_users` 
ADD COLUMN `profile_image_path` VARCHAR(200) NULL AFTER `last_login_ip`,
ADD COLUMN `logo_path` VARCHAR(200) NULL AFTER `profile_image_path`,
ADD COLUMN `thumbnail_path` VARCHAR(200) NULL AFTER `logo_path`;
ALTER TABLE `app_polyglot_batch` 
ADD COLUMN `class_time` INT(11) NULL AFTER `last_insrt_upd_ts`;