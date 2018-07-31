ALTER TABLE dmn_course_list MODIFY imagePath VARCHAR(128);
ALTER TABLE dmn_course_list MODIFY compImagePath VARCHAR(128);

update dmn_course_list set level = 'Intermediate', imagePath='/resources/images/courses/tn1/001-aws-solution-architect-associate.jpg', 
compImagePath='/resources/images/courses/tn2/001-aws-solution-architect-associate.jpg',course_name='AWS Solution Architect - Associate', keywords='amazon web servies solution architect associate, aws solution architect associate', courseDesc='amazon web services description comes from courseDesc column',relatedCourses='2,3,4,15' where id = 1; 

update dmn_course_list set level = 'Advanced',imagePath='/resources/images/courses/tn1/002-aws-solution-architect-professional.jpg', 
compImagePath='/resources/images/courses/tn2/002-aws-solution-architect-professional.jpg',course_name='AWS Solution Architect - Professional', keywords='amazon web servies solution architect professional, aws solution architect professional', courseDesc='amazon web services description comes from courseDesc column',relatedCourses='1,3,4' where id = 2 ;

update dmn_course_list set level = 'Intermediate',imagePath='/resources/images/courses/tn1/003-aws-development.jpg', 
compImagePath='/resources/images/courses/tn2/003-aws-development.jpg',course_name='AWS Developer - Associate', keywords='amazon web servies development training, aws development training', courseDesc='amazon web services description comes from courseDesc column',relatedCourses='1,2,4' where id = 3 ;

update dmn_course_list set level = 'Advanced',imagePath='/resources/images/courses/tn1/004-aws-devops-engineer-professional.jpg', 
compImagePath='/resources/images/courses/tn2/004-aws-devops-engineer-professional.jpg',course_name='AWS DevOps Engineer - Professional', keywords='amazon web servies devops training, aws devops training', courseDesc='amazon web services description comes from courseDesc column',relatedCourses='1,2,4' where id = 4 ;

update dmn_course_list set imagePath='/resources/images/courses/tn1/005-microsoft-azure-administration.jpg', 
compImagePath='/resources/images/courses/tn2/005-microsoft-azure-administration.jpg' where id = 5 ;

update dmn_course_list set  level = 'Intermediate', imagePath='/resources/images/courses/tn1/006-microsoft-azure-development.jpg', 
compImagePath='/resources/images/courses/tn2/006-microsoft-azure-development.jpg' where id = 6 ;

update dmn_course_list set level = 'Intermediate',imagePath='/resources/images/courses/tn1/007-openstack-administration.jpg', 
compImagePath='/resources/images/courses/tn2/007-openstack-administration.jpg' where id = 7 ;

update dmn_course_list set  level = 'Intermediate', imagePath='/resources/images/courses/tn1/008-salesforce-administration.jpg', 
compImagePath='/resources/images/courses/tn2/008-salesforce-administration.jpg', course_name='Salesforce Administration' where id = 8 ;


update dmn_course_list set  level = 'Intermediate', imagePath='/resources/images/courses/tn1/009-salesforce-development.jpg', 
compImagePath='/resources/images/courses/tn2/009-salesforce-development.jpg' where id = 9 ;


update dmn_course_list set  level = 'Intermediate', imagePath='/resources/images/courses/tn1/010-devops-jenkins.jpg', 
compImagePath='/resources/images/courses/tn2/010-devops-jenkins.jpg' where id = 10 ;
update dmn_course_list set  level = 'Intermediate', imagePath='/resources/images/courses/tn1/011-devops-docker.jpg', 
compImagePath='/resources/images/courses/tn2/011-devops-docker.jpg' where id = 11 ;


update dmn_course_list set  level = 'Intermediate', imagePath='/resources/images/courses/tn1/012-devops-puppet.jpg', 
compImagePath='/resources/images/courses/tn2/012-devops-puppet.jpg' where id = 12 ;

update dmn_course_list set  level = 'Intermediate', imagePath='/resources/images/courses/tn1/013-devops-chef.jpg', 
compImagePath='/resources/images/courses/tn2/013-devops-chef.jpg' where id = 13 ;

update dmn_course_list set  level = 'Intermediate', imagePath='/resources/images/courses/tn1/014-devops-ansible.jpg', 
compImagePath='/resources/images/courses/tn2/014-devops-ansible.jpg' where id = 14 ;

update dmn_course_list set  level = 'Beginner',imagePath='/resources/images/courses/tn1/015-redhat-linux.jpg', 
compImagePath='/resources/images/courses/tn2/015-redhat-linux.jpg' where id = 15 ;

update dmn_course_list set  level = 'Beginner',imagePath='/resources/images/courses/tn1/016-microsoft-windows-mcse.jpg', 
compImagePath='/resources/images/courses/tn2/016-microsoft-windows-mcse.jpg' where id = 16 ;

update dmn_course_list set  level = 'Beginner',imagePath='/resources/images/courses/tn1/017-ccna.jpg', 
compImagePath='/resources/images/courses/tn2/017-ccna.jpg' where id = 17 ;

update dmn_course_list set level = 'Intermediate', imagePath='/resources/images/courses/tn1/018-ccie.jpg', 
compImagePath='/resources/images/courses/tn2/018-ccie.jpg' where id = 18 ;

update dmn_course_list set  level = 'Advanced', imagePath='/resources/images/courses/tn1/019-ccsp.jpg', 
compImagePath='/resources/images/courses/tn2/019-ccsp.jpg' where id = 19 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/020-oracle-weblogic-administration.jpg', 
compImagePath='/resources/images/courses/tn2/020-oracle-weblogic-administration.jpg', course_name='Oracle WebLogic Administration' where id = 20 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/021-ibm-was-administration.jpg', 
compImagePath='/resources/images/courses/tn2/021-ibm-was-administration.jpg', course_name='IBM Webshpere Application Server(WAS) Administration' where id = 21 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/022-ibm-websphere-mq-administration.jpg', 
compImagePath='/resources/images/courses/tn2/022-ibm-websphere-mq-administration.jpg', course_name='IBM Webshpere MQ Administration' where id = 22 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/023-redhat-jboss-application-server.jpg', 
compImagePath='/resources/images/courses/tn2/023-redhat-jboss-application-server.jpg' where id = 23 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/024-mysql.jpg', 
compImagePath='/resources/images/courses/tn2/024-mysql.jpg' where id = 24 ;

update dmn_course_list set level = 'Beginner', imagePath='/resources/images/courses/tn1/025-oracle-database-administration.jpg', 
compImagePath='/resources/images/courses/tn2/025-oracle-database-administration.jpg', course_name='Oracle Database Administration' where id = 25 ;

update dmn_course_list set level = 'Beginner', imagePath='/resources/images/courses/tn1/026-postgre-sql-server.jpg', 
compImagePath='/resources/images/courses/tn2/026-postgre-sql-server.jpg' where id = 26 ;

update dmn_course_list set level = 'Beginner', imagePath='/resources/images/courses/tn1/027-microsoft-sql-server.jpg', 
compImagePath='/resources/images/courses/tn2/027-microsoft-sql-server.jpg' where id = 27 ;

update dmn_course_list set level = 'Beginner', imagePath='/resources/images/courses/tn1/028-mongodb.jpg', 
compImagePath='/resources/images/courses/tn2/028-mongodb.jpg' where id = 28 ;

update dmn_course_list set level = 'Beginner', imagePath='/resources/images/courses/tn1/029-apache-cassandra.jpg', 
compImagePath='/resources/images/courses/tn2/029-apache-cassandra.jpg' where id = 29 ;

update dmn_course_list set level = 'Beginner', imagePath='/resources/images/courses/tn1/030-apache-couchdb.jpg', 
compImagePath='/resources/images/courses/tn2/030-apache-couchdb.jpg', course_name='Apache CouchDB' where id = 30 ;

update dmn_course_list set level = 'Beginner', imagePath='/resources/images/courses/tn1/031-java.jpg', 
compImagePath='/resources/images/courses/tn2/031-java.jpg' where id = 31 ;

update dmn_course_list set level = 'Beginner', imagePath='/resources/images/courses/tn1/032-python.jpg', 
compImagePath='/resources/images/courses/tn2/032-python.jpg' where id = 32 ;

update dmn_course_list set level = 'Beginner', imagePath='/resources/images/courses/tn1/033-shell-programming.jpg', 
compImagePath='/resources/images/courses/tn2/033-shell-programming.jpg' where id = 33 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/034-ruby.jpg', 
compImagePath='/resources/images/courses/tn2/034-ruby.jpg' where id = 34 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/0-35-javascript.jpg', 
compImagePath='/resources/images/courses/tn2/035-javascript.jpg' where id = 35 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/036-php.jpg', 
compImagePath='/resources/images/courses/tn2/036-php.jpg' where id = 36 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/037-scala.jpg', 
compImagePath='/resources/images/courses/tn2/037-scala.jpg', course_name='Scala' where id = 37 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/038-node-js.jpg', 
compImagePath='/resources/images/courses/tn2/038-node-js.jpg' where id = 38 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/039-angular-js.jpg', 
compImagePath='/resources/images/courses/tn2/039-angular-js.jpg' where id = 39 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/040-mean-stack.jpg', 
compImagePath='/resources/images/courses/tn2/040-mean-stack.jpg' where id = 40 ;

update dmn_course_list set  level = 'Intermediate', imagePath='/resources/images/courses/tn1/041-spring.jpg', 
compImagePath='/resources/images/courses/tn2/041-spring.jpg' where id = 41 ;

update dmn_course_list set  level = 'Intermediate', imagePath='/resources/images/courses/tn1/042-hibernate.jpg', 
compImagePath='/resources/images/courses/tn2/042-hibernate.jpg' where id = 42 ;

update dmn_course_list set  level = 'Intermediate', imagePath='/resources/images/courses/tn1/043-ruby-on-rails.jpg', 
compImagePath='/resources/images/courses/tn2/043-ruby-on-rails.jpg' where id = 43 ;

update dmn_course_list set  level = 'Intermediate', imagePath='/resources/images/courses/tn1/044-python-django.jpg', 
compImagePath='/resources/images/courses/tn2/044-python-django.jpg' where id = 44 ;

update dmn_course_list set  level = 'Intermediate', imagePath='/resources/images/courses/tn1/045-jquery.jpg', 
compImagePath='/resources/images/courses/tn2/045-jquery.jpg' where id = 45 ;

update dmn_course_list set  level = 'Intermediate', imagePath='/resources/images/courses/tn1/046-struts.jpg', 
compImagePath='/resources/images/courses/tn2/046-struts.jpg', course_name='Struts' where id = 46 ;

update dmn_course_list set  level = 'Intermediate', imagePath='/resources/images/courses/tn1/047-android.jpg', 
compImagePath='/resources/images/courses/tn2/047-android.jpg' where id = 47 ;

update dmn_course_list set  level = 'Intermediate', imagePath='/resources/images/courses/tn1/048-msbi.jpg', 
compImagePath='/resources/images/courses/tn2/048-msbi.jpg' where id = 48 ;

update dmn_course_list set   level = 'Beginner', imagePath='/resources/images/courses/tn1/049-iot.jpg', 
compImagePath='/resources/images/courses/tn2/049-iot.jpg' where id = 49 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/050-adobe-photoshop.jpg', 
compImagePath='/resources/images/courses/tn2/050-adobe-photoshop.jpg' where id = 50 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/051-coreldraw.jpg', 
compImagePath='/resources/images/courses/tn2/051-coreldraw.jpg' where id = 51 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/052-adobe-illustrator.jpg', 
compImagePath='/resources/images/courses/tn2/052-adobe-illustrator.jpg' where id = 52 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/053-adobe-after-effects.jpg', 
compImagePath='/resources/images/courses/tn2/053-adobe-after-effects.jpg', keywords='adobe after effects training', courseDesc='adobe after effects',relatedCourses='1,2,4' where id = 53 ;

update dmn_course_list set  category='Development', level = 'Beginner', imagePath='/resources/images/courses/tn1/054-oracle-applications.jpg', 
compImagePath='/resources/images/courses/tn2/054-oracle-applications.jpg' where id = 54 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/055-sap-business-objects.jpg', 
compImagePath='/resources/images/courses/tn2/055-sap-business-objects.jpg' where id = 55 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/056-sap-abap.jpg', 
compImagePath='/resources/images/courses/tn2/056-sap-abap.jpg' where id = 56 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/057-sap-business-intelligence.jpg', 
compImagePath='/resources/images/courses/tn2/057-sap-business-intelligence.jpg' where id = 57 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/058-sap-hana.jpg', 
compImagePath='/resources/images/courses/tn2/058-sap-hana.jpg' where id = 58 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/059-sap-testing.jpg', 
compImagePath='/resources/images/courses/tn2/059-sap-testing.jpg' where id = 59 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/060-qlikview.jpg', 
compImagePath='/resources/images/courses/tn2/060-qlikview.jpg' where id = 60 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/061-informatica.jpg', 
compImagePath='/resources/images/courses/tn2/061-informatica.jpg' where id = 61 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/062-tableau.jpg', 
compImagePath='/resources/images/courses/tn2/062-tableau.jpg' where id = 62 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/063-adobe-phone-gap.jpg', 
compImagePath='/resources/images/courses/tn2/063-adobe-phone-gap.jpg' where id = 63 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/064-ethical-hacking.jpg', 
compImagePath='/resources/images/courses/tn2/064-ethical-hacking.jpg' where id = 64 ;

update dmn_course_list set  level = 'Beginner', imagePath='/resources/images/courses/tn1/065-jmeter.jpg', 
compImagePath='/resources/images/courses/tn2/065-jmeter.jpg' where id = 65 ;

update dmn_course_list set level = 'Intermediate', imagePath='/resources/images/courses/tn1/066-selenium.jpg', 
compImagePath='/resources/images/courses/tn2/066-selenium.jpg' where id = 66 ;

update dmn_course_list set level = 'Intermediate', imagePath='/resources/images/courses/tn1/067-appium.jpg', 
compImagePath='/resources/images/courses/tn2/067-appium.jpg' where id = 67 ;

update dmn_course_list set level = 'Intermediate', imagePath='/resources/images/courses/tn1/068-hadoop-hive.jpg', 
compImagePath='/resources/images/courses/tn2/068-hadoop-hive.jpg' where id = 68 ;

update dmn_course_list set level = 'Intermediate', imagePath='/resources/images/courses/tn1/069-hadoop-pig.jpg', 
compImagePath='/resources/images/courses/tn2/069-hadoop-pig.jpg' where id = 69 ;

update dmn_course_list set level = 'Intermediate', imagePath='/resources/images/courses/tn1/070-hadoop-spark.jpg', 
compImagePath='/resources/images/courses/tn2/070-hadoop-spark.jpg' where id = 70 ;

update dmn_course_list set level = 'Intermediate', imagePath='/resources/images/courses/tn1/071-storage-testing.jpg', 
compImagePath='/resources/images/courses/tn2/071-storage-testing.jpg' where id = 71 ;

update dmn_course_list set  level = 'Advanced', imagePath='/resources/images/courses/tn1/072-cloud-testing.jpg', 
compImagePath='/resources/images/courses/tn2/072-cloud-testing.jpg' where id = 72 ;

update dmn_course_list set  level = 'Advanced', imagePath='/resources/images/courses/tn1/073-security-testing.jpg', 
compImagePath='/resources/images/courses/tn2/073-security-testing.jpg' where id = 73 ;

update dmn_course_list set  level = 'Advanced', imagePath='/resources/images/courses/tn1/074-web-designing.jpg', 
compImagePath='/resources/images/courses/tn2/074-web-designing.jpg' where id = 74 ;





update dmn_course_list set category = 'Administration' where id = 17;
update dmn_course_list set category = 'Administration' where id = 18;
update dmn_course_list set category = 'Administration' where id = 19;

update dmn_course_list set category = 'Administration', sub_category = 'SQL Database' where id = 24;
update dmn_course_list set category = 'Administration', sub_category = 'NoSQL Database' where id = 25;

update dmn_course_list set category = 'Development', sub_category = 'Apps' where id = 54;

update dmn_course_list set sub_category = 'ETL Tools' where category = 'Reporting';

update dmn_course_list set sub_category = 'Mobile Application' where id = 47;

update dmn_course_list set sub_category = 'Mobile Application' where id = 48;


update dmn_course_list set sub_category = 'Mobile Testing' where id = 64;
update dmn_course_list set sub_category = 'Automation Tools' where id = 65;
update dmn_course_list set sub_category = 'Automation Tools' where id = 66;
update dmn_course_list set sub_category = 'Automation Tools' where id = 67;
update dmn_course_list set sub_category = 'SAP Testing' where id = 68;
update dmn_course_list set sub_category = 'Cloud Testing' where id = 69;
update dmn_course_list set sub_category = 'Storage Testing' where id = 70;
update dmn_course_list set sub_category = 'Security Testing' where id = 71;


update dmn_course_list set category = 'Administration' where id = 26;
update dmn_course_list set category = 'Administration' where id = 27;
update dmn_course_list set category = 'Administration' where id = 28;
update dmn_course_list set category = 'Administration' where id = 29;
update dmn_course_list set category = 'Administration' where id = 30;

update dmn_course_list set sub_category = 'NoSQL Database' where sub_category = 'NoSQL';

update dmn_course_list set sub_category = 'SQL Database' where sub_category = 'RDBMS';
update dmn_course_list set sub_category = 'Operating System' where sub_category = 'System';

/* adding for course updates on All courses page as on 2017-11-04*/

update dmn_course_list set category = 'Designing', sub_category = 'Web Designing' where id = 49;
update dmn_course_list set category = 'Designing', sub_category = 'Graphic Designing' where id = 50;
update dmn_course_list set category = 'Designing', sub_category = 'Graphic Designing' where id = 51;
update dmn_course_list set category = 'Designing', sub_category = 'Graphic Designing' where id = 52;
update dmn_course_list set category = 'Designing', sub_category = 'Graphic Designing' where id = 53;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/035-javascript.jpg' where id = 35;

/**/

update dmn_course_list set meta_keywords = 'aws solution architect associate training', meta_description = 'aws solution architect associate training' where id = 1; 


/****/

update dmn_course_list set course_identifier = 'aws-solution-architect-associate' where id = 1;
update dmn_course_list set course_identifier = 'aws-solution-architect-professional' where id = 2;
update dmn_course_list set course_identifier = 'aws-developer-associate' where id = 3;
update dmn_course_list set course_identifier = 'aws-devops-engineer-professional' where id = 4;
update dmn_course_list set course_identifier = 'microsoft-azure-administration' where id = 5;
update dmn_course_list set course_identifier = 'microsoft-azure-development' where id = 6;
update dmn_course_list set course_identifier = 'openstack-administration' where id = 7;
update dmn_course_list set course_identifier = 'salesforce-administration' where id = 8;
update dmn_course_list set course_identifier = 'salesforce-development' where id = 9;
update dmn_course_list set course_identifier = 'devops-jenkins' where id = 10;
update dmn_course_list set course_identifier = 'devops-docker ' where id = 11;
update dmn_course_list set course_identifier = 'devops-puppet' where id = 12;
update dmn_course_list set course_identifier = 'devops-chef' where id = 13;
update dmn_course_list set course_identifier = 'devops-ansible' where id = 14;
update dmn_course_list set course_identifier = 'redhat-linux' where id = 15;
update dmn_course_list set course_identifier = 'microsoft-windows-mcse' where id = 16;
update dmn_course_list set course_identifier = 'ccna' where id = 17;
update dmn_course_list set course_identifier = 'ccie' where id = 18;
update dmn_course_list set course_identifier = 'ccsp' where id = 19;
update dmn_course_list set course_identifier = 'oracle-weblogic-administration' where id = 20;
update dmn_course_list set course_identifier = 'ibm-was-administration' where id = 21;
update dmn_course_list set course_identifier = 'ibm-websphere-mq-administration' where id = 22;
update dmn_course_list set course_identifier = 'redhat-jboss-application-server' where id = 23;
update dmn_course_list set course_identifier = 'mysql' where id = 24;
update dmn_course_list set course_identifier = 'oracle-database-administration' where id = 25;
update dmn_course_list set course_identifier = 'postgre-sql-server' where id = 26;
update dmn_course_list set course_identifier = 'microsoft-sql-server' where id = 27;
update dmn_course_list set course_identifier = 'mongodb' where id = 28;
update dmn_course_list set course_identifier = 'apache-cassandra' where id = 29;
update dmn_course_list set course_identifier = 'apache-couchdb' where id = 30;
update dmn_course_list set course_identifier = 'java' where id = 31;
update dmn_course_list set course_identifier = 'python' where id = 32;
update dmn_course_list set course_identifier = 'shell-programming' where id = 33;
update dmn_course_list set course_identifier = ' ruby' where id = 34;
update dmn_course_list set course_identifier = 'javascript' where id = 35;
update dmn_course_list set course_identifier = 'php' where id = 36;
update dmn_course_list set course_identifier = 'scala' where id = 37;
update dmn_course_list set course_identifier = 'node-js' where id = 38;
update dmn_course_list set course_identifier = 'angular-js' where id = 39;
update dmn_course_list set course_identifier = 'mean-stack' where id = 40;
update dmn_course_list set course_identifier = 'spring' where id = 41;
update dmn_course_list set course_identifier = 'hibernate' where id = 42;
update dmn_course_list set course_identifier = 'ruby-on-rails' where id = 43;
update dmn_course_list set course_identifier = 'python-django' where id = 44;
update dmn_course_list set course_identifier = 'jquery' where id = 45;
update dmn_course_list set course_identifier = 'struts' where id = 46;
update dmn_course_list set course_identifier = 'android' where id = 47;
update dmn_course_list set course_identifier = 'adobe-phone-gap' where id = 48;
update dmn_course_list set course_identifier = 'html5' where id = 49;
update dmn_course_list set course_identifier = 'adobe-photoshop' where id = 50;
update dmn_course_list set course_identifier = 'coreldraw' where id = 51;
update dmn_course_list set course_identifier = 'adobe-illustrator' where id = 52;
update dmn_course_list set course_identifier = 'adobe-after-effects' where id = 53;
update dmn_course_list set course_identifier = 'oracle-applications' where id = 54;
update dmn_course_list set course_identifier = 'sap-business-objects' where id = 55;
update dmn_course_list set course_identifier = 'sap-abap' where id = 56;
update dmn_course_list set course_identifier = 'sap-business-intelligence' where id = 57;
update dmn_course_list set course_identifier = 'sap-hana' where id = 58;
update dmn_course_list set course_identifier = 'qlikview' where id = 59;
update dmn_course_list set course_identifier = 'business-objects' where id = 60;
update dmn_course_list set course_identifier = 'informatica' where id = 61;
update dmn_course_list set course_identifier = 'msbi' where id = 62;
update dmn_course_list set course_identifier = 'ethical-hacking' where id = 63;
update dmn_course_list set course_identifier = 'appium' where id = 64;
update dmn_course_list set course_identifier = 'jmeter' where id = 65;
update dmn_course_list set course_identifier = 'selenium' where id = 66;
update dmn_course_list set course_identifier = 'qtp-uft' where id = 67;
update dmn_course_list set course_identifier = 'sap-testing' where id = 68;
update dmn_course_list set course_identifier = 'cloud-testing' where id = 69;
update dmn_course_list set course_identifier = 'storage-testing' where id = 70;
update dmn_course_list set course_identifier = 'security-testing' where id = 71;
update dmn_course_list set course_identifier = 'hadoop-spark' where id = 72;
update dmn_course_list set course_identifier = 'hadoop-pig' where id = 73;
update dmn_course_list set course_identifier = 'hadoop-hive' where id = 74;
/***********/


update dmn_course_list set imagePath = '/resources/images/courses/tn1/001-aws-solution-architect-associate.jpg' where id = 1;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/002-aws-solution-architect-professional.jpg' where id = 2; 
update dmn_course_list set imagePath = '/resources/images/courses/tn1/003-aws-developer-associate.jpg' where id = 3;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/004-aws-devops-engineer-professional.jpg' where id = 4;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/005-microsoft-azure-administration.jpg' where id = 5;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/006-microsoft-azure-development.jpg' where id = 6;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/007-openstack-administration.jpg' where id = 7;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/008-salesforce-administration.jpg' where id = 8;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/009-salesforce-development.jpg' where id = 9;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/010-devops-jenkins.jpg' where id = 10;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/011-devops-docker.jpg' where id = 11;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/012-devops-puppet.jpg' where id = 12;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/013-devops-chef.jpg' where id = 13;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/014-devops-ansible.jpg' where id = 14;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/015-redhat-linux-administration.jpg' where id = 15;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/016-microsoft-windows-mcse.jpg' where id = 16;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/017-cisco-networking-ccna.jpg' where id = 17;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/018-cisco-networking-ccie.jpg' where id = 18;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/019-cisco-networking-ccie.jpg' where id = 19;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/020-oracle-weblogic-administration.jpg' where id = 20;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/021-ibm-was-administration.jpg' where id = 21;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/022-ibm-websphere-mq-administration.jpg' where id = 22;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/023-redhat-jboss-application-server.jpg' where id = 23;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/024-mysql-database-administration.jpg' where id = 24;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/025-oracle-database-administration.jpg' where id = 25;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/026-postgre-sql-server-administration.jpg' where id = 26;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/027-microsoft-sql-server-administration.jpg' where id = 27;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/028-mongodb.jpg' where id = 28;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/029-apache-cassandra.jpg' where id = 29;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/030-apache-couchdb.jpg' where id = 30;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/031-java.jpg' where id = 31;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/032-python.jpg' where id = 32;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/033-shell-programming.jpg' where id = 33;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/034-ruby.jpg' where id = 34;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/035-javascript.jpg' where id = 35;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/036-php.jpg' where id = 36;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/037-scala.jpg' where id = 37;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/038-node-js.jpg' where id = 38;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/039-angular-js.jpg' where id = 39;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/040-mean-stack.jpg' where id = 40;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/041-spring.jpg' where id = 41;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/042-hibernate.jpg' where id = 42;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/043-ruby-on-rails.jpg' where id = 43; 
update dmn_course_list set imagePath = '/resources/images/courses/tn1/044-python-django.jpg' where id = 44;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/045-jquery.jpg' where id = 45;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/046-struts.jpg' where id = 46;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/047-android.jpg' where id = 47;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/048-adobe-phone-gap.jpg' where id = 48;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/049-html5.jpg' where id = 49;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/050-adobe-photoshop.jpg' where id = 50;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/051-coreldraw.jpg' where id = 51;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/052-adobe-illustrator.jpg' where id = 52;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/053-adobe-after-effects.jpg' where id = 53;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/054-oracle-applications.jpg' where id = 54;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/055-sap-business-objects.jpg' where id = 55;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/056-sap-abap.jpg' where id = 56;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/057-sap-business-intelligence.jpg' where id = 57;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/058-sap-hana.jpg' where id = 58;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/059-qlikview.jpg' where id = 59;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/060-business-objects.jpg' where id = 60;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/061-informatica.jpg' where id = 61;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/062-microsoft-business-intelligence.jpg' where id = 62;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/063-ethical-hacking.jpg' where id = 63;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/064-appium.jpg' where id = 64;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/065-jmeter.jpg' where id = 65;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/066-selenium.jpg' where id = 66;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/067-hp-uft.jpg' where id = 67;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/068-sap-testing.jpg' where id = 68;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/069-cloud-testing.jpg' where id = 69;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/070-storage-testing.jpg' where id = 70;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/071-security-testing.jpg' where id = 71;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/072-hadoop-spark.jpg' where id = 72;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/073-hadoop-pig.jpg' where id = 73;
update dmn_course_list set imagePath = '/resources/images/courses/tn1/074-hadoop-hive.jpg' where id = 74;


update dmn_course_list set sub_category = 'SQL Database' where id = 25;
update dmn_course_list set category = 'Others', sub_category = 'Security' where id = 63;
 