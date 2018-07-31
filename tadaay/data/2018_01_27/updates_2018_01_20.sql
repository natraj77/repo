ALTER TABLE `app_student_task` 
DROP COLUMN `student_name`,
ADD COLUMN `result` VARCHAR(12) NULL AFTER `task_status`;