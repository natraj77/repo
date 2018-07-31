ALTER TABLE `app_polyglot_demo` 
DROP COLUMN `faculty_name`,
DROP COLUMN `branch_name`,
DROP COLUMN `course_name`,
ADD COLUMN `branch_id` INT(11) NOT NULL AFTER `partner_id`,
ADD COLUMN `course_id` INT(11) NOT NULL AFTER `branch_id`,
ADD COLUMN `faculty_id` INT(11) NOT NULL AFTER `course_id`;
