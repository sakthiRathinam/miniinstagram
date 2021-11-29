-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 12, 2021 at 02:22 PM
-- Server version: 8.0.23-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zigma_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_emailaddress`
--

CREATE TABLE `account_emailaddress` (
  `id` int NOT NULL,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_emailconfirmation`
--

CREATE TABLE `account_emailconfirmation` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assets_asset`
--

CREATE TABLE `assets_asset` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `modelNo` varchar(50) DEFAULT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `price` double NOT NULL,
  `is_charges` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `hsn` varchar(250) DEFAULT NULL,
  `taxPercentage` double NOT NULL,
  `category` varchar(250) DEFAULT NULL,
  `description` longtext,
  `dp` varchar(100) DEFAULT NULL,
  `service_charge` double NOT NULL,
  `promitionLink` varchar(250) DEFAULT NULL,
  `catalogue` varchar(100) DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assets_assetaddon`
--

CREATE TABLE `assets_assetaddon` (
  `id` int NOT NULL,
  `rate` double NOT NULL,
  `label` varchar(250) DEFAULT NULL,
  `typ` varchar(30) DEFAULT NULL,
  `period` double NOT NULL,
  `default` tinyint(1) NOT NULL,
  `description` longtext,
  `parent_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assets_contactproducts`
--

CREATE TABLE `assets_contactproducts` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `serialNo` varchar(200) DEFAULT NULL,
  `qty` int UNSIGNED DEFAULT NULL,
  `seperateAddress` tinyint(1) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `data` longtext NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `addon_id` int DEFAULT NULL,
  `asset_id` int DEFAULT NULL,
  `inventory_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assets_indent`
--

CREATE TABLE `assets_indent` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `requestedToUnit_id` int DEFAULT NULL,
  `requestor_id` int DEFAULT NULL,
  `requestorUnit_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assets_indentasset`
--

CREATE TABLE `assets_indentasset` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `qty` int UNSIGNED DEFAULT NULL,
  `asset_id` int NOT NULL,
  `unit_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assets_indentqtymap`
--

CREATE TABLE `assets_indentqtymap` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `assetName` varchar(100) DEFAULT NULL,
  `qty` int UNSIGNED DEFAULT NULL,
  `alloted` tinyint(1) NOT NULL,
  `asset_id` int DEFAULT NULL,
  `indent_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assets_min`
--

CREATE TABLE `assets_min` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `issuedBy_id` int DEFAULT NULL,
  `issuedTo_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add user', 3, 'add_user'),
(8, 'Can change user', 3, 'change_user'),
(9, 'Can delete user', 3, 'delete_user'),
(10, 'Can add group', 4, 'add_group'),
(11, 'Can change group', 4, 'change_group'),
(12, 'Can delete group', 4, 'delete_group'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add site', 7, 'add_site'),
(20, 'Can change site', 7, 'change_site'),
(21, 'Can delete site', 7, 'delete_site'),
(22, 'Can add email confirmation', 8, 'add_emailconfirmation'),
(23, 'Can change email confirmation', 8, 'change_emailconfirmation'),
(24, 'Can delete email confirmation', 8, 'delete_emailconfirmation'),
(25, 'Can add email address', 9, 'add_emailaddress'),
(26, 'Can change email address', 9, 'change_emailaddress'),
(27, 'Can delete email address', 9, 'delete_emailaddress'),
(28, 'Can add social account', 10, 'add_socialaccount'),
(29, 'Can change social account', 10, 'change_socialaccount'),
(30, 'Can delete social account', 10, 'delete_socialaccount'),
(31, 'Can add social application', 11, 'add_socialapp'),
(32, 'Can change social application', 11, 'change_socialapp'),
(33, 'Can delete social application', 11, 'delete_socialapp'),
(34, 'Can add social application token', 12, 'add_socialtoken'),
(35, 'Can change social application token', 12, 'change_socialtoken'),
(36, 'Can delete social application token', 12, 'delete_socialtoken'),
(37, 'Can add url', 13, 'add_url'),
(38, 'Can change url', 13, 'change_url'),
(39, 'Can delete url', 13, 'delete_url'),
(40, 'Can add rule', 14, 'add_rule'),
(41, 'Can change rule', 14, 'change_rule'),
(42, 'Can delete rule', 14, 'delete_rule'),
(43, 'Can add bankloan', 15, 'add_bankloan'),
(44, 'Can change bankloan', 15, 'change_bankloan'),
(45, 'Can delete bankloan', 15, 'delete_bankloan'),
(46, 'Can add generic pincode', 16, 'add_genericpincode'),
(47, 'Can change generic pincode', 16, 'change_genericpincode'),
(48, 'Can delete generic pincode', 16, 'delete_genericpincode'),
(49, 'Can add menu items', 17, 'add_menuitems'),
(50, 'Can change menu items', 17, 'change_menuitems'),
(51, 'Can delete menu items', 17, 'delete_menuitems'),
(52, 'Can add application', 18, 'add_application'),
(53, 'Can change application', 18, 'change_application'),
(54, 'Can delete application', 18, 'delete_application'),
(55, 'Can add address', 19, 'add_address'),
(56, 'Can change address', 19, 'change_address'),
(57, 'Can delete address', 19, 'delete_address'),
(58, 'Can add public api keys', 20, 'add_publicapikeys'),
(59, 'Can change public api keys', 20, 'change_publicapikeys'),
(60, 'Can delete public api keys', 20, 'delete_publicapikeys'),
(61, 'Can add permission', 21, 'add_permission'),
(62, 'Can change permission', 21, 'change_permission'),
(63, 'Can delete permission', 21, 'delete_permission'),
(64, 'Can add device', 22, 'add_device'),
(65, 'Can change device', 22, 'change_device'),
(66, 'Can delete device', 22, 'delete_device'),
(67, 'Can add media', 23, 'add_media'),
(68, 'Can change media', 23, 'change_media'),
(69, 'Can delete media', 23, 'delete_media'),
(70, 'Can add api usage', 24, 'add_apiusage'),
(71, 'Can change api usage', 24, 'change_apiusage'),
(72, 'Can delete api usage', 24, 'delete_apiusage'),
(73, 'Can add group permission', 25, 'add_grouppermission'),
(74, 'Can change group permission', 25, 'change_grouppermission'),
(75, 'Can delete group permission', 25, 'delete_grouppermission'),
(76, 'Can add service', 26, 'add_service'),
(77, 'Can change service', 26, 'change_service'),
(78, 'Can delete service', 26, 'delete_service'),
(79, 'Can add module', 27, 'add_module'),
(80, 'Can change module', 27, 'change_module'),
(81, 'Can delete module', 27, 'delete_module'),
(82, 'Can add app settings field', 28, 'add_appsettingsfield'),
(83, 'Can change app settings field', 28, 'change_appsettingsfield'),
(84, 'Can delete app settings field', 28, 'delete_appsettingsfield'),
(85, 'Can add profile', 29, 'add_profile'),
(86, 'Can change profile', 29, 'change_profile'),
(87, 'Can delete profile', 29, 'delete_profile'),
(88, 'Can add documents', 30, 'add_documents'),
(89, 'Can change documents', 30, 'change_documents'),
(90, 'Can delete documents', 30, 'delete_documents'),
(91, 'Can add designation', 31, 'add_designation'),
(92, 'Can change designation', 31, 'change_designation'),
(93, 'Can delete designation', 31, 'delete_designation'),
(94, 'Can add rank', 32, 'add_rank'),
(95, 'Can change rank', 32, 'change_rank'),
(96, 'Can delete rank', 32, 'delete_rank'),
(97, 'Can add leave', 33, 'add_leave'),
(98, 'Can change leave', 33, 'change_leave'),
(99, 'Can delete leave', 33, 'delete_leave'),
(100, 'Can add payroll logs', 34, 'add_payrolllogs'),
(101, 'Can change payroll logs', 34, 'change_payrolllogs'),
(102, 'Can delete payroll logs', 34, 'delete_payrolllogs'),
(103, 'Can add team', 35, 'add_team'),
(104, 'Can change team', 35, 'change_team'),
(105, 'Can delete team', 35, 'delete_team'),
(106, 'Can add appraisal', 36, 'add_appraisal'),
(107, 'Can change appraisal', 36, 'change_appraisal'),
(108, 'Can delete appraisal', 36, 'delete_appraisal'),
(109, 'Can add exemployee session', 37, 'add_exemployeesession'),
(110, 'Can change exemployee session', 37, 'change_exemployeesession'),
(111, 'Can delete exemployee session', 37, 'delete_exemployeesession'),
(112, 'Can add document', 38, 'add_document'),
(113, 'Can change document', 38, 'change_document'),
(114, 'Can delete document', 38, 'delete_document'),
(115, 'Can add payroll', 39, 'add_payroll'),
(116, 'Can change payroll', 39, 'change_payroll'),
(117, 'Can delete payroll', 39, 'delete_payroll'),
(118, 'Can add profile', 40, 'add_profile'),
(119, 'Can change profile', 40, 'change_profile'),
(120, 'Can delete profile', 40, 'delete_profile'),
(121, 'Can add user tour tracker', 41, 'add_usertourtracker'),
(122, 'Can change user tour tracker', 41, 'change_usertourtracker'),
(123, 'Can delete user tour tracker', 41, 'delete_usertourtracker'),
(124, 'Can add accounts key', 42, 'add_accountskey'),
(125, 'Can change accounts key', 42, 'change_accountskey'),
(126, 'Can delete accounts key', 42, 'delete_accountskey'),
(127, 'Can add designation logs', 43, 'add_designationlogs'),
(128, 'Can change designation logs', 43, 'change_designationlogs'),
(129, 'Can delete designation logs', 43, 'delete_designationlogs'),
(130, 'Can add vendor profile', 44, 'add_vendorprofile'),
(131, 'Can change vendor profile', 44, 'change_vendorprofile'),
(132, 'Can delete vendor profile', 44, 'delete_vendorprofile'),
(133, 'Can add exit management', 45, 'add_exitmanagement'),
(134, 'Can change exit management', 45, 'change_exitmanagement'),
(135, 'Can delete exit management', 45, 'delete_exitmanagement'),
(136, 'Can add calendar', 46, 'add_calendar'),
(137, 'Can change calendar', 46, 'change_calendar'),
(138, 'Can delete calendar', 46, 'delete_calendar'),
(139, 'Can add notification', 47, 'add_notification'),
(140, 'Can change notification', 47, 'change_notification'),
(141, 'Can delete notification', 47, 'delete_notification'),
(142, 'Can add theme', 48, 'add_theme'),
(143, 'Can change theme', 48, 'change_theme'),
(144, 'Can delete theme', 48, 'delete_theme'),
(145, 'Can add notebook', 49, 'add_notebook'),
(146, 'Can change notebook', 49, 'change_notebook'),
(147, 'Can delete notebook', 49, 'delete_notebook'),
(148, 'Can add settings', 50, 'add_settings'),
(149, 'Can change settings', 50, 'change_settings'),
(150, 'Can delete settings', 50, 'delete_settings'),
(151, 'Can add page', 51, 'add_page'),
(152, 'Can change page', 51, 'change_page'),
(153, 'Can delete page', 51, 'delete_page'),
(154, 'Can add chat message', 52, 'add_chatmessage'),
(155, 'Can change chat message', 52, 'change_chatmessage'),
(156, 'Can delete chat message', 52, 'delete_chatmessage'),
(157, 'Can add mail attachment', 53, 'add_mailattachment'),
(158, 'Can change mail attachment', 53, 'change_mailattachment'),
(159, 'Can delete mail attachment', 53, 'delete_mailattachment'),
(160, 'Can add proxy account', 54, 'add_proxyaccount'),
(161, 'Can change proxy account', 54, 'change_proxyaccount'),
(162, 'Can delete proxy account', 54, 'delete_proxyaccount'),
(163, 'Can add commit notification', 55, 'add_commitnotification'),
(164, 'Can change commit notification', 55, 'change_commitnotification'),
(165, 'Can delete commit notification', 55, 'delete_commitnotification'),
(166, 'Can add code comment', 56, 'add_codecomment'),
(167, 'Can change code comment', 56, 'change_codecomment'),
(168, 'Can delete code comment', 56, 'delete_codecomment'),
(169, 'Can add group permission', 57, 'add_grouppermission'),
(170, 'Can change group permission', 57, 'change_grouppermission'),
(171, 'Can delete group permission', 57, 'delete_grouppermission'),
(172, 'Can add repo permission', 58, 'add_repopermission'),
(173, 'Can change repo permission', 58, 'change_repopermission'),
(174, 'Can delete repo permission', 58, 'delete_repopermission'),
(175, 'Can add git group', 59, 'add_gitgroup'),
(176, 'Can change git group', 59, 'change_gitgroup'),
(177, 'Can delete git group', 59, 'delete_gitgroup'),
(178, 'Can add repo', 60, 'add_repo'),
(179, 'Can change repo', 60, 'change_repo'),
(180, 'Can delete repo', 60, 'delete_repo'),
(181, 'Can add sub task', 61, 'add_subtask'),
(182, 'Can change sub task', 61, 'change_subtask'),
(183, 'Can delete sub task', 61, 'delete_subtask'),
(184, 'Can add task workbook', 62, 'add_taskworkbook'),
(185, 'Can change task workbook', 62, 'change_taskworkbook'),
(186, 'Can delete task workbook', 62, 'delete_taskworkbook'),
(187, 'Can add media', 63, 'add_media'),
(188, 'Can change media', 63, 'change_media'),
(189, 'Can delete media', 63, 'delete_media'),
(190, 'Can add timeline item', 64, 'add_timelineitem'),
(191, 'Can change timeline item', 64, 'change_timelineitem'),
(192, 'Can delete timeline item', 64, 'delete_timelineitem'),
(193, 'Can add task', 65, 'add_task'),
(194, 'Can change task', 65, 'change_task'),
(195, 'Can delete task', 65, 'delete_task'),
(196, 'Can add media', 66, 'add_media'),
(197, 'Can change media', 66, 'change_media'),
(198, 'Can delete media', 66, 'delete_media'),
(199, 'Can add project objective', 67, 'add_projectobjective'),
(200, 'Can change project objective', 67, 'change_projectobjective'),
(201, 'Can delete project objective', 67, 'delete_projectobjective'),
(202, 'Can add comment', 68, 'add_comment'),
(203, 'Can change comment', 68, 'change_comment'),
(204, 'Can delete comment', 68, 'delete_comment'),
(205, 'Can add project', 69, 'add_project'),
(206, 'Can change project', 69, 'change_project'),
(207, 'Can delete project', 69, 'delete_project'),
(208, 'Can add issues', 70, 'add_issues'),
(209, 'Can change issues', 70, 'change_issues'),
(210, 'Can delete issues', 70, 'delete_issues'),
(211, 'Can add timeline item', 71, 'add_timelineitem'),
(212, 'Can change timeline item', 71, 'change_timelineitem'),
(213, 'Can delete timeline item', 71, 'delete_timelineitem'),
(214, 'Can add project comment', 72, 'add_projectcomment'),
(215, 'Can change project comment', 72, 'change_projectcomment'),
(216, 'Can delete project comment', 72, 'delete_projectcomment'),
(217, 'Can add po terms and conditions', 73, 'add_potermsandconditions'),
(218, 'Can change po terms and conditions', 73, 'change_potermsandconditions'),
(219, 'Can delete po terms and conditions', 73, 'delete_potermsandconditions'),
(220, 'Can add account', 74, 'add_account'),
(221, 'Can change account', 74, 'change_account'),
(222, 'Can delete account', 74, 'delete_account'),
(223, 'Can add configure terms and conditions', 75, 'add_configuretermsandconditions'),
(224, 'Can change configure terms and conditions', 75, 'change_configuretermsandconditions'),
(225, 'Can delete configure terms and conditions', 75, 'delete_configuretermsandconditions'),
(226, 'Can add out bound invoice', 76, 'add_outboundinvoice'),
(227, 'Can change out bound invoice', 76, 'change_outboundinvoice'),
(228, 'Can delete out bound invoice', 76, 'delete_outboundinvoice'),
(229, 'Can add vendor service', 77, 'add_vendorservice'),
(230, 'Can change vendor service', 77, 'change_vendorservice'),
(231, 'Can delete vendor service', 77, 'delete_vendorservice'),
(232, 'Can add project petty expense', 78, 'add_projectpettyexpense'),
(233, 'Can change project petty expense', 78, 'change_projectpettyexpense'),
(234, 'Can delete project petty expense', 78, 'delete_projectpettyexpense'),
(235, 'Can add expense sheet', 79, 'add_expensesheet'),
(236, 'Can change expense sheet', 79, 'change_expensesheet'),
(237, 'Can delete expense sheet', 79, 'delete_expensesheet'),
(238, 'Can add transaction', 80, 'add_transaction'),
(239, 'Can change transaction', 80, 'change_transaction'),
(240, 'Can delete transaction', 80, 'delete_transaction'),
(241, 'Can add inventory log', 81, 'add_inventorylog'),
(242, 'Can change inventory log', 81, 'change_inventorylog'),
(243, 'Can delete inventory log', 81, 'delete_inventorylog'),
(244, 'Can add inventory', 82, 'add_inventory'),
(245, 'Can change inventory', 82, 'change_inventory'),
(246, 'Can delete inventory', 82, 'delete_inventory'),
(247, 'Can add inflow', 83, 'add_inflow'),
(248, 'Can change inflow', 83, 'change_inflow'),
(249, 'Can delete inflow', 83, 'delete_inflow'),
(250, 'Can add expense heading', 84, 'add_expenseheading'),
(251, 'Can change expense heading', 84, 'change_expenseheading'),
(252, 'Can delete expense heading', 84, 'delete_expenseheading'),
(253, 'Can add cost center', 85, 'add_costcenter'),
(254, 'Can change cost center', 85, 'change_costcenter'),
(255, 'Can delete cost center', 85, 'delete_costcenter'),
(256, 'Can add out bound invoice qty', 86, 'add_outboundinvoiceqty'),
(257, 'Can change out bound invoice qty', 86, 'change_outboundinvoiceqty'),
(258, 'Can delete out bound invoice qty', 86, 'delete_outboundinvoiceqty'),
(259, 'Can add invoice', 87, 'add_invoice'),
(260, 'Can change invoice', 87, 'change_invoice'),
(261, 'Can delete invoice', 87, 'delete_invoice'),
(262, 'Can add purchase order', 88, 'add_purchaseorder'),
(263, 'Can change purchase order', 88, 'change_purchaseorder'),
(264, 'Can delete purchase order', 88, 'delete_purchaseorder'),
(265, 'Can add purchase order qty', 89, 'add_purchaseorderqty'),
(266, 'Can change purchase order qty', 89, 'change_purchaseorderqty'),
(267, 'Can delete purchase order qty', 89, 'delete_purchaseorderqty'),
(268, 'Can add files', 90, 'add_files'),
(269, 'Can change files', 90, 'change_files'),
(270, 'Can delete files', 90, 'delete_files'),
(271, 'Can add terms and conditions', 91, 'add_termsandconditions'),
(272, 'Can change terms and conditions', 91, 'change_termsandconditions'),
(273, 'Can delete terms and conditions', 91, 'delete_termsandconditions'),
(274, 'Can add email template', 92, 'add_emailtemplate'),
(275, 'Can change email template', 92, 'change_emailtemplate'),
(276, 'Can delete email template', 92, 'delete_emailtemplate'),
(277, 'Can add product meta', 93, 'add_productmeta'),
(278, 'Can change product meta', 93, 'change_productmeta'),
(279, 'Can delete product meta', 93, 'delete_productmeta'),
(280, 'Can add schedule', 94, 'add_schedule'),
(281, 'Can change schedule', 94, 'change_schedule'),
(282, 'Can delete schedule', 94, 'delete_schedule'),
(283, 'Can add complaints', 95, 'add_complaints'),
(284, 'Can change complaints', 95, 'change_complaints'),
(285, 'Can delete complaints', 95, 'delete_complaints'),
(286, 'Can add system log', 96, 'add_systemlog'),
(287, 'Can change system log', 96, 'change_systemlog'),
(288, 'Can delete system log', 96, 'delete_systemlog'),
(289, 'Can add payslip', 97, 'add_payslip'),
(290, 'Can change payslip', 97, 'change_payslip'),
(291, 'Can delete payslip', 97, 'delete_payslip'),
(292, 'Can add monthly payslip', 98, 'add_monthlypayslip'),
(293, 'Can change monthly payslip', 98, 'change_monthlypayslip'),
(294, 'Can delete monthly payslip', 98, 'delete_monthlypayslip'),
(295, 'Can add advances', 99, 'add_advances'),
(296, 'Can change advances', 99, 'change_advances'),
(297, 'Can delete advances', 99, 'delete_advances'),
(298, 'Can add disbursal', 100, 'add_disbursal'),
(299, 'Can change disbursal', 100, 'change_disbursal'),
(300, 'Can delete disbursal', 100, 'delete_disbursal'),
(301, 'Can add it decaration', 101, 'add_itdecaration'),
(302, 'Can change it decaration', 101, 'change_itdecaration'),
(303, 'Can delete it decaration', 101, 'delete_itdecaration'),
(304, 'Can add payroll report', 102, 'add_payrollreport'),
(305, 'Can change payroll report', 102, 'change_payrollreport'),
(306, 'Can delete payroll report', 102, 'delete_payrollreport'),
(307, 'Can add feedback', 103, 'add_feedback'),
(308, 'Can change feedback', 103, 'change_feedback'),
(309, 'Can delete feedback', 103, 'delete_feedback'),
(310, 'Can add time sheet', 104, 'add_timesheet'),
(311, 'Can change time sheet', 104, 'change_timesheet'),
(312, 'Can delete time sheet', 104, 'delete_timesheet'),
(313, 'Can add job application', 105, 'add_jobapplication'),
(314, 'Can change job application', 105, 'change_jobapplication'),
(315, 'Can delete job application', 105, 'delete_jobapplication'),
(316, 'Can add interview', 106, 'add_interview'),
(317, 'Can change interview', 106, 'change_interview'),
(318, 'Can delete interview', 106, 'delete_interview'),
(319, 'Can add jobs', 107, 'add_jobs'),
(320, 'Can change jobs', 107, 'change_jobs'),
(321, 'Can delete jobs', 107, 'delete_jobs'),
(322, 'Can add company holidays', 108, 'add_companyholidays'),
(323, 'Can change company holidays', 108, 'change_companyholidays'),
(324, 'Can delete company holidays', 108, 'delete_companyholidays'),
(325, 'Can add division', 109, 'add_division'),
(326, 'Can change division', 109, 'change_division'),
(327, 'Can delete division', 109, 'delete_division'),
(328, 'Can add role', 110, 'add_role'),
(329, 'Can change role', 110, 'change_role'),
(330, 'Can delete role', 110, 'delete_role'),
(331, 'Can add unit', 111, 'add_unit'),
(332, 'Can change unit', 111, 'change_unit'),
(333, 'Can delete unit', 111, 'delete_unit'),
(334, 'Can add home chart', 112, 'add_homechart'),
(335, 'Can change home chart', 112, 'change_homechart'),
(336, 'Can delete home chart', 112, 'delete_homechart'),
(337, 'Can add installed app', 113, 'add_installedapp'),
(338, 'Can change installed app', 113, 'change_installedapp'),
(339, 'Can delete installed app', 113, 'delete_installedapp'),
(340, 'Can add role permission', 114, 'add_rolepermission'),
(341, 'Can change role permission', 114, 'change_rolepermission'),
(342, 'Can delete role permission', 114, 'delete_rolepermission'),
(343, 'Can add departments', 115, 'add_departments'),
(344, 'Can change departments', 115, 'change_departments'),
(345, 'Can delete departments', 115, 'delete_departments'),
(346, 'Can add responsibility', 116, 'add_responsibility'),
(347, 'Can change responsibility', 116, 'change_responsibility'),
(348, 'Can delete responsibility', 116, 'delete_responsibility'),
(349, 'Can add indent asset', 117, 'add_indentasset'),
(350, 'Can change indent asset', 117, 'change_indentasset'),
(351, 'Can delete indent asset', 117, 'delete_indentasset'),
(352, 'Can add asset addon', 118, 'add_assetaddon'),
(353, 'Can change asset addon', 118, 'change_assetaddon'),
(354, 'Can delete asset addon', 118, 'delete_assetaddon'),
(355, 'Can add asset', 119, 'add_asset'),
(356, 'Can change asset', 119, 'change_asset'),
(357, 'Can delete asset', 119, 'delete_asset'),
(358, 'Can add min', 120, 'add_min'),
(359, 'Can change min', 120, 'change_min'),
(360, 'Can delete min', 120, 'delete_min'),
(361, 'Can add indent', 121, 'add_indent'),
(362, 'Can change indent', 121, 'change_indent'),
(363, 'Can delete indent', 121, 'delete_indent'),
(364, 'Can add contact products', 122, 'add_contactproducts'),
(365, 'Can change contact products', 122, 'change_contactproducts'),
(366, 'Can delete contact products', 122, 'delete_contactproducts'),
(367, 'Can add indent qty map', 123, 'add_indentqtymap'),
(368, 'Can change indent qty map', 123, 'change_indentqtymap'),
(369, 'Can delete indent qty map', 123, 'delete_indentqtymap'),
(370, 'Can add campaign tracker', 124, 'add_campaigntracker'),
(371, 'Can change campaign tracker', 124, 'change_campaigntracker'),
(372, 'Can delete campaign tracker', 124, 'delete_campaigntracker'),
(373, 'Can add notification', 125, 'add_notification'),
(374, 'Can change notification', 125, 'change_notification'),
(375, 'Can delete notification', 125, 'delete_notification'),
(376, 'Can add payment reciepts', 126, 'add_paymentreciepts'),
(377, 'Can change payment reciepts', 126, 'change_paymentreciepts'),
(378, 'Can delete payment reciepts', 126, 'delete_paymentreciepts'),
(379, 'Can add abb quotation', 127, 'add_abbquotation'),
(380, 'Can change abb quotation', 127, 'change_abbquotation'),
(381, 'Can delete abb quotation', 127, 'delete_abbquotation'),
(382, 'Can add abb quotation qtys', 128, 'add_abbquotationqtys'),
(383, 'Can change abb quotation qtys', 128, 'change_abbquotationqtys'),
(384, 'Can delete abb quotation qtys', 128, 'delete_abbquotationqtys'),
(385, 'Can add product qtys', 129, 'add_productqtys'),
(386, 'Can change product qtys', 129, 'change_productqtys'),
(387, 'Can delete product qtys', 129, 'delete_productqtys'),
(388, 'Can add im', 130, 'add_im'),
(389, 'Can change im', 130, 'change_im'),
(390, 'Can delete im', 130, 'delete_im'),
(391, 'Can add contact', 131, 'add_contact'),
(392, 'Can change contact', 131, 'change_contact'),
(393, 'Can delete contact', 131, 'delete_contact'),
(394, 'Can add campaign logs', 132, 'add_campaignlogs'),
(395, 'Can change campaign logs', 132, 'change_campaignlogs'),
(396, 'Can delete campaign logs', 132, 'delete_campaignlogs'),
(397, 'Can add campaign item', 133, 'add_campaignitem'),
(398, 'Can change campaign item', 133, 'change_campaignitem'),
(399, 'Can delete campaign item', 133, 'delete_campaignitem'),
(400, 'Can add legal agreement', 134, 'add_legalagreement'),
(401, 'Can change legal agreement', 134, 'change_legalagreement'),
(402, 'Can delete legal agreement', 134, 'delete_legalagreement'),
(403, 'Can add discount', 135, 'add_discount'),
(404, 'Can change discount', 135, 'change_discount'),
(405, 'Can delete discount', 135, 'delete_discount'),
(406, 'Can add site expenses', 136, 'add_siteexpenses'),
(407, 'Can change site expenses', 136, 'change_siteexpenses'),
(408, 'Can delete site expenses', 136, 'delete_siteexpenses'),
(409, 'Can add checkin', 137, 'add_checkin'),
(410, 'Can change checkin', 137, 'change_checkin'),
(411, 'Can delete checkin', 137, 'delete_checkin'),
(412, 'Can add log', 138, 'add_log'),
(413, 'Can change log', 138, 'change_log'),
(414, 'Can delete log', 138, 'delete_log'),
(415, 'Can add crm terms and conditions', 139, 'add_crmtermsandconditions'),
(416, 'Can change crm terms and conditions', 139, 'change_crmtermsandconditions'),
(417, 'Can delete crm terms and conditions', 139, 'delete_crmtermsandconditions'),
(418, 'Can add contacts', 140, 'add_contacts'),
(419, 'Can change contacts', 140, 'change_contacts'),
(420, 'Can delete contacts', 140, 'delete_contacts'),
(421, 'Can add inward qty', 141, 'add_inwardqty'),
(422, 'Can change inward qty', 141, 'change_inwardqty'),
(423, 'Can delete inward qty', 141, 'delete_inwardqty'),
(424, 'Can add contract', 142, 'add_contract'),
(425, 'Can change contract', 142, 'change_contract'),
(426, 'Can delete contract', 142, 'delete_contract'),
(427, 'Can add purchase order', 143, 'add_purchaseorder'),
(428, 'Can change purchase order', 143, 'change_purchaseorder'),
(429, 'Can delete purchase order', 143, 'delete_purchaseorder'),
(430, 'Can add site bills', 144, 'add_sitebills'),
(431, 'Can change site bills', 144, 'change_sitebills'),
(432, 'Can delete site bills', 144, 'delete_sitebills'),
(433, 'Can add chat thread', 145, 'add_chatthread'),
(434, 'Can change chat thread', 145, 'change_chatthread'),
(435, 'Can delete chat thread', 145, 'delete_chatthread'),
(436, 'Can add tour plan', 146, 'add_tourplan'),
(437, 'Can change tour plan', 146, 'change_tourplan'),
(438, 'Can delete tour plan', 146, 'delete_tourplan'),
(439, 'Can add tour plan stop indent', 147, 'add_tourplanstopindent'),
(440, 'Can change tour plan stop indent', 147, 'change_tourplanstopindent'),
(441, 'Can delete tour plan stop indent', 147, 'delete_tourplanstopindent'),
(442, 'Can add customer session', 148, 'add_customersession'),
(443, 'Can change customer session', 148, 'change_customersession'),
(444, 'Can delete customer session', 148, 'delete_customersession'),
(445, 'Can add deal', 149, 'add_deal'),
(446, 'Can change deal', 149, 'change_deal'),
(447, 'Can delete deal', 149, 'delete_deal'),
(448, 'Can add schedule', 150, 'add_schedule'),
(449, 'Can change schedule', 150, 'change_schedule'),
(450, 'Can delete schedule', 150, 'delete_schedule'),
(451, 'Can add inward', 151, 'add_inward'),
(452, 'Can change inward', 151, 'change_inward'),
(453, 'Can delete inward', 151, 'delete_inward'),
(454, 'Can add spare request', 152, 'add_sparerequest'),
(455, 'Can change spare request', 152, 'change_sparerequest'),
(456, 'Can delete spare request', 152, 'delete_sparerequest'),
(457, 'Can add deal payments term', 153, 'add_dealpaymentsterm'),
(458, 'Can change deal payments term', 153, 'change_dealpaymentsterm'),
(459, 'Can delete deal payments term', 153, 'delete_dealpaymentsterm'),
(460, 'Can add campaign', 154, 'add_campaign'),
(461, 'Can change campaign', 154, 'change_campaign'),
(462, 'Can delete campaign', 154, 'delete_campaign'),
(463, 'Can add site', 155, 'add_site'),
(464, 'Can change site', 155, 'change_site'),
(465, 'Can delete site', 155, 'delete_site'),
(466, 'Can add site advance', 156, 'add_siteadvance'),
(467, 'Can change site advance', 156, 'change_siteadvance'),
(468, 'Can delete site advance', 156, 'delete_siteadvance'),
(469, 'Can add contract tracker', 157, 'add_contracttracker'),
(470, 'Can change contract tracker', 157, 'change_contracttracker'),
(471, 'Can delete contract tracker', 157, 'delete_contracttracker'),
(472, 'Can add engineer site expense', 158, 'add_engineersiteexpense'),
(473, 'Can change engineer site expense', 158, 'change_engineersiteexpense'),
(474, 'Can delete engineer site expense', 158, 'delete_engineersiteexpense'),
(475, 'Can add purchase qty', 159, 'add_purchaseqty'),
(476, 'Can change purchase qty', 159, 'change_purchaseqty'),
(477, 'Can delete purchase qty', 159, 'delete_purchaseqty'),
(478, 'Can add deal requirement', 160, 'add_dealrequirement'),
(479, 'Can change deal requirement', 160, 'change_dealrequirement'),
(480, 'Can delete deal requirement', 160, 'delete_dealrequirement'),
(481, 'Can add tour plan stop', 161, 'add_tourplanstop'),
(482, 'Can change tour plan stop', 161, 'change_tourplanstop'),
(483, 'Can delete tour plan stop', 161, 'delete_tourplanstop'),
(484, 'Can add activity', 162, 'add_activity'),
(485, 'Can change activity', 162, 'change_activity'),
(486, 'Can delete activity', 162, 'delete_activity'),
(487, 'Can add user assets', 163, 'add_userassets'),
(488, 'Can change user assets', 163, 'change_userassets'),
(489, 'Can delete user assets', 163, 'delete_userassets'),
(490, 'Can add legal agreement terms', 164, 'add_legalagreementterms'),
(491, 'Can change legal agreement terms', 164, 'change_legalagreementterms'),
(492, 'Can delete legal agreement terms', 164, 'delete_legalagreementterms'),
(493, 'Can add ticket log', 165, 'add_ticketlog'),
(494, 'Can change ticket log', 165, 'change_ticketlog'),
(495, 'Can delete ticket log', 165, 'delete_ticketlog'),
(496, 'Can add dc', 166, 'add_dc'),
(497, 'Can change dc', 166, 'change_dc'),
(498, 'Can delete dc', 166, 'delete_dc'),
(499, 'Can add products', 167, 'add_products'),
(500, 'Can change products', 167, 'change_products'),
(501, 'Can delete products', 167, 'delete_products'),
(502, 'Can add site engineer attendance', 168, 'add_siteengineerattendance'),
(503, 'Can change site engineer attendance', 168, 'change_siteengineerattendance'),
(504, 'Can delete site engineer attendance', 168, 'delete_siteengineerattendance'),
(505, 'Can add tag', 169, 'add_tag'),
(506, 'Can change tag', 169, 'change_tag'),
(507, 'Can delete tag', 169, 'delete_tag'),
(508, 'Can add proforma', 170, 'add_proforma'),
(509, 'Can change proforma', 170, 'change_proforma'),
(510, 'Can delete proforma', 170, 'delete_proforma'),
(511, 'Can add dc qty map', 171, 'add_dcqtymap'),
(512, 'Can change dc qty map', 171, 'change_dcqtymap'),
(513, 'Can delete dc qty map', 171, 'delete_dcqtymap'),
(514, 'Can add agreement', 172, 'add_agreement'),
(515, 'Can change agreement', 172, 'change_agreement'),
(516, 'Can delete agreement', 172, 'delete_agreement'),
(517, 'Can add PayPal IPN', 173, 'add_paypalipn'),
(518, 'Can change PayPal IPN', 173, 'change_paypalipn'),
(519, 'Can delete PayPal IPN', 173, 'delete_paypalipn'),
(520, 'Can add u ielement template', 174, 'add_uielementtemplate'),
(521, 'Can change u ielement template', 174, 'change_uielementtemplate'),
(522, 'Can delete u ielement template', 174, 'delete_uielementtemplate'),
(523, 'Can add components', 175, 'add_components'),
(524, 'Can change components', 175, 'change_components'),
(525, 'Can delete components', 175, 'delete_components'),
(526, 'Can add page', 176, 'add_page'),
(527, 'Can change page', 176, 'change_page'),
(528, 'Can delete page', 176, 'delete_page'),
(529, 'Can add post', 177, 'add_post'),
(530, 'Can change post', 177, 'change_post'),
(531, 'Can delete post', 177, 'delete_post'),
(532, 'Can add social', 178, 'add_social'),
(533, 'Can change social', 178, 'change_social'),
(534, 'Can delete social', 178, 'delete_social'),
(535, 'Can add like', 179, 'add_like'),
(536, 'Can change like', 179, 'change_like'),
(537, 'Can delete like', 179, 'delete_like'),
(538, 'Can add follow', 180, 'add_follow'),
(539, 'Can change follow', 180, 'change_follow'),
(540, 'Can delete follow', 180, 'delete_follow'),
(541, 'Can add album', 181, 'add_album'),
(542, 'Can change album', 181, 'change_album'),
(543, 'Can delete album', 181, 'delete_album'),
(544, 'Can add skill', 182, 'add_skill'),
(545, 'Can change skill', 182, 'change_skill'),
(546, 'Can delete skill', 182, 'delete_skill'),
(547, 'Can add post history', 183, 'add_posthistory'),
(548, 'Can change post history', 183, 'change_posthistory'),
(549, 'Can delete post history', 183, 'delete_posthistory'),
(550, 'Can add post follower', 184, 'add_postfollower'),
(551, 'Can change post follower', 184, 'change_postfollower'),
(552, 'Can delete post follower', 184, 'delete_postfollower'),
(553, 'Can add picture', 185, 'add_picture'),
(554, 'Can change picture', 185, 'change_picture'),
(555, 'Can delete picture', 185, 'delete_picture'),
(556, 'Can add publications', 186, 'add_publications'),
(557, 'Can change publications', 186, 'change_publications'),
(558, 'Can delete publications', 186, 'delete_publications'),
(559, 'Can add comment', 187, 'add_comment'),
(560, 'Can change comment', 187, 'change_comment'),
(561, 'Can delete comment', 187, 'delete_comment'),
(562, 'Can add post comment', 188, 'add_postcomment'),
(563, 'Can change post comment', 188, 'change_postcomment'),
(564, 'Can delete post comment', 188, 'delete_postcomment'),
(565, 'Can add comment like', 189, 'add_commentlike'),
(566, 'Can change comment like', 189, 'change_commentlike'),
(567, 'Can delete comment like', 189, 'delete_commentlike'),
(568, 'Can add picture like', 190, 'add_picturelike'),
(569, 'Can change picture like', 190, 'change_picturelike'),
(570, 'Can delete picture like', 190, 'delete_picturelike'),
(571, 'Can add album follower', 191, 'add_albumfollower'),
(572, 'Can change album follower', 191, 'change_albumfollower'),
(573, 'Can delete album follower', 191, 'delete_albumfollower'),
(574, 'Can add post like', 192, 'add_postlike'),
(575, 'Can change post like', 192, 'change_postlike'),
(576, 'Can delete post like', 192, 'delete_postlike'),
(577, 'Can add picture comment', 193, 'add_picturecomment'),
(578, 'Can change picture comment', 193, 'change_picturecomment'),
(579, 'Can delete picture comment', 193, 'delete_picturecomment'),
(580, 'Can add proforma qtys', 194, 'add_proformaqtys'),
(581, 'Can change proforma qtys', 194, 'change_proformaqtys'),
(582, 'Can delete proforma qtys', 194, 'delete_proformaqtys'),
(583, 'Can add sales purchase order', 195, 'add_salespurchaseorder'),
(584, 'Can change sales purchase order', 195, 'change_salespurchaseorder'),
(585, 'Can delete sales purchase order', 195, 'delete_salespurchaseorder'),
(586, 'Can add salesqtys', 196, 'add_salesqtys'),
(587, 'Can change salesqtys', 196, 'change_salesqtys'),
(588, 'Can delete salesqtys', 196, 'delete_salesqtys');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(21, 'pbkdf2_sha256$36000$9HVZr5XVBd3z$qNOUITYoET9HxRVT13a9JMZ1BvWWUPOHlKDlyA2VoYY=', '2021-04-12 07:41:14.258600', 1, 'zigma', '', '', '123@gmail.com', 1, 1, '2021-04-12 07:35:34.809586'),
(23, '', NULL, 0, 'sak', '', '', '', 0, 1, '2021-04-12 07:39:33.737624');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clientRelationships_emailtemplate`
--

CREATE TABLE `clientRelationships_emailtemplate` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `title` varchar(300) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `template` longtext NOT NULL,
  `creator` tinyint(1) NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clientRelationships_emailtemplate_files`
--

CREATE TABLE `clientRelationships_emailtemplate_files` (
  `id` int NOT NULL,
  `emailtemplate_id` int NOT NULL,
  `files_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clientRelationships_files`
--

CREATE TABLE `clientRelationships_files` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `version` varchar(300) DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `filename` varchar(300) DEFAULT NULL,
  `rawFiles` varchar(100) DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clientRelationships_productmeta`
--

CREATE TABLE `clientRelationships_productmeta` (
  `id` int NOT NULL,
  `description` varchar(500) NOT NULL,
  `typ` varchar(5) NOT NULL,
  `code` int UNSIGNED NOT NULL,
  `taxRate` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clientRelationships_schedule`
--

CREATE TABLE `clientRelationships_schedule` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `slot` varchar(11) NOT NULL,
  `email` longtext,
  `typ` longtext NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clientRelationships_schedule_users`
--

CREATE TABLE `clientRelationships_schedule_users` (
  `id` int NOT NULL,
  `schedule_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clientRelationships_termsandconditions`
--

CREATE TABLE `clientRelationships_termsandconditions` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `body` longtext,
  `heading` longtext,
  `default` tinyint(1) NOT NULL,
  `division_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(9, 'account', 'emailaddress'),
(8, 'account', 'emailconfirmation'),
(1, 'admin', 'logentry'),
(119, 'assets', 'asset'),
(118, 'assets', 'assetaddon'),
(122, 'assets', 'contactproducts'),
(121, 'assets', 'indent'),
(117, 'assets', 'indentasset'),
(123, 'assets', 'indentqtymap'),
(120, 'assets', 'min'),
(4, 'auth', 'group'),
(2, 'auth', 'permission'),
(3, 'auth', 'user'),
(92, 'clientRelationships', 'emailtemplate'),
(90, 'clientRelationships', 'files'),
(93, 'clientRelationships', 'productmeta'),
(94, 'clientRelationships', 'schedule'),
(91, 'clientRelationships', 'termsandconditions'),
(5, 'contenttypes', 'contenttype'),
(95, 'employees', 'complaints'),
(96, 'employees', 'systemlog'),
(19, 'ERP', 'address'),
(24, 'ERP', 'apiusage'),
(18, 'ERP', 'application'),
(28, 'ERP', 'appsettingsfield'),
(15, 'ERP', 'bankloan'),
(22, 'ERP', 'device'),
(16, 'ERP', 'genericpincode'),
(25, 'ERP', 'grouppermission'),
(23, 'ERP', 'media'),
(17, 'ERP', 'menuitems'),
(27, 'ERP', 'module'),
(21, 'ERP', 'permission'),
(29, 'ERP', 'profile'),
(20, 'ERP', 'publicapikeys'),
(26, 'ERP', 'service'),
(74, 'finance', 'account'),
(75, 'finance', 'configuretermsandconditions'),
(85, 'finance', 'costcenter'),
(84, 'finance', 'expenseheading'),
(79, 'finance', 'expensesheet'),
(83, 'finance', 'inflow'),
(82, 'finance', 'inventory'),
(81, 'finance', 'inventorylog'),
(87, 'finance', 'invoice'),
(76, 'finance', 'outboundinvoice'),
(86, 'finance', 'outboundinvoiceqty'),
(73, 'finance', 'potermsandconditions'),
(78, 'finance', 'projectpettyexpense'),
(88, 'finance', 'purchaseorder'),
(89, 'finance', 'purchaseorderqty'),
(80, 'finance', 'transaction'),
(77, 'finance', 'vendorservice'),
(56, 'gitweb', 'codecomment'),
(55, 'gitweb', 'commitnotification'),
(59, 'gitweb', 'gitgroup'),
(57, 'gitweb', 'grouppermission'),
(60, 'gitweb', 'repo'),
(58, 'gitweb', 'repopermission'),
(42, 'HR', 'accountskey'),
(36, 'HR', 'appraisal'),
(31, 'HR', 'designation'),
(43, 'HR', 'designationlogs'),
(38, 'HR', 'document'),
(30, 'HR', 'documents'),
(37, 'HR', 'exemployeesession'),
(45, 'HR', 'exitmanagement'),
(33, 'HR', 'leave'),
(39, 'HR', 'payroll'),
(34, 'HR', 'payrolllogs'),
(40, 'HR', 'profile'),
(32, 'HR', 'rank'),
(35, 'HR', 'team'),
(41, 'HR', 'usertourtracker'),
(44, 'HR', 'vendorprofile'),
(173, 'ipn', 'paypalipn'),
(53, 'mail', 'mailattachment'),
(54, 'mail', 'proxyaccount'),
(127, 'marketing', 'abbquotation'),
(128, 'marketing', 'abbquotationqtys'),
(162, 'marketing', 'activity'),
(172, 'marketing', 'agreement'),
(154, 'marketing', 'campaign'),
(133, 'marketing', 'campaignitem'),
(132, 'marketing', 'campaignlogs'),
(124, 'marketing', 'campaigntracker'),
(145, 'marketing', 'chatthread'),
(137, 'marketing', 'checkin'),
(131, 'marketing', 'contact'),
(140, 'marketing', 'contacts'),
(142, 'marketing', 'contract'),
(157, 'marketing', 'contracttracker'),
(139, 'marketing', 'crmtermsandconditions'),
(148, 'marketing', 'customersession'),
(166, 'marketing', 'dc'),
(171, 'marketing', 'dcqtymap'),
(149, 'marketing', 'deal'),
(153, 'marketing', 'dealpaymentsterm'),
(160, 'marketing', 'dealrequirement'),
(135, 'marketing', 'discount'),
(158, 'marketing', 'engineersiteexpense'),
(130, 'marketing', 'im'),
(151, 'marketing', 'inward'),
(141, 'marketing', 'inwardqty'),
(134, 'marketing', 'legalagreement'),
(164, 'marketing', 'legalagreementterms'),
(138, 'marketing', 'log'),
(125, 'marketing', 'notification'),
(126, 'marketing', 'paymentreciepts'),
(129, 'marketing', 'productqtys'),
(167, 'marketing', 'products'),
(170, 'marketing', 'proforma'),
(194, 'marketing', 'proformaqtys'),
(143, 'marketing', 'purchaseorder'),
(159, 'marketing', 'purchaseqty'),
(195, 'marketing', 'salespurchaseorder'),
(196, 'marketing', 'salesqtys'),
(150, 'marketing', 'schedule'),
(155, 'marketing', 'site'),
(156, 'marketing', 'siteadvance'),
(144, 'marketing', 'sitebills'),
(168, 'marketing', 'siteengineerattendance'),
(136, 'marketing', 'siteexpenses'),
(152, 'marketing', 'sparerequest'),
(169, 'marketing', 'tag'),
(165, 'marketing', 'ticketlog'),
(146, 'marketing', 'tourplan'),
(161, 'marketing', 'tourplanstop'),
(147, 'marketing', 'tourplanstopindent'),
(163, 'marketing', 'userassets'),
(108, 'organization', 'companyholidays'),
(115, 'organization', 'departments'),
(109, 'organization', 'division'),
(112, 'organization', 'homechart'),
(113, 'organization', 'installedapp'),
(116, 'organization', 'responsibility'),
(110, 'organization', 'role'),
(114, 'organization', 'rolepermission'),
(111, 'organization', 'unit'),
(99, 'payroll', 'advances'),
(100, 'payroll', 'disbursal'),
(101, 'payroll', 'itdecaration'),
(98, 'payroll', 'monthlypayslip'),
(102, 'payroll', 'payrollreport'),
(97, 'payroll', 'payslip'),
(103, 'performance', 'feedback'),
(104, 'performance', 'timesheet'),
(46, 'PIM', 'calendar'),
(52, 'PIM', 'chatmessage'),
(49, 'PIM', 'notebook'),
(47, 'PIM', 'notification'),
(51, 'PIM', 'page'),
(50, 'PIM', 'settings'),
(48, 'PIM', 'theme'),
(68, 'projects', 'comment'),
(70, 'projects', 'issues'),
(66, 'projects', 'media'),
(69, 'projects', 'project'),
(72, 'projects', 'projectcomment'),
(67, 'projects', 'projectobjective'),
(71, 'projects', 'timelineitem'),
(106, 'recruitment', 'interview'),
(105, 'recruitment', 'jobapplication'),
(107, 'recruitment', 'jobs'),
(14, 'robots', 'rule'),
(13, 'robots', 'url'),
(6, 'sessions', 'session'),
(7, 'sites', 'site'),
(181, 'social', 'album'),
(191, 'social', 'albumfollower'),
(187, 'social', 'comment'),
(189, 'social', 'commentlike'),
(180, 'social', 'follow'),
(179, 'social', 'like'),
(185, 'social', 'picture'),
(193, 'social', 'picturecomment'),
(190, 'social', 'picturelike'),
(177, 'social', 'post'),
(188, 'social', 'postcomment'),
(184, 'social', 'postfollower'),
(183, 'social', 'posthistory'),
(192, 'social', 'postlike'),
(186, 'social', 'publications'),
(182, 'social', 'skill'),
(178, 'social', 'social'),
(10, 'socialaccount', 'socialaccount'),
(11, 'socialaccount', 'socialapp'),
(12, 'socialaccount', 'socialtoken'),
(63, 'taskBoard', 'media'),
(61, 'taskBoard', 'subtask'),
(65, 'taskBoard', 'task'),
(62, 'taskBoard', 'taskworkbook'),
(64, 'taskBoard', 'timelineitem'),
(175, 'website', 'components'),
(176, 'website', 'page'),
(174, 'website', 'uielementtemplate');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-03-13 08:02:46.538090'),
(2, 'contenttypes', '0002_remove_content_type_name', '2021-03-13 08:02:46.633292'),
(3, 'auth', '0001_initial', '2021-03-13 08:02:47.380246'),
(4, 'auth', '0002_alter_permission_name_max_length', '2021-03-13 08:02:47.426863'),
(5, 'auth', '0003_alter_user_email_max_length', '2021-03-13 08:02:47.455385'),
(6, 'auth', '0004_alter_user_username_opts', '2021-03-13 08:02:47.469804'),
(7, 'auth', '0005_alter_user_last_login_null', '2021-03-13 08:02:47.518669'),
(8, 'auth', '0006_require_contenttypes_0002', '2021-03-13 08:02:47.522599'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2021-03-13 08:02:47.539512'),
(10, 'auth', '0008_alter_user_username_max_length', '2021-03-13 08:02:47.564009'),
(11, 'ERP', '0001_initial', '2021-03-13 08:02:50.003312'),
(12, 'ERP', '0002_auto_20210313_0724', '2021-03-13 08:02:50.330191'),
(13, 'organization', '0001_initial', '2021-03-13 08:02:52.681136'),
(14, 'HR', '0001_initial', '2021-03-13 08:02:58.171962'),
(15, 'clientRelationships', '0001_initial', '2021-03-13 08:02:59.276216'),
(16, 'finance', '0001_initial', '2021-03-13 08:03:05.651654'),
(17, 'projects', '0001_initial', '2021-03-13 08:03:08.558718'),
(18, 'marketing', '0001_initial', '2021-03-13 08:03:31.921892'),
(19, 'PIM', '0001_initial', '2021-03-13 08:03:35.939342'),
(20, 'account', '0001_initial', '2021-03-13 08:03:37.023962'),
(21, 'account', '0002_email_max_length', '2021-03-13 08:03:37.983572'),
(22, 'admin', '0001_initial', '2021-03-13 08:03:38.318034'),
(23, 'admin', '0002_logentry_remove_auto_add', '2021-03-13 08:03:38.741318'),
(24, 'assets', '0001_initial', '2021-03-13 08:03:41.624342'),
(25, 'employees', '0001_initial', '2021-03-13 08:03:42.240569'),
(26, 'gitweb', '0001_initial', '2021-03-13 08:03:46.846998'),
(27, 'ipn', '0001_initial', '2021-03-13 08:03:47.173926'),
(28, 'ipn', '0002_paypalipn_mp_id', '2021-03-13 08:03:47.269202'),
(29, 'ipn', '0003_auto_20141117_1647', '2021-03-13 08:03:47.382440'),
(30, 'ipn', '0004_auto_20150612_1826', '2021-03-13 08:03:48.148293'),
(31, 'ipn', '0005_auto_20151217_0948', '2021-03-13 08:03:48.286995'),
(32, 'ipn', '0006_auto_20160108_1112', '2021-03-13 08:03:48.406259'),
(33, 'ipn', '0007_auto_20160219_1135', '2021-03-13 08:03:48.590193'),
(34, 'ipn', '0008_auto_20181128_1032', '2021-03-13 08:03:48.639889'),
(35, 'mail', '0001_initial', '2021-03-13 08:03:49.265013'),
(36, 'mail', '0002_proxyaccount_email', '2021-03-13 08:03:49.680502'),
(37, 'mail', '0003_mailattachment_contractid', '2021-03-13 08:03:49.934144'),
(38, 'mail', '0004_proxyaccount_displayname', '2021-03-13 08:03:50.359945'),
(39, 'mail', '0005_proxyaccount_signature', '2021-03-13 08:03:50.639185'),
(40, 'payroll', '0001_initial', '2021-03-13 08:03:54.312677'),
(41, 'performance', '0001_initial', '2021-03-13 08:03:55.687383'),
(42, 'recruitment', '0001_initial', '2021-03-13 08:03:57.750881'),
(43, 'sites', '0001_initial', '2021-03-13 08:03:57.837009'),
(44, 'robots', '0001_initial', '2021-03-13 08:03:58.590476'),
(45, 'sessions', '0001_initial', '2021-03-13 08:03:58.670241'),
(46, 'sites', '0002_alter_domain_unique', '2021-03-13 08:03:58.709261'),
(47, 'socialaccount', '0001_initial', '2021-03-13 08:04:00.973577'),
(48, 'socialaccount', '0002_token_max_lengths', '2021-03-13 08:04:02.915753'),
(49, 'taskBoard', '0001_initial', '2021-03-13 08:04:06.252316'),
(50, 'website', '0001_initial', '2021-03-13 08:04:06.459772'),
(51, 'website', '0002_auto_20201028_0731', '2021-03-13 08:04:06.599100'),
(52, 'website', '0003_uielementtemplate', '2021-03-13 08:04:06.636006'),
(53, 'website', '0004_components_template', '2021-03-13 08:04:06.676796'),
(54, 'website', '0005_auto_20201029_1029', '2021-03-13 08:04:06.699048'),
(55, 'website', '0006_auto_20201029_1050', '2021-03-13 08:04:06.719850'),
(56, 'website', '0007_page_ogimage', '2021-03-13 08:04:06.760353'),
(57, 'social', '0001_initial', '2021-03-13 09:01:28.368420'),
(58, 'marketing', '0002_auto_20210315_1412', '2021-03-15 14:12:34.997384'),
(59, 'marketing', '0002_auto_20210316_0448', '2021-03-16 11:15:56.462301'),
(60, 'marketing', '0003_auto_20210316_0459', '2021-03-16 11:15:56.593682'),
(61, 'marketing', '0004_merge_20210316_1115', '2021-03-16 11:15:56.611596'),
(62, 'marketing', '0005_products_product_returndate', '2021-03-16 11:16:13.641563'),
(63, 'marketing', '0004_merge_20210316_0547', '2021-03-18 05:25:06.662816'),
(64, 'marketing', '0005_auto_20210316_1155', '2021-03-18 05:25:06.864914'),
(65, 'marketing', '0006_contact_company_title', '2021-03-18 05:25:07.387887'),
(66, 'marketing', '0007_merge_20210318_0524', '2021-03-18 05:25:07.403192'),
(67, 'HR', '0002_auto_20210317_1147', '2021-03-19 05:10:16.120262'),
(68, 'marketing', '0007_auto_20210317_0433', '2021-03-19 05:10:16.392866'),
(69, 'marketing', '0008_merge_20210317_0708', '2021-03-19 05:10:16.407232'),
(70, 'marketing', '0009_auto_20210317_1220', '2021-03-19 05:10:16.536531'),
(71, 'marketing', '0010_merge_20210319_0510', '2021-03-19 05:10:16.550971'),
(72, 'marketing', '0011_siteexpenses_reason', '2021-03-19 08:21:19.429877'),
(73, 'HR', '0003_auto_20210319_1034', '2021-03-19 10:34:45.507900'),
(74, 'HR', '0003_auto_20210319_1112', '2021-03-22 05:26:21.708804'),
(75, 'HR', '0004_merge_20210322_0526', '2021-03-22 05:26:21.727697'),
(76, 'marketing', '0010_auto_20210319_1018', '2021-03-22 05:26:21.795902'),
(77, 'marketing', '0011_siteadvance_engineer', '2021-03-22 05:26:22.170576'),
(78, 'marketing', '0012_merge_20210322_0526', '2021-03-22 05:26:22.181554'),
(79, 'HR', '0004_merge_20210322_0403', '2021-03-22 06:17:11.955421'),
(80, 'HR', '0005_merge_20210322_0617', '2021-03-22 06:17:11.971985'),
(81, 'marketing', '0012_merge_20210322_0403', '2021-03-22 06:17:42.095704'),
(82, 'marketing', '0013_merge_20210322_0617', '2021-03-22 06:17:42.106502'),
(83, 'HR', '0005_merge_20210323_0407', '2021-03-23 10:28:28.228237'),
(84, 'HR', '0006_merge_20210323_1028', '2021-03-23 10:28:28.239183'),
(85, 'marketing', '0013_merge_20210323_0407', '2021-03-23 10:28:58.178295'),
(86, 'marketing', '0014_merge_20210323_1028', '2021-03-23 10:28:58.190802'),
(87, 'marketing', '0015_sitebills_site', '2021-03-24 04:21:07.345716'),
(88, 'marketing', '0016_auto_20210324_0851', '2021-03-24 08:51:18.561440'),
(89, 'HR', '0005_merge_20210322_1133', '2021-03-24 14:10:51.038618'),
(90, 'HR', '0007_merge_20210324_1410', '2021-03-24 14:10:51.057319'),
(91, 'marketing', '0013_merge_20210322_1133', '2021-03-24 14:11:26.239572'),
(92, 'marketing', '0014_auto_20210322_1216', '2021-03-24 14:11:27.014846'),
(93, 'marketing', '0017_merge_20210324_1410', '2021-03-24 14:11:27.030702'),
(94, 'HR', '0007_merge_20210324_1356', '2021-03-24 14:16:51.195997'),
(95, 'HR', '0008_merge_20210324_1416', '2021-03-24 14:16:51.210781'),
(96, 'marketing', '0015_merge_20210324_1357', '2021-03-24 14:17:23.253930'),
(97, 'marketing', '0016_auto_20210324_1357', '2021-03-24 14:17:24.124892'),
(98, 'marketing', '0017_auto_20210324_1400', '2021-03-24 14:17:24.605711'),
(99, 'marketing', '0018_merge_20210324_1416', '2021-03-24 14:17:24.632774'),
(100, 'HR', '0009_auto_20210325_0539', '2021-03-25 05:39:32.113629'),
(101, 'marketing', '0019_tourplanstop_billdoc', '2021-03-25 06:43:01.910784'),
(102, 'marketing', '0020_tourplanstop_fsrdoc', '2021-03-25 06:59:21.479383'),
(103, 'marketing', '0021_engineersiteexpense_status', '2021-03-29 07:05:22.686947'),
(104, 'marketing', '0019_tourplanstop_amc_product', '2021-03-29 13:06:32.084917'),
(105, 'marketing', '0021_merge_20210326_0844', '2021-03-29 13:06:32.093313'),
(106, 'marketing', '0022_auto_20210326_1042', '2021-03-29 13:06:32.407420'),
(107, 'marketing', '0023_auto_20210326_1124', '2021-03-29 13:06:33.187820'),
(108, 'marketing', '0024_auto_20210326_1354', '2021-03-29 13:06:33.467314'),
(109, 'marketing', '0025_auto_20210326_1420', '2021-03-29 13:06:33.770143'),
(110, 'marketing', '0026_auto_20210327_0849', '2021-03-29 13:06:34.004667'),
(111, 'marketing', '0021_auto_20210327_0642', '2021-03-29 13:06:34.409682'),
(112, 'marketing', '0022_auto_20210327_0644', '2021-03-29 13:06:35.016589'),
(113, 'marketing', '0027_merge_20210329_0559', '2021-03-29 13:06:35.024550'),
(114, 'marketing', '0028_auto_20210329_1103', '2021-03-29 13:06:36.110464'),
(115, 'marketing', '0029_merge_20210329_1306', '2021-03-29 13:06:36.394925'),
(116, 'marketing', '0029_checkin_dccreated', '2021-03-30 04:44:27.950266'),
(117, 'marketing', '0027_merge_20210329_0406', '2021-03-30 04:44:27.968953'),
(118, 'marketing', '0030_merge_20210330_0432', '2021-03-30 04:44:27.989849'),
(119, 'marketing', '0030_merge_20210330_0528', '2021-03-30 05:57:24.408689'),
(120, 'marketing', '0031_merge_20210330_0541', '2021-03-30 05:57:24.415439'),
(121, 'marketing', '0032_auto_20210330_1124', '2021-03-30 11:24:35.630968'),
(122, 'marketing', '0032_auto_20210330_1108', '2021-03-30 14:30:38.180300'),
(123, 'marketing', '0033_merge_20210330_1430', '2021-03-30 14:30:38.194642');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1wl1is9jhzduz6vsr96bzzooh7mzgoqc', 'ZWZhMGUyOTczOGExNWRmMTE1NGEwNzkzMDZlNDk0NGEzYmJmN2RhNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzM2U1ZDc2ZGM2NWUzMWNhMzQ4NTgxYjIxODJhNDk2YmE2YTRiY2IiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2021-04-08 06:21:28.498938'),
('4j4ymiatkutzkjgv2prg2ag4m4mpt8ji', 'OWMwODJiOGZlODU3MDE4MTYyZGNhMThkMzQ0MzNiZTczNWZiNmFkNTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI1Y2Y1NmE2MWVjMGMxYTE4NDc0MmJiYWQ4OTM2NTliOGJlM2E1YmUiLCJfYXV0aF91c2VyX2lkIjoiMTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==', '2021-04-09 05:41:00.406794'),
('4no5iqzp3gdcoeekqpt26et66tmhmfb7', 'ZjI2M2Q2NDUxNWIyNjBmOGE3NDdkNzVkNDYyNGIwMTZmM2ExOGJjNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImUzYmQ2ZDhlNDcyZTgyZWM5ZDgzMDBmMTg5MzQ5MzJmZTM3N2M1MTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTgifQ==', '2021-04-13 07:10:25.624966'),
('4qvsmfrbakt7toe02d959cogprqlce98', 'NTgyOTc1NzIwNjhkMDQ4MDg3MTgxYzVkMzUxZDRmNTdiN2EwOTZhNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjUxMTI1ZGUxNWMyM2M1OGY5MmZjNjM3YmVkZmQwNjk4YjBiNDRiOTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2021-04-26 06:18:13.663678'),
('4yhpbwfqpr6a672ami28y4seeri7g1pa', 'ZjkyZTlmN2NiZDYyNzA3NDk5NzkwZGVjN2E1YTY3MDIwZmZmMWM0OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjM3YjUzYjdmYTdmMTQzMzJkNzBjYTg0YzQwMTMyNTA0MmFmMzE5Y2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2021-04-01 05:24:18.118880'),
('5g7wrpnh0rx9cjxf1vvao6500g5vinip', 'MTIxN2E1ZTE5MTI4MzM1NDZiZmQ4YmE3OTcxNGYxNzY2YmE1YTg2YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiZWJhNWFkZjVhMTA5ZDc5Y2VhMWQ2NzczYmI1OTUxZjE0YTFiMTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2021-03-27 08:51:15.342100'),
('6e332w0cqcwiidc2mecpzbd177q3s2as', 'ZjkyZTlmN2NiZDYyNzA3NDk5NzkwZGVjN2E1YTY3MDIwZmZmMWM0OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjM3YjUzYjdmYTdmMTQzMzJkNzBjYTg0YzQwMTMyNTA0MmFmMzE5Y2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2021-04-01 11:32:30.110620'),
('6jlt3bsz7oftixnazemvokh7i8d0mfh4', 'NzRhYWZiN2E0NDcwODhiNDJlNTliYWQxZDFmZGFjMzRiNzQyZWIwOTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI1Y2Y1NmE2MWVjMGMxYTE4NDc0MmJiYWQ4OTM2NTliOGJlM2E1YmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTcifQ==', '2021-04-05 06:43:34.307244'),
('7wdk11x0yk3h1gakg9ogrylykz197wyl', 'ZjkyZTlmN2NiZDYyNzA3NDk5NzkwZGVjN2E1YTY3MDIwZmZmMWM0OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjM3YjUzYjdmYTdmMTQzMzJkNzBjYTg0YzQwMTMyNTA0MmFmMzE5Y2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2021-04-02 05:37:46.030336'),
('afa0cff544veezunsj5elblt02csgpec', 'ZWZhMGUyOTczOGExNWRmMTE1NGEwNzkzMDZlNDk0NGEzYmJmN2RhNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzM2U1ZDc2ZGM2NWUzMWNhMzQ4NTgxYjIxODJhNDk2YmE2YTRiY2IiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2021-04-08 13:20:02.216402'),
('bfrmx9fiia1w4vupc2x5852iz4hmvh0s', 'MTIxN2E1ZTE5MTI4MzM1NDZiZmQ4YmE3OTcxNGYxNzY2YmE1YTg2YTp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiZWJhNWFkZjVhMTA5ZDc5Y2VhMWQ2NzczYmI1OTUxZjE0YTFiMTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2021-03-27 11:02:05.629778'),
('chsni9rqpmbygxmjheut3iq6pxht0tq6', 'YWJlNGQzOWE5NzNjMTJkNzMwMTkzMmMzYTM2NjM3OThkM2I1OTE5Mzp7Il9hdXRoX3VzZXJfaGFzaCI6ImZmNDY0MmViMmI1M2UzMDdhMzZlNjJhMzljMDJmNGFjYWU4MDcyZDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyMSJ9', '2021-04-26 07:41:14.349436'),
('i1l6mvo7czb6ydf6h59h0sz72w6bj982', 'ZjhhY2Y5NTMxMmY1NjU1MTFhZmIwODcyODA0ZTU1MmUxNTUyODZlYzp7Il9hdXRoX3VzZXJfaGFzaCI6ImUzYmQ2ZDhlNDcyZTgyZWM5ZDgzMDBmMTg5MzQ5MzJmZTM3N2M1MTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxOCJ9', '2021-04-08 06:51:26.631034'),
('i2fjt2ni8r3pn2sq4egjkmgbe5k8lbbl', 'ZjkyZTlmN2NiZDYyNzA3NDk5NzkwZGVjN2E1YTY3MDIwZmZmMWM0OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjM3YjUzYjdmYTdmMTQzMzJkNzBjYTg0YzQwMTMyNTA0MmFmMzE5Y2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2021-04-02 13:58:24.045466'),
('it1g89yr8xknz6thek0djwvneb5jeb7e', 'ZjkyZTlmN2NiZDYyNzA3NDk5NzkwZGVjN2E1YTY3MDIwZmZmMWM0OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjM3YjUzYjdmYTdmMTQzMzJkNzBjYTg0YzQwMTMyNTA0MmFmMzE5Y2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2021-03-30 08:40:45.523223'),
('mrpigajlqxyts46mkgy9mtx4s26d7at6', 'ZWZhMGUyOTczOGExNWRmMTE1NGEwNzkzMDZlNDk0NGEzYmJmN2RhNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzM2U1ZDc2ZGM2NWUzMWNhMzQ4NTgxYjIxODJhNDk2YmE2YTRiY2IiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2021-04-12 06:37:46.696721'),
('mxjldvatjvjrs9k4tvp66idzz69vsq7a', 'NTgyOTc1NzIwNjhkMDQ4MDg3MTgxYzVkMzUxZDRmNTdiN2EwOTZhNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjUxMTI1ZGUxNWMyM2M1OGY5MmZjNjM3YmVkZmQwNjk4YjBiNDRiOTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2021-04-26 06:32:07.904081'),
('ne4wlcz1ko4ysc6nl99vrzu26trotfgg', 'OWMwODJiOGZlODU3MDE4MTYyZGNhMThkMzQ0MzNiZTczNWZiNmFkNTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI1Y2Y1NmE2MWVjMGMxYTE4NDc0MmJiYWQ4OTM2NTliOGJlM2E1YmUiLCJfYXV0aF91c2VyX2lkIjoiMTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQifQ==', '2021-04-12 07:41:44.747086'),
('opcbifupcalnhhv6vbohb6xqlukszps1', 'ZjI2M2Q2NDUxNWIyNjBmOGE3NDdkNzVkNDYyNGIwMTZmM2ExOGJjNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImUzYmQ2ZDhlNDcyZTgyZWM5ZDgzMDBmMTg5MzQ5MzJmZTM3N2M1MTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTgifQ==', '2021-04-09 04:51:38.731399'),
('qol23k1ubwyuykbcpuagcfls30i7mxmu', 'ZjkyZTlmN2NiZDYyNzA3NDk5NzkwZGVjN2E1YTY3MDIwZmZmMWM0OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjM3YjUzYjdmYTdmMTQzMzJkNzBjYTg0YzQwMTMyNTA0MmFmMzE5Y2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2021-03-29 05:39:54.397299'),
('sdma145989yqyfqpo1b839nvec6dznz4', 'ZjkyZTlmN2NiZDYyNzA3NDk5NzkwZGVjN2E1YTY3MDIwZmZmMWM0OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjM3YjUzYjdmYTdmMTQzMzJkNzBjYTg0YzQwMTMyNTA0MmFmMzE5Y2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2021-04-01 13:55:47.263182'),
('stwbscsmvnp9bx8as984qg0tgg0rprkq', 'ZjI2M2Q2NDUxNWIyNjBmOGE3NDdkNzVkNDYyNGIwMTZmM2ExOGJjNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImUzYmQ2ZDhlNDcyZTgyZWM5ZDgzMDBmMTg5MzQ5MzJmZTM3N2M1MTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTgifQ==', '2021-04-09 13:29:15.933735'),
('wgx0mvf5cyd234pvj4ywe333r5i1f46p', 'ZWZhMGUyOTczOGExNWRmMTE1NGEwNzkzMDZlNDk0NGEzYmJmN2RhNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQzM2U1ZDc2ZGM2NWUzMWNhMzQ4NTgxYjIxODJhNDk2YmE2YTRiY2IiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2021-04-12 07:27:41.805571'),
('zk2i0sufp5ctlco2051xtziwjqn4st97', 'NzRhYWZiN2E0NDcwODhiNDJlNTliYWQxZDFmZGFjMzRiNzQyZWIwOTp7Il9hdXRoX3VzZXJfaGFzaCI6ImI1Y2Y1NmE2MWVjMGMxYTE4NDc0MmJiYWQ4OTM2NTliOGJlM2E1YmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMTcifQ==', '2021-04-09 11:11:45.377442'),
('zvpfk31sifby27zjnzg6yyfvqykgfu8s', 'ZjkyZTlmN2NiZDYyNzA3NDk5NzkwZGVjN2E1YTY3MDIwZmZmMWM0OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjM3YjUzYjdmYTdmMTQzMzJkNzBjYTg0YzQwMTMyNTA0MmFmMzE5Y2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2021-04-01 13:52:10.030775');

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

CREATE TABLE `django_site` (
  `id` int NOT NULL,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Table structure for table `employees_complaints`
--

CREATE TABLE `employees_complaints` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `txt` longtext,
  `status` varchar(10) DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employees_systemlog`
--

CREATE TABLE `employees_systemlog` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `timeInSec` int UNSIGNED NOT NULL,
  `app` varchar(300) DEFAULT NULL,
  `dated` date DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ERP_address`
--

CREATE TABLE `ERP_address` (
  `id` int NOT NULL,
  `street` varchar(300) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `pincode` int UNSIGNED DEFAULT NULL,
  `lat` varchar(15) DEFAULT NULL,
  `lon` varchar(15) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ERP_address`
--

INSERT INTO `ERP_address` (`id`, `street`, `city`, `state`, `pincode`, `lat`, `lon`, `country`) VALUES
(1, 'bangalore', '', '', 560100, NULL, NULL, ''),
(2, 'Nalanda', '', '', 803111, NULL, NULL, ''),
(3, 'awefawef', '', '', 234342, NULL, NULL, ''),
(4, 'afwaewefa', '', '', 560002, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `ERP_apiusage`
--

CREATE TABLE `ERP_apiusage` (
  `id` int NOT NULL,
  `count` int UNSIGNED NOT NULL,
  `month` int UNSIGNED NOT NULL,
  `api_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ERP_application`
--

CREATE TABLE `ERP_application` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `icon` varchar(200) DEFAULT NULL,
  `haveCss` tinyint(1) NOT NULL,
  `haveJs` tinyint(1) NOT NULL,
  `inMenu` tinyint(1) NOT NULL,
  `description` varchar(500) NOT NULL,
  `displayName` varchar(30) DEFAULT NULL,
  `stateAlias` varchar(30) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `index` int UNSIGNED NOT NULL,
  `module_id` int NOT NULL,
  `parent_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ERP_application`
--

INSERT INTO `ERP_application` (`id`, `created`, `name`, `icon`, `haveCss`, `haveJs`, `inMenu`, `description`, `displayName`, `stateAlias`, `url`, `index`, `module_id`, `parent_id`) VALUES
(7, '2016-01-03 00:44:00.000000', 'app.users', 'fa-search', 1, 1, 1, 'Search users, initiate IM and access their social profile', 'Search', NULL, NULL, 100, 2, NULL),
(70, '2017-08-30 14:38:35.716000', 'app.contacts', '/static/icons/crm.png', 0, 1, 1, 'contacts', 'Sales', NULL, NULL, 1, 3, NULL),
(122, '2018-02-07 03:39:21.414337', 'app.inventory', 'https://ga0.imgix.net/logo/o/102457-1567081787-8034208?auto=format&amp;ch=Width%2CDPR&amp;dpr=2.63&amp;ixjsv=2.0.0&amp;ixlib=rb-1.0.0&amp;q=38&amp;w=90', 0, 1, 1, 'assets', 'Inventory', NULL, NULL, 6, 3, NULL),
(162, '2020-04-01 00:00:00.000000', 'app.geoLocation', 'https://i.pinimg.com/originals/d4/c8/a6/d4c8a6b00b9acec6d76a3617f3756a77.png', 0, 1, 1, 'geoloaction', 'Geo Tracking', NULL, NULL, 5, 11, NULL),
(177, '2018-02-06 10:21:54.989144', 'app.abb', '/static/images/icons8-organization-96.png', 0, 1, 1, 'ABB', 'ABB', NULL, NULL, 7, 3, NULL),
(178, '2018-02-06 10:21:54.989144', 'app.tickets', '/static/images/icons8-maintenance-date-50.png', 0, 1, 1, 'Tickets', 'Tickets', NULL, NULL, 3, 3, NULL),
(179, '2021-01-23 10:21:54.989144', 'app.service', '/static/icons/Servicing.png', 0, 1, 1, 'Service', 'Service', NULL, NULL, 2, 3, NULL),
(180, '2021-01-23 10:21:54.989144', 'app.notification', 'https://www.freeiconspng.com/thumbs/bell-icons/bell-icon-16.png', 0, 1, 1, 'Notification', 'Notification', NULL, NULL, 8, 3, NULL),
(183, '2021-01-23 10:21:54.989144', 'app.newOrganization', 'static/images/icons8-team-128.png', 0, 1, 1, 'Organization', 'Organization', NULL, NULL, 10, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ERP_appsettingsfield`
--

CREATE TABLE `ERP_appsettingsfield` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `flag` tinyint(1) NOT NULL,
  `value` varchar(5000) DEFAULT NULL,
  `description` varchar(500) NOT NULL,
  `fieldType` varchar(5) NOT NULL,
  `app_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ERP_bankloan`
--

CREATE TABLE `ERP_bankloan` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `applicantName` varchar(250) NOT NULL,
  `mobile` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `pan` varchar(250) NOT NULL,
  `photo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ERP_device`
--

CREATE TABLE `ERP_device` (
  `id` int NOT NULL,
  `sshKey` varchar(500) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ERP_genericpincode`
--

CREATE TABLE `ERP_genericpincode` (
  `id` int NOT NULL,
  `state` varchar(35) DEFAULT NULL,
  `city` varchar(35) DEFAULT NULL,
  `country` varchar(35) NOT NULL,
  `pincode` varchar(7) DEFAULT NULL,
  `pin_status` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ERP_grouppermission`
--

CREATE TABLE `ERP_grouppermission` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `app_id` int NOT NULL,
  `givenBy_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ERP_media`
--

CREATE TABLE `ERP_media` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `link` longtext,
  `attachment` varchar(100) DEFAULT NULL,
  `mediaType` varchar(10) NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ERP_menuitems`
--

CREATE TABLE `ERP_menuitems` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `name` varchar(250) NOT NULL,
  `icon` varchar(250) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `jsFileName` varchar(200) DEFAULT NULL,
  `parent_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ERP_menuitems`
--

INSERT INTO `ERP_menuitems` (`id`, `created`, `name`, `icon`, `state`, `jsFileName`, `parent_id`) VALUES
(2, '2021-01-21 00:00:00.000000', 'Dashboard', NULL, 'businessManagement.abb.dashboard', NULL, 177),
(3, '2021-01-21 00:00:00.000000', 'Site Details', NULL, 'businessManagement.abb.sitedetails', NULL, 177),
(4, '2021-01-21 00:00:00.000000', 'Engineers', NULL, 'businessManagement.abb.engineers', NULL, 177),
(5, '2021-01-21 00:00:00.000000', 'Site Expenditure Approval', NULL, 'businessManagement.abb.siteEA', NULL, 177),
(6, '2021-01-21 00:00:00.000000', 'Engineer Ledger', NULL, 'businessManagement.abb.engineerledger', NULL, 177),
(7, '2021-01-21 00:00:00.000000', 'Proforma', NULL, 'businessManagement.abb.proforma', NULL, 177),
(8, '2021-01-21 00:00:00.000000', 'Dashboard', NULL, 'businessManagement.contacts.dashboard', NULL, 70),
(9, '2021-01-21 00:00:00.000000', 'AMC', NULL, 'businessManagement.contacts.amc', NULL, 70),
(10, '2021-01-21 00:00:00.000000', 'New Sales', NULL, 'businessManagement.contacts.newsales', NULL, 70),
(11, '2021-01-21 00:00:00.000000', 'Rentals', NULL, 'businessManagement.contacts.rental', NULL, 70),
(12, '2021-01-21 00:00:00.000000', 'Refurbished Sales', NULL, 'businessManagement.contacts.refurbishsales', NULL, 70),
(13, '2021-01-21 00:00:00.000000', 'Repair', NULL, 'businessManagement.contacts.repair', NULL, 70),
(14, '2021-01-21 00:00:00.000000', 'Inventory', NULL, 'businessManagement.service.inventory', NULL, 179),
(15, '2021-01-21 00:00:00.000000', 'Engineers', NULL, 'businessManagement.service.engineers', NULL, 179),
(16, '2021-01-21 00:00:00.000000', 'Spare Inventory', NULL, 'businessManagement.service.spareInventory', NULL, 179),
(17, '2021-01-21 00:00:00.000000', 'QC', NULL, 'businessManagement.service.qc', NULL, 179),
(18, '2021-01-21 00:00:00.000000', 'Settings', NULL, 'businessManagement.newOrganization.settings', NULL, 183),
(19, '2021-01-21 00:00:00.000000', 'Employees', NULL, 'businessManagement.newOrganization.employees', NULL, 183),
(20, '2021-01-21 00:00:00.000000', 'OOW Cash Charges', NULL, 'businessManagement.contacts.oow', NULL, 70),
(21, '2021-01-21 00:00:00.000000', 'Dashboard', NULL, 'businessManagement.service.dashboard', NULL, 179);

-- --------------------------------------------------------

--
-- Table structure for table `ERP_module`
--

CREATE TABLE `ERP_module` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  `icon` varchar(20) DEFAULT NULL,
  `haveCss` tinyint(1) NOT NULL,
  `haveJs` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ERP_module`
--

INSERT INTO `ERP_module` (`id`, `created`, `name`, `description`, `icon`, `haveCss`, `haveJs`) VALUES
(1, '2016-01-03 00:44:00.000000', 'home', 'Home module can be considered as the lending page of the platform consisting dashboard , PIM and social apps', 'fa-home', 1, 1),
(2, '2016-01-03 00:44:00.000000', 'admin', 'Administration can be performed from the apps of this module.', 'fa-user', 1, 1),
(3, '2016-01-07 00:44:00.000000', 'businessManagement', 'Access business management modules. Manage processes, process orders and track expanses and earnings', 'fa-industry', 1, 1),
(4, '2016-01-07 00:44:00.000000', 'public', 'public sites', 'fa-rocket', 1, 1),
(10, '2016-03-20 10:00:05.000000', 'projectManagement', '', 'fa-wrench', 1, 1),
(11, '2018-02-06 03:34:21.318000', 'workforceManagement', '', 'fa-users', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ERP_permission`
--

CREATE TABLE `ERP_permission` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `app_id` int NOT NULL,
  `givenBy_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ERP_profile`
--

CREATE TABLE `ERP_profile` (
  `id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ERP_profile_devices`
--

CREATE TABLE `ERP_profile_devices` (
  `id` int NOT NULL,
  `profile_id` int NOT NULL,
  `device_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ERP_publicapikeys`
--

CREATE TABLE `ERP_publicapikeys` (
  `id` int NOT NULL,
  `active` tinyint(1) NOT NULL,
  `key` varchar(30) NOT NULL,
  `created` datetime(6) NOT NULL,
  `usageRemaining` int UNSIGNED NOT NULL,
  `admin_id` int NOT NULL,
  `app_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ERP_service`
--

CREATE TABLE `ERP_service` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `about` longtext,
  `cin` varchar(100) DEFAULT NULL,
  `tin` varchar(100) DEFAULT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `web` longtext,
  `vendor` tinyint(1) NOT NULL,
  `inUseBy` varchar(20) NOT NULL,
  `bankName` varchar(100) DEFAULT NULL,
  `accountNumber` int UNSIGNED DEFAULT NULL,
  `ifscCode` varchar(100) DEFAULT NULL,
  `paymentTerm` int UNSIGNED DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `contactPerson_id` int DEFAULT NULL,
  `doc_id` int DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `finance_account`
--

CREATE TABLE `finance_account` (
  `id` int NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `number` bigint DEFAULT NULL,
  `ifsc` varchar(15) DEFAULT NULL,
  `bank` varchar(50) DEFAULT NULL,
  `bankAddress` longtext,
  `personal` tinyint(1) NOT NULL,
  `balance` double NOT NULL,
  `is_lock` tinyint(1) NOT NULL,
  `heading` varchar(20) NOT NULL,
  `group` varchar(100) DEFAULT NULL,
  `contactPerson_id` int DEFAULT NULL,
  `division_id` int DEFAULT NULL,
  `unit_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `finance_account_authorizedSignaturies`
--

CREATE TABLE `finance_account_authorizedSignaturies` (
  `id` int NOT NULL,
  `account_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `finance_configuretermsandconditions`
--

CREATE TABLE `finance_configuretermsandconditions` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `body` longtext,
  `heading` longtext,
  `default` tinyint(1) NOT NULL,
  `division_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `finance_costcenter`
--

CREATE TABLE `finance_costcenter` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(50) NOT NULL,
  `created` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `account_id` int NOT NULL,
  `division_id` int DEFAULT NULL,
  `head_id` int NOT NULL,
  `unit_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `finance_expenseheading`
--

CREATE TABLE `finance_expenseheading` (
  `id` int NOT NULL,
  `title` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `finance_expensesheet`
--

CREATE TABLE `finance_expensesheet` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `approved` varchar(5) NOT NULL,
  `stage` varchar(20) NOT NULL,
  `approvalMatrix` smallint UNSIGNED NOT NULL,
  `approvalStage` smallint UNSIGNED NOT NULL,
  `dispensed` tinyint(1) NOT NULL,
  `notes` varchar(30) DEFAULT NULL,
  `submitted` tinyint(1) NOT NULL,
  `totalDisbursed` double NOT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `division_id` int DEFAULT NULL,
  `transaction_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `finance_inflow`
--

CREATE TABLE `finance_inflow` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `amount` int UNSIGNED NOT NULL,
  `referenceID` varchar(30) NOT NULL,
  `currency` varchar(5) NOT NULL,
  `dated` date NOT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `description` longtext NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `fromBank` varchar(30) DEFAULT NULL,
  `chequeNo` varchar(30) DEFAULT NULL,
  `mode` varchar(20) NOT NULL,
  `gstCollected` double NOT NULL,
  `division_id` int DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  `toAcc_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `finance_inventory`
--

CREATE TABLE `finance_inventory` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `value` varchar(100) NOT NULL,
  `qtyAdded` varchar(100) NOT NULL,
  `rate` double NOT NULL,
  `refurnished` varchar(100) NOT NULL,
  `refurnishedAdded` varchar(100) NOT NULL,
  `sellable` tinyint(1) NOT NULL,
  `img1` varchar(100) DEFAULT NULL,
  `img2` varchar(100) DEFAULT NULL,
  `img3` varchar(100) DEFAULT NULL,
  `description` longtext,
  `category` longtext,
  `richtxtDesc` longtext,
  `sku` varchar(100) DEFAULT NULL,
  `buyingPrice` double NOT NULL,
  `division_id` int DEFAULT NULL,
  `productMeta_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `finance_inventorylog`
--

CREATE TABLE `finance_inventorylog` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `value` varchar(100) NOT NULL,
  `refurnished` varchar(100) NOT NULL,
  `division_id` int DEFAULT NULL,
  `inventory_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `finance_invoice`
--

CREATE TABLE `finance_invoice` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `code` varchar(200) DEFAULT NULL,
  `amount` int UNSIGNED NOT NULL,
  `currency` varchar(5) DEFAULT NULL,
  `dated` date DEFAULT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `description` longtext NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `dispensed` tinyint(1) NOT NULL,
  `gstVal` int UNSIGNED DEFAULT NULL,
  `gstIN` varchar(50) DEFAULT NULL,
  `invNo` varchar(30) DEFAULT NULL,
  `invoiceAmount` int UNSIGNED NOT NULL,
  `division_id` int DEFAULT NULL,
  `sheet_id` int DEFAULT NULL,
  `transaction_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `finance_outboundinvoice`
--

CREATE TABLE `finance_outboundinvoice` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `status` varchar(30) NOT NULL,
  `isInvoice` tinyint(1) NOT NULL,
  `received` tinyint(1) NOT NULL,
  `cancelled` tinyint(1) NOT NULL,
  `cancelledDate` date DEFAULT NULL,
  `receivedDate` date DEFAULT NULL,
  `poNumber` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `personName` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` longtext,
  `pincode` varchar(10) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `pin_status` varchar(2) NOT NULL,
  `deliveryDate` date DEFAULT NULL,
  `payDueDate` date DEFAULT NULL,
  `gstIn` varchar(30) DEFAULT NULL,
  `recDate` date DEFAULT NULL,
  `total` double NOT NULL,
  `totalGST` double NOT NULL,
  `paidAmount` double NOT NULL,
  `balanceAmount` double NOT NULL,
  `isCash` varchar(30) NOT NULL,
  `paymentImage` varchar(100) DEFAULT NULL,
  `paymentRef` varchar(100) DEFAULT NULL,
  `terms` longtext,
  `serviceFor` varchar(100) DEFAULT NULL,
  `isPerforma` tinyint(1) NOT NULL,
  `account_id` int DEFAULT NULL,
  `bussinessunit_id` int DEFAULT NULL,
  `costcenter_id` int DEFAULT NULL,
  `division_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `termsandcondition_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `finance_outboundinvoiceqty`
--

CREATE TABLE `finance_outboundinvoiceqty` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `product` varchar(100) DEFAULT NULL,
  `qty` int UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `tax` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `asset` varchar(100) DEFAULT NULL,
  `addon` varchar(100) DEFAULT NULL,
  `division_id` int DEFAULT NULL,
  `hsn_id` int DEFAULT NULL,
  `outBound_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `finance_potermsandconditions`
--

CREATE TABLE `finance_potermsandconditions` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `title` varchar(300) NOT NULL,
  `version` varchar(300) DEFAULT NULL,
  `body` longtext,
  `heading` longtext,
  `division_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `finance_projectpettyexpense`
--

CREATE TABLE `finance_projectpettyexpense` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `amount` int UNSIGNED NOT NULL,
  `description` longtext,
  `attachment` varchar(100) DEFAULT NULL,
  `balance` double NOT NULL,
  `creditAmount` double NOT NULL,
  `account_id` int DEFAULT NULL,
  `costCenter_id` int DEFAULT NULL,
  `createdUser_id` int DEFAULT NULL,
  `division_id` int DEFAULT NULL,
  `heading_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `finance_purchaseorder`
--

CREATE TABLE `finance_purchaseorder` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `status` varchar(30) NOT NULL,
  `isInvoice` tinyint(1) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `personName` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` longtext,
  `pincode` varchar(10) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `pin_status` varchar(2) NOT NULL,
  `poNumber` varchar(30) DEFAULT NULL,
  `quoteNumber` varchar(30) DEFAULT NULL,
  `quoteDate` date DEFAULT NULL,
  `deliveryDate` date DEFAULT NULL,
  `paymentDueDate` date DEFAULT NULL,
  `gstIn` varchar(30) DEFAULT NULL,
  `terms` longtext,
  `invoiceTerms` longtext,
  `accNo` varchar(30) DEFAULT NULL,
  `ifsc` varchar(30) DEFAULT NULL,
  `bankName` varchar(30) DEFAULT NULL,
  `invNo` varchar(50) DEFAULT NULL,
  `totalAmount` double NOT NULL,
  `balanceAmount` double NOT NULL,
  `paidAmount` double NOT NULL,
  `note` longtext,
  `account_id` int DEFAULT NULL,
  `bussinessunit_id` int DEFAULT NULL,
  `costcenter_id` int DEFAULT NULL,
  `division_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `requester_id` int DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  `termsandcondition_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `finance_purchaseorderqty`
--

CREATE TABLE `finance_purchaseorderqty` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `product` varchar(100) DEFAULT NULL,
  `qty` int UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `hsn` varchar(100) DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `receivedQty` int UNSIGNED NOT NULL,
  `division_id` int DEFAULT NULL,
  `productMeta_id` int DEFAULT NULL,
  `purchaseorder_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `finance_transaction`
--

CREATE TABLE `finance_transaction` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `dated` date DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `narration` longtext,
  `account` varchar(100) DEFAULT NULL,
  `ifsc` varchar(100) DEFAULT NULL,
  `bankName` varchar(100) DEFAULT NULL,
  `groupId` varchar(100) DEFAULT NULL,
  `debit` double NOT NULL,
  `credit` double NOT NULL,
  `balance` double NOT NULL,
  `externalRecord` tinyint(1) NOT NULL,
  `externalReferenceID` varchar(500) DEFAULT NULL,
  `externalConfirmationID` varchar(30) DEFAULT NULL,
  `api` varchar(20) DEFAULT NULL,
  `apiCallParams` varchar(1500) DEFAULT NULL,
  `division_id` int DEFAULT NULL,
  `fromAcc_id` int DEFAULT NULL,
  `outBound_id` int DEFAULT NULL,
  `toAcc_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `finance_vendorservice`
--

CREATE TABLE `finance_vendorservice` (
  `id` int NOT NULL,
  `particular` varchar(100) NOT NULL,
  `rate` int UNSIGNED DEFAULT NULL,
  `division_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gitweb_codecomment`
--

CREATE TABLE `gitweb_codecomment` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `sha` varchar(50) NOT NULL,
  `text` varchar(1500) NOT NULL,
  `path` varchar(250) NOT NULL,
  `line` int UNSIGNED NOT NULL,
  `repo_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gitweb_commitnotification`
--

CREATE TABLE `gitweb_commitnotification` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `sha` varchar(50) NOT NULL,
  `message` varchar(500) NOT NULL,
  `branch` varchar(100) NOT NULL,
  `time` datetime(6) NOT NULL,
  `repo_id` int NOT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gitweb_gitgroup`
--

CREATE TABLE `gitweb_gitgroup` (
  `id` int NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gitweb_gitgroup_users`
--

CREATE TABLE `gitweb_gitgroup_users` (
  `id` int NOT NULL,
  `gitgroup_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gitweb_grouppermission`
--

CREATE TABLE `gitweb_grouppermission` (
  `id` int NOT NULL,
  `canRead` tinyint(1) NOT NULL,
  `canWrite` tinyint(1) NOT NULL,
  `canDelete` tinyint(1) NOT NULL,
  `limited` tinyint(1) NOT NULL,
  `group_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gitweb_repo`
--

CREATE TABLE `gitweb_repo` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  `lastNotified` datetime(6) NOT NULL,
  `creator_id` int NOT NULL,
  `project_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gitweb_repopermission`
--

CREATE TABLE `gitweb_repopermission` (
  `id` int NOT NULL,
  `canRead` tinyint(1) NOT NULL,
  `canWrite` tinyint(1) NOT NULL,
  `canDelete` tinyint(1) NOT NULL,
  `limited` tinyint(1) NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gitweb_repo_groups`
--

CREATE TABLE `gitweb_repo_groups` (
  `id` int NOT NULL,
  `repo_id` int NOT NULL,
  `grouppermission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gitweb_repo_perms`
--

CREATE TABLE `gitweb_repo_perms` (
  `id` int NOT NULL,
  `repo_id` int NOT NULL,
  `repopermission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `HR_accountskey`
--

CREATE TABLE `HR_accountskey` (
  `id` int NOT NULL,
  `activation_key` varchar(40) NOT NULL,
  `key_expires` datetime(6) NOT NULL,
  `keyType` varchar(6) NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `HR_appraisal`
--

CREATE TABLE `HR_appraisal` (
  `id` int NOT NULL,
  `created` date NOT NULL,
  `userCmt` longtext,
  `userAmount` int UNSIGNED DEFAULT NULL,
  `managerAmt` int UNSIGNED DEFAULT NULL,
  `managerCmt` longtext,
  `superManagerAmt` int UNSIGNED DEFAULT NULL,
  `superManagerCmt` longtext,
  `hrCmt` longtext,
  `finalAmount` int UNSIGNED DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `createdUser_id` int NOT NULL,
  `hr_id` int DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `superManager_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `HR_designation`
--

CREATE TABLE `HR_designation` (
  `id` int NOT NULL,
  `department_id` int DEFAULT NULL,
  `division_id` int DEFAULT NULL,
  `hrApprover_id` int DEFAULT NULL,
  `primaryApprover_id` int DEFAULT NULL,
  `reportingTo_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `secondaryApprover_id` int DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `unit_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `HR_designation`
--

INSERT INTO `HR_designation` (`id`, `department_id`, `division_id`, `hrApprover_id`, `primaryApprover_id`, `reportingTo_id`, `role_id`, `secondaryApprover_id`, `team_id`, `unit_id`, `user_id`) VALUES
(19, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21),
(20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23);

-- --------------------------------------------------------

--
-- Table structure for table `HR_designationlogs`
--

CREATE TABLE `HR_designationlogs` (
  `id` int NOT NULL,
  `created` date NOT NULL,
  `createdUser_id` int NOT NULL,
  `newDepartment_id` int DEFAULT NULL,
  `newDivision_id` int DEFAULT NULL,
  `newHrApprover_id` int DEFAULT NULL,
  `newPrimaryApprover_id` int DEFAULT NULL,
  `newReportingTo_id` int DEFAULT NULL,
  `newRole_id` int DEFAULT NULL,
  `newSecondaryApprover_id` int DEFAULT NULL,
  `newUnit_id` int DEFAULT NULL,
  `oldDepartment_id` int DEFAULT NULL,
  `oldDivision_id` int DEFAULT NULL,
  `oldHrApprover_id` int DEFAULT NULL,
  `oldPrimaryApprover_id` int DEFAULT NULL,
  `oldReportingTo_id` int DEFAULT NULL,
  `oldRole_id` int DEFAULT NULL,
  `oldSecondaryApprover_id` int DEFAULT NULL,
  `oldUnit_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `HR_document`
--

CREATE TABLE `HR_document` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `name` varchar(400) NOT NULL,
  `description` varchar(400) NOT NULL,
  `documentFile` varchar(100) DEFAULT NULL,
  `division_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `HR_documents`
--

CREATE TABLE `HR_documents` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `version` varchar(100) DEFAULT NULL,
  `description` longtext,
  `docFile` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `file_typ` varchar(250) NOT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `HR_exemployeesession`
--

CREATE TABLE `HR_exemployeesession` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `email` varchar(50) NOT NULL,
  `otp` varchar(5) DEFAULT NULL,
  `sessionId` varchar(35) DEFAULT NULL,
  `empProfile_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `HR_exitmanagement`
--

CREATE TABLE `HR_exitmanagement` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `security` tinyint(1) NOT NULL,
  `it` tinyint(1) NOT NULL,
  `hr` tinyint(1) NOT NULL,
  `finance` tinyint(1) NOT NULL,
  `started` tinyint(1) NOT NULL,
  `managersApproval` tinyint(1) NOT NULL,
  `superManagerApproval` tinyint(1) NOT NULL,
  `securityApprovedDate` datetime(6) DEFAULT NULL,
  `itApprovedDate` datetime(6) DEFAULT NULL,
  `hrApprovedDate` datetime(6) DEFAULT NULL,
  `financeApprovedDate` datetime(6) DEFAULT NULL,
  `managerApprovedDate` datetime(6) DEFAULT NULL,
  `superManagerApprovedDate` datetime(6) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `superManager_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `HR_leave`
--

CREATE TABLE `HR_leave` (
  `id` int NOT NULL,
  `created` date NOT NULL,
  `fromDate` date DEFAULT NULL,
  `toDate` date DEFAULT NULL,
  `days` int UNSIGNED DEFAULT NULL,
  `leavesCount` int UNSIGNED DEFAULT NULL,
  `approved` tinyint(1) NOT NULL,
  `category` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `comment` varchar(10000) DEFAULT NULL,
  `approvedStage` int UNSIGNED DEFAULT NULL,
  `approvedMatrix` int UNSIGNED DEFAULT NULL,
  `accounted` tinyint(1) NOT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `HR_leave_approvedBy`
--

CREATE TABLE `HR_leave_approvedBy` (
  `id` int NOT NULL,
  `leave_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `HR_payroll`
--

CREATE TABLE `HR_payroll` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` date NOT NULL,
  `hra` int UNSIGNED DEFAULT NULL,
  `special` int UNSIGNED DEFAULT NULL,
  `lta` int UNSIGNED DEFAULT NULL,
  `basic` int UNSIGNED DEFAULT NULL,
  `PFUan` varchar(50) DEFAULT NULL,
  `pan` varchar(30) DEFAULT NULL,
  `taxSlab` int UNSIGNED NOT NULL,
  `adHoc` int UNSIGNED DEFAULT NULL,
  `policyNumber` varchar(50) DEFAULT NULL,
  `provider` varchar(30) DEFAULT NULL,
  `amount` int UNSIGNED DEFAULT NULL,
  `noticePeriodRecovery` tinyint(1) NOT NULL,
  `al` int UNSIGNED DEFAULT NULL,
  `ml` int UNSIGNED DEFAULT NULL,
  `adHocLeaves` int UNSIGNED DEFAULT NULL,
  `joiningDate` date DEFAULT NULL,
  `off` tinyint(1) NOT NULL,
  `accountNumber` varchar(40) DEFAULT NULL,
  `ifscCode` varchar(30) DEFAULT NULL,
  `bankName` varchar(30) DEFAULT NULL,
  `deboarded` tinyint(1) NOT NULL,
  `lastWorkingDate` date DEFAULT NULL,
  `alHold` int UNSIGNED NOT NULL,
  `mlHold` int UNSIGNED NOT NULL,
  `adHocLeavesHold` int UNSIGNED NOT NULL,
  `notice` int UNSIGNED DEFAULT NULL,
  `probation` int UNSIGNED DEFAULT NULL,
  `probationNotice` int UNSIGNED DEFAULT NULL,
  `pfAccNo` varchar(20) DEFAULT NULL,
  `pfUniNo` varchar(200) DEFAULT NULL,
  `pfAmnt` int UNSIGNED DEFAULT NULL,
  `esic` varchar(20) DEFAULT NULL,
  `esicAmount` double NOT NULL,
  `pTax` double NOT NULL,
  `bonus` double NOT NULL,
  `pfAdmin` double NOT NULL,
  `esicAdmin` double NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `HR_payroll`
--

INSERT INTO `HR_payroll` (`id`, `created`, `updated`, `hra`, `special`, `lta`, `basic`, `PFUan`, `pan`, `taxSlab`, `adHoc`, `policyNumber`, `provider`, `amount`, `noticePeriodRecovery`, `al`, `ml`, `adHocLeaves`, `joiningDate`, `off`, `accountNumber`, `ifscCode`, `bankName`, `deboarded`, `lastWorkingDate`, `alHold`, `mlHold`, `adHocLeavesHold`, `notice`, `probation`, `probationNotice`, `pfAccNo`, `pfUniNo`, `pfAmnt`, `esic`, `esicAmount`, `pTax`, `bonus`, `pfAdmin`, `esicAdmin`, `user_id`) VALUES
(35, '2021-04-12 07:36:17.803941', '2021-04-12', NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 21),
(36, '2021-04-12 07:41:24.096742', '2021-04-12', NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 23);

-- --------------------------------------------------------

--
-- Table structure for table `HR_payrolllogs`
--

CREATE TABLE `HR_payrolllogs` (
  `id` int NOT NULL,
  `created` date NOT NULL,
  `oldHra` int UNSIGNED DEFAULT NULL,
  `newHra` int UNSIGNED DEFAULT NULL,
  `oldspecial` int UNSIGNED DEFAULT NULL,
  `newspecial` int UNSIGNED DEFAULT NULL,
  `oldLta` int UNSIGNED DEFAULT NULL,
  `newLta` int UNSIGNED DEFAULT NULL,
  `oldBasic` int UNSIGNED DEFAULT NULL,
  `newBasic` int UNSIGNED DEFAULT NULL,
  `oldtaxSlab` int UNSIGNED DEFAULT NULL,
  `newtaxSlab` int UNSIGNED DEFAULT NULL,
  `oldadHoc` int UNSIGNED DEFAULT NULL,
  `newadHoc` int UNSIGNED DEFAULT NULL,
  `oldAl` int UNSIGNED DEFAULT NULL,
  `newAl` int UNSIGNED DEFAULT NULL,
  `oldml` int UNSIGNED DEFAULT NULL,
  `newml` int UNSIGNED DEFAULT NULL,
  `oldadHocLeav` int UNSIGNED DEFAULT NULL,
  `newadHocLeav` int UNSIGNED DEFAULT NULL,
  `oldpfAmount` int UNSIGNED DEFAULT NULL,
  `newpfAmount` int UNSIGNED DEFAULT NULL,
  `createdUser_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `HR_profile`
--

CREATE TABLE `HR_profile` (
  `id` int NOT NULL,
  `empID` int UNSIGNED DEFAULT NULL,
  `empType` varchar(250) NOT NULL,
  `displayPicture` varchar(100) NOT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `anivarsary` date DEFAULT NULL,
  `married` tinyint(1) NOT NULL,
  `permanentAddressStreet` longtext,
  `permanentAddressCity` varchar(15) DEFAULT NULL,
  `permanentAddressPin` int DEFAULT NULL,
  `permanentAddressState` varchar(20) DEFAULT NULL,
  `permanentAddressCountry` varchar(20) DEFAULT NULL,
  `sameAsLocal` tinyint(1) NOT NULL,
  `localAddressStreet` longtext,
  `localAddressCity` varchar(15) DEFAULT NULL,
  `localAddressPin` int DEFAULT NULL,
  `localAddressState` varchar(20) DEFAULT NULL,
  `localAddressCountry` varchar(20) DEFAULT NULL,
  `prefix` varchar(4) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(14) DEFAULT NULL,
  `emergency` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `sign` varchar(100) DEFAULT NULL,
  `IDPhoto` varchar(100) DEFAULT NULL,
  `TNCandBond` varchar(100) DEFAULT NULL,
  `resume` varchar(100) DEFAULT NULL,
  `certificates` varchar(100) DEFAULT NULL,
  `transcripts` varchar(100) DEFAULT NULL,
  `otherDocs` varchar(100) DEFAULT NULL,
  `resignation` varchar(100) DEFAULT NULL,
  `vehicleRegistration` varchar(100) DEFAULT NULL,
  `appointmentAcceptance` varchar(100) DEFAULT NULL,
  `pan` varchar(100) DEFAULT NULL,
  `drivingLicense` varchar(100) DEFAULT NULL,
  `cheque` varchar(100) DEFAULT NULL,
  `passbook` varchar(100) DEFAULT NULL,
  `bloodGroup` varchar(20) DEFAULT NULL,
  `almaMater` varchar(100) DEFAULT NULL,
  `pgUniversity` varchar(100) DEFAULT NULL,
  `docUniversity` varchar(100) DEFAULT NULL,
  `fathersName` varchar(100) DEFAULT NULL,
  `mothersName` varchar(100) DEFAULT NULL,
  `wifesName` varchar(100) DEFAULT NULL,
  `childCSV` varchar(100) DEFAULT NULL,
  `note1` longtext,
  `note2` longtext,
  `note3` longtext,
  `lat` double NOT NULL,
  `lon` double NOT NULL,
  `last_updated` datetime(6) NOT NULL,
  `location_track` tinyint(1) NOT NULL,
  `job_type` varchar(20) NOT NULL,
  `battery_level` double NOT NULL,
  `expoPushToken` varchar(300) DEFAULT NULL,
  `linkToken` varchar(300) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `nextlat` double NOT NULL,
  `nextlng` double NOT NULL,
  `sipUserName` varchar(100) DEFAULT NULL,
  `sipExtension` varchar(100) DEFAULT NULL,
  `sipPassword` varchar(100) DEFAULT NULL,
  `isDashboard` tinyint(1) NOT NULL,
  `isManager` tinyint(1) NOT NULL,
  `adhar` varchar(100) DEFAULT NULL,
  `onboarding` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  `abbPolicy` varchar(100) DEFAULT NULL,
  `insurance` varchar(100) DEFAULT NULL,
  `offerLetter` varchar(100) DEFAULT NULL,
  `zigmaPolicy` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `HR_profile`
--

INSERT INTO `HR_profile` (`id`, `empID`, `empType`, `displayPicture`, `dateOfBirth`, `anivarsary`, `married`, `permanentAddressStreet`, `permanentAddressCity`, `permanentAddressPin`, `permanentAddressState`, `permanentAddressCountry`, `sameAsLocal`, `localAddressStreet`, `localAddressCity`, `localAddressPin`, `localAddressState`, `localAddressCountry`, `prefix`, `gender`, `email`, `mobile`, `emergency`, `website`, `sign`, `IDPhoto`, `TNCandBond`, `resume`, `certificates`, `transcripts`, `otherDocs`, `resignation`, `vehicleRegistration`, `appointmentAcceptance`, `pan`, `drivingLicense`, `cheque`, `passbook`, `bloodGroup`, `almaMater`, `pgUniversity`, `docUniversity`, `fathersName`, `mothersName`, `wifesName`, `childCSV`, `note1`, `note2`, `note3`, `lat`, `lon`, `last_updated`, `location_track`, `job_type`, `battery_level`, `expoPushToken`, `linkToken`, `contact`, `nextlat`, `nextlng`, `sipUserName`, `sipExtension`, `sipPassword`, `isDashboard`, `isManager`, `adhar`, `onboarding`, `user_id`, `abbPolicy`, `insurance`, `offerLetter`, `zigmaPolicy`) VALUES
(19, NULL, 'full time', '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'NA', 'M', '', NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2021-04-12 07:36:16.209775', 0, 'Others', 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 21, '', '', '', ''),
(20, NULL, 'full time', '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'NA', 'M', '', NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2021-04-12 07:41:23.956497', 0, 'Others', 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, NULL, 0, 23, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `HR_rank`
--

CREATE TABLE `HR_rank` (
  `id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `HR_team`
--

CREATE TABLE `HR_team` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `title` varchar(100) NOT NULL,
  `manager_id` int DEFAULT NULL,
  `unit_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `HR_usertourtracker`
--

CREATE TABLE `HR_usertourtracker` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `HR_vendorprofile`
--

CREATE TABLE `HR_vendorprofile` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `contactPerson` varchar(100) NOT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `contentDocs` varchar(100) DEFAULT NULL,
  `bankName` varchar(100) DEFAULT NULL,
  `accountNumber` varchar(100) DEFAULT NULL,
  `ifscCode` varchar(100) DEFAULT NULL,
  `accountName` varchar(100) DEFAULT NULL,
  `companyName` varchar(100) DEFAULT NULL,
  `gst` varchar(100) DEFAULT NULL,
  `pan` varchar(100) DEFAULT NULL,
  `pincode` varchar(6) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `street` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mail_mailattachment`
--

CREATE TABLE `mail_mailattachment` (
  `id` int NOT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `contractid` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mail_proxyaccount`
--

CREATE TABLE `mail_proxyaccount` (
  `id` int NOT NULL,
  `passKey` varchar(100) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` date NOT NULL,
  `user_id` int NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `displayName` varchar(100) DEFAULT NULL,
  `signature` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_abbquotation`
--

CREATE TABLE `marketing_abbquotation` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `date` date DEFAULT NULL,
  `vailidUntil` date DEFAULT NULL,
  `quote` varchar(200) DEFAULT NULL,
  `customerID` varchar(200) DEFAULT NULL,
  `customerInfo` longtext,
  `subject` longtext,
  `discount` double NOT NULL,
  `gst` double NOT NULL,
  `totalTax` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_abbquotationqtys`
--

CREATE TABLE `marketing_abbquotationqtys` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `type` varchar(200) DEFAULT NULL,
  `subject` longtext,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_abbquotation_qtys`
--

CREATE TABLE `marketing_abbquotation_qtys` (
  `id` int NOT NULL,
  `abbquotation_id` int NOT NULL,
  `abbquotationqtys_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_activity`
--

CREATE TABLE `marketing_activity` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `typ` varchar(11) NOT NULL,
  `data` varchar(300) NOT NULL,
  `notes` longtext,
  `doc` varchar(100) DEFAULT NULL,
  `contact_id` int DEFAULT NULL,
  `deal_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_activity_contacts`
--

CREATE TABLE `marketing_activity_contacts` (
  `id` int NOT NULL,
  `activity_id` int NOT NULL,
  `contact_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_activity_internalUsers`
--

CREATE TABLE `marketing_activity_internalUsers` (
  `id` int NOT NULL,
  `activity_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_agreement`
--

CREATE TABLE `marketing_agreement` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `selectDate` date DEFAULT NULL,
  `expiryDate` date DEFAULT NULL,
  `divisionType` varchar(100) NOT NULL,
  `workNature` varchar(100) NOT NULL,
  `attachment` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_agreement_engineers`
--

CREATE TABLE `marketing_agreement_engineers` (
  `id` int NOT NULL,
  `agreement_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_campaign`
--

CREATE TABLE `marketing_campaign` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `status` varchar(15) NOT NULL,
  `typ` varchar(10) DEFAULT NULL,
  `msgBody` varchar(1000) DEFAULT NULL,
  `emailSubject` varchar(1000) DEFAULT NULL,
  `emailBody` varchar(10000) DEFAULT NULL,
  `directions` varchar(10000) DEFAULT NULL,
  `emailTemplate` varchar(100) DEFAULT NULL,
  `limitPerDay` double NOT NULL,
  `followUpText1` longtext,
  `followUpText2` longtext,
  `followUpText3` longtext,
  `followUpText4` longtext,
  `isSales` tinyint(1) NOT NULL,
  `isHigh` tinyint(1) NOT NULL,
  `lead_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `team_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_campaignitem`
--

CREATE TABLE `marketing_campaignitem` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `status` varchar(100) NOT NULL,
  `attempted` tinyint(1) NOT NULL,
  `attempt` double NOT NULL,
  `followUp` tinyint(1) NOT NULL,
  `followUpDate` datetime(6) DEFAULT NULL,
  `skipped` tinyint(1) NOT NULL,
  `emailed` tinyint(1) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `openedTime` datetime(6) DEFAULT NULL,
  `key` varchar(100) DEFAULT NULL,
  `read` tinyint(1) NOT NULL,
  `slot` varchar(10) DEFAULT NULL,
  `context` longtext,
  `subject1` varchar(300) DEFAULT NULL,
  `body1` longtext,
  `subject2` varchar(300) DEFAULT NULL,
  `body2` longtext,
  `subject3` varchar(300) DEFAULT NULL,
  `body3` longtext,
  `subject4` varchar(300) DEFAULT NULL,
  `body4` longtext,
  `subject5` varchar(300) DEFAULT NULL,
  `body5` longtext,
  `level` varchar(100) DEFAULT NULL,
  `campaign_id` int DEFAULT NULL,
  `contact_id` int DEFAULT NULL,
  `owner_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_campaignlogs`
--

CREATE TABLE `marketing_campaignlogs` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `followupDate` datetime(6) DEFAULT NULL,
  `data` varchar(1000) DEFAULT NULL,
  `typ` varchar(20) DEFAULT NULL,
  `recording` varchar(100) DEFAULT NULL,
  `recording2` varchar(100) DEFAULT NULL,
  `campaign_id` int DEFAULT NULL,
  `contact_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_campaigntracker`
--

CREATE TABLE `marketing_campaigntracker` (
  `id` int NOT NULL,
  `campaignId` varchar(10) DEFAULT NULL,
  `read` tinyint(1) NOT NULL,
  `open` tinyint(1) NOT NULL,
  `sent` tinyint(1) NOT NULL,
  `to` varchar(100) DEFAULT NULL,
  `slot` varchar(10) DEFAULT NULL,
  `template` longtext,
  `context` longtext,
  `name` varchar(10) DEFAULT NULL,
  `subject` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_campaign_participants`
--

CREATE TABLE `marketing_campaign_participants` (
  `id` int NOT NULL,
  `campaign_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_chatthread`
--

CREATE TABLE `marketing_chatthread` (
  `id` int NOT NULL,
  `uid` longtext,
  `created` datetime(6) NOT NULL,
  `channel` varchar(10) DEFAULT NULL,
  `closed` tinyint(1) NOT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `location` longtext,
  `transferred` tinyint(1) NOT NULL,
  `fid` varchar(50) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_checkin`
--

CREATE TABLE `marketing_checkin` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `productType` varchar(30) DEFAULT NULL,
  `categoryType` varchar(30) DEFAULT NULL,
  `departmentType` varchar(30) DEFAULT NULL,
  `caseNo` varchar(200) DEFAULT NULL,
  `productMake` varchar(200) DEFAULT NULL,
  `productModel` varchar(200) DEFAULT NULL,
  `vdc` varchar(200) DEFAULT NULL,
  `rating` varchar(200) DEFAULT NULL,
  `qualityType` varchar(30) DEFAULT NULL,
  `serialNo` varchar(200) DEFAULT NULL,
  `isTRC` tinyint(1) NOT NULL,
  `type` varchar(30) NOT NULL,
  `qty` int UNSIGNED DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `partNo` varchar(50) DEFAULT NULL,
  `price` double NOT NULL,
  `invoiceNumber` varchar(50) DEFAULT NULL,
  `isIssued` tinyint(1) NOT NULL,
  `contact_id` int DEFAULT NULL,
  `inwardQty_id` int DEFAULT NULL,
  `unit_id` int DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  `dcCreated` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_contact`
--

CREATE TABLE `marketing_contact` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `emailSecondary` varchar(60) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `mobileSecondary` varchar(12) DEFAULT NULL,
  `designation` varchar(30) DEFAULT NULL,
  `notes` longtext,
  `linkedin` varchar(100) DEFAULT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `dp` varchar(100) DEFAULT NULL,
  `male` tinyint(1) NOT NULL,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `isGst` tinyint(1) NOT NULL,
  `started` date DEFAULT NULL,
  `ended` date DEFAULT NULL,
  `contactType` varchar(250) NOT NULL,
  `zone` varchar(250) NOT NULL,
  `sla` varchar(100) DEFAULT NULL,
  `isCustomer` tinyint(1) NOT NULL,
  `company_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `unit_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `company_title` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_contacts`
--

CREATE TABLE `marketing_contacts` (
  `id` int NOT NULL,
  `created` date NOT NULL,
  `updated` datetime(6) NOT NULL,
  `referenceId` varchar(20) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `source` varchar(20) DEFAULT NULL,
  `notes` longtext,
  `pinCode` varchar(10) DEFAULT NULL,
  `subscribe` tinyint(1) NOT NULL,
  `addrs` longtext,
  `companyName` longtext,
  `directNumber` varchar(20) DEFAULT NULL,
  `altNumber` varchar(20) DEFAULT NULL,
  `altNumber2` varchar(20) DEFAULT NULL,
  `website` longtext,
  `socialLink` longtext,
  `city` longtext,
  `state` longtext,
  `country` longtext,
  `about` longtext,
  `lang` varchar(20) DEFAULT NULL,
  `areaCode` varchar(105) DEFAULT NULL,
  `memberExpiryDate` date DEFAULT NULL,
  `publicEmail` tinyint(1) NOT NULL,
  `need_service` tinyint(1) NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `date` date DEFAULT NULL,
  `slot` varchar(10) DEFAULT NULL,
  `material_items` longtext,
  `material_charges` double NOT NULL,
  `otp` varchar(10) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  `deviceID` varchar(100) DEFAULT NULL,
  `dp` varchar(100) DEFAULT NULL,
  `verified` tinyint(1) NOT NULL,
  `leadDate` date DEFAULT NULL,
  `qcReviewed` tinyint(1) NOT NULL,
  `qcApproved` tinyint(1) NOT NULL,
  `isSales` tinyint(1) NOT NULL,
  `serviceName` varchar(100) DEFAULT NULL,
  `warrantyStatus` varchar(100) DEFAULT NULL,
  `serialNo` varchar(100) DEFAULT NULL,
  `contact_ref_id` int DEFAULT NULL,
  `creater_id` int DEFAULT NULL,
  `material_terms_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_contacts_tags`
--

CREATE TABLE `marketing_contacts_tags` (
  `id` int NOT NULL,
  `contacts_id` int NOT NULL,
  `tag_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_contract`
--

CREATE TABLE `marketing_contract` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `value` int UNSIGNED NOT NULL,
  `status` varchar(10) NOT NULL,
  `paymentType` varchar(10) NOT NULL,
  `payment_status` varchar(10) NOT NULL,
  `dueDate` date DEFAULT NULL,
  `details` longtext,
  `data` longtext,
  `billedDate` date DEFAULT NULL,
  `recievedDate` datetime(6) DEFAULT NULL,
  `archivedDate` datetime(6) DEFAULT NULL,
  `warrnatyDate` datetime(6) DEFAULT NULL,
  `approvedDate` datetime(6) DEFAULT NULL,
  `grandTotal` int UNSIGNED NOT NULL,
  `amount` int UNSIGNED NOT NULL,
  `totalTax` double NOT NULL,
  `read` tinyint(1) NOT NULL,
  `templateName` varchar(100) DEFAULT NULL,
  `files` varchar(5000) DEFAULT NULL,
  `trackingCode` varchar(5000) DEFAULT NULL,
  `customerId` varchar(300) DEFAULT NULL,
  `invoiceNo` varchar(300) DEFAULT NULL,
  `quoteId` varchar(300) DEFAULT NULL,
  `readDateAndTime` datetime(6) DEFAULT NULL,
  `identifier` varchar(100) DEFAULT NULL,
  `termsAndConditionTxts` longtext,
  `discount` int UNSIGNED NOT NULL,
  `heading` varchar(300) DEFAULT NULL,
  `customerName` varchar(300) DEFAULT NULL,
  `preparedBy` varchar(300) DEFAULT NULL,
  `activityScope` longtext,
  `amcBenefits` longtext,
  `conditions` longtext,
  `voidAmc` longtext,
  `restime` longtext,
  `escalation` longtext,
  `typ` varchar(10) NOT NULL,
  `contact_id` int DEFAULT NULL,
  `coupon_id` int DEFAULT NULL,
  `deal_id` int DEFAULT NULL,
  `frm_id` int DEFAULT NULL,
  `termsAndCondition_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_contracttracker`
--

CREATE TABLE `marketing_contracttracker` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `grandTotal` double NOT NULL,
  `data` longtext,
  `discount` double NOT NULL,
  `termsAndConditionTxts` longtext,
  `heading` varchar(300) DEFAULT NULL,
  `contract_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_contract_products`
--

CREATE TABLE `marketing_contract_products` (
  `id` int NOT NULL,
  `contract_id` int NOT NULL,
  `productqtys_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_crmtermsandconditions`
--

CREATE TABLE `marketing_crmtermsandconditions` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `body` longtext,
  `heading` longtext,
  `default` tinyint(1) NOT NULL,
  `extraFieldOne` longtext,
  `extraFieldTwo` longtext,
  `isGst` tinyint(1) NOT NULL,
  `companyPamphlet` varchar(100) DEFAULT NULL,
  `themeColor` varchar(60) DEFAULT NULL,
  `message` longtext,
  `version` varchar(60) DEFAULT NULL,
  `division_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_customersession`
--

CREATE TABLE `marketing_customersession` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `email` varchar(50) NOT NULL,
  `otp` varchar(5) DEFAULT NULL,
  `sessionId` varchar(35) DEFAULT NULL,
  `typ` varchar(15) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `contact_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_dc`
--

CREATE TABLE `marketing_dc` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `poNumber` varchar(100) DEFAULT NULL,
  `poDate` date DEFAULT NULL,
  `type` varchar(30) NOT NULL,
  `dcDate` date DEFAULT NULL,
  `contact_id` int DEFAULT NULL,
  `createdBy_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_dcqtymap`
--

CREATE TABLE `marketing_dcqtymap` (
  `id` int NOT NULL,
  `description` longtext,
  `qty` int UNSIGNED NOT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `checkin_id` int DEFAULT NULL,
  `dc_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_deal`
--

CREATE TABLE `marketing_deal` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `value` int UNSIGNED DEFAULT NULL,
  `currency` varchar(4) NOT NULL,
  `state` varchar(13) NOT NULL,
  `requirements` longtext,
  `probability` smallint NOT NULL,
  `closeDate` datetime(6) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `result` varchar(4) NOT NULL,
  `doc` varchar(100) DEFAULT NULL,
  `rate` int UNSIGNED DEFAULT NULL,
  `duePenalty` int UNSIGNED DEFAULT NULL,
  `duePeriod` int UNSIGNED NOT NULL,
  `billingType` varchar(7) DEFAULT NULL,
  `deliveryTime` int UNSIGNED DEFAULT NULL,
  `company_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_dealpaymentsterm`
--

CREATE TABLE `marketing_dealpaymentsterm` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `offset` varchar(100) NOT NULL,
  `percent` varchar(500) NOT NULL,
  `milestone` varchar(500) NOT NULL,
  `parent_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_dealrequirement`
--

CREATE TABLE `marketing_dealrequirement` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `title` varchar(100) NOT NULL,
  `details` longtext,
  `parent_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_deal_contacts`
--

CREATE TABLE `marketing_deal_contacts` (
  `id` int NOT NULL,
  `deal_id` int NOT NULL,
  `contact_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_deal_internalUsers`
--

CREATE TABLE `marketing_deal_internalUsers` (
  `id` int NOT NULL,
  `deal_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_discount`
--

CREATE TABLE `marketing_discount` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `percentage` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_engineersiteexpense`
--

CREATE TABLE `marketing_engineersiteexpense` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `medicialExpense` double NOT NULL,
  `startPoint` longtext,
  `endPoint` longtext,
  `distance` varchar(50) NOT NULL,
  `transportMode` varchar(50) NOT NULL,
  `startTime` varchar(50) NOT NULL,
  `billNo` varchar(50) NOT NULL,
  `amount` double NOT NULL,
  `expenseType` varchar(100) NOT NULL,
  `isApproved` tinyint(1) NOT NULL,
  `remarks` longtext,
  `expenseDocument` varchar(100) DEFAULT NULL,
  `site_id` int DEFAULT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_im`
--

CREATE TABLE `marketing_im` (
  `id` int NOT NULL,
  `attach` varchar(100) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `thumbnail` varchar(100) DEFAULT NULL,
  `frm_id` int NOT NULL,
  `to_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_inward`
--

CREATE TABLE `marketing_inward` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `deptType` varchar(30) DEFAULT NULL,
  `caseNumber` varchar(100) DEFAULT NULL,
  `unit_id` int DEFAULT NULL,
  `vendor_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_inwardqty`
--

CREATE TABLE `marketing_inwardqty` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `productType` varchar(30) DEFAULT NULL,
  `categoryType` varchar(30) DEFAULT NULL,
  `serialNo` varchar(200) DEFAULT NULL,
  `productMake` varchar(200) DEFAULT NULL,
  `productModel` varchar(200) DEFAULT NULL,
  `vdc` varchar(200) DEFAULT NULL,
  `rating` varchar(200) DEFAULT NULL,
  `price` double NOT NULL,
  `is_inwarded` tinyint(1) NOT NULL,
  `inward_id` int DEFAULT NULL,
  `warrantyStatus` varchar(30) DEFAULT NULL,
  `workOrderType` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_legalagreement`
--

CREATE TABLE `marketing_legalagreement` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `signed` tinyint(1) NOT NULL,
  `signedOn` datetime(6) DEFAULT NULL,
  `title` varchar(1000) NOT NULL,
  `sent` tinyint(1) NOT NULL,
  `sentOn` datetime(6) DEFAULT NULL,
  `signature` longtext,
  `witness1` varchar(1000) DEFAULT NULL,
  `witness2` varchar(1000) DEFAULT NULL,
  `effectiveDate` datetime(6) DEFAULT NULL,
  `effectiveDateEnd` datetime(6) DEFAULT NULL,
  `signedDoc` varchar(100) DEFAULT NULL,
  `authrizer_id` int DEFAULT NULL,
  `deal_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_legalagreementterms`
--

CREATE TABLE `marketing_legalagreementterms` (
  `id` int NOT NULL,
  `typ` varchar(10) NOT NULL,
  `content` longtext NOT NULL,
  `parent_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_log`
--

CREATE TABLE `marketing_log` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `txt` varchar(500) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  `fileUrl` varchar(100) DEFAULT NULL,
  `callUrl` varchar(100) DEFAULT NULL,
  `plan_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_notification`
--

CREATE TABLE `marketing_notification` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `date` date DEFAULT NULL,
  `description` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_paymentreciepts`
--

CREATE TABLE `marketing_paymentreciepts` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `startDate` date DEFAULT NULL,
  `divisionType` varchar(100) NOT NULL,
  `invoiceNo` varchar(250) NOT NULL,
  `amount` double NOT NULL,
  `attachment` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_productqtys`
--

CREATE TABLE `marketing_productqtys` (
  `id` int NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `description` varchar(350) DEFAULT NULL,
  `model` varchar(150) DEFAULT NULL,
  `location` varchar(150) DEFAULT NULL,
  `unitprice` double NOT NULL,
  `qty` double NOT NULL,
  `gst` double NOT NULL,
  `basetotal` double NOT NULL,
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_products`
--

CREATE TABLE `marketing_products` (
  `id` int NOT NULL,
  `po_number` varchar(200) DEFAULT NULL,
  `customer_name` varchar(200) DEFAULT NULL,
  `contract_type` varchar(200) DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `amc_startdate` date DEFAULT NULL,
  `amc_enddate` date DEFAULT NULL,
  `battery_installationdate` date DEFAULT NULL,
  `quote` varchar(200) DEFAULT NULL,
  `battery_expirydate` date DEFAULT NULL,
  `maintaince_schdelue` varchar(200) NOT NULL,
  `battery_capacity` varchar(200) DEFAULT NULL,
  `advance` varchar(200) DEFAULT NULL,
  `make` varchar(200) DEFAULT NULL,
  `customerID` varchar(200) DEFAULT NULL,
  `load_details` varchar(200) DEFAULT NULL,
  `customerInfo` longtext,
  `amcContractValue` double NOT NULL,
  `paymentType` double NOT NULL,
  `preventive_maintance` double NOT NULL,
  `payment_terms` double NOT NULL,
  `total` double NOT NULL,
  `quantity` double NOT NULL,
  `checkin_id` int DEFAULT NULL,
  `contact_id` int DEFAULT NULL,
  `battery_make` varchar(200) DEFAULT NULL,
  `for_contact_id` int DEFAULT NULL,
  `product_returndate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_proforma`
--

CREATE TABLE `marketing_proforma` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `sacCode` varchar(100) NOT NULL,
  `prgrnInvoiceNo` varchar(100) NOT NULL,
  `prgrnInvoiceDate` date DEFAULT NULL,
  `days` int UNSIGNED NOT NULL,
  `travelExpenses` double NOT NULL,
  `cabExpenses` double NOT NULL,
  `autoCharges` double NOT NULL,
  `hotelCharges` double NOT NULL,
  `dailyAllowance` double NOT NULL,
  `travelExpensesDays` double NOT NULL,
  `cabExpensesDays` double NOT NULL,
  `autoChargesDays` double NOT NULL,
  `hotelChargesDays` double NOT NULL,
  `dailyAllowanceDays` double NOT NULL,
  `grandTotal` double NOT NULL,
  `manDayCharges` double NOT NULL,
  `totalTax` double NOT NULL,
  `siteId_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_proformaqtys`
--

CREATE TABLE `marketing_proformaqtys` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `details` varchar(100) NOT NULL,
  `expenseType` varchar(100) NOT NULL,
  `days` double NOT NULL,
  `totalExpense` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_proforma_qtys`
--

CREATE TABLE `marketing_proforma_qtys` (
  `id` int NOT NULL,
  `proforma_id` int NOT NULL,
  `proformaqtys_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_purchaseorder`
--

CREATE TABLE `marketing_purchaseorder` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `issuedDate` date DEFAULT NULL,
  `expiryDate` date DEFAULT NULL,
  `updated` datetime(6) NOT NULL,
  `poNumber` varchar(200) DEFAULT NULL,
  `orderTerms` varchar(200) DEFAULT NULL,
  `amount` double NOT NULL,
  `pendingAmount` double NOT NULL,
  `attachment` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_purchaseqty`
--

CREATE TABLE `marketing_purchaseqty` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `invoiceNo` varchar(200) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `amount` double NOT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `po_id` int NOT NULL,
  `site_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_salespurchaseorder`
--

CREATE TABLE `marketing_salespurchaseorder` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `issuedDate` date DEFAULT NULL,
  `expiryDate` date DEFAULT NULL,
  `updated` datetime(6) NOT NULL,
  `date` date DEFAULT NULL,
  `poNumber` varchar(1000) DEFAULT NULL,
  `deliveryNote` varchar(1000) DEFAULT NULL,
  `mode` varchar(1000) DEFAULT NULL,
  `supplier_reference` varchar(1000) DEFAULT NULL,
  `other_reference` varchar(1000) DEFAULT NULL,
  `dispatch_documentNo` varchar(1000) DEFAULT NULL,
  `despatch_through` varchar(1000) DEFAULT NULL,
  `despatch_to_details` double NOT NULL,
  `despatch_company` varchar(1000) DEFAULT NULL,
  `despatch_address` varchar(1000) DEFAULT NULL,
  `despatch_phone` varchar(1000) DEFAULT NULL,
  `despatch_gstin` varchar(1000) DEFAULT NULL,
  `supplier_company` varchar(1000) DEFAULT NULL,
  `supplier_address` varchar(1000) DEFAULT NULL,
  `supplier_phone` varchar(1000) DEFAULT NULL,
  `supplier_gstin` varchar(1000) DEFAULT NULL,
  `amount_in_words` varchar(1000) DEFAULT NULL,
  `discount` double NOT NULL,
  `gst` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `company_cst_no` varchar(1000) DEFAULT NULL,
  `company_gst_no` varchar(1000) DEFAULT NULL,
  `company_pan` varchar(1000) DEFAULT NULL,
  `company_service_tax_no` varchar(1000) DEFAULT NULL,
  `company_vat_in` varchar(1000) DEFAULT NULL,
  `conditions` longtext,
  `despatch_code` varchar(1000) DEFAULT NULL,
  `supplier_code` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_salespurchaseorder_orderQtys`
--

CREATE TABLE `marketing_salespurchaseorder_orderQtys` (
  `id` int NOT NULL,
  `salespurchaseorder_id` int NOT NULL,
  `salesqtys_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_salesqtys`
--

CREATE TABLE `marketing_salesqtys` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `subject` longtext,
  `quantity` double NOT NULL,
  `rate` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_schedule`
--

CREATE TABLE `marketing_schedule` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `dated` date NOT NULL,
  `slot` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `emailId` varchar(254) NOT NULL,
  `status` varchar(15) DEFAULT NULL,
  `organizer_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_schedule_participants`
--

CREATE TABLE `marketing_schedule_participants` (
  `id` int NOT NULL,
  `schedule_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_site`
--

CREATE TABLE `marketing_site` (
  `id` int NOT NULL,
  `projectManager` varchar(100) NOT NULL,
  `managerContact` varchar(12) NOT NULL,
  `managerEmail` varchar(400) NOT NULL,
  `divisionType` varchar(100) NOT NULL,
  `workType` varchar(100) NOT NULL,
  `workNature` varchar(100) NOT NULL,
  `siteID` varchar(100) NOT NULL,
  `siteName` varchar(400) NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `location` varchar(400) NOT NULL,
  `isNewLocation` tinyint(1) NOT NULL,
  `charges` double NOT NULL,
  `status` varchar(100) NOT NULL,
  `chargeType` varchar(100) NOT NULL,
  `branch_id` int DEFAULT NULL,
  `engineer_id` int DEFAULT NULL,
  `isExpenseSubmitted` tinyint(1) NOT NULL,
  `submittedDate` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_siteadvance`
--

CREATE TABLE `marketing_siteadvance` (
  `id` int NOT NULL,
  `date` date DEFAULT NULL,
  `amount` double NOT NULL,
  `isRequest` tinyint(1) NOT NULL,
  `status` varchar(100) NOT NULL,
  `site_id` int DEFAULT NULL,
  `engineer_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_sitebills`
--

CREATE TABLE `marketing_sitebills` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `type` varchar(100) NOT NULL,
  `document` varchar(100) DEFAULT NULL,
  `createdBy_id` int DEFAULT NULL,
  `site_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_siteengineerattendance`
--

CREATE TABLE `marketing_siteengineerattendance` (
  `id` int NOT NULL,
  `date` date DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `engineer_id` int DEFAULT NULL,
  `site_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_siteexpenses`
--

CREATE TABLE `marketing_siteexpenses` (
  `id` int NOT NULL,
  `date` date DEFAULT NULL,
  `engineerMomDays` double NOT NULL,
  `engineerTravel` double NOT NULL,
  `engineerFood` double NOT NULL,
  `engineerLodge` double NOT NULL,
  `engineerOlaTaxi` double NOT NULL,
  `engineerMedical` double NOT NULL,
  `abbMomDays` double NOT NULL,
  `abbTravel` double NOT NULL,
  `abbOlaTaxi` double NOT NULL,
  `abbLodge` double NOT NULL,
  `abbTa` double NOT NULL,
  `deductionTa` double NOT NULL,
  `deductionDa` double NOT NULL,
  `deductionOthers` double NOT NULL,
  `zigmaTravel` double NOT NULL,
  `zigmaFood` double NOT NULL,
  `zigmaLodge` double NOT NULL,
  `zigmaolaTaxi` double NOT NULL,
  `engineerExpTotal` double NOT NULL,
  `abbExpTotal` double NOT NULL,
  `deductExpTotal` double NOT NULL,
  `zigmaExpTotal` double NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `site_id` int DEFAULT NULL,
  `reason` varchar(3000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_sparerequest`
--

CREATE TABLE `marketing_sparerequest` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `qty` int UNSIGNED NOT NULL,
  `partNo` varchar(50) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `approvedBy_id` int DEFAULT NULL,
  `tourplanstop_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_sparerequest_checkins`
--

CREATE TABLE `marketing_sparerequest_checkins` (
  `id` int NOT NULL,
  `sparerequest_id` int NOT NULL,
  `checkin_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_tag`
--

CREATE TABLE `marketing_tag` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_ticketlog`
--

CREATE TABLE `marketing_ticketlog` (
  `id` int NOT NULL,
  `date` date DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL,
  `reason` varchar(1000) DEFAULT NULL,
  `status` varchar(1000) DEFAULT NULL,
  `ticket_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_tourplan`
--

CREATE TABLE `marketing_tourplan` (
  `id` int NOT NULL,
  `date` date NOT NULL,
  `ta` double DEFAULT NULL,
  `da` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `approved` tinyint(1) NOT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `status` varchar(15) NOT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_tourplanstop`
--

CREATE TABLE `marketing_tourplanstop` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `timeslot` varchar(10) DEFAULT NULL,
  `comments` longtext,
  `status` varchar(20) NOT NULL,
  `read` tinyint(1) NOT NULL,
  `called` tinyint(1) NOT NULL,
  `startOTP` varchar(10) DEFAULT NULL,
  `completeOTP` varchar(10) DEFAULT NULL,
  `cancelOTP` varchar(10) DEFAULT NULL,
  `followUpDate` datetime(6) DEFAULT NULL,
  `visitType` varchar(20) NOT NULL,
  `audio_files` varchar(500) DEFAULT NULL,
  `call_audio_files` varchar(500) DEFAULT NULL,
  `general_comment` longtext,
  `is_postponded` tinyint(1) NOT NULL,
  `postponded_date` date DEFAULT NULL,
  `techStatus` varchar(20) NOT NULL,
  `healthDeclaration` tinyint(1) NOT NULL,
  `addrs` longtext,
  `pinCode` varchar(10) DEFAULT NULL,
  `city` longtext,
  `state` longtext,
  `country` longtext,
  `techIncentive` int UNSIGNED NOT NULL,
  `billed` tinyint(1) NOT NULL,
  `serviceName` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `productModel` varchar(100) DEFAULT NULL,
  `productSno` varchar(100) DEFAULT NULL,
  `workType` varchar(250) NOT NULL,
  `priority` varchar(100) NOT NULL,
  `warrantyStatus` varchar(250) NOT NULL,
  `woReason` varchar(100) DEFAULT NULL,
  `inventoryStatus` varchar(50) DEFAULT NULL,
  `qcStatus` varchar(25) DEFAULT NULL,
  `updated` datetime(6) NOT NULL,
  `expenseType` varchar(150) DEFAULT NULL,
  `expenseAmt` double DEFAULT NULL,
  `productType` varchar(20) NOT NULL,
  `warrantyAmt` double DEFAULT NULL,
  `assignedBy_id` int DEFAULT NULL,
  `cancelledBy_id` int DEFAULT NULL,
  `checkin_id` int DEFAULT NULL,
  `contact_id` int DEFAULT NULL,
  `contract_id` int DEFAULT NULL,
  `division_id` int DEFAULT NULL,
  `expense_id` int DEFAULT NULL,
  `tourplan_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `billDoc` varchar(100) DEFAULT NULL,
  `fsrDoc` varchar(100) DEFAULT NULL,
  `amc_product_id` int DEFAULT NULL,
  `tourplan_type` varchar(20) NOT NULL,
  `qcCreated` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_tourplanstopindent`
--

CREATE TABLE `marketing_tourplanstopindent` (
  `id` int NOT NULL,
  `remark` varchar(30) NOT NULL,
  `listDown` varchar(1000) DEFAULT NULL,
  `reason` varchar(1000) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `tourplanstop_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_tourplanstop_afterPic`
--

CREATE TABLE `marketing_tourplanstop_afterPic` (
  `id` int NOT NULL,
  `tourplanstop_id` int NOT NULL,
  `media_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_tourplanstop_beforePic`
--

CREATE TABLE `marketing_tourplanstop_beforePic` (
  `id` int NOT NULL,
  `tourplanstop_id` int NOT NULL,
  `media_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_userassets`
--

CREATE TABLE `marketing_userassets` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `updated` datetime(6) NOT NULL,
  `type` varchar(100) NOT NULL,
  `description` varchar(399) NOT NULL,
  `amount` double NOT NULL,
  `status` varchar(100) NOT NULL,
  `engineer_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `organization_companyholidays`
--

CREATE TABLE `organization_companyholidays` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `date` date DEFAULT NULL,
  `typ` varchar(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `division_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `organization_departments`
--

CREATE TABLE `organization_departments` (
  `id` int NOT NULL,
  `dept_name` varchar(400) NOT NULL,
  `division_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `organization_departments_contacts`
--

CREATE TABLE `organization_departments_contacts` (
  `id` int NOT NULL,
  `departments_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `organization_division`
--

CREATE TABLE `organization_division` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `website` varchar(200) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `pan` varchar(200) DEFAULT NULL,
  `cin` varchar(200) DEFAULT NULL,
  `l1` varchar(200) DEFAULT NULL,
  `l2` varchar(200) DEFAULT NULL,
  `subDomain` varchar(200) DEFAULT NULL,
  `address` varchar(400) DEFAULT NULL,
  `gst` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organization_division`
--

INSERT INTO `organization_division` (`id`, `name`, `website`, `logo`, `pan`, `cin`, `l1`, `l2`, `subDomain`, `address`, `gst`) VALUES
(1, 'Zigma technologies', 'zigma-technologies.com', 'org/LOGO/1615626866_49_image.png', '423423ADAS', '3423423', 'WSDSDA', 'DSAD', NULL, 'zigma division address new test 1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `organization_homechart`
--

CREATE TABLE `organization_homechart` (
  `id` int NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `type` varchar(30) NOT NULL,
  `index` int UNSIGNED DEFAULT NULL,
  `chartType` varchar(30) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `configuration` varchar(3000) DEFAULT NULL,
  `query` longtext,
  `division_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `organization_installedapp`
--

CREATE TABLE `organization_installedapp` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `configs` longtext,
  `priceAsAdded` double NOT NULL,
  `addedBy_id` int NOT NULL,
  `app_id` int NOT NULL,
  `parent_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `organization_responsibility`
--

CREATE TABLE `organization_responsibility` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `title` varchar(200) NOT NULL,
  `data` varchar(200) DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `organization_responsibility_departments`
--

CREATE TABLE `organization_responsibility_departments` (
  `id` int NOT NULL,
  `responsibility_id` int NOT NULL,
  `departments_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `organization_role`
--

CREATE TABLE `organization_role` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `division_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organization_role`
--

INSERT INTO `organization_role` (`id`, `name`, `division_id`) VALUES
(1, 'Admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `organization_rolepermission`
--

CREATE TABLE `organization_rolepermission` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `isOnlyApp` tinyint(1) NOT NULL,
  `app_id` int DEFAULT NULL,
  `menuitem_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `organization_rolepermission`
--

INSERT INTO `organization_rolepermission` (`id`, `created`, `isOnlyApp`, `app_id`, `menuitem_id`, `role_id`) VALUES
(1, '2021-03-13 09:12:55.087507', 0, 183, 18, 1),
(2, '2021-03-13 09:13:33.869562', 0, 183, 19, 1),
(3, '2021-03-13 12:43:32.661807', 1, 122, NULL, 1),
(4, '2021-03-13 12:43:35.924195', 1, 162, NULL, 1),
(6, '2021-03-13 12:43:41.132469', 0, 177, 2, 1),
(7, '2021-03-13 12:43:41.808299', 0, 177, 3, 1),
(8, '2021-03-13 12:43:42.274623', 0, 177, 4, 1),
(9, '2021-03-13 12:43:42.879444', 0, 177, 5, 1),
(10, '2021-03-13 12:43:43.622004', 0, 177, 6, 1),
(11, '2021-03-13 12:43:45.536388', 0, 177, 7, 1),
(12, '2021-03-13 12:43:46.256254', 1, 178, NULL, 1),
(13, '2021-03-13 12:43:49.896419', 1, 180, NULL, 1),
(14, '2021-03-13 12:43:50.927299', 0, 179, 21, 1),
(15, '2021-03-13 12:43:51.567231', 0, 179, 17, 1),
(16, '2021-03-13 12:43:53.245452', 0, 179, 16, 1),
(17, '2021-03-13 12:43:53.847940', 0, 179, 15, 1),
(18, '2021-03-13 12:43:54.351831', 0, 179, 14, 1),
(19, '2021-03-13 12:43:56.524002', 0, 70, 20, 1),
(20, '2021-03-13 12:43:57.001569', 0, 70, 13, 1),
(21, '2021-03-13 12:43:57.464773', 0, 70, 12, 1),
(22, '2021-03-13 12:43:57.873144', 0, 70, 11, 1),
(23, '2021-03-13 12:43:58.329632', 0, 70, 10, 1),
(24, '2021-03-13 12:43:58.754348', 0, 70, 9, 1),
(26, '2021-03-13 12:44:01.744373', 1, 7, NULL, 1),
(30, '2021-03-13 12:46:05.152273', 0, 70, 8, 1),
(31, '2021-03-13 12:47:36.984163', 1, 7, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `organization_role_charts`
--

CREATE TABLE `organization_role_charts` (
  `id` int NOT NULL,
  `role_id` int NOT NULL,
  `homechart_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `organization_role_permissions`
--

CREATE TABLE `organization_role_permissions` (
  `id` int NOT NULL,
  `role_id` int NOT NULL,
  `application_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `organization_role_reports`
--

CREATE TABLE `organization_role_reports` (
  `id` int NOT NULL,
  `role_id` int NOT NULL,
  `homechart_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `organization_unit`
--

CREATE TABLE `organization_unit` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` varchar(400) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `pincode` varchar(15) DEFAULT NULL,
  `l1` varchar(200) DEFAULT NULL,
  `l2` varchar(200) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `areaCode` varchar(15) NOT NULL,
  `gstin` varchar(200) DEFAULT NULL,
  `warehouse` tinyint(1) NOT NULL,
  `bankName` varchar(200) DEFAULT NULL,
  `bankBranch` varchar(200) DEFAULT NULL,
  `bankAccNumber` varchar(200) DEFAULT NULL,
  `ifsc` varchar(200) DEFAULT NULL,
  `swift` varchar(200) DEFAULT NULL,
  `master` tinyint(1) NOT NULL,
  `isABB` tinyint(1) NOT NULL,
  `isTRC` tinyint(1) NOT NULL,
  `division_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paypal_ipn`
--

CREATE TABLE `paypal_ipn` (
  `id` int NOT NULL,
  `business` varchar(127) NOT NULL,
  `charset` varchar(255) NOT NULL,
  `custom` varchar(256) NOT NULL,
  `notify_version` decimal(64,2) DEFAULT NULL,
  `parent_txn_id` varchar(19) NOT NULL,
  `receiver_email` varchar(254) NOT NULL,
  `receiver_id` varchar(255) NOT NULL,
  `residence_country` varchar(2) NOT NULL,
  `test_ipn` tinyint(1) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `txn_type` varchar(255) NOT NULL,
  `verify_sign` varchar(255) NOT NULL,
  `address_country` varchar(64) NOT NULL,
  `address_city` varchar(40) NOT NULL,
  `address_country_code` varchar(64) NOT NULL,
  `address_name` varchar(128) NOT NULL,
  `address_state` varchar(40) NOT NULL,
  `address_status` varchar(255) NOT NULL,
  `address_street` varchar(200) NOT NULL,
  `address_zip` varchar(20) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `payer_business_name` varchar(127) NOT NULL,
  `payer_email` varchar(127) NOT NULL,
  `payer_id` varchar(13) NOT NULL,
  `auth_amount` decimal(64,2) DEFAULT NULL,
  `auth_exp` varchar(28) NOT NULL,
  `auth_id` varchar(19) NOT NULL,
  `auth_status` varchar(255) NOT NULL,
  `exchange_rate` decimal(64,16) DEFAULT NULL,
  `invoice` varchar(127) NOT NULL,
  `item_name` varchar(127) NOT NULL,
  `item_number` varchar(127) NOT NULL,
  `mc_currency` varchar(32) NOT NULL,
  `mc_fee` decimal(64,2) DEFAULT NULL,
  `mc_gross` decimal(64,2) DEFAULT NULL,
  `mc_handling` decimal(64,2) DEFAULT NULL,
  `mc_shipping` decimal(64,2) DEFAULT NULL,
  `memo` varchar(255) NOT NULL,
  `num_cart_items` int DEFAULT NULL,
  `option_name1` varchar(64) NOT NULL,
  `option_name2` varchar(64) NOT NULL,
  `payer_status` varchar(255) NOT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `payment_gross` decimal(64,2) DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `pending_reason` varchar(255) NOT NULL,
  `protection_eligibility` varchar(255) NOT NULL,
  `quantity` int DEFAULT NULL,
  `reason_code` varchar(255) NOT NULL,
  `remaining_settle` decimal(64,2) DEFAULT NULL,
  `settle_amount` decimal(64,2) DEFAULT NULL,
  `settle_currency` varchar(32) NOT NULL,
  `shipping` decimal(64,2) DEFAULT NULL,
  `shipping_method` varchar(255) NOT NULL,
  `tax` decimal(64,2) DEFAULT NULL,
  `transaction_entity` varchar(255) NOT NULL,
  `auction_buyer_id` varchar(64) NOT NULL,
  `auction_closing_date` datetime(6) DEFAULT NULL,
  `auction_multi_item` int DEFAULT NULL,
  `for_auction` decimal(64,2) DEFAULT NULL,
  `amount` decimal(64,2) DEFAULT NULL,
  `amount_per_cycle` decimal(64,2) DEFAULT NULL,
  `initial_payment_amount` decimal(64,2) DEFAULT NULL,
  `next_payment_date` datetime(6) DEFAULT NULL,
  `outstanding_balance` decimal(64,2) DEFAULT NULL,
  `payment_cycle` varchar(255) NOT NULL,
  `period_type` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `profile_status` varchar(255) NOT NULL,
  `recurring_payment_id` varchar(255) NOT NULL,
  `rp_invoice_id` varchar(127) NOT NULL,
  `time_created` datetime(6) DEFAULT NULL,
  `amount1` decimal(64,2) DEFAULT NULL,
  `amount2` decimal(64,2) DEFAULT NULL,
  `amount3` decimal(64,2) DEFAULT NULL,
  `mc_amount1` decimal(64,2) DEFAULT NULL,
  `mc_amount2` decimal(64,2) DEFAULT NULL,
  `mc_amount3` decimal(64,2) DEFAULT NULL,
  `password` varchar(24) NOT NULL,
  `period1` varchar(255) NOT NULL,
  `period2` varchar(255) NOT NULL,
  `period3` varchar(255) NOT NULL,
  `reattempt` varchar(1) NOT NULL,
  `recur_times` int DEFAULT NULL,
  `recurring` varchar(1) NOT NULL,
  `retry_at` datetime(6) DEFAULT NULL,
  `subscr_date` datetime(6) DEFAULT NULL,
  `subscr_effective` datetime(6) DEFAULT NULL,
  `subscr_id` varchar(19) NOT NULL,
  `username` varchar(64) NOT NULL,
  `case_creation_date` datetime(6) DEFAULT NULL,
  `case_id` varchar(255) NOT NULL,
  `case_type` varchar(255) NOT NULL,
  `receipt_id` varchar(255) NOT NULL,
  `currency_code` varchar(32) NOT NULL,
  `handling_amount` decimal(64,2) DEFAULT NULL,
  `transaction_subject` varchar(256) NOT NULL,
  `ipaddress` char(39) DEFAULT NULL,
  `flag` tinyint(1) NOT NULL,
  `flag_code` varchar(16) NOT NULL,
  `flag_info` longtext NOT NULL,
  `query` longtext NOT NULL,
  `response` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `from_view` varchar(6) DEFAULT NULL,
  `mp_id` varchar(128) DEFAULT NULL,
  `option_selection1` varchar(200) NOT NULL,
  `option_selection2` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_advances`
--

CREATE TABLE `payroll_advances` (
  `id` int NOT NULL,
  `typ` varchar(30) NOT NULL,
  `created` datetime(6) NOT NULL,
  `reason` longtext,
  `amount` double NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `disbursed` tinyint(1) NOT NULL,
  `settled` tinyint(1) NOT NULL,
  `dateOfReturn` date DEFAULT NULL,
  `tenure` int UNSIGNED NOT NULL,
  `document` varchar(100) DEFAULT NULL,
  `settlementDate` date DEFAULT NULL,
  `returnBalance` double DEFAULT NULL,
  `modeOfReturn` varchar(30) NOT NULL,
  `referenceNumber` varchar(50) DEFAULT NULL,
  `emiStartOffset` int UNSIGNED NOT NULL,
  `emi` int UNSIGNED NOT NULL,
  `invoice` varchar(100) DEFAULT NULL,
  `invoiceAmt` double DEFAULT NULL,
  `loanStarted` tinyint(1) NOT NULL,
  `loanStartedDate` date DEFAULT NULL,
  `settlementUser_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_advances_approvers`
--

CREATE TABLE `payroll_advances_approvers` (
  `id` int NOT NULL,
  `advances_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_disbursal`
--

CREATE TABLE `payroll_disbursal` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `date` date DEFAULT NULL,
  `disbursed` tinyint(1) NOT NULL,
  `disbursalNote` longtext,
  `sourcePk` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `tallyed` tinyint(1) NOT NULL,
  `narration` longtext,
  `contactPerson` varchar(100) DEFAULT NULL,
  `accountNumber` varchar(100) DEFAULT NULL,
  `bankName` varchar(100) DEFAULT NULL,
  `amount` double NOT NULL,
  `ifscCode` varchar(100) DEFAULT NULL,
  `account_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_itdecaration`
--

CREATE TABLE `payroll_itdecaration` (
  `id` int NOT NULL,
  `year` varchar(100) DEFAULT NULL,
  `month` varchar(100) DEFAULT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `group_name` varchar(100) DEFAULT NULL,
  `limit` double NOT NULL,
  `amount` double NOT NULL,
  `section` varchar(100) DEFAULT NULL,
  `polarity` int NOT NULL,
  `annualRent` double NOT NULL,
  `muncipalTax` double NOT NULL,
  `unrealizedTax` double NOT NULL,
  `netAnnualValue` double NOT NULL,
  `standardDeduction` double NOT NULL,
  `interestOnLoan` double NOT NULL,
  `eligibleAmount` double NOT NULL,
  `tenantName` varchar(1000) DEFAULT NULL,
  `tenantPan` varchar(1000) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_monthlypayslip`
--

CREATE TABLE `payroll_monthlypayslip` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `month` varchar(100) NOT NULL,
  `year` varchar(100) NOT NULL,
  `basicSalary` varchar(100) NOT NULL,
  `hra` varchar(100) NOT NULL,
  `special` int UNSIGNED DEFAULT NULL,
  `lta` int UNSIGNED DEFAULT NULL,
  `taxSlab` int UNSIGNED NOT NULL,
  `adHoc` int UNSIGNED DEFAULT NULL,
  `conveyance` varchar(100) NOT NULL,
  `convRemiburse` varchar(100) NOT NULL,
  `medRemiburse` varchar(100) NOT NULL,
  `empPF` varchar(100) NOT NULL,
  `otherEarnings` varchar(100) NOT NULL,
  `ta` varchar(100) NOT NULL,
  `da` varchar(100) NOT NULL,
  `spFund` varchar(100) NOT NULL,
  `ptDeduction` varchar(100) NOT NULL,
  `ioLoan` varchar(100) NOT NULL,
  `otherDeductions` varchar(100) NOT NULL,
  `totalEarnings` varchar(100) NOT NULL,
  `totalDeduction` varchar(100) NOT NULL,
  `netpay` varchar(100) NOT NULL,
  `pfAmnt` int UNSIGNED DEFAULT NULL,
  `esicAmount` double NOT NULL,
  `pTax` double NOT NULL,
  `bonus` double NOT NULL,
  `miscellaneous` double NOT NULL,
  `earnings` double NOT NULL,
  `deduction` double NOT NULL,
  `contribution` double NOT NULL,
  `pfAdmin` double NOT NULL,
  `esicAdmin` double NOT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_payrollreport`
--

CREATE TABLE `payroll_payrollreport` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` date NOT NULL,
  `month` int UNSIGNED NOT NULL,
  `year` int UNSIGNED NOT NULL,
  `total` int UNSIGNED DEFAULT NULL,
  `totalTDS` int UNSIGNED DEFAULT NULL,
  `status` varchar(30) NOT NULL,
  `dateOfProcessing` date DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_payslip`
--

CREATE TABLE `payroll_payslip` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` date NOT NULL,
  `adHoc` double NOT NULL,
  `month` int UNSIGNED NOT NULL,
  `year` int UNSIGNED NOT NULL,
  `tds` double NOT NULL,
  `days` int UNSIGNED NOT NULL,
  `deffered` tinyint(1) NOT NULL,
  `amount` double NOT NULL,
  `totalPayable` double NOT NULL,
  `reimbursement` int UNSIGNED NOT NULL,
  `taDa` double NOT NULL,
  `pfAmnt` double NOT NULL,
  `basic` double NOT NULL,
  `hra` double NOT NULL,
  `special` double NOT NULL,
  `lta` double NOT NULL,
  `esicAmount` double NOT NULL,
  `pTax` double NOT NULL,
  `bonus` double NOT NULL,
  `miscellaneous` double NOT NULL,
  `taxSlab` double NOT NULL,
  `earnings` double NOT NULL,
  `deduction` double NOT NULL,
  `contribution` double NOT NULL,
  `pfAdmin` double NOT NULL,
  `esicAdmin` double NOT NULL,
  `report_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `performance_feedback`
--

CREATE TABLE `performance_feedback` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `feed` longtext,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `performance_timesheet`
--

CREATE TABLE `performance_timesheet` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `date` date DEFAULT NULL,
  `approved` tinyint(1) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `checkIn` datetime(6) DEFAULT NULL,
  `checkOut` datetime(6) DEFAULT NULL,
  `totaltime` varchar(30) DEFAULT NULL,
  `checkinLat` double NOT NULL,
  `checkinLon` double NOT NULL,
  `checkoutLat` double NOT NULL,
  `checkoutLon` double NOT NULL,
  `distanceTravelled` double NOT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `performance_timesheet_approvedBy`
--

CREATE TABLE `performance_timesheet_approvedBy` (
  `id` int NOT NULL,
  `timesheet_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PIM_calendar`
--

CREATE TABLE `PIM_calendar` (
  `id` int NOT NULL,
  `visibility` varchar(20) NOT NULL,
  `eventType` varchar(11) NOT NULL,
  `originator` varchar(20) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `text` varchar(200) DEFAULT NULL,
  `when` datetime(6) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `read` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `completed` tinyint(1) NOT NULL,
  `canceled` tinyint(1) NOT NULL,
  `level` varchar(10) NOT NULL,
  `venue` varchar(50) DEFAULT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `myNotes` varchar(100) NOT NULL,
  `data` varchar(200) DEFAULT NULL,
  `campaignItem_id` int DEFAULT NULL,
  `orginatedBy_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PIM_calendar_clients`
--

CREATE TABLE `PIM_calendar_clients` (
  `id` int NOT NULL,
  `calendar_id` int NOT NULL,
  `contact_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PIM_calendar_followers`
--

CREATE TABLE `PIM_calendar_followers` (
  `id` int NOT NULL,
  `calendar_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PIM_calendar_notifications`
--

CREATE TABLE `PIM_calendar_notifications` (
  `id` int NOT NULL,
  `calendar_id` int NOT NULL,
  `notification_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PIM_chatmessage`
--

CREATE TABLE `PIM_chatmessage` (
  `id` int NOT NULL,
  `message` longtext,
  `attachment` varchar(100) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `read` tinyint(1) NOT NULL,
  `fileType` varchar(10) DEFAULT NULL,
  `fileSize` varchar(10) DEFAULT NULL,
  `fileName` varchar(20) DEFAULT NULL,
  `uid` longtext,
  `originator_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PIM_notebook`
--

CREATE TABLE `PIM_notebook` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `title` varchar(500) DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PIM_notification`
--

CREATE TABLE `PIM_notification` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `message` longtext,
  `link` varchar(100) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `read` tinyint(1) NOT NULL,
  `domain` varchar(250) NOT NULL,
  `onHold` tinyint(1) NOT NULL,
  `broadcast` tinyint(1) NOT NULL,
  `orginatedBy_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PIM_page`
--

CREATE TABLE `PIM_page` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `source` longtext,
  `title` varchar(500) DEFAULT NULL,
  `parent_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PIM_settings`
--

CREATE TABLE `PIM_settings` (
  `id` int NOT NULL,
  `presence` varchar(15) NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PIM_settings`
--

INSERT INTO `PIM_settings` (`id`, `presence`, `user_id`) VALUES
(19, 'NA', 21),
(20, 'NA', 23);

-- --------------------------------------------------------

--
-- Table structure for table `PIM_theme`
--

CREATE TABLE `PIM_theme` (
  `id` int NOT NULL,
  `main` varchar(10) DEFAULT NULL,
  `highlight` varchar(10) DEFAULT NULL,
  `background` varchar(10) DEFAULT NULL,
  `backgroundImg` varchar(100) DEFAULT NULL,
  `parent_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PIM_theme`
--

INSERT INTO `PIM_theme` (`id`, `main`, `highlight`, `background`, `backgroundImg`, `parent_id`) VALUES
(3, NULL, NULL, NULL, '', 19);

-- --------------------------------------------------------

--
-- Table structure for table `projects_comment`
--

CREATE TABLE `projects_comment` (
  `id` int NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `text` longtext,
  `media_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `projects_issues`
--

CREATE TABLE `projects_issues` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `title` varchar(500) NOT NULL,
  `status` varchar(50) NOT NULL,
  `tentresdt` date NOT NULL,
  `priority` varchar(50) NOT NULL,
  `result` varchar(50) DEFAULT NULL,
  `resultComments` varchar(500) DEFAULT NULL,
  `description` longtext,
  `file` varchar(100) DEFAULT NULL,
  `project_id` int NOT NULL,
  `responsible_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `projects_media`
--

CREATE TABLE `projects_media` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `link` longtext,
  `attachment` varchar(100) DEFAULT NULL,
  `mediaType` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `projects_project`
--

CREATE TABLE `projects_project` (
  `id` int NOT NULL,
  `dueDate` datetime(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `budget` int UNSIGNED NOT NULL,
  `projectClosed` tinyint(1) NOT NULL,
  `company_id` int DEFAULT NULL,
  `costCenter_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `projects_projectcomment`
--

CREATE TABLE `projects_projectcomment` (
  `comment_ptr_id` int NOT NULL,
  `project_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `projects_projectobjective`
--

CREATE TABLE `projects_projectobjective` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `details` varchar(500) NOT NULL,
  `status` varchar(30) NOT NULL,
  `targetDate` date DEFAULT NULL,
  `optional` tinyint(1) NOT NULL,
  `parent_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `projects_project_expenseSheets`
--

CREATE TABLE `projects_project_expenseSheets` (
  `id` int NOT NULL,
  `project_id` int NOT NULL,
  `expensesheet_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `projects_project_files`
--

CREATE TABLE `projects_project_files` (
  `id` int NOT NULL,
  `project_id` int NOT NULL,
  `media_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `projects_project_invoices`
--

CREATE TABLE `projects_project_invoices` (
  `id` int NOT NULL,
  `project_id` int NOT NULL,
  `expensesheet_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `projects_project_ourBoundInvoices`
--

CREATE TABLE `projects_project_ourBoundInvoices` (
  `id` int NOT NULL,
  `project_id` int NOT NULL,
  `outboundinvoice_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `projects_project_team`
--

CREATE TABLE `projects_project_team` (
  `id` int NOT NULL,
  `project_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `projects_timelineitem`
--

CREATE TABLE `projects_timelineitem` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `category` varchar(50) NOT NULL,
  `text` longtext,
  `project_id` int NOT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recruitment_interview`
--

CREATE TABLE `recruitment_interview` (
  `id` int NOT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `interviewDate` datetime(6) DEFAULT NULL,
  `status` varchar(15) NOT NULL,
  `mode` varchar(15) DEFAULT NULL,
  `candidate_id` int DEFAULT NULL,
  `interviewer_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recruitment_jobapplication`
--

CREATE TABLE `recruitment_jobapplication` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `resume` varchar(100) DEFAULT NULL,
  `coverletter` varchar(4000) DEFAULT NULL,
  `resumetext` varchar(4000) DEFAULT NULL,
  `status` varchar(30) NOT NULL,
  `aggree` tinyint(1) NOT NULL,
  `joiningDate` date DEFAULT NULL,
  `basic` int UNSIGNED NOT NULL,
  `hra` int UNSIGNED NOT NULL,
  `lta` int UNSIGNED NOT NULL,
  `special` int UNSIGNED NOT NULL,
  `taxSlab` int UNSIGNED NOT NULL,
  `adHoc` int UNSIGNED NOT NULL,
  `al` int UNSIGNED NOT NULL,
  `ml` int UNSIGNED NOT NULL,
  `adHocLeaves` int UNSIGNED NOT NULL,
  `amount` int UNSIGNED NOT NULL,
  `notice` int UNSIGNED NOT NULL,
  `probation` int UNSIGNED NOT NULL,
  `off` tinyint(1) NOT NULL,
  `probationNotice` int UNSIGNED NOT NULL,
  `noticePeriodRecovery` tinyint(1) NOT NULL,
  `rejectReason` varchar(15) NOT NULL,
  `job_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recruitment_jobs`
--

CREATE TABLE `recruitment_jobs` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `jobtype` varchar(15) NOT NULL,
  `skill` varchar(200) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `maximumCTC` varchar(15) DEFAULT NULL,
  `status` varchar(15) NOT NULL,
  `description` longtext,
  `department_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `unit_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recruitment_jobs_contacts`
--

CREATE TABLE `recruitment_jobs_contacts` (
  `id` int NOT NULL,
  `jobs_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `robots_rule`
--

CREATE TABLE `robots_rule` (
  `id` int NOT NULL,
  `robot` varchar(255) NOT NULL,
  `crawl_delay` decimal(3,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `robots_rule_allowed`
--

CREATE TABLE `robots_rule_allowed` (
  `id` int NOT NULL,
  `rule_id` int NOT NULL,
  `url_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `robots_rule_disallowed`
--

CREATE TABLE `robots_rule_disallowed` (
  `id` int NOT NULL,
  `rule_id` int NOT NULL,
  `url_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `robots_rule_sites`
--

CREATE TABLE `robots_rule_sites` (
  `id` int NOT NULL,
  `rule_id` int NOT NULL,
  `site_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `robots_url`
--

CREATE TABLE `robots_url` (
  `id` int NOT NULL,
  `pattern` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_album`
--

CREATE TABLE `social_album` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_albumfollower`
--

CREATE TABLE `social_albumfollower` (
  `follow_ptr_id` int NOT NULL,
  `parent_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_album_tagged`
--

CREATE TABLE `social_album_tagged` (
  `id` int NOT NULL,
  `album_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_comment`
--

CREATE TABLE `social_comment` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `text` varchar(200) NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_commentlike`
--

CREATE TABLE `social_commentlike` (
  `like_ptr_id` int NOT NULL,
  `parent_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_comment_tagged`
--

CREATE TABLE `social_comment_tagged` (
  `id` int NOT NULL,
  `comment_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_follow`
--

CREATE TABLE `social_follow` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `subscription` varchar(10) NOT NULL,
  `enrollment` varchar(10) NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_like`
--

CREATE TABLE `social_like` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_picture`
--

CREATE TABLE `social_picture` (
  `id` int NOT NULL,
  `photo` varchar(100) NOT NULL,
  `created` datetime(6) NOT NULL,
  `album_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_picturecomment`
--

CREATE TABLE `social_picturecomment` (
  `comment_ptr_id` int NOT NULL,
  `parent_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_picturelike`
--

CREATE TABLE `social_picturelike` (
  `like_ptr_id` int NOT NULL,
  `parent_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_picture_tagged`
--

CREATE TABLE `social_picture_tagged` (
  `id` int NOT NULL,
  `picture_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_post`
--

CREATE TABLE `social_post` (
  `id` int NOT NULL,
  `text` longtext NOT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_postcomment`
--

CREATE TABLE `social_postcomment` (
  `comment_ptr_id` int NOT NULL,
  `parent_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_postfollower`
--

CREATE TABLE `social_postfollower` (
  `follow_ptr_id` int NOT NULL,
  `parent_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_posthistory`
--

CREATE TABLE `social_posthistory` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `text` longtext NOT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `parent_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_postlike`
--

CREATE TABLE `social_postlike` (
  `like_ptr_id` int NOT NULL,
  `parent_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_post_tagged`
--

CREATE TABLE `social_post_tagged` (
  `id` int NOT NULL,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_publications`
--

CREATE TABLE `social_publications` (
  `id` int NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` longtext NOT NULL,
  `publisher` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `doi` varchar(50) DEFAULT NULL,
  `authors` longtext NOT NULL,
  `author_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_skill`
--

CREATE TABLE `social_skill` (
  `id` int NOT NULL,
  `text` longtext NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_skill_endoresement`
--

CREATE TABLE `social_skill_endoresement` (
  `id` int NOT NULL,
  `skill_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_social`
--

CREATE TABLE `social_social` (
  `id` int NOT NULL,
  `aboutMe` longtext,
  `status` varchar(100) DEFAULT NULL,
  `coverPic` varchar(100) DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `social_social`
--

INSERT INTO `social_social` (`id`, `aboutMe`, `status`, `coverPic`, `user_id`) VALUES
(20, NULL, NULL, '', 21),
(21, NULL, NULL, '', 23);

-- --------------------------------------------------------

--
-- Table structure for table `social_social_followers`
--

CREATE TABLE `social_social_followers` (
  `id` int NOT NULL,
  `social_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `taskBoard_media`
--

CREATE TABLE `taskBoard_media` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `link` longtext,
  `attachment` varchar(100) DEFAULT NULL,
  `mediaType` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `taskBoard_subtask`
--

CREATE TABLE `taskBoard_subtask` (
  `id` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `status` varchar(30) NOT NULL,
  `task_id` int NOT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `taskBoard_task`
--

CREATE TABLE `taskBoard_task` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` longtext,
  `dueDate` date NOT NULL,
  `personal` tinyint(1) NOT NULL,
  `completion` int UNSIGNED NOT NULL,
  `archived` tinyint(1) NOT NULL,
  `timeSpent` int UNSIGNED NOT NULL,
  `timerStartedAt` datetime(6) DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `to_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `taskBoard_taskworkbook`
--

CREATE TABLE `taskBoard_taskworkbook` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `submittedDate` date DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `managerComment` varchar(200) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `taskBoard_task_files`
--

CREATE TABLE `taskBoard_task_files` (
  `id` int NOT NULL,
  `task_id` int NOT NULL,
  `media_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `taskBoard_task_followers`
--

CREATE TABLE `taskBoard_task_followers` (
  `id` int NOT NULL,
  `task_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `taskBoard_timelineitem`
--

CREATE TABLE `taskBoard_timelineitem` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `category` varchar(50) NOT NULL,
  `text` longtext,
  `commit_id` int DEFAULT NULL,
  `task_id` int NOT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `website_components`
--

CREATE TABLE `website_components` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `component_type` varchar(250) NOT NULL,
  `data` longtext,
  `parent_id` int NOT NULL,
  `template` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `website_page`
--

CREATE TABLE `website_page` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `url` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` longtext,
  `ogImage` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `website_uielementtemplate`
--

CREATE TABLE `website_uielementtemplate` (
  `id` int NOT NULL,
  `created` datetime(6) NOT NULL,
  `defaultData` longtext,
  `template` longtext NOT NULL,
  `name` varchar(250) NOT NULL,
  `sampleImg` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_emailaddress_user_id_987c8728_uniq` (`user_id`,`email`);

--
-- Indexes for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `account_ema_email_address_id_5b7f8c58_fk_account_emailaddress_id` (`email_address_id`);

--
-- Indexes for table `assets_asset`
--
ALTER TABLE `assets_asset`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_asset_user_id_e173809b_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `assets_assetaddon`
--
ALTER TABLE `assets_assetaddon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_assetaddon_parent_id_29125720_fk_assets_asset_id` (`parent_id`);

--
-- Indexes for table `assets_contactproducts`
--
ALTER TABLE `assets_contactproducts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_contactproducts_addon_id_29d09d4f_fk_assets_assetaddon_id` (`addon_id`),
  ADD KEY `assets_contactproducts_asset_id_3fed2063_fk_assets_asset_id` (`asset_id`),
  ADD KEY `assets_contactprod_inventory_id_7ac161db_fk_finance_inventory_id` (`inventory_id`);

--
-- Indexes for table `assets_indent`
--
ALTER TABLE `assets_indent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_inden_requestedToUnit_id_1c376564_fk_organization_unit_id` (`requestedToUnit_id`),
  ADD KEY `assets_indent_requestor_id_5e3a5586_fk_auth_user_id` (`requestor_id`),
  ADD KEY `assets_indent_requestorUnit_id_4704cc4c_fk_organization_unit_id` (`requestorUnit_id`);

--
-- Indexes for table `assets_indentasset`
--
ALTER TABLE `assets_indentasset`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_indentasset_asset_id_534abf70_fk_assets_asset_id` (`asset_id`),
  ADD KEY `assets_indentasset_unit_id_299d8467_fk_organization_unit_id` (`unit_id`),
  ADD KEY `assets_indentasset_user_id_d64d1698_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `assets_indentqtymap`
--
ALTER TABLE `assets_indentqtymap`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_indentqtymap_asset_id_4e16b88f_fk_assets_asset_id` (`asset_id`),
  ADD KEY `assets_indentqtymap_indent_id_8a249be7_fk_assets_indent_id` (`indent_id`);

--
-- Indexes for table `assets_min`
--
ALTER TABLE `assets_min`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_min_issuedBy_id_6777d1ba_fk_auth_user_id` (`issuedBy_id`),
  ADD KEY `assets_min_issuedTo_id_f1243b72_fk_auth_user_id` (`issuedTo_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`);

--
-- Indexes for table `clientRelationships_emailtemplate`
--
ALTER TABLE `clientRelationships_emailtemplate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientRelationships_emailtemplate_e8701ad4` (`user_id`);

--
-- Indexes for table `clientRelationships_emailtemplate_files`
--
ALTER TABLE `clientRelationships_emailtemplate_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clientRelationships_emailtemplate_emailtemplate_id_f107be06_uniq` (`emailtemplate_id`,`files_id`),
  ADD KEY `clientRelation_files_id_ec0e176b_fk_clientRelationships_files_id` (`files_id`);

--
-- Indexes for table `clientRelationships_files`
--
ALTER TABLE `clientRelationships_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientRelationships_files_user_id_a481cfe5_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `clientRelationships_productmeta`
--
ALTER TABLE `clientRelationships_productmeta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clientRelationships_schedule`
--
ALTER TABLE `clientRelationships_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientRelationships_schedule_user_id_ccc11165_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `clientRelationships_schedule_users`
--
ALTER TABLE `clientRelationships_schedule_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clientRelationships_schedule_users_schedule_id_4dab19e3_uniq` (`schedule_id`,`user_id`),
  ADD KEY `clientRelationships_schedule_us_user_id_4be5dd8e_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `clientRelationships_termsandconditions`
--
ALTER TABLE `clientRelationships_termsandconditions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientRelations_division_id_5f4ad8d6_fk_organization_division_id` (`division_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_de54fa62` (`expire_date`);

--
-- Indexes for table `django_site`
--
ALTER TABLE `django_site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`);

--
-- Indexes for table `employees_complaints`
--
ALTER TABLE `employees_complaints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_complaints_user_id_593c2919_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `employees_systemlog`
--
ALTER TABLE `employees_systemlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_systemlog_user_id_1067cd21_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `ERP_address`
--
ALTER TABLE `ERP_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ERP_apiusage`
--
ALTER TABLE `ERP_apiusage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ERP_apiusage_d33aff5d` (`api_id`);

--
-- Indexes for table `ERP_application`
--
ALTER TABLE `ERP_application`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ERP_application_c9799665` (`module_id`),
  ADD KEY `ERP_application_6be37982` (`parent_id`);

--
-- Indexes for table `ERP_appsettingsfield`
--
ALTER TABLE `ERP_appsettingsfield`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ERP_appsettingsfield_name_fb4336f7_uniq` (`name`,`app_id`),
  ADD KEY `ERP_appsettingsfield_app_id_5e0bb5a0_fk_ERP_application_id` (`app_id`);

--
-- Indexes for table `ERP_bankloan`
--
ALTER TABLE `ERP_bankloan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ERP_device`
--
ALTER TABLE `ERP_device`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ERP_genericpincode`
--
ALTER TABLE `ERP_genericpincode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ERP_grouppermission`
--
ALTER TABLE `ERP_grouppermission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ERP_grouppermission_app_id_b08880bd_fk_ERP_application_id` (`app_id`),
  ADD KEY `ERP_grouppermission_givenBy_id_522edf12_fk_auth_user_id` (`givenBy_id`),
  ADD KEY `ERP_grouppermission_group_id_a7722e27_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `ERP_media`
--
ALTER TABLE `ERP_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ERP_media_user_id_8a7ec32d_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `ERP_menuitems`
--
ALTER TABLE `ERP_menuitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ERP_menuitems_parent_id_77c9f313_fk_ERP_application_id` (`parent_id`);

--
-- Indexes for table `ERP_module`
--
ALTER TABLE `ERP_module`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ERP_permission`
--
ALTER TABLE `ERP_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ERP_permission_app_id_9d39a250_fk_ERP_application_id` (`app_id`),
  ADD KEY `ERP_permission_givenBy_id_54b91569_fk_auth_user_id` (`givenBy_id`),
  ADD KEY `ERP_permission_user_id_6ba8c3c0_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `ERP_profile`
--
ALTER TABLE `ERP_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ERP_profile_user_id_7dada053_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `ERP_profile_devices`
--
ALTER TABLE `ERP_profile_devices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ERP_profile_devices_profile_id_888f1482_uniq` (`profile_id`,`device_id`),
  ADD KEY `ERP_profile_devices_device_id_7524e397_fk_ERP_device_id` (`device_id`);

--
-- Indexes for table `ERP_publicapikeys`
--
ALTER TABLE `ERP_publicapikeys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ERP_publicapikeys_admin_id_b9030d87_fk_auth_user_id` (`admin_id`),
  ADD KEY `ERP_publicapikeys_app_id_7ffce6c9_fk_ERP_application_id` (`app_id`),
  ADD KEY `ERP_publicapikeys_user_id_c88963a9_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `ERP_service`
--
ALTER TABLE `ERP_service`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `ERP_service_address_id_d624f8d9_fk_ERP_address_id` (`address_id`),
  ADD KEY `ERP_service_contactPerson_id_d67847fb_fk_auth_user_id` (`contactPerson_id`),
  ADD KEY `ERP_service_doc_id_fc7c5af1_fk_ERP_media_id` (`doc_id`),
  ADD KEY `ERP_service_owner_id_7e94ca23_fk_auth_user_id` (`owner_id`),
  ADD KEY `ERP_service_user_id_91a0df31_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `finance_account`
--
ALTER TABLE `finance_account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finance_account_contactPerson_id_9aa62965_fk_auth_user_id` (`contactPerson_id`),
  ADD KEY `finance_account_division_id_4981d07d_fk_organization_division_id` (`division_id`),
  ADD KEY `finance_account_unit_id_73a8d11f_fk_organization_unit_id` (`unit_id`);

--
-- Indexes for table `finance_account_authorizedSignaturies`
--
ALTER TABLE `finance_account_authorizedSignaturies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `finance_account_authorizedSignaturies_account_id_bab23248_uniq` (`account_id`,`user_id`),
  ADD KEY `finance_account_authorizedSigna_user_id_f4a4daa8_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `finance_configuretermsandconditions`
--
ALTER TABLE `finance_configuretermsandconditions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finance_configu_division_id_a966682a_fk_organization_division_id` (`division_id`);

--
-- Indexes for table `finance_costcenter`
--
ALTER TABLE `finance_costcenter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finance_costcenter_account_id_f0ecfe30_fk_finance_account_id` (`account_id`),
  ADD KEY `finance_costcen_division_id_635d77a4_fk_organization_division_id` (`division_id`),
  ADD KEY `finance_costcenter_head_id_5bc83063_fk_auth_user_id` (`head_id`),
  ADD KEY `finance_costcenter_unit_id_31f6ff92_fk_organization_unit_id` (`unit_id`);

--
-- Indexes for table `finance_expenseheading`
--
ALTER TABLE `finance_expenseheading`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_expensesheet`
--
ALTER TABLE `finance_expensesheet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finance_expense_division_id_715a7ab9_fk_organization_division_id` (`division_id`),
  ADD KEY `finance_expensesheet_f847de52` (`transaction_id`),
  ADD KEY `finance_expensesheet_e8701ad4` (`user_id`);

--
-- Indexes for table `finance_inflow`
--
ALTER TABLE `finance_inflow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finance_inflow_division_id_799646e8_fk_organization_division_id` (`division_id`),
  ADD KEY `finance_inflow_service_id_3cb6a23d_fk_ERP_service_id` (`service_id`),
  ADD KEY `finance_inflow_toAcc_id_041e95a8_fk_finance_account_id` (`toAcc_id`),
  ADD KEY `finance_inflow_user_id_496c9077_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `finance_inventory`
--
ALTER TABLE `finance_inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finance_invento_division_id_3ff1f41b_fk_organization_division_id` (`division_id`),
  ADD KEY `fi_productMeta_id_93888d2f_fk_clientRelationships_productmeta_id` (`productMeta_id`);

--
-- Indexes for table `finance_inventorylog`
--
ALTER TABLE `finance_inventorylog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finance_invento_division_id_6e4dcd05_fk_organization_division_id` (`division_id`),
  ADD KEY `finance_inventoryl_inventory_id_824a65c3_fk_finance_inventory_id` (`inventory_id`),
  ADD KEY `finance_inventorylog_user_id_78a31efc_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `finance_invoice`
--
ALTER TABLE `finance_invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finance_invoice_division_id_b735cfd1_fk_organization_division_id` (`division_id`),
  ADD KEY `finance_invoice_sheet_id_6f89012d_fk_finance_expensesheet_id` (`sheet_id`),
  ADD KEY `finance_invoice_f847de52` (`transaction_id`),
  ADD KEY `finance_invoice_e8701ad4` (`user_id`);

--
-- Indexes for table `finance_outboundinvoice`
--
ALTER TABLE `finance_outboundinvoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finance_outboundinvoic_account_id_a8fda777_fk_finance_account_id` (`account_id`),
  ADD KEY `finance_outbou_bussinessunit_id_7db6f61f_fk_organization_unit_id` (`bussinessunit_id`),
  ADD KEY `finance_outbound_costcenter_id_7e2d9ff0_fk_finance_costcenter_id` (`costcenter_id`),
  ADD KEY `finance_outboun_division_id_a8dd055b_fk_organization_division_id` (`division_id`),
  ADD KEY `finance_outboun_parent_id_0d2c2706_fk_finance_outboundinvoice_id` (`parent_id`),
  ADD KEY `D4ff0132e5c5562bf6b60c07b2febfd5` (`termsandcondition_id`),
  ADD KEY `finance_outboundinvoice_user_id_42dd900c_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `finance_outboundinvoiceqty`
--
ALTER TABLE `finance_outboundinvoiceqty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finance_outboun_division_id_f28b5a7c_fk_organization_division_id` (`division_id`),
  ADD KEY `finance_ou_hsn_id_fd8eea14_fk_clientRelationships_productmeta_id` (`hsn_id`),
  ADD KEY `finance_outbo_outBound_id_f8f9d6de_fk_finance_outboundinvoice_id` (`outBound_id`);

--
-- Indexes for table `finance_potermsandconditions`
--
ALTER TABLE `finance_potermsandconditions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finance_poterms_division_id_a7e1ae28_fk_organization_division_id` (`division_id`);

--
-- Indexes for table `finance_projectpettyexpense`
--
ALTER TABLE `finance_projectpettyexpense`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finance_projectpettyex_account_id_def3906b_fk_finance_account_id` (`account_id`),
  ADD KEY `finance_projectp_costCenter_id_082838df_fk_finance_costcenter_id` (`costCenter_id`),
  ADD KEY `finance_projectpettyexpe_createdUser_id_0c53d230_fk_auth_user_id` (`createdUser_id`),
  ADD KEY `finance_project_division_id_7a20c577_fk_organization_division_id` (`division_id`),
  ADD KEY `finance_project_heading_id_44ec779a_fk_finance_expenseheading_id` (`heading_id`);

--
-- Indexes for table `finance_purchaseorder`
--
ALTER TABLE `finance_purchaseorder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finance_purchaseorder_account_id_f69dd7f4_fk_finance_account_id` (`account_id`),
  ADD KEY `finance_purcha_bussinessunit_id_f5b8dafd_fk_organization_unit_id` (`bussinessunit_id`),
  ADD KEY `finance_purchase_costcenter_id_99fc340e_fk_finance_costcenter_id` (`costcenter_id`),
  ADD KEY `finance_purchas_division_id_4cbd9bdb_fk_organization_division_id` (`division_id`),
  ADD KEY `finance_purchaseo_parent_id_99508aee_fk_finance_purchaseorder_id` (`parent_id`),
  ADD KEY `finance_purchaseorder_requester_id_53c10ac3_fk_auth_user_id` (`requester_id`),
  ADD KEY `finance_purchaseorder_service_id_b4999c26_fk_ERP_service_id` (`service_id`),
  ADD KEY `e2a23a39f3e6a77930ce97a756bbb6f7` (`termsandcondition_id`),
  ADD KEY `finance_purchaseorder_user_id_a679577f_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `finance_purchaseorderqty`
--
ALTER TABLE `finance_purchaseorderqty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finance_purchas_division_id_b7d6c264_fk_organization_division_id` (`division_id`),
  ADD KEY `fi_productMeta_id_6fe405fc_fk_clientRelationships_productmeta_id` (`productMeta_id`),
  ADD KEY `finance_pu_purchaseorder_id_9d70c7ef_fk_finance_purchaseorder_id` (`purchaseorder_id`);

--
-- Indexes for table `finance_transaction`
--
ALTER TABLE `finance_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finance_transac_division_id_41d4a190_fk_organization_division_id` (`division_id`),
  ADD KEY `finance_transaction_fromAcc_id_af993795_fk_finance_account_id` (`fromAcc_id`),
  ADD KEY `finance_trans_outBound_id_11c791bc_fk_finance_outboundinvoice_id` (`outBound_id`),
  ADD KEY `finance_transaction_toAcc_id_3a610b10_fk_finance_account_id` (`toAcc_id`),
  ADD KEY `finance_transaction_user_id_6c085a0b_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `finance_vendorservice`
--
ALTER TABLE `finance_vendorservice`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `particular` (`particular`),
  ADD KEY `finance_vendors_division_id_f21c29d4_fk_organization_division_id` (`division_id`);

--
-- Indexes for table `gitweb_codecomment`
--
ALTER TABLE `gitweb_codecomment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gitweb_codecomment_9a8c79bf` (`repo_id`),
  ADD KEY `gitweb_codecomment_e8701ad4` (`user_id`);

--
-- Indexes for table `gitweb_commitnotification`
--
ALTER TABLE `gitweb_commitnotification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gitweb_commitnotification_9a8c79bf` (`repo_id`),
  ADD KEY `gitweb_commitnotification_e8701ad4` (`user_id`);

--
-- Indexes for table `gitweb_gitgroup`
--
ALTER TABLE `gitweb_gitgroup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gitweb_gitgroup_users`
--
ALTER TABLE `gitweb_gitgroup_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gitweb_gitgroup_users_gitgroup_id_df8ce445_uniq` (`gitgroup_id`,`user_id`),
  ADD KEY `gitweb_gitgroup_users_user_id_23eb2e80_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `gitweb_grouppermission`
--
ALTER TABLE `gitweb_grouppermission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gitweb_grouppermission_group_id_fb83dd77_fk_gitweb_gitgroup_id` (`group_id`);

--
-- Indexes for table `gitweb_repo`
--
ALTER TABLE `gitweb_repo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gitweb_repo_creator_id_f1ccc248_fk_auth_user_id` (`creator_id`),
  ADD KEY `gitweb_repo_b098ad43` (`project_id`);

--
-- Indexes for table `gitweb_repopermission`
--
ALTER TABLE `gitweb_repopermission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gitweb_repopermission_user_id_214e0ede_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `gitweb_repo_groups`
--
ALTER TABLE `gitweb_repo_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gitweb_repo_groups_repo_id_f9c9918b_uniq` (`repo_id`,`grouppermission_id`),
  ADD KEY `gitweb__grouppermission_id_69cef3dc_fk_gitweb_grouppermission_id` (`grouppermission_id`);

--
-- Indexes for table `gitweb_repo_perms`
--
ALTER TABLE `gitweb_repo_perms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gitweb_repo_perms_repo_id_f10ca09e_uniq` (`repo_id`,`repopermission_id`),
  ADD KEY `gitweb_re_repopermission_id_3e9bedfe_fk_gitweb_repopermission_id` (`repopermission_id`);

--
-- Indexes for table `HR_accountskey`
--
ALTER TABLE `HR_accountskey`
  ADD PRIMARY KEY (`id`),
  ADD KEY `HR_accountskey_user_id_b25390f8_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `HR_appraisal`
--
ALTER TABLE `HR_appraisal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `HR_appraisal_createdUser_id_7b802185_fk_auth_user_id` (`createdUser_id`),
  ADD KEY `HR_appraisal_hr_id_e1f1a64c_fk_auth_user_id` (`hr_id`),
  ADD KEY `HR_appraisal_manager_id_7b7ee56d_fk_auth_user_id` (`manager_id`),
  ADD KEY `HR_appraisal_superManager_id_074882c4_fk_auth_user_id` (`superManager_id`),
  ADD KEY `HR_appraisal_user_id_046a3957_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `HR_designation`
--
ALTER TABLE `HR_designation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `HR_designa_department_id_4ce0de84_fk_organization_departments_id` (`department_id`),
  ADD KEY `HR_designation_division_id_87189cea_fk_organization_division_id` (`division_id`),
  ADD KEY `HR_designation_hrApprover_id_d7fb45b7_fk_auth_user_id` (`hrApprover_id`),
  ADD KEY `HR_designation_primaryApprover_id_5f11c469_fk_auth_user_id` (`primaryApprover_id`),
  ADD KEY `HR_designation_reportingTo_id_826a0a88_fk_auth_user_id` (`reportingTo_id`),
  ADD KEY `HR_designation_role_id_c16ac094_fk_organization_role_id` (`role_id`),
  ADD KEY `HR_designation_secondaryApprover_id_e7d8c82f_fk_auth_user_id` (`secondaryApprover_id`),
  ADD KEY `HR_designation_f6a7ca40` (`team_id`),
  ADD KEY `HR_designation_e8175980` (`unit_id`);

--
-- Indexes for table `HR_designationlogs`
--
ALTER TABLE `HR_designationlogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `HR_designationlogs_createdUser_id_ca1843c7_fk_auth_user_id` (`createdUser_id`),
  ADD KEY `HR_desi_newDepartment_id_8c8ffdc7_fk_organization_departments_id` (`newDepartment_id`),
  ADD KEY `HR_designati_newDivision_id_11938a44_fk_organization_division_id` (`newDivision_id`),
  ADD KEY `HR_designationlogs_newHrApprover_id_90237597_fk_auth_user_id` (`newHrApprover_id`),
  ADD KEY `HR_designationlog_newPrimaryApprover_id_42b170f2_fk_auth_user_id` (`newPrimaryApprover_id`),
  ADD KEY `HR_designationlogs_newReportingTo_id_5737bd0b_fk_auth_user_id` (`newReportingTo_id`),
  ADD KEY `HR_designationlogs_newRole_id_9156a7e7_fk_organization_role_id` (`newRole_id`),
  ADD KEY `HR_designationl_newSecondaryApprover_id_76366b4b_fk_auth_user_id` (`newSecondaryApprover_id`),
  ADD KEY `HR_designationlogs_newUnit_id_27edcd14_fk_organization_unit_id` (`newUnit_id`),
  ADD KEY `HR_desi_oldDepartment_id_d074b777_fk_organization_departments_id` (`oldDepartment_id`),
  ADD KEY `HR_designati_oldDivision_id_2922e297_fk_organization_division_id` (`oldDivision_id`),
  ADD KEY `HR_designationlogs_oldHrApprover_id_2b83c2d5_fk_auth_user_id` (`oldHrApprover_id`),
  ADD KEY `HR_designationlog_oldPrimaryApprover_id_b1cd0230_fk_auth_user_id` (`oldPrimaryApprover_id`),
  ADD KEY `HR_designationlogs_oldReportingTo_id_6ae058c0_fk_auth_user_id` (`oldReportingTo_id`),
  ADD KEY `HR_designationlogs_oldRole_id_076cb9b9_fk_organization_role_id` (`oldRole_id`),
  ADD KEY `HR_designationl_oldSecondaryApprover_id_516c82ba_fk_auth_user_id` (`oldSecondaryApprover_id`),
  ADD KEY `HR_designationlogs_oldUnit_id_601a00da_fk_organization_unit_id` (`oldUnit_id`),
  ADD KEY `HR_designationlogs_user_id_2b2bab4d_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `HR_document`
--
ALTER TABLE `HR_document`
  ADD PRIMARY KEY (`id`),
  ADD KEY `HR_document_division_id_09015bb9_fk_organization_division_id` (`division_id`);

--
-- Indexes for table `HR_documents`
--
ALTER TABLE `HR_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `HR_documents_user_id_08f7584a_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `HR_exemployeesession`
--
ALTER TABLE `HR_exemployeesession`
  ADD PRIMARY KEY (`id`),
  ADD KEY `HR_exemployeesession_e8373d73` (`empProfile_id`);

--
-- Indexes for table `HR_exitmanagement`
--
ALTER TABLE `HR_exitmanagement`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `HR_exitmanagement_manager_id_cc1a88d0_fk_auth_user_id` (`manager_id`),
  ADD KEY `HR_exitmanagement_superManager_id_e88b8c50_fk_auth_user_id` (`superManager_id`);

--
-- Indexes for table `HR_leave`
--
ALTER TABLE `HR_leave`
  ADD PRIMARY KEY (`id`),
  ADD KEY `HR_leave_user_id_bce4ceb7_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `HR_leave_approvedBy`
--
ALTER TABLE `HR_leave_approvedBy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `HR_leave_approvedBy_leave_id_07a47b53_uniq` (`leave_id`,`user_id`),
  ADD KEY `HR_leave_approvedBy_user_id_43a6d946_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `HR_payroll`
--
ALTER TABLE `HR_payroll`
  ADD PRIMARY KEY (`id`),
  ADD KEY `HR_payroll_user_id_db65d513_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `HR_payrolllogs`
--
ALTER TABLE `HR_payrolllogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `HR_payrolllogs_createdUser_id_757b3d6b_fk_auth_user_id` (`createdUser_id`),
  ADD KEY `HR_payrolllogs_user_id_2b9e0ca1_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `HR_profile`
--
ALTER TABLE `HR_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `empID` (`empID`);

--
-- Indexes for table `HR_rank`
--
ALTER TABLE `HR_rank`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `HR_rank_user_id_542b75ed_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `HR_team`
--
ALTER TABLE `HR_team`
  ADD PRIMARY KEY (`id`),
  ADD KEY `HR_team_manager_id_009d5dd9_fk_auth_user_id` (`manager_id`),
  ADD KEY `HR_team_unit_id_284b3ea1_fk_organization_unit_id` (`unit_id`);

--
-- Indexes for table `HR_usertourtracker`
--
ALTER TABLE `HR_usertourtracker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `HR_usertourtracker_user_id_6e039f8a_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `HR_vendorprofile`
--
ALTER TABLE `HR_vendorprofile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_mailattachment`
--
ALTER TABLE `mail_mailattachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mail_mailattachment_user_id_f2818e91_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `mail_proxyaccount`
--
ALTER TABLE `mail_proxyaccount`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mail_proxyaccount_user_id_c39560a7_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `marketing_abbquotation`
--
ALTER TABLE `marketing_abbquotation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketing_abbquotationqtys`
--
ALTER TABLE `marketing_abbquotationqtys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketing_abbquotation_qtys`
--
ALTER TABLE `marketing_abbquotation_qtys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marketing_abbquotation_qtys_abbquotation_id_d8839b7e_uniq` (`abbquotation_id`,`abbquotationqtys_id`),
  ADD KEY `ma_abbquotationqtys_id_212d9a68_fk_marketing_abbquotationqtys_id` (`abbquotationqtys_id`);

--
-- Indexes for table `marketing_activity`
--
ALTER TABLE `marketing_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_activity_6d82f13d` (`contact_id`),
  ADD KEY `marketing_activity_2b3e9f9a` (`deal_id`),
  ADD KEY `marketing_activity_e8701ad4` (`user_id`);

--
-- Indexes for table `marketing_activity_contacts`
--
ALTER TABLE `marketing_activity_contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marketing_activity_contacts_activity_id_8c6a49c5_uniq` (`activity_id`,`contact_id`),
  ADD KEY `marketing_activity_c_contact_id_09d7c6f4_fk_marketing_contact_id` (`contact_id`);

--
-- Indexes for table `marketing_activity_internalUsers`
--
ALTER TABLE `marketing_activity_internalUsers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marketing_activity_internalUsers_activity_id_7730342d_uniq` (`activity_id`,`user_id`),
  ADD KEY `marketing_activity_internalUser_user_id_82ce2aa1_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `marketing_agreement`
--
ALTER TABLE `marketing_agreement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketing_agreement_engineers`
--
ALTER TABLE `marketing_agreement_engineers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marketing_agreement_engineers_agreement_id_dcd7add5_uniq` (`agreement_id`,`user_id`),
  ADD KEY `marketing_agreement_engineers_user_id_fa70fb68_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `marketing_campaign`
--
ALTER TABLE `marketing_campaign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_campaign_lead_id_c027e2c1_fk_auth_user_id` (`lead_id`),
  ADD KEY `marketing_campaign_parent_id_8cc6a1d7_fk_marketing_campaign_id` (`parent_id`),
  ADD KEY `marketing_campaign_team_id_2866bbea_fk_HR_team_id` (`team_id`);

--
-- Indexes for table `marketing_campaignitem`
--
ALTER TABLE `marketing_campaignitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_campaign_campaign_id_7db6093f_fk_marketing_campaign_id` (`campaign_id`),
  ADD KEY `marketing_campaignitem_6d82f13d` (`contact_id`),
  ADD KEY `marketing_campaignitem_5e7b1936` (`owner_id`);

--
-- Indexes for table `marketing_campaignlogs`
--
ALTER TABLE `marketing_campaignlogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_campaign_campaign_id_8ac9aba3_fk_marketing_campaign_id` (`campaign_id`),
  ADD KEY `marketing_campaignlogs_6d82f13d` (`contact_id`),
  ADD KEY `marketing_campaignlogs_e8701ad4` (`user_id`);

--
-- Indexes for table `marketing_campaigntracker`
--
ALTER TABLE `marketing_campaigntracker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketing_campaign_participants`
--
ALTER TABLE `marketing_campaign_participants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marketing_campaign_participants_campaign_id_f79b66f4_uniq` (`campaign_id`,`user_id`),
  ADD KEY `marketing_campaign_participants_user_id_86c660e4_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `marketing_chatthread`
--
ALTER TABLE `marketing_chatthread`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_chatthread_cb24373b` (`customer_id`),
  ADD KEY `marketing_chatthread_e8701ad4` (`user_id`);

--
-- Indexes for table `marketing_checkin`
--
ALTER TABLE `marketing_checkin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `serialNo` (`serialNo`),
  ADD KEY `marketing_checkin_6d82f13d` (`contact_id`),
  ADD KEY `marketing_checkin_7e834492` (`inwardQty_id`),
  ADD KEY `marketing_checkin_e8175980` (`unit_id`),
  ADD KEY `marketing_checkin_96b1f972` (`vendor_id`);

--
-- Indexes for table `marketing_contact`
--
ALTER TABLE `marketing_contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_contact_company_id_1e22e5eb_fk_ERP_service_id` (`company_id`),
  ADD KEY `marketing_contact_parent_id_05bb21ce_fk_marketing_contact_id` (`parent_id`),
  ADD KEY `marketing_contact_unit_id_ba4dd1ee_fk_organization_unit_id` (`unit_id`),
  ADD KEY `marketing_contact_user_id_d4ef4493_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `marketing_contacts`
--
ALTER TABLE `marketing_contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD KEY `marketing_contac_contact_ref_id_74d6e968_fk_marketing_contact_id` (`contact_ref_id`),
  ADD KEY `marketing_contacts_creater_id_c6047bef_fk_auth_user_id` (`creater_id`),
  ADD KEY `bcb01710f0a0b6ba2a01ba22a545650e` (`material_terms_id`),
  ADD KEY `marketing_contacts_product_id_a0b333e9_fk_finance_inventory_id` (`product_id`);

--
-- Indexes for table `marketing_contacts_tags`
--
ALTER TABLE `marketing_contacts_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marketing_contacts_tags_contacts_id_32073886_uniq` (`contacts_id`,`tag_id`),
  ADD KEY `marketing_contacts_tags_tag_id_635d9cdc_fk_marketing_tag_id` (`tag_id`);

--
-- Indexes for table `marketing_contract`
--
ALTER TABLE `marketing_contract`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_contract_contact_id_a5f03ab3_fk_marketing_contact_id` (`contact_id`),
  ADD KEY `marketing_contract_2fb72c6e` (`coupon_id`),
  ADD KEY `marketing_contract_2b3e9f9a` (`deal_id`),
  ADD KEY `marketing_contract_3a51337c` (`frm_id`),
  ADD KEY `marketing_contract_9a545204` (`termsAndCondition_id`),
  ADD KEY `marketing_contract_e8701ad4` (`user_id`);

--
-- Indexes for table `marketing_contracttracker`
--
ALTER TABLE `marketing_contracttracker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_contract_contract_id_c170cb5d_fk_marketing_contract_id` (`contract_id`),
  ADD KEY `marketing_contracttracker_user_id_b6bb539b_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `marketing_contract_products`
--
ALTER TABLE `marketing_contract_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marketing_contract_products_contract_id_8a9ed775_uniq` (`contract_id`,`productqtys_id`),
  ADD KEY `marketing_co_productqtys_id_ff27f946_fk_marketing_productqtys_id` (`productqtys_id`);

--
-- Indexes for table `marketing_crmtermsandconditions`
--
ALTER TABLE `marketing_crmtermsandconditions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_crmte_division_id_493b186e_fk_organization_division_id` (`division_id`);

--
-- Indexes for table `marketing_customersession`
--
ALTER TABLE `marketing_customersession`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_customersession_company_id_e4680485_fk_ERP_service_id` (`company_id`),
  ADD KEY `marketing_customerse_contact_id_b368bfaa_fk_marketing_contact_id` (`contact_id`);

--
-- Indexes for table `marketing_dc`
--
ALTER TABLE `marketing_dc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_dc_contact_id_e9e99a70_fk_marketing_contact_id` (`contact_id`),
  ADD KEY `marketing_dc_createdBy_id_bc71abec_fk_auth_user_id` (`createdBy_id`);

--
-- Indexes for table `marketing_dcqtymap`
--
ALTER TABLE `marketing_dcqtymap`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_dcqtymap_checkin_id_2ccf74c2_fk_marketing_checkin_id` (`checkin_id`),
  ADD KEY `marketing_dcqtymap_dc_id_dfa294c3_fk_marketing_dc_id` (`dc_id`);

--
-- Indexes for table `marketing_deal`
--
ALTER TABLE `marketing_deal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_deal_company_id_4458ce9b_fk_ERP_service_id` (`company_id`),
  ADD KEY `marketing_deal_user_id_17d1e54e_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `marketing_dealpaymentsterm`
--
ALTER TABLE `marketing_dealpaymentsterm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_dealpaymentste_parent_id_4d328c22_fk_marketing_deal_id` (`parent_id`);

--
-- Indexes for table `marketing_dealrequirement`
--
ALTER TABLE `marketing_dealrequirement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_dealrequiremen_parent_id_0a4486ed_fk_marketing_deal_id` (`parent_id`);

--
-- Indexes for table `marketing_deal_contacts`
--
ALTER TABLE `marketing_deal_contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marketing_deal_contacts_deal_id_9f42fe1b_uniq` (`deal_id`,`contact_id`),
  ADD KEY `marketing_deal_conta_contact_id_bab4bff5_fk_marketing_contact_id` (`contact_id`);

--
-- Indexes for table `marketing_deal_internalUsers`
--
ALTER TABLE `marketing_deal_internalUsers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marketing_deal_internalUsers_deal_id_3f79d809_uniq` (`deal_id`,`user_id`),
  ADD KEY `marketing_deal_internalUsers_user_id_7bcef19e_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `marketing_discount`
--
ALTER TABLE `marketing_discount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketing_engineersiteexpense`
--
ALTER TABLE `marketing_engineersiteexpense`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_engineersiteexpense_9365d6e7` (`site_id`);

--
-- Indexes for table `marketing_im`
--
ALTER TABLE `marketing_im`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_im_frm_id_62db6673_fk_marketing_contacts_id` (`frm_id`),
  ADD KEY `marketing_im_to_id_a5967af2_fk_marketing_contacts_id` (`to_id`);

--
-- Indexes for table `marketing_inward`
--
ALTER TABLE `marketing_inward`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_inward_unit_id_b61cc2a2_fk_organization_unit_id` (`unit_id`),
  ADD KEY `marketing_inward_vendor_id_ad7cabb5_fk_HR_vendorprofile_id` (`vendor_id`);

--
-- Indexes for table `marketing_inwardqty`
--
ALTER TABLE `marketing_inwardqty`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `serialNo` (`serialNo`),
  ADD KEY `marketing_inwardqty_inward_id_412e083a_fk_marketing_inward_id` (`inward_id`);

--
-- Indexes for table `marketing_legalagreement`
--
ALTER TABLE `marketing_legalagreement`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deal_id` (`deal_id`),
  ADD KEY `marketing_legalagreement_authrizer_id_9e40c800_fk_auth_user_id` (`authrizer_id`);

--
-- Indexes for table `marketing_legalagreementterms`
--
ALTER TABLE `marketing_legalagreementterms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_lega_parent_id_419d6779_fk_marketing_legalagreement_id` (`parent_id`);

--
-- Indexes for table `marketing_log`
--
ALTER TABLE `marketing_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_log_60fb6a05` (`plan_id`);

--
-- Indexes for table `marketing_notification`
--
ALTER TABLE `marketing_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketing_paymentreciepts`
--
ALTER TABLE `marketing_paymentreciepts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketing_productqtys`
--
ALTER TABLE `marketing_productqtys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketing_products`
--
ALTER TABLE `marketing_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_products_checkin_id_92be99e6_fk_marketing_checkin_id` (`checkin_id`),
  ADD KEY `marketing_products_contact_id_3096ff6d_fk_marketing_contact_id` (`contact_id`),
  ADD KEY `marketing_products_for_contact_id_919dde84_fk_marketing` (`for_contact_id`);

--
-- Indexes for table `marketing_proforma`
--
ALTER TABLE `marketing_proforma`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_proforma_d3e5ffc9` (`siteId_id`);

--
-- Indexes for table `marketing_proformaqtys`
--
ALTER TABLE `marketing_proformaqtys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketing_proforma_qtys`
--
ALTER TABLE `marketing_proforma_qtys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marketing_proforma_qtys_proforma_id_7971222e_uniq` (`proforma_id`,`proformaqtys_id`),
  ADD KEY `marketing__proformaqtys_id_9b6e20c3_fk_marketing_proformaqtys_id` (`proformaqtys_id`);

--
-- Indexes for table `marketing_purchaseorder`
--
ALTER TABLE `marketing_purchaseorder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketing_purchaseqty`
--
ALTER TABLE `marketing_purchaseqty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_purchaseq_po_id_9c6d9be1_fk_marketing_purchaseorder_id` (`po_id`),
  ADD KEY `marketing_purchaseqty_9365d6e7` (`site_id`);

--
-- Indexes for table `marketing_salespurchaseorder`
--
ALTER TABLE `marketing_salespurchaseorder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketing_salespurchaseorder_orderQtys`
--
ALTER TABLE `marketing_salespurchaseorder_orderQtys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marketing_salespurchaseorder_salespurchaseorder_id_eeb5f73b_uniq` (`salespurchaseorder_id`,`salesqtys_id`),
  ADD KEY `marketing_salesp_salesqtys_id_c4c46f0b_fk_marketing_salesqtys_id` (`salesqtys_id`);

--
-- Indexes for table `marketing_salesqtys`
--
ALTER TABLE `marketing_salesqtys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketing_schedule`
--
ALTER TABLE `marketing_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_schedule_organizer_id_e980a8c7_fk_auth_user_id` (`organizer_id`);

--
-- Indexes for table `marketing_schedule_participants`
--
ALTER TABLE `marketing_schedule_participants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marketing_schedule_participants_schedule_id_d226d029_uniq` (`schedule_id`,`user_id`),
  ADD KEY `marketing_schedule_participants_user_id_097fe3ce_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `marketing_site`
--
ALTER TABLE `marketing_site`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_site_branch_id_6b27072c_fk_organization_unit_id` (`branch_id`),
  ADD KEY `marketing_site_engineer_id_aaf63cf5_fk_auth_user_id` (`engineer_id`);

--
-- Indexes for table `marketing_siteadvance`
--
ALTER TABLE `marketing_siteadvance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_siteadvance_site_id_a531731f_fk_marketing_site_id` (`site_id`),
  ADD KEY `marketing_siteadvance_engineer_id_aff5ac58_fk_auth_user_id` (`engineer_id`);

--
-- Indexes for table `marketing_sitebills`
--
ALTER TABLE `marketing_sitebills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_sitebills_createdBy_id_d35da398_fk_auth_user_id` (`createdBy_id`),
  ADD KEY `marketing_sitebills_9365d6e7` (`site_id`);

--
-- Indexes for table `marketing_siteengineerattendance`
--
ALTER TABLE `marketing_siteengineerattendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_siteengineeratten_engineer_id_b28dd8b1_fk_auth_user_id` (`engineer_id`),
  ADD KEY `marketing_siteengineeratte_site_id_233ed56e_fk_marketing_site_id` (`site_id`);

--
-- Indexes for table `marketing_siteexpenses`
--
ALTER TABLE `marketing_siteexpenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_siteexpenses_site_id_c66afb55_fk_marketing_site_id` (`site_id`);

--
-- Indexes for table `marketing_sparerequest`
--
ALTER TABLE `marketing_sparerequest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_sparerequest_approvedBy_id_000b6942_fk_auth_user_id` (`approvedBy_id`),
  ADD KEY `marketing_sparerequest_2bacbf78` (`tourplanstop_id`);

--
-- Indexes for table `marketing_sparerequest_checkins`
--
ALTER TABLE `marketing_sparerequest_checkins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marketing_sparerequest_checkins_sparerequest_id_825c2940_uniq` (`sparerequest_id`,`checkin_id`),
  ADD KEY `marketing_sparereque_checkin_id_8ea06686_fk_marketing_checkin_id` (`checkin_id`);

--
-- Indexes for table `marketing_tag`
--
ALTER TABLE `marketing_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketing_ticketlog`
--
ALTER TABLE `marketing_ticketlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_ticketlog_649b92cd` (`ticket_id`);

--
-- Indexes for table `marketing_tourplan`
--
ALTER TABLE `marketing_tourplan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marketing_tourplan_date_2361d683_uniq` (`date`,`user_id`),
  ADD KEY `marketing_tourplan_user_id_e81550a4_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `marketing_tourplanstop`
--
ALTER TABLE `marketing_tourplanstop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_tourplanstop_assignedBy_id_91166b21_fk_auth_user_id` (`assignedBy_id`),
  ADD KEY `marketing_tourplanstop_cancelledBy_id_d7f32168_fk_auth_user_id` (`cancelledBy_id`),
  ADD KEY `marketing_tourplanst_checkin_id_e6c66d00_fk_marketing_checkin_id` (`checkin_id`),
  ADD KEY `marketing_tourplanst_contact_id_55266485_fk_marketing_contact_id` (`contact_id`),
  ADD KEY `marketing_tourplan_contract_id_6680eb0a_fk_marketing_contract_id` (`contract_id`),
  ADD KEY `marketing_tourp_division_id_4cf1b7cf_fk_organization_division_id` (`division_id`),
  ADD KEY `marketing_tourpla_expense_id_b3d21059_fk_finance_expensesheet_id` (`expense_id`),
  ADD KEY `marketing_tourplan_tourplan_id_ef9b798c_fk_marketing_tourplan_id` (`tourplan_id`),
  ADD KEY `marketing_tourplanstop_user_id_186cb4e9_fk_auth_user_id` (`user_id`),
  ADD KEY `marketing_tourplanstop_14e59264` (`amc_product_id`);

--
-- Indexes for table `marketing_tourplanstopindent`
--
ALTER TABLE `marketing_tourplanstopindent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing__tourplanstop_id_7d24ea7e_fk_marketing_tourplanstop_id` (`tourplanstop_id`);

--
-- Indexes for table `marketing_tourplanstop_afterPic`
--
ALTER TABLE `marketing_tourplanstop_afterPic`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marketing_tourplanstop_afterPic_tourplanstop_id_094b8da2_uniq` (`tourplanstop_id`,`media_id`),
  ADD KEY `marketing_tourplanstop_af_media_id_c2279c24_fk_projects_media_id` (`media_id`);

--
-- Indexes for table `marketing_tourplanstop_beforePic`
--
ALTER TABLE `marketing_tourplanstop_beforePic`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marketing_tourplanstop_beforePic_tourplanstop_id_9d5ef8da_uniq` (`tourplanstop_id`,`media_id`),
  ADD KEY `marketing_tourplanstop_be_media_id_2c625acf_fk_projects_media_id` (`media_id`);

--
-- Indexes for table `marketing_userassets`
--
ALTER TABLE `marketing_userassets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_userassets_engineer_id_a39af917_fk_auth_user_id` (`engineer_id`);

--
-- Indexes for table `organization_companyholidays`
--
ALTER TABLE `organization_companyholidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organization_companyholidays_9ff3405c` (`division_id`);

--
-- Indexes for table `organization_departments`
--
ALTER TABLE `organization_departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organization_departments_9ff3405c` (`division_id`);

--
-- Indexes for table `organization_departments_contacts`
--
ALTER TABLE `organization_departments_contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `organization_departments_contacts_departments_id_cdc7ccb6_uniq` (`departments_id`,`user_id`),
  ADD KEY `organization_departments_contac_user_id_30520ffe_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `organization_division`
--
ALTER TABLE `organization_division`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organization_homechart`
--
ALTER TABLE `organization_homechart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organization_ho_division_id_cd945a44_fk_organization_division_id` (`division_id`);

--
-- Indexes for table `organization_installedapp`
--
ALTER TABLE `organization_installedapp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `organization_installedapp_app_id_6250b8e4_uniq` (`app_id`,`parent_id`),
  ADD KEY `organization_installedapp_addedBy_id_3403e1c7_fk_auth_user_id` (`addedBy_id`),
  ADD KEY `organization_inst_parent_id_424a5ec5_fk_organization_division_id` (`parent_id`);

--
-- Indexes for table `organization_responsibility`
--
ALTER TABLE `organization_responsibility`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organization_responsibility_user_id_9e1f727e_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `organization_responsibility_departments`
--
ALTER TABLE `organization_responsibility_departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `organization_responsibility_depa_responsibility_id_6fcf5128_uniq` (`responsibility_id`,`departments_id`),
  ADD KEY `organizat_departments_id_08880b32_fk_organization_departments_id` (`departments_id`);

--
-- Indexes for table `organization_role`
--
ALTER TABLE `organization_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organization_ro_division_id_bfad4515_fk_organization_division_id` (`division_id`);

--
-- Indexes for table `organization_rolepermission`
--
ALTER TABLE `organization_rolepermission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organization_rolepermissio_app_id_a581f424_fk_ERP_application_id` (`app_id`),
  ADD KEY `organization_rolepermis_menuitem_id_e2c64611_fk_ERP_menuitems_id` (`menuitem_id`),
  ADD KEY `organization_rolepermis_role_id_fe6943d9_fk_organization_role_id` (`role_id`);

--
-- Indexes for table `organization_role_charts`
--
ALTER TABLE `organization_role_charts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `organization_role_charts_role_id_25c6a220_uniq` (`role_id`,`homechart_id`),
  ADD KEY `organization__homechart_id_a4e58bc6_fk_organization_homechart_id` (`homechart_id`);

--
-- Indexes for table `organization_role_permissions`
--
ALTER TABLE `organization_role_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `organization_role_permissions_role_id_f8214cac_uniq` (`role_id`,`application_id`),
  ADD KEY `organization_role__application_id_30b3b2a9_fk_ERP_application_id` (`application_id`);

--
-- Indexes for table `organization_role_reports`
--
ALTER TABLE `organization_role_reports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `organization_role_reports_role_id_6f1b08cd_uniq` (`role_id`,`homechart_id`),
  ADD KEY `organization__homechart_id_dea94877_fk_organization_homechart_id` (`homechart_id`);

--
-- Indexes for table `organization_unit`
--
ALTER TABLE `organization_unit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `organization_unit_name_3cd37f42_uniq` (`name`,`areaCode`),
  ADD KEY `organization_un_division_id_b8ad4f63_fk_organization_division_id` (`division_id`),
  ADD KEY `organization_unit_parent_id_ce577442_fk_organization_unit_id` (`parent_id`);

--
-- Indexes for table `paypal_ipn`
--
ALTER TABLE `paypal_ipn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paypal_ipn_8e113603` (`txn_id`);

--
-- Indexes for table `payroll_advances`
--
ALTER TABLE `payroll_advances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_advances_settlementUser_id_8da153bc_fk_auth_user_id` (`settlementUser_id`),
  ADD KEY `payroll_advances_user_id_6d833213_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `payroll_advances_approvers`
--
ALTER TABLE `payroll_advances_approvers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payroll_advances_approvers_advances_id_fa1b1ab3_uniq` (`advances_id`,`user_id`),
  ADD KEY `payroll_advances_approvers_user_id_d49b8103_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `payroll_disbursal`
--
ALTER TABLE `payroll_disbursal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_disbursal_account_id_4335445b_fk_finance_account_id` (`account_id`);

--
-- Indexes for table `payroll_itdecaration`
--
ALTER TABLE `payroll_itdecaration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payroll_itdecaration_user_id_f836dfd2_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `payroll_monthlypayslip`
--
ALTER TABLE `payroll_monthlypayslip`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payroll_monthlypayslip_year_95c8e815_uniq` (`year`,`month`,`user_id`),
  ADD KEY `payroll_monthlypayslip_user_id_70c21417_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `payroll_payrollreport`
--
ALTER TABLE `payroll_payrollreport`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payroll_payrollreport_year_9ad3fd1f_uniq` (`year`,`month`),
  ADD KEY `payroll_payrollreport_user_id_2006454f_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `payroll_payslip`
--
ALTER TABLE `payroll_payslip`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payroll_payslip_year_bb04aeeb_uniq` (`year`,`month`,`user_id`),
  ADD KEY `payroll_payslip_report_id_8653abc4_fk_payroll_payrollreport_id` (`report_id`),
  ADD KEY `payroll_payslip_user_id_505eb98b_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `performance_feedback`
--
ALTER TABLE `performance_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `performance_feedback_user_id_48ec773c_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `performance_timesheet`
--
ALTER TABLE `performance_timesheet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `performance_timesheet_user_id_3553ebce_uniq` (`user_id`,`date`);

--
-- Indexes for table `performance_timesheet_approvedBy`
--
ALTER TABLE `performance_timesheet_approvedBy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `performance_timesheet_approvedBy_timesheet_id_6d871bd4_uniq` (`timesheet_id`,`user_id`),
  ADD KEY `performance_timesheet_approvedB_user_id_635f71b6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `PIM_calendar`
--
ALTER TABLE `PIM_calendar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PIM_calend_campaignItem_id_06fec3d4_fk_marketing_campaignitem_id` (`campaignItem_id`),
  ADD KEY `PIM_calendar_300ddc5f` (`orginatedBy_id`),
  ADD KEY `PIM_calendar_e8701ad4` (`user_id`);

--
-- Indexes for table `PIM_calendar_clients`
--
ALTER TABLE `PIM_calendar_clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `PIM_calendar_clients_calendar_id_f7099d20_uniq` (`calendar_id`,`contact_id`),
  ADD KEY `PIM_calendar_clients_contact_id_6a0bea19_fk_marketing_contact_id` (`contact_id`);

--
-- Indexes for table `PIM_calendar_followers`
--
ALTER TABLE `PIM_calendar_followers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `PIM_calendar_followers_calendar_id_aaf95f79_uniq` (`calendar_id`,`user_id`),
  ADD KEY `PIM_calendar_followers_user_id_a5342bea_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `PIM_calendar_notifications`
--
ALTER TABLE `PIM_calendar_notifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `PIM_calendar_notifications_calendar_id_103d7ded_uniq` (`calendar_id`,`notification_id`),
  ADD KEY `PIM_calendar_not_notification_id_0bd68716_fk_PIM_notification_id` (`notification_id`);

--
-- Indexes for table `PIM_chatmessage`
--
ALTER TABLE `PIM_chatmessage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PIM_chatmessage_originator_id_d7755173_fk_auth_user_id` (`originator_id`),
  ADD KEY `PIM_chatmessage_user_id_c3612e40_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `PIM_notebook`
--
ALTER TABLE `PIM_notebook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PIM_notebook_user_id_069e4add_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `PIM_notification`
--
ALTER TABLE `PIM_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PIM_notification_orginatedBy_id_50c02149_fk_auth_user_id` (`orginatedBy_id`),
  ADD KEY `PIM_notification_user_id_d47d452d_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `PIM_page`
--
ALTER TABLE `PIM_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PIM_page_parent_id_048dd85f_fk_PIM_notebook_id` (`parent_id`),
  ADD KEY `PIM_page_user_id_90724495_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `PIM_settings`
--
ALTER TABLE `PIM_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `PIM_theme`
--
ALTER TABLE `PIM_theme`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `parent_id` (`parent_id`);

--
-- Indexes for table `projects_comment`
--
ALTER TABLE `projects_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_comment_35bf24f6` (`media_id`),
  ADD KEY `projects_comment_e8701ad4` (`user_id`);

--
-- Indexes for table `projects_issues`
--
ALTER TABLE `projects_issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_issues_b098ad43` (`project_id`),
  ADD KEY `projects_issues_4c66c5b6` (`responsible_id`);

--
-- Indexes for table `projects_media`
--
ALTER TABLE `projects_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_media_user_id_b42778bc_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `projects_project`
--
ALTER TABLE `projects_project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_project_company_id_66b5c58b_fk_ERP_service_id` (`company_id`),
  ADD KEY `projects_project_costCenter_id_69ba0765_fk_finance_costcenter_id` (`costCenter_id`),
  ADD KEY `projects_project_user_id_719f19dd_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `projects_projectcomment`
--
ALTER TABLE `projects_projectcomment`
  ADD PRIMARY KEY (`comment_ptr_id`),
  ADD KEY `projects_projectcomme_project_id_c9cb523e_fk_projects_project_id` (`project_id`);

--
-- Indexes for table `projects_projectobjective`
--
ALTER TABLE `projects_projectobjective`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_projectobject_parent_id_5d36e6b5_fk_projects_project_id` (`parent_id`),
  ADD KEY `projects_projectobjective_user_id_e44ca8de_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `projects_project_expenseSheets`
--
ALTER TABLE `projects_project_expenseSheets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `projects_project_expenseSheets_project_id_50d1da10_uniq` (`project_id`,`expensesheet_id`),
  ADD KEY `projects_pro_expensesheet_id_b338eb18_fk_finance_expensesheet_id` (`expensesheet_id`);

--
-- Indexes for table `projects_project_files`
--
ALTER TABLE `projects_project_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `projects_project_files_project_id_15b429bb_uniq` (`project_id`,`media_id`),
  ADD KEY `projects_project_files_media_id_ec281eb7_fk_projects_media_id` (`media_id`);

--
-- Indexes for table `projects_project_invoices`
--
ALTER TABLE `projects_project_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `projects_project_invoices_project_id_d37dcd58_uniq` (`project_id`,`expensesheet_id`),
  ADD KEY `projects_pro_expensesheet_id_ebb178e4_fk_finance_expensesheet_id` (`expensesheet_id`);

--
-- Indexes for table `projects_project_ourBoundInvoices`
--
ALTER TABLE `projects_project_ourBoundInvoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `projects_project_ourBoundInvoices_project_id_a4750e43_uniq` (`project_id`,`outboundinvoice_id`),
  ADD KEY `projec_outboundinvoice_id_c911d551_fk_finance_outboundinvoice_id` (`outboundinvoice_id`);

--
-- Indexes for table `projects_project_team`
--
ALTER TABLE `projects_project_team`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `projects_project_team_project_id_164eca34_uniq` (`project_id`,`user_id`),
  ADD KEY `projects_project_team_user_id_af44563f_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `projects_timelineitem`
--
ALTER TABLE `projects_timelineitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_timelineitem_project_id_0b9e57ba_fk_projects_project_id` (`project_id`),
  ADD KEY `projects_timelineitem_user_id_b6d5790f_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `recruitment_interview`
--
ALTER TABLE `recruitment_interview`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recruitment_interview_da445ead` (`candidate_id`),
  ADD KEY `recruitment_interview_cb0f7719` (`interviewer_id`);

--
-- Indexes for table `recruitment_jobapplication`
--
ALTER TABLE `recruitment_jobapplication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recruitment_jobapplication_d697ea38` (`job_id`);

--
-- Indexes for table `recruitment_jobs`
--
ALTER TABLE `recruitment_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recruitmen_department_id_56f7239f_fk_organization_departments_id` (`department_id`),
  ADD KEY `recruitment_jobs_role_id_4bdf077d_fk_organization_role_id` (`role_id`),
  ADD KEY `recruitment_jobs_unit_id_8bc1cc51_fk_organization_unit_id` (`unit_id`);

--
-- Indexes for table `recruitment_jobs_contacts`
--
ALTER TABLE `recruitment_jobs_contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `recruitment_jobs_contacts_jobs_id_2d365d72_uniq` (`jobs_id`,`user_id`),
  ADD KEY `recruitment_jobs_contacts_user_id_24455a4d_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `robots_rule`
--
ALTER TABLE `robots_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `robots_rule_allowed`
--
ALTER TABLE `robots_rule_allowed`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `robots_rule_allowed_rule_id_83b262d4_uniq` (`rule_id`,`url_id`),
  ADD KEY `robots_rule_allowed_url_id_6157f60a_fk_robots_url_id` (`url_id`);

--
-- Indexes for table `robots_rule_disallowed`
--
ALTER TABLE `robots_rule_disallowed`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `robots_rule_disallowed_rule_id_4d9b6222_uniq` (`rule_id`,`url_id`),
  ADD KEY `robots_rule_disallowed_url_id_8e02db92_fk_robots_url_id` (`url_id`);

--
-- Indexes for table `robots_rule_sites`
--
ALTER TABLE `robots_rule_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `robots_rule_sites_rule_id_093f04ea_uniq` (`rule_id`,`site_id`),
  ADD KEY `robots_rule_sites_site_id_efe5be97_fk_django_site_id` (`site_id`);

--
-- Indexes for table `robots_url`
--
ALTER TABLE `robots_url`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_album`
--
ALTER TABLE `social_album`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_album_user_id_440fee33_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `social_albumfollower`
--
ALTER TABLE `social_albumfollower`
  ADD PRIMARY KEY (`follow_ptr_id`),
  ADD KEY `social_albumfollower_parent_id_09827ebc_fk_social_album_id` (`parent_id`);

--
-- Indexes for table `social_album_tagged`
--
ALTER TABLE `social_album_tagged`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `social_album_tagged_album_id_df40fff7_uniq` (`album_id`,`user_id`),
  ADD KEY `social_album_tagged_user_id_70b3e088_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `social_comment`
--
ALTER TABLE `social_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_comment_e8701ad4` (`user_id`);

--
-- Indexes for table `social_commentlike`
--
ALTER TABLE `social_commentlike`
  ADD PRIMARY KEY (`like_ptr_id`),
  ADD KEY `social_commentlike_6be37982` (`parent_id`);

--
-- Indexes for table `social_comment_tagged`
--
ALTER TABLE `social_comment_tagged`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `social_comment_tagged_comment_id_32d4f9de_uniq` (`comment_id`,`user_id`),
  ADD KEY `social_comment_tagged_user_id_ea322eda_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `social_follow`
--
ALTER TABLE `social_follow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_follow_e8701ad4` (`user_id`);

--
-- Indexes for table `social_like`
--
ALTER TABLE `social_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_like_e8701ad4` (`user_id`);

--
-- Indexes for table `social_picture`
--
ALTER TABLE `social_picture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_picture_album_id_95e565a3_fk_social_album_id` (`album_id`),
  ADD KEY `social_picture_user_id_9a114117_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `social_picturecomment`
--
ALTER TABLE `social_picturecomment`
  ADD PRIMARY KEY (`comment_ptr_id`),
  ADD KEY `social_picturecomment_parent_id_60d647f4_fk_social_picture_id` (`parent_id`);

--
-- Indexes for table `social_picturelike`
--
ALTER TABLE `social_picturelike`
  ADD PRIMARY KEY (`like_ptr_id`),
  ADD KEY `social_picturelike_parent_id_10a2a264_fk_social_picture_id` (`parent_id`);

--
-- Indexes for table `social_picture_tagged`
--
ALTER TABLE `social_picture_tagged`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `social_picture_tagged_picture_id_f191a0be_uniq` (`picture_id`,`user_id`),
  ADD KEY `social_picture_tagged_user_id_e2d38f81_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `social_post`
--
ALTER TABLE `social_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_post_user_id_6317b44d_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `social_postcomment`
--
ALTER TABLE `social_postcomment`
  ADD PRIMARY KEY (`comment_ptr_id`),
  ADD KEY `social_postcomment_parent_id_7df8b855_fk_social_post_id` (`parent_id`);

--
-- Indexes for table `social_postfollower`
--
ALTER TABLE `social_postfollower`
  ADD PRIMARY KEY (`follow_ptr_id`),
  ADD KEY `social_postfollower_parent_id_5728ae71_fk_social_post_id` (`parent_id`);

--
-- Indexes for table `social_posthistory`
--
ALTER TABLE `social_posthistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_posthistory_parent_id_a15bf345_fk_social_post_id` (`parent_id`);

--
-- Indexes for table `social_postlike`
--
ALTER TABLE `social_postlike`
  ADD PRIMARY KEY (`like_ptr_id`),
  ADD KEY `social_postlike_parent_id_c7dc74e7_fk_social_post_id` (`parent_id`);

--
-- Indexes for table `social_post_tagged`
--
ALTER TABLE `social_post_tagged`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `social_post_tagged_post_id_53954d6a_uniq` (`post_id`,`user_id`),
  ADD KEY `social_post_tagged_user_id_df9d0305_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `social_publications`
--
ALTER TABLE `social_publications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_publications_author_id_e528ab94_fk_auth_user_id` (`author_id`);

--
-- Indexes for table `social_skill`
--
ALTER TABLE `social_skill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_skill_user_id_7b36aaef_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `social_skill_endoresement`
--
ALTER TABLE `social_skill_endoresement`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `social_skill_endoresement_skill_id_a92b7c36_uniq` (`skill_id`,`user_id`),
  ADD KEY `social_skill_endoresement_user_id_81d66d72_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `social_social`
--
ALTER TABLE `social_social`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `social_social_followers`
--
ALTER TABLE `social_social_followers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `social_social_followers_social_id_bf518846_uniq` (`social_id`,`user_id`),
  ADD KEY `social_social_followers_user_id_bf8e73f9_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `taskBoard_media`
--
ALTER TABLE `taskBoard_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taskBoard_media_user_id_249b23da_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `taskBoard_subtask`
--
ALTER TABLE `taskBoard_subtask`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taskBoard_subtask_57746cc8` (`task_id`),
  ADD KEY `taskBoard_subtask_e8701ad4` (`user_id`);

--
-- Indexes for table `taskBoard_task`
--
ALTER TABLE `taskBoard_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taskBoard_task_project_id_f20bed10_fk_projects_project_id` (`project_id`),
  ADD KEY `taskBoard_task_to_id_1ad03dcd_fk_auth_user_id` (`to_id`),
  ADD KEY `taskBoard_task_user_id_83902c50_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `taskBoard_taskworkbook`
--
ALTER TABLE `taskBoard_taskworkbook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taskBoard_taskworkbook_user_id_7df7bd4f_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `taskBoard_task_files`
--
ALTER TABLE `taskBoard_task_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taskBoard_task_files_task_id_62bc9c54_uniq` (`task_id`,`media_id`),
  ADD KEY `taskBoard_task_files_media_id_4ca22d30_fk_taskBoard_media_id` (`media_id`);

--
-- Indexes for table `taskBoard_task_followers`
--
ALTER TABLE `taskBoard_task_followers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taskBoard_task_followers_task_id_f3a1ff3d_uniq` (`task_id`,`user_id`),
  ADD KEY `taskBoard_task_followers_user_id_26504e38_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `taskBoard_timelineitem`
--
ALTER TABLE `taskBoard_timelineitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taskBoard_tim_commit_id_f5b0287a_fk_gitweb_commitnotification_id` (`commit_id`),
  ADD KEY `taskBoard_timelineitem_task_id_2c697ee0_fk_taskBoard_task_id` (`task_id`),
  ADD KEY `taskBoard_timelineitem_user_id_af67d305_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `website_components`
--
ALTER TABLE `website_components`
  ADD PRIMARY KEY (`id`),
  ADD KEY `website_components_parent_id_d838db78_fk_website_page_id` (`parent_id`);

--
-- Indexes for table `website_page`
--
ALTER TABLE `website_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `website_uielementtemplate`
--
ALTER TABLE `website_uielementtemplate`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assets_asset`
--
ALTER TABLE `assets_asset`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assets_assetaddon`
--
ALTER TABLE `assets_assetaddon`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assets_contactproducts`
--
ALTER TABLE `assets_contactproducts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assets_indent`
--
ALTER TABLE `assets_indent`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assets_indentasset`
--
ALTER TABLE `assets_indentasset`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assets_indentqtymap`
--
ALTER TABLE `assets_indentqtymap`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assets_min`
--
ALTER TABLE `assets_min`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=589;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clientRelationships_emailtemplate`
--
ALTER TABLE `clientRelationships_emailtemplate`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clientRelationships_emailtemplate_files`
--
ALTER TABLE `clientRelationships_emailtemplate_files`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clientRelationships_files`
--
ALTER TABLE `clientRelationships_files`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clientRelationships_productmeta`
--
ALTER TABLE `clientRelationships_productmeta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clientRelationships_schedule`
--
ALTER TABLE `clientRelationships_schedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clientRelationships_schedule_users`
--
ALTER TABLE `clientRelationships_schedule_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clientRelationships_termsandconditions`
--
ALTER TABLE `clientRelationships_termsandconditions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `django_site`
--
ALTER TABLE `django_site`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employees_complaints`
--
ALTER TABLE `employees_complaints`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees_systemlog`
--
ALTER TABLE `employees_systemlog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ERP_address`
--
ALTER TABLE `ERP_address`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ERP_apiusage`
--
ALTER TABLE `ERP_apiusage`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ERP_application`
--
ALTER TABLE `ERP_application`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT for table `ERP_appsettingsfield`
--
ALTER TABLE `ERP_appsettingsfield`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ERP_bankloan`
--
ALTER TABLE `ERP_bankloan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ERP_device`
--
ALTER TABLE `ERP_device`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ERP_genericpincode`
--
ALTER TABLE `ERP_genericpincode`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ERP_grouppermission`
--
ALTER TABLE `ERP_grouppermission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ERP_media`
--
ALTER TABLE `ERP_media`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ERP_menuitems`
--
ALTER TABLE `ERP_menuitems`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `ERP_module`
--
ALTER TABLE `ERP_module`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ERP_permission`
--
ALTER TABLE `ERP_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ERP_profile`
--
ALTER TABLE `ERP_profile`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ERP_profile_devices`
--
ALTER TABLE `ERP_profile_devices`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ERP_publicapikeys`
--
ALTER TABLE `ERP_publicapikeys`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ERP_service`
--
ALTER TABLE `ERP_service`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `finance_account`
--
ALTER TABLE `finance_account`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_account_authorizedSignaturies`
--
ALTER TABLE `finance_account_authorizedSignaturies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_configuretermsandconditions`
--
ALTER TABLE `finance_configuretermsandconditions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_costcenter`
--
ALTER TABLE `finance_costcenter`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_expenseheading`
--
ALTER TABLE `finance_expenseheading`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_expensesheet`
--
ALTER TABLE `finance_expensesheet`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_inflow`
--
ALTER TABLE `finance_inflow`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_inventory`
--
ALTER TABLE `finance_inventory`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_inventorylog`
--
ALTER TABLE `finance_inventorylog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_invoice`
--
ALTER TABLE `finance_invoice`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_outboundinvoice`
--
ALTER TABLE `finance_outboundinvoice`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_outboundinvoiceqty`
--
ALTER TABLE `finance_outboundinvoiceqty`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_potermsandconditions`
--
ALTER TABLE `finance_potermsandconditions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_projectpettyexpense`
--
ALTER TABLE `finance_projectpettyexpense`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_purchaseorder`
--
ALTER TABLE `finance_purchaseorder`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_purchaseorderqty`
--
ALTER TABLE `finance_purchaseorderqty`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_transaction`
--
ALTER TABLE `finance_transaction`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_vendorservice`
--
ALTER TABLE `finance_vendorservice`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gitweb_codecomment`
--
ALTER TABLE `gitweb_codecomment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gitweb_commitnotification`
--
ALTER TABLE `gitweb_commitnotification`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gitweb_gitgroup`
--
ALTER TABLE `gitweb_gitgroup`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gitweb_gitgroup_users`
--
ALTER TABLE `gitweb_gitgroup_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gitweb_grouppermission`
--
ALTER TABLE `gitweb_grouppermission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gitweb_repo`
--
ALTER TABLE `gitweb_repo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gitweb_repopermission`
--
ALTER TABLE `gitweb_repopermission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gitweb_repo_groups`
--
ALTER TABLE `gitweb_repo_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gitweb_repo_perms`
--
ALTER TABLE `gitweb_repo_perms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `HR_accountskey`
--
ALTER TABLE `HR_accountskey`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `HR_appraisal`
--
ALTER TABLE `HR_appraisal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `HR_designation`
--
ALTER TABLE `HR_designation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `HR_designationlogs`
--
ALTER TABLE `HR_designationlogs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `HR_document`
--
ALTER TABLE `HR_document`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `HR_documents`
--
ALTER TABLE `HR_documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `HR_exemployeesession`
--
ALTER TABLE `HR_exemployeesession`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `HR_exitmanagement`
--
ALTER TABLE `HR_exitmanagement`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `HR_leave`
--
ALTER TABLE `HR_leave`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `HR_leave_approvedBy`
--
ALTER TABLE `HR_leave_approvedBy`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `HR_payroll`
--
ALTER TABLE `HR_payroll`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `HR_payrolllogs`
--
ALTER TABLE `HR_payrolllogs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `HR_profile`
--
ALTER TABLE `HR_profile`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `HR_rank`
--
ALTER TABLE `HR_rank`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `HR_team`
--
ALTER TABLE `HR_team`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `HR_usertourtracker`
--
ALTER TABLE `HR_usertourtracker`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `HR_vendorprofile`
--
ALTER TABLE `HR_vendorprofile`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mail_mailattachment`
--
ALTER TABLE `mail_mailattachment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mail_proxyaccount`
--
ALTER TABLE `mail_proxyaccount`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_abbquotation`
--
ALTER TABLE `marketing_abbquotation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `marketing_abbquotationqtys`
--
ALTER TABLE `marketing_abbquotationqtys`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `marketing_abbquotation_qtys`
--
ALTER TABLE `marketing_abbquotation_qtys`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `marketing_activity`
--
ALTER TABLE `marketing_activity`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_activity_contacts`
--
ALTER TABLE `marketing_activity_contacts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_activity_internalUsers`
--
ALTER TABLE `marketing_activity_internalUsers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_agreement`
--
ALTER TABLE `marketing_agreement`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `marketing_agreement_engineers`
--
ALTER TABLE `marketing_agreement_engineers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_campaign`
--
ALTER TABLE `marketing_campaign`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_campaignitem`
--
ALTER TABLE `marketing_campaignitem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_campaignlogs`
--
ALTER TABLE `marketing_campaignlogs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_campaigntracker`
--
ALTER TABLE `marketing_campaigntracker`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_campaign_participants`
--
ALTER TABLE `marketing_campaign_participants`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_chatthread`
--
ALTER TABLE `marketing_chatthread`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_checkin`
--
ALTER TABLE `marketing_checkin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `marketing_contact`
--
ALTER TABLE `marketing_contact`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `marketing_contacts`
--
ALTER TABLE `marketing_contacts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_contacts_tags`
--
ALTER TABLE `marketing_contacts_tags`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_contract`
--
ALTER TABLE `marketing_contract`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `marketing_contracttracker`
--
ALTER TABLE `marketing_contracttracker`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `marketing_contract_products`
--
ALTER TABLE `marketing_contract_products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `marketing_crmtermsandconditions`
--
ALTER TABLE `marketing_crmtermsandconditions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_customersession`
--
ALTER TABLE `marketing_customersession`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_dc`
--
ALTER TABLE `marketing_dc`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_dcqtymap`
--
ALTER TABLE `marketing_dcqtymap`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_deal`
--
ALTER TABLE `marketing_deal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_dealpaymentsterm`
--
ALTER TABLE `marketing_dealpaymentsterm`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_dealrequirement`
--
ALTER TABLE `marketing_dealrequirement`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_deal_contacts`
--
ALTER TABLE `marketing_deal_contacts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_deal_internalUsers`
--
ALTER TABLE `marketing_deal_internalUsers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_discount`
--
ALTER TABLE `marketing_discount`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_engineersiteexpense`
--
ALTER TABLE `marketing_engineersiteexpense`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `marketing_im`
--
ALTER TABLE `marketing_im`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_inward`
--
ALTER TABLE `marketing_inward`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_inwardqty`
--
ALTER TABLE `marketing_inwardqty`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_legalagreement`
--
ALTER TABLE `marketing_legalagreement`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_legalagreementterms`
--
ALTER TABLE `marketing_legalagreementterms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_log`
--
ALTER TABLE `marketing_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_notification`
--
ALTER TABLE `marketing_notification`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_paymentreciepts`
--
ALTER TABLE `marketing_paymentreciepts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `marketing_productqtys`
--
ALTER TABLE `marketing_productqtys`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `marketing_products`
--
ALTER TABLE `marketing_products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `marketing_proforma`
--
ALTER TABLE `marketing_proforma`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_proformaqtys`
--
ALTER TABLE `marketing_proformaqtys`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_proforma_qtys`
--
ALTER TABLE `marketing_proforma_qtys`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_purchaseorder`
--
ALTER TABLE `marketing_purchaseorder`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `marketing_purchaseqty`
--
ALTER TABLE `marketing_purchaseqty`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_salespurchaseorder`
--
ALTER TABLE `marketing_salespurchaseorder`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_salespurchaseorder_orderQtys`
--
ALTER TABLE `marketing_salespurchaseorder_orderQtys`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_salesqtys`
--
ALTER TABLE `marketing_salesqtys`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_schedule`
--
ALTER TABLE `marketing_schedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_schedule_participants`
--
ALTER TABLE `marketing_schedule_participants`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_site`
--
ALTER TABLE `marketing_site`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `marketing_siteadvance`
--
ALTER TABLE `marketing_siteadvance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `marketing_sitebills`
--
ALTER TABLE `marketing_sitebills`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `marketing_siteengineerattendance`
--
ALTER TABLE `marketing_siteengineerattendance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `marketing_siteexpenses`
--
ALTER TABLE `marketing_siteexpenses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `marketing_sparerequest`
--
ALTER TABLE `marketing_sparerequest`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_sparerequest_checkins`
--
ALTER TABLE `marketing_sparerequest_checkins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_tag`
--
ALTER TABLE `marketing_tag`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_ticketlog`
--
ALTER TABLE `marketing_ticketlog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `marketing_tourplan`
--
ALTER TABLE `marketing_tourplan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_tourplanstop`
--
ALTER TABLE `marketing_tourplanstop`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `marketing_tourplanstopindent`
--
ALTER TABLE `marketing_tourplanstopindent`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_tourplanstop_afterPic`
--
ALTER TABLE `marketing_tourplanstop_afterPic`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_tourplanstop_beforePic`
--
ALTER TABLE `marketing_tourplanstop_beforePic`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_userassets`
--
ALTER TABLE `marketing_userassets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `organization_companyholidays`
--
ALTER TABLE `organization_companyholidays`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organization_departments`
--
ALTER TABLE `organization_departments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organization_departments_contacts`
--
ALTER TABLE `organization_departments_contacts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organization_division`
--
ALTER TABLE `organization_division`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `organization_homechart`
--
ALTER TABLE `organization_homechart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organization_installedapp`
--
ALTER TABLE `organization_installedapp`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organization_responsibility`
--
ALTER TABLE `organization_responsibility`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organization_responsibility_departments`
--
ALTER TABLE `organization_responsibility_departments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organization_role`
--
ALTER TABLE `organization_role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `organization_rolepermission`
--
ALTER TABLE `organization_rolepermission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `organization_role_charts`
--
ALTER TABLE `organization_role_charts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organization_role_permissions`
--
ALTER TABLE `organization_role_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organization_role_reports`
--
ALTER TABLE `organization_role_reports`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organization_unit`
--
ALTER TABLE `organization_unit`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `paypal_ipn`
--
ALTER TABLE `paypal_ipn`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_advances`
--
ALTER TABLE `payroll_advances`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_advances_approvers`
--
ALTER TABLE `payroll_advances_approvers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_disbursal`
--
ALTER TABLE `payroll_disbursal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_itdecaration`
--
ALTER TABLE `payroll_itdecaration`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_monthlypayslip`
--
ALTER TABLE `payroll_monthlypayslip`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_payrollreport`
--
ALTER TABLE `payroll_payrollreport`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll_payslip`
--
ALTER TABLE `payroll_payslip`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `performance_feedback`
--
ALTER TABLE `performance_feedback`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `performance_timesheet`
--
ALTER TABLE `performance_timesheet`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `performance_timesheet_approvedBy`
--
ALTER TABLE `performance_timesheet_approvedBy`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PIM_calendar`
--
ALTER TABLE `PIM_calendar`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PIM_calendar_clients`
--
ALTER TABLE `PIM_calendar_clients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PIM_calendar_followers`
--
ALTER TABLE `PIM_calendar_followers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PIM_calendar_notifications`
--
ALTER TABLE `PIM_calendar_notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PIM_chatmessage`
--
ALTER TABLE `PIM_chatmessage`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PIM_notebook`
--
ALTER TABLE `PIM_notebook`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PIM_notification`
--
ALTER TABLE `PIM_notification`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PIM_page`
--
ALTER TABLE `PIM_page`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PIM_settings`
--
ALTER TABLE `PIM_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `PIM_theme`
--
ALTER TABLE `PIM_theme`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `projects_comment`
--
ALTER TABLE `projects_comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects_issues`
--
ALTER TABLE `projects_issues`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects_media`
--
ALTER TABLE `projects_media`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects_project`
--
ALTER TABLE `projects_project`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects_projectobjective`
--
ALTER TABLE `projects_projectobjective`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects_project_expenseSheets`
--
ALTER TABLE `projects_project_expenseSheets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects_project_files`
--
ALTER TABLE `projects_project_files`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects_project_invoices`
--
ALTER TABLE `projects_project_invoices`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects_project_ourBoundInvoices`
--
ALTER TABLE `projects_project_ourBoundInvoices`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects_project_team`
--
ALTER TABLE `projects_project_team`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects_timelineitem`
--
ALTER TABLE `projects_timelineitem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recruitment_interview`
--
ALTER TABLE `recruitment_interview`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recruitment_jobapplication`
--
ALTER TABLE `recruitment_jobapplication`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recruitment_jobs`
--
ALTER TABLE `recruitment_jobs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recruitment_jobs_contacts`
--
ALTER TABLE `recruitment_jobs_contacts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `robots_rule`
--
ALTER TABLE `robots_rule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `robots_rule_allowed`
--
ALTER TABLE `robots_rule_allowed`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `robots_rule_disallowed`
--
ALTER TABLE `robots_rule_disallowed`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `robots_rule_sites`
--
ALTER TABLE `robots_rule_sites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `robots_url`
--
ALTER TABLE `robots_url`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_album`
--
ALTER TABLE `social_album`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_album_tagged`
--
ALTER TABLE `social_album_tagged`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_comment`
--
ALTER TABLE `social_comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_comment_tagged`
--
ALTER TABLE `social_comment_tagged`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_follow`
--
ALTER TABLE `social_follow`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_like`
--
ALTER TABLE `social_like`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_picture`
--
ALTER TABLE `social_picture`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_picture_tagged`
--
ALTER TABLE `social_picture_tagged`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_post`
--
ALTER TABLE `social_post`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_posthistory`
--
ALTER TABLE `social_posthistory`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_post_tagged`
--
ALTER TABLE `social_post_tagged`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_publications`
--
ALTER TABLE `social_publications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_skill`
--
ALTER TABLE `social_skill`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_skill_endoresement`
--
ALTER TABLE `social_skill_endoresement`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_social`
--
ALTER TABLE `social_social`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `social_social_followers`
--
ALTER TABLE `social_social_followers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taskBoard_media`
--
ALTER TABLE `taskBoard_media`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taskBoard_subtask`
--
ALTER TABLE `taskBoard_subtask`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taskBoard_task`
--
ALTER TABLE `taskBoard_task`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taskBoard_taskworkbook`
--
ALTER TABLE `taskBoard_taskworkbook`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taskBoard_task_files`
--
ALTER TABLE `taskBoard_task_files`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taskBoard_task_followers`
--
ALTER TABLE `taskBoard_task_followers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taskBoard_timelineitem`
--
ALTER TABLE `taskBoard_timelineitem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `website_components`
--
ALTER TABLE `website_components`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `website_page`
--
ALTER TABLE `website_page`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `website_uielementtemplate`
--
ALTER TABLE `website_uielementtemplate`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD CONSTRAINT `account_ema_email_address_id_5b7f8c58_fk_account_emailaddress_id` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`);

--
-- Constraints for table `assets_asset`
--
ALTER TABLE `assets_asset`
  ADD CONSTRAINT `assets_asset_user_id_e173809b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `assets_assetaddon`
--
ALTER TABLE `assets_assetaddon`
  ADD CONSTRAINT `assets_assetaddon_parent_id_29125720_fk_assets_asset_id` FOREIGN KEY (`parent_id`) REFERENCES `assets_asset` (`id`);

--
-- Constraints for table `assets_contactproducts`
--
ALTER TABLE `assets_contactproducts`
  ADD CONSTRAINT `assets_contactprod_inventory_id_7ac161db_fk_finance_inventory_id` FOREIGN KEY (`inventory_id`) REFERENCES `finance_inventory` (`id`),
  ADD CONSTRAINT `assets_contactproducts_addon_id_29d09d4f_fk_assets_assetaddon_id` FOREIGN KEY (`addon_id`) REFERENCES `assets_assetaddon` (`id`),
  ADD CONSTRAINT `assets_contactproducts_asset_id_3fed2063_fk_assets_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `assets_asset` (`id`);

--
-- Constraints for table `assets_indent`
--
ALTER TABLE `assets_indent`
  ADD CONSTRAINT `assets_inden_requestedToUnit_id_1c376564_fk_organization_unit_id` FOREIGN KEY (`requestedToUnit_id`) REFERENCES `organization_unit` (`id`),
  ADD CONSTRAINT `assets_indent_requestor_id_5e3a5586_fk_auth_user_id` FOREIGN KEY (`requestor_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `assets_indent_requestorUnit_id_4704cc4c_fk_organization_unit_id` FOREIGN KEY (`requestorUnit_id`) REFERENCES `organization_unit` (`id`);

--
-- Constraints for table `assets_indentasset`
--
ALTER TABLE `assets_indentasset`
  ADD CONSTRAINT `assets_indentasset_asset_id_534abf70_fk_assets_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `assets_asset` (`id`),
  ADD CONSTRAINT `assets_indentasset_unit_id_299d8467_fk_organization_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `organization_unit` (`id`),
  ADD CONSTRAINT `assets_indentasset_user_id_d64d1698_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `assets_indentqtymap`
--
ALTER TABLE `assets_indentqtymap`
  ADD CONSTRAINT `assets_indentqtymap_asset_id_4e16b88f_fk_assets_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `assets_asset` (`id`),
  ADD CONSTRAINT `assets_indentqtymap_indent_id_8a249be7_fk_assets_indent_id` FOREIGN KEY (`indent_id`) REFERENCES `assets_indent` (`id`);

--
-- Constraints for table `assets_min`
--
ALTER TABLE `assets_min`
  ADD CONSTRAINT `assets_min_issuedBy_id_6777d1ba_fk_auth_user_id` FOREIGN KEY (`issuedBy_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `assets_min_issuedTo_id_f1243b72_fk_auth_user_id` FOREIGN KEY (`issuedTo_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `clientRelationships_emailtemplate`
--
ALTER TABLE `clientRelationships_emailtemplate`
  ADD CONSTRAINT `clientRelationships_emailtempla_user_id_875fe513_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `clientRelationships_emailtemplate_files`
--
ALTER TABLE `clientRelationships_emailtemplate_files`
  ADD CONSTRAINT `clientRelation_files_id_ec0e176b_fk_clientRelationships_files_id` FOREIGN KEY (`files_id`) REFERENCES `clientRelationships_files` (`id`),
  ADD CONSTRAINT `D8f0ca2d07efaf56e42cdd870a057471` FOREIGN KEY (`emailtemplate_id`) REFERENCES `clientRelationships_emailtemplate` (`id`);

--
-- Constraints for table `clientRelationships_files`
--
ALTER TABLE `clientRelationships_files`
  ADD CONSTRAINT `clientRelationships_files_user_id_a481cfe5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `clientRelationships_schedule`
--
ALTER TABLE `clientRelationships_schedule`
  ADD CONSTRAINT `clientRelationships_schedule_user_id_ccc11165_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `clientRelationships_schedule_users`
--
ALTER TABLE `clientRelationships_schedule_users`
  ADD CONSTRAINT `clientRe_schedule_id_7dcde5b2_fk_clientRelationships_schedule_id` FOREIGN KEY (`schedule_id`) REFERENCES `clientRelationships_schedule` (`id`),
  ADD CONSTRAINT `clientRelationships_schedule_us_user_id_4be5dd8e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `clientRelationships_termsandconditions`
--
ALTER TABLE `clientRelationships_termsandconditions`
  ADD CONSTRAINT `clientRelations_division_id_5f4ad8d6_fk_organization_division_id` FOREIGN KEY (`division_id`) REFERENCES `organization_division` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `employees_complaints`
--
ALTER TABLE `employees_complaints`
  ADD CONSTRAINT `employees_complaints_user_id_593c2919_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `employees_systemlog`
--
ALTER TABLE `employees_systemlog`
  ADD CONSTRAINT `employees_systemlog_user_id_1067cd21_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `ERP_apiusage`
--
ALTER TABLE `ERP_apiusage`
  ADD CONSTRAINT `ERP_apiusage_api_id_d2d6d7bc_fk_ERP_publicapikeys_id` FOREIGN KEY (`api_id`) REFERENCES `ERP_publicapikeys` (`id`);

--
-- Constraints for table `ERP_application`
--
ALTER TABLE `ERP_application`
  ADD CONSTRAINT `ERP_application_module_id_0d170394_fk_ERP_module_id` FOREIGN KEY (`module_id`) REFERENCES `ERP_module` (`id`),
  ADD CONSTRAINT `ERP_application_parent_id_13f17de9_fk_ERP_application_id` FOREIGN KEY (`parent_id`) REFERENCES `ERP_application` (`id`);

--
-- Constraints for table `ERP_appsettingsfield`
--
ALTER TABLE `ERP_appsettingsfield`
  ADD CONSTRAINT `ERP_appsettingsfield_app_id_5e0bb5a0_fk_ERP_application_id` FOREIGN KEY (`app_id`) REFERENCES `ERP_application` (`id`);

--
-- Constraints for table `ERP_grouppermission`
--
ALTER TABLE `ERP_grouppermission`
  ADD CONSTRAINT `ERP_grouppermission_app_id_b08880bd_fk_ERP_application_id` FOREIGN KEY (`app_id`) REFERENCES `ERP_application` (`id`),
  ADD CONSTRAINT `ERP_grouppermission_givenBy_id_522edf12_fk_auth_user_id` FOREIGN KEY (`givenBy_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `ERP_grouppermission_group_id_a7722e27_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `ERP_media`
--
ALTER TABLE `ERP_media`
  ADD CONSTRAINT `ERP_media_user_id_8a7ec32d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `ERP_menuitems`
--
ALTER TABLE `ERP_menuitems`
  ADD CONSTRAINT `ERP_menuitems_parent_id_77c9f313_fk_ERP_application_id` FOREIGN KEY (`parent_id`) REFERENCES `ERP_application` (`id`);

--
-- Constraints for table `ERP_permission`
--
ALTER TABLE `ERP_permission`
  ADD CONSTRAINT `ERP_permission_app_id_9d39a250_fk_ERP_application_id` FOREIGN KEY (`app_id`) REFERENCES `ERP_application` (`id`),
  ADD CONSTRAINT `ERP_permission_givenBy_id_54b91569_fk_auth_user_id` FOREIGN KEY (`givenBy_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `ERP_permission_user_id_6ba8c3c0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `ERP_profile`
--
ALTER TABLE `ERP_profile`
  ADD CONSTRAINT `ERP_profile_user_id_7dada053_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `ERP_profile_devices`
--
ALTER TABLE `ERP_profile_devices`
  ADD CONSTRAINT `ERP_profile_devices_device_id_7524e397_fk_ERP_device_id` FOREIGN KEY (`device_id`) REFERENCES `ERP_device` (`id`),
  ADD CONSTRAINT `ERP_profile_devices_profile_id_f5ddf933_fk_ERP_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `ERP_profile` (`id`);

--
-- Constraints for table `ERP_publicapikeys`
--
ALTER TABLE `ERP_publicapikeys`
  ADD CONSTRAINT `ERP_publicapikeys_admin_id_b9030d87_fk_auth_user_id` FOREIGN KEY (`admin_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `ERP_publicapikeys_app_id_7ffce6c9_fk_ERP_application_id` FOREIGN KEY (`app_id`) REFERENCES `ERP_application` (`id`),
  ADD CONSTRAINT `ERP_publicapikeys_user_id_c88963a9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `ERP_service`
--
ALTER TABLE `ERP_service`
  ADD CONSTRAINT `ERP_service_address_id_d624f8d9_fk_ERP_address_id` FOREIGN KEY (`address_id`) REFERENCES `ERP_address` (`id`),
  ADD CONSTRAINT `ERP_service_contactPerson_id_d67847fb_fk_auth_user_id` FOREIGN KEY (`contactPerson_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `ERP_service_doc_id_fc7c5af1_fk_ERP_media_id` FOREIGN KEY (`doc_id`) REFERENCES `ERP_media` (`id`),
  ADD CONSTRAINT `ERP_service_owner_id_7e94ca23_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `ERP_service_user_id_91a0df31_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `finance_account`
--
ALTER TABLE `finance_account`
  ADD CONSTRAINT `finance_account_contactPerson_id_9aa62965_fk_auth_user_id` FOREIGN KEY (`contactPerson_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `finance_account_division_id_4981d07d_fk_organization_division_id` FOREIGN KEY (`division_id`) REFERENCES `organization_division` (`id`),
  ADD CONSTRAINT `finance_account_unit_id_73a8d11f_fk_organization_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `organization_unit` (`id`);

--
-- Constraints for table `finance_account_authorizedSignaturies`
--
ALTER TABLE `finance_account_authorizedSignaturies`
  ADD CONSTRAINT `finance_account_author_account_id_0915b8a3_fk_finance_account_id` FOREIGN KEY (`account_id`) REFERENCES `finance_account` (`id`),
  ADD CONSTRAINT `finance_account_authorizedSigna_user_id_f4a4daa8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `finance_configuretermsandconditions`
--
ALTER TABLE `finance_configuretermsandconditions`
  ADD CONSTRAINT `finance_configu_division_id_a966682a_fk_organization_division_id` FOREIGN KEY (`division_id`) REFERENCES `organization_division` (`id`);

--
-- Constraints for table `finance_costcenter`
--
ALTER TABLE `finance_costcenter`
  ADD CONSTRAINT `finance_costcen_division_id_635d77a4_fk_organization_division_id` FOREIGN KEY (`division_id`) REFERENCES `organization_division` (`id`),
  ADD CONSTRAINT `finance_costcenter_account_id_f0ecfe30_fk_finance_account_id` FOREIGN KEY (`account_id`) REFERENCES `finance_account` (`id`),
  ADD CONSTRAINT `finance_costcenter_head_id_5bc83063_fk_auth_user_id` FOREIGN KEY (`head_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `finance_costcenter_unit_id_31f6ff92_fk_organization_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `organization_unit` (`id`);

--
-- Constraints for table `finance_expensesheet`
--
ALTER TABLE `finance_expensesheet`
  ADD CONSTRAINT `finance_expens_transaction_id_d0a77892_fk_finance_transaction_id` FOREIGN KEY (`transaction_id`) REFERENCES `finance_transaction` (`id`),
  ADD CONSTRAINT `finance_expense_division_id_715a7ab9_fk_organization_division_id` FOREIGN KEY (`division_id`) REFERENCES `organization_division` (`id`),
  ADD CONSTRAINT `finance_expensesheet_user_id_e972f4db_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `finance_inflow`
--
ALTER TABLE `finance_inflow`
  ADD CONSTRAINT `finance_inflow_division_id_799646e8_fk_organization_division_id` FOREIGN KEY (`division_id`) REFERENCES `organization_division` (`id`),
  ADD CONSTRAINT `finance_inflow_service_id_3cb6a23d_fk_ERP_service_id` FOREIGN KEY (`service_id`) REFERENCES `ERP_service` (`id`),
  ADD CONSTRAINT `finance_inflow_toAcc_id_041e95a8_fk_finance_account_id` FOREIGN KEY (`toAcc_id`) REFERENCES `finance_account` (`id`),
  ADD CONSTRAINT `finance_inflow_user_id_496c9077_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `finance_inventory`
--
ALTER TABLE `finance_inventory`
  ADD CONSTRAINT `fi_productMeta_id_93888d2f_fk_clientRelationships_productmeta_id` FOREIGN KEY (`productMeta_id`) REFERENCES `clientRelationships_productmeta` (`id`),
  ADD CONSTRAINT `finance_invento_division_id_3ff1f41b_fk_organization_division_id` FOREIGN KEY (`division_id`) REFERENCES `organization_division` (`id`);

--
-- Constraints for table `finance_inventorylog`
--
ALTER TABLE `finance_inventorylog`
  ADD CONSTRAINT `finance_invento_division_id_6e4dcd05_fk_organization_division_id` FOREIGN KEY (`division_id`) REFERENCES `organization_division` (`id`),
  ADD CONSTRAINT `finance_inventoryl_inventory_id_824a65c3_fk_finance_inventory_id` FOREIGN KEY (`inventory_id`) REFERENCES `finance_inventory` (`id`),
  ADD CONSTRAINT `finance_inventorylog_user_id_78a31efc_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `finance_invoice`
--
ALTER TABLE `finance_invoice`
  ADD CONSTRAINT `finance_invoic_transaction_id_0d95f7b0_fk_finance_transaction_id` FOREIGN KEY (`transaction_id`) REFERENCES `finance_transaction` (`id`),
  ADD CONSTRAINT `finance_invoice_division_id_b735cfd1_fk_organization_division_id` FOREIGN KEY (`division_id`) REFERENCES `organization_division` (`id`),
  ADD CONSTRAINT `finance_invoice_sheet_id_6f89012d_fk_finance_expensesheet_id` FOREIGN KEY (`sheet_id`) REFERENCES `finance_expensesheet` (`id`),
  ADD CONSTRAINT `finance_invoice_user_id_fedc47c5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `finance_outboundinvoice`
--
ALTER TABLE `finance_outboundinvoice`
  ADD CONSTRAINT `D4ff0132e5c5562bf6b60c07b2febfd5` FOREIGN KEY (`termsandcondition_id`) REFERENCES `clientRelationships_termsandconditions` (`id`),
  ADD CONSTRAINT `finance_outbou_bussinessunit_id_7db6f61f_fk_organization_unit_id` FOREIGN KEY (`bussinessunit_id`) REFERENCES `organization_unit` (`id`),
  ADD CONSTRAINT `finance_outboun_division_id_a8dd055b_fk_organization_division_id` FOREIGN KEY (`division_id`) REFERENCES `organization_division` (`id`),
  ADD CONSTRAINT `finance_outboun_parent_id_0d2c2706_fk_finance_outboundinvoice_id` FOREIGN KEY (`parent_id`) REFERENCES `finance_outboundinvoice` (`id`),
  ADD CONSTRAINT `finance_outbound_costcenter_id_7e2d9ff0_fk_finance_costcenter_id` FOREIGN KEY (`costcenter_id`) REFERENCES `finance_costcenter` (`id`),
  ADD CONSTRAINT `finance_outboundinvoic_account_id_a8fda777_fk_finance_account_id` FOREIGN KEY (`account_id`) REFERENCES `finance_account` (`id`),
  ADD CONSTRAINT `finance_outboundinvoice_user_id_42dd900c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `finance_outboundinvoiceqty`
--
ALTER TABLE `finance_outboundinvoiceqty`
  ADD CONSTRAINT `finance_ou_hsn_id_fd8eea14_fk_clientRelationships_productmeta_id` FOREIGN KEY (`hsn_id`) REFERENCES `clientRelationships_productmeta` (`id`),
  ADD CONSTRAINT `finance_outbo_outBound_id_f8f9d6de_fk_finance_outboundinvoice_id` FOREIGN KEY (`outBound_id`) REFERENCES `finance_outboundinvoice` (`id`),
  ADD CONSTRAINT `finance_outboun_division_id_f28b5a7c_fk_organization_division_id` FOREIGN KEY (`division_id`) REFERENCES `organization_division` (`id`);

--
-- Constraints for table `finance_potermsandconditions`
--
ALTER TABLE `finance_potermsandconditions`
  ADD CONSTRAINT `finance_poterms_division_id_a7e1ae28_fk_organization_division_id` FOREIGN KEY (`division_id`) REFERENCES `organization_division` (`id`);

--
-- Constraints for table `finance_projectpettyexpense`
--
ALTER TABLE `finance_projectpettyexpense`
  ADD CONSTRAINT `finance_project_division_id_7a20c577_fk_organization_division_id` FOREIGN KEY (`division_id`) REFERENCES `organization_division` (`id`),
  ADD CONSTRAINT `finance_project_heading_id_44ec779a_fk_finance_expenseheading_id` FOREIGN KEY (`heading_id`) REFERENCES `finance_expenseheading` (`id`),
  ADD CONSTRAINT `finance_projectp_costCenter_id_082838df_fk_finance_costcenter_id` FOREIGN KEY (`costCenter_id`) REFERENCES `finance_costcenter` (`id`),
  ADD CONSTRAINT `finance_projectpettyex_account_id_def3906b_fk_finance_account_id` FOREIGN KEY (`account_id`) REFERENCES `finance_account` (`id`),
  ADD CONSTRAINT `finance_projectpettyexpe_createdUser_id_0c53d230_fk_auth_user_id` FOREIGN KEY (`createdUser_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `finance_purchaseorder`
--
ALTER TABLE `finance_purchaseorder`
  ADD CONSTRAINT `e2a23a39f3e6a77930ce97a756bbb6f7` FOREIGN KEY (`termsandcondition_id`) REFERENCES `finance_potermsandconditions` (`id`),
  ADD CONSTRAINT `finance_purcha_bussinessunit_id_f5b8dafd_fk_organization_unit_id` FOREIGN KEY (`bussinessunit_id`) REFERENCES `organization_unit` (`id`),
  ADD CONSTRAINT `finance_purchas_division_id_4cbd9bdb_fk_organization_division_id` FOREIGN KEY (`division_id`) REFERENCES `organization_division` (`id`),
  ADD CONSTRAINT `finance_purchase_costcenter_id_99fc340e_fk_finance_costcenter_id` FOREIGN KEY (`costcenter_id`) REFERENCES `finance_costcenter` (`id`),
  ADD CONSTRAINT `finance_purchaseo_parent_id_99508aee_fk_finance_purchaseorder_id` FOREIGN KEY (`parent_id`) REFERENCES `finance_purchaseorder` (`id`),
  ADD CONSTRAINT `finance_purchaseorder_account_id_f69dd7f4_fk_finance_account_id` FOREIGN KEY (`account_id`) REFERENCES `finance_account` (`id`),
  ADD CONSTRAINT `finance_purchaseorder_requester_id_53c10ac3_fk_auth_user_id` FOREIGN KEY (`requester_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `finance_purchaseorder_service_id_b4999c26_fk_ERP_service_id` FOREIGN KEY (`service_id`) REFERENCES `ERP_service` (`id`),
  ADD CONSTRAINT `finance_purchaseorder_user_id_a679577f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `finance_purchaseorderqty`
--
ALTER TABLE `finance_purchaseorderqty`
  ADD CONSTRAINT `fi_productMeta_id_6fe405fc_fk_clientRelationships_productmeta_id` FOREIGN KEY (`productMeta_id`) REFERENCES `clientRelationships_productmeta` (`id`),
  ADD CONSTRAINT `finance_pu_purchaseorder_id_9d70c7ef_fk_finance_purchaseorder_id` FOREIGN KEY (`purchaseorder_id`) REFERENCES `finance_purchaseorder` (`id`),
  ADD CONSTRAINT `finance_purchas_division_id_b7d6c264_fk_organization_division_id` FOREIGN KEY (`division_id`) REFERENCES `organization_division` (`id`);

--
-- Constraints for table `finance_transaction`
--
ALTER TABLE `finance_transaction`
  ADD CONSTRAINT `finance_trans_outBound_id_11c791bc_fk_finance_outboundinvoice_id` FOREIGN KEY (`outBound_id`) REFERENCES `finance_outboundinvoice` (`id`),
  ADD CONSTRAINT `finance_transac_division_id_41d4a190_fk_organization_division_id` FOREIGN KEY (`division_id`) REFERENCES `organization_division` (`id`),
  ADD CONSTRAINT `finance_transaction_fromAcc_id_af993795_fk_finance_account_id` FOREIGN KEY (`fromAcc_id`) REFERENCES `finance_account` (`id`),
  ADD CONSTRAINT `finance_transaction_toAcc_id_3a610b10_fk_finance_account_id` FOREIGN KEY (`toAcc_id`) REFERENCES `finance_account` (`id`),
  ADD CONSTRAINT `finance_transaction_user_id_6c085a0b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `finance_vendorservice`
--
ALTER TABLE `finance_vendorservice`
  ADD CONSTRAINT `finance_vendors_division_id_f21c29d4_fk_organization_division_id` FOREIGN KEY (`division_id`) REFERENCES `organization_division` (`id`);

--
-- Constraints for table `gitweb_codecomment`
--
ALTER TABLE `gitweb_codecomment`
  ADD CONSTRAINT `gitweb_codecomment_repo_id_381cef2a_fk_gitweb_repo_id` FOREIGN KEY (`repo_id`) REFERENCES `gitweb_repo` (`id`),
  ADD CONSTRAINT `gitweb_codecomment_user_id_3d74f4bc_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `gitweb_commitnotification`
--
ALTER TABLE `gitweb_commitnotification`
  ADD CONSTRAINT `gitweb_commitnotification_repo_id_fd7c3eb7_fk_gitweb_repo_id` FOREIGN KEY (`repo_id`) REFERENCES `gitweb_repo` (`id`),
  ADD CONSTRAINT `gitweb_commitnotification_user_id_25a676e9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `gitweb_gitgroup_users`
--
ALTER TABLE `gitweb_gitgroup_users`
  ADD CONSTRAINT `gitweb_gitgroup_users_gitgroup_id_7cc35476_fk_gitweb_gitgroup_id` FOREIGN KEY (`gitgroup_id`) REFERENCES `gitweb_gitgroup` (`id`),
  ADD CONSTRAINT `gitweb_gitgroup_users_user_id_23eb2e80_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `gitweb_grouppermission`
--
ALTER TABLE `gitweb_grouppermission`
  ADD CONSTRAINT `gitweb_grouppermission_group_id_fb83dd77_fk_gitweb_gitgroup_id` FOREIGN KEY (`group_id`) REFERENCES `gitweb_gitgroup` (`id`);

--
-- Constraints for table `gitweb_repo`
--
ALTER TABLE `gitweb_repo`
  ADD CONSTRAINT `gitweb_repo_creator_id_f1ccc248_fk_auth_user_id` FOREIGN KEY (`creator_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `gitweb_repo_project_id_f546e3bd_fk_projects_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects_project` (`id`);

--
-- Constraints for table `gitweb_repopermission`
--
ALTER TABLE `gitweb_repopermission`
  ADD CONSTRAINT `gitweb_repopermission_user_id_214e0ede_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `gitweb_repo_groups`
--
ALTER TABLE `gitweb_repo_groups`
  ADD CONSTRAINT `gitweb__grouppermission_id_69cef3dc_fk_gitweb_grouppermission_id` FOREIGN KEY (`grouppermission_id`) REFERENCES `gitweb_grouppermission` (`id`),
  ADD CONSTRAINT `gitweb_repo_groups_repo_id_b9dec624_fk_gitweb_repo_id` FOREIGN KEY (`repo_id`) REFERENCES `gitweb_repo` (`id`);

--
-- Constraints for table `gitweb_repo_perms`
--
ALTER TABLE `gitweb_repo_perms`
  ADD CONSTRAINT `gitweb_re_repopermission_id_3e9bedfe_fk_gitweb_repopermission_id` FOREIGN KEY (`repopermission_id`) REFERENCES `gitweb_repopermission` (`id`),
  ADD CONSTRAINT `gitweb_repo_perms_repo_id_da4ed547_fk_gitweb_repo_id` FOREIGN KEY (`repo_id`) REFERENCES `gitweb_repo` (`id`);

--
-- Constraints for table `HR_accountskey`
--
ALTER TABLE `HR_accountskey`
  ADD CONSTRAINT `HR_accountskey_user_id_b25390f8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `HR_appraisal`
--
ALTER TABLE `HR_appraisal`
  ADD CONSTRAINT `HR_appraisal_createdUser_id_7b802185_fk_auth_user_id` FOREIGN KEY (`createdUser_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `HR_appraisal_hr_id_e1f1a64c_fk_auth_user_id` FOREIGN KEY (`hr_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `HR_appraisal_manager_id_7b7ee56d_fk_auth_user_id` FOREIGN KEY (`manager_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `HR_appraisal_superManager_id_074882c4_fk_auth_user_id` FOREIGN KEY (`superManager_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `HR_appraisal_user_id_046a3957_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `HR_designation`
--
ALTER TABLE `HR_designation`
  ADD CONSTRAINT `HR_designa_department_id_4ce0de84_fk_organization_departments_id` FOREIGN KEY (`department_id`) REFERENCES `organization_departments` (`id`),
  ADD CONSTRAINT `HR_designation_division_id_87189cea_fk_organization_division_id` FOREIGN KEY (`division_id`) REFERENCES `organization_division` (`id`),
  ADD CONSTRAINT `HR_designation_hrApprover_id_d7fb45b7_fk_auth_user_id` FOREIGN KEY (`hrApprover_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `HR_designation_primaryApprover_id_5f11c469_fk_auth_user_id` FOREIGN KEY (`primaryApprover_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `HR_designation_reportingTo_id_826a0a88_fk_auth_user_id` FOREIGN KEY (`reportingTo_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `HR_designation_role_id_c16ac094_fk_organization_role_id` FOREIGN KEY (`role_id`) REFERENCES `organization_role` (`id`),
  ADD CONSTRAINT `HR_designation_secondaryApprover_id_e7d8c82f_fk_auth_user_id` FOREIGN KEY (`secondaryApprover_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `HR_designation_team_id_c49e77de_fk_HR_team_id` FOREIGN KEY (`team_id`) REFERENCES `HR_team` (`id`),
  ADD CONSTRAINT `HR_designation_unit_id_67ada193_fk_organization_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `organization_unit` (`id`),
  ADD CONSTRAINT `HR_designation_user_id_7c02cacd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `HR_designationlogs`
--
ALTER TABLE `HR_designationlogs`
  ADD CONSTRAINT `HR_desi_newDepartment_id_8c8ffdc7_fk_organization_departments_id` FOREIGN KEY (`newDepartment_id`) REFERENCES `organization_departments` (`id`),
  ADD CONSTRAINT `HR_desi_oldDepartment_id_d074b777_fk_organization_departments_id` FOREIGN KEY (`oldDepartment_id`) REFERENCES `organization_departments` (`id`),
  ADD CONSTRAINT `HR_designati_newDivision_id_11938a44_fk_organization_division_id` FOREIGN KEY (`newDivision_id`) REFERENCES `organization_division` (`id`),
  ADD CONSTRAINT `HR_designati_oldDivision_id_2922e297_fk_organization_division_id` FOREIGN KEY (`oldDivision_id`) REFERENCES `organization_division` (`id`),
  ADD CONSTRAINT `HR_designationl_newSecondaryApprover_id_76366b4b_fk_auth_user_id` FOREIGN KEY (`newSecondaryApprover_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `HR_designationl_oldSecondaryApprover_id_516c82ba_fk_auth_user_id` FOREIGN KEY (`oldSecondaryApprover_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `HR_designationlog_newPrimaryApprover_id_42b170f2_fk_auth_user_id` FOREIGN KEY (`newPrimaryApprover_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `HR_designationlog_oldPrimaryApprover_id_b1cd0230_fk_auth_user_id` FOREIGN KEY (`oldPrimaryApprover_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `HR_designationlogs_createdUser_id_ca1843c7_fk_auth_user_id` FOREIGN KEY (`createdUser_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `HR_designationlogs_newHrApprover_id_90237597_fk_auth_user_id` FOREIGN KEY (`newHrApprover_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `HR_designationlogs_newReportingTo_id_5737bd0b_fk_auth_user_id` FOREIGN KEY (`newReportingTo_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `HR_designationlogs_newRole_id_9156a7e7_fk_organization_role_id` FOREIGN KEY (`newRole_id`) REFERENCES `organization_role` (`id`),
  ADD CONSTRAINT `HR_designationlogs_newUnit_id_27edcd14_fk_organization_unit_id` FOREIGN KEY (`newUnit_id`) REFERENCES `organization_unit` (`id`),
  ADD CONSTRAINT `HR_designationlogs_oldHrApprover_id_2b83c2d5_fk_auth_user_id` FOREIGN KEY (`oldHrApprover_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `HR_designationlogs_oldReportingTo_id_6ae058c0_fk_auth_user_id` FOREIGN KEY (`oldReportingTo_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `HR_designationlogs_oldRole_id_076cb9b9_fk_organization_role_id` FOREIGN KEY (`oldRole_id`) REFERENCES `organization_role` (`id`),
  ADD CONSTRAINT `HR_designationlogs_oldUnit_id_601a00da_fk_organization_unit_id` FOREIGN KEY (`oldUnit_id`) REFERENCES `organization_unit` (`id`),
  ADD CONSTRAINT `HR_designationlogs_user_id_2b2bab4d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `HR_document`
--
ALTER TABLE `HR_document`
  ADD CONSTRAINT `HR_document_division_id_09015bb9_fk_organization_division_id` FOREIGN KEY (`division_id`) REFERENCES `organization_division` (`id`);

--
-- Constraints for table `HR_documents`
--
ALTER TABLE `HR_documents`
  ADD CONSTRAINT `HR_documents_user_id_08f7584a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `HR_exemployeesession`
--
ALTER TABLE `HR_exemployeesession`
  ADD CONSTRAINT `HR_exemployeesession_empProfile_id_969f472d_fk_HR_profile_id` FOREIGN KEY (`empProfile_id`) REFERENCES `HR_profile` (`id`);

--
-- Constraints for table `HR_exitmanagement`
--
ALTER TABLE `HR_exitmanagement`
  ADD CONSTRAINT `HR_exitmanagement_manager_id_cc1a88d0_fk_auth_user_id` FOREIGN KEY (`manager_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `HR_exitmanagement_superManager_id_e88b8c50_fk_auth_user_id` FOREIGN KEY (`superManager_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `HR_exitmanagement_user_id_df69ba3f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `HR_leave`
--
ALTER TABLE `HR_leave`
  ADD CONSTRAINT `HR_leave_user_id_bce4ceb7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `HR_leave_approvedBy`
--
ALTER TABLE `HR_leave_approvedBy`
  ADD CONSTRAINT `HR_leave_approvedBy_leave_id_d5bc3204_fk_HR_leave_id` FOREIGN KEY (`leave_id`) REFERENCES `HR_leave` (`id`),
  ADD CONSTRAINT `HR_leave_approvedBy_user_id_43a6d946_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `HR_payroll`
--
ALTER TABLE `HR_payroll`
  ADD CONSTRAINT `HR_payroll_user_id_db65d513_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `HR_payrolllogs`
--
ALTER TABLE `HR_payrolllogs`
  ADD CONSTRAINT `HR_payrolllogs_createdUser_id_757b3d6b_fk_auth_user_id` FOREIGN KEY (`createdUser_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `HR_payrolllogs_user_id_2b9e0ca1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `HR_profile`
--
ALTER TABLE `HR_profile`
  ADD CONSTRAINT `HR_profile_user_id_97254ebe_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `HR_rank`
--
ALTER TABLE `HR_rank`
  ADD CONSTRAINT `HR_rank_user_id_542b75ed_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `HR_team`
--
ALTER TABLE `HR_team`
  ADD CONSTRAINT `HR_team_manager_id_009d5dd9_fk_auth_user_id` FOREIGN KEY (`manager_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `HR_team_unit_id_284b3ea1_fk_organization_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `organization_unit` (`id`);

--
-- Constraints for table `HR_usertourtracker`
--
ALTER TABLE `HR_usertourtracker`
  ADD CONSTRAINT `HR_usertourtracker_user_id_6e039f8a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `mail_mailattachment`
--
ALTER TABLE `mail_mailattachment`
  ADD CONSTRAINT `mail_mailattachment_user_id_f2818e91_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `mail_proxyaccount`
--
ALTER TABLE `mail_proxyaccount`
  ADD CONSTRAINT `mail_proxyaccount_user_id_c39560a7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `marketing_abbquotation_qtys`
--
ALTER TABLE `marketing_abbquotation_qtys`
  ADD CONSTRAINT `ma_abbquotationqtys_id_212d9a68_fk_marketing_abbquotationqtys_id` FOREIGN KEY (`abbquotationqtys_id`) REFERENCES `marketing_abbquotationqtys` (`id`),
  ADD CONSTRAINT `marketing__abbquotation_id_efcc8d93_fk_marketing_abbquotation_id` FOREIGN KEY (`abbquotation_id`) REFERENCES `marketing_abbquotation` (`id`);

--
-- Constraints for table `marketing_activity`
--
ALTER TABLE `marketing_activity`
  ADD CONSTRAINT `marketing_activity_contact_id_ed08f338_fk_marketing_contact_id` FOREIGN KEY (`contact_id`) REFERENCES `marketing_contact` (`id`),
  ADD CONSTRAINT `marketing_activity_deal_id_2bcaa1ac_fk_marketing_deal_id` FOREIGN KEY (`deal_id`) REFERENCES `marketing_deal` (`id`),
  ADD CONSTRAINT `marketing_activity_user_id_e37d4925_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `marketing_activity_contacts`
--
ALTER TABLE `marketing_activity_contacts`
  ADD CONSTRAINT `marketing_activity_activity_id_a5ce6acc_fk_marketing_activity_id` FOREIGN KEY (`activity_id`) REFERENCES `marketing_activity` (`id`),
  ADD CONSTRAINT `marketing_activity_c_contact_id_09d7c6f4_fk_marketing_contact_id` FOREIGN KEY (`contact_id`) REFERENCES `marketing_contact` (`id`);

--
-- Constraints for table `marketing_activity_internalUsers`
--
ALTER TABLE `marketing_activity_internalUsers`
  ADD CONSTRAINT `marketing_activity_activity_id_40e5d0ed_fk_marketing_activity_id` FOREIGN KEY (`activity_id`) REFERENCES `marketing_activity` (`id`),
  ADD CONSTRAINT `marketing_activity_internalUser_user_id_82ce2aa1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `marketing_agreement_engineers`
--
ALTER TABLE `marketing_agreement_engineers`
  ADD CONSTRAINT `marketing_agreem_agreement_id_a3db2ff0_fk_marketing_agreement_id` FOREIGN KEY (`agreement_id`) REFERENCES `marketing_agreement` (`id`),
  ADD CONSTRAINT `marketing_agreement_engineers_user_id_fa70fb68_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `marketing_campaign`
--
ALTER TABLE `marketing_campaign`
  ADD CONSTRAINT `marketing_campaign_lead_id_c027e2c1_fk_auth_user_id` FOREIGN KEY (`lead_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `marketing_campaign_parent_id_8cc6a1d7_fk_marketing_campaign_id` FOREIGN KEY (`parent_id`) REFERENCES `marketing_campaign` (`id`),
  ADD CONSTRAINT `marketing_campaign_team_id_2866bbea_fk_HR_team_id` FOREIGN KEY (`team_id`) REFERENCES `HR_team` (`id`);

--
-- Constraints for table `marketing_campaignitem`
--
ALTER TABLE `marketing_campaignitem`
  ADD CONSTRAINT `marketing_campaign_campaign_id_7db6093f_fk_marketing_campaign_id` FOREIGN KEY (`campaign_id`) REFERENCES `marketing_campaign` (`id`),
  ADD CONSTRAINT `marketing_campaigni_contact_id_665fd4c7_fk_marketing_contacts_id` FOREIGN KEY (`contact_id`) REFERENCES `marketing_contacts` (`id`),
  ADD CONSTRAINT `marketing_campaignitem_owner_id_72bfbb61_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `marketing_campaignlogs`
--
ALTER TABLE `marketing_campaignlogs`
  ADD CONSTRAINT `marketing_campaign_campaign_id_8ac9aba3_fk_marketing_campaign_id` FOREIGN KEY (`campaign_id`) REFERENCES `marketing_campaign` (`id`),
  ADD CONSTRAINT `marketing_campaignl_contact_id_a5f2d611_fk_marketing_contacts_id` FOREIGN KEY (`contact_id`) REFERENCES `marketing_contacts` (`id`),
  ADD CONSTRAINT `marketing_campaignlogs_user_id_2ffbade0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `marketing_campaign_participants`
--
ALTER TABLE `marketing_campaign_participants`
  ADD CONSTRAINT `marketing_campaign_campaign_id_7f624d2f_fk_marketing_campaign_id` FOREIGN KEY (`campaign_id`) REFERENCES `marketing_campaign` (`id`),
  ADD CONSTRAINT `marketing_campaign_participants_user_id_86c660e4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `marketing_chatthread`
--
ALTER TABLE `marketing_chatthread`
  ADD CONSTRAINT `marketing_chatthre_customer_id_1f281e0b_fk_marketing_contacts_id` FOREIGN KEY (`customer_id`) REFERENCES `marketing_contacts` (`id`),
  ADD CONSTRAINT `marketing_chatthread_user_id_fd8f2a55_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `marketing_checkin`
--
ALTER TABLE `marketing_checkin`
  ADD CONSTRAINT `marketing_checki_inwardQty_id_1407a1c6_fk_marketing_inwardqty_id` FOREIGN KEY (`inwardQty_id`) REFERENCES `marketing_inwardqty` (`id`),
  ADD CONSTRAINT `marketing_checkin_contact_id_24e60c3e_fk_marketing_contact_id` FOREIGN KEY (`contact_id`) REFERENCES `marketing_contact` (`id`),
  ADD CONSTRAINT `marketing_checkin_unit_id_21c13bd5_fk_organization_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `organization_unit` (`id`),
  ADD CONSTRAINT `marketing_checkin_vendor_id_c527a40f_fk_HR_vendorprofile_id` FOREIGN KEY (`vendor_id`) REFERENCES `HR_vendorprofile` (`id`);

--
-- Constraints for table `marketing_contact`
--
ALTER TABLE `marketing_contact`
  ADD CONSTRAINT `marketing_contact_company_id_1e22e5eb_fk_ERP_service_id` FOREIGN KEY (`company_id`) REFERENCES `ERP_service` (`id`),
  ADD CONSTRAINT `marketing_contact_parent_id_05bb21ce_fk_marketing_contact_id` FOREIGN KEY (`parent_id`) REFERENCES `marketing_contact` (`id`),
  ADD CONSTRAINT `marketing_contact_unit_id_ba4dd1ee_fk_organization_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `organization_unit` (`id`),
  ADD CONSTRAINT `marketing_contact_user_id_d4ef4493_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `marketing_contacts`
--
ALTER TABLE `marketing_contacts`
  ADD CONSTRAINT `bcb01710f0a0b6ba2a01ba22a545650e` FOREIGN KEY (`material_terms_id`) REFERENCES `finance_configuretermsandconditions` (`id`),
  ADD CONSTRAINT `marketing_contac_contact_ref_id_74d6e968_fk_marketing_contact_id` FOREIGN KEY (`contact_ref_id`) REFERENCES `marketing_contact` (`id`),
  ADD CONSTRAINT `marketing_contacts_creater_id_c6047bef_fk_auth_user_id` FOREIGN KEY (`creater_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `marketing_contacts_product_id_a0b333e9_fk_finance_inventory_id` FOREIGN KEY (`product_id`) REFERENCES `finance_inventory` (`id`);

--
-- Constraints for table `marketing_contacts_tags`
--
ALTER TABLE `marketing_contacts_tags`
  ADD CONSTRAINT `marketing_contacts_contacts_id_1ff5a826_fk_marketing_contacts_id` FOREIGN KEY (`contacts_id`) REFERENCES `marketing_contacts` (`id`),
  ADD CONSTRAINT `marketing_contacts_tags_tag_id_635d9cdc_fk_marketing_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `marketing_tag` (`id`);

--
-- Constraints for table `marketing_contract`
--
ALTER TABLE `marketing_contract`
  ADD CONSTRAINT `a4b096acd438fbd5a70123b4d9e25e4f` FOREIGN KEY (`termsAndCondition_id`) REFERENCES `marketing_crmtermsandconditions` (`id`),
  ADD CONSTRAINT `marketing_contract_contact_id_a5f03ab3_fk_marketing_contact_id` FOREIGN KEY (`contact_id`) REFERENCES `marketing_contact` (`id`),
  ADD CONSTRAINT `marketing_contract_coupon_id_e9a782ca_fk_marketing_discount_id` FOREIGN KEY (`coupon_id`) REFERENCES `marketing_discount` (`id`),
  ADD CONSTRAINT `marketing_contract_deal_id_aa7f4729_fk_marketing_deal_id` FOREIGN KEY (`deal_id`) REFERENCES `marketing_deal` (`id`),
  ADD CONSTRAINT `marketing_contract_frm_id_e50a2eb8_fk_auth_user_id` FOREIGN KEY (`frm_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `marketing_contract_user_id_5cfcda08_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `marketing_contracttracker`
--
ALTER TABLE `marketing_contracttracker`
  ADD CONSTRAINT `marketing_contract_contract_id_c170cb5d_fk_marketing_contract_id` FOREIGN KEY (`contract_id`) REFERENCES `marketing_contract` (`id`),
  ADD CONSTRAINT `marketing_contracttracker_user_id_b6bb539b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `marketing_contract_products`
--
ALTER TABLE `marketing_contract_products`
  ADD CONSTRAINT `marketing_co_productqtys_id_ff27f946_fk_marketing_productqtys_id` FOREIGN KEY (`productqtys_id`) REFERENCES `marketing_productqtys` (`id`),
  ADD CONSTRAINT `marketing_contract_contract_id_24044e8a_fk_marketing_contract_id` FOREIGN KEY (`contract_id`) REFERENCES `marketing_contract` (`id`);

--
-- Constraints for table `marketing_crmtermsandconditions`
--
ALTER TABLE `marketing_crmtermsandconditions`
  ADD CONSTRAINT `marketing_crmte_division_id_493b186e_fk_organization_division_id` FOREIGN KEY (`division_id`) REFERENCES `organization_division` (`id`);

--
-- Constraints for table `marketing_customersession`
--
ALTER TABLE `marketing_customersession`
  ADD CONSTRAINT `marketing_customerse_contact_id_b368bfaa_fk_marketing_contact_id` FOREIGN KEY (`contact_id`) REFERENCES `marketing_contact` (`id`),
  ADD CONSTRAINT `marketing_customersession_company_id_e4680485_fk_ERP_service_id` FOREIGN KEY (`company_id`) REFERENCES `ERP_service` (`id`);

--
-- Constraints for table `marketing_dc`
--
ALTER TABLE `marketing_dc`
  ADD CONSTRAINT `marketing_dc_contact_id_e9e99a70_fk_marketing_contact_id` FOREIGN KEY (`contact_id`) REFERENCES `marketing_contact` (`id`),
  ADD CONSTRAINT `marketing_dc_createdBy_id_bc71abec_fk_auth_user_id` FOREIGN KEY (`createdBy_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `marketing_dcqtymap`
--
ALTER TABLE `marketing_dcqtymap`
  ADD CONSTRAINT `marketing_dcqtymap_checkin_id_2ccf74c2_fk_marketing_checkin_id` FOREIGN KEY (`checkin_id`) REFERENCES `marketing_checkin` (`id`),
  ADD CONSTRAINT `marketing_dcqtymap_dc_id_dfa294c3_fk_marketing_dc_id` FOREIGN KEY (`dc_id`) REFERENCES `marketing_dc` (`id`);

--
-- Constraints for table `marketing_deal`
--
ALTER TABLE `marketing_deal`
  ADD CONSTRAINT `marketing_deal_company_id_4458ce9b_fk_ERP_service_id` FOREIGN KEY (`company_id`) REFERENCES `ERP_service` (`id`),
  ADD CONSTRAINT `marketing_deal_user_id_17d1e54e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `marketing_dealpaymentsterm`
--
ALTER TABLE `marketing_dealpaymentsterm`
  ADD CONSTRAINT `marketing_dealpaymentste_parent_id_4d328c22_fk_marketing_deal_id` FOREIGN KEY (`parent_id`) REFERENCES `marketing_deal` (`id`);

--
-- Constraints for table `marketing_dealrequirement`
--
ALTER TABLE `marketing_dealrequirement`
  ADD CONSTRAINT `marketing_dealrequiremen_parent_id_0a4486ed_fk_marketing_deal_id` FOREIGN KEY (`parent_id`) REFERENCES `marketing_deal` (`id`);

--
-- Constraints for table `marketing_deal_contacts`
--
ALTER TABLE `marketing_deal_contacts`
  ADD CONSTRAINT `marketing_deal_conta_contact_id_bab4bff5_fk_marketing_contact_id` FOREIGN KEY (`contact_id`) REFERENCES `marketing_contact` (`id`),
  ADD CONSTRAINT `marketing_deal_contacts_deal_id_6da734e2_fk_marketing_deal_id` FOREIGN KEY (`deal_id`) REFERENCES `marketing_deal` (`id`);

--
-- Constraints for table `marketing_deal_internalUsers`
--
ALTER TABLE `marketing_deal_internalUsers`
  ADD CONSTRAINT `marketing_deal_internalUse_deal_id_0fedba0f_fk_marketing_deal_id` FOREIGN KEY (`deal_id`) REFERENCES `marketing_deal` (`id`),
  ADD CONSTRAINT `marketing_deal_internalUsers_user_id_7bcef19e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `marketing_engineersiteexpense`
--
ALTER TABLE `marketing_engineersiteexpense`
  ADD CONSTRAINT `marketing_engineersiteexpe_site_id_2556c4f9_fk_marketing_site_id` FOREIGN KEY (`site_id`) REFERENCES `marketing_site` (`id`);

--
-- Constraints for table `marketing_im`
--
ALTER TABLE `marketing_im`
  ADD CONSTRAINT `marketing_im_frm_id_62db6673_fk_marketing_contacts_id` FOREIGN KEY (`frm_id`) REFERENCES `marketing_contacts` (`id`),
  ADD CONSTRAINT `marketing_im_to_id_a5967af2_fk_marketing_contacts_id` FOREIGN KEY (`to_id`) REFERENCES `marketing_contacts` (`id`);

--
-- Constraints for table `marketing_inward`
--
ALTER TABLE `marketing_inward`
  ADD CONSTRAINT `marketing_inward_unit_id_b61cc2a2_fk_organization_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `organization_unit` (`id`),
  ADD CONSTRAINT `marketing_inward_vendor_id_ad7cabb5_fk_HR_vendorprofile_id` FOREIGN KEY (`vendor_id`) REFERENCES `HR_vendorprofile` (`id`);

--
-- Constraints for table `marketing_inwardqty`
--
ALTER TABLE `marketing_inwardqty`
  ADD CONSTRAINT `marketing_inwardqty_inward_id_412e083a_fk_marketing_inward_id` FOREIGN KEY (`inward_id`) REFERENCES `marketing_inward` (`id`);

--
-- Constraints for table `marketing_legalagreement`
--
ALTER TABLE `marketing_legalagreement`
  ADD CONSTRAINT `marketing_legalagreement_authrizer_id_9e40c800_fk_auth_user_id` FOREIGN KEY (`authrizer_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `marketing_legalagreement_deal_id_053e2020_fk_marketing_deal_id` FOREIGN KEY (`deal_id`) REFERENCES `marketing_deal` (`id`);

--
-- Constraints for table `marketing_legalagreementterms`
--
ALTER TABLE `marketing_legalagreementterms`
  ADD CONSTRAINT `marketing_lega_parent_id_419d6779_fk_marketing_legalagreement_id` FOREIGN KEY (`parent_id`) REFERENCES `marketing_legalagreement` (`id`);

--
-- Constraints for table `marketing_log`
--
ALTER TABLE `marketing_log`
  ADD CONSTRAINT `marketing_log_plan_id_08421b00_fk_marketing_tourplanstop_id` FOREIGN KEY (`plan_id`) REFERENCES `marketing_tourplanstop` (`id`);

--
-- Constraints for table `marketing_products`
--
ALTER TABLE `marketing_products`
  ADD CONSTRAINT `marketing_products_checkin_id_92be99e6_fk_marketing_checkin_id` FOREIGN KEY (`checkin_id`) REFERENCES `marketing_checkin` (`id`),
  ADD CONSTRAINT `marketing_products_contact_id_3096ff6d_fk_marketing_contact_id` FOREIGN KEY (`contact_id`) REFERENCES `marketing_contact` (`id`),
  ADD CONSTRAINT `marketing_products_for_contact_id_919dde84_fk_marketing` FOREIGN KEY (`for_contact_id`) REFERENCES `marketing_contact` (`id`);

--
-- Constraints for table `marketing_proforma`
--
ALTER TABLE `marketing_proforma`
  ADD CONSTRAINT `marketing_proforma_siteId_id_98b1a420_fk_marketing_site_id` FOREIGN KEY (`siteId_id`) REFERENCES `marketing_site` (`id`);

--
-- Constraints for table `marketing_proforma_qtys`
--
ALTER TABLE `marketing_proforma_qtys`
  ADD CONSTRAINT `marketing__proformaqtys_id_9b6e20c3_fk_marketing_proformaqtys_id` FOREIGN KEY (`proformaqtys_id`) REFERENCES `marketing_proformaqtys` (`id`),
  ADD CONSTRAINT `marketing_proforma_proforma_id_36920df8_fk_marketing_proforma_id` FOREIGN KEY (`proforma_id`) REFERENCES `marketing_proforma` (`id`);

--
-- Constraints for table `marketing_purchaseqty`
--
ALTER TABLE `marketing_purchaseqty`
  ADD CONSTRAINT `marketing_purchaseq_po_id_9c6d9be1_fk_marketing_purchaseorder_id` FOREIGN KEY (`po_id`) REFERENCES `marketing_purchaseorder` (`id`),
  ADD CONSTRAINT `marketing_purchaseqty_site_id_a92f7b62_fk_marketing_site_id` FOREIGN KEY (`site_id`) REFERENCES `marketing_site` (`id`);

--
-- Constraints for table `marketing_salespurchaseorder_orderQtys`
--
ALTER TABLE `marketing_salespurchaseorder_orderQtys`
  ADD CONSTRAINT `bea07d722fd2c911fa5d1ceba87ba2fa` FOREIGN KEY (`salespurchaseorder_id`) REFERENCES `marketing_salespurchaseorder` (`id`),
  ADD CONSTRAINT `marketing_salesp_salesqtys_id_c4c46f0b_fk_marketing_salesqtys_id` FOREIGN KEY (`salesqtys_id`) REFERENCES `marketing_salesqtys` (`id`);

--
-- Constraints for table `marketing_schedule`
--
ALTER TABLE `marketing_schedule`
  ADD CONSTRAINT `marketing_schedule_organizer_id_e980a8c7_fk_auth_user_id` FOREIGN KEY (`organizer_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `marketing_schedule_participants`
--
ALTER TABLE `marketing_schedule_participants`
  ADD CONSTRAINT `marketing_schedule_participants_user_id_097fe3ce_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `marketing_schedule_schedule_id_661a0da6_fk_marketing_schedule_id` FOREIGN KEY (`schedule_id`) REFERENCES `marketing_schedule` (`id`);

--
-- Constraints for table `marketing_site`
--
ALTER TABLE `marketing_site`
  ADD CONSTRAINT `marketing_site_branch_id_6b27072c_fk_organization_unit_id` FOREIGN KEY (`branch_id`) REFERENCES `organization_unit` (`id`),
  ADD CONSTRAINT `marketing_site_engineer_id_aaf63cf5_fk_auth_user_id` FOREIGN KEY (`engineer_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `marketing_siteadvance`
--
ALTER TABLE `marketing_siteadvance`
  ADD CONSTRAINT `marketing_siteadvance_engineer_id_aff5ac58_fk_auth_user_id` FOREIGN KEY (`engineer_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `marketing_siteadvance_site_id_a531731f_fk_marketing_site_id` FOREIGN KEY (`site_id`) REFERENCES `marketing_site` (`id`);

--
-- Constraints for table `marketing_sitebills`
--
ALTER TABLE `marketing_sitebills`
  ADD CONSTRAINT `marketing_sitebills_createdBy_id_d35da398_fk_auth_user_id` FOREIGN KEY (`createdBy_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `marketing_sitebills_site_id_a1163b92_fk_marketing_site_id` FOREIGN KEY (`site_id`) REFERENCES `marketing_site` (`id`);

--
-- Constraints for table `marketing_siteengineerattendance`
--
ALTER TABLE `marketing_siteengineerattendance`
  ADD CONSTRAINT `marketing_siteengineeratte_site_id_233ed56e_fk_marketing_site_id` FOREIGN KEY (`site_id`) REFERENCES `marketing_site` (`id`),
  ADD CONSTRAINT `marketing_siteengineeratten_engineer_id_b28dd8b1_fk_auth_user_id` FOREIGN KEY (`engineer_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `marketing_siteexpenses`
--
ALTER TABLE `marketing_siteexpenses`
  ADD CONSTRAINT `marketing_siteexpenses_site_id_c66afb55_fk_marketing_site_id` FOREIGN KEY (`site_id`) REFERENCES `marketing_site` (`id`);

--
-- Constraints for table `marketing_sparerequest`
--
ALTER TABLE `marketing_sparerequest`
  ADD CONSTRAINT `marketing__tourplanstop_id_c304c5d8_fk_marketing_tourplanstop_id` FOREIGN KEY (`tourplanstop_id`) REFERENCES `marketing_tourplanstop` (`id`),
  ADD CONSTRAINT `marketing_sparerequest_approvedBy_id_000b6942_fk_auth_user_id` FOREIGN KEY (`approvedBy_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `marketing_sparerequest_checkins`
--
ALTER TABLE `marketing_sparerequest_checkins`
  ADD CONSTRAINT `marketing__sparerequest_id_45691efa_fk_marketing_sparerequest_id` FOREIGN KEY (`sparerequest_id`) REFERENCES `marketing_sparerequest` (`id`),
  ADD CONSTRAINT `marketing_sparereque_checkin_id_8ea06686_fk_marketing_checkin_id` FOREIGN KEY (`checkin_id`) REFERENCES `marketing_checkin` (`id`);

--
-- Constraints for table `marketing_ticketlog`
--
ALTER TABLE `marketing_ticketlog`
  ADD CONSTRAINT `marketing_ticket_ticket_id_269f80c8_fk_marketing_tourplanstop_id` FOREIGN KEY (`ticket_id`) REFERENCES `marketing_tourplanstop` (`id`);

--
-- Constraints for table `marketing_tourplan`
--
ALTER TABLE `marketing_tourplan`
  ADD CONSTRAINT `marketing_tourplan_user_id_e81550a4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `marketing_tourplanstop`
--
ALTER TABLE `marketing_tourplanstop`
  ADD CONSTRAINT `marketing_tourp_amc_product_id_75a5999c_fk_marketing_products_id` FOREIGN KEY (`amc_product_id`) REFERENCES `marketing_products` (`id`),
  ADD CONSTRAINT `marketing_tourp_division_id_4cf1b7cf_fk_organization_division_id` FOREIGN KEY (`division_id`) REFERENCES `organization_division` (`id`),
  ADD CONSTRAINT `marketing_tourpla_expense_id_b3d21059_fk_finance_expensesheet_id` FOREIGN KEY (`expense_id`) REFERENCES `finance_expensesheet` (`id`),
  ADD CONSTRAINT `marketing_tourplan_contract_id_6680eb0a_fk_marketing_contract_id` FOREIGN KEY (`contract_id`) REFERENCES `marketing_contract` (`id`),
  ADD CONSTRAINT `marketing_tourplan_tourplan_id_ef9b798c_fk_marketing_tourplan_id` FOREIGN KEY (`tourplan_id`) REFERENCES `marketing_tourplan` (`id`),
  ADD CONSTRAINT `marketing_tourplanst_checkin_id_e6c66d00_fk_marketing_checkin_id` FOREIGN KEY (`checkin_id`) REFERENCES `marketing_checkin` (`id`),
  ADD CONSTRAINT `marketing_tourplanst_contact_id_55266485_fk_marketing_contact_id` FOREIGN KEY (`contact_id`) REFERENCES `marketing_contact` (`id`),
  ADD CONSTRAINT `marketing_tourplanstop_assignedBy_id_91166b21_fk_auth_user_id` FOREIGN KEY (`assignedBy_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `marketing_tourplanstop_cancelledBy_id_d7f32168_fk_auth_user_id` FOREIGN KEY (`cancelledBy_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `marketing_tourplanstop_user_id_186cb4e9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `marketing_tourplanstopindent`
--
ALTER TABLE `marketing_tourplanstopindent`
  ADD CONSTRAINT `marketing__tourplanstop_id_7d24ea7e_fk_marketing_tourplanstop_id` FOREIGN KEY (`tourplanstop_id`) REFERENCES `marketing_tourplanstop` (`id`);

--
-- Constraints for table `marketing_tourplanstop_afterPic`
--
ALTER TABLE `marketing_tourplanstop_afterPic`
  ADD CONSTRAINT `marketing__tourplanstop_id_1bfb3838_fk_marketing_tourplanstop_id` FOREIGN KEY (`tourplanstop_id`) REFERENCES `marketing_tourplanstop` (`id`),
  ADD CONSTRAINT `marketing_tourplanstop_af_media_id_c2279c24_fk_projects_media_id` FOREIGN KEY (`media_id`) REFERENCES `projects_media` (`id`);

--
-- Constraints for table `marketing_tourplanstop_beforePic`
--
ALTER TABLE `marketing_tourplanstop_beforePic`
  ADD CONSTRAINT `marketing__tourplanstop_id_ff39daa8_fk_marketing_tourplanstop_id` FOREIGN KEY (`tourplanstop_id`) REFERENCES `marketing_tourplanstop` (`id`),
  ADD CONSTRAINT `marketing_tourplanstop_be_media_id_2c625acf_fk_projects_media_id` FOREIGN KEY (`media_id`) REFERENCES `projects_media` (`id`);

--
-- Constraints for table `marketing_userassets`
--
ALTER TABLE `marketing_userassets`
  ADD CONSTRAINT `marketing_userassets_engineer_id_a39af917_fk_auth_user_id` FOREIGN KEY (`engineer_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `organization_companyholidays`
--
ALTER TABLE `organization_companyholidays`
  ADD CONSTRAINT `organization_co_division_id_6438f4aa_fk_organization_division_id` FOREIGN KEY (`division_id`) REFERENCES `organization_division` (`id`);

--
-- Constraints for table `organization_departments`
--
ALTER TABLE `organization_departments`
  ADD CONSTRAINT `organization_de_division_id_662a3b25_fk_organization_division_id` FOREIGN KEY (`division_id`) REFERENCES `organization_division` (`id`);

--
-- Constraints for table `organization_departments_contacts`
--
ALTER TABLE `organization_departments_contacts`
  ADD CONSTRAINT `organizat_departments_id_f8dd9d93_fk_organization_departments_id` FOREIGN KEY (`departments_id`) REFERENCES `organization_departments` (`id`),
  ADD CONSTRAINT `organization_departments_contac_user_id_30520ffe_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `organization_homechart`
--
ALTER TABLE `organization_homechart`
  ADD CONSTRAINT `organization_ho_division_id_cd945a44_fk_organization_division_id` FOREIGN KEY (`division_id`) REFERENCES `organization_division` (`id`);

--
-- Constraints for table `organization_installedapp`
--
ALTER TABLE `organization_installedapp`
  ADD CONSTRAINT `organization_inst_parent_id_424a5ec5_fk_organization_division_id` FOREIGN KEY (`parent_id`) REFERENCES `organization_division` (`id`),
  ADD CONSTRAINT `organization_installedapp_addedBy_id_3403e1c7_fk_auth_user_id` FOREIGN KEY (`addedBy_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `organization_installedapp_app_id_5c69fa57_fk_ERP_application_id` FOREIGN KEY (`app_id`) REFERENCES `ERP_application` (`id`);

--
-- Constraints for table `organization_responsibility`
--
ALTER TABLE `organization_responsibility`
  ADD CONSTRAINT `organization_responsibility_user_id_9e1f727e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `organization_responsibility_departments`
--
ALTER TABLE `organization_responsibility_departments`
  ADD CONSTRAINT `org_responsibility_id_155e06db_fk_organization_responsibility_id` FOREIGN KEY (`responsibility_id`) REFERENCES `organization_responsibility` (`id`),
  ADD CONSTRAINT `organizat_departments_id_08880b32_fk_organization_departments_id` FOREIGN KEY (`departments_id`) REFERENCES `organization_departments` (`id`);

--
-- Constraints for table `organization_role`
--
ALTER TABLE `organization_role`
  ADD CONSTRAINT `organization_ro_division_id_bfad4515_fk_organization_division_id` FOREIGN KEY (`division_id`) REFERENCES `organization_division` (`id`);

--
-- Constraints for table `organization_rolepermission`
--
ALTER TABLE `organization_rolepermission`
  ADD CONSTRAINT `organization_rolepermis_menuitem_id_e2c64611_fk_ERP_menuitems_id` FOREIGN KEY (`menuitem_id`) REFERENCES `ERP_menuitems` (`id`),
  ADD CONSTRAINT `organization_rolepermis_role_id_fe6943d9_fk_organization_role_id` FOREIGN KEY (`role_id`) REFERENCES `organization_role` (`id`),
  ADD CONSTRAINT `organization_rolepermissio_app_id_a581f424_fk_ERP_application_id` FOREIGN KEY (`app_id`) REFERENCES `ERP_application` (`id`);

--
-- Constraints for table `organization_role_charts`
--
ALTER TABLE `organization_role_charts`
  ADD CONSTRAINT `organization__homechart_id_a4e58bc6_fk_organization_homechart_id` FOREIGN KEY (`homechart_id`) REFERENCES `organization_homechart` (`id`),
  ADD CONSTRAINT `organization_role_chart_role_id_0c0c5f38_fk_organization_role_id` FOREIGN KEY (`role_id`) REFERENCES `organization_role` (`id`);

--
-- Constraints for table `organization_role_permissions`
--
ALTER TABLE `organization_role_permissions`
  ADD CONSTRAINT `organization_role__application_id_30b3b2a9_fk_ERP_application_id` FOREIGN KEY (`application_id`) REFERENCES `ERP_application` (`id`),
  ADD CONSTRAINT `organization_role_permi_role_id_631f04cb_fk_organization_role_id` FOREIGN KEY (`role_id`) REFERENCES `organization_role` (`id`);

--
-- Constraints for table `organization_role_reports`
--
ALTER TABLE `organization_role_reports`
  ADD CONSTRAINT `organization__homechart_id_dea94877_fk_organization_homechart_id` FOREIGN KEY (`homechart_id`) REFERENCES `organization_homechart` (`id`),
  ADD CONSTRAINT `organization_role_repor_role_id_03ab5850_fk_organization_role_id` FOREIGN KEY (`role_id`) REFERENCES `organization_role` (`id`);

--
-- Constraints for table `organization_unit`
--
ALTER TABLE `organization_unit`
  ADD CONSTRAINT `organization_un_division_id_b8ad4f63_fk_organization_division_id` FOREIGN KEY (`division_id`) REFERENCES `organization_division` (`id`),
  ADD CONSTRAINT `organization_unit_parent_id_ce577442_fk_organization_unit_id` FOREIGN KEY (`parent_id`) REFERENCES `organization_unit` (`id`);

--
-- Constraints for table `payroll_advances`
--
ALTER TABLE `payroll_advances`
  ADD CONSTRAINT `payroll_advances_settlementUser_id_8da153bc_fk_auth_user_id` FOREIGN KEY (`settlementUser_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `payroll_advances_user_id_6d833213_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `payroll_advances_approvers`
--
ALTER TABLE `payroll_advances_approvers`
  ADD CONSTRAINT `payroll_advances_app_advances_id_0101f9a5_fk_payroll_advances_id` FOREIGN KEY (`advances_id`) REFERENCES `payroll_advances` (`id`),
  ADD CONSTRAINT `payroll_advances_approvers_user_id_d49b8103_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `payroll_disbursal`
--
ALTER TABLE `payroll_disbursal`
  ADD CONSTRAINT `payroll_disbursal_account_id_4335445b_fk_finance_account_id` FOREIGN KEY (`account_id`) REFERENCES `finance_account` (`id`);

--
-- Constraints for table `payroll_itdecaration`
--
ALTER TABLE `payroll_itdecaration`
  ADD CONSTRAINT `payroll_itdecaration_user_id_f836dfd2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `payroll_monthlypayslip`
--
ALTER TABLE `payroll_monthlypayslip`
  ADD CONSTRAINT `payroll_monthlypayslip_user_id_70c21417_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `payroll_payrollreport`
--
ALTER TABLE `payroll_payrollreport`
  ADD CONSTRAINT `payroll_payrollreport_user_id_2006454f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `payroll_payslip`
--
ALTER TABLE `payroll_payslip`
  ADD CONSTRAINT `payroll_payslip_report_id_8653abc4_fk_payroll_payrollreport_id` FOREIGN KEY (`report_id`) REFERENCES `payroll_payrollreport` (`id`),
  ADD CONSTRAINT `payroll_payslip_user_id_505eb98b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `performance_feedback`
--
ALTER TABLE `performance_feedback`
  ADD CONSTRAINT `performance_feedback_user_id_48ec773c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `performance_timesheet`
--
ALTER TABLE `performance_timesheet`
  ADD CONSTRAINT `performance_timesheet_user_id_8757f2da_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `performance_timesheet_approvedBy`
--
ALTER TABLE `performance_timesheet_approvedBy`
  ADD CONSTRAINT `performance_ti_timesheet_id_e77a1493_fk_performance_timesheet_id` FOREIGN KEY (`timesheet_id`) REFERENCES `performance_timesheet` (`id`),
  ADD CONSTRAINT `performance_timesheet_approvedB_user_id_635f71b6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `PIM_calendar`
--
ALTER TABLE `PIM_calendar`
  ADD CONSTRAINT `PIM_calend_campaignItem_id_06fec3d4_fk_marketing_campaignitem_id` FOREIGN KEY (`campaignItem_id`) REFERENCES `marketing_campaignitem` (`id`),
  ADD CONSTRAINT `PIM_calendar_orginatedBy_id_d9264025_fk_auth_user_id` FOREIGN KEY (`orginatedBy_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `PIM_calendar_user_id_6516effc_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `PIM_calendar_clients`
--
ALTER TABLE `PIM_calendar_clients`
  ADD CONSTRAINT `PIM_calendar_clients_calendar_id_50348071_fk_PIM_calendar_id` FOREIGN KEY (`calendar_id`) REFERENCES `PIM_calendar` (`id`),
  ADD CONSTRAINT `PIM_calendar_clients_contact_id_6a0bea19_fk_marketing_contact_id` FOREIGN KEY (`contact_id`) REFERENCES `marketing_contact` (`id`);

--
-- Constraints for table `PIM_calendar_followers`
--
ALTER TABLE `PIM_calendar_followers`
  ADD CONSTRAINT `PIM_calendar_followers_calendar_id_f11bf80a_fk_PIM_calendar_id` FOREIGN KEY (`calendar_id`) REFERENCES `PIM_calendar` (`id`),
  ADD CONSTRAINT `PIM_calendar_followers_user_id_a5342bea_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `PIM_calendar_notifications`
--
ALTER TABLE `PIM_calendar_notifications`
  ADD CONSTRAINT `PIM_calendar_not_notification_id_0bd68716_fk_PIM_notification_id` FOREIGN KEY (`notification_id`) REFERENCES `PIM_notification` (`id`),
  ADD CONSTRAINT `PIM_calendar_notificatio_calendar_id_a3b7f929_fk_PIM_calendar_id` FOREIGN KEY (`calendar_id`) REFERENCES `PIM_calendar` (`id`);

--
-- Constraints for table `PIM_chatmessage`
--
ALTER TABLE `PIM_chatmessage`
  ADD CONSTRAINT `PIM_chatmessage_originator_id_d7755173_fk_auth_user_id` FOREIGN KEY (`originator_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `PIM_chatmessage_user_id_c3612e40_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `PIM_notebook`
--
ALTER TABLE `PIM_notebook`
  ADD CONSTRAINT `PIM_notebook_user_id_069e4add_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `PIM_notification`
--
ALTER TABLE `PIM_notification`
  ADD CONSTRAINT `PIM_notification_orginatedBy_id_50c02149_fk_auth_user_id` FOREIGN KEY (`orginatedBy_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `PIM_notification_user_id_d47d452d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `PIM_page`
--
ALTER TABLE `PIM_page`
  ADD CONSTRAINT `PIM_page_parent_id_048dd85f_fk_PIM_notebook_id` FOREIGN KEY (`parent_id`) REFERENCES `PIM_notebook` (`id`),
  ADD CONSTRAINT `PIM_page_user_id_90724495_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `PIM_settings`
--
ALTER TABLE `PIM_settings`
  ADD CONSTRAINT `PIM_settings_user_id_2784d72a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `PIM_theme`
--
ALTER TABLE `PIM_theme`
  ADD CONSTRAINT `PIM_theme_parent_id_a62dc5ac_fk_PIM_settings_id` FOREIGN KEY (`parent_id`) REFERENCES `PIM_settings` (`id`);

--
-- Constraints for table `projects_comment`
--
ALTER TABLE `projects_comment`
  ADD CONSTRAINT `projects_comment_media_id_1669c165_fk_projects_media_id` FOREIGN KEY (`media_id`) REFERENCES `projects_media` (`id`),
  ADD CONSTRAINT `projects_comment_user_id_b974446a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `projects_issues`
--
ALTER TABLE `projects_issues`
  ADD CONSTRAINT `projects_issues_project_id_522a9118_fk_projects_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects_project` (`id`),
  ADD CONSTRAINT `projects_issues_responsible_id_f35c2163_fk_auth_user_id` FOREIGN KEY (`responsible_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `projects_media`
--
ALTER TABLE `projects_media`
  ADD CONSTRAINT `projects_media_user_id_b42778bc_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `projects_project`
--
ALTER TABLE `projects_project`
  ADD CONSTRAINT `projects_project_company_id_66b5c58b_fk_ERP_service_id` FOREIGN KEY (`company_id`) REFERENCES `ERP_service` (`id`),
  ADD CONSTRAINT `projects_project_costCenter_id_69ba0765_fk_finance_costcenter_id` FOREIGN KEY (`costCenter_id`) REFERENCES `finance_costcenter` (`id`),
  ADD CONSTRAINT `projects_project_user_id_719f19dd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `projects_projectcomment`
--
ALTER TABLE `projects_projectcomment`
  ADD CONSTRAINT `projects_projectc_comment_ptr_id_25d426fd_fk_projects_comment_id` FOREIGN KEY (`comment_ptr_id`) REFERENCES `projects_comment` (`id`),
  ADD CONSTRAINT `projects_projectcomme_project_id_c9cb523e_fk_projects_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects_project` (`id`);

--
-- Constraints for table `projects_projectobjective`
--
ALTER TABLE `projects_projectobjective`
  ADD CONSTRAINT `projects_projectobject_parent_id_5d36e6b5_fk_projects_project_id` FOREIGN KEY (`parent_id`) REFERENCES `projects_project` (`id`),
  ADD CONSTRAINT `projects_projectobjective_user_id_e44ca8de_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `projects_project_expenseSheets`
--
ALTER TABLE `projects_project_expenseSheets`
  ADD CONSTRAINT `projects_pro_expensesheet_id_b338eb18_fk_finance_expensesheet_id` FOREIGN KEY (`expensesheet_id`) REFERENCES `finance_expensesheet` (`id`),
  ADD CONSTRAINT `projects_project_expe_project_id_d8705315_fk_projects_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects_project` (`id`);

--
-- Constraints for table `projects_project_files`
--
ALTER TABLE `projects_project_files`
  ADD CONSTRAINT `projects_project_file_project_id_1b037a58_fk_projects_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects_project` (`id`),
  ADD CONSTRAINT `projects_project_files_media_id_ec281eb7_fk_projects_media_id` FOREIGN KEY (`media_id`) REFERENCES `projects_media` (`id`);

--
-- Constraints for table `projects_project_invoices`
--
ALTER TABLE `projects_project_invoices`
  ADD CONSTRAINT `projects_pro_expensesheet_id_ebb178e4_fk_finance_expensesheet_id` FOREIGN KEY (`expensesheet_id`) REFERENCES `finance_expensesheet` (`id`),
  ADD CONSTRAINT `projects_project_invo_project_id_12688c3f_fk_projects_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects_project` (`id`);

--
-- Constraints for table `projects_project_ourBoundInvoices`
--
ALTER TABLE `projects_project_ourBoundInvoices`
  ADD CONSTRAINT `projec_outboundinvoice_id_c911d551_fk_finance_outboundinvoice_id` FOREIGN KEY (`outboundinvoice_id`) REFERENCES `finance_outboundinvoice` (`id`),
  ADD CONSTRAINT `projects_project_ourB_project_id_af653b5c_fk_projects_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects_project` (`id`);

--
-- Constraints for table `projects_project_team`
--
ALTER TABLE `projects_project_team`
  ADD CONSTRAINT `projects_project_team_project_id_517b1c73_fk_projects_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects_project` (`id`),
  ADD CONSTRAINT `projects_project_team_user_id_af44563f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `projects_timelineitem`
--
ALTER TABLE `projects_timelineitem`
  ADD CONSTRAINT `projects_timelineitem_project_id_0b9e57ba_fk_projects_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects_project` (`id`),
  ADD CONSTRAINT `projects_timelineitem_user_id_b6d5790f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `recruitment_interview`
--
ALTER TABLE `recruitment_interview`
  ADD CONSTRAINT `recruitme_candidate_id_4bf8606a_fk_recruitment_jobapplication_id` FOREIGN KEY (`candidate_id`) REFERENCES `recruitment_jobapplication` (`id`),
  ADD CONSTRAINT `recruitment_interview_interviewer_id_df3f2929_fk_auth_user_id` FOREIGN KEY (`interviewer_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `recruitment_jobapplication`
--
ALTER TABLE `recruitment_jobapplication`
  ADD CONSTRAINT `recruitment_jobapplicatio_job_id_b3cfde6a_fk_recruitment_jobs_id` FOREIGN KEY (`job_id`) REFERENCES `recruitment_jobs` (`id`);

--
-- Constraints for table `recruitment_jobs`
--
ALTER TABLE `recruitment_jobs`
  ADD CONSTRAINT `recruitmen_department_id_56f7239f_fk_organization_departments_id` FOREIGN KEY (`department_id`) REFERENCES `organization_departments` (`id`),
  ADD CONSTRAINT `recruitment_jobs_role_id_4bdf077d_fk_organization_role_id` FOREIGN KEY (`role_id`) REFERENCES `organization_role` (`id`),
  ADD CONSTRAINT `recruitment_jobs_unit_id_8bc1cc51_fk_organization_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `organization_unit` (`id`);

--
-- Constraints for table `recruitment_jobs_contacts`
--
ALTER TABLE `recruitment_jobs_contacts`
  ADD CONSTRAINT `recruitment_jobs_contact_jobs_id_fd7712e5_fk_recruitment_jobs_id` FOREIGN KEY (`jobs_id`) REFERENCES `recruitment_jobs` (`id`),
  ADD CONSTRAINT `recruitment_jobs_contacts_user_id_24455a4d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `robots_rule_allowed`
--
ALTER TABLE `robots_rule_allowed`
  ADD CONSTRAINT `robots_rule_allowed_rule_id_aa90358c_fk_robots_rule_id` FOREIGN KEY (`rule_id`) REFERENCES `robots_rule` (`id`),
  ADD CONSTRAINT `robots_rule_allowed_url_id_6157f60a_fk_robots_url_id` FOREIGN KEY (`url_id`) REFERENCES `robots_url` (`id`);

--
-- Constraints for table `robots_rule_disallowed`
--
ALTER TABLE `robots_rule_disallowed`
  ADD CONSTRAINT `robots_rule_disallowed_rule_id_fad7328c_fk_robots_rule_id` FOREIGN KEY (`rule_id`) REFERENCES `robots_rule` (`id`),
  ADD CONSTRAINT `robots_rule_disallowed_url_id_8e02db92_fk_robots_url_id` FOREIGN KEY (`url_id`) REFERENCES `robots_url` (`id`);

--
-- Constraints for table `robots_rule_sites`
--
ALTER TABLE `robots_rule_sites`
  ADD CONSTRAINT `robots_rule_sites_rule_id_7921a799_fk_robots_rule_id` FOREIGN KEY (`rule_id`) REFERENCES `robots_rule` (`id`),
  ADD CONSTRAINT `robots_rule_sites_site_id_efe5be97_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Constraints for table `social_album`
--
ALTER TABLE `social_album`
  ADD CONSTRAINT `social_album_user_id_440fee33_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `social_albumfollower`
--
ALTER TABLE `social_albumfollower`
  ADD CONSTRAINT `social_albumfollower_follow_ptr_id_94bfd06e_fk_social_follow_id` FOREIGN KEY (`follow_ptr_id`) REFERENCES `social_follow` (`id`),
  ADD CONSTRAINT `social_albumfollower_parent_id_09827ebc_fk_social_album_id` FOREIGN KEY (`parent_id`) REFERENCES `social_album` (`id`);

--
-- Constraints for table `social_album_tagged`
--
ALTER TABLE `social_album_tagged`
  ADD CONSTRAINT `social_album_tagged_album_id_c86c0b39_fk_social_album_id` FOREIGN KEY (`album_id`) REFERENCES `social_album` (`id`),
  ADD CONSTRAINT `social_album_tagged_user_id_70b3e088_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `social_comment`
--
ALTER TABLE `social_comment`
  ADD CONSTRAINT `social_comment_user_id_1de4ccfb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `social_commentlike`
--
ALTER TABLE `social_commentlike`
  ADD CONSTRAINT `social_commentlike_like_ptr_id_c29d503c_fk_social_like_id` FOREIGN KEY (`like_ptr_id`) REFERENCES `social_like` (`id`),
  ADD CONSTRAINT `social_commentlike_parent_id_920a7b51_fk_social_comment_id` FOREIGN KEY (`parent_id`) REFERENCES `social_comment` (`id`);

--
-- Constraints for table `social_comment_tagged`
--
ALTER TABLE `social_comment_tagged`
  ADD CONSTRAINT `social_comment_tagged_comment_id_ca92c0b7_fk_social_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `social_comment` (`id`),
  ADD CONSTRAINT `social_comment_tagged_user_id_ea322eda_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `social_follow`
--
ALTER TABLE `social_follow`
  ADD CONSTRAINT `social_follow_user_id_7d451551_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `social_like`
--
ALTER TABLE `social_like`
  ADD CONSTRAINT `social_like_user_id_09067f26_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `social_picture`
--
ALTER TABLE `social_picture`
  ADD CONSTRAINT `social_picture_album_id_95e565a3_fk_social_album_id` FOREIGN KEY (`album_id`) REFERENCES `social_album` (`id`),
  ADD CONSTRAINT `social_picture_user_id_9a114117_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `social_picturecomment`
--
ALTER TABLE `social_picturecomment`
  ADD CONSTRAINT `social_picturecomme_comment_ptr_id_bd260bc8_fk_social_comment_id` FOREIGN KEY (`comment_ptr_id`) REFERENCES `social_comment` (`id`),
  ADD CONSTRAINT `social_picturecomment_parent_id_60d647f4_fk_social_picture_id` FOREIGN KEY (`parent_id`) REFERENCES `social_picture` (`id`);

--
-- Constraints for table `social_picturelike`
--
ALTER TABLE `social_picturelike`
  ADD CONSTRAINT `social_picturelike_like_ptr_id_969fab79_fk_social_like_id` FOREIGN KEY (`like_ptr_id`) REFERENCES `social_like` (`id`),
  ADD CONSTRAINT `social_picturelike_parent_id_10a2a264_fk_social_picture_id` FOREIGN KEY (`parent_id`) REFERENCES `social_picture` (`id`);

--
-- Constraints for table `social_picture_tagged`
--
ALTER TABLE `social_picture_tagged`
  ADD CONSTRAINT `social_picture_tagged_picture_id_6519ff29_fk_social_picture_id` FOREIGN KEY (`picture_id`) REFERENCES `social_picture` (`id`),
  ADD CONSTRAINT `social_picture_tagged_user_id_e2d38f81_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `social_post`
--
ALTER TABLE `social_post`
  ADD CONSTRAINT `social_post_user_id_6317b44d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `social_postcomment`
--
ALTER TABLE `social_postcomment`
  ADD CONSTRAINT `social_postcomment_comment_ptr_id_20d56009_fk_social_comment_id` FOREIGN KEY (`comment_ptr_id`) REFERENCES `social_comment` (`id`),
  ADD CONSTRAINT `social_postcomment_parent_id_7df8b855_fk_social_post_id` FOREIGN KEY (`parent_id`) REFERENCES `social_post` (`id`);

--
-- Constraints for table `social_postfollower`
--
ALTER TABLE `social_postfollower`
  ADD CONSTRAINT `social_postfollower_follow_ptr_id_8ff14968_fk_social_follow_id` FOREIGN KEY (`follow_ptr_id`) REFERENCES `social_follow` (`id`),
  ADD CONSTRAINT `social_postfollower_parent_id_5728ae71_fk_social_post_id` FOREIGN KEY (`parent_id`) REFERENCES `social_post` (`id`);

--
-- Constraints for table `social_posthistory`
--
ALTER TABLE `social_posthistory`
  ADD CONSTRAINT `social_posthistory_parent_id_a15bf345_fk_social_post_id` FOREIGN KEY (`parent_id`) REFERENCES `social_post` (`id`);

--
-- Constraints for table `social_postlike`
--
ALTER TABLE `social_postlike`
  ADD CONSTRAINT `social_postlike_like_ptr_id_2dcc62b7_fk_social_like_id` FOREIGN KEY (`like_ptr_id`) REFERENCES `social_like` (`id`),
  ADD CONSTRAINT `social_postlike_parent_id_c7dc74e7_fk_social_post_id` FOREIGN KEY (`parent_id`) REFERENCES `social_post` (`id`);

--
-- Constraints for table `social_post_tagged`
--
ALTER TABLE `social_post_tagged`
  ADD CONSTRAINT `social_post_tagged_post_id_97c9de3f_fk_social_post_id` FOREIGN KEY (`post_id`) REFERENCES `social_post` (`id`),
  ADD CONSTRAINT `social_post_tagged_user_id_df9d0305_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `social_publications`
--
ALTER TABLE `social_publications`
  ADD CONSTRAINT `social_publications_author_id_e528ab94_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `social_skill`
--
ALTER TABLE `social_skill`
  ADD CONSTRAINT `social_skill_user_id_7b36aaef_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `social_skill_endoresement`
--
ALTER TABLE `social_skill_endoresement`
  ADD CONSTRAINT `social_skill_endoresement_skill_id_fd4be2b5_fk_social_skill_id` FOREIGN KEY (`skill_id`) REFERENCES `social_skill` (`id`),
  ADD CONSTRAINT `social_skill_endoresement_user_id_81d66d72_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `social_social`
--
ALTER TABLE `social_social`
  ADD CONSTRAINT `social_social_user_id_94d6c7e2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `social_social_followers`
--
ALTER TABLE `social_social_followers`
  ADD CONSTRAINT `social_social_followers_social_id_0e45369d_fk_social_social_id` FOREIGN KEY (`social_id`) REFERENCES `social_social` (`id`),
  ADD CONSTRAINT `social_social_followers_user_id_bf8e73f9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `taskBoard_media`
--
ALTER TABLE `taskBoard_media`
  ADD CONSTRAINT `taskBoard_media_user_id_249b23da_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `taskBoard_subtask`
--
ALTER TABLE `taskBoard_subtask`
  ADD CONSTRAINT `taskBoard_subtask_task_id_68261f79_fk_taskBoard_task_id` FOREIGN KEY (`task_id`) REFERENCES `taskBoard_task` (`id`),
  ADD CONSTRAINT `taskBoard_subtask_user_id_fc818fa6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `taskBoard_task`
--
ALTER TABLE `taskBoard_task`
  ADD CONSTRAINT `taskBoard_task_project_id_f20bed10_fk_projects_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects_project` (`id`),
  ADD CONSTRAINT `taskBoard_task_to_id_1ad03dcd_fk_auth_user_id` FOREIGN KEY (`to_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `taskBoard_task_user_id_83902c50_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `taskBoard_taskworkbook`
--
ALTER TABLE `taskBoard_taskworkbook`
  ADD CONSTRAINT `taskBoard_taskworkbook_user_id_7df7bd4f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `taskBoard_task_files`
--
ALTER TABLE `taskBoard_task_files`
  ADD CONSTRAINT `taskBoard_task_files_media_id_4ca22d30_fk_taskBoard_media_id` FOREIGN KEY (`media_id`) REFERENCES `taskBoard_media` (`id`),
  ADD CONSTRAINT `taskBoard_task_files_task_id_0ae37a6d_fk_taskBoard_task_id` FOREIGN KEY (`task_id`) REFERENCES `taskBoard_task` (`id`);

--
-- Constraints for table `taskBoard_task_followers`
--
ALTER TABLE `taskBoard_task_followers`
  ADD CONSTRAINT `taskBoard_task_followers_task_id_dde3348f_fk_taskBoard_task_id` FOREIGN KEY (`task_id`) REFERENCES `taskBoard_task` (`id`),
  ADD CONSTRAINT `taskBoard_task_followers_user_id_26504e38_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `taskBoard_timelineitem`
--
ALTER TABLE `taskBoard_timelineitem`
  ADD CONSTRAINT `taskBoard_tim_commit_id_f5b0287a_fk_gitweb_commitnotification_id` FOREIGN KEY (`commit_id`) REFERENCES `gitweb_commitnotification` (`id`),
  ADD CONSTRAINT `taskBoard_timelineitem_task_id_2c697ee0_fk_taskBoard_task_id` FOREIGN KEY (`task_id`) REFERENCES `taskBoard_task` (`id`),
  ADD CONSTRAINT `taskBoard_timelineitem_user_id_af67d305_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `website_components`
--
ALTER TABLE `website_components`
  ADD CONSTRAINT `website_components_parent_id_d838db78_fk_website_page_id` FOREIGN KEY (`parent_id`) REFERENCES `website_page` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
