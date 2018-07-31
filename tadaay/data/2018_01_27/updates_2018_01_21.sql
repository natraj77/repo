CREATE TABLE `app_student_quiz` (
  `id` INT(11) NOT NULL,
  `student_id` INT(11) NOT NULL,
  `task_id` INT(11) NOT NULL,
  `startDate` DATETIME NULL,
  `endDate` DATETIME NULL,
  `status` VARCHAR(100) NULL,
  `score` INT(3) NULL,
  `result` VARCHAR(12) NULL,
  `last_insrt_upd_usr_id` INT(11) NOT NULL,
  `last_insrt_upd_ts` DATETIME NOT NULL,
  PRIMARY KEY (`id`));