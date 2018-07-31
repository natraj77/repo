
ALTER TABLE `dmn_course_list` ADD `template` VARCHAR(45) NULL AFTER `course_name`
,ADD `keywords` VARCHAR(256)  NULL AFTER `template`,ADD `imagePath` VARCHAR(45)  NULL AFTER `keywords`
,ADD `featured` VARCHAR(1)  NULL AFTER `imagePath`,ADD `level` VARCHAR(45)  NULL AFTER `featured`
,ADD `coursetitle` VARCHAR(45)  NULL AFTER `level`,ADD `courseDesc` VARCHAR(1024)  NULL AFTER `coursetitle`
,ADD `compImagePath` VARCHAR(45)  NULL AFTER `courseDesc`,ADD `addCourseInfo` TEXT  NULL AFTER `compImagePath`
,ADD `relatedCourses` VARCHAR(45)  NULL AFTER `addCourseInfo`;