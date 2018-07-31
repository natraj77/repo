ALTER TABLE `app_student_quiz` 
ADD COLUMN `app_user_id` INT(11) NULL AFTER `student_id`;
ALTER TABLE `app_users_experience_details` 
DROP COLUMN `key_skill`,
DROP COLUMN `years`;