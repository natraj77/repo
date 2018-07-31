ALTER TABLE `app_users` 
ADD COLUMN `last_login_datetime` DATETIME NULL AFTER `wall_message`,
ADD COLUMN `last_login_ip` VARCHAR(16) NULL AFTER `last_login_datetime`;