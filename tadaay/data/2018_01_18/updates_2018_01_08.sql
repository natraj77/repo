CREATE TABLE `app_users_social_media` ( `id` INT NOT NULL AUTO_INCREMENT , `partner_id` INT NOT NULL , `photo_uri` VARCHAR(50) NULL , `website_url` VARCHAR(50) NULL , `facebook_page` VARCHAR(50) NULL , `twitter` VARCHAR(50) NULL , `google_plus` VARCHAR(50) NULL , `linkedin` VARCHAR(50) NULL , `pintrest` VARCHAR(50) NULL , `instagram` VARCHAR(50) NULL , `last_insrt_upd_ts` DATETIME NOT NULL , `last_insrt_upd_usr_id` INT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;
ALTER TABLE `app_users_social_media` ADD UNIQUE(`partner_id`);
ALTER TABLE `app_users_social_media` ADD CONSTRAINT `fk_social_media_app_user` FOREIGN KEY (`partner_id`) REFERENCES `app_users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;\
ALTER TABLE `app_polyglot_templates` MODIFY template_name varchar(48);
