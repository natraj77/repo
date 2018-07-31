ALTER TABLE `app_student_quiz` 
ADD COLUMN `assigned_date` DATETIME NULL AFTER `task_id`;
ALTER TABLE `app_polyglot_batch` 
ADD COLUMN `end_date` DATETIME NULL AFTER `start_date`;