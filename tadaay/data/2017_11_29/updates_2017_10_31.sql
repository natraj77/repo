CREATE TABLE `app_student_task` ( `id` INT NOT NULL , `student_id` INT NOT NULL , `task_id` INT NOT NULL , `task_status` VARCHAR(100) NULL , `student_name` VARCHAR(100) NULL , `last_insrt_upd_usr_id` INT NOT NULL , `last_insrt_upd_ts` DATETIME NOT NULL ) ENGINE = InnoDB;
ALTER TABLE `app_student_task` ADD PRIMARY KEY(`id`);
