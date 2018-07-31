/*update course priority defailt to 10*/

update dmn_course_list set priorty_no = 10;

/*adding cities at domain level*/
INSERT INTO `dmn_cities` (`city_id`, `city_desc`, `city_long_desc`, `city_code`, `state_id`, `dsbl_in`, `last_insrt_upd_usr_id`, `last_insrt_upd_ts`) VALUES
(2, 'Vizag', 'Vizag', 'VZG', 1, 'N', NULL, CURRENT_TIMESTAMP()),
(3, 'Vijayawada', 'Vijayawada', 'VJA', 1, 'N', NULL, CURRENT_TIMESTAMP()),
(4, 'Guntur', 'Guntur', 'GNT', 1, 'N', NULL, CURRENT_TIMESTAMP()),
(5, 'Nellore', 'Nellore', 'NLR', 1, 'N', NULL, CURRENT_TIMESTAMP()),
(6, 'Kurnool', 'Kurnool', 'KNL', 1, 'N', NULL, CURRENT_TIMESTAMP()),
(7, 'Ongole', 'Ongole', 'OGL', 1, 'N', NULL, CURRENT_TIMESTAMP()),
(8, 'Eluru', 'Eluru', 'ELR', 1, 'N', NULL, CURRENT_TIMESTAMP()),
(99999, 'All', 'All', 'All', 1, 'Y', NULL, CURRENT_TIMESTAMP())
;



/*adding states at domain level*/  
INSERT INTO `dmn_states` (`state_id`, `state_desc`, `state_long_desc`, `state_code`, `cntry_id`, `dsbl_in`, `last_insrt_upd_ts`, `last_insrt_upd_usr_id`) VALUES
(2, 'Andhra Pradesh', 'Andhra Pradesh', 'AP', 1, 'N',  CURRENT_TIMESTAMP(), NULL),
(3, 'Karnataka', 'Karnataka', 'KA', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(4, 'Arunachal Pradesh', 'Arunachal Pradesh', 'AR', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(5, 'Assam', 'Assam', 'AS', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(6, 'Bihar', 'Bihar', 'BR', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(7, 'Chhattisgarh', 'Chhattisgarh', 'CG', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(8, 'Goa', 'Goa', 'GA', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(9, 'Gujarat', 'Gujarat', 'GJ', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(10, 'Haryana', 'Haryana', 'HR', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(11, 'Himachal Pradesh', 'Himachal Pradesh', 'HP', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(12, 'Jammu and Kashmir', 'Jammu and Kashmir', 'JK', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(13, 'Jharkhand', 'Jharkhand', 'JH', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(14, 'Kerala', 'Kerala', 'KL', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(15, 'Madhya Pradesh', 'Madhya Pradesh', 'MP', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(16, 'Maharashtra', 'Maharashtra', 'MH', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(17, 'Manipur', 'Manipur', 'MN', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(18, 'Meghalaya', 'Meghalaya', 'ML', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(19, 'Mizoram', 'Mizoram', 'MZ', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(20, 'Nagaland', 'Nagaland', 'NL', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(21, 'Orissa', 'Orissa', 'OR', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(22, 'Punjab', 'Punjab', 'PB', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(23, 'Rajasthan', 'Rajasthan', 'RJ', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(24, 'Sikkim', 'Sikkim', 'SK', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(25, 'Tamil Nadu', 'Tamil Nadu', 'TN', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(26, 'Tripura', 'Tripura', 'TR', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(27, 'Uttarakhand', 'Uttarakhand', 'UK', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(28, 'Uttar Pradesh', 'Uttar Pradesh', 'UP', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(29, 'West Bengal', 'West Bengal', 'WB', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(30, 'Andaman and Nicobar Islands', 'Andaman and Nicobar Islands', 'AN', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(31, 'Chandigarh', 'Chandigarh', 'CH', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(32, 'Dadra and Nagar Haveli', 'Dadra and Nagar Haveli', 'DH', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(33, 'Daman and Diu', 'Daman and Diu', 'DD', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(34, 'Delhi', 'Delhi', 'DL', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(35, 'Lakshadweep', 'Lakshadweep', 'LD', 1, 'N', CURRENT_TIMESTAMP(), NULL),
(36, 'Pondicherry', 'Pondicherry', 'PD', 1, 'N', CURRENT_TIMESTAMP(), NULL)
;



INSERT INTO `app_polyglot_banners` (`bannerId`,`position`,`start_date`,`end_date`,`status`,`is_active`,`image_path`,`created_time`,`modified_time`,`city_id`,`partner_id`,`course_id`) 
VALUES (1,1,'2017-03-12 00:00:00','2018-12-31 00:00:00','APPROVED','Y','resources/images/layerslider/trainers/slider1-aws.jpg','2017-03-12 00:00:00','2017-03-12 00:00:00',1,3,1),
 (2,1,'2017-03-12 00:00:00','2018-12-31 00:00:00','APPROVED','Y','resources/images/layerslider/trainers/slider1-aws.jpg','2017-03-12 00:00:00','2017-03-12 00:00:00',1,3,2),
 (3,1,'2017-03-12 00:00:00','2018-12-31 00:00:00','APPROVED','Y','resources/images/layerslider/trainers/slider1-aws.jpg','2017-03-12 00:00:00','2017-03-12 00:00:00',1,3,3),
 (4,1,'2017-03-12 00:00:00','2018-12-31 00:00:00','APPROVED','Y','resources/images/layerslider/trainers/slider1-aws.jpg','2017-03-12 00:00:00','2017-03-12 00:00:00',99999,3,1),
  (5,1,'2017-03-12 00:00:00','2018-12-31 00:00:00','APPROVED','Y','resources/images/layerslider/trainers/slider1-aws.jpg','2017-03-12 00:00:00','2017-03-12 00:00:00',99999,3,15);


/*remove comma in location*/
update app_polyglot_address set address_line_3 = replace(address_line_3,',','') where address_line_3 like '%,%';


/*set to default meta keywords*/
update dmn_course_list set addCourseInfo = 'course info', meta_courseTitle = 'course title', meta_keywords = 'course description', meta_description = 'course description' where addCourseInfo is NULL;

/*update course names as per dmn course list names*/
update app_polyglot_batch set course_name = 'AWS Solution Architect - Associate' where course_name = 'AWS';

/* when time is empty set it to 9 AM*/ 
UPDATE app_polyglot_batch SET start_date = CONCAT(start_date, ' 9:00 AM') where length(start_date) < 12;

/* replace schedule to be weekdays or weekend */
update app_polyglot_batch set schedule  = 'Weekdays' where schedule like '%2017%';

/*removing the rows where date format is not in proper format*/
delete from app_polyglot_batch where batch_status != 'SCHEDULED';


