ALTER TABLE `app_polyglot_course` 
ADD COLUMN `course_path` VARCHAR(200) NULL AFTER `attr_placement_assistance`,
ADD COLUMN `video_path` VARCHAR(200) NULL AFTER `course_path`;
ALTER TABLE `app_users` 
ADD COLUMN `wall_message` VARCHAR(512) NULL AFTER `about_us`;
