ALTER TABLE `app_polyglot_quiz` 
ADD COLUMN `quiz_identifier` VARCHAR(45) NULL DEFAULT NULL AFTER `description`;

CREATE TABLE `app_polyglot_event_subscription` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `app_user_id` int(11) NOT NULL,
  `status` varchar(45) NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



