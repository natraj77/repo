ALTER TABLE `app_polyglot_task` 
ADD COLUMN `task_description` VARCHAR(200) NULL AFTER `file_path`;
DROP TABLE `app_users_image_details`;