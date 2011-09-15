-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.37-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema oa
--

CREATE DATABASE IF NOT EXISTS oa;
USE oa;

--
-- Definition of table `core_department`
--

DROP TABLE IF EXISTS `core_department`;
CREATE TABLE `core_department` (
  `ID_` int(10) unsigned NOT NULL auto_increment,
  `CID_` int(10) unsigned default NULL,
  `CDATE_` datetime default NULL,
  `MID_` int(10) unsigned default NULL,
  `MDATE_` datetime default NULL,
  `UUID_` varchar(45) default NULL,
  `orgId` int(10) unsigned default NULL,
  `parentId` int(10) unsigned default NULL,
  `depaName` varchar(100) default NULL,
  `depaDesc` varchar(100) default NULL,
  `sequence` int(10) unsigned default '0',
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_department`
--

/*!40000 ALTER TABLE `core_department` DISABLE KEYS */;
INSERT INTO `core_department` (`ID_`,`CID_`,`CDATE_`,`MID_`,`MDATE_`,`UUID_`,`orgId`,`parentId`,`depaName`,`depaDesc`,`sequence`) VALUES 
 (1,0,'2011-08-20 14:18:02',0,'2011-08-21 12:34:09',NULL,1,0,'战略投资部','战略投资部',0),
 (2,0,'2011-08-20 14:18:44',0,'2011-08-21 12:34:36',NULL,1,0,'人事行政部','人事行政部',0),
 (3,0,'2011-08-20 21:23:44',0,'2011-08-21 12:48:48',NULL,11,0,'三炮部队','三炮部队',0),
 (4,0,'2011-08-20 21:23:54',0,'2011-08-21 12:35:02',NULL,1,0,'财务部','财务部',0),
 (6,0,'2011-08-20 21:34:41',0,'2011-08-21 12:35:38',NULL,1,4,'财务部','财务部',0),
 (7,0,'2011-08-20 21:34:48',0,'2011-08-21 12:36:02',NULL,1,4,'会计部','会计部',0),
 (8,0,'2011-08-20 21:34:54',0,'2011-08-21 12:42:09',NULL,1,0,'市场部','市场部',0),
 (10,0,'2011-08-20 22:14:41',0,'2011-08-21 12:58:46',NULL,1,0,'信息中心','信息中心',9),
 (11,0,'2011-08-20 22:14:45',0,'2011-08-21 12:44:27',NULL,1,8,'国内市场部','国内市场部',0),
 (13,0,'2011-08-20 22:14:57',0,'2011-09-05 22:02:54',NULL,1,8,'海外市场部','海外市场部',0),
 (14,0,'2011-08-20 22:15:05',0,'2011-08-21 12:45:09',NULL,1,0,'技术部','技术部',0),
 (15,0,'2011-08-20 22:15:08',0,'2011-08-21 12:59:27',NULL,1,0,'质控部','质控部',8),
 (16,0,'2011-08-20 22:15:15',0,'2011-08-21 12:46:09',NULL,1,0,'生产部','生产部',0),
 (17,0,'2011-08-20 22:15:22',0,'2011-08-21 12:46:45',NULL,1,16,'交换机生产线','交换机生产线',0),
 (18,0,'2011-08-21 12:27:35',0,'2011-08-21 12:49:18',NULL,13,0,'固定电话事业部','固定电话事业部',0),
 (19,0,'2011-08-21 12:27:41',0,'2011-08-21 12:49:29',NULL,13,0,'移动电话事业部','移动电话事业部',0),
 (20,0,'2011-08-21 12:27:47',0,'2011-08-21 12:48:58',NULL,12,0,'三炮部队','三炮部队',0),
 (21,0,'2011-08-21 12:47:12',0,NULL,NULL,1,16,'平板电脑生产线','平板电脑生产线',0);
/*!40000 ALTER TABLE `core_department` ENABLE KEYS */;


--
-- Definition of table `core_job`
--

DROP TABLE IF EXISTS `core_job`;
CREATE TABLE `core_job` (
  `ID_` int(10) unsigned NOT NULL auto_increment,
  `CID_` int(10) unsigned default NULL,
  `CDATE_` datetime default NULL,
  `MID_` int(10) unsigned default NULL,
  `MDATE_` datetime default NULL,
  `UUID_` varchar(45) default NULL,
  `orgId` int(10) unsigned default NULL,
  `parentId` int(10) unsigned default NULL,
  `jobName` varchar(100) default NULL,
  `jobDesc` varchar(100) default NULL,
  `sequence` int(10) unsigned default '0',
  `isManager` tinyint(3) unsigned default '0',
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_job`
--

/*!40000 ALTER TABLE `core_job` DISABLE KEYS */;
INSERT INTO `core_job` (`ID_`,`CID_`,`CDATE_`,`MID_`,`MDATE_`,`UUID_`,`orgId`,`parentId`,`jobName`,`jobDesc`,`sequence`,`isManager`) VALUES 
 (1,0,'2011-08-25 20:18:59',0,NULL,NULL,1,0,'总经理','总经理',0,0),
 (2,0,'2011-08-25 20:19:20',0,'2011-08-25 21:03:10',NULL,1,1,'企业管理部经理','企业管理部经理',0,1),
 (3,0,'2011-08-25 20:19:42',0,'2011-08-25 20:21:07',NULL,1,1,'财务部经理','财务部经理',1,0),
 (4,0,'2011-08-25 20:19:59',0,'2011-08-25 20:34:39',NULL,1,1,'人事行政部经理','人事行政部经理',2,0),
 (5,0,'2011-08-25 20:20:14',0,'2011-08-25 20:34:49',NULL,1,1,'技术部经理','技术部经理',3,0),
 (6,0,'2011-08-25 20:20:25',0,'2011-08-25 20:21:18',NULL,1,1,'市场部经理','市场部经理',4,0),
 (7,0,'2011-08-25 20:20:44',0,'2011-09-04 22:10:56',NULL,1,1,'生产部经理','生产部经理',5,0),
 (8,0,'2011-08-25 20:20:54',0,'2011-08-25 20:57:10',NULL,1,1,'信息部经理','信息部经理',6,0),
 (9,0,'2011-08-25 20:37:35',0,NULL,NULL,1,2,'企业管理部副经理','企业管理部副经理',0,0),
 (10,0,'2011-08-25 20:42:49',0,'2011-08-25 20:43:08',NULL,1,9,'企业管理部主任','企业管理部主任',0,0),
 (11,0,'2011-08-25 20:43:31',0,'2011-08-25 20:45:15',NULL,1,10,'项目主管','项目主管',0,0),
 (12,0,'2011-08-25 20:45:39',0,NULL,NULL,1,10,'成本主管','成本主管',1,0),
 (13,0,'2011-08-25 20:45:58',0,NULL,NULL,1,8,'信息部主任','信息部主任',0,0),
 (14,0,'2011-08-25 20:46:09',0,'2011-08-25 20:46:20',NULL,1,13,'硬件工程师','硬件工程师',0,0),
 (15,0,'2011-08-25 20:46:46',0,'2011-08-25 20:46:51',NULL,1,13,'软件工程师','软件工程师',1,0),
 (16,0,'2011-08-25 21:01:08',0,NULL,NULL,1,13,'系统工程师','系统工程师',3,0);
/*!40000 ALTER TABLE `core_job` ENABLE KEYS */;


--
-- Definition of table `core_leftmenu`
--

DROP TABLE IF EXISTS `core_leftmenu`;
CREATE TABLE `core_leftmenu` (
  `ID_` int(10) unsigned NOT NULL auto_increment,
  `CID_` int(10) unsigned default NULL,
  `CDATE_` datetime default NULL,
  `MID_` int(10) unsigned default NULL,
  `MDATE_` datetime default NULL,
  `UUID_` varchar(45) default NULL,
  `parentId` int(10) unsigned default NULL,
  `menuName` varchar(100) default NULL,
  `menuUrl` varchar(100) default NULL,
  `menuTarget` varchar(100) default NULL,
  `sequence` int(10) unsigned default '0',
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_leftmenu`
--

/*!40000 ALTER TABLE `core_leftmenu` DISABLE KEYS */;
INSERT INTO `core_leftmenu` (`ID_`,`CID_`,`CDATE_`,`MID_`,`MDATE_`,`UUID_`,`parentId`,`menuName`,`menuUrl`,`menuTarget`,`sequence`) VALUES 
 (1,0,'2011-09-04 15:00:18',0,NULL,NULL,0,'我的桌面','','_self',0),
 (2,0,'2011-09-04 15:00:32',0,NULL,NULL,0,'审批中心','','_self',1),
 (3,0,'2011-09-04 15:00:41',0,NULL,NULL,0,'相关链接','','_self',2),
 (4,0,'2011-09-04 15:00:51',0,NULL,NULL,0,'我的文档','','_self',3),
 (5,0,'2011-09-04 15:01:03',0,NULL,NULL,0,'帮助中心','','_self',4),
 (6,0,'2011-09-04 15:01:12',0,NULL,NULL,1,'修改资料','','_self',0),
 (7,0,'2011-09-04 15:01:24',0,'2011-09-04 15:01:50',NULL,1,'修改密码','','_self',1),
 (8,0,'2011-09-04 15:01:33',0,'2011-09-04 15:01:56',NULL,1,'我的任务','','_self',2),
 (9,0,'2011-09-04 15:02:37',0,'2011-09-04 15:02:41',NULL,1,'审批设置','','_self',3),
 (10,0,'2011-09-04 15:03:31',0,NULL,NULL,2,'未完成的任务','','_self',0),
 (11,0,'2011-09-04 15:03:37',0,NULL,NULL,2,'已完成的任务','','_self',1),
 (12,0,'2011-09-04 15:03:43',0,NULL,NULL,2,'被授权的任务','','_self',2),
 (13,0,'2011-09-04 15:03:55',0,NULL,NULL,2,'已授权的任务','','_self',3),
 (14,0,'2011-09-04 15:04:03',0,NULL,NULL,2,'未完成的审批','','_self',4),
 (15,0,'2011-09-04 15:04:11',0,NULL,NULL,2,'已完成的审批','','_self',5),
 (16,0,'2011-09-04 15:04:32',0,NULL,NULL,3,'ERP系统','','_self',0),
 (17,0,'2011-09-04 15:05:09',0,NULL,NULL,3,'MiniOA下载','http://www.minioa.net/','_self',1),
 (18,0,'2011-09-08 19:24:06',0,NULL,NULL,0,'HelloWorld','helloworld.jsf','_self',3);
/*!40000 ALTER TABLE `core_leftmenu` ENABLE KEYS */;


--
-- Definition of table `core_leftmenu_role_relation`
--

DROP TABLE IF EXISTS `core_leftmenu_role_relation`;
CREATE TABLE `core_leftmenu_role_relation` (
  `ID_` int(10) unsigned NOT NULL auto_increment,
  `CID_` int(10) unsigned default NULL,
  `CDATE_` datetime default NULL,
  `menuId` int(10) unsigned default NULL,
  `roleId` int(10) unsigned default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_leftmenu_role_relation`
--

/*!40000 ALTER TABLE `core_leftmenu_role_relation` DISABLE KEYS */;
INSERT INTO `core_leftmenu_role_relation` (`ID_`,`CID_`,`CDATE_`,`menuId`,`roleId`) VALUES 
 (1,0,'2011-09-05 19:44:27',1,1),
 (2,0,'2011-09-05 19:44:27',2,1),
 (3,0,'2011-09-05 19:44:27',3,1),
 (6,0,'2011-09-05 19:44:27',6,1),
 (7,0,'2011-09-05 19:44:27',7,1),
 (8,0,'2011-09-05 19:44:27',8,1),
 (9,0,'2011-09-05 19:44:27',9,1),
 (10,0,'2011-09-05 19:44:27',10,1),
 (11,0,'2011-09-05 19:44:27',11,1),
 (12,0,'2011-09-05 19:44:27',12,1),
 (13,0,'2011-09-05 19:44:27',13,1),
 (14,0,'2011-09-05 19:44:27',14,1),
 (15,0,'2011-09-05 19:44:27',15,1),
 (16,0,'2011-09-05 19:44:27',17,1),
 (17,0,'2011-09-05 19:44:27',16,1),
 (18,0,'2011-09-05 20:21:52',4,1),
 (19,0,'2011-09-05 21:21:14',5,1),
 (20,0,'2011-09-08 19:24:23',18,1);
/*!40000 ALTER TABLE `core_leftmenu_role_relation` ENABLE KEYS */;


--
-- Definition of table `core_op`
--

DROP TABLE IF EXISTS `core_op`;
CREATE TABLE `core_op` (
  `ID_` int(10) unsigned NOT NULL auto_increment,
  `CID_` int(10) unsigned default NULL,
  `CDATE_` datetime default NULL,
  `MID_` int(10) unsigned default NULL,
  `MDATE_` datetime default NULL,
  `UUID_` varchar(45) default NULL,
  `opName` varchar(100) default NULL,
  `opDesc` varchar(100) default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_op`
--

/*!40000 ALTER TABLE `core_op` DISABLE KEYS */;
INSERT INTO `core_op` (`ID_`,`CID_`,`CDATE_`,`MID_`,`MDATE_`,`UUID_`,`opName`,`opDesc`) VALUES 
 (1,0,'2011-08-27 21:38:52',0,'2011-08-27 21:39:12',NULL,'100101','单位管理-增删改'),
 (2,0,'2011-08-27 21:39:06',NULL,NULL,NULL,'100102','单位管理-浏览'),
 (3,0,'2011-08-27 21:39:28',NULL,NULL,NULL,'100201','部门管理-增删改'),
 (4,0,'2011-08-27 21:39:36',NULL,NULL,NULL,'100202','部门管理-浏览'),
 (5,0,'2011-08-27 21:40:10',NULL,NULL,NULL,'100301','岗位管理-增删改'),
 (6,0,'2011-08-27 21:40:28',NULL,NULL,NULL,'100302','岗位管理-浏览'),
 (7,0,'2011-08-27 21:40:47',NULL,NULL,NULL,'100401','帐号管理-怎删改'),
 (8,0,'2011-08-27 21:40:54',NULL,NULL,NULL,'100402','帐号管理-浏览'),
 (9,0,'2011-08-27 21:41:06',NULL,NULL,NULL,'100501','角色管理-增删改'),
 (10,0,'2011-08-27 21:41:14',NULL,NULL,NULL,'100502','角色管理-浏览'),
 (11,0,'2011-08-27 21:41:44',NULL,NULL,NULL,'100601','权限管理-增删改'),
 (12,0,'2011-08-27 21:41:50',NULL,NULL,NULL,'100602','权限管理-浏览'),
 (13,0,'2011-09-08 19:25:01',NULL,NULL,NULL,'helloworld','');
/*!40000 ALTER TABLE `core_op` ENABLE KEYS */;


--
-- Definition of table `core_op_role_relation`
--

DROP TABLE IF EXISTS `core_op_role_relation`;
CREATE TABLE `core_op_role_relation` (
  `ID_` int(10) unsigned NOT NULL auto_increment,
  `CID_` int(10) unsigned default NULL,
  `CDATE_` datetime default NULL,
  `opId` int(10) unsigned default NULL,
  `roleId` int(10) unsigned default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_op_role_relation`
--

/*!40000 ALTER TABLE `core_op_role_relation` DISABLE KEYS */;
INSERT INTO `core_op_role_relation` (`ID_`,`CID_`,`CDATE_`,`opId`,`roleId`) VALUES 
 (3,0,'2011-09-04 18:28:49',3,1),
 (4,0,'2011-09-04 18:28:49',4,1),
 (5,0,'2011-09-04 18:28:49',5,1),
 (6,0,'2011-09-04 18:28:49',6,1),
 (7,0,'2011-09-04 18:28:49',7,1),
 (8,0,'2011-09-04 18:28:49',8,1),
 (9,0,'2011-09-04 18:28:49',9,1),
 (10,0,'2011-09-04 18:28:49',10,1),
 (11,0,'2011-09-04 18:28:49',11,1),
 (12,0,'2011-09-04 18:28:49',12,1),
 (13,0,'2011-09-05 21:50:39',1,1),
 (14,0,'2011-09-05 21:50:39',2,1),
 (15,0,'2011-09-09 07:47:44',13,1);
/*!40000 ALTER TABLE `core_op_role_relation` ENABLE KEYS */;


--
-- Definition of table `core_org`
--

DROP TABLE IF EXISTS `core_org`;
CREATE TABLE `core_org` (
  `ID_` int(10) unsigned NOT NULL auto_increment,
  `CID_` int(10) unsigned default NULL,
  `CDATE_` datetime default NULL,
  `MID_` int(10) unsigned default NULL,
  `MDATE_` datetime default NULL,
  `UUID_` varchar(45) default NULL,
  `orgName` varchar(100) default NULL,
  `orgDesc` varchar(100) default NULL,
  `sequence` int(10) unsigned default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_org`
--

/*!40000 ALTER TABLE `core_org` DISABLE KEYS */;
INSERT INTO `core_org` (`ID_`,`CID_`,`CDATE_`,`MID_`,`MDATE_`,`UUID_`,`orgName`,`orgDesc`,`sequence`) VALUES 
 (1,0,'2011-08-15 20:41:22',0,'2011-09-05 22:02:32',NULL,'西柏网络','西柏网络科技有限公司',0),
 (11,0,'2011-08-15 21:50:50',0,'2011-08-21 21:29:51',NULL,'中国石油','中国石油股份有限公司',0),
 (12,0,'2011-08-15 21:50:53',0,'2011-08-21 21:24:29',NULL,'中国石化','中国石化股份有限公司',100),
 (13,0,'2011-08-16 20:47:59',0,'2011-08-21 21:24:13',NULL,'中国移动','中国移动股份有限公司',99);
/*!40000 ALTER TABLE `core_org` ENABLE KEYS */;


--
-- Definition of table `core_role`
--

DROP TABLE IF EXISTS `core_role`;
CREATE TABLE `core_role` (
  `ID_` int(10) unsigned NOT NULL auto_increment,
  `CID_` int(10) unsigned default NULL,
  `CDATE_` datetime default NULL,
  `MID_` int(10) unsigned default NULL,
  `MDATE_` datetime default NULL,
  `UUID_` varchar(45) default NULL,
  `roleName` varchar(100) default NULL,
  `roleDesc` varchar(100) default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_role`
--

/*!40000 ALTER TABLE `core_role` DISABLE KEYS */;
INSERT INTO `core_role` (`ID_`,`CID_`,`CDATE_`,`MID_`,`MDATE_`,`UUID_`,`roleName`,`roleDesc`) VALUES 
 (1,0,'2011-08-27 21:03:24',0,'2011-08-27 21:03:33',NULL,'admin','管理员'),
 (2,0,'2011-08-27 21:03:49',0,'2011-09-06 21:16:41',NULL,'user','普通用户'),
 (3,0,'2011-08-27 21:03:58',NULL,NULL,NULL,'manager','经理');
/*!40000 ALTER TABLE `core_role` ENABLE KEYS */;


--
-- Definition of table `core_role_user_relation`
--

DROP TABLE IF EXISTS `core_role_user_relation`;
CREATE TABLE `core_role_user_relation` (
  `ID_` int(10) unsigned NOT NULL auto_increment,
  `CID_` int(10) unsigned default NULL,
  `CDATE_` datetime default NULL,
  `roleId` int(10) unsigned default NULL,
  `userId` int(10) unsigned default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_role_user_relation`
--

/*!40000 ALTER TABLE `core_role_user_relation` DISABLE KEYS */;
INSERT INTO `core_role_user_relation` (`ID_`,`CID_`,`CDATE_`,`roleId`,`userId`) VALUES 
 (2,0,'2011-09-04 07:44:41',1,1),
 (7,1,'2011-09-06 21:16:46',2,2);
/*!40000 ALTER TABLE `core_role_user_relation` ENABLE KEYS */;


--
-- Definition of table `core_topmenu`
--

DROP TABLE IF EXISTS `core_topmenu`;
CREATE TABLE `core_topmenu` (
  `ID_` int(10) unsigned NOT NULL auto_increment,
  `CID_` int(10) unsigned default NULL,
  `CDATE_` datetime default NULL,
  `MID_` int(10) unsigned default NULL,
  `MDATE_` datetime default NULL,
  `UUID_` varchar(45) default NULL,
  `parentId` int(10) unsigned default NULL,
  `menuName` varchar(100) default NULL,
  `menuUrl` varchar(100) default NULL,
  `menuTarget` varchar(100) default NULL,
  `sequence` int(10) unsigned default '0',
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_topmenu`
--

/*!40000 ALTER TABLE `core_topmenu` DISABLE KEYS */;
INSERT INTO `core_topmenu` (`ID_`,`CID_`,`CDATE_`,`MID_`,`MDATE_`,`UUID_`,`parentId`,`menuName`,`menuUrl`,`menuTarget`,`sequence`) VALUES 
 (1,0,'2011-08-28 10:50:53',0,NULL,NULL,0,'首页','index.jsf','_self',1),
 (2,0,'2011-08-28 10:54:12',0,NULL,NULL,0,'新闻中心','','_self',2),
 (3,0,'2011-08-28 10:54:42',0,NULL,NULL,0,'部门网站','','_self',3),
 (4,0,'2011-08-28 10:54:50',0,NULL,NULL,0,'内部培训','','_self',4),
 (5,0,'2011-08-28 10:54:58',0,NULL,NULL,0,'企业邮箱','','_self',5),
 (6,0,'2011-08-28 10:55:14',0,'2011-08-28 10:55:33',NULL,0,'下载中心','','_self',6),
 (7,0,'2011-08-28 10:55:26',0,NULL,NULL,0,'系统管理','','_self',99),
 (8,0,'2011-08-28 10:55:51',0,NULL,NULL,2,'通知通告','','_self',1),
 (9,0,'2011-08-28 10:56:02',0,'2011-08-28 10:56:21',NULL,2,'公司新闻','','_self',2),
 (10,0,'2011-08-28 10:56:10',0,'2011-08-28 10:56:33',NULL,2,'集团新闻','','_self',3),
 (11,0,'2011-08-28 10:56:43',0,'2011-08-28 10:56:55',NULL,2,'行业新闻','','_self',4),
 (12,0,'2011-08-28 10:57:05',0,NULL,NULL,2,'社会中心','','_self',5),
 (13,0,'2011-08-28 10:57:24',0,NULL,NULL,3,'人事部','','_self',1),
 (14,0,'2011-08-28 10:57:30',0,NULL,NULL,3,'财务部','','_self',2),
 (15,0,'2011-08-28 10:57:38',0,NULL,NULL,3,'技术部','','_self',3),
 (16,0,'2011-08-28 10:57:46',0,NULL,NULL,3,'市场部','','_self',4),
 (17,0,'2011-08-28 10:58:08',0,NULL,NULL,4,'新员工入职培训','','_self',1),
 (18,0,'2011-08-28 10:58:23',0,NULL,NULL,4,'Excel培训视频教程','','_self',2),
 (19,0,'2011-08-28 10:58:30',0,NULL,NULL,4,'Word培训视频教程','','_self',3),
 (20,0,'2011-08-28 10:58:45',0,NULL,NULL,5,'帐号设置','','_self',1),
 (21,0,'2011-08-28 10:58:55',0,NULL,NULL,5,'收件箱','','_self',2),
 (22,0,'2011-08-28 10:59:02',0,NULL,NULL,5,'发件箱','','_self',3),
 (23,0,'2011-08-28 10:59:11',0,NULL,NULL,5,'草稿箱','','_self',4),
 (24,0,'2011-08-28 10:59:20',0,NULL,NULL,5,'垃圾箱','','_self',5),
 (25,0,'2011-08-28 10:59:40',0,NULL,NULL,6,'工具软件','','_self',1),
 (26,0,'2011-08-28 10:59:47',0,NULL,NULL,6,'规章制度','','_self',2),
 (27,0,'2011-08-28 10:59:55',0,NULL,NULL,6,'申请表单','','_self',3),
 (28,0,'2011-08-29 20:21:40',0,NULL,NULL,7,'单位管理','org.jsf','_self',1),
 (29,0,'2011-08-29 20:22:14',0,NULL,NULL,7,'部门管理','department.jsf','_self',2),
 (30,0,'2011-08-29 20:22:33',0,'2011-09-03 14:49:59',NULL,7,'岗位管理','job.jsf','_self',3),
 (31,0,'2011-08-29 20:22:52',0,NULL,NULL,7,'帐号管理','user.jsf','_self',4),
 (32,0,'2011-08-29 20:23:12',0,NULL,NULL,7,'角色管理','role.jsf','_self',5),
 (33,0,'2011-08-29 20:23:34',0,NULL,NULL,7,'权限管理','op.jsf','_self',6),
 (34,0,'2011-08-29 20:24:05',0,NULL,NULL,7,'顶部菜单管理','topmenuadmin.jsf','_self',7),
 (35,0,'2011-08-29 20:24:25',0,NULL,NULL,7,'左侧菜单管理','leftmenuadmin.jsf','_self',8),
 (36,0,'2011-08-29 20:24:51',0,NULL,NULL,7,'基础数据','','_self',9),
 (37,0,'2011-08-29 20:25:05',0,NULL,NULL,7,'日志管理','','_self',10),
 (38,0,'2011-08-29 20:25:16',0,NULL,NULL,7,'新闻管理','','_self',11),
 (39,0,'2011-08-29 20:25:34',0,NULL,NULL,7,'流程管理','','_self',12),
 (40,0,'2011-08-29 20:30:10',0,NULL,NULL,39,'流程定义','','_self',1),
 (41,0,'2011-08-29 20:30:26',0,NULL,NULL,39,'节点定义','','_self',2),
 (42,0,'2011-08-29 20:30:47',0,NULL,NULL,39,'审批代理','','_self',3);
/*!40000 ALTER TABLE `core_topmenu` ENABLE KEYS */;


--
-- Definition of table `core_topmenu_role_relation`
--

DROP TABLE IF EXISTS `core_topmenu_role_relation`;
CREATE TABLE `core_topmenu_role_relation` (
  `ID_` int(10) unsigned NOT NULL auto_increment,
  `CID_` int(10) unsigned default NULL,
  `CDATE_` datetime default NULL,
  `menuId` int(10) unsigned default NULL,
  `roleId` int(10) unsigned default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_topmenu_role_relation`
--

/*!40000 ALTER TABLE `core_topmenu_role_relation` DISABLE KEYS */;
INSERT INTO `core_topmenu_role_relation` (`ID_`,`CID_`,`CDATE_`,`menuId`,`roleId`) VALUES 
 (1,0,'2011-09-04 22:02:38',0,2),
 (46,0,'2011-09-04 22:08:49',2,3),
 (47,0,'2011-09-04 22:08:49',3,3),
 (48,0,'2011-09-04 22:08:49',4,3),
 (49,0,'2011-09-04 22:08:49',5,3),
 (50,0,'2011-09-04 22:08:49',6,3),
 (51,0,'2011-09-04 22:08:49',7,3),
 (52,0,'2011-09-04 22:08:49',8,3),
 (53,0,'2011-09-04 22:08:49',9,3),
 (54,0,'2011-09-04 22:08:49',10,3),
 (55,0,'2011-09-04 22:08:49',11,3),
 (56,0,'2011-09-04 22:08:49',12,3),
 (57,0,'2011-09-04 22:08:49',13,3),
 (58,0,'2011-09-04 22:08:49',14,3),
 (59,0,'2011-09-04 22:08:49',15,3),
 (60,0,'2011-09-04 22:08:49',17,3),
 (61,0,'2011-09-04 22:08:49',16,3),
 (62,0,'2011-09-04 22:08:49',19,3),
 (63,0,'2011-09-04 22:08:49',18,3),
 (64,0,'2011-09-04 22:08:49',21,3),
 (65,0,'2011-09-04 22:08:49',20,3),
 (66,0,'2011-09-04 22:08:49',23,3),
 (67,0,'2011-09-04 22:08:49',22,3),
 (68,0,'2011-09-04 22:08:49',25,3),
 (69,0,'2011-09-04 22:08:49',24,3),
 (70,0,'2011-09-04 22:08:49',27,3),
 (71,0,'2011-09-04 22:08:49',26,3),
 (72,0,'2011-09-04 22:08:49',29,3),
 (73,0,'2011-09-04 22:08:49',28,3),
 (74,0,'2011-09-04 22:08:49',31,3),
 (75,0,'2011-09-04 22:08:49',30,3),
 (76,0,'2011-09-04 22:08:49',34,3),
 (77,0,'2011-09-04 22:08:49',35,3),
 (78,0,'2011-09-04 22:08:49',32,3),
 (79,0,'2011-09-04 22:08:49',33,3),
 (80,0,'2011-09-04 22:08:49',38,3),
 (81,0,'2011-09-04 22:08:49',39,3),
 (82,0,'2011-09-04 22:08:49',36,3),
 (83,0,'2011-09-04 22:08:49',37,3),
 (84,0,'2011-09-04 22:08:49',42,3),
 (85,0,'2011-09-04 22:08:49',40,3),
 (86,0,'2011-09-04 22:08:49',41,3),
 (87,0,'2011-09-05 19:40:37',1,1),
 (88,0,'2011-09-05 19:40:37',2,1),
 (89,0,'2011-09-05 19:40:37',3,1),
 (90,0,'2011-09-05 19:40:37',4,1),
 (91,0,'2011-09-05 19:40:37',5,1),
 (92,0,'2011-09-05 19:40:37',6,1),
 (93,0,'2011-09-05 19:40:37',7,1),
 (94,0,'2011-09-05 19:40:37',8,1),
 (95,0,'2011-09-05 19:40:37',9,1),
 (96,0,'2011-09-05 19:40:37',10,1),
 (97,0,'2011-09-05 19:40:37',11,1),
 (98,0,'2011-09-05 19:40:37',12,1),
 (99,0,'2011-09-05 19:40:37',13,1),
 (100,0,'2011-09-05 19:40:37',14,1),
 (101,0,'2011-09-05 19:40:37',15,1),
 (102,0,'2011-09-05 19:40:37',17,1),
 (103,0,'2011-09-05 19:40:37',16,1),
 (104,0,'2011-09-05 19:40:37',19,1),
 (105,0,'2011-09-05 19:40:37',18,1),
 (106,0,'2011-09-05 19:40:37',21,1),
 (107,0,'2011-09-05 19:40:37',20,1),
 (108,0,'2011-09-05 19:40:37',23,1),
 (109,0,'2011-09-05 19:40:37',22,1),
 (110,0,'2011-09-05 19:40:37',25,1),
 (111,0,'2011-09-05 19:40:37',24,1),
 (112,0,'2011-09-05 19:40:37',27,1),
 (113,0,'2011-09-05 19:40:37',26,1),
 (114,0,'2011-09-05 19:40:37',29,1),
 (115,0,'2011-09-05 19:40:37',28,1),
 (116,0,'2011-09-05 19:40:37',31,1),
 (117,0,'2011-09-05 19:40:37',30,1),
 (118,0,'2011-09-05 19:40:37',34,1),
 (119,0,'2011-09-05 19:40:37',35,1),
 (120,0,'2011-09-05 19:40:37',32,1),
 (121,0,'2011-09-05 19:40:37',33,1),
 (122,0,'2011-09-05 19:40:37',38,1),
 (124,0,'2011-09-05 19:40:37',36,1),
 (125,0,'2011-09-05 19:40:37',37,1);
/*!40000 ALTER TABLE `core_topmenu_role_relation` ENABLE KEYS */;


--
-- Definition of table `core_user`
--

DROP TABLE IF EXISTS `core_user`;
CREATE TABLE `core_user` (
  `ID_` int(10) unsigned NOT NULL auto_increment,
  `CID_` int(10) unsigned default NULL,
  `CDATE_` datetime default NULL,
  `MID_` int(10) unsigned default NULL,
  `MDATE_` datetime default NULL,
  `UUID_` varchar(45) default NULL,
  `userName` varchar(100) default NULL,
  `depaId` int(10) unsigned default NULL,
  `jobId` int(10) unsigned default NULL,
  `email` varchar(100) default NULL,
  `password` varchar(300) default NULL,
  `phone` varchar(100) default NULL,
  `mobilePhone` varchar(100) default NULL,
  `gender` tinyint(3) unsigned default '0',
  `displayName` varchar(100) default NULL,
  `isLock` tinyint(3) unsigned default '0',
  `jobId2` int(10) unsigned default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_user`
--

/*!40000 ALTER TABLE `core_user` DISABLE KEYS */;
INSERT INTO `core_user` (`ID_`,`CID_`,`CDATE_`,`MID_`,`MDATE_`,`UUID_`,`userName`,`depaId`,`jobId`,`email`,`password`,`phone`,`mobilePhone`,`gender`,`displayName`,`isLock`,`jobId2`) VALUES 
 (1,0,'2011-08-23 21:43:02',0,'2011-08-27 21:15:42',NULL,'admin',2,3,'914261631@qq.com','e10adc3949ba59abbe56e057f20f883e','','13589310033',0,'管理员',0,7),
 (2,0,'2011-08-24 21:18:36',0,'2011-09-08 19:19:33',NULL,'subadmin',14,6,'914261631@qq.com','e10adc3949ba59abbe56e057f20f883e','123456','13589310033',1,'管理员',1,3),
 (3,0,'2011-09-09 09:21:13',NULL,NULL,NULL,'Kate',2,0,'kate@gmail.com','e10adc3949ba59abbe56e057f20f883e','','',0,'Kate',NULL,0),
 (4,0,'2011-09-09 09:21:23',NULL,NULL,NULL,'Tom',2,0,'tom@gmail.com','e10adc3949ba59abbe56e057f20f883e','','',0,'Tom',NULL,0),
 (5,0,'2011-09-09 09:21:37',NULL,NULL,NULL,'Yahoo',2,0,'yahoo@gmail.com','e10adc3949ba59abbe56e057f20f883e','','',0,'Yahoo',NULL,0),
 (6,0,'2011-09-09 09:21:49',NULL,NULL,NULL,'Google',2,0,'google@gmail.com','e10adc3949ba59abbe56e057f20f883e','','',0,'Google',NULL,0),
 (7,0,'2011-09-09 09:22:02',NULL,NULL,NULL,'Baidu',2,0,'baidu@gmail.com','e10adc3949ba59abbe56e057f20f883e','','',0,'Baidu',NULL,0),
 (8,0,'2011-09-09 09:22:14',NULL,NULL,NULL,'163',2,0,'163@gmail.com','e10adc3949ba59abbe56e057f20f883e','','',0,'163',NULL,0),
 (9,0,'2011-09-09 09:22:27',NULL,NULL,NULL,'Lucy',2,0,'lucy@gmail.com','e10adc3949ba59abbe56e057f20f883e','','',1,'Lucy',NULL,0),
 (10,0,'2011-09-09 09:22:51',NULL,NULL,NULL,'Ben',2,0,'ben@gmail.com','e10adc3949ba59abbe56e057f20f883e','','',1,'Ben',NULL,0),
 (11,0,'2011-09-09 09:22:59',NULL,NULL,NULL,'Li',2,0,'li@gmail.com','e10adc3949ba59abbe56e057f20f883e','','',1,'Li',NULL,0);
/*!40000 ALTER TABLE `core_user` ENABLE KEYS */;


--
-- Definition of procedure `core_delete_leftmenu_p`
--

DROP PROCEDURE IF EXISTS `core_delete_leftmenu_p`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `core_delete_leftmenu_p`(in id int)
BEGIN
	delete from core_leftmenu_role_relation where menuId = id;
  delete from core_leftmenu where ID_ = id;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `core_delete_op_p`
--

DROP PROCEDURE IF EXISTS `core_delete_op_p`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `core_delete_op_p`(in id int)
BEGIN
	delete from core_op_role_relation where opId = id;
  delete from core_op where ID_ = id;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `core_delete_role_p`
--

DROP PROCEDURE IF EXISTS `core_delete_role_p`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `core_delete_role_p`(in id int)
BEGIN
	delete from core_op_role_relation where roleId = id;
	delete from core_leftmenu_role_relation where roleId = id;
	delete from core_topmenu_role_relation where roleId = id;
	delete from core_role_user_relation where roleId = id;
  delete from core_role where ID_ = id;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `core_delete_topmenu_p`
--

DROP PROCEDURE IF EXISTS `core_delete_topmenu_p`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `core_delete_topmenu_p`(in id int)
BEGIN
	delete from core_topmenu_role_relation where menuId = id;
  delete from core_topmenu where ID_ = id;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `core_delete_user_p`
--

DROP PROCEDURE IF EXISTS `core_delete_user_p`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `core_delete_user_p`(in id int)
BEGIN
	delete from core_role_user_relation where userId = id;
  delete from core_user where ID_ = id;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
