ALTER TABLE `app_student_task` 
CHANGE COLUMN `student_id` `student_id` INT(11) NULL ,
ADD COLUMN `app_user_id` INT NOT NULL AFTER `student_id`;