ALTER TABLE `app_users` 
ADD COLUMN `is_private` VARCHAR(1) NULL AFTER `id`;

rename table dmn_quizzes to dmn_questions;

ALTER TABLE app_polyglot_quiz DROP FOREIGN KEY fk_quiz_id_quiz;
ALTER TABLE `app_polyglot_quiz` DROP `quiz_id`;

CREATE TABLE `app_polyglot_quiz_questions` ( `id` INT NOT NULL AUTO_INCREMENT , `polyglot_quiz_id` INT NOT NULL , `course_name` VARCHAR(100) NOT NULL , `quiz_level` VARCHAR(25) NOT NULL , `topic` VARCHAR(50) NOT NULL , `number_of_questions` INT NOT NULL , `last_insrt_upd_ts` DATETIME NOT NULL , `last_insrt_upd_usr_id` INT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;
ALTER TABLE `app_polyglot_quiz_questions` ADD CONSTRAINT `fk_polyglot_quiz_questions` FOREIGN KEY (`polyglot_quiz_id`) REFERENCES `app_polyglot_quiz`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `app_polyglot_quiz` DROP `number_of_questions`;
