ALTER TABLE `app_users_image_details` 
CHANGE COLUMN `app_users_image_detailscol` `app_users_image_details` VARCHAR(45) NULL DEFAULT NULL ;
ALTER TABLE `app_users_image_details` 
DROP COLUMN `app_users_image_details`;
ALTER TABLE `app_users_image_details` 
CHANGE COLUMN `last_insrt_upd_usr_id` `last_insrt_upd_usr_id` INT(11) NOT NULL ,
CHANGE COLUMN `last_insrt_upd_ts` `last_insrt_upd_ts` DATETIME NOT NULL ;
