ALTER TABLE `app_polyglot_batch` ADD `batch_status` VARCHAR(50) NOT NULL AFTER `fee_discount`;
ALTER TABLE `app_polyglot_batch` ADD `start_date` VARCHAR(10) NOT NULL AFTER `batch_status`;