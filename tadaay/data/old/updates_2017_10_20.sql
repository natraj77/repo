update app_polyglot_plan set duration = 'Monthly' where id > 0;
update app_polyglot_plan set is_expired = 'N' where id > 0;

ALTER TABLE `app_polyglot_plan` CHANGE `keyword` `keyword` VARCHAR(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL;
ALTER TABLE `app_polyglot_plan` CHANGE `location` `location` VARCHAR(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL;