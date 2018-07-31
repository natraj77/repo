ALTER TABLE `app_polyglot_lead` 
DROP COLUMN `email`,
DROP COLUMN `mobile`,
DROP COLUMN `last_name`,
DROP COLUMN `first_name`,
DROP COLUMN `course`,
ADD COLUMN `app_user_id` INT(11) NOT NULL AFTER `schedule`,
ADD COLUMN `course_id` INT(11) NOT NULL AFTER `branch`,
ADD COLUMN `discount` INT(11) NULL AFTER `reffered_by`;

/*ALTER TABLE `app_polyglot_lead`  DROP INDEX `fk_lead_branch_id`; */

ALTER TABLE app_polyglot_lead DROP FOREIGN KEY fk_lead_branch;