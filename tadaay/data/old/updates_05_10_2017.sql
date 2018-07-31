ALTER TABLE `app_polyglot_batch` CHANGE `start_date` `start_date` VARCHAR(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL;
CREATE TABLE `polyglot`.`dmn_quizzes` ( `id` INT NOT NULL AUTO_INCREMENT , `quiz_name` VARCHAR(100) NOT NULL , `course_name` VARCHAR(100) NOT NULL , `quiz_level` VARCHAR(25) NOT NULL , `topic` VARCHAR(50) NOT NULL , `topic_id` INT NOT NULL , `last_insrt_upd_usr_id` INT NOT NULL , `last_insrt_upd_ts` DATETIME NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

ALTER TABLE `tadaay`.`app_users` DROP INDEX `user_idx`, ADD UNIQUE `user_idx` (`emailId`) USING BTREE;