ALTER TABLE `app_polyglot_payment` 
DROP COLUMN `course_name`,
ADD COLUMN `app_user_id` INT(11) NULL AFTER `student_id`;
