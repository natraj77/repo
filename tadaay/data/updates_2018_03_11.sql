ALTER TABLE `app_polyglot_plan` CHANGE `plan_name` `plan_id` INT NOT NULL;
ALTER TABLE `app_polyglot_plan` ADD CONSTRAINT `fk_plan_id_dmn_plan_id` FOREIGN KEY (`plan_id`) REFERENCES `dmn_polyglot_plans`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;