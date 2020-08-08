-- --------------------------------------------------------
-- 호스트:                          192.168.0.28
-- 서버 버전:                        10.4.13-MariaDB - MariaDB Server
-- 서버 OS:                        Linux
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- powerdns 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `powerdns` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `powerdns`;

-- 테이블 powerdns.alarm_list_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `alarm_list_info` (
  `gubun` char(5) CHARACTER SET euckr DEFAULT 'event',
  `event_date` datetime DEFAULT '0000-00-00 00:00:00',
  `clear_date` datetime DEFAULT '0000-00-00 00:00:00',
  `grade` int(2) DEFAULT 10,
  `sosok` varchar(30) CHARACTER SET euckr DEFAULT '',
  `alias` varchar(255) CHARACTER SET euckr DEFAULT '',
  `alias_kr` varchar(255) CHARACTER SET euckr DEFAULT '',
  `line_num` char(14) CHARACTER SET euckr DEFAULT '',
  `admin_port` varchar(10) CHARACTER SET euckr DEFAULT '',
  `oper_port` varchar(10) CHARACTER SET euckr DEFAULT '',
  `ipaddr` char(15) CHARACTER SET euckr DEFAULT '',
  `macaddr` char(17) CHARACTER SET euckr DEFAULT '',
  `serial` varchar(30) CHARACTER SET euckr DEFAULT '',
  `l2_ipaddr` char(15) CHARACTER SET euckr DEFAULT '',
  `l2_modelname` varchar(30) CHARACTER SET euckr DEFAULT '',
  `portIDX` char(17) CHARACTER SET euckr DEFAULT '',
  `l3_ipaddr` char(15) CHARACTER SET euckr DEFAULT '',
  `l3_modelname` varchar(30) CHARACTER SET euckr DEFAULT '',
  `content` varchar(255) CHARACTER SET euckr DEFAULT '',
  `read_flag` char(1) CHARACTER SET euckr DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.alarm_list_info:1 rows 내보내기
/*!40000 ALTER TABLE `alarm_list_info` DISABLE KEYS */;
INSERT INTO `alarm_list_info` (`gubun`, `event_date`, `clear_date`, `grade`, `sosok`, `alias`, `alias_kr`, `line_num`, `admin_port`, `oper_port`, `ipaddr`, `macaddr`, `serial`, `l2_ipaddr`, `l2_modelname`, `portIDX`, `l3_ipaddr`, `l3_modelname`, `content`, `read_flag`) VALUES
	('event', '2017-05-29 11:54:00', '0000-00-00 00:00:00', 6, 'seoul', '', '', '0002-0057-6869', '', '', '', '', '', '', '', '', '', '', '장비 수집에 실패하였습니다', '0');
/*!40000 ALTER TABLE `alarm_list_info` ENABLE KEYS */;

-- 테이블 powerdns.comments 구조 내보내기
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(10) NOT NULL,
  `modified_at` int(11) NOT NULL,
  `account` varchar(40) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_domain_id_idx` (`domain_id`),
  KEY `comments_name_type_idx` (`name`,`type`),
  KEY `comments_order_idx` (`domain_id`,`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.comments:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;

-- 테이블 powerdns.conn_device_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `conn_device_info` (
  `line_sn` varchar(20) NOT NULL,
  `mart_sn` varchar(20) NOT NULL,
  `security_device_sn` varchar(20) NOT NULL,
  `conn_device_mac` varchar(20) NOT NULL,
  `conn_device_hist_seq` int(20) NOT NULL,
  `conn_device_ip` varchar(20) DEFAULT NULL,
  `conn_device_interface` varchar(20) DEFAULT NULL,
  `conn_dtm` datetime NOT NULL,
  `latest_conn_dtm` datetime DEFAULT NULL,
  `disconn_dtm` datetime DEFAULT NULL,
  `filter_reg_dtm` datetime DEFAULT NULL,
  `filter_del_dtm` datetime DEFAULT NULL,
  PRIMARY KEY (`line_sn`,`mart_sn`,`security_device_sn`,`conn_device_mac`,`conn_device_hist_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.conn_device_info:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `conn_device_info` DISABLE KEYS */;
INSERT INTO `conn_device_info` (`line_sn`, `mart_sn`, `security_device_sn`, `conn_device_mac`, `conn_device_hist_seq`, `conn_device_ip`, `conn_device_interface`, `conn_dtm`, `latest_conn_dtm`, `disconn_dtm`, `filter_reg_dtm`, `filter_del_dtm`) VALUES
	('2222-2222-2222', '22222222', 'HMAP9123456780127', 'A1:B1:C1:D1:E1:F1', 1, '192.168.10.1', 'LAN1', '2020-05-26 13:09:00', '2020-05-28 11:38:25', NULL, NULL, NULL),
	('2222-2222-2222', '22222222', 'HMAP9123456780127', 'A1:B1:C1:D1:E1:F2', 1, '192.168.10.2', 'LAN2', '2020-05-26 13:09:00', '2020-05-28 11:38:25', NULL, NULL, NULL);
/*!40000 ALTER TABLE `conn_device_info` ENABLE KEYS */;

-- 테이블 powerdns.cryptokeys 구조 내보내기
CREATE TABLE IF NOT EXISTS `cryptokeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `flags` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `content` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `domainidindex` (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.cryptokeys:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `cryptokeys` DISABLE KEYS */;
/*!40000 ALTER TABLE `cryptokeys` ENABLE KEYS */;

-- 테이블 powerdns.data_correction_list 구조 내보내기
CREATE TABLE IF NOT EXISTS `data_correction_list` (
  `line_num` char(14) CHARACTER SET latin1 DEFAULT '',
  `correction_msg` varchar(200) CHARACTER SET latin1 DEFAULT '',
  `event_flag` char(1) CHARACTER SET latin1 DEFAULT '0',
  `event_date` datetime DEFAULT '0000-00-00 00:00:00',
  `correction_date` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.data_correction_list:5 rows 내보내기
/*!40000 ALTER TABLE `data_correction_list` DISABLE KEYS */;
INSERT INTO `data_correction_list` (`line_num`, `correction_msg`, `event_flag`, `event_date`, `correction_date`) VALUES
	('0051-0039-0594', 'NO_ONT_70:97:56:0A:BE:0B_IN_121.175.100.17', '0', '2017-05-07 18:58:30', '0000-00-00 00:00:00'),
	('0043-0047-6557', 'NO_ONT_6C:0F:6A:01:15:48_IN_112.188.200.10', '0', '2017-05-23 22:14:38', '0000-00-00 00:00:00'),
	('0043-0047-4033', 'NO_ONT_00:0E:DC:38:F0:8C_IN_112.188.200.10', '0', '2017-07-27 13:05:28', '0000-00-00 00:00:00'),
	('0053-0028-4423', 'LOGIN_FAIL_IPSHARE_0053-0028-4423_90:9F:33:C4:BB:AD', '0', '2017-07-10 17:34:25', '0000-00-00 00:00:00'),
	('0053-0028-5916', 'LOGIN_FAIL_IPSHARE_0053-0028-5916_90:9F:33:C4:BB:6D', '0', '2017-07-27 13:05:01', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `data_correction_list` ENABLE KEYS */;

-- 테이블 powerdns.del_code 구조 내보내기
CREATE TABLE IF NOT EXISTS `del_code` (
  `line_num` char(14) DEFAULT '',
  `validate_time` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.del_code:0 rows 내보내기
/*!40000 ALTER TABLE `del_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `del_code` ENABLE KEYS */;

-- 테이블 powerdns.del_list 구조 내보내기
CREATE TABLE IF NOT EXISTS `del_list` (
  `seq` int(12) NOT NULL DEFAULT 0,
  `del_date` datetime DEFAULT '0000-00-00 00:00:00',
  `line_num` char(14) DEFAULT '',
  `user_id` varchar(50) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.del_list:5 rows 내보내기
/*!40000 ALTER TABLE `del_list` DISABLE KEYS */;
INSERT INTO `del_list` (`seq`, `del_date`, `line_num`, `user_id`) VALUES
	(1, '2017-10-31 14:23:37', '0002-0119-1999', 'gundeok'),
	(2, '2017-10-31 14:32:49', '0002-0119-2020', 'gundeok'),
	(3, '2017-10-31 15:20:15', '0002-0121-7074', 'gundeok'),
	(4, '2017-10-31 15:20:57', '0002-0176-0354', 'gundeok'),
	(5, '2017-10-31 15:25:09', '0002-1780-1549', 'gundeok');
/*!40000 ALTER TABLE `del_list` ENABLE KEYS */;

-- 테이블 powerdns.domainmetadata 구조 내보내기
CREATE TABLE IF NOT EXISTS `domainmetadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `kind` varchar(32) DEFAULT NULL,
  `content` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `domainmetadata_idx` (`domain_id`,`kind`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.domainmetadata:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `domainmetadata` DISABLE KEYS */;
INSERT INTO `domainmetadata` (`id`, `domain_id`, `kind`, `content`) VALUES
	(1, 1, 'ALLOW-AXFR-FROM', 'AUTO-NS'),
	(2, 1, 'ALLOW-AXFR-FROM', '2001:db8::/48');
/*!40000 ALTER TABLE `domainmetadata` ENABLE KEYS */;

-- 테이블 powerdns.domains 구조 내보내기
CREATE TABLE IF NOT EXISTS `domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `master` varchar(128) DEFAULT NULL,
  `last_check` int(11) DEFAULT NULL,
  `type` varchar(6) NOT NULL,
  `notified_serial` int(11) DEFAULT NULL,
  `account` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.domains:~15 rows (대략적) 내보내기
/*!40000 ALTER TABLE `domains` DISABLE KEYS */;
INSERT INTO `domains` (`id`, `name`, `master`, `last_check`, `type`, `notified_serial`, `account`) VALUES
	(1, 'example.net', '198.51.100.101', NULL, 'MASTER', NULL, NULL),
	(2, 'enteroa.kr', NULL, NULL, 'MASTER', 1, NULL),
	(3, 'db.io', NULL, NULL, 'NATIVE', NULL, NULL),
	(6, 'test1234', NULL, NULL, 'MASTER', NULL, NULL),
	(40, 'www.test.com', NULL, 1585027873, 'MASTER', NULL, NULL),
	(43, 'www.gaon.co.kr', NULL, 1585027873, 'MASTER', NULL, NULL),
	(45, 'www.natien.com', NULL, 1585027882, 'MASTER', NULL, NULL),
	(174, 'www.build.com', NULL, 1589431443, 'MASTER', NULL, NULL),
	(176, 'www.naver.com', NULL, 1589431443, 'MASTER', NULL, NULL),
	(177, 'www.google.com', NULL, 1589431443, 'MASTER', NULL, NULL),
	(178, 'www.apache.org', NULL, 1589431443, 'MASTER', NULL, NULL),
	(179, 'www.facebook.com', NULL, 1589431443, 'MASTER', NULL, NULL),
	(180, 'www.daum.net', NULL, 1589431443, 'MASTER', NULL, NULL),
	(181, 'cnwiz.asuscomm.com', NULL, 1589431443, 'MASTER', NULL, NULL),
	(182, 'welfare.kt.com', NULL, NULL, 'MASTER', NULL, NULL);
/*!40000 ALTER TABLE `domains` ENABLE KEYS */;

-- 테이블 powerdns.except_device_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `except_device_info` (
  `macaddr` char(17) CHARACTER SET euckr NOT NULL,
  `line_num` char(14) CHARACTER SET euckr DEFAULT '',
  `alias` varchar(100) CHARACTER SET euckr DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.except_device_info:5 rows 내보내기
/*!40000 ALTER TABLE `except_device_info` DISABLE KEYS */;
INSERT INTO `except_device_info` (`macaddr`, `line_num`, `alias`) VALUES
	('00:03:78:67:25:90', '0033-0030-2520', ''),
	('EC:E0:9B:E1:84:59', '0033-0021-1310', 'STB'),
	('7C:05:07:89:2D:B2', '0031-0943-1368', '??PC'),
	('80:18:A7:EE:E6:CC', '0002-9999-0405', 'OTV'),
	('90:9F:33:C4:6E:61', '0031-0045-6985', 'AP-6984');
/*!40000 ALTER TABLE `except_device_info` ENABLE KEYS */;

-- 테이블 powerdns.firmware_area 구조 내보내기
CREATE TABLE IF NOT EXISTS `firmware_area` (
  `fw_area_seq` int(11) NOT NULL AUTO_INCREMENT,
  `area_cd` varchar(20) NOT NULL,
  `area_nm` varchar(20) NOT NULL,
  `fw_history_seq` int(11) NOT NULL,
  `fw_ver` varchar(50) NOT NULL,
  `apply_dtm` varchar(20) DEFAULT NULL,
  `use_yn` varchar(1) DEFAULT NULL,
  `mod_dtm` datetime DEFAULT NULL,
  `mod_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`fw_area_seq`,`area_cd`),
  KEY `IX_FK_firmware_area` (`fw_history_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.firmware_area:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `firmware_area` DISABLE KEYS */;
INSERT INTO `firmware_area` (`fw_area_seq`, `area_cd`, `area_nm`, `fw_history_seq`, `fw_ver`, `apply_dtm`, `use_yn`, `mod_dtm`, `mod_id`) VALUES
	(5, 'busan', '부산', 132, 'KM07-609WU_v1.1.16_20191230', '2020-04-28 00:11:00', 'N', NULL, 'gundeok'),
	(6, 'busan', '부산', 142, '6.0.0', '2020-04-30 13:10:00', 'Y', '2020-05-30 00:01:00', 'gundeok'),
	(7, 'byeokjae', '고양', 133, 'KM07-609WU_v1.1.16_20191230_test12345', '2020-05-30 13:16:00', '', '2020-05-30 13:16:00', 'gundeok'),
	(8, 'byeokjae', '고양', 134, 'KM07-609WU_v1.1.16_20191230_test12300', '2020-04-30 00:11:00', 'N', '2020-05-30 00:18:00', 'gundeok'),
	(9, 'byeokjae', '고양', 132, 'KM07-609WU_v1.1.16_20191230', '2020-04-27 00:11:00', 'Y', '2020-04-27 00:11:00', 'gundeok'),
	(10, 'seoul', '서울', 142, '6.0.0', '2020-05-18 00:11:00', 'Y', NULL, NULL);
/*!40000 ALTER TABLE `firmware_area` ENABLE KEYS */;

-- 테이블 powerdns.firmware_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `firmware_history` (
  `fw_history_seq` int(11) NOT NULL AUTO_INCREMENT,
  `fw_ver` varchar(50) DEFAULT NULL,
  `fw_file_name` varchar(50) DEFAULT NULL,
  `fw_file_size` int(11) NOT NULL,
  `fw_file_data` mediumtext NOT NULL,
  `fw_checksum` varchar(100) NOT NULL,
  `fw_latest_yn` varchar(1) NOT NULL,
  `reg_dtm` datetime DEFAULT NULL,
  `reg_id` varchar(20) DEFAULT NULL,
  `mod_dtm` datetime DEFAULT NULL,
  `mod_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`fw_history_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.firmware_history:~9 rows (대략적) 내보내기
/*!40000 ALTER TABLE `firmware_history` DISABLE KEYS */;
INSERT INTO `firmware_history` (`fw_history_seq`, `fw_ver`, `fw_file_name`, `fw_file_size`, `fw_file_data`, `fw_checksum`, `fw_latest_yn`, `reg_dtm`, `reg_id`, `mod_dtm`, `mod_id`) VALUES
	(132, 'KM07-609WU_v1.1.16_20191230', 'spring-boot-cli-2.1.6.RELEASE.bin', 12528842, 'Li4vdXNyL3VwbG9hZC9maWxl', '110d4403b1f9c5bf485dce52a8145ca4', 'Y', '2020-04-06 11:33:20', 'gundeok', '0000-00-00 00:00:00', 'gundeok'),
	(133, 'KM07-609WU_v1.1.16_20191230_test12345', '3.0.1.23.bin', 8, 'Li4vdXNyL3VwbG9hZC9maWxl', '3b2a40901ef924cb783d5166d806cbe1', 'Y', '2020-04-06 11:40:48', 'gundeok', '0000-00-00 00:00:00', 'gundeok'),
	(134, 'KM07-609WU_v1.1.16_20191230_test12300', '3.10.22.zip', 572, 'Li4vdXNyL3VwbG9hZC9maWxl', '2bc4a6512a9f74efebd907ce33e1c364', 'Y', '2020-04-06 13:10:24', 'gundeok', '0000-00-00 00:00:00', 'gundeok'),
	(135, 'KM07-609WU_v6.0.0_20200430', 'KM07-609WU_v6.0.0_20200430.bin', 38510864, 'Li4vdXNyL3VwbG9hZC9maWxl', 'feca51f3f3bc6c8b76d70314604d19b5', 'Y', '2020-05-15 17:31:05', 'cj', '0000-00-00 00:00:00', 'cj'),
	(141, 'KM07-609WU_v1.1.16_20191230181818', 'spring-boot-hikaricp.zip', 8295, 'Li4vdXNyL3VwbG9hZC9maWxlL3NwcmluZy1ib290LWhpa2FyaWNwLnppcA==', '6593f67d27da606a6a14d3b0afa315d3', 'Y', '2020-05-18 16:59:24', 'gundeok', '0000-00-00 00:00:00', 'gundeok'),
	(142, '6.0.0', 'KM07-609WU_v6.0.0_20200430.bin', 38510864, 'Li4vdXNyL3VwbG9hZC9maWxlL0tNMDctNjA5V1VfdjYuMC4wXzIwMjAwNDMwLmJpbg==', '6f6e2a341ebb964e409da44c50e2e246', 'Y', '2020-05-18 17:11:30', 'cj', '0000-00-00 00:00:00', 'cj'),
	(143, '6.0.1', 'KM07-609WU_v6.0.1_20200430.bin', 38510864, 'Li4vdXNyL3VwbG9hZC9maWxlL0tNMDctNjA5V1VfdjYuMC4xXzIwMjAwNDMwLmJpbg==', '4949919a7dc23a909c4656c7ece1466a', 'Y', '2020-05-22 09:59:34', 'cj', '0000-00-00 00:00:00', 'cj'),
	(144, '6.0.2', 'KM07-609WU_v6.0.2_20200430.bin', 38510864, 'Li4vdXNyL3VwbG9hZC9maWxlL0tNMDctNjA5V1VfdjYuMC4yXzIwMjAwNDMwLmJpbg==', 'e0413c491e442d62b74e28504bb05433', 'Y', '2020-05-22 09:59:47', 'cj', '0000-00-00 00:00:00', 'cj'),
	(146, '5.9.9', 'KM07-609WU_v5.9.9_20200522.bin', 38518192, 'Li4vdXNyL3VwbG9hZC9maWxlL0tNMDctNjA5V1VfdjUuOS45XzIwMjAwNTIyLmJpbg==', '088af745cf02dd6d4306274df53c4b89', 'Y', '2020-05-22 13:02:36', 'cj', '0000-00-00 00:00:00', 'cj');
/*!40000 ALTER TABLE `firmware_history` ENABLE KEYS */;

-- 테이블 powerdns.grade_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `grade_info` (
  `name` varchar(30) CHARACTER SET euckr DEFAULT '',
  `code` varchar(30) CHARACTER SET euckr DEFAULT '',
  `num` int(2) NOT NULL,
  `lv` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.grade_info:3 rows 내보내기
/*!40000 ALTER TABLE `grade_info` DISABLE KEYS */;
INSERT INTO `grade_info` (`name`, `code`, `num`, `lv`) VALUES
	('사용자', 'user', 1, 3),
	('지역관리자', 'local_admin', 2, 6),
	('관리자', 'admin', 3, 9);
/*!40000 ALTER TABLE `grade_info` ENABLE KEYS */;

-- 테이블 powerdns.gws_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `gws_info` (
  `serial` varchar(255) DEFAULT '' COMMENT '단말 시리얼',
  `modelname` varchar(255) DEFAULT '' COMMENT '단말 모델명',
  `macaddr` char(17) DEFAULT '' COMMENT 'mac주소(wan)',
  `ipaddr` char(15) DEFAULT '' COMMENT 'ip주소',
  `subnet` char(15) DEFAULT '' COMMENT '외부네트워크 서브넷',
  `gateway` char(15) DEFAULT '' COMMENT '외부네트워크 게이트웨이',
  `dns_1` char(15) DEFAULT '' COMMENT '외부네트워크 1차DNS',
  `dns_2` char(15) DEFAULT '' COMMENT '외부네트워크 2차DNS',
  `Real_IP` char(15) NOT NULL DEFAULT '' COMMENT '공인IP',
  `ipaddr_type` char(6) DEFAULT '' COMMENT 'IP유형(dhcp|static)',
  `wifiutm_group` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_bin NOT NULL DEFAULT '' COMMENT '제어서버의wizstick_Group값',
  `reg_date` datetime DEFAULT current_timestamp() COMMENT '등록일',
  `update_date` datetime DEFAULT current_timestamp() COMMENT '수정일',
  `beacon_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00' COMMENT '제어서버 Beacon확인시간',
  `network_status` varchar(30) DEFAULT '',
  `network_status_date` datetime DEFAULT '1000-01-01 00:00:00',
  `int_ipaddr` char(15) DEFAULT '' COMMENT '내부네트워크 IP주소',
  `int_subnet` char(15) DEFAULT '' COMMENT '내부네트워크 서브넷',
  `int_dns1` char(15) DEFAULT '',
  `int_dns2` char(15) DEFAULT '',
  `dhcp_server_enable` char(1) DEFAULT '' COMMENT '내부네트워크 DHCP서버 동작 여부',
  `dhcp_ip_pool_start` char(15) DEFAULT '' COMMENT 'DHCP IP Pool 시작IP',
  `dhcp_ip_pool_end` char(15) DEFAULT '' COMMENT 'DHCP IP Pool 종료IP',
  `dhcp_premium_ip_pool_start` char(15) DEFAULT '',
  `dhcp_premium_ip_pool_end` char(15) DEFAULT '',
  `line_id` varchar(255) DEFAULT '' COMMENT '회선정보',
  `firmware_version` varchar(50) DEFAULT NULL,
  `fireware_update` char(1) DEFAULT '',
  `auth_key` varchar(64) DEFAULT NULL COMMENT '펌웨어auth',
  `line_num` char(14) NOT NULL COMMENT '회선번호',
  `secureStatus` varchar(1) DEFAULT NULL COMMENT '보안단말 보안정책(Iptables) 상태 (단말상태)',
  `last_reboot` datetime DEFAULT NULL COMMENT '최근 리부팅 시간 (단말상태)',
  `curRule` varchar(20) DEFAULT NULL COMMENT '현재 보안정책 Rule버전 (단말상태)',
  `uptime_limit` int(11) DEFAULT NULL COMMENT '업타임제한시간',
  `reboot_yn` varchar(1) NOT NULL COMMENT '즉시재부팅여부',
  `secure_yn` varchar(1) NOT NULL COMMENT '보안정책사용여부',
  `uptime` varchar(13) DEFAULT NULL COMMENT '단말 업타임 시간',
  `secure_on_time` datetime DEFAULT NULL,
  `secure_off_time` datetime DEFAULT NULL,
  KEY `idx_serial` (`serial`,`macaddr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.gws_info:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `gws_info` DISABLE KEYS */;
INSERT INTO `gws_info` (`serial`, `modelname`, `macaddr`, `ipaddr`, `subnet`, `gateway`, `dns_1`, `dns_2`, `Real_IP`, `ipaddr_type`, `wifiutm_group`, `reg_date`, `update_date`, `beacon_date`, `network_status`, `network_status_date`, `int_ipaddr`, `int_subnet`, `int_dns1`, `int_dns2`, `dhcp_server_enable`, `dhcp_ip_pool_start`, `dhcp_ip_pool_end`, `dhcp_premium_ip_pool_start`, `dhcp_premium_ip_pool_end`, `line_id`, `firmware_version`, `fireware_update`, `auth_key`, `line_num`, `secureStatus`, `last_reboot`, `curRule`, `uptime_limit`, `reboot_yn`, `secure_yn`, `uptime`, `secure_on_time`, `secure_off_time`) VALUES
	('GWFP9191375004010', 'KM07-609WU', '88:3C:1C:73:2D:C4', '192.168.56.1', '255.255.255.0', '218.153.81.254', '10.12.253.56', '10.12.253.57', '14.63.45.24', 'dhcp', '', '2019-03-04 15:20:08', '2019-03-04 15:20:08', '2019-11-12 14:42:20', 'off', '2019-11-16 22:33:53', '172.30.200.254', '255.255.255.0', '10.12.253.56', '10.12.253.57', '1', '172.30.200.1', '172.30.200.60', '172.30.200.128', '172.30.200.148', '', 'KM07-609WU_v6.0.0_20200430', '', NULL, '', NULL, NULL, NULL, 99999, 'N', 'Y', '', NULL, NULL),
	('TEST2019112000001', 'test gws_dev1', '08:5D:DD:00:18:93', '192.168.56.1', '255.255.255.0', '', '', '', '', '', '', '2020-04-28 21:09:34', '2020-04-28 21:09:34', '1000-01-01 00:00:00', '', '1000-01-01 00:00:00', '', '', '', '', '', '', '', '', '', '', '6.3.1', '', NULL, '1111-1111-1111', 'Y', '2020-05-22 14:12:59', '00000000000', 99999, 'N', 'Y', '', NULL, NULL),
	('HMAP9123456780127', 'test gws_dev2', '08:5D:DD:00:11:FC', '112.188.7.8', '255.255.255.0', '', '', '', '127.0.0.1', '', '', '2020-04-28 21:09:35', '2020-04-28 21:09:35', '2020-06-05 17:53:49', '', '1000-01-01 00:00:00', '', '', '', '', '', '', '', '', '', '', '3.0.3', '', 'aX0mfu8E2kUaBL0hr17Jpze8t1oYjTee30mKMwANNqw=', '2222-2222-2222', 'N', '2020-06-05 17:16:03', '20200317001', 0, 'I', 'Y', '0001:00:00:00', '2020-06-03 17:51:38', '2020-06-05 17:17:12'),
	('HMAP9123456780128', 'test gws_dev3', '08:5D:DD:00:11:FD', '112.188.7.8', '255.255.255.0', '', '', '', '', '', '', '2020-04-29 14:49:03', '2020-04-29 14:49:03', '1000-01-01 00:00:00', '', '1000-01-01 00:00:00', '', '', '', '', '', '', '', '', '', '', 'KM07-609WU_v1.1.16_20191229', '', NULL, '0000-0000-0003', NULL, NULL, NULL, 99999, 'N', 'Y', '', NULL, NULL),
	('test', 'test1', 'testMac', '', '', '', '', '', '', '', '', '2020-05-25 09:48:57', '2020-05-25 09:48:57', '1000-01-01 00:00:00', '', '1000-01-01 00:00:00', '', '', '', '', '', '', '', '', '', '', NULL, '', NULL, '', NULL, NULL, NULL, 0, '', '', '', NULL, NULL),
	('test2', 'test2', 'testMac2', '', '', '', '', '', '', '', '', '2020-05-25 10:09:36', '2020-05-25 10:09:36', '1000-01-01 00:00:00', '', '1000-01-01 00:00:00', '', '', '', '', '', '', '', '', '', '', NULL, '', NULL, '', NULL, NULL, NULL, 0, '', '', '', NULL, NULL),
	('test3', 'test3', 'testMac3', '', '', '', '', '', '', '', '', '2020-05-25 23:51:01', '2020-05-25 23:51:01', '1000-01-01 00:00:00', '', '1000-01-01 00:00:00', '', '', '', '', '', '', '', '', '', '', NULL, '', NULL, '1212-1212-1212', NULL, NULL, NULL, 0, 'N', 'Y', '', NULL, NULL);
/*!40000 ALTER TABLE `gws_info` ENABLE KEYS */;

-- 테이블 powerdns.history_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `history_info` (
  `line_num` char(15) CHARACTER SET euckr DEFAULT '',
  `event_date` datetime DEFAULT '0000-00-00 00:00:00',
  `gubun` char(10) CHARACTER SET euckr DEFAULT '',
  `oper_status_before` varchar(10) CHARACTER SET euckr DEFAULT '',
  `oper_status_after` varchar(10) CHARACTER SET euckr DEFAULT '',
  `ont_status` varchar(30) CHARACTER SET euckr DEFAULT '',
  `ping_fail_start_time` datetime DEFAULT '0000-00-00 00:00:00',
  `ping_fail_end_time` varchar(10) CHARACTER SET euckr DEFAULT '',
  `ipaddr_before` char(15) CHARACTER SET euckr DEFAULT '',
  `ipaddr_after` char(15) CHARACTER SET euckr DEFAULT '',
  `macaddr` char(17) CHARACTER SET euckr DEFAULT '',
  `l2_ipaddr` char(15) CHARACTER SET euckr DEFAULT '',
  `contents` varchar(255) CHARACTER SET euckr DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.history_info:0 rows 내보내기
/*!40000 ALTER TABLE `history_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_info` ENABLE KEYS */;

-- 테이블 powerdns.ipshare_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `ipshare_info` (
  `macaddr` char(17) CHARACTER SET euckr NOT NULL,
  `ipaddr` char(15) CHARACTER SET euckr DEFAULT NULL COMMENT 'ê³µìœ ê¸° IPì£¼ì†Œ',
  `line_num` char(14) CHARACTER SET euckr DEFAULT NULL COMMENT 'ê³µìœ ê¸°ì˜ íšŒì„ ë²ˆí˜¸',
  `modelname` varchar(30) CHARACTER SET euckr DEFAULT NULL COMMENT 'ê³µìœ ê¸° ëª¨ë¸ëª…',
  `maker` varchar(50) CHARACTER SET euckr DEFAULT NULL COMMENT 'ê³µìœ ê¸° ì œì¡°ì‚¬',
  `id` varchar(30) CHARACTER SET euckr DEFAULT NULL COMMENT 'ê³µìœ ê¸° ì ‘ì†ID',
  `pw` varchar(30) CHARACTER SET euckr DEFAULT NULL COMMENT 'ê³µìœ ê¸° ì ‘ì†ë¹„ë²ˆ',
  `webport` char(5) CHARACTER SET euckr DEFAULT NULL COMMENT 'ê³µìœ ê¸° ì ‘ì† í¬íŠ¸',
  `status` char(1) CHARACTER SET euckr DEFAULT 'U',
  `collect_date` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.ipshare_info:8 rows 내보내기
/*!40000 ALTER TABLE `ipshare_info` DISABLE KEYS */;
INSERT INTO `ipshare_info` (`macaddr`, `ipaddr`, `line_num`, `modelname`, `maker`, `id`, `pw`, `webport`, `status`, `collect_date`) VALUES
	('', '125.130.137.69', '0031-0123-9648', 'iptime v504', NULL, 'admin', 'qhdks!@#', '80', 'U', '0000-00-00 00:00:00'),
	(' 90:9F:33:C4:6E:8', '125.136.9.96', '', 'V504', NULL, 'admin', 'qhdks!@#', '80', 'U', '0000-00-00 00:00:00'),
	(' 90:9F:33:C5:C4:C', '', '', 'iptime', NULL, 'admin', 'qhdks!@#', '80', 'U', '0000-00-00 00:00:00'),
	('00-26-66-26-69-35', '121.149.23.11', '', 'Q604', NULL, 'admin', 'qhdks!@#', '80', 'U', '0000-00-00 00:00:00'),
	('00:08:9F:08:8D:41', '59.0.244.64', '0061-0048-9802', 'ipTimeQ1', NULL, 'admin', 'qhdks!@#', '80', 'U', '0000-00-00 00:00:00'),
	('1.1.1.1', '1.1.1.1', '0000-0000-0001', 'TestIptime', NULL, 'admin', 'qhdks!@#', '22', 'U', '0000-00-00 00:00:00'),
	('90:9F:33:C4:6E:8', '196.168.56.101', '1111-1111-1111', 'Y504', NULL, 'admin', 'qhdks!@#', '80', 'U', '2020-05-21 08:36:23'),
	('91:9F:33:C4:FE:8', '192.168.50.102', '1111-1111-1111', 'iptime v504', NULL, 'peterkang', '!1astoredev', '80', 'U', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ipshare_info` ENABLE KEYS */;

-- 테이블 powerdns.l2_port_status 구조 내보내기
CREATE TABLE IF NOT EXISTS `l2_port_status` (
  `l2_ipaddr` char(15) CHARACTER SET latin1 DEFAULT '',
  `portIDX` char(17) CHARACTER SET latin1 DEFAULT '',
  `admin_status` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `oper_status` varchar(10) CHARACTER SET latin1 DEFAULT '',
  `insert_date` datetime DEFAULT '0000-00-00 00:00:00',
  `update_date` datetime DEFAULT '0000-00-00 00:00:00',
  `llid` char(5) CHARACTER SET latin1 DEFAULT '',
  `OLT_ID` char(5) CHARACTER SET latin1 DEFAULT '',
  `ONU_ID` char(5) CHARACTER SET latin1 DEFAULT '',
  `ont_status` varchar(10) CHARACTER SET latin1 DEFAULT '',
  `max_host` char(3) CHARACTER SET latin1 DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.l2_port_status:5 rows 내보내기
/*!40000 ALTER TABLE `l2_port_status` DISABLE KEYS */;
INSERT INTO `l2_port_status` (`l2_ipaddr`, `portIDX`, `admin_status`, `oper_status`, `insert_date`, `update_date`, `llid`, `OLT_ID`, `ONU_ID`, `ont_status`, `max_host`) VALUES
	('119.196.58.138', '00:0E:DC:32:43:E8', 'up', 'up', '2017-04-04 00:09:14', '2017-04-08 09:10:31', '', '6/1', '', '', ''),
	('119.196.58.138', '00:27:1C:EF:FB:55', 'up', 'up', '2017-04-04 00:09:14', '2017-04-08 09:10:31', '', '6/1', '', '', ''),
	('183.101.74.166', 'MAC ADDRESS', '', '', '2017-04-04 00:08:40', '2017-07-27 13:05:27', '', 'OLT_I', '', '', ''),
	('183.101.74.166', '70:97:56:08:B3:96', '', '', '2017-04-04 00:08:40', '2017-07-27 13:05:27', '', '1/1', '', '', ''),
	('183.101.74.166', '70:97:56:08:01:A4', '', '', '2017-04-04 00:08:40', '2017-07-27 13:05:27', '', '1/1', '', '', '');
/*!40000 ALTER TABLE `l2_port_status` ENABLE KEYS */;

-- 테이블 powerdns.line_device_check 구조 내보내기
CREATE TABLE IF NOT EXISTS `line_device_check` (
  `seq` char(30) CHARACTER SET euckr DEFAULT '',
  `line_num` char(14) CHARACTER SET euckr DEFAULT '',
  `l3_ipaddr` char(15) CHARACTER SET euckr DEFAULT '',
  `l3_modelname` varchar(50) CHARACTER SET euckr DEFAULT '',
  `l2_ipaddr` char(15) CHARACTER SET euckr DEFAULT '',
  `l2_modelname` varchar(50) CHARACTER SET euckr DEFAULT '',
  `PORTALIAS` char(13) CHARACTER SET euckr DEFAULT '',
  `portIDX` char(17) CHARACTER SET euckr DEFAULT '',
  `flag` char(1) CHARACTER SET euckr DEFAULT 'x',
  `arptable` varchar(255) CHARACTER SET euckr DEFAULT '',
  `insert_date` datetime DEFAULT '0000-00-00 00:00:00',
  `update_date` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.line_device_check:5 rows 내보내기
/*!40000 ALTER TABLE `line_device_check` DISABLE KEYS */;
INSERT INTO `line_device_check` (`seq`, `line_num`, `l3_ipaddr`, `l3_modelname`, `l2_ipaddr`, `l2_modelname`, `PORTALIAS`, `portIDX`, `flag`, `arptable`, `insert_date`, `update_date`) VALUES
	('1487072795-0002-7777-0005', '0002-7777-0005', '128.134.101.142', 'C3550', '128.134.101.141', 'V1824R3', '', '5', 'o', '0.0.0.0|64:16:8D:E1:2A:03\n210.91.15.94|64:16:8D:E1:2A:40', '2017-02-14 20:46:35', '2017-02-14 20:46:38'),
	('1487072775-0002-7777-0005', '0002-7777-0005', '128.134.101.142', 'C3550', '128.134.101.141', 'V1824R3', '', '5', 'o', '0.0.0.0|64:16:8D:E1:2A:03\n210.91.15.94|64:16:8D:E1:2A:40', '2017-02-14 20:46:15', '2017-02-14 20:46:17'),
	('1487072531-0002-7777-0005', '0002-7777-0005', '128.134.101.142', 'C3550', '128.134.101.141', 'V1824R3', '', '5', 'o', '0.0.0.0|64:16:8D:E1:2A:03\n210.91.15.94|64:16:8D:E1:2A:40', '2017-02-14 20:42:11', '2017-02-14 20:42:13'),
	('1487072501-0002-7777-0005', '0002-7777-0005', '128.134.101.142', 'C3550', '128.134.101.141', 'V1824R3', '', '5', 'o', '0.0.0.0|64:16:8D:E1:2A:03\n210.91.15.94|64:16:8D:E1:2A:40', '2017-02-14 20:41:41', '2017-02-14 20:41:44'),
	('1487072454-0002-7777-0005', '0002-7777-0005', '128.134.101.142', 'C3550', '128.134.101.141', 'V1824R3', '', '5', 'o', '0.0.0.0|64:16:8D:E1:2A:03\n210.91.15.94|64:16:8D:E1:2A:40', '2017-02-14 20:40:54', '2017-02-14 20:40:56');
/*!40000 ALTER TABLE `line_device_check` ENABLE KEYS */;

-- 테이블 powerdns.line_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `line_info` (
  `line_num` char(14) CHARACTER SET euckr NOT NULL,
  `line_type` char(6) CHARACTER SET euckr DEFAULT NULL COMMENT 'È¸¼± À¯Çü(FTTH|xDSL|NTOPIA|LTE)',
  `l2_ipaddr` char(15) CHARACTER SET euckr DEFAULT NULL COMMENT 'L2Àåºñ IPÁÖ¼Ò',
  `l2_modelname` varchar(30) CHARACTER SET euckr DEFAULT NULL COMMENT 'L2Àåºñ ¸ðµ¨¸í',
  `portIDX` char(17) CHARACTER SET euckr DEFAULT NULL COMMENT 'Æ÷Æ®¹øÈ£',
  `l3_ipaddr` char(15) CHARACTER SET euckr DEFAULT NULL COMMENT 'L3Àåºñ IPÁÖ¼Ò',
  `l3_modelname` varchar(30) CHARACTER SET euckr DEFAULT NULL COMMENT 'L3Àåºñ ¸ðµ¨¸í',
  `PORTALIAS` char(13) CHARACTER SET euckr DEFAULT '',
  `collect_flag` char(1) CHARACTER SET euckr DEFAULT '0',
  `l2_collect_flag` char(1) CHARACTER SET euckr DEFAULT '0',
  `collect_date` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '»óÅÂ ¼öÁý ½Ã°£',
  `admin_status` varchar(10) CHARACTER SET euckr DEFAULT NULL COMMENT 'L2È¸¼± »óÅÂ(admin)',
  `oper_status` varchar(10) CHARACTER SET euckr DEFAULT NULL COMMENT 'L2È¸¼± »óÅÂ(oper)',
  `no_collect_port_flag` char(1) CHARACTER SET euckr DEFAULT NULL COMMENT 'Æ÷Æ® »óÅÂ Á¤º¸ ¼öÁý ºÒ°¡(1:ºÒ°¡ 0:¼öÁýµÊ)',
  `no_collect_port_start_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT 'Æ÷Æ® »óÅÂ Á¤º¸ ¼öÁý ºÒ°¡ ½ÃÀÛ ½Ã°£',
  `no_mac_flag` char(1) CHARACTER SET euckr DEFAULT NULL COMMENT '¸Æ ¼öÁý ¾ÈµÊ(1:¼öÁý ¾ÈµÊ 0:¼öÁýµÊ)',
  `no_mac_start_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '¸Æ ¼öÁý ¾ÈµÇ´Â ½ÃÀÛ ½Ã°£',
  `other_mac_flag` char(1) CHARACTER SET euckr DEFAULT NULL COMMENT 'ºñÀÎ°¡ Mac ¼öÁýµÊ(1:¼öÁýµÊ 0:¼öÁý¾ÈµÊ)',
  `other_mac_start_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT 'ºñÀÎ°¡ Mac ¼öÁý ½ÃÀÛ ½Ã°£',
  `wsping_err_flag` char(1) CHARACTER SET euckr DEFAULT NULL COMMENT 'À§Áî½ºÆ½ PING Fail »óÅÂ(1:ÇÎfail 0:ÇÎÁ¤»ó)',
  `wsping_err_start_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT 'À§Áî½ºÆ½ PING Fail ½ÃÀÛ ½Ã°£',
  `isping_err_flag` char(1) CHARACTER SET euckr DEFAULT '0',
  `no_ws_mac_flag` char(1) CHARACTER SET euckr DEFAULT NULL COMMENT 'À§Áî½ºÆ½ MAC °ËÃâ ¾ÈµÊ(1:°ËÃâ¾ÈµÊ 0:°ËÃâµÊ)',
  `no_ws_mac_start_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT 'À§Áî½ºÆ½ MAC °ËÃâ ¾ÈµÇ´Â ½ÃÀÛ ½Ã°£',
  `ping_flag` char(1) CHARACTER SET euckr DEFAULT '0',
  `normal_flag` char(1) CHARACTER SET euckr DEFAULT NULL COMMENT '¸ðµç°Ô Á¤»ó »óÅÂ(1:Á¤»ó 0:ºñÁ¤»ó)',
  `normal_start_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '¸ðµç°Ô Á¤»ó »óÅÂ ½ÃÀÛ ½Ã°£',
  `use_ap` char(1) CHARACTER SET euckr DEFAULT '0' COMMENT '»ç¼³‚‹À¯±â »ç¿ë Áß(1:»ç¿ëÁß 0:¹Ì»ç¿ë)',
  `monitor` char(1) CHARACTER SET euckr DEFAULT '1' COMMENT '¼öÁý ´ë»ó(1:¼öÁý 0:¼öÁýÁ¦¿Ü)',
  `control_line` char(1) CHARACTER SET euckr DEFAULT '0' COMMENT 'Á¦¾î ´ë»ó(1:Á¦¾î 0:Á¦¾îÁ¦¿Ü(¼öÁýÀºÇÔ))',
  `manual_enable` char(1) CHARACTER SET euckr DEFAULT '0',
  `manual_disable` char(1) CHARACTER SET euckr DEFAULT '0',
  `nw` varchar(10) CHARACTER SET euckr DEFAULT '',
  `collect_arp` char(1) CHARACTER SET euckr DEFAULT 'x',
  `SCN` char(11) CHARACTER SET euckr DEFAULT '',
  `sosok` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.line_info:6 rows 내보내기
/*!40000 ALTER TABLE `line_info` DISABLE KEYS */;
INSERT INTO `line_info` (`line_num`, `line_type`, `l2_ipaddr`, `l2_modelname`, `portIDX`, `l3_ipaddr`, `l3_modelname`, `PORTALIAS`, `collect_flag`, `l2_collect_flag`, `collect_date`, `admin_status`, `oper_status`, `no_collect_port_flag`, `no_collect_port_start_time`, `no_mac_flag`, `no_mac_start_time`, `other_mac_flag`, `other_mac_start_time`, `wsping_err_flag`, `wsping_err_start_time`, `isping_err_flag`, `no_ws_mac_flag`, `no_ws_mac_start_time`, `ping_flag`, `normal_flag`, `normal_start_time`, `use_ap`, `monitor`, `control_line`, `manual_enable`, `manual_disable`, `nw`, `collect_arp`, `SCN`, `sosok`) VALUES
	('0002-9999-1013', NULL, '125.128.62.205', 'DX6524T', '20', '61.72.1.102', 'V5724G', 'A1010011-1018', '0', '0', '2017-06-20 14:47:00', 'up', 'up', '0', '0000-00-00 00:00:00', '0', '0000-00-00 00:00:00', '0', '0000-00-00 00:00:00', '0', '0000-00-00 00:00:00', '0', '0', '0000-00-00 00:00:00', '0', '1', '2017-06-20 14:20:21', '0', '1', '0', '0', '0', '', 'x', '14196991250', 'seoul'),
	('2211-2211-2211', NULL, '125.128.62.205', 'DX6524T', '4', '61.72.1.102', 'V5724G', 'A1001051-1015', '0', '0', '2017-06-20 14:47:00', 'up', 'up', '0', '0000-00-00 00:00:00', '0', '0000-00-00 00:00:00', '0', '0000-00-00 00:00:00', '0', '0000-00-00 00:00:00', '0', '0', '0000-00-00 00:00:00', '0', '1', '2017-06-20 14:20:21', '0', '1', '0', '0', '0', '', 'x', '14197015610', 'seoul'),
	('0000-0000-0001', NULL, '61.72.51.18', 'V5724G', '00:25:A6:4C:FF:52', '61.72.51.18', 'V5724G', 'F011R185-1001', '0', '0', '2017-07-27 13:06:23', 'up', 'down', '1', '2017-07-27 08:08:23', '0', '0000-00-00 00:00:00', '0', '0000-00-00 00:00:00', '0', '0000-00-00 00:00:00', '0', '0', '0000-00-00 00:00:00', '0', '0', '0000-00-00 00:00:00', '0', '1', '1', '0', '0', '', 'x', '20016349240', 'seoul'),
	('0055-0083-3794', NULL, '218.144.28.232', 'MVD5048', '17', '112.188.7.2', 'U9500H', 'V2003071-1017', '0', '0', '2017-07-27 13:06:24', '', '', '0', '0000-00-00 00:00:00', '0', '0000-00-00 00:00:00', '0', '0000-00-00 00:00:00', '0', '0000-00-00 00:00:00', '0', '0', '0000-00-00 00:00:00', '0', '1', '2017-07-27 12:47:54', '0', '1', '1', '0', '0', '', 'x', '14126685720', 'busan'),
	('2222-2222-2222', NULL, '', '', '1', '112.188.7.8', 'U9500H', 'G681U411-1001', '0', '0', '0000-00-00 00:00:00', NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', '0', NULL, '0000-00-00 00:00:00', '0', NULL, '0000-00-00 00:00:00', '0', '1', '0', '0', '0', '', 'x', '', 'busan'),
	('1111-1111-1111', 'LTE', NULL, NULL, NULL, NULL, NULL, '', '0', '0', '0000-00-00 00:00:00', NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', '0', NULL, '0000-00-00 00:00:00', '0', NULL, '0000-00-00 00:00:00', '0', '1', '0', '0', '0', '', 'x', '', NULL);
/*!40000 ALTER TABLE `line_info` ENABLE KEYS */;

-- 테이블 powerdns.line_info_control 구조 내보내기
CREATE TABLE IF NOT EXISTS `line_info_control` (
  `line_num` char(14) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.line_info_control:5 rows 내보내기
/*!40000 ALTER TABLE `line_info_control` DISABLE KEYS */;
INSERT INTO `line_info_control` (`line_num`) VALUES
	('0002-0001-1863'),
	('0002-0001-2729'),
	('0002-0046-9534'),
	('0002-0049-2424'),
	('0002-0050-3771');
/*!40000 ALTER TABLE `line_info_control` ENABLE KEYS */;

-- 테이블 powerdns.local_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `local_info` (
  `sosok` varchar(30) CHARACTER SET euckr NOT NULL COMMENT 'sosok_code',
  `sosok_name` varchar(50) CHARACTER SET euckr DEFAULT NULL COMMENT 'sosok¸í',
  `local_admin_name` varchar(50) CHARACTER SET euckr DEFAULT NULL COMMENT 'Àü»ê½ÇÀå¸í',
  `local_admin_tel` varchar(20) CHARACTER SET euckr DEFAULT NULL COMMENT 'Àü»ê½ÇÀå_¿¬¶ôÃ³'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.local_info:6 rows 내보내기
/*!40000 ALTER TABLE `local_info` DISABLE KEYS */;
INSERT INTO `local_info` (`sosok`, `sosok_name`, `local_admin_name`, `local_admin_tel`) VALUES
	('busan', '부산', '김정민', '010-6888-5871'),
	('byeokjae', '고양', '이미정', '010-5086-1920'),
	('gwangju', '광주', '김형근', '010-5088-4324'),
	('daegu', '대구', '우경숙', '010-5089-0585'),
	('daejeon', '대전', '민억기', '010-3620-6953'),
	('seoul', '서울', '신현준', NULL);
/*!40000 ALTER TABLE `local_info` ENABLE KEYS */;

-- 테이블 powerdns.login_history 구조 내보내기
CREATE TABLE IF NOT EXISTS `login_history` (
  `event_date` datetime DEFAULT '1000-01-01 00:00:00',
  `id` varchar(30) DEFAULT '',
  `login_ipaddr` char(15) DEFAULT '',
  `type` char(6) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.login_history:72 rows 내보내기
/*!40000 ALTER TABLE `login_history` DISABLE KEYS */;
INSERT INTO `login_history` (`event_date`, `id`, `login_ipaddr`, `type`) VALUES
	('2018-07-10 15:33:31', 'gundeok', '61.74.104.102', 'logout'),
	('2018-07-10 15:26:58', 'gundeok', '61.74.104.102', 'login'),
	('2018-07-10 15:34:01', 'gundeok', '61.74.104.102', 'login'),
	('2018-07-10 16:17:00', 'ssadm', '10.201.242.103', 'login'),
	('2018-07-10 16:34:26', 'gundeok', '61.74.104.102', 'login'),
	('2020-03-18 21:34:19', 'gundeok', '211.33.180.194', 'login'),
	('2020-03-18 21:35:51', 'gundeok', '14.52.108.168', 'login'),
	('2020-03-22 18:39:29', 'gundeok', '211.33.180.194', 'login'),
	('2020-03-22 19:20:48', 'gundeok', '211.33.180.194', 'login'),
	('2020-03-24 17:57:41', 'gundeok', '61.82.120.112', 'login'),
	('2020-03-25 00:54:54', 'gundeok', '192.168.0.1', 'login'),
	('2020-03-25 20:45:19', 'gundeok', '192.168.0.1', 'login'),
	('2020-03-26 02:22:15', 'gundeok', '14.52.108.168', 'login'),
	('2020-03-26 17:11:08', 'gundeok', '192.168.0.1', 'login'),
	('2020-03-26 17:13:42', 'gundeok', '192.168.0.1', 'login'),
	('2020-03-26 17:16:08', 'gundeok', '192.168.0.1', 'login'),
	('2020-03-26 23:54:48', 'gundeok', '192.168.0.1', 'login'),
	('2020-03-31 17:27:08', 'gundeok', '192.168.0.1', 'login'),
	('2020-03-31 20:09:05', 'gundeok', '192.168.0.1', 'login'),
	('2020-03-31 20:16:27', 'gundeok', '192.168.0.1', 'login'),
	('2020-03-31 20:16:51', 'gundeok', '192.168.0.1', 'login'),
	('2020-03-31 20:17:54', 'gundeok', '192.168.0.1', 'login'),
	('2020-03-31 20:21:56', 'gundeok', '192.168.0.1', 'login'),
	('2020-03-31 20:24:18', 'gundeok', '192.168.0.1', 'login'),
	('2020-04-01 01:54:03', 'gundeok', '192.168.0.1', 'login'),
	('2020-04-05 16:41:17', 'gundeok', '19.12.20.3', 'login'),
	('2020-04-07 10:20:13', 'cj', '19.12.20.3', 'login'),
	('2020-04-07 10:25:58', 'cj', '19.12.20.3', 'login'),
	('2020-04-07 10:28:34', 'cj', '19.12.20.3', 'login'),
	('2020-04-07 10:32:08', 'cj', '19.12.20.3', 'login'),
	('2020-04-07 10:34:33', 'cj', '19.12.20.3', 'login'),
	('2020-04-07 10:34:45', 'cj', '19.12.20.3', 'login'),
	('2020-04-07 10:34:47', 'cj', '19.12.20.3', 'login'),
	('2020-04-07 10:34:58', 'cj', '19.12.20.3', 'login'),
	('2020-04-07 10:46:49', 'cj', '19.12.20.3', 'login'),
	('2020-04-07 10:46:56', 'cj', '19.12.20.3', 'login'),
	('2020-04-07 10:52:45', 'cj', '19.12.20.3', 'login'),
	('2020-04-07 10:55:28', 'cj', '19.12.20.3', 'login'),
	('2020-04-07 10:57:59', 'cj', '19.12.20.3', 'login'),
	('2020-04-07 10:59:06', 'cj', '19.12.20.3', 'login'),
	('2020-04-07 10:59:54', 'cj', '19.12.20.3', 'login'),
	('2020-04-07 11:00:36', 'cj', '19.12.20.3', 'login'),
	('2020-04-07 11:01:48', 'cj', '19.12.20.3', 'login'),
	('2020-04-07 11:03:19', 'cj', '19.12.20.3', 'login'),
	('2020-04-07 11:03:58', 'cj', '19.12.20.3', 'login'),
	('2020-04-07 11:05:56', 'cj', '19.12.20.3', 'login'),
	('2020-04-07 11:07:01', 'cj', '19.12.20.3', 'login'),
	('2020-04-07 11:08:15', 'cj', '19.12.20.3', 'login'),
	('2020-04-07 11:09:19', 'cj', '19.12.20.3', 'login'),
	('2020-04-07 12:27:50', 'cj', '19.12.20.3', 'login'),
	('2020-04-07 13:38:39', 'cj', '19.12.20.3', 'login'),
	('2020-04-07 17:05:32', 'cj', '19.12.20.3', 'login'),
	('2020-04-08 11:38:42', 'cj', '180.83.201.70', 'login'),
	('2020-04-20 17:15:09', 'cj', '19.12.20.2', 'login'),
	('2020-04-20 17:21:12', 'cj', '19.12.20.2', 'login'),
	('2020-04-20 17:45:14', 'cj', '19.12.20.2', 'login'),
	('2020-04-22 10:20:48', 'cj', '19.12.20.2', 'login'),
	('2020-04-23 12:10:39', 'cj', '19.12.20.2', 'login'),
	('2020-05-14 13:50:28', 'cj', '19.12.20.2', 'login'),
	('2020-05-14 17:34:04', 'cj', '19.12.20.2', 'login'),
	('2020-05-15 17:25:59', 'cj', '19.12.20.2', 'login'),
	('2020-05-15 17:30:16', 'cj', '19.12.20.2', 'login'),
	('2020-05-18 17:09:54', 'cj', '19.12.20.2', 'login'),
	('2020-05-19 14:37:47', 'cj', '19.12.20.2', 'login'),
	('2020-05-19 17:21:53', 'cj', '19.12.20.2', 'login'),
	('2020-05-19 20:10:03', 'cj', '19.12.20.2', 'login'),
	('2020-05-20 09:30:00', 'cj', '19.12.20.2', 'login'),
	('2020-05-20 17:47:55', 'cj', '19.12.20.2', 'login'),
	('2020-05-22 09:57:16', 'cj', '19.12.20.2', 'login'),
	('2020-05-22 10:39:39', 'cj', '19.12.20.2', 'login'),
	('2020-05-22 11:09:35', 'cj', '19.12.20.2', 'login'),
	('2020-05-22 13:37:16', 'cj', '19.12.20.2', 'login');
/*!40000 ALTER TABLE `login_history` ENABLE KEYS */;

-- 테이블 powerdns.mac_filter_list 구조 내보내기
CREATE TABLE IF NOT EXISTS `mac_filter_list` (
  `line_num` char(14) CHARACTER SET euckr DEFAULT '',
  `filter_macaddr` char(17) CHARACTER SET euckr DEFAULT '',
  `l2_ipaddr` char(15) CHARACTER SET euckr DEFAULT '',
  `l2_modelname` varchar(30) CHARACTER SET euckr DEFAULT '',
  `l3_ipaddr` char(15) CHARACTER SET euckr DEFAULT '',
  `l3_modelname` varchar(30) CHARACTER SET euckr DEFAULT '',
  `alive` char(1) CHARACTER SET euckr DEFAULT 'o'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.mac_filter_list:5 rows 내보내기
/*!40000 ALTER TABLE `mac_filter_list` DISABLE KEYS */;
INSERT INTO `mac_filter_list` (`line_num`, `filter_macaddr`, `l2_ipaddr`, `l2_modelname`, `l3_ipaddr`, `l3_modelname`, `alive`) VALUES
	('0002-9999-1013', '00:00:00:00:00:01', '59.5.51.203', 'E5016H', '112.188.7.40', 'U9500H', 'o'),
	('0002-9999-1013', '00:00:00:00:00:02', '59.5.51.203', 'E5016H', '112.188.7.40', 'U9500H', 'x'),
	('0002-9999-1013', '00:00:00:00:00:03', '', '', '112.188.7.40', '', 'x'),
	('0031-0029-7585', 'B8:97:5A:D2:65:E2', '', '', '183.97.250.134', '', 'o'),
	('0033-0016-2886', 'B8:97:5A:D4:D8:97', '118.44.61.194', 'V5724G', '118.44.61.194', 'V5724G', 'o');
/*!40000 ALTER TABLE `mac_filter_list` ENABLE KEYS */;

-- 테이블 powerdns.mac_table 구조 내보내기
CREATE TABLE IF NOT EXISTS `mac_table` (
  `l2_ipaddr` char(15) CHARACTER SET euckr DEFAULT '',
  `portIDX` char(17) CHARACTER SET euckr DEFAULT '',
  `macaddr` char(17) CHARACTER SET euckr DEFAULT '',
  `insert_date` datetime DEFAULT '0000-00-00 00:00:00',
  `update_date` datetime DEFAULT '0000-00-00 00:00:00',
  `ipshare_macaddr` char(17) CHARACTER SET euckr DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.mac_table:5 rows 내보내기
/*!40000 ALTER TABLE `mac_table` DISABLE KEYS */;
INSERT INTO `mac_table` (`l2_ipaddr`, `portIDX`, `macaddr`, `insert_date`, `update_date`, `ipshare_macaddr`) VALUES
	('112.190.190.37', '00:25:A6:4E:DB:C5', '90:9F:33:C4:BB:AD', '2017-05-08 15:14:43', '2017-07-27 13:04:55', ''),
	('112.190.190.37', '00:D0:CB:5D:99:62', '90:9F:33:C4:BB:83', '2017-05-08 15:14:43', '2017-07-06 12:57:15', ''),
	('112.190.190.37', '00:D0:CB:5D:99:62', '00:24:54:94:A7:00', '2017-05-08 15:14:44', '2017-07-06 12:49:21', '90:9F:33:C4:BB:83'),
	('112.190.190.37', '00:D0:CB:5D:99:62', 'E8:00:36:00:FA:0D', '2017-05-08 15:14:44', '2017-07-06 12:49:21', '90:9F:33:C4:BB:83'),
	('112.190.190.37', '00:27:1C:2F:F4:D4', '90:9F:33:C4:7D:03', '2017-05-08 15:14:44', '2017-07-27 13:04:53', '');
/*!40000 ALTER TABLE `mac_table` ENABLE KEYS */;

-- 테이블 powerdns.mac_table_last 구조 내보내기
CREATE TABLE IF NOT EXISTS `mac_table_last` (
  `l2_ipaddr` char(15) CHARACTER SET euckr DEFAULT '',
  `portIDX` char(17) CHARACTER SET euckr DEFAULT '',
  `macaddr` char(17) CHARACTER SET euckr DEFAULT '',
  `insert_date` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.mac_table_last:5 rows 내보내기
/*!40000 ALTER TABLE `mac_table_last` DISABLE KEYS */;
INSERT INTO `mac_table_last` (`l2_ipaddr`, `portIDX`, `macaddr`, `insert_date`) VALUES
	('121.139.237.234', '00:27:1C:F6:F3:B4', 'E8:00:36:01:05:C3', '2017-07-13 08:49:57'),
	('222.113.36.90', '00:25:A6:46:4A:A0', 'E8:00:36:00:F0:F9', '2017-07-13 09:02:59'),
	('121.136.163.10', '00:27:1C:7E:B3:77', '90:9F:33:C5:B3:FB', '2017-07-12 11:30:59'),
	('59.30.205.134', '24', 'E8:00:36:00:FA:8B', '2017-07-13 09:05:23'),
	('59.29.110.106', '00:0E:92:15:88:75', 'E8:00:36:00:F0:FF', '2017-07-12 11:34:24');
/*!40000 ALTER TABLE `mac_table_last` ENABLE KEYS */;

-- 테이블 powerdns.mart_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `mart_info` (
  `line_num` char(14) CHARACTER SET euckr NOT NULL COMMENT 'È¸¼± ¹øÈ£',
  `SCN` char(11) CHARACTER SET euckr DEFAULT '',
  `sosok` varchar(30) CHARACTER SET euckr DEFAULT NULL COMMENT 'Áö¿øº»ºÎÄÚµå',
  `mart_code` varchar(30) CHARACTER SET euckr DEFAULT NULL COMMENT '¸¶Æ®ÄÚµå',
  `mart_name` varchar(100) CHARACTER SET euckr DEFAULT NULL COMMENT '¸¶Æ®¸í',
  `px_admin_name` varchar(50) CHARACTER SET euckr DEFAULT NULL COMMENT '¸¶Æ®°ü¸®°ü',
  `px_admin_tel` varchar(20) CHARACTER SET euckr DEFAULT NULL COMMENT '¸¶Æ®°ü¸®°ü_¿¬¶ôÃ³',
  `mart_tel` varchar(20) CHARACTER SET euckr DEFAULT NULL COMMENT '¸¶Æ®Á÷Åë¹øÈ£',
  `mart_address` varchar(200) CHARACTER SET euckr DEFAULT NULL COMMENT '¸¶Æ® ÁÖ¼Ò(Á÷Á¢ÀÔ·Â)',
  `mart_address_icis` varchar(200) CHARACTER SET euckr DEFAULT NULL COMMENT '¸¶Æ® ÁÖ¼Ò(ICIS)',
  `memo` varchar(200) CHARACTER SET euckr DEFAULT NULL COMMENT '¸Þ¸ð',
  `mart_type` varchar(10) CHARACTER SET euckr DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.mart_info:11 rows 내보내기
/*!40000 ALTER TABLE `mart_info` DISABLE KEYS */;
INSERT INTO `mart_info` (`line_num`, `SCN`, `sosok`, `mart_code`, `mart_name`, `px_admin_name`, `px_admin_tel`, `mart_tel`, `mart_address`, `mart_address_icis`, `memo`, `mart_type`) VALUES
	('0000-0000-0002', '00000000002', 'busan', '00000002', '부산마트', '부', '010-0000-0002', '02-000-0002', '부산', NULL, NULL, ''),
	('0000-0000-0001', '00000000001', 'seoul', '00000001', '서울마트', '서', '010-0000-0001', '02-000-0001', '서울', NULL, NULL, ''),
	('0000-0000-0003', '00000000003', 'busan', '00000003', '부산마트(2)', '부', '010-0000-0003', '02-000-0003', '부산', NULL, NULL, ''),
	('0002-0001-6209', '22456602120', 'seoul', '2230802', 'TEST회선', '강평희', '010-0513-1000', '02-3495-3095', '서울시', '', 'TEST입니다.', 'TEST'),
	('0031-0188-8138', '22456602120', 'dukjeong', '', '26사유격장', '이병덕', '010-5080-9216', NULL, '경기 양주시 산북동 406번지 26사 도락산 유격장 ', NULL, NULL, ''),
	('0032-0136-5461', '24509279370', 'byeokjae', '3270200', NULL, '천병규', '010-2443-1562', NULL, '인천광역시 중구 북성동 1가 104-12 인천해역방어사령부 인천면세마트', NULL, NULL, ''),
	('0055-0055-5369', '24510560380', 'busan', '4023700', '1117공병단191대', '김경택', '010-5088-0943', NULL, '경상남도 김해시 진영읍 의전리 산8 야공단 PX 1117공병단 191대마트', NULL, NULL, ''),
	('0055-0083-3794', '24399823820', 'busan', '4040500', '513포대', '이재영', '010-2626-0604', NULL, '경상남도 창원시 성산구 불모산동 산1 513포대마트', NULL, NULL, ''),
	('0002-9999-1013', '', 'seoul', '2230802', 'LTE회선', '&#49436;&#44221;&#45909;', '010-9886-9286', '02-3495-3095', '&#49436;&#50872; &#51333;&#47196;&#44396; &#51333;&#47196;3&#44600; 33 kt&#44305;&#54868;&#47928;East&#48716;&#46377;', NULL, '&#53945;&#51060;&#49324;&#54637; &#50630;&#51020;.', ''),
	('1111-1111-1111', '11111111111', 'busan', '11111111', '부산충성마트', NULL, NULL, NULL, NULL, NULL, NULL, ''),
	('2222-2222-2222', '22222222222', 'seoul', '22222222', '서울충성마트', NULL, NULL, NULL, NULL, NULL, NULL, '');
/*!40000 ALTER TABLE `mart_info` ENABLE KEYS */;

-- 테이블 powerdns.migrations 구조 내보내기
CREATE TABLE IF NOT EXISTS `migrations` (
  `domain_id` varchar(255) NOT NULL,
  `record_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.migrations:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- 테이블 powerdns.nonsite 구조 내보내기
CREATE TABLE IF NOT EXISTS `nonsite` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `requrl` varchar(255) DEFAULT NULL,
  `reqip` varchar(12) DEFAULT NULL,
  `reqtime` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=262428 DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.nonsite:~30 rows (대략적) 내보내기
/*!40000 ALTER TABLE `nonsite` DISABLE KEYS */;
INSERT INTO `nonsite` (`sno`, `requrl`, `reqip`, `reqtime`) VALUES
	(3, 'www.naver.com', '192.168.56.1', '2020-03-12T08:54:27'),
	(4, 'sex1234.co.kr', '192.168.56.1', '2020-03-12T08:54:12'),
	(5, 'girl.sexy.com', '192.168.56.1', '2020-03-19T09:25:53'),
	(6, 'sexy.com', '192.168.56.1', '2020-03-19T09:25:42'),
	(7, 'girl.co.kr', '192.168.56.1', '2020-03-19T09:26:03'),
	(8, 'www.brother.co.kr', '192.168.56.1', '2020-03-20T08:06:16'),
	(9, 'www.innter.com', '192.168.56.1', '2020-03-20T08:06:00'),
	(10, 'cloud.naver.com', '192.168.56.1', '2020-03-20T08:06:38'),
	(262406, 'www.sex.com', '192.168.56.1', '2020-03-23T08:01:18.960207+09:00'),
	(262407, 'www.naver.co.kr', '192.168.56.1', '2020-03-23T08:00:45.661660+09:00'),
	(262408, 'www.yoogiyo.com', '192.168.56.1', '2020-03-23T08:01:36.467260+09:00'),
	(262409, 'natien.com', '192.168.56.1', '2020-03-23T08:01:02.495729+09:00'),
	(262410, 'www.upload.com', '192.168.56.1', '2020-03-23T08:01:48.172146+09:00'),
	(262411, 'www.sexy.com', '192.168.56.1', '2020-03-24T12:00:07.963804+09:00'),
	(262412, 'www.natein.com', '192.168.56.1', '2020-03-24T13:05:23.305769+09:00'),
	(262413, 'www.natein.com', '192.168.56.1', '2020-03-24T13:05:23.307318+09:00'),
	(262414, 'www.sexy.com', '192.168.56.1', '2020-03-24T12:00:07.964794+09:00'),
	(262415, 'www.jusick.com', '192.168.56.1', '2020-03-24T16:34:34.725825+09:00'),
	(262416, 'www.dwounloader.com', '192.168.56.1', '2020-03-24T16:35:06.879300+09:00'),
	(262417, 'www.dwounloader.com', '192.168.56.1', '2020-03-24T16:35:06.881126+09:00'),
	(262418, 'www.jusick.com', '192.168.56.1', '2020-03-24T16:34:34.727099+09:00'),
	(262419, 'www.commongirl.com', '192.168.56.1', '2020-03-24T16:34:48.300971+09:00'),
	(262420, 'www.commongirl.com', '192.168.56.1', '2020-03-24T16:34:48.302287+09:00'),
	(262421, 'www.sex1abc.com', '112.188.7.8', '2020-03-24T16:47:22.069418+09:00'),
	(262422, 'www.childsex.com', '192.168.56.1', '2020-03-24T16:47:32.961601+09:00'),
	(262423, 'www.abc.com', '192.168.56.1', '2020-03-24T16:47:12.170989+09:00'),
	(262424, 'www.sex.com', '112.188.7.8', '2020-03-25T08:01:27.586851+09:00'),
	(262425, 'www.checklife.com', '192.168.56.1', '2020-03-25T08:01:53.301298+09:00'),
	(262426, 'gaon.co.kr', '192.168.56.1', '2020-03-25T07:59:59.586014+09:00'),
	(262427, 'www.corvid-19.net', '192.168.56.1', '2020-03-25T08:02:20.351058+09:00');
/*!40000 ALTER TABLE `nonsite` ENABLE KEYS */;

-- 테이블 powerdns.nonsite_tb 구조 내보내기
CREATE TABLE IF NOT EXISTS `nonsite_tb` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `requrl` varchar(255) DEFAULT NULL,
  `reqip` varchar(12) DEFAULT NULL,
  `reqtime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.nonsite_tb:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `nonsite_tb` DISABLE KEYS */;
INSERT INTO `nonsite_tb` (`sno`, `requrl`, `reqip`, `reqtime`) VALUES
	(1, 'aaaa.test.com', '192.168.56.1', '2020-03-06'),
	(2, 'abc.test.com', '192.168.56.1', '2020-03-06'),
	(3, 'enteroa.kr', '192.168.56.1', '2020-03-06'),
	(4, 'www.naver.com', '192.168.56.1', '2020-03-06'),
	(5, 'www.test.com', '192.168.56.1', '2020-03-06');
/*!40000 ALTER TABLE `nonsite_tb` ENABLE KEYS */;

-- 테이블 powerdns.orderlist_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `orderlist_info` (
  `line_num` char(14) CHARACTER SET euckr DEFAULT '',
  `workman_seq` int(11) DEFAULT NULL,
  `want_date` date DEFAULT '0000-00-00',
  `install_date` datetime DEFAULT '0000-00-00 00:00:00',
  `callcenter_tel` char(14) CHARACTER SET euckr DEFAULT '',
  `status` char(1) CHARACTER SET euckr DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.orderlist_info:5 rows 내보내기
/*!40000 ALTER TABLE `orderlist_info` DISABLE KEYS */;
INSERT INTO `orderlist_info` (`line_num`, `workman_seq`, `want_date`, `install_date`, `callcenter_tel`, `status`) VALUES
	('0002-9999-1013', 1, '2017-04-03', '2017-04-04 07:24:25', '080-256-1000', '3'),
	('0002-0001-1235', 1, '2017-03-30', '2017-03-27 12:32:22', '080-256-1000', '0'),
	('0002-0002-1234', 1, '2017-04-11', '0000-00-00 00:00:00', '080-256-1000', '2'),
	('0031-0072-1070', 4, '2017-04-21', '2017-04-21 10:49:16', '080-735-2400', '3'),
	('0031-0045-1949', 3, '2017-04-06', '2017-04-11 10:44:56', '080-735-2400', '3');
/*!40000 ALTER TABLE `orderlist_info` ENABLE KEYS */;

-- 테이블 powerdns.order_history_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `order_history_info` (
  `line_num` char(14) CHARACTER SET euckr DEFAULT '',
  `gubun` char(10) CHARACTER SET euckr DEFAULT '',
  `event_date` datetime DEFAULT '0000-00-00 00:00:00',
  `name` varchar(30) CHARACTER SET euckr DEFAULT '',
  `sosok` varchar(100) CHARACTER SET euckr DEFAULT '',
  `tel_num` char(14) CHARACTER SET euckr DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.order_history_info:5 rows 내보내기
/*!40000 ALTER TABLE `order_history_info` DISABLE KEYS */;
INSERT INTO `order_history_info` (`line_num`, `gubun`, `event_date`, `name`, `sosok`, `tel_num`) VALUES
	('0002-9999-1013', 'installed', '2017-04-04 07:24:25', '서경덕', '', '010-9886-9286'),
	('0055-0025-9967', 'work_start', '2017-04-04 08:18:13', '이대승', '부산광역지사', '010-3032-0431'),
	('0002-0082-1403', 'installed', '2017-04-04 09:09:39', '강북네트', '', ''),
	('0041-0033-7936', 'work_start', '2017-04-04 10:18:51', '성의준', '대전지사금산', '010-6735-9899'),
	('0002-9999-1013', 'work_start', '2017-04-03 21:06:24', '서경덕', '통합보안개발TF 개발2팀', '010-9886-9286');
/*!40000 ALTER TABLE `order_history_info` ENABLE KEYS */;

-- 테이블 powerdns.otp_auth 구조 내보내기
CREATE TABLE IF NOT EXISTS `otp_auth` (
  `mobile_num` char(13) CHARACTER SET latin1 NOT NULL,
  `otp_num` char(6) CHARACTER SET latin1 NOT NULL,
  `event_date` datetime DEFAULT '0000-00-00 00:00:00',
  `id` varchar(30) CHARACTER SET latin1 DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.otp_auth:5 rows 내보내기
/*!40000 ALTER TABLE `otp_auth` DISABLE KEYS */;
INSERT INTO `otp_auth` (`mobile_num`, `otp_num`, `event_date`, `id`) VALUES
	('010-7300-3286', '074101', '2017-04-21 15:57:50', ''),
	('--', '795023', '2019-08-23 19:16:08', ''),
	('010-4958-1921', '929232', '2017-06-19 13:14:58', ''),
	('010-7300-1148', '360603', '2017-08-17 15:21:47', ''),
	('010-3456-7652', '897507', '2017-09-25 17:01:11', '');
/*!40000 ALTER TABLE `otp_auth` ENABLE KEYS */;

-- 테이블 powerdns.perm_items 구조 내보내기
CREATE TABLE IF NOT EXISTS `perm_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `descr` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.perm_items:~21 rows (대략적) 내보내기
/*!40000 ALTER TABLE `perm_items` DISABLE KEYS */;
INSERT INTO `perm_items` (`id`, `name`, `descr`) VALUES
	(41, 'zone_master_add', 'User is allowed to add new master zones.'),
	(42, 'zone_slave_add', 'User is allowed to add new slave zones.'),
	(43, 'zone_content_view_own', 'User is allowed to see the content and meta data of zones he owns.'),
	(44, 'zone_content_edit_own', 'User is allowed to edit the content of zones he owns.'),
	(45, 'zone_meta_edit_own', 'User is allowed to edit the meta data of zones he owns.'),
	(46, 'zone_content_view_others', 'User is allowed to see the content and meta data of zones he does not own.'),
	(47, 'zone_content_edit_others', 'User is allowed to edit the content of zones he does not own.'),
	(48, 'zone_meta_edit_others', 'User is allowed to edit the meta data of zones he does not own.'),
	(49, 'search', 'User is allowed to perform searches.'),
	(50, 'supermaster_view', 'User is allowed to view supermasters.'),
	(51, 'supermaster_add', 'User is allowed to add new supermasters.'),
	(52, 'supermaster_edit', 'User is allowed to edit supermasters.'),
	(53, 'user_is_ueberuser', 'User has full access. God-like. Redeemer.'),
	(54, 'user_view_others', 'User is allowed to see other users and their details.'),
	(55, 'user_add_new', 'User is allowed to add new users.'),
	(56, 'user_edit_own', 'User is allowed to edit their own details.'),
	(57, 'user_edit_others', 'User is allowed to edit other users.'),
	(58, 'user_passwd_edit_others', 'User is allowed to edit the password of other users.'),
	(59, 'user_edit_templ_perm', 'User is allowed to change the permission template that is assigned to a user.'),
	(60, 'templ_perm_add', 'User is allowed to add new permission templates.'),
	(61, 'templ_perm_edit', 'User is allowed to edit existing permission templates.');
/*!40000 ALTER TABLE `perm_items` ENABLE KEYS */;

-- 테이블 powerdns.perm_templ 구조 내보내기
CREATE TABLE IF NOT EXISTS `perm_templ` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `descr` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.perm_templ:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `perm_templ` DISABLE KEYS */;
INSERT INTO `perm_templ` (`id`, `name`, `descr`) VALUES
	(1, 'Administrator', 'Administrator template with full rights.');
/*!40000 ALTER TABLE `perm_templ` ENABLE KEYS */;

-- 테이블 powerdns.perm_templ_items 구조 내보내기
CREATE TABLE IF NOT EXISTS `perm_templ_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `templ_id` int(4) NOT NULL,
  `perm_id` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.perm_templ_items:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `perm_templ_items` DISABLE KEYS */;
INSERT INTO `perm_templ_items` (`id`, `templ_id`, `perm_id`) VALUES
	(1, 1, 53);
/*!40000 ALTER TABLE `perm_templ_items` ENABLE KEYS */;

-- 테이블 powerdns.pid_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `pid_info` (
  `l2_ipaddr` char(15) CHARACTER SET euckr NOT NULL,
  `pid` varchar(10) CHARACTER SET euckr DEFAULT '',
  `gubun` varchar(50) CHARACTER SET euckr DEFAULT '',
  `close_flag` char(1) CHARACTER SET euckr DEFAULT 'x',
  `collect_date` datetime DEFAULT '0000-00-00 00:00:00',
  `collect_flag` char(1) CHARACTER SET euckr DEFAULT '0',
  `ping_flag` char(1) CHARACTER SET euckr DEFAULT '0',
  `server_hostname` varchar(50) CHARACTER SET euckr DEFAULT 'c-aih-pk1-a21'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.pid_info:5 rows 내보내기
/*!40000 ALTER TABLE `pid_info` DISABLE KEYS */;
INSERT INTO `pid_info` (`l2_ipaddr`, `pid`, `gubun`, `close_flag`, `collect_date`, `collect_flag`, `ping_flag`, `server_hostname`) VALUES
	('59.8.159.6', '28539', '/common/htdocs/homehub/get_telnet.php', 'x', '2017-07-27 13:54:28', '0', '0', 'c-aih-pk1-a21'),
	('59.24.57.178', '2238', 'get_telnet.php', 'x', '2017-05-07 13:39:03', '0', '0', 'c-aih-pk1-a21'),
	('175.215.173.254', '25861', '/common/htdocs/homehub/get_telnet.php', 'x', '2017-07-27 13:54:28', '0', '0', 'c-aih-pk1-a21'),
	('220.76.130.42', '26889', '/common/htdocs/homehub/get_telnet.php', 'x', '2017-07-27 13:55:09', '0', '0', 'c-aih-pk1-a21'),
	('168.126.206.218', '32014', '/common/htdocs/homehub/get_telnet.php', 'x', '2017-06-15 09:52:29', '0', '0', 'c-aih-pk1-a21');
/*!40000 ALTER TABLE `pid_info` ENABLE KEYS */;

-- 테이블 powerdns.pos_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `pos_info` (
  `pos_macaddr` char(17) CHARACTER SET euckr NOT NULL COMMENT 'POS¸Æ',
  `pos_ipaddr` char(15) CHARACTER SET euckr DEFAULT NULL COMMENT 'POS IP',
  `line_num` char(14) CHARACTER SET euckr DEFAULT NULL COMMENT 'È¸¼±¹øÈ£',
  `pos_type` int(1) DEFAULT 1 COMMENT 'ÁÖ/ºÎPOS¿©ºÎÀÌ°í ´Üµ¶ÀÎ °æ¿ì ÁÖPOS·Î Ç¥½Ã(1:ÁÖPOS 2:ºÎPOS)',
  `pos_mac_collect` char(1) CHARACTER SET euckr DEFAULT 'x' COMMENT 'POS MAC ¼öÁý ¿©ºÎ (o:¼öÁý x:¹Ì¼öÁý)',
  `pos_mac_collect_date` datetime DEFAULT '0000-00-00 00:00:00' COMMENT 'POS MAC ¼öÁý ÀÏÀÚ'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.pos_info:5 rows 내보내기
/*!40000 ALTER TABLE `pos_info` DISABLE KEYS */;
INSERT INTO `pos_info` (`pos_macaddr`, `pos_ipaddr`, `line_num`, `pos_type`, `pos_mac_collect`, `pos_mac_collect_date`) VALUES
	('B8:97:5A:D4:DC:E4', '', '0033-0051-0666', 2, 'x', '0000-00-00 00:00:00'),
	('B8:97:5A:D4:D7:86', '', '0053-0030-0853', 2, 'x', '0000-00-00 00:00:00'),
	('B8:97:5A:D4:DE:35', NULL, '0033-0010-6809', 1, 'x', '0000-00-00 00:00:00'),
	('B8:97:5A:D2:65:F3', NULL, '', 1, 'x', '0000-00-00 00:00:00'),
	('B8:97:5A:D4:DC:E3', '220.94.193.207', '0002-9999-1013', 1, 'x', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `pos_info` ENABLE KEYS */;

-- 테이블 powerdns.records 구조 내보내기
CREATE TABLE IF NOT EXISTS `records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `ttl` int(11) DEFAULT NULL,
  `prio` int(11) DEFAULT NULL,
  `change_date` int(11) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT 0,
  `ordername` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `auth` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `nametype_index` (`name`,`type`),
  KEY `domain_id` (`domain_id`),
  KEY `recordorder` (`domain_id`,`ordername`)
) ENGINE=InnoDB AUTO_INCREMENT=432 DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.records:~36 rows (대략적) 내보내기
/*!40000 ALTER TABLE `records` DISABLE KEYS */;
INSERT INTO `records` (`id`, `domain_id`, `name`, `type`, `content`, `ttl`, `prio`, `change_date`, `disabled`, `ordername`, `auth`) VALUES
	(1, 1, 'db.io', 'SOA', 'admin.db.io', 86400, NULL, NULL, 0, NULL, 1),
	(2, 1, 'aaa.db.io', 'A', '192.0.0.1', 0, NULL, NULL, 0, NULL, 1),
	(3, 1, 'bbb.db.io', 'A', '192.0.0.2', 0, NULL, NULL, 0, NULL, 1),
	(4, 1, 'ccc.db.io', 'A', '192.0.0.3', 0, NULL, NULL, 0, NULL, 1),
	(5, 2, 'www.enteroa.kr', 'A', '222.222.222.1', 86400, 0, 1583452696, 0, NULL, 1),
	(6, 2, 'aaa.enteroa.kr', 'A', '222.222.222.1', 86400, 0, 1583452733, 0, NULL, 1),
	(8, 5, 'google.com', 'SOA', 'ns1.testdns.com localhost 2020030601 28800 7200 604800 86400', 86400, 0, 1583453365, 0, NULL, 1),
	(10, 6, 'test1234', 'SOA', 'localhost 2020030601 28800 7200 604800 86400', 86400, 0, 1583984469, 0, NULL, 1),
	(11, 6, 'www.test1234', 'A', '123.123.123.123', 86400, 0, 1583984497, 0, NULL, 1),
	(13, 6, 'aaa.test1234', 'A', '124.124.124.1', 86400, 0, 1583984610, 0, NULL, 1),
	(14, 6, 'bbb.test1234', 'A', '124.124.124.2', 86400, 0, 1583984620, 0, NULL, 1),
	(65, 40, 'www.test.com', 'SOA', 'ns1.testdns.com localhost 2020030601 28800 7200 604800 86400', 86400, 0, 1585027873, 0, '', 1),
	(66, 40, 'www.test.com', 'A', '69.172.200.235', 86400, 0, 1585027873, 0, '', 1),
	(72, 43, 'www.gaon.co.kr', 'SOA', 'ns1.testdns.com localhost 2020030601 28800 7200 604800 86400', 86400, 0, 1585027873, 0, '', 1),
	(73, 43, 'www.gaon.co.kr', 'A', '183.111.227.50', 86400, 0, 1585027873, 0, '', 1),
	(76, 45, 'www.natien.com', 'SOA', 'admin.natien.com', 86400, 0, 1585027882, 0, '', 1),
	(77, 45, 'www.natien.com', 'A', '69.172.201.153', 86400, 0, 1585027882, 0, '', 1),
	(411, 174, 'www.build.com', 'SOA', 'www.build.com localhost 20200514 28800 7200 604800 86400', 86400, 0, 1589431443, 0, '', 1),
	(412, 174, 'www.build.com', 'A', '151.101.229.23', 86400, 0, 1589431443, 0, '', 1),
	(415, 176, 'www.naver.com', 'SOA', 'www.naver.com localhost 20200514 28800 7200 604800 86400', 86400, 0, 1589431443, 0, '', 1),
	(416, 176, 'www.naver.com', 'A', '210.89.164.90', 86400, 0, 1589431443, 0, '', 1),
	(417, 176, 'www.naver.com', 'A', '210.89.160.88', 86400, 0, 1589431443, 0, '', 1),
	(418, 177, 'www.google.com', 'SOA', 'www.google.com localhost 20200514 28800 7200 604800 86400', 86400, 0, 1589431443, 0, '', 1),
	(419, 177, 'www.google.com', 'A', '172.217.175.68', 86400, 0, 1589431443, 0, '', 1),
	(420, 178, 'www.apache.org', 'SOA', 'www.apache.org localhost 20200514 28800 7200 604800 86400', 86400, 0, 1589431443, 0, '', 1),
	(421, 178, 'www.apache.org', 'A', '95.216.24.32', 86400, 0, 1589431443, 0, '', 1),
	(422, 178, 'www.apache.org', 'A', '40.79.78.1', 86400, 0, 1589431443, 0, '', 1),
	(423, 179, 'www.facebook.com', 'SOA', 'www.facebook.com localhost 20200514 28800 7200 604800 86400', 86400, 0, 1589431443, 0, '', 1),
	(424, 179, 'www.facebook.com', 'A', '157.240.215.35', 86400, 0, 1589431443, 0, '', 1),
	(425, 180, 'www.daum.net', 'SOA', 'www.daum.net localhost 20200514 28800 7200 604800 86400', 86400, 0, 1589431443, 0, '', 1),
	(426, 180, 'www.daum.net', 'A', '211.231.99.17', 86400, 0, 1589431443, 0, '', 1),
	(427, 180, 'www.daum.net', 'A', '203.133.167.81', 86400, 0, 1589431443, 0, '', 1),
	(428, 181, 'cnwiz.asuscomm.com', 'SOA', 'cnwiz.asuscomm.com localhost 20200514 28800 7200 604800 86400', 86400, 0, 1589431443, 0, '', 1),
	(429, 181, 'cnwiz.asuscomm.com', 'A', '121.138.24.29', 86400, 0, 1589431443, 0, '', 1),
	(430, 182, 'welfare', 'SOA', 'welfare.kt.com localhost 20200514 28800 7200 604800 60', 60, NULL, NULL, 0, NULL, 1),
	(431, 182, 'welfare', 'A', '122.122.122.123', 60, NULL, NULL, 0, NULL, 1);
/*!40000 ALTER TABLE `records` ENABLE KEYS */;

-- 테이블 powerdns.records_zone_templ 구조 내보내기
CREATE TABLE IF NOT EXISTS `records_zone_templ` (
  `domain_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `zone_templ_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.records_zone_templ:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `records_zone_templ` DISABLE KEYS */;
/*!40000 ALTER TABLE `records_zone_templ` ENABLE KEYS */;

-- 테이블 powerdns.security_policy 구조 내보내기
CREATE TABLE IF NOT EXISTS `security_policy` (
  `security_policy_seq` int(11) NOT NULL AUTO_INCREMENT,
  `security_policy_version` varchar(12) NOT NULL,
  `security_policy_desc` varchar(200) DEFAULT NULL COMMENT '보안정책설명',
  `reg_dtm` char(20) DEFAULT NULL,
  `reg_id` char(20) DEFAULT NULL,
  `group_seq` int(8) NOT NULL,
  PRIMARY KEY (`security_policy_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=20200384 DEFAULT CHARSET=utf8 COMMENT='보안정책 버전 관리';

-- 테이블 데이터 powerdns.security_policy:~17 rows (대략적) 내보내기
/*!40000 ALTER TABLE `security_policy` DISABLE KEYS */;
INSERT INTO `security_policy` (`security_policy_seq`, `security_policy_version`, `security_policy_desc`, `reg_dtm`, `reg_id`, `group_seq`) VALUES
	(20200312, '20200312_100', 'Its my first test ', '2020-03-12 14:14:31', 'peterkang', 10000000),
	(20200322, 'secur_2022', 'Its my third test', '2020-04-06 12:51:57', 'peterkang', 10000001),
	(20200325, '20200512_103', '테스트3', '2020-05-12 18:15:58', '', 10000000),
	(20200355, '20200514_104', '20200514::apache축 테스트 10', '2020-05-14 09:17:38', '', 10000000),
	(20200371, '20200514_107', '[20200514 13:44:04]:: 크론탭 실행 생성', '2020-05-14 13:44:03', NULL, 10000000),
	(20200372, '20200514_108', '[20200514 13:44:05]:: 크론탭 실행 생성', '2020-05-14 13:44:03', NULL, 10000001),
	(20200373, '20200514_109', '아마존 서비스 추가', '2020-05-14 13:52:09', '', 10000000),
	(20200374, '20200514_110', '코드이그나이터 추가', '2020-05-14 13:54:56', '', 10000001),
	(20200375, '20200514_111', '알고림즘 추가', '2020-05-14 15:02:24', '', 10000000),
	(20200376, '20200514_112', '구글 추가', '2020-05-14 15:15:22', '', 10000001),
	(20200377, '20200514_113', '구글추가2', '2020-05-14 15:18:36', '', 10000001),
	(20200378, '20200514_114', '구글 추가 7', '2020-05-14 15:20:54', '', 10000001),
	(20200379, '20200514_115', '삼성 추가 9', '2020-05-14 15:27:18', '', 10000001),
	(20200380, '20200514_116', 'lg 전자 추가 11', '2020-05-14 15:28:48', '', 10000001),
	(20200381, '20200514_117', '엘지전자 추가12', '2020-05-14 15:31:13', '', 10000000),
	(20200382, '20200514_118', 'wix 추가 1', '2020-05-14 15:35:23', '', 10000000),
	(20200383, '20200514_119', '홈택스 추가 20', '2020-05-14 15:40:29', '', 10000001);
/*!40000 ALTER TABLE `security_policy` ENABLE KEYS */;

-- 테이블 powerdns.security_policy_detail 구조 내보내기
CREATE TABLE IF NOT EXISTS `security_policy_detail` (
  `security_policy_seq` int(11) NOT NULL,
  `security_policy_detail_seq` int(11) NOT NULL,
  `site_name` varchar(100) DEFAULT NULL,
  `site_url` varchar(100) DEFAULT NULL,
  `site_ip` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`security_policy_seq`,`security_policy_detail_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.security_policy_detail:~81 rows (대략적) 내보내기
/*!40000 ALTER TABLE `security_policy_detail` DISABLE KEYS */;
INSERT INTO `security_policy_detail` (`security_policy_seq`, `security_policy_detail_seq`, `site_name`, `site_url`, `site_ip`) VALUES
	(20200312, 1234, 'test.com', 'www.test.com', '69.172.200.235'),
	(20200312, 1235, 'naver.com', 'www.naver.com', '210.89.160.88|210.89.164.90'),
	(20200312, 1236, 'google.com', 'www.google.com', '172.217.26.4|2404:6800:4004:809:0:0:0:2004'),
	(20200312, 1237, 'gaon.co.kr', 'www.gaon.co.kr', '183.111.227.50'),
	(20200312, 1242, 'cnwiz.asuscomm.com', 'cnwiz.asuscomm.com', '121.138.24.29'),
	(20200322, 1240, 'facebook.com', 'www.facebook.com', '157.240.215.35|2a03:2880:f156:82:face:b00c:0:25de'),
	(20200322, 1241, 'daum', 'www.daum.net', '211.231.99.17|203.133.167.81'),
	(20200322, 1244, 'cnwiz.asuscomm.com', 'cnwiz.asuscomm.com', '121.138.24.29'),
	(20200325, 1238, 'build.com', 'www.build.com', '151.101.229.23'),
	(20200325, 1243, 'cnwiz.asuscomm.com', 'cnwiz.asuscomm.com', '121.138.24.29'),
	(20200325, 1244, 'NAVER corp', 'www.naver.com', '210.89.160.88|210.89.164.90'),
	(20200325, 1245, 'GOOGLE', 'www.google.com', '172.217.175.68'),
	(20200355, 1247, 'build.com', 'www.build.com', '151.101.229.23'),
	(20200355, 1248, 'cnwiz.asuscomm.com', 'cnwiz.asuscomm.com', '121.138.24.29'),
	(20200355, 1249, 'NAVER corp', 'www.naver.com', '125.209.222.142|210.89.160.88'),
	(20200355, 1250, 'GOOGLE', 'www.google.com', '172.217.175.68'),
	(20200355, 1251, 'apache', 'www.apache.org', '40.79.78.1|95.216.24.32'),
	(20200371, 1260, 'build.com', 'www.build.com', '151.101.229.23'),
	(20200371, 1261, 'cnwiz.asuscomm.com', 'cnwiz.asuscomm.com', '121.138.24.29'),
	(20200371, 1262, 'NAVER corp', 'www.naver.com', '210.89.164.90|210.89.160.88'),
	(20200371, 1263, 'GOOGLE', 'www.google.com', '172.217.175.68'),
	(20200371, 1264, 'apache', 'www.apache.org', '95.216.24.32|40.79.78.1'),
	(20200372, 1265, 'facebook.com', 'www.facebook.com', '157.240.215.35'),
	(20200372, 1266, 'daum', 'www.daum.net', '211.231.99.17|203.133.167.81'),
	(20200372, 1267, 'cnwiz.asuscomm.com', 'cnwiz.asuscomm.com', '121.138.24.29'),
	(20200373, 1266, 'build.com', 'www.build.com', '151.101.109.23'),
	(20200373, 1268, 'NAVER corp', 'www.naver.com', '210.89.164.90|210.89.160.88'),
	(20200373, 1269, 'GOOGLE', 'www.google.com', '172.217.175.68'),
	(20200373, 1270, 'apache', 'www.apache.org', '40.79.78.1|95.216.24.32'),
	(20200373, 1271, '아마존 웹서비스', 'aws.amazon.com', '13.225.123.72'),
	(20200374, 1269, 'facebook.com', 'www.facebook.com', '157.240.215.35'),
	(20200374, 1270, 'daum', 'www.daum.net', '203.133.167.16|211.231.99.80'),
	(20200374, 1271, 'cnwiz.asuscomm.com', 'cnwiz.asuscomm.com', '121.138.24.29'),
	(20200374, 1272, '코드이그나이터', 'www.cikorea.net', '203.245.41.133'),
	(20200375, 1273, 'build.com', 'www.build.com', '151.101.109.23'),
	(20200375, 1274, 'NAVER corp', 'www.naver.com', '210.89.160.88|125.209.222.142'),
	(20200375, 1275, 'GOOGLE', 'www.google.com', '172.217.175.4'),
	(20200375, 1276, 'apache', 'www.apache.org', '95.216.24.32|40.79.78.1'),
	(20200375, 1277, '아마존 웹서비스', 'aws.amazon.com', '13.225.123.72'),
	(20200375, 1278, '알고리즘', 'opentutorials.org', '13.124.77.38'),
	(20200376, 1246, 'facebook.com', 'www.facebook.com', '157.240.215.35'),
	(20200376, 1247, 'daum', 'www.daum.net', '211.231.99.17|203.133.167.81'),
	(20200376, 1248, 'cnwiz.asuscomm.com', 'cnwiz.asuscomm.com', '121.138.24.29'),
	(20200377, 1246, 'facebook.com', 'www.facebook.com', '157.240.215.35'),
	(20200377, 1247, 'daum', 'www.daum.net', '203.133.167.81|211.231.99.17'),
	(20200377, 1248, 'cnwiz.asuscomm.com', 'cnwiz.asuscomm.com', '121.138.24.29'),
	(20200377, 1279, 'GOOGLE', 'www.google.com', '172.217.25.68'),
	(20200378, 1274, 'facebook.com', 'www.facebook.com', '157.240.215.35'),
	(20200378, 1275, 'daum', 'www.daum.net', '211.231.99.17|203.133.167.81'),
	(20200378, 1276, 'cnwiz.asuscomm.com', 'cnwiz.asuscomm.com', '121.138.24.29'),
	(20200378, 1277, '코드이그나이터', 'www.cikorea.net', '203.245.41.133'),
	(20200378, 1280, 'google', 'www.google.com', '172.217.175.68'),
	(20200379, 1282, 'facebook.com', 'www.facebook.com', '157.240.215.35'),
	(20200379, 1283, 'daum', 'www.daum.net', '203.133.167.81|211.231.99.17'),
	(20200379, 1284, 'cnwiz.asuscomm.com', 'cnwiz.asuscomm.com', '121.138.24.29'),
	(20200379, 1285, '코드이그나이터', 'www.cikorea.net', '203.245.41.133'),
	(20200379, 1286, 'google', 'www.google.com', '172.217.175.4'),
	(20200379, 1287, 'SAMSUNG', 'www.samsung.com', '104.74.153.80'),
	(20200380, 1246, 'facebook.com', 'www.facebook.com', '157.240.215.35'),
	(20200380, 1247, 'daum', 'www.daum.net', '203.133.167.81|211.231.99.17'),
	(20200380, 1248, 'cnwiz.asuscomm.com', 'cnwiz.asuscomm.com', '121.138.24.29'),
	(20200380, 1288, '엘지전자', 'www.lge.co.kr', '165.244.62.83'),
	(20200381, 1244, 'test.com', 'www.test.com', '69.172.200.235'),
	(20200381, 1245, 'naver.com', 'www.naver.com', '125.209.222.141|210.89.164.90'),
	(20200381, 1246, 'google.com', 'www.google.com', '172.217.175.68'),
	(20200381, 1247, 'gaon.co.kr', 'www.gaon.co.kr', '183.111.227.50'),
	(20200381, 1248, 'cnwiz.asuscomm.com', 'cnwiz.asuscomm.com', '121.138.24.29'),
	(20200381, 1289, '엘지전자', 'www.lge.co.kr', '165.244.62.83'),
	(20200382, 1245, 'build.com', 'www.build.com', '151.101.109.23'),
	(20200382, 1246, 'natien grup', 'www.natien.com', '198.58.118.167|45.33.23.183|45.79.19.196|45.33.2.79|45.56.79.23'),
	(20200382, 1247, 'cnwiz.asuscomm.com', 'cnwiz.asuscomm.com', '121.138.24.29'),
	(20200382, 1290, 'WIX', 'www.wix.com', '185.230.60.98'),
	(20200383, 1267, 'LG', 'LG', '165.244.62.23'),
	(20200383, 1290, 'facebook.com', 'www.facebook.com', '157.240.215.35'),
	(20200383, 1291, 'daum', 'www.daum.net', '211.231.99.17|203.133.167.81'),
	(20200383, 1292, 'cnwiz.asuscomm.com', 'cnwiz.asuscomm.com', '121.138.24.29'),
	(20200383, 1293, '엘지전자', 'www.lge.co.kr', '165.244.62.83'),
	(20200383, 1294, '국세청 홈택스', 'www.hometax.go.kr', '116.67.103.140'),
	(20200383, 1295, 'KT.com', 'KT.com', '14.63.149.115'),
	(20200383, 1296, 'apple', 'apple', '17.172.224.47|17.178.96.59|17.142.160.59'),
	(20200383, 1297, 'LG', 'LG', '165.244.62.23');
/*!40000 ALTER TABLE `security_policy_detail` ENABLE KEYS */;

-- 테이블 powerdns.security_policy_group 구조 내보내기
CREATE TABLE IF NOT EXISTS `security_policy_group` (
  `group_seq` int(8) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(30) DEFAULT NULL,
  `use_yn` char(1) DEFAULT NULL,
  `reg_dtm` datetime DEFAULT NULL,
  `group_type` varchar(10) DEFAULT NULL,
  `suffix` varchar(500) DEFAULT NULL,
  `prefix` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`group_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=10000002 DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.security_policy_group:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `security_policy_group` DISABLE KEYS */;
INSERT INTO `security_policy_group` (`group_seq`, `group_name`, `use_yn`, `reg_dtm`, `group_type`, `suffix`, `prefix`) VALUES
	(10000000, '관리자', 'Y', '2020-04-23 14:51:56', '그룹1', '\r\niptables -A FORWARD -p udp -j ACCEPT\r\niptables -t nat -A POSTROUTING -j MASQUERADE\r\niptables -A FORWARD -p icmp -j ACCEPT\r\niptables -t nat -A PREROUTING -p tcp -i eth0 --dport 1433 -j DNAT --to 10.254.250.2:143', '\r\niptables -P INPUT ACCEPT \r\niptables -P FORWARD DROP \r\niptables -P OUTPUT ACCEPT \r\niptables -F iptables -X iptables -t nat -F \r\niptables -t nat -X \r\niptables -A FORWARD -p udp -j ACCEPT \r\niptables -t nat -A POSTROUTING -j MASQUERADE iptables -A FORWARD -p icmp -j ACCEPT \r\niptables -t nat -A PREROUTING -p tcp -i eth0 --dport 1433 -j DNAT --to 10.254.250.2:143'),
	(10000001, '일반', 'Y', '2020-04-23 14:53:02', '그룹2', 'iptables -A FORWARD -p udp -j ACCEPT\niptables -t nat -A POSTROUTING -j MASQUERADE\niptables -A FORWARD -p icmp -j ACCEPT\niptables -t nat -A PREROUTING -p tcp -i eth0 --dport 1433 -j DNAT --to 10.254.250.2:143\niptables -A KT_FORWARD -d 157.240.215.35/32 -p tcp -j ACCEPT\niptables -A KT_FORWARD -d 211.231.99.17/32 -p tcp -j ACCEPT\niptables -A KT_FORWARD -d 203.133.167.81/32 -p tcp -j ACCEPT\niptables -A KT_FORWARD -d 121.138.24.29/32 -p tcp -j ACCEPT', 'iptables -P INPUT ACCEPT \niptables -P FORWARD DROP \niptables -P OUTPUT ACCEPT \niptables -F iptables -X iptables -t nat -F \niptables -t nat -X \niptables -A FORWARD -p udp -j ACCEPT \niptables -t nat -A POSTROUTING -j MASQUERADE iptables -A FORWARD -p icmp -j ACCEPT \niptables -t nat -A PREROUTING -p tcp -i eth0 --dport 1433 -j DNAT --to 10.254.250.2:143');
/*!40000 ALTER TABLE `security_policy_group` ENABLE KEYS */;

-- 테이블 powerdns.security_policy_group_mapping 구조 내보내기
CREATE TABLE IF NOT EXISTS `security_policy_group_mapping` (
  `group_seq` int(8) NOT NULL,
  `line_num` char(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.security_policy_group_mapping:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `security_policy_group_mapping` DISABLE KEYS */;
INSERT INTO `security_policy_group_mapping` (`group_seq`, `line_num`) VALUES
	(10000000, '0000-0000-0001'),
	(10000000, '0055-0083-3794'),
	(10000001, '2222-2222-2222'),
	(10000000, '1111-1111-1111');
/*!40000 ALTER TABLE `security_policy_group_mapping` ENABLE KEYS */;

-- 테이블 powerdns.send_sms 구조 내보내기
CREATE TABLE IF NOT EXISTS `send_sms` (
  `line_num` char(14) CHARACTER SET euckr DEFAULT '',
  `gubun` char(1) CHARACTER SET euckr DEFAULT '',
  `content` varchar(500) CHARACTER SET euckr DEFAULT NULL,
  `insert_date` datetime DEFAULT '0000-00-00 00:00:00',
  `send_flag` char(1) CHARACTER SET euckr DEFAULT 'x',
  `send_date` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.send_sms:5 rows 내보내기
/*!40000 ALTER TABLE `send_sms` DISABLE KEYS */;
INSERT INTO `send_sms` (`line_num`, `gubun`, `content`, `insert_date`, `send_flag`, `send_date`) VALUES
	('0002-0004-4138', '1', '', '2017-02-09 23:42:25', 'x', '0000-00-00 00:00:00'),
	('0002-0004-4138', '1', '', '2017-02-09 23:48:59', 'x', '0000-00-00 00:00:00'),
	('0002-0004-4138', '1', '', '2017-02-11 10:44:34', 'x', '0000-00-00 00:00:00'),
	('0002-0004-4138', '1', '', '2017-02-12 12:30:11', 'x', '0000-00-00 00:00:00'),
	('0002-0004-4138', '1', '', '2017-02-12 13:36:32', 'x', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `send_sms` ENABLE KEYS */;

-- 테이블 powerdns.supermasters 구조 내보내기
CREATE TABLE IF NOT EXISTS `supermasters` (
  `ip` varchar(25) NOT NULL,
  `nameserver` varchar(255) NOT NULL,
  `account` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.supermasters:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `supermasters` DISABLE KEYS */;
INSERT INTO `supermasters` (`ip`, `nameserver`, `account`) VALUES
	('192.168.56.101', 'pdns', 'admin');
/*!40000 ALTER TABLE `supermasters` ENABLE KEYS */;

-- 테이블 powerdns.terminal 구조 내보내기
CREATE TABLE IF NOT EXISTS `terminal` (
  `serial` varchar(255) DEFAULT '' COMMENT '단말 시리얼',
  `modelname` varchar(255) DEFAULT '' COMMENT '단말 모델명',
  `macaddr` char(17) DEFAULT '' COMMENT 'mac주소(wan)',
  `ipaddr` char(15) DEFAULT '' COMMENT 'ip주소',
  `subnet` char(15) DEFAULT '' COMMENT '외부네트워크 서브넷',
  `gateway` char(15) DEFAULT '' COMMENT '외부네트워크 게이트웨이',
  `dns_1` char(15) DEFAULT '' COMMENT '외부네트워크 1차DNS',
  `dns_2` char(15) DEFAULT '' COMMENT '외부네트워크 2차DNS',
  `Real_IP` char(15) NOT NULL DEFAULT '' COMMENT '공인IP',
  `ipaddr_type` char(6) DEFAULT '' COMMENT 'IP유형(dhcp|static)',
  `wifiutm_group` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_bin NOT NULL DEFAULT '' COMMENT '제어서버의wizstick_Group값',
  `reg_date` datetime DEFAULT current_timestamp() COMMENT '등록일',
  `update_date` datetime DEFAULT current_timestamp() COMMENT '수정일',
  `beacon_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00' COMMENT '제어서버 Beacon확인시간',
  `network_status` varchar(30) DEFAULT '',
  `network_status_date` datetime DEFAULT '1000-01-01 00:00:00',
  `int_ipaddr` char(15) DEFAULT '' COMMENT '내부네트워크 IP주소',
  `int_subnet` char(15) DEFAULT '' COMMENT '내부네트워크 서브넷',
  `int_dns1` char(15) DEFAULT '',
  `int_dns2` char(15) DEFAULT '',
  `dhcp_server_enable` char(1) DEFAULT '' COMMENT '내부네트워크 DHCP서버 동작 여부',
  `dhcp_ip_pool_start` char(15) DEFAULT '' COMMENT 'DHCP IP Pool 시작IP',
  `dhcp_ip_pool_end` char(15) DEFAULT '' COMMENT 'DHCP IP Pool 종료IP',
  `dhcp_premium_ip_pool_start` char(15) DEFAULT '',
  `dhcp_premium_ip_pool_end` char(15) DEFAULT '',
  `line_id` varchar(255) DEFAULT '' COMMENT '회선정보',
  `firmware_version` varchar(20) DEFAULT '' COMMENT '펌웨어 버전',
  `fireware_update` char(1) DEFAULT '',
  `wireless_24_status` char(1) DEFAULT '' COMMENT '무선 네트워크 설정(2.4GHz) 동작상태(1:동작, 2:중단)',
  `wireless_24_ssid` varchar(255) DEFAULT '' COMMENT '무선 네트워크 설정(2.4GHz) SSID',
  `wireless_24_ssid_check1` char(1) DEFAULT '1' COMMENT '무선 네트워크 설정(2.4GHz) SSID 뒤 4자리 랜덤생성(1:미체크 2:체크)',
  `wireless_24_ssid_check2` char(1) DEFAULT '1' COMMENT '무선 네트워크 설정(2.4GHz) SSID Hidden SSID(1:미체크 2:체크)',
  `wireless_24_ssid_key` varchar(255) DEFAULT '' COMMENT '무선 네트워크 설정(2.4GHz) SSID Key',
  `wireless_24_security_type` char(10) DEFAULT '' COMMENT '무선 네트워크 설정(2.4GHz) 암호화 방법 (no:무인증, wpapsk:WPA-PSK)',
  `wireless_24_wpa_mode` char(10) DEFAULT '' COMMENT '무선 네트워크 설정(2.4GHz) WPA Mode(wpa:WPA,wpa2:WPA2,wpawpa2:WPAnWPA2) ',
  `wireless_24_encryption_type` char(10) DEFAULT '' COMMENT '무선 네트워크 설정(2.4GHz) Encryption Type(tkip:TKIP,aes:AES,tkipaes:TKIPnAES)',
  `wireless_24_channel` varchar(10) DEFAULT '' COMMENT '무선 네트워크 설정(2.4GHz) 설정한 채널번호',
  `wireless_24_channel_now` varchar(10) DEFAULT '' COMMENT '무선 네트워크 설정(2.4GHz) 현재 동작 중인 채널번호',
  `wireless_5_status` char(1) DEFAULT '' COMMENT '무선 네트워크 설정(5GHz) 동작상태(1:동작, 2:중단)',
  `wireless_5_ssid` varchar(255) DEFAULT '' COMMENT '무선 네트워크 설정(5GHz) SSID',
  `wireless_5_ssid_check1` char(1) DEFAULT '1' COMMENT '무선 네트워크 설정(5GHz) SSID 뒤 4자리 랜덤생성(1:미체크 2:체크)',
  `wireless_5_ssid_check2` char(1) DEFAULT '1' COMMENT '무선 네트워크 설정(5GHz) SSID Hidden SSID(1:미체크 2:체크)',
  `wireless_5_ssid_key` varchar(255) DEFAULT '' COMMENT '무선 네트워크 설정(5GHz) SSID Key',
  `wireless_5_security_type` char(10) DEFAULT '' COMMENT '무선 네트워크 설정(5GHz) 암호화 방법 (no:무인증, wpapsk:WPA-PSK)',
  `wireless_5_wpa_mode` char(10) DEFAULT '' COMMENT '무선 네트워크 설정(5GHz) WPA Mode(wpa:WPA,wpa2:WPA2,wpawpa2:WPAnWPA2) ',
  `wireless_5_encryption_type` char(10) DEFAULT '' COMMENT '무선 네트워크 설정(5GHz) Encryption Type(tkip:TKIP,aes:AES,tkipaes:TKIPnAES)',
  `wireless_5_channel` varchar(10) DEFAULT '' COMMENT '무선 네트워크 설정(5GHz) 설정한 채널번호',
  `wireless_5_channel_now` varchar(10) DEFAULT '' COMMENT '무선 네트워크 설정(5GHz) 현재 동작 중인 채널번호',
  `wireless_24_status_set` char(1) DEFAULT '' COMMENT '무선 네트워크 설정(2.4GHz) 동작상태(1:동작, 2:중단)',
  `wireless_24_ssid_set` varchar(255) DEFAULT '' COMMENT '무선 네트워크 설정(2.4GHz) SSID',
  `wireless_24_ssid_check1_set` char(1) DEFAULT '1' COMMENT '무선 네트워크 설정(2.4GHz) SSID 뒤 4자리 랜덤생성(1:미체크 2:체크)',
  `wireless_24_ssid_check2_set` char(1) DEFAULT '1' COMMENT '무선 네트워크 설정(2.4GHz) SSID Hidden SSID(1:미체크 2:체크)',
  `wireless_24_ssid_key_set` varchar(255) DEFAULT '' COMMENT '무선 네트워크 설정(2.4GHz) SSID Key',
  `wireless_24_security_type_set` char(10) DEFAULT '' COMMENT '무선 네트워크 설정(2.4GHz) 암호화 방법 (no:무인증, wpapsk:WPA-PSK)',
  `wireless_24_wpa_mode_set` char(10) DEFAULT '' COMMENT '무선 네트워크 설정(2.4GHz) WPA Mode(wpa:WPA,wpa2:WPA2,wpawpa2:WPAnWPA2) ',
  `wireless_24_encryption_type_set` char(10) DEFAULT '' COMMENT '무선 네트워크 설정(2.4GHz) Encryption Type(tkip:TKIP,aes:AES,tkipaes:TKIPnAES)',
  `wireless_24_channel_set` varchar(10) DEFAULT '' COMMENT '무선네트워크(2.4Ghz) 채널 설정 값(1~13, auto)',
  `wireless_5_status_set` char(1) DEFAULT '' COMMENT '무선 네트워크 설정(5GHz) 동작상태(1:동작, 2:중단)',
  `wireless_5_ssid_set` varchar(255) DEFAULT '' COMMENT '무선 네트워크 설정(5GHz) SSID',
  `wireless_5_ssid_check1_set` char(1) DEFAULT '1' COMMENT '무선 네트워크 설정(5GHz) SSID 뒤 4자리 랜덤생성(1:미체크 2:체크)',
  `wireless_5_ssid_check2_set` char(1) DEFAULT '1' COMMENT '무선 네트워크 설정(5GHz) SSID Hidden SSID(1:미체크 2:체크)',
  `wireless_5_ssid_key_set` varchar(255) DEFAULT '' COMMENT '무선 네트워크 설정(5GHz) SSID Key',
  `wireless_5_security_type_set` char(10) DEFAULT '' COMMENT '무선 네트워크 설정(5GHz) 암호화 방법 (no:무인증, wpapsk:WPA-PSK)',
  `wireless_5_wpa_mode_set` char(10) DEFAULT '' COMMENT '무선 네트워크 설정(5GHz) WPA Mode(wpa:WPA,wpa2:WPA2,wpawpa2:WPAnWPA2) ',
  `wireless_5_encryption_type_set` char(10) DEFAULT '' COMMENT '무선 네트워크 설정(5GHz) Encryption Type(tkip:TKIP,aes:AES,tkipaes:TKIPnAES)',
  `wireless_5_channel_set` varchar(10) DEFAULT '' COMMENT '무선네트워크(5Ghz) 채널 설정 값(36~161, auto)',
  `first_page_set` varchar(255) DEFAULT '' COMMENT 'first page',
  `int_ipaddr_set` char(15) DEFAULT '' COMMENT '내부네트워크 IP 설정',
  `int_subnet_set` char(15) DEFAULT '' COMMENT '내부네트워크 서브넷 설정',
  `int_dhcp_server_enable_set` char(1) DEFAULT '' COMMENT '내부네트워크 DHCP 서버 설정(1:활성, 2비활성)',
  `int_ip_pool_start_set` char(15) DEFAULT '' COMMENT '내부네트워크 IP주소 사용범위 시작',
  `int_ip_pool_end_set` char(15) DEFAULT '' COMMENT '내부네트워크 IP주소 사용범위 종료',
  `int_premium_ip_pool_start_set` char(15) DEFAULT '',
  `int_premium_ip_pool_end_set` char(15) DEFAULT '',
  `int_dns1_set` char(15) DEFAULT '' COMMENT '내부네트워크 기본 DNS',
  `int_dns2_set` char(15) DEFAULT '' COMMENT '내부네트워크 보조 DNS',
  `line_id_set` varchar(50) DEFAULT '' COMMENT '회선번호',
  `store_seq_set` varchar(50) DEFAULT '' COMMENT '매장정보',
  `group_seq_set` varchar(50) DEFAULT '' COMMENT '그룹정보',
  `uptime` varchar(20) DEFAULT '0',
  `cpuload` varchar(10) DEFAULT '',
  `memory` varchar(10) DEFAULT '',
  `int_network_group_set` char(1) DEFAULT '2' COMMENT '내부 네트워크 설정을 그룹설정과 동일 여부(1: 동일, 2: 개별)',
  `wireless_24_network_group_set` char(1) DEFAULT '2' COMMENT '무선 네트워크(2.4Ghz) 설정을 그룹설정과 동일 여부(1: 동일, 2: 개별)',
  `wireless_5_network_group_set` char(1) DEFAULT '2' COMMENT '무선 네트워크(5Ghz) 설정을 그룹설정과 동일 여부(1: 동일, 2: 개별)',
  `memo` varchar(1000) DEFAULT '' COMMENT '메모',
  `collect_date` datetime DEFAULT '1000-01-01 00:00:01' COMMENT '단말 정보 수집 시간, 현재 시간보다 작으면 수집 대상이다',
  `firewall_status` char(1) DEFAULT '1' COMMENT '방화벽 설정(1:활성화 2:비활성화)',
  `ids_status` char(1) DEFAULT '1' COMMENT 'IDS 설정(1:활성화 2:비활성화)',
  `vpn_status` char(1) DEFAULT '1' COMMENT 'VPN 설정(1:활성화 2:비활성화)',
  `vpn_sh_checksum_set` varchar(255) DEFAULT '',
  `vpn_sh_checksum` varchar(255) DEFAULT '',
  `fw_version` varchar(20) DEFAULT '' COMMENT '방화벽 정책버전 정보(UTM단말에서 불러온 값)',
  `ids_version` varchar(20) DEFAULT '' COMMENT 'IDS 정책버전 정보(UTM 단말에서 불러온 값)',
  `beacon_status` char(1) DEFAULT '2' COMMENT 'beacon 수집여부(1:수집, 2:미수집)',
  `fw_version_check` char(1) DEFAULT '2' COMMENT '방화벽 보안정책 버전 일치 여부(1:일치, 2:불일치)',
  `ids_version_check` char(1) DEFAULT '2' COMMENT 'IDS 보안정책 버전 일치 여부(1:일치, 2:불일치)',
  `vpn_session_check` char(1) DEFAULT '2' COMMENT 'vpn 상태값 (1:정상, 2:세션없음(미연결), 3:단말변수 미설정, 4:Hash 불일치)',
  `alert_log_status` char(1) DEFAULT '1' COMMENT '보안 Event Log 유무(1:없음 2:있음)',
  `is_default_int_network` char(1) DEFAULT '2',
  `is_default_wireless_24` char(1) DEFAULT '2',
  `is_default_wireless_5` char(1) DEFAULT '2',
  `captive_portal_group_set` char(1) DEFAULT '2' COMMENT '광고기능 그룹 설정 (1:사용 2:미사용)',
  `captive_portal_status` char(1) DEFAULT '2' COMMENT '광고기능 설정 (1:활성화 2:비활성화)',
  `tm_restart` char(1) DEFAULT '1' COMMENT '재부팅 수행 여부 (1:정상, 2:재부팅 수행, 3:재부팅 수행완료, 4:재부팅 실패)',
  `captive_portal_mode` char(1) DEFAULT '2' COMMENT '광고기능 모드(1:IDPW 2:무인증)',
  `group_id_before` varchar(255) DEFAULT '' COMMENT '이전 그룹값의 정보를 저장한다(bssoss 연동시 사용)',
  `captive_portal_ssid` varchar(255) DEFAULT 'ollehWiFi' COMMENT '802.1x 의 SSID 값',
  `eth4_macaddr` char(17) DEFAULT '',
  `eth4_ipaddr` char(15) DEFAULT '',
  `subscription_bypass` char(1) DEFAULT '2' COMMENT 'BSSOSS 연동시 비콘정보 없이 개통 프로세스를 넘어갈 수 있는 처리 (1:비콘정보 확인 안함 2: 비콘정보 확인)',
  KEY `idx_serial` (`serial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.terminal:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `terminal` DISABLE KEYS */;
INSERT INTO `terminal` (`serial`, `modelname`, `macaddr`, `ipaddr`, `subnet`, `gateway`, `dns_1`, `dns_2`, `Real_IP`, `ipaddr_type`, `wifiutm_group`, `reg_date`, `update_date`, `beacon_date`, `network_status`, `network_status_date`, `int_ipaddr`, `int_subnet`, `int_dns1`, `int_dns2`, `dhcp_server_enable`, `dhcp_ip_pool_start`, `dhcp_ip_pool_end`, `dhcp_premium_ip_pool_start`, `dhcp_premium_ip_pool_end`, `line_id`, `firmware_version`, `fireware_update`, `wireless_24_status`, `wireless_24_ssid`, `wireless_24_ssid_check1`, `wireless_24_ssid_check2`, `wireless_24_ssid_key`, `wireless_24_security_type`, `wireless_24_wpa_mode`, `wireless_24_encryption_type`, `wireless_24_channel`, `wireless_24_channel_now`, `wireless_5_status`, `wireless_5_ssid`, `wireless_5_ssid_check1`, `wireless_5_ssid_check2`, `wireless_5_ssid_key`, `wireless_5_security_type`, `wireless_5_wpa_mode`, `wireless_5_encryption_type`, `wireless_5_channel`, `wireless_5_channel_now`, `wireless_24_status_set`, `wireless_24_ssid_set`, `wireless_24_ssid_check1_set`, `wireless_24_ssid_check2_set`, `wireless_24_ssid_key_set`, `wireless_24_security_type_set`, `wireless_24_wpa_mode_set`, `wireless_24_encryption_type_set`, `wireless_24_channel_set`, `wireless_5_status_set`, `wireless_5_ssid_set`, `wireless_5_ssid_check1_set`, `wireless_5_ssid_check2_set`, `wireless_5_ssid_key_set`, `wireless_5_security_type_set`, `wireless_5_wpa_mode_set`, `wireless_5_encryption_type_set`, `wireless_5_channel_set`, `first_page_set`, `int_ipaddr_set`, `int_subnet_set`, `int_dhcp_server_enable_set`, `int_ip_pool_start_set`, `int_ip_pool_end_set`, `int_premium_ip_pool_start_set`, `int_premium_ip_pool_end_set`, `int_dns1_set`, `int_dns2_set`, `line_id_set`, `store_seq_set`, `group_seq_set`, `uptime`, `cpuload`, `memory`, `int_network_group_set`, `wireless_24_network_group_set`, `wireless_5_network_group_set`, `memo`, `collect_date`, `firewall_status`, `ids_status`, `vpn_status`, `vpn_sh_checksum_set`, `vpn_sh_checksum`, `fw_version`, `ids_version`, `beacon_status`, `fw_version_check`, `ids_version_check`, `vpn_session_check`, `alert_log_status`, `is_default_int_network`, `is_default_wireless_24`, `is_default_wireless_5`, `captive_portal_group_set`, `captive_portal_status`, `tm_restart`, `captive_portal_mode`, `group_id_before`, `captive_portal_ssid`, `eth4_macaddr`, `eth4_ipaddr`, `subscription_bypass`) VALUES
	('GWFP9191375004010', 'KM07-609WU', '88:3C:1C:73:2D:C4', '14.63.45.24', '255.255.255.0', '218.153.81.254', '1.1.1.1', '8.8.8.8', '14.63.45.24', 'dhcp', '', '2019-03-04 15:20:08', '2019-03-04 15:20:08', '2019-11-12 14:42:20', 'off', '2019-11-16 22:33:53', '172.30.200.254', '255.255.255.0', '1.1.1.1', '8.8.8.8', '1', '172.30.200.1', '172.30.200.60', '172.30.200.128', '172.30.200.148', '', '1.1.15', '', '1', 'INS_2.4G_4010_61CF', '1', '1', 'qhdks456*joo', 'wpapsk', 'wpawpa2', 'tkipaes', 'auto', '8', '1', 'INS_5G_4010_61CF', '1', '1', 'qhdks!@456', 'wpapsk', 'wpawpa2', 'tkipaes', 'auto', '153', '1', 'INS_2.4G_4010_', '2', '1', 'qhdks456*joo', 'wpapsk', 'wpawpa2', 'tkipaes', 'auto', '1', 'INS_5G_4010_', '2', '1', 'qhdks!@456', 'wpapsk', 'wpawpa2', 'tkipaes', 'auto', '', '172.30.200.254', '255.255.255.0', '1', '172.30.200.1', '172.30.200.60', '172.30.200.128', '172.30.200.148', '1.1.1.1', '8.8.8.8', '', '', '57', '6468', '1', '24', '2', '2', '2', '', '2019-10-11 16:18:14', '1', '1', '1', 'a46471362eb09838f43a668c943311de2f428eb3', 'a46471362eb09838f43a668c943311de2f428eb3', '20190923001', '20191010001', '2', '2', '2', '2', '1', '2', '2', '2', '2', '2', '1', '2', '', 'ollehWiFi', '', '', '2');
/*!40000 ALTER TABLE `terminal` ENABLE KEYS */;

-- 테이블 powerdns.tsigkeys 구조 내보내기
CREATE TABLE IF NOT EXISTS `tsigkeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `algorithm` varchar(50) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `namealgoindex` (`name`,`algorithm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.tsigkeys:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tsigkeys` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsigkeys` ENABLE KEYS */;

-- 테이블 powerdns.users 구조 내보내기
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `perm_templ` int(1) NOT NULL,
  `active` int(1) NOT NULL,
  `use_ldap` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.users:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `fullname`, `email`, `description`, `perm_templ`, `active`, `use_ldap`) VALUES
	(1, 'admin', '0e4be64e8c07731a8ac8a04b0446ece4', 'Administrator', 'admin@example.net', 'Administrator with full rights.', 1, 1, 0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- 테이블 powerdns.user_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `user_info` (
  `seq` int(12) NOT NULL DEFAULT 0,
  `id` varchar(30) CHARACTER SET euckr DEFAULT '',
  `pw` varchar(100) CHARACTER SET euckr DEFAULT '',
  `use_default_pw` char(1) CHARACTER SET euckr DEFAULT 'x',
  `name` varchar(30) CHARACTER SET euckr DEFAULT '',
  `sosok` varchar(100) CHARACTER SET euckr DEFAULT '',
  `tel_num` char(15) CHARACTER SET euckr DEFAULT '',
  `email` varchar(30) CHARACTER SET euckr DEFAULT '',
  `grade` varchar(30) CHARACTER SET euckr DEFAULT '',
  `local_sosok` varchar(100) CHARACTER SET euckr DEFAULT '',
  `alive` char(1) CHARACTER SET euckr DEFAULT 'o',
  `manage_mart_num` int(4) DEFAULT 0,
  `jisa` varchar(30) CHARACTER SET euckr DEFAULT '',
  `auth_type` varchar(10) CHARACTER SET euckr DEFAULT 'idpw',
  `login_priv` char(1) CHARACTER SET euckr DEFAULT 'Y',
  `mart_view_priv` char(1) CHARACTER SET euckr DEFAULT 'Y',
  `mart_add_priv` char(1) CHARACTER SET euckr DEFAULT 'Y',
  `neoss_view_priv` char(1) CHARACTER SET euckr DEFAULT 'N',
  `neoss_add_priv` char(1) CHARACTER SET euckr DEFAULT 'N',
  `user_view_priv` char(1) CHARACTER SET euckr DEFAULT 'N',
  `user_add_priv` char(1) CHARACTER SET euckr DEFAULT 'N',
  `whitelist_view_priv` char(1) CHARACTER SET euckr DEFAULT 'N',
  `whitelist_add_priv` char(1) CHARACTER SET euckr DEFAULT 'N',
  `voc_view_priv` char(1) CHARACTER SET euckr DEFAULT 'N',
  `voc_add_priv` char(1) CHARACTER SET euckr DEFAULT 'N',
  `voc_modify_priv` char(1) CHARACTER SET euckr DEFAULT 'N',
  `password` varchar(500) CHARACTER SET euckr DEFAULT '',
  `join_date` datetime DEFAULT '1000-01-01 00:00:00',
  `last_login_date` datetime DEFAULT '1000-01-01 00:00:00',
  `password_change_date` datetime DEFAULT '1000-01-01 00:00:01',
  `login_fail_count` int(1) DEFAULT 0,
  `login_fail_lock_date` datetime DEFAULT '1000-01-01 00:00:01'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.user_info:6 rows 내보내기
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` (`seq`, `id`, `pw`, `use_default_pw`, `name`, `sosok`, `tel_num`, `email`, `grade`, `local_sosok`, `alive`, `manage_mart_num`, `jisa`, `auth_type`, `login_priv`, `mart_view_priv`, `mart_add_priv`, `neoss_view_priv`, `neoss_add_priv`, `user_view_priv`, `user_add_priv`, `whitelist_view_priv`, `whitelist_add_priv`, `voc_view_priv`, `voc_add_priv`, `voc_modify_priv`, `password`, `join_date`, `last_login_date`, `password_change_date`, `login_fail_count`, `login_fail_lock_date`) VALUES
	(1, 'gundeok', '', 'x', '서경덕', 'KT', '010-9886-9286', 'kd.seo@kt.com', '', '', '', 0, 'kt', 'idpw', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'DH09LIkrmf8asVFWX0PjYTJIDRryqTzp/e5c8xDsHpg=', '1000-01-01 00:00:01', '2020-04-05 16:41:17', '9999-12-31 00:00:00', -868, '1000-01-01 00:00:01'),
	(3, 'ssadm', '', 'x', '네트워크관제', 'KT', '010-2668-5961', 'hyojin.paek@kt.com', '', '', '', 0, '', 'idpw', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'ShSSed2iSTbHZ0n2fKeC2fEbIf0NoZomd2KSYVJDLNc=', '1000-01-01 00:00:03', '2020-03-13 13:41:18', '9999-12-31 23:59:59', 1, '1000-01-01 00:00:01'),
	(300, 'welfare1', '', 'x', '인제전산실장', 'injae', '010-4958-1921', '', '', '', '', 0, '', 'idpw', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'N', 'Y', 'N', 'N', 'N', 'N', 'kVTjnY8/hwY3jrQv+VKNJzKjaadSVgDObVnBROB9ml4=', '1000-01-01 00:05:00', '2020-03-13 08:41:04', '9999-12-31 23:59:59', 3, '1000-01-01 00:00:01'),
	(301, 'welfare2', '', 'x', '속초전산실장', 'injae_sokcho', '', '', '', '', '', 0, '', 'idpw', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'N', 'Y', 'N', 'N', 'N', 'N', '28Qc9vkMptcM0VfmES3gAOmdpmVMW1GJT6S+VwaU0ok=', '1000-01-01 00:05:01', '2020-02-28 14:03:28', '9999-12-31 23:59:59', 2, '1000-01-01 00:00:01'),
	(302, 'welfare3', '', 'x', '춘천전산실장', 'chuncheon', '', '', '', '', '', 0, '', 'idpw', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'N', 'Y', 'N', 'N', 'N', 'N', 'zUgDvQXPm9X6iGpz0NFLPhfmEtBQP5Xnp5k7fay2Oqo=', '1000-01-01 00:05:02', '2020-02-25 14:02:13', '9999-12-31 23:59:59', 3, '1000-01-01 00:00:01'),
	(0, 'cj', '', 'x', '이창재', 'gaon', '', '', '', '', 'o', 0, 'kt', 'idpw', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'ASkPwMRolG9zEU3YZK65bpwdSZXDrCugdboB0s9L1cs=', '1000-01-01 00:00:01', '2020-05-22 13:37:16', '9999-12-31 00:00:00', 0, '1000-01-01 00:00:01');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;

-- 테이블 powerdns.user_mart_list 구조 내보내기
CREATE TABLE IF NOT EXISTS `user_mart_list` (
  `id` varchar(30) CHARACTER SET euckr DEFAULT '',
  `sosok` varchar(100) CHARACTER SET euckr DEFAULT '',
  `line_num` char(14) CHARACTER SET euckr DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.user_mart_list:2 rows 내보내기
/*!40000 ALTER TABLE `user_mart_list` DISABLE KEYS */;
INSERT INTO `user_mart_list` (`id`, `sosok`, `line_num`) VALUES
	('gundeokji', 'seoul', '0002-0167-5476'),
	('gundeokji', 'seoul', '0002-0001-5798');
/*!40000 ALTER TABLE `user_mart_list` ENABLE KEYS */;

-- 테이블 powerdns.voc_content_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `voc_content_info` (
  `voc_seq` varchar(11) DEFAULT '',
  `voc_content` text DEFAULT NULL,
  `fix_content` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.voc_content_info:5 rows 내보내기
/*!40000 ALTER TABLE `voc_content_info` DISABLE KEYS */;
INSERT INTO `voc_content_info` (`voc_seq`, `voc_content`, `fix_content`) VALUES
	('1', 'VOC 테스트용으로 등록했습니다.\r\n\r\n문의사항은 상세히 기록해 주세요.\r\n(최대한 고객의 소리 대로 기록해 주시면 좋겠습니다.)', '조치한 내역도 함께 기록해 주세요.\n\n조치 내역을 수정해서 표시합니다.'),
	('2', '테스트 수정', '테스트'),
	('3', '테스트2', '교체'),
	('6', '위즈스틱 NMS 로그인 안되는데 어떻게 하는지 문의', '엔지니어가 NMS 로그인해서 처리하는 프로세스 없어졌고 NMS 처리 필요 시 관제센터로 연락 주면 처리해준다고 설명함'),
	('7', '위즈스틱 인식이 계속 끊김\r\n데이터 케이블 교체 후에도 동일증상 지속', '단말기 교체(2721 -> 2585) 및 RNDIS 매핑 완료함\n인가/비인가 사이트 접근 테스트 완료\n2017-09-13 10:47 함종필 엔지니어와 통화, 주포스 위즈스틱 교체 후 부포스 통신 안된다고 함\n마트(033-671-8039)로 연락하여 조치 요청했으나 마트와 통화되지 않음 \n(12:04) 김해숙 전산실장님(010-8611-2867)과 통화, 해당 내역 전달하니 함종필 엔지니어분과 통화하여 처리 하신다고 함');
/*!40000 ALTER TABLE `voc_content_info` ENABLE KEYS */;

-- 테이블 powerdns.voc_history_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `voc_history_info` (
  `seq` int(12) NOT NULL DEFAULT 0,
  `voc_seq` varchar(11) DEFAULT '',
  `column_name` varchar(30) DEFAULT '',
  `before_value` varchar(1000) DEFAULT '',
  `after_value` varchar(1000) DEFAULT '',
  `modify_date` datetime DEFAULT '0000-00-00 00:00:00',
  `modify_user_id` varchar(30) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.voc_history_info:5 rows 내보내기
/*!40000 ALTER TABLE `voc_history_info` DISABLE KEYS */;
INSERT INTO `voc_history_info` (`seq`, `voc_seq`, `column_name`, `before_value`, `after_value`, `modify_date`, `modify_user_id`) VALUES
	(1, '1', 'fix_content', '조치한 내역도 함께 기록해 주세요.\r\n', '조치한 내역도 함께 기록해 주세요.\n\n조치 내역을 수정해서 표시합니다.', '2017-09-10 21:31:07', 'gundeok'),
	(2, '2', 'voc_content', '테스트', '테스트 수정', '2017-09-11 14:33:02', 'ssadm'),
	(3, '2', 'fix_status', '조치 중', '조치 완료 - 2017-09-11', '2017-09-11 14:34:22', 'ssadm'),
	(4, '1', 'fix_status', '조치 중', '조치 완료 - 0-11-30', '2017-09-12 13:20:08', 'ssadm'),
	(5, '2', 'voc_type', '고장 - 위즈스틱오류(추정) - 단말불량', '고장 - 기타 - 기타(test)', '2017-09-12 13:22:02', 'ssadm');
/*!40000 ALTER TABLE `voc_history_info` ENABLE KEYS */;

-- 테이블 powerdns.voc_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `voc_info` (
  `seq` int(12) NOT NULL DEFAULT 0,
  `line_num` char(14) DEFAULT '',
  `voc_date` datetime DEFAULT '0000-00-00 00:00:00',
  `voc_type` char(2) DEFAULT '',
  `voc_sub_type1` char(2) DEFAULT '',
  `voc_sub_type2` char(2) DEFAULT '',
  `voc_sub_type2_name` varchar(200) DEFAULT '',
  `fix_type` char(2) DEFAULT '',
  `fix_type_name` varchar(200) DEFAULT '',
  `fix_status` varchar(10) DEFAULT 'ing',
  `voc_custom` char(2) DEFAULT '',
  `voc_custom_name` varchar(30) DEFAULT '',
  `tel_num` char(14) DEFAULT '',
  `voc_receiver_id` varchar(30) DEFAULT '',
  `voc_receiver_name` varchar(30) DEFAULT '',
  `voc_complete_date` date DEFAULT '1000-01-01',
  `fix_status_detail` varchar(30) DEFAULT '',
  `voc_recheck_date` date DEFAULT '1000-01-01'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.voc_info:5 rows 내보내기
/*!40000 ALTER TABLE `voc_info` DISABLE KEYS */;
INSERT INTO `voc_info` (`seq`, `line_num`, `voc_date`, `voc_type`, `voc_sub_type1`, `voc_sub_type2`, `voc_sub_type2_name`, `fix_type`, `fix_type_name`, `fix_status`, `voc_custom`, `voc_custom_name`, `tel_num`, `voc_receiver_id`, `voc_receiver_name`, `voc_complete_date`, `fix_status_detail`, `voc_recheck_date`) VALUES
	(1, '1111-1111-1111', '2017-09-10 21:12:00', '1', '0', '0', '', '1', '', 'complete', '1', '서경덕', '010-9886-9286', 'gundeok', '서경덕', '0000-11-30', '', '1000-01-01'),
	(2, '1111-1111-1111', '2017-09-11 14:31:00', '2', '5', '99', 'test', '1', '', 'complete', '3', '주형돈', '010-9888-0513', 'ssadm', '주형돈', '2017-09-11', '', '1000-01-01'),
	(3, '1111-1111-1111', '2017-09-12 14:03:00', '2', '0', '1', '', '1', '', 'complete', '3', '주형돈', '010-9888-0513', 'ssadm', '', '2017-09-12', '', '1000-01-01'),
	(6, '0002-9999-1013', '2017-09-13 09:16:00', '1', '1', '0', '', '2', '', 'complete', '1', '신승훈', '010-3200-3113', 'ssadm6', '허혁진', '2017-09-13', '', '1000-01-01'),
	(7, '0033-0038-8341', '2017-09-13 09:54:00', '2', '0', '0', '', '2', '', 'complete', '1', '함종필', '010-3046-0551', 'ssadm6', '허혁진', '2017-09-13', '', '1000-01-01');
/*!40000 ALTER TABLE `voc_info` ENABLE KEYS */;

-- 테이블 powerdns.welfare_sosok_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `welfare_sosok_info` (
  `name` varchar(30) CHARACTER SET euckr DEFAULT '',
  `code` varchar(30) CHARACTER SET euckr DEFAULT '',
  `num` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.welfare_sosok_info:5 rows 내보내기
/*!40000 ALTER TABLE `welfare_sosok_info` DISABLE KEYS */;
INSERT INTO `welfare_sosok_info` (`name`, `code`, `num`) VALUES
	('서울', 'seoul', 1),
	('덕정', 'dukjeong', 2),
	('일동', 'ildong', 3),
	('과천', 'gwacheon', 4),
	('인제', 'injae', 5);
/*!40000 ALTER TABLE `welfare_sosok_info` ENABLE KEYS */;

-- 테이블 powerdns.whitelist_etc 구조 내보내기
CREATE TABLE IF NOT EXISTS `whitelist_etc` (
  `seq` int(5) NOT NULL DEFAULT 0,
  `type` char(6) DEFAULT '',
  `whitelist` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.whitelist_etc:2 rows 내보내기
/*!40000 ALTER TABLE `whitelist_etc` DISABLE KEYS */;
INSERT INTO `whitelist_etc` (`seq`, `type`, `whitelist`) VALUES
	(1, 'prefix', 'iptables -P INPUT ACCEPT\r\niptables -P FORWARD DROP\r\niptables -P OUTPUT ACCEPT\r\niptables -F\r\niptables -X\r\niptables -t nat -F\r\niptables -t nat -X\r\niptables -A FORWARD -p udp -j ACCEPT\r\niptables -t nat -A POSTROUTING -j MASQUERADE\r\niptables -A FORWARD -p icmp -j ACCEPT\r\niptables -t nat -A PREROUTING -p tcp -i eth0 --dport 1433 -j DNAT --to 10.254.250.2:1433'),
	(2, 'suffix', 'iptables -A INPUT -p udp --dport 137 -j DROP\r\niptables -A INPUT -p udp --dport 138 -j DROP\r\niptables -A INPUT -p tcp --dport 139 -j DROP\r\niptables -A INPUT -p tcp --dport 445 -j DROP');
/*!40000 ALTER TABLE `whitelist_etc` ENABLE KEYS */;

-- 테이블 powerdns.whitelist_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `whitelist_info` (
  `seq` int(12) NOT NULL DEFAULT 0,
  `url` varchar(50) DEFAULT '',
  `ipaddr` char(18) DEFAULT '',
  `name` varchar(50) DEFAULT '',
  `level` char(4) DEFAULT 'down',
  `submit_flag` char(1) DEFAULT 'x'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.whitelist_info:5 rows 내보내기
/*!40000 ALTER TABLE `whitelist_info` DISABLE KEYS */;
INSERT INTO `whitelist_info` (`seq`, `url`, `ipaddr`, `name`, `level`, `submit_flag`) VALUES
	(2, 'test1', '10.10.10.1/24', '임시1', 'up', 'x'),
	(3, 'microsoft.com', '10/32', '마이크로소프트', 'up', 'x'),
	(4, 'microsoft.com', '11/32', '마이크로소프트', 'up', 'x'),
	(5, 'microsoft.com', '12/32', '마이크로소프트', 'up', 'x'),
	(6, 'microsoft.com', '13/32', '마이크로소프트', 'up', 'x');
/*!40000 ALTER TABLE `whitelist_info` ENABLE KEYS */;

-- 테이블 powerdns.wizstick_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `wizstick_info` (
  `serial` varchar(30) CHARACTER SET euckr NOT NULL,
  `macaddr_wan` char(17) CHARACTER SET euckr DEFAULT NULL,
  `ipaddr_wan` char(15) CHARACTER SET euckr DEFAULT '',
  `macaddr_rndis` char(17) CHARACTER SET euckr DEFAULT NULL,
  `line_num` char(14) CHARACTER SET euckr DEFAULT NULL,
  `beacon_collect` char(1) CHARACTER SET euckr DEFAULT '0',
  `beacon_date` datetime DEFAULT '0000-00-00 00:00:00',
  `wizstick_date` datetime DEFAULT '0000-00-00 00:00:00',
  `wizstick_type` char(1) CHARACTER SET euckr DEFAULT '0',
  `install_man` varchar(100) CHARACTER SET euckr DEFAULT NULL,
  `confirm_mac` varchar(100) CHARACTER SET euckr DEFAULT NULL,
  `wizstick_type_date` datetime DEFAULT '0000-00-00 00:00:00',
  `auth` varchar(50) DEFAULT NULL COMMENT '펌웨어auth',
  `secureStatus` varchar(1) CHARACTER SET euckr DEFAULT NULL COMMENT '보안단말 보안정책(Iptables) 상태',
  `rebooting` varchar(1) CHARACTER SET euckr DEFAULT NULL COMMENT '리부팅 여부(부팅 최초 호출시 Y)',
  `curRule` varchar(20) CHARACTER SET euckr DEFAULT NULL COMMENT '현재 보안정책 Rule버전'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.wizstick_info:3 rows 내보내기
/*!40000 ALTER TABLE `wizstick_info` DISABLE KEYS */;
INSERT INTO `wizstick_info` (`serial`, `macaddr_wan`, `ipaddr_wan`, `macaddr_rndis`, `line_num`, `beacon_collect`, `beacon_date`, `wizstick_date`, `wizstick_type`, `install_man`, `confirm_mac`, `wizstick_type_date`, `auth`, `secureStatus`, `rebooting`, `curRule`) VALUES
	('TEST0000000000002', '08:5D:DD:00:18:93', '192.168.1.2', NULL, '0000-0000-0002', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', NULL, NULL, '0000-00-00 00:00:00', NULL, 'Y', 'Y', '20200317001'),
	('TEST0000000000001', '08:5D:DD:00:11:FC', '192.168.1.1', NULL, '0000-0000-0001', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', NULL, NULL, '0000-00-00 00:00:00', NULL, 'Y', 'Y', '20200317001'),
	('HMAP9123456780127', '08:5D:DD:00:11:FD', '192.168.1.3', NULL, '0000-0000-0003', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', NULL, NULL, '0000-00-00 00:00:00', NULL, 'Y', 'Y', '20200317001');
/*!40000 ALTER TABLE `wizstick_info` ENABLE KEYS */;

-- 테이블 powerdns.workman_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `workman_info` (
  `seq` int(11) NOT NULL DEFAULT 0,
  `company` varchar(10) CHARACTER SET euckr DEFAULT '',
  `jisa` varchar(30) CHARACTER SET euckr DEFAULT '',
  `area1` varchar(30) CHARACTER SET euckr DEFAULT '',
  `area2` varchar(30) CHARACTER SET euckr DEFAULT '',
  `sosok` varchar(100) CHARACTER SET euckr DEFAULT '',
  `name` varchar(30) CHARACTER SET euckr DEFAULT '',
  `mobile_num` char(13) CHARACTER SET euckr DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.workman_info:5 rows 내보내기
/*!40000 ALTER TABLE `workman_info` DISABLE KEYS */;
INSERT INTO `workman_info` (`seq`, `company`, `jisa`, `area1`, `area2`, `sosok`, `name`, `mobile_num`) VALUES
	(1, 'KT', '광화문', '', '', '통합보안개발TF 개발2팀', '서경덕', '010-9886-9286'),
	(2, 'kts북부', '강북광역', '경기', ' 가평', '구리지사양평지점가평CS센터', '김상오', '010-6652-0508'),
	(3, 'kts북부', '강북광역', '경기', ' 가평', '구리지사양평지점가평CS센터', '이기득', '010-4122-0179'),
	(4, 'kts북부', '강북광역', '경기', ' 가평', '구리지사양평지점가평CS센터', '진황규', '010-2838-0616'),
	(5, 'kts북부', '강북광역', '경기', ' 가평', '구리지사양평지점가평CS센터', '이완중', '010-5756-0179');
/*!40000 ALTER TABLE `workman_info` ENABLE KEYS */;

-- 테이블 powerdns.zones 구조 내보내기
CREATE TABLE IF NOT EXISTS `zones` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `domain_id` int(4) NOT NULL,
  `owner` int(4) NOT NULL,
  `comment` varchar(1024) DEFAULT NULL,
  `zone_templ_id` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.zones:~13 rows (대략적) 내보내기
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
INSERT INTO `zones` (`id`, `domain_id`, `owner`, `comment`, `zone_templ_id`) VALUES
	(3, 6, 1, NULL, 0),
	(4, 13, 1, NULL, 0),
	(28, 40, 1, NULL, 0),
	(31, 43, 1, NULL, 0),
	(33, 45, 1, NULL, 0),
	(162, 174, 1, NULL, 0),
	(164, 176, 1, NULL, 0),
	(165, 177, 1, NULL, 0),
	(166, 178, 1, NULL, 0),
	(167, 179, 1, NULL, 0),
	(168, 180, 1, NULL, 0),
	(169, 181, 1, NULL, 0),
	(170, 182, 1, NULL, 0);
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;

-- 테이블 powerdns.zone_templ 구조 내보내기
CREATE TABLE IF NOT EXISTS `zone_templ` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `descr` varchar(1024) NOT NULL,
  `owner` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.zone_templ:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `zone_templ` DISABLE KEYS */;
/*!40000 ALTER TABLE `zone_templ` ENABLE KEYS */;

-- 테이블 powerdns.zone_templ_records 구조 내보내기
CREATE TABLE IF NOT EXISTS `zone_templ_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_templ_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(6) NOT NULL,
  `content` varchar(255) NOT NULL,
  `ttl` int(11) NOT NULL,
  `prio` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 powerdns.zone_templ_records:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `zone_templ_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `zone_templ_records` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
