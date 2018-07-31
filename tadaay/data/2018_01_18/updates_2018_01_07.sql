ALTER TABLE `app_polyglot_batch` 
DROP COLUMN `branch_name`,
DROP COLUMN `course_name`,
CHANGE COLUMN `faculty_id` `faculty_id` INT(11) NULL DEFAULT NULL AFTER `partner_id`, 
ADD COLUMN `course_id` INT(11) NOT NULL AFTER `faculty_id`,
ADD COLUMN `branch_id` INT(11) NOT NULL AFTER `course_id`;