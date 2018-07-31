ALTER TABLE `app_polyglot_batch` 
ADD COLUMN `duration` INT(11) NULL AFTER `batch_name`,
ADD COLUMN `duration_type` VARCHAR(45) NULL AFTER `duration`;
ALTER TABLE `app_users` 
ADD COLUMN `invited_date` DATETIME NULL AFTER `invited_usr_id`;
ALTER TABLE `dmn_course_list` 
ADD COLUMN `tn3_image_path` VARCHAR(128) NULL AFTER `imagePath`;
