DROP TABLE coupon;
DROP TABLE couponholder;
DROP TABLE notice;
DROP TABLE users;
DROP TABLE license;
DROP TABLE career;
DROP TABLE bookmark;
DROP TABLE ingredient;
DROP TABLE recipe;
DROP TABLE product;
DROP TABLE purchase;
DROP TABLE cart;
DROP TABLE class;
DROP TABLE heart;
DROP TABLE wish;
DROP TABLE apply;
DROP TABLE reviewimage;
DROP TABLE review;

DROP SEQUENCE seq_coupon_coupon_no;
DROP SEQUENCE seq_couponhodler_issue_no;
DROP SEQUENCE seq_notice_notice_no;
DROP SEQUENCE seq_license_license_no;
DROP SEQUENCE seq_career_career_no;
DROP SEQUENCE seq_bookmark_no;
DROP SEQUENCE seq_ingredient_no;
DROP SEQUENCE seq_recipe_no;
DROP SEQUENCE seq_product_prod_no;
DROP SEQUENCE seq_purchase_tran_no;
DROP SEQUENCE seq_cart_cart_no;
DROP SEQUENCE seq_class_class_no;
DROP SEQUENCE seq_wish_wish_no;
DROP SEQUENCE seq_heart_heart_no;
DROP SEQUENCE seq_apply_apply_no;
DROP SEQUENCE seq_img_no;
DROP SEQUENCE seq_review_no;

CREATE SEQUENCE seq_coupon_coupon_no 	 INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_couponhodler_issue_no 	 INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_notice_notice_no  	 INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_license_license_no	 INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_career_career_no	 INCREMENT BY 1 START WITH 10000;
CREATE  SEQUENCE  seq_recipe_no	  	 INCREMENT  BY  1  START  WITH  10000;
CREATE  SEQUENCE  seq_ingredient_no	 INCREMENT  BY  1  START  WITH  10000;
CREATE  SEQUENCE  seq_bookmark_no	 INCREMENT  BY  1  START  WITH  10000;
CREATE SEQUENCE seq_product_prod_no 	 INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_purchase_tran_no 	 INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_cart_cart_no 		 INCREMENT BY 1 START WITH 10000;
CREATE  SEQUENCE  seq_cook_cook_no 	 INCREMENT BY  1  START  WITH  10000;
CREATE  SEQUENCE  seq_class_class_no	 INCREMENT  BY  1  START  WITH  10000;
CREATE SEQUENCE seq_wish_wish_no 		 INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_heart_heart_no	 INCREMENT BY 1 START WITH 1;
CREATE  SEQUENCE  seq_apply_apply_no;	 INCREMENT  BY  1  START  WITH  10000;
CREATE  SEQUENCE  seq_review_no		 INCREMENT  BY  1  START  WITH  10000;
CREATE  SEQUENCE  seq_img_no		 INCREMENT  BY  1  START  WITH  10000;


CREATE TABLE coupon ( 
	coupon_no NUMBER NOT NULL,
	coupon_name VARCHAR2(100) NOT NULL,
	discount_rate NUMBER(3,2) NOT NULL,
	discount_value NUMBER NOT NULL,
	coupon_regdate DATE NOT NULL,
	PRIMARY KEY(coupon_no)
);

CREATE TABLE couponholder ( 
	issue_no NUMBER NOT NULL,
	coupon_no NUMBER NOT NULL,
	holder_id VARCHAR2(50) NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	issue_status VARCHAR2(20) NOT NULL,
	PRIMARY KEY(issue_no)
);

CREATE TABLE notice ( 
	notice_no NUMBER NOT NULL,
	notice_title  VARCHAR2(100) NOT NULL,
	notice_content VARCHAR2(2000) NOT NULL,
	notice_date DATE NOT NULL,
	notice_image VARCHAR2(100),
	PRIMARY KEY(notice_no) 
);

CREATE TABLE users ( 
	user_id 	VARCHAR2(50)	NOT NULL,
	user_name 	VARCHAR2(20)	NOT NULL,
	password 	VARCHAR2(30)	NOT NULL,
	user_birth	VARCHAR2(20),
	user_nickname	VARCHAR2(40)	UNIQUE  NOT NULL,
	user_image	VARCHAR2(100)	NOT NULL,
	user_addr	VARCHAR2(500),
	role 		VARCHAR2(20) 	DEFAULT 'user'	NOT NULL,
	user_phone	VARCHAR2(20)	UNIQUE,
	holdpoint	NUMBER(38)	NOT NULL,
	mentor_apply	VARCHAR2(20)	NOT NULL,
	user_regdate 	DATE		NOT NULL,
	quit_date	DATE,
	quit_status	VARCHAR2(20)	NOT NULL,
	PRIMARY KEY(user_id)
);

CREATE TABLE license ( 
	license_no 	NUMBER(38)	NOT NULL	PRIMARY KEY,
	license_name 	VARCHAR2(30)	NOT NULL,
	license_institution 	VARCHAR2(40)	NOT NULL,
	license_date	DATE		NOT NULL,
	user_id 		VARCHAR2(50)	NOT NULL	REFERENCES users(user_id)	
);


CREATE TABLE career ( 
	career_no 	NUMBER(38)	NOT NULL,
	company		VARCHAR2(30)	NOT NULL,
	start_date		DATE		NOT NULL,
	end_date		DATE		NOT NULL,
	career_experience	VARCHAR2(1000)	NOT NULL,
	user_id 		VARCHAR2(50)	NOT NULL	REFERENCES users(user_id),
	PRIMARY KEY(career_no)	
);

CREATE TABLE recipe(
recipe_no NUMBER 	NOT NULL,
writer_nickname  VARCHAR2(50) REFERENCES  users(user_id),
recipe_name  VARCHAR2(100) NOT NULL,
recipe_detail  VARCHAR2(200)  NOT NULL,
recipe_img VARCHAR2(200) NOT NULL,
recipe_video VARCHAR2(200),
recipe_difficulty VARCHAR2(20) NOT NULL,
recipe_theme VARCHAR2(20) NOT NULL,
cooking_time NUMBER NOT NULL,		 
recipe_order  CLOB NOT NULL,
recipe_regdate  DATE NOT NULL,
review_num  NUMBER NOT NULL,
PRIMARY KEY(recipe_no)
);

CREATE TABLE ingredient(
ingredient_no   NUMBER  NOT NULL,
ingredient_name  VARCHAR2(50)  NOT NULL,
ingredient_amount  VARCHAR2(30)  NOT NULL,
recipe_no   NUMBER  REFERENCES recipe(recipe_no) ,
PRIMARY KEY(ingredient_no)
);

CREATE TABLE bookmark(
bookmark_no  NUMBER NOT NULL,
recipe_no NUMBER REFERENCES recipe(recipe_no),
user_id   VARCHAR2(50)   	REFERENCES  users(user_id),
PRIMARY KEY(bookmark_no)
);

CREATE TABLE product ( 
	prod_no 			NUMBER 		NOT NULL, 
	prod_name 		VARCHAR2(100) 	NOT NULL, 
	prod_price 		NUMBER 		NOT NULL, 
	prod_detail 		VARCHAR2(200), 
	prod_disrate 		NUMBER(3,2),  
	prod_disprice 		NUMBER, 
	prod_thumbnail 		VARCHAR2(500) 	NOT NULL, 
	prod_content 		CLOB 		NOT NULL, 
	prod_stock 		NUMBER	 	NOT NULL, 
	prod_theme 		VARCHAR2(10) 	NOT NULL, 
	prod_status 		VARCHAR2(10) 	NOT NULL, 
	coupon_apply 		VARCHAR2(10) 	NOT NULL, 
	prod_regdate 		DATE, 
	PRIMARY KEY(prod_no)
);

CREATE TABLE purchase ( 
	tran_no 			NUMBER 		NOT NULL, 
	prod_no 			NUMBER  	NOT NULL 	REFERENCES 	product(prod_no), 
	user_id 	 		VARCHAR2(50)  	NOT NULL 	REFERENCES 	users(user_id), 
	receiver_name 		VARCHAR2(20)  	NOT NULL,  
	receiver_phone 		VARCHAR2(20)  	NOT NULL, 
	receiver_email 		VARCHAR2(50)  	NOT NULL, 
	quantity 			NUMBER, 
	divy_addr 		VARCHAR2(500) 	NOT NULL, 
	divy_message 		VARCHAR2(200), 
	used_coupon 		VARCHAR2(50), 
	used_point 			NUMBER, 
	earn_point 			NUMBER 	NOT NULL,  
	orderdate 		DATE 		NOT NULL,  
	payment_opt 		VARCHAR2(20) 	NOT NULL, 
	divy_status 		VARCHAR2(20) 	NOT NULL, 
	invoice_num 		VARCHAR2(100), 	
	divy_fee 			NUMBER, 
	PRIMARY KEY(tran_no)
);


CREATE TABLE cart ( 
	cart_no 			NUMBER 		NOT NULL, 
	prod_no 			NUMBER  	NOT NULL 	REFERENCES 	product(prod_no), 
	user_id 	 		VARCHAR2(50)  	NOT NULL 	REFERENCES 	users(user_id), 
	quantity 			NUMBER, 	
	PRIMARY KEY(cart_no)
);

CREATE TABLE class ( 
	class_no 			 			NUMBER 		 		NOT NULL,
	class_name 			 	VARCHAR2(100)  	NOT NULL,
	class_filename 			 		VARCHAR2(200),
	class_brief 		 		VARCHAR2(200),
	class_difficuty				VARCHAR2(20) NOT NULL,
	class_price 				 NUMBER(10)  NOT NULL,	
	class_theme 			 	VARCHAR2(20) NOT NULL,	
	apl_startime     			VARCHAR2(10),
	apl_endtime         			 DATE    not null,	
	class_recruit         			 NUMBER    not null,
	start_time         			 DATE    not null,
	end_time         			 DATE    not null,	
	class_location         			 VARCHAR2(200)    not null,
	class_regdate         			 DATE    not null,	
	class_video         			VARCHAR2(200)  ,
	PRIMARY KEY(class_no)
);

alter table class add(class_stock NUMBER not null);


CREATE TABLE apply ( 
	apply_no 			 		NUMBER 			 NOT  NULL,
	class_no 			 		NUMBER		 NOT  NULL  REFERENCES  class(class_no),
	applier_id 			 	VARCHAR2(50)	 NOT  NULL  REFERENCES  users(user_id),
	payment_option	 	VARCHAR(50),	
	apply_status 	VARCHAR(20),
	class_status         			 NUMBER  not null,
	check_date 		 	DATE,	
	PRIMARY KEY(apply_no)
);


CREATE TABLE wish(
	wish_no				  NUMBER 			  	  NOT NULL,
	class_no 			 		NUMBER		 NOT  NULL  REFERENCES  class(class_no),
	user_id				  VARCHAR2(50)	    NOT NULL REFERENCES     users(user_id),
	quantity 		NUMBER,
	class_name 			 	VARCHAR2(100)  	NOT NULL,
	class_filename 			 		VARCHAR2(200),
	class_price 				 NUMBER(10)  NOT NULL,
		PRIMARY KEY(wish_no)
);

CREATE TABLE heart (
	heart_no				  NUMBER 			  	  NOT NULL,
	class_no 			 		NUMBER		 NOT  NULL  REFERENCES  class(class_no),
	user_id				  VARCHAR2(50)	    NOT NULL REFERENCES     users(user_id),
	heart_check                           NUMBER(20)         DEFAULT 0              NOT NULL,	
	PRIMARY KEY(heart_no)
);

CREATE TABLE review(
review_no  NUMBER 		 		NOT NULL,
writer_id   VARCHAR2(50)   	REFERENCES  users(user_id),
review_content         VARCHAR2(400) NOT NULL,
review_regdate        DATE NOT NULL,
review_category        VARCHAR2(20) NOT NULL,
recipe_no   NUMBER(16)    NOT  NULL  REFERENCES  recipe(recipe_no),
prod_no   NUMBER(16)    NOT  NULL  REFERENCES  product(prod_no),
tran_no   NUMBER(16)    NOT  NULL  REFERENCES  purchase(tran_no),
class_no   NUMBER(16)    NOT  NULL  REFERENCES  class(class_no),
apply_no   NUMBER(16)    NOT  NULL  REFERENCES  apply(apply_no),
PRIMARY KEY(review_no)
);

CREATE TABLE reviewimage(
img_no  NUMBER   NOT NULL,
review_no  NUMBER  REFERENCES review(review_no),
img_name   VARCHAR2(600) NOT NULL,
PRIMARY KEY(img_no)
);


INSERT 
INTO users
VALUES ( 'admin', 'admin', '1234', '19980505', 'admin', 'aa.jpg', '수원', 'admin', '010-115-222',0,'n',sysdate,null,'n');  

INSERT INTO users 
VALUES ( 'user01', 'SCOTT', '1111', '19980505', 'user', 'aa.jpg', '수원', 'user', '010-111-222',0,'n',sysdate,null,'n');  

insert into product values (seq_product_prod_no.nextval,'자전거', 50000, '자전거 디테일', 0.10, 45000, '자전거thumbnail.jpg', '자전거content', 50, 'TW', 'Y', 'Y', to_date('2012/12/01', 'YYYY/MM/DD'));
insert into product values (seq_product_prod_no.nextval,'핸드크림', 76000, '핸드크림 디테일', 0.10, 60800, '핸드크림thumbnail.jpg', '핸드크림content', 50, 'TW', 'Y', 'Y', to_date('2012/12/02', 'YYYY/MM/DD'));
insert into product values (seq_product_prod_no.nextval,'텀블러', 32000, '텀블러 디테일', 0.10, 25600, '텀블러thumbnail.jpg', '텀블러content', 50, 'TW', 'Y', 'Y', to_date('2012/12/03', 'YYYY/MM/DD'));
insert into product values (seq_product_prod_no.nextval,'식빵', 3000, '식빵 디테일', 0.10, 2700, '식빵thumbnail.jpg', '식빵content', 50, 'TW', 'Y', 'Y', to_date('2012/12/04', 'YYYY/MM/DD'));
insert into product values (seq_product_prod_no.nextval,'커피믹스', 20000, '커피믹스 디테일', 0.10, 18000, '커피믹스thumbnail.jpg', '커피믹스content', 50, 'TW', 'Y', 'Y', to_date('2012/12/05', 'YYYY/MM/DD'));
insert into product values (seq_product_prod_no.nextval,'슬리퍼', 50000, '슬리퍼 디테일', 0.10, 45000, '슬리퍼thumbnail.jpg', '슬리퍼content', 50, 'TW', 'Y', 'Y', to_date('2012/12/06', 'YYYY/MM/DD'));
insert into product values (seq_product_prod_no.nextval,'초콜릿', 2000, '초콜릿 디테일', 0.10, 1800, '초콜릿thumbnail.jpg', '초콜릿content', 50, 'TW', 'Y', 'Y', to_date('2012/12/07', 'YYYY/MM/DD'));




commit;