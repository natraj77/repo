ALTER TABLE `app_polyglot_student` ADD `batch_id` INT NOT NULL AFTER `next_interest`;
ALTER TABLE `app_polyglot_payment` CHANGE `opted_discount` `opted_discount` DOUBLE NOT NULL;
ALTER TABLE `app_polyglot_payment` CHANGE `transaction_ref` `transaction_ref` VARCHAR(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL;