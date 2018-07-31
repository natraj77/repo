drop table `dmn_quizzes`

CREATE TABLE `dmn_quizzes` (
  `id` int(11) NOT NULL,
  `quiz_name` varchar(100) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `quiz_level` varchar(25) NOT NULL,
  `topic` varchar(50) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `question_text` text NOT NULL,
  `question_has_image` varchar(1) DEFAULT NULL,
  `question_image_path` varchar(100) DEFAULT NULL,
  `option_a_text` text NOT NULL,
  `option_a_has_image` varchar(1) DEFAULT NULL,
  `option_a_image_path` varchar(100) DEFAULT NULL,
  `option_b_text` text NOT NULL,
  `option_b_has_image` varchar(1) DEFAULT NULL,
  `option_b_image_path` text,
  `option_c_text` text NOT NULL,
  `option_c_has_image` varchar(1) DEFAULT NULL,
  `option_c_image_path` varchar(100) DEFAULT NULL,
  `option_d_text` text NOT NULL,
  `option_d_has_image` varchar(1) DEFAULT NULL,
  `option_d_image_path` varchar(100) DEFAULT NULL,
  `option_e_text` text NOT NULL,
  `option_e_has_image` varchar(1) DEFAULT NULL,
  `option_e_image_path` varchar(100) DEFAULT NULL,
  `option_f_text` text NOT NULL,
  `option_f_has_image` varchar(1) DEFAULT NULL,
  `option_f_image_path` varchar(100) DEFAULT NULL,
  `correct_option` varchar(20) NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dmn_quizzes`
--
ALTER TABLE `dmn_quizzes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dmn_quizzes`
--
ALTER TABLE `dmn_quizzes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;




CREATE TABLE `app_polyglot_quiz` ( `id` INT NOT NULL AUTO_INCREMENT , `partner_id` INT NOT NULL , `quiz_id` INT NOT NULL , `last_insrt_upd_ts` DATETIME NOT NULL , `last_insrt_upd_usr_id` INT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;
ALTER TABLE `app_polyglot_quiz` ADD CONSTRAINT `fk_partner_id_quiz` FOREIGN KEY (`partner_id`) REFERENCES `app_users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `app_polyglot_quiz` ADD CONSTRAINT `fk_quiz_id_quiz` FOREIGN KEY (`quiz_id`) REFERENCES `dmn_quizzes`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `app_polyglot_quiz` ADD `is_active` VARCHAR(1) NOT NULL AFTER `quiz_id`;
ALTER TABLE `app_polyglot_quiz` ADD `duration` INT NOT NULL AFTER `is_active`;
ALTER TABLE `app_polyglot_quiz` ADD `number_of_questions` INT NOT NULL AFTER `duration`;
ALTER TABLE `app_polyglot_quiz` ADD `quiz_name` VARCHAR(100) NOT NULL AFTER `quiz_id`;
ALTER TABLE `app_polyglot_quiz` ADD `description` VARCHAR(250) NULL AFTER `number_of_questions`;
ALTER TABLE `dmn_quizzes` DROP `quiz_name`;

