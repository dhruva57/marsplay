DROP TABLE IF EXISTS users_dhruva;
DROP SEQUENCE IF EXISTS users_dhruva_seq;
CREATE SEQUENCE users_dhruva_seq;

CREATE TABLE users_dhruva (
  u_id int NOT NULL PRIMARY KEY DEFAULT NEXTVAL ('users_dhruva_seq'),
  u_name varchar(36) NOT NULL,
  u_username varchar(20) NOT NULL UNIQUE,
  u_email varchar(36) NOT NULL,
  u_website varchar(36) NOT NULL,
  u_phone varchar(36) NOT NULL
) ;

DROP TABLE IF EXISTS userAddress_dhruva;
DROP SEQUENCE IF EXISTS userAddress_dhruva_seq;
CREATE SEQUENCE userAddress_dhruva_seq;

CREATE TABLE userAddress_dhruva (
  ua_id int NOT NULL PRIMARY KEY DEFAULT NEXTVAL ('userAddress_dhruva_seq'),
  ua_userId int NOT NULL ,
  ua_street varchar(36) NOT NULL,
  ua_suite varchar(20) NOT NULL,
  ua_city varchar(36) NOT NULL,
  ua_zipcode varchar(36) NOT NULL
) ;

DROP TABLE IF EXISTS userAddressGeo_dhruva;
DROP SEQUENCE IF EXISTS userAddressGeo_dhruva_seq;
CREATE SEQUENCE userAddressGeo_dhruva_seq;

CREATE TABLE userAddressGeo_dhruva (
  uag_id int NOT NULL PRIMARY KEY DEFAULT NEXTVAL ('userAddressGeo_dhruva_seq'),
  uag_addressId int NOT NULL ,
  uag_lat varchar(36) NOT NULL,
  uag_lng varchar(20) NOT NULL
) ;

DROP TABLE IF EXISTS userCompany_dhruva;
DROP SEQUENCE IF EXISTS userCompany_dhruva_seq;
CREATE SEQUENCE userCompany_dhruva_seq;

CREATE TABLE userCompany_dhruva (
  uc_id int NOT NULL PRIMARY KEY DEFAULT NEXTVAL ('userCompany_dhruva_seq'),
  uc_userId int NOT NULL ,
  uc_name varchar(36) NOT NULL,
  uc_catchPhrase varchar(100) NOT NULL,
  uc_bs varchar(100) NOT NULL
) ;

DROP TABLE IF EXISTS posts_dhruva;
DROP SEQUENCE IF EXISTS posts_dhruva_seq;
CREATE SEQUENCE posts_dhruva_seq;

CREATE TABLE posts_dhruva (
  p_id int NOT NULL PRIMARY KEY DEFAULT NEXTVAL ('posts_dhruva_seq'),
  p_userId int NOT NULL ,
  p_title varchar(100) NOT NULL,
  p_body text NOT NULL
) ;

DROP TABLE IF EXISTS comments_dhruva;
DROP SEQUENCE IF EXISTS comments_dhruva_seq;
CREATE SEQUENCE comments_dhruva_seq;

CREATE TABLE comments_dhruva (
  c_id int NOT NULL PRIMARY KEY DEFAULT NEXTVAL ('comments_dhruva_seq'),
  c_postId int NOT NULL ,
  c_name varchar(100) NOT NULL,
  c_email varchar(100) NOT NULL,
  c_body text NOT NULL
) ;

DROP TABLE IF EXISTS albums_dhruva;
DROP SEQUENCE IF EXISTS albums_dhruva_seq;
CREATE SEQUENCE albums_dhruva_seq;

CREATE TABLE albums_dhruva (
  a_id int NOT NULL PRIMARY KEY DEFAULT NEXTVAL ('albums_dhruva_seq'),
  a_userId int NOT NULL ,
  a_title varchar(100) NOT NULL
) ;

DROP TABLE IF EXISTS photos_dhruva;
DROP SEQUENCE IF EXISTS photos_dhruva_seq;
CREATE SEQUENCE photos_dhruva_seq;

CREATE TABLE photos_dhruva (
  p_id int NOT NULL PRIMARY KEY DEFAULT NEXTVAL ('photos_dhruva_seq'),
  p_albumId int NOT NULL ,
  p_title varchar(100) NOT NULL,
  p_url varchar(100) NOT NULL,
  p_thumbnailUrl varchar(100) NOT NULL
) ;

DROP TABLE IF EXISTS todos_dhruva;
DROP SEQUENCE IF EXISTS todos_dhruva_seq;
CREATE SEQUENCE todos_dhruva_seq;

CREATE TABLE todos_dhruva (
  t_id int NOT NULL PRIMARY KEY DEFAULT NEXTVAL ('todos_dhruva_seq'),
  t_userId int NOT NULL ,
  t_title varchar(100) NOT NULL,
  t_completed boolean NOT NULL
) ;