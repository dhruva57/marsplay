DROP TABLE IF EXISTS `users_dhruva`;
CREATE TABLE `users_dhruva` (
  `u_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `u_name` varchar(36) NOT NULL,
  `u_username` varchar(20) NOT NULL UNIQUE,
  `u_email` varchar(36) NOT NULL,
  `u_website` varchar(36) NOT NULL,
  `u_phone` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `userAddress_dhruva`;
CREATE TABLE `userAddress_dhruva` (
  `ua_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `ua_userId` int(11) NOT NULL ,
  `ua_street` varchar(36) NOT NULL,
  `ua_suite` varchar(20) NOT NULL,
  `ua_city` varchar(36) NOT NULL,
  `ua_zipcode` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `userAddressGeo_dhruva`;
CREATE TABLE `userAddressGeo_dhruva` (
  `uag_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `uag_addressId` int(11) NOT NULL ,
  `uag_lat` varchar(36) NOT NULL,
  `uag_lng` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `userCompany_dhruva`;
CREATE TABLE `userCompany_dhruva` (
  `uc_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `uc_userId` int(11) NOT NULL ,
  `uc_name` varchar(36) NOT NULL,
  `uc_catchPhrase` varchar(20) NOT NULL,
  `uc_bs` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `posts_dhruva`;
CREATE TABLE `posts_dhruva` (
  `p_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `p_userId` int(11) NOT NULL ,
  `p_title` varchar(36) NOT NULL,
  `p_body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `comments_dhruva`;
CREATE TABLE `comments_dhruva` (
  `c_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `c_postId` int(11) NOT NULL ,
  `c_name` varchar(36) NOT NULL,
  `c_email` varchar(36) NOT NULL,
  `c_body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `albums_dhruva`;
CREATE TABLE `albums_dhruva` (
  `a_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `a_userId` int(11) NOT NULL ,
  `a_title` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `photos_dhruva`;
CREATE TABLE `photos_dhruva` (
  `p_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `p_albumId` int(11) NOT NULL ,
  `p_title` varchar(36) NOT NULL,
  `p_url` varchar(36) NOT NULL,
  `p_thumbnailUrl` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `todos_dhruva`;
CREATE TABLE `todos_dhruva` (
  `t_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `t_userId` int(11) NOT NULL ,
  `t_title` varchar(36) NOT NULL,
  `t_completed` boolean NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;