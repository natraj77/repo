/* this table tracks all the sql table changes */
CREATE TABLE `versions` ( 
`id` INT NOT NULL AUTO_INCREMENT, 
`table_name` VARCHAR(32) NOT NULL , 
`version` INT NOT NULL , 
`last_updated_time` DATETIME NOT NULL,
PRIMARY KEY (`id`) 
) ENGINE = InnoDB;

/* This version has to be updated on every table change. Every time we create a new table we need to insert an entry to this table. When the existing table is updated, we have to increment the version*/

INSERT INTO `versions`  ( `id`, `table_name`, `version`, `last_updated_time` ) VALUES ( '', 'app_email_templates', '1', CURRENT_TIMESTAMP) ;
INSERT INTO `versions`  ( `id`, `table_name`, `version`, `last_updated_time` ) VALUES ( '', 'app_polyglot_address', '1', CURRENT_TIMESTAMP) ;
INSERT INTO `versions`  ( `id`, `table_name`, `version`, `last_updated_time` ) VALUES ( '', 'app_polyglot_banners', '1', CURRENT_TIMESTAMP) ;
INSERT INTO `versions`  ( `id`, `table_name`, `version`, `last_updated_time` ) VALUES ( '', 'app_polyglot_batch', '1', CURRENT_TIMESTAMP) ;
INSERT INTO `versions`  ( `id`, `table_name`, `version`, `last_updated_time` ) VALUES ( '', 'app_polyglot_branch', '1', CURRENT_TIMESTAMP) ;
INSERT INTO `versions`  ( `id`, `table_name`, `version`, `last_updated_time` ) VALUES ( '', 'app_polyglot_contact', '1', CURRENT_TIMESTAMP) ;
INSERT INTO `versions`  ( `id`, `table_name`, `version`, `last_updated_time` ) VALUES ( '', 'app_polyglot_course', '1', CURRENT_TIMESTAMP) ;
INSERT INTO `versions`  ( `id`, `table_name`, `version`, `last_updated_time` ) VALUES ( '', 'app_polyglot_demo', '1', CURRENT_TIMESTAMP) ;
INSERT INTO `versions`  ( `id`, `table_name`, `version`, `last_updated_time` ) VALUES ( '', 'app_polyglot_events', '1', CURRENT_TIMESTAMP) ;
INSERT INTO `versions`  ( `id`, `table_name`, `version`, `last_updated_time` ) VALUES ( '', 'app_polyglot_faculty', '1', CURRENT_TIMESTAMP) ;
INSERT INTO `versions`  ( `id`, `table_name`, `version`, `last_updated_time` ) VALUES ( '', 'app_polyglot_lead', '1', CURRENT_TIMESTAMP) ;
INSERT INTO `versions`  ( `id`, `table_name`, `version`, `last_updated_time` ) VALUES ( '', 'app_polyglot_lead_demo_status', '1', CURRENT_TIMESTAMP) ;
INSERT INTO `versions`  ( `id`, `table_name`, `version`, `last_updated_time` ) VALUES ( '', 'app_polyglot_news', '1', CURRENT_TIMESTAMP) ;
INSERT INTO `versions`  ( `id`, `table_name`, `version`, `last_updated_time` ) VALUES ( '', 'app_polyglot_payment', '1', CURRENT_TIMESTAMP) ;
INSERT INTO `versions`  ( `id`, `table_name`, `version`, `last_updated_time` ) VALUES ( '', 'app_polyglot_plan', '1', CURRENT_TIMESTAMP) ;
INSERT INTO `versions`  ( `id`, `table_name`, `version`, `last_updated_time` ) VALUES ( '', 'app_polyglot_student', '1', CURRENT_TIMESTAMP) ;
INSERT INTO `versions`  ( `id`, `table_name`, `version`, `last_updated_time` ) VALUES ( '', 'app_polyglot_task', '1', CURRENT_TIMESTAMP) ;
INSERT INTO `versions`  ( `id`, `table_name`, `version`, `last_updated_time` ) VALUES ( '', 'app_polyglot_templates', '1', CURRENT_TIMESTAMP) ;
INSERT INTO `versions`  ( `id`, `table_name`, `version`, `last_updated_time` ) VALUES ( '', 'app_polyglot_user_profile', '1', CURRENT_TIMESTAMP) ;
INSERT INTO `versions`  ( `id`, `table_name`, `version`, `last_updated_time` ) VALUES ( '', 'app_student_task', '1', CURRENT_TIMESTAMP) ;
INSERT INTO `versions`  ( `id`, `table_name`, `version`, `last_updated_time` ) VALUES ( '', 'app_users', '1', CURRENT_TIMESTAMP) ;
INSERT INTO `versions`  ( `id`, `table_name`, `version`, `last_updated_time` ) VALUES ( '', 'dmn_cities', '1', CURRENT_TIMESTAMP) ;
INSERT INTO `versions`  ( `id`, `table_name`, `version`, `last_updated_time` ) VALUES ( '', 'dmn_cntry', '1', CURRENT_TIMESTAMP) ;
INSERT INTO `versions`  ( `id`, `table_name`, `version`, `last_updated_time` ) VALUES ( '', 'dmn_course_list', '1', CURRENT_TIMESTAMP) ;
INSERT INTO `versions`  ( `id`, `table_name`, `version`, `last_updated_time` ) VALUES ( '', 'dmn_states', '1', CURRENT_TIMESTAMP) ;
INSERT INTO `versions`  ( `id`, `table_name`, `version`, `last_updated_time` ) VALUES ( '', '', '1', CURRENT_TIMESTAMP) ;