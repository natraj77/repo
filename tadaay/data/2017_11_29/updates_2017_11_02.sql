ALTER TABLE `dmn_course_list` ADD `meta_courseTitle` VARCHAR(64)  NULL AFTER `addCourseInfo`,
ADD `meta_keywords` VARCHAR(128)  NULL AFTER `meta_courseTitle`,
ADD `meta_description` VARCHAR(45)  NULL AFTER `meta_keywords`,
ADD `course_identifier` VARCHAR(45)  NULL AFTER `meta_description`;


ALTER TABLE dmn_course_list ADD UNIQUE (course_identifier);