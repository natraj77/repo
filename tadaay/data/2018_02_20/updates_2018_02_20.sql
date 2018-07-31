ALTER TABLE `app_polyglot_batch` 
ADD COLUMN `is_archive` VARCHAR(1) NULL DEFAULT NULL AFTER `duration_type`;
ALTER TABLE `app_polyglot_demo` 
ADD COLUMN `is_archive` VARCHAR(1) NULL AFTER `demo_status`;
ALTER TABLE `app_polyglot_course` 
ADD COLUMN `is_active` VARCHAR(1) NULL AFTER `video_path`;
ALTER TABLE `app_polyglot_faculty` 
ADD COLUMN `is_active` VARCHAR(1) NULL AFTER `is_private`;
ALTER TABLE `app_polyglot_branch_dtls` 
ADD COLUMN `is_active` VARCHAR(1) NULL AFTER `contact_email`;


/* remove unnecessary columns from app_users*/

ALTER TABLE `app_users` 
DROP COLUMN `qualification`,
DROP COLUMN `branch`,
DROP COLUMN `passoutYr`,
DROP COLUMN `percentage`,
DROP COLUMN `compName`,
DROP COLUMN `designation`,
DROP COLUMN `yrsofexp`,
DROP COLUMN `skills`,
DROP COLUMN `contact_person`,
DROP COLUMN `contact_email`,
DROP COLUMN `contact_landline`,
DROP COLUMN `contact_mobile`;

ALTER TABLE `app_users_experience_details` 
DROP COLUMN `key_skill`,
DROP COLUMN `years`;
