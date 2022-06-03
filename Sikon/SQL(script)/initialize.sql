DROP TABLE coupon CASCADE CONSTRAINTS;
DROP TABLE couponholder CASCADE CONSTRAINTS;
DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE bookmark CASCADE CONSTRAINTS;
DROP TABLE ingredient CASCADE CONSTRAINTS;
DROP TABLE recipe CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE users CASCADE CONSTRAINTS;
DROP TABLE license CASCADE CONSTRAINTS;
DROP TABLE career CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE purchase CASCADE CONSTRAINTS;
DROP TABLE cart CASCADE CONSTRAINTS;
DROP TABLE cook CASCADE CONSTRAINTS;
DROP TABLE heart CASCADE CONSTRAINTS;
DROP TABLE wish CASCADE CONSTRAINTS;
DROP TABLE apply CASCADE CONSTRAINTS;

DROP SEQUENCE seq_coupon_coupon_no;
DROP SEQUENCE seq_couponhodler_issue_no;
DROP SEQUENCE seq_notice_notice_no;
DROP SEQUENCE seq_bookmark_no;
DROP SEQUENCE seq_ingredient_no;
DROP SEQUENCE seq_recipe_no;
DROP SEQUENCE seq_img_no;
DROP SEQUENCE seq_review_no;
DROP SEQUENCE seq_license_license_no;
DROP SEQUENCE seq_career_career_no;
DROP SEQUENCE seq_product_prod_no;
DROP SEQUENCE seq_purchase_tran_no;
DROP SEQUENCE seq_cart_cart_no;
DROP SEQUENCE seq_cook_cook_no;
DROP SEQUENCE seq_wish_wish_no;
DROP SEQUENCE seq_heart_heart_no;
DROP SEQUENCE seq_apply_apply_no;

CREATE SEQUENCE seq_coupon_coupon_no INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_couponhodler_issue_no INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_notice_notice_no INCREMENT BY 1 START WITH 10000;
CREATE  SEQUENCE  seq_recipe_no	 INCREMENT  BY  1  START  WITH  10000;
CREATE  SEQUENCE  seq_ingredient_no	 INCREMENT  BY  1  START  WITH  10000;
CREATE  SEQUENCE  seq_bookmark_no	 INCREMENT  BY  1  START  WITH  10000;
CREATE  SEQUENCE  seq_review_no	 INCREMENT  BY  1  START  WITH  10000;
CREATE  SEQUENCE  seq_img_no	 INCREMENT  BY  1  START  WITH  10000;
CREATE SEQUENCE seq_license_license_no INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_career_career_no INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_product_prod_no 	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_purchase_tran_no 	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_cart_cart_no 		INCREMENT BY 1 START WITH 10000;
CREATE  SEQUENCE  seq_cook_cook_no	 INCREMENT  BY  1  START  WITH  10000;
CREATE SEQUENCE seq_wish_wish_no	  INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_heart_heart_no	  INCREMENT BY 1 START WITH 1;
CREATE  SEQUENCE  seq_apply_apply_no	 INCREMENT  BY  1  START  WITH  10000;

CREATE TABLE users ( 
	user_id 	VARCHAR2(50)	NOT NULL,
	user_name 	VARCHAR2(20)	NOT NULL,
	password 	VARCHAR2(30)	NOT NULL,
	user_birth 	VARCHAR2(20),
	user_nickname 	VARCHAR2(40)	UNIQUE  NOT NULL,
	user_image 	VARCHAR2(100)	NOT NULL,
	user_addr 	VARCHAR2(500),
	role 		VARCHAR2(20) 	DEFAULT 'user'	NOT NULL,
	user_phone 	VARCHAR2(20)	UNIQUE,
	holdpoint 	NUMBER(38)	DEFAULT '0' NOT NULL,
	mentor_apply 	VARCHAR2(20)	NOT NULL,
	user_regdate 	DATE 		NOT NULL,
	quit_date 	DATE,
	quit_status 	VARCHAR2(20)	NOT NULL,
	PRIMARY KEY(user_id)
);

CREATE TABLE license ( 
	license_no 	NUMBER(38) 	NOT NULL 	PRIMARY KEY,
	license_name 	VARCHAR2(30) 	NOT NULL,
	license_institution 	VARCHAR2(40) 	NOT NULL,
	license_date 	DATE 		NOT NULL,
	user_id 		VARCHAR2(50) 	NOT NULL 	REFERENCES users(user_id) ON DELETE CASCADE	
);

CREATE TABLE career ( 
	career_no 	NUMBER(38)	NOT NULL,
	company 	VARCHAR2(30) 	NOT NULL,
	start_date 		DATE 		NOT NULL,
	end_date 		DATE 		NOT NULL,
	career_experience 	VARCHAR2(1000) 	NOT NULL,
	user_id 		VARCHAR2(50)	NOT NULL 	REFERENCES users(user_id) ON DELETE CASCADE,
	PRIMARY KEY(career_no)	
);

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

CREATE TABLE recipe(
	recipe_no NUMBER 	NOT NULL,
	writer_nickname  VARCHAR2(50) REFERENCES  users(user_nickname),
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
	serial_no 			VARCHAR2(50) 	NOT NULL, 
	receiver_name 		VARCHAR2(20)  	NOT NULL,  
	receiver_phone 		VARCHAR2(20)  	NOT NULL, 
	receiver_email 		VARCHAR2(20)  	NOT NULL, 
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

CREATE TABLE cook ( 
	cook_no 			 			NUMBER 		 		NOT NULL,
	cook_name 			 	VARCHAR2(100)  	NOT NULL,
	cook_filename VARCHAR2(200),
	cook_brief 		 		VARCHAR2(200),
	cook_difficuty			   		     VARCHAR2(20)                   NOT NULL,
	cook_price 				 NUMBER(10)  NOT NULL,	
	cook_theme 			 	VARCHAR2(20) NOT NULL,	
	apl_startime     				 VARCHAR2(200) NOT NULL,	
	apl_endtime         			 VARCHAR2(200) NOT NULL,	
	cook_recruit         			 NUMBER    not null,
	start_time         			 VARCHAR2(200) NOT NULL,	
	end_time         			 VARCHAR2(200) NOT NULL,		
	cook_location         			 VARCHAR2(200)    not null,
	cook_regdate         			 DATE    not null,	
	cook_video         			VARCHAR2(200)  ,
	cook_stock         			 NUMBER    not null,
	heart_hit 					 NUMBER    default 0  not null,
	PRIMARY KEY(cook_no)
);

CREATE TABLE apply ( 
	apply_no 			 		NUMBER 			 NOT  NULL,
	cook_no 			 		NUMBER		 NOT  NULL  REFERENCES  cook(cook_no),
	applier_id 			 	VARCHAR2(50)	 NOT  NULL  REFERENCES  users(user_id),
	payment_option	 	VARCHAR(50),	
	apply_status 	VARCHAR(20),
	cook_status         			 NUMBER  not null,
	check_date 		 	DATE,	
	PRIMARY KEY(apply_no)
);

CREATE TABLE wish(
	wish_no				  NUMBER 			  	  NOT NULL,
	cook_no 			 		NUMBER		 NOT  NULL  REFERENCES  cook(cook_no),
	user_id				  VARCHAR2(50)	    NOT NULL REFERENCES     users(user_id),
	cook_status NUMBER,
	cook_name 			 	VARCHAR2(100)  	NOT NULL,
	cook_filename VARCHAR2(200),
	cook_price 				 NUMBER(10)  NOT NULL,
		PRIMARY KEY(wish_no)
);

CREATE TABLE heart (
	heart_no				  NUMBER 			  	  NOT NULL,
	cook_no 			 		NUMBER		 NOT  NULL  REFERENCES  cook(cook_no),
	user_id				  VARCHAR2(50)	    NOT NULL REFERENCES     users(user_id),
	heart_check                           NUMBER(20)         DEFAULT 0              NOT NULL,	
	PRIMARY KEY(heart_no)
);

CREATE TABLE review(
	review_no  NUMBER 		 		NOT NULL,
	writer_nickname   VARCHAR2(50)   	REFERENCES  users(user_nickname),
	review_content         VARCHAR2(400)   NOT NULL,
	review_regdate        DATE NOT NULL,
	review_category        VARCHAR2(20) NOT NULL,
	review_img    VARCHAR2(100),
	recipe_no   NUMBER(16)    REFERENCES  recipe(recipe_no),
	prod_no   NUMBER(16)     REFERENCES  product(prod_no),
	tran_no   NUMBER(16)     REFERENCES  purchase(tran_no),
	cook_no   NUMBER(16)     REFERENCES  cook(cook_no),
	apply_no   NUMBER(16)    REFERENCES  apply(apply_no),
	PRIMARY KEY(review_no)
);


INSERT 
INTO users ( user_id, user_name, password, user_birth, user_nickname, user_image, user_addr, role, user_phone, holdpoint, mentor_apply, user_regdate, quit_date, quit_status  )
VALUES ( 'user@naver.com', 'user', '1234', '19941111', 'user', 'ee.jpg', '서울시 서초구', default, '01022249988', default, 'N', SYSDATE, to_date('2013/01/14', 'YYYY/MM/DD'), 'N');

INSERT all
INTO users
VALUES ( 'admin@naver.com', 'admin', '1234', '19941111', 'admin', 'ee.jpg', '서울시 서초구', 'admin', '01023341200', default, 'Y', SYSDATE, to_date('2013/01/14', 'YYYY/MM/DD'), 'Y')
INTO license
VALUES ( seq_license_license_no.nextval, '2종보통', '강남구청', to_date('2017/05/24', 'YYYY/MM/DD'), 'admin@naver.com' )
INTO career
VALUES (  seq_career_career_no.nextval, '회사', to_date('2011/05/24', 'YYYY/MM/DD'), to_date('2012/05/24', 'YYYY/MM/DD'), '싸이', 'admin@naver.com')
select *from dual;

INSERT all
INTO users
VALUES ( 'mentor@naver.com', 'mentor', '1234', '19941111', 'mentor', 'ee.jpg', '서울시 서초구', 'mentor', '01023341000', default, 'Y', SYSDATE, to_date('2013/01/14', 'YYYY/MM/DD'), 'Y')
INTO license
VALUES ( seq_license_license_no.nextval, '1종보통', '강동구청', to_date('2018/05/24', 'YYYY/MM/DD'), 'mentor@naver.com' )
INTO career
VALUES (  seq_career_career_no.nextval, '주식회사', to_date('2013/05/24', 'YYYY/MM/DD'), to_date('2015/05/24', 'YYYY/MM/DD'), '싸이', 'mentor@naver.com')
select *from dual;

INSERT 
INTO coupon(coupon_no, coupon_name, discount_rate, discount_value, coupon_regdate)
VALUES (seq_coupon_coupon_no.NEXTVAL, '50% 할인쿠폰', 0.5, 0, SYSDATE);

INSERT 
INTO couponholder(issue_no, coupon_no, holder_id, start_date, end_date, issue_status) 
VALUES (seq_couponhodler_issue_no.NEXTVAL, 10000, 'mentor@naver.com', '2022/05/12', '2022/06/30', '사용가능');

INSERT
INTO product( prod_no , prod_name , prod_price, prod_detail, prod_disrate, prod_disprice, prod_thumbnail, prod_content, prod_stock, prod_theme, prod_status, coupon_apply, prod_regdate) 
VALUES (seq_product_prod_no.NEXTVAL , '계란', 3000, '계란 디테일', 0.10, 2700, '계란thumbnail.jpg', '계란content', 50, 'TW', 'Y', 'Y', SYSDATE );

INSERT
INTO purchase( tran_no , prod_no, user_id, serial_no, receiver_name, receiver_phone, receiver_email, quantity, divy_addr, divy_message, used_coupon, used_point, earn_point, orderdate, payment_opt, divy_status, invoice_num, divy_fee) 
VALUES (seq_purchase_tran_no.NEXTVAL , 10000, 'mentor@naver.com', '2022060310000', '힙쟁이', '01012345678', 'heap@naver.com', 5, '비트캠프', '8층으로 가져다주세요', '10% 할인쿠폰', 500, 270, SYSDATE, 'KA', '001', '송장번호', 3000);

INSERT
INTO cart( cart_no , prod_no, user_id, quantity) 
VALUES (seq_cart_cart_no.NEXTVAL , 10000, 'mentor@naver.com', 5);

INSERT
INTO cook(cook_no, cook_name , cook_filename, cook_brief , cook_difficuty, cook_price, cook_theme, apl_startime ,apl_endtime, cook_recruit, start_time,  end_time , cook_location , cook_regdate, cook_video,cook_stock,heart_hit  )
VALUES (seq_cook_cook_no.nextval, '예다의 계란 후라이 쿠킹클래스', 'yyy.jpg', '진짜 쉬워요', '초급', 14000, '한식', SYSDATE, SYSDATE, 5, SYSDATE, SYSDATE, '강남구 비트캠프', SYSDATE, 'aaa.jpg', 20, 0);

INSERT 
INTO apply(apply_no, cook_no, applier_id, payment_option, apply_status, cook_status, check_date)
VALUES (seq_apply_apply_no.nextval, '10000', 'mentor@naver.com', '카카오페이', '100', 10, '2022/06/30');

INSERT
INTO heart(heart_no, cook_no, user_id) 
VALUES(seq_heart_heart_no.nextval, '10000', 'mentor@naver.com');

INSERT
INTO wish( wish_no , cook_no, user_id, cook_status, cook_name ,cook_filename ,cook_price)
VALUES (seq_wish_wish_no.NEXTVAL, 10000, 'mentor@naver.com', 5, '예다의 계란 후라이 쿠킹클래스', 'yyy.jpg', 14000);

INSERT 
INTO notice(notice_no, notice_title, notice_content, notice_image, notice_date) 
VALUES (seq_notice_notice_no.NEXTVAL, '공지합니다', '공지내용입니다', '공지.jpg', SYSDATE);

INSERT ALL
INTO recipe VALUES (seq_recipe_no.nextval ,'mentor', '11', '11', '11', null, '11', '11', 1, 'd' , SYSDATE, 0)
INTO ingredient VALUES(seq_ingredient_no.nextval, '11', '11', seq_recipe_no.nextval)
SELECT * FROM dual;

INSERT
INTO ingredient
VALUES (seq_ingredient_no.nextval ,'야채' , '1g', '10000');

INSERT
INTO bookmark
VALUES (seq_bookmark_no.nextval ,'10000' , 'mentor@naver.com');

INSERT
INTO review
VALUES (seq_review_no.nextval  ,'mentor' , '리뷰내용임', SYSDATE, 'RE', 'aa.jpg', 10000, NULL, NULL, NULL, NULL);

COMMIT;