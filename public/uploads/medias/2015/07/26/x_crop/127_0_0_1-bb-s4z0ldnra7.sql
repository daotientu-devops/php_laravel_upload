-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2015 at 04:14 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `qc`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
`id` int(11) NOT NULL,
  `account_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `account_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `order_no` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `account_type`, `account_name`, `parent_id`, `created_at`, `updated_at`, `order_no`, `status`) VALUES
(1, 'MANAGER', 'Manager', 0, '2015-05-23 09:21:39', '2015-05-16 01:34:41', 0, 1),
(2, 'ADMIN', 'Administrator', 1, '2015-05-23 09:21:39', '2015-05-16 01:34:41', 0, 1),
(3, 'ADVERTISER', 'Advertiser', 0, '2015-04-20 09:56:32', '2014-12-23 01:41:49', 0, 1);

--
-- Triggers `accounts`
--
DELIMITER //
CREATE TRIGGER `delete_accounts_row` BEFORE DELETE ON `accounts`
 FOR EACH ROW BEGIN UPDATE accounts SET hide="Y" WHERE id=pID; END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `update_accounts_row` BEFORE UPDATE ON `accounts`
 FOR EACH ROW BEGIN
  UPDATE accounts SET hide = 'Y' WHERE id = pID;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `adtypes`
--

CREATE TABLE IF NOT EXISTS `adtypes` (
`id` int(11) NOT NULL,
  `zonetype_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `preview` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `order_no` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `standard` int(1) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adtypes`
--

INSERT INTO `adtypes` (`id`, `zonetype_id`, `title`, `preview`, `width`, `height`, `order_no`, `created_at`, `updated_at`, `standard`, `status`) VALUES
(24, 1, 'Full Banner (468 x 60)', 'default.png', 468, 60, 1, '2015-05-23 09:24:59', '2015-05-16 01:36:12', 0, 1),
(25, 1, 'Skyscraper (120 x 600)', 'default.png', 120, 600, 2, '2015-05-23 09:24:59', '2015-05-16 01:36:34', 0, 1),
(26, 1, 'Leaderboard (728 x 90)', 'default.png', 728, 90, 3, '2015-05-23 09:24:59', '2015-05-16 01:36:59', 0, 1),
(27, 1, 'Button 1 (120 x 90)', 'default.png', 120, 90, 4, '2015-05-23 09:24:59', '2015-05-16 01:37:14', 0, 1),
(28, 1, 'Button 2 (120 x 60)', 'default.png', 120, 60, 5, '2015-05-23 09:24:59', '2015-05-16 01:37:30', 0, 1),
(29, 1, 'Half Banner (234 x 60)', 'default.png', 234, 60, 6, '2015-05-23 09:24:59', '2015-05-16 01:37:51', 0, 1),
(30, 1, 'Micro Bar (88 x 31)', 'default.png', 88, 31, 7, '2015-05-23 09:24:59', '2015-05-16 01:38:12', 0, 1),
(31, 1, 'Square Button (125 x 125)', 'default.png', 125, 125, 8, '2015-05-23 09:24:59', '2015-05-16 01:38:31', 0, 1),
(32, 1, 'Vertical Banner (120 x 240)', 'default.png', 120, 240, 9, '2015-05-23 09:24:59', '2015-05-16 01:38:49', 0, 1),
(33, 1, 'Rectangle (180 x 150)', 'default.png', 180, 150, 10, '2015-05-23 09:24:59', '2015-05-16 01:39:07', 0, 1),
(34, 1, 'Medium Rectangle (300 x 250)', 'default.png', 300, 250, 11, '2015-05-23 09:24:59', '2015-05-16 01:39:17', 0, 1),
(35, 1, 'Large Rectangle (336 x 280)', 'default.png', 336, 280, 12, '2015-05-23 09:24:59', '2015-05-16 01:39:33', 0, 1),
(36, 1, 'Vertical Rectangle (240 x 400)', 'default.png', 240, 400, 13, '2015-05-23 09:24:59', '2015-05-16 01:39:49', 0, 1),
(37, 1, 'Square Pop-up (250 x 250)', 'default.png', 250, 250, 14, '2015-05-23 09:24:59', '2015-05-16 01:40:03', 0, 1),
(38, 1, 'Wide Skyscraper (160 x 600)', 'default.png', 160, 600, 15, '2015-05-23 09:24:59', '2015-05-16 01:40:17', 0, 1),
(39, 1, 'Half Page (300 x 600)', 'default.png', 300, 600, 16, '2015-05-23 09:24:59', '2015-05-16 01:40:31', 0, 1),
(40, 1, 'HTxx (366 x 90)', 'default.png', 366, 90, 17, '2015-05-23 09:24:59', '2015-05-16 01:40:43', 0, 1),
(41, 1, 'Ads (495 x 90)', 'default.png', 495, 90, 18, '2015-05-23 09:24:59', '2015-05-16 01:40:56', 0, 1),
(42, 1, 'Ads (200 x 600)', 'default.png', 200, 600, 19, '2015-05-23 09:24:59', '2015-05-16 01:41:09', 0, 1),
(43, 1, 'TT Mobile (320x100)', 'default.png', 320, 100, 20, '2015-05-23 09:24:59', '2015-05-16 01:41:23', 0, 1),
(44, 1, 'TT Mobile (320x250)', 'default.png', 320, 250, 21, '2015-05-23 09:24:59', '2015-05-16 01:41:52', 0, 1),
(45, 1, 'TT Mobile Đáp ứng', 'default.png', 0, 0, 22, '2015-05-23 09:24:59', '2015-05-16 01:42:25', 0, 1);

--
-- Triggers `adtypes`
--
DELIMITER //
CREATE TRIGGER `delete_adtypes_row` BEFORE DELETE ON `adtypes`
 FOR EACH ROW BEGIN UPDATE adtypes SET hide="Y" WHERE id=pID; END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `update_adtypes_row` BEFORE UPDATE ON `adtypes`
 FOR EACH ROW BEGIN
  UPDATE adtypes SET hide = 'Y' WHERE id = pID;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE IF NOT EXISTS `banners` (
`id` int(11) NOT NULL,
  `website_id` int(11) NOT NULL DEFAULT '1',
  `zoneid` int(11) NOT NULL,
  `contenttype` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `pluginversion` int(9) NOT NULL,
  `storagetype` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imageurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `htmltemplate` text COLLATE utf8_unicode_ci NOT NULL,
  `htmlcache` text COLLATE utf8_unicode_ci NOT NULL,
  `width` int(6) NOT NULL,
  `height` int(6) NOT NULL,
  `weight` int(4) NOT NULL,
  `seq` int(4) NOT NULL,
  `target` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `url` text COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `statustext` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bannertext` text COLLATE utf8_unicode_ci NOT NULL,
  `imagetext` text COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adserver` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `block` int(11) NOT NULL,
  `capping` int(11) NOT NULL,
  `session_capping` int(11) NOT NULL,
  `compiledlimitation` text COLLATE utf8_unicode_ci NOT NULL,
  `acl_plugins` text COLLATE utf8_unicode_ci NOT NULL,
  `append` int(4) NOT NULL,
  `appendtype` int(4) NOT NULL,
  `bannertype` int(4) NOT NULL,
  `alt_filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alt_imageurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alt_contenttype` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `comments` text COLLATE utf8_unicode_ci,
  `views` int(11) NOT NULL,
  `total_clicks` int(11) NOT NULL,
  `unique_click` int(11) NOT NULL,
  `acls_updated` datetime NOT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `transparent` int(1) NOT NULL,
  `parameters` text COLLATE utf8_unicode_ci NOT NULL,
  `an_banner_id` int(11) NOT NULL,
  `as_banner_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `mark` int(1) NOT NULL,
  `ad_direct_status` int(4) NOT NULL,
  `ad_direct_rejection_reason_id` int(4) NOT NULL,
  `ext_bannertype` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_no` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `website_id`, `zoneid`, `contenttype`, `pluginversion`, `storagetype`, `filename`, `imageurl`, `htmltemplate`, `htmlcache`, `width`, `height`, `weight`, `seq`, `target`, `url`, `title`, `alt`, `statustext`, `bannertext`, `imagetext`, `description`, `adserver`, `block`, `capping`, `session_capping`, `compiledlimitation`, `acl_plugins`, `append`, `appendtype`, `bannertype`, `alt_filename`, `alt_imageurl`, `alt_contenttype`, `comments`, `views`, `total_clicks`, `unique_click`, `acls_updated`, `keyword`, `transparent`, `parameters`, `an_banner_id`, `as_banner_id`, `status`, `mark`, `ad_direct_status`, `ad_direct_rejection_reason_id`, `ext_bannertype`, `order_no`, `created_at`, `updated_at`) VALUES
(14, 4, 8, '', 0, 'web', 'uploads/adbanner_images/2014-12-30/av/4q/xk4ljil2ifz0isknwia7378gv056.suckhoe.gif', '', '', '', 732, 90, 0, 0, '', 'http://sacdepvasuckhoe.wordpress.com/2014/12/19/qua-tang-giang-sinh-nam-moi/', 'Tin tức Việt Nam', '', '', '', '', 'Banner top header sacdepvasuckhoe 02', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 1134, 176, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 1, '2015-05-23 09:52:20', '2015-05-22 05:32:51'),
(15, 4, 8, '', 0, 'web', 'uploads/adbanner_images/2014-12-23/cb/1l/dx1st2zd8h0tlf7cq6ljzlbvkcrx.QC-on-tintuc_366x90.jpg', '', '', '', 366, 90, 0, 0, '', 'http://domainday.vn/', 'Tin tức Việt Nam', '', '', '', '', 'Banner HT02', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 682, 118, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 2, '2015-05-23 09:52:20', '2014-12-30 00:37:10'),
(16, 4, 9, '', 0, 'web', 'files/jY8DoJyv2m.HC01.jpg', '', '', '', 495, 90, 0, 0, '', 'http://tintuc.vn/', 'Tin tức Việt Nam', '', '', '', '', 'Banner HC01', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 7, 1, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 3, '2015-05-23 09:52:20', '2015-05-22 05:32:01'),
(17, 4, 10, '', 0, 'web', 'files/tpKoF3bsvd.HC02.jpg', '', '', '', 495, 90, 0, 0, '', 'http://tintuc.vn/', 'Tin tức Việt Nam', '', '', '', '', 'Banner HC02', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 3, 0, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 4, '2015-05-23 09:52:20', '2015-05-22 05:31:03'),
(18, 4, 11, '', 0, 'web', 'files/NuhR1YSdDC.HC03.jpg', '', '', '', 495, 90, 0, 0, '', 'http://tintuc.vn/', 'Tin tức Việt Nam', '', '', '', '', 'Banner HC03', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 5, '2015-05-23 09:52:20', '2015-05-22 05:30:12'),
(19, 4, 12, '', 0, 'web', 'files/cblXgzVrZb.HC04.jpg', '', '', '', 495, 90, 0, 0, '', 'http://tintuc.vn/', 'Tin tức Việt Nam', '', '', '', '', 'Banner HC04', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 6, '2015-05-23 09:52:20', '2015-05-22 05:28:15'),
(20, 4, 13, '', 0, 'html', '', '', '<div class="ads-space">\r\n         <script async src="http://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\r\n         <ins class="adsbygoogle"\r\n              style="display:inline-block;width:160px;height:600px"\r\n              data-ad-client="ca-pub-5128894772635532"\r\n              data-ad-slot="4229753200"></ins>\r\n         <script>\r\n         (adsbygoogle = window.adsbygoogle || []).push({});\r\n         </script>\r\n        </div>', '', 160, 600, 0, 0, '', 'http://tintuc.vn/', 'Tin tức Việt Nam', '', '', '', '', 'Banner C01', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 470, 143, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 7, '2015-05-23 09:52:20', '2015-05-22 05:26:44'),
(21, 4, 14, '', 0, 'web', 'files/sH3X0wN6f6.DL01.jpg', '', '', '', 160, 600, 0, 0, '', 'http://tintuc.vn/', 'Tin tức Việt Nam', '', '', '', '', 'Banner DL01', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 8, '2015-05-23 09:52:20', '2015-05-22 05:24:55'),
(22, 4, 4, '', 0, 'html', '', '', '<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\r\n<ins class="adsbygoogle"\r\n     style="display:inline-block;width:728px;height:90px"\r\n     data-ad-client="ca-pub-5128894772635532"\r\n     data-ad-slot="1537409204"></ins>\r\n<script>\r\n(adsbygoogle = window.adsbygoogle || []).push({});\r\n</script>', '', 728, 90, 1, 0, '', 'http://skcd.com.vn/', '', '', '', '', '', '', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', 'sức khỏe, cộng đồng', 0, '', 0, 0, 1, 0, 0, 0, '', 9, '2015-05-23 09:52:20', '2015-05-22 05:24:00'),
(23, 4, 5, '', 0, 'html', '', '', '<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\r\n<ins class="adsbygoogle"\r\n     style="display:inline-block;width:300px;height:250px"\r\n     data-ad-client="ca-pub-5128894772635532"\r\n     data-ad-slot="3014142402"></ins>\r\n<script>\r\n(adsbygoogle = window.adsbygoogle || []).push({});\r\n</script>', '', 300, 250, 1, 0, '', 'http://skcd.com.vn/', '', '', '', '', '', 'Banner Right Top skcd.com.vn', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', 'sức khỏe, cộng đồng', 0, '', 0, 0, 1, 0, 0, 0, '', 10, '2015-05-23 09:52:20', '2015-05-22 05:23:10'),
(24, 4, 6, '', 0, 'html', '', '', '<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\r\n<ins class="adsbygoogle"\r\n     style="display:inline-block;width:300px;height:600px"\r\n     data-ad-client="ca-pub-5128894772635532"\r\n     data-ad-slot="4490875609"></ins>\r\n<script>\r\n(adsbygoogle = window.adsbygoogle || []).push({});\r\n</script>', '', 300, 600, 1, 0, '', 'http://skcd.com.vn/', '', '', '', '', '', 'Banner Right Middle skcd.com.vn', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', 'sức khỏe, cộng đồng', 0, '', 0, 0, 1, 0, 0, 0, '', 11, '2015-05-23 09:52:20', '2015-05-22 05:21:57'),
(25, 4, 15, '', 0, 'html', '', '', '<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\r\n<ins class="adsbygoogle"\r\n     style="display:inline-block;width:320px;height:100px"\r\n     data-ad-client="ca-pub-5128894772635532"\r\n     data-ad-slot="4769966800"></ins>\r\n<script>\r\n(adsbygoogle = window.adsbygoogle || []).push({});\r\n</script>', '', 320, 100, 1, 0, '', '', '', '', '', '', '', 'Banner quảng cáo trên mobile kích thước 320x100px', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 12, '2015-05-23 09:52:20', '2015-05-22 05:21:07'),
(26, 4, 16, '', 0, 'html', '', '', '<script async src="http://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\r\n<ins class="adsbygoogle"\r\n     style="display:inline-block;width:320px;height:250px"\r\n     data-ad-client="ca-pub-5128894772635532"\r\n     data-ad-slot="6246700000"></ins>\r\n<script>\r\n(adsbygoogle = window.adsbygoogle || []).push({});\r\n</script>', '', 320, 250, 1, 0, '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 13, '2015-05-23 09:52:20', '2015-05-22 05:18:32'),
(27, 4, 17, '', 0, 'html', '', '', '<script async src="http://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\r\n<ins class="adsbygoogle"\r\n     style="display:block"\r\n     data-ad-client="ca-pub-5128894772635532"\r\n     data-ad-slot="7723433202"\r\n     data-ad-format="auto"></ins>\r\n<script>\r\n(adsbygoogle = window.adsbygoogle || []).push({});\r\n</script>', '', 300, 250, 1, 0, '', '', '', '', '', '', '', 'Banner quảng cáo trên mobile kích thước tùy chỉnh', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 14, '2015-05-23 09:52:20', '2015-05-22 05:17:54'),
(28, 5, 18, '', 0, 'html', '', '', '<script async src="http://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\r\n<ins class="adsbygoogle"\r\n     style="display:inline-block;width:300px;height:250px"\r\n     data-ad-client="ca-pub-5128894772635532"\r\n     data-ad-slot="3014142402"></ins>\r\n<script>\r\n(adsbygoogle = window.adsbygoogle || []).push({});\r\n</script>', '', 300, 250, 0, 0, '', '', '', '', '', '', '', 'Banner Google Adsense hiển thị dưới phần comment', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 15, '2015-05-23 09:52:20', '2015-05-22 05:16:19'),
(29, 5, 19, '', 0, 'html', '', '', '<script async src="http://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\r\n<ins class="adsbygoogle"\r\n     style="display:inline-block;width:300px;height:250px"\r\n     data-ad-client="ca-pub-5128894772635532"\r\n     data-ad-slot="3014142402"></ins>\r\n<script>\r\n(adsbygoogle = window.adsbygoogle || []).push({});\r\n</script>', '', 300, 250, 0, 0, '', '', '', '', '', '', '', 'Banner Google Adsense hiển thị dưới bài nổi bật của trang chuyên mục', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 16, '2015-05-23 09:52:20', '2015-05-22 05:15:46'),
(30, 5, 20, '', 0, 'html', '', '', '<script async src="http://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\r\n<ins class="adsbygoogle"\r\n     style="display:inline-block;width:300px;height:250px"\r\n     data-ad-client="ca-pub-5128894772635532"\r\n     data-ad-slot="3014142402"></ins>\r\n<script>\r\n(adsbygoogle = window.adsbygoogle || []).push({});\r\n</script>', '', 300, 250, 0, 0, '', '', '', '', '', '', '', 'Banner Google Adsense hiển thị trên trang chủ phiên bản mobile của trang tintuc.vn', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 17, '2015-05-23 09:52:20', '2015-05-22 05:14:49'),
(31, 5, 21, '', 0, 'html', '', '', '<script async src="http://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\r\n<ins class="adsbygoogle"\r\n     style="display:inline-block;width:300px;height:250px"\r\n     data-ad-client="ca-pub-5128894772635532"\r\n     data-ad-slot="3014142402"></ins>\r\n<script>\r\n(adsbygoogle = window.adsbygoogle || []).push({});\r\n</script>', '', 300, 250, 0, 0, '', '', '', '', '', '', '', 'Banner Google Adsense hiển thị dưới cùng trên trang chuyên mục phiên bản mobile của trang tintuc.vn', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 18, '2015-05-23 09:52:20', '2015-05-22 05:14:03'),
(32, 5, 23, '', 0, 'html', '', '', '<script async src="http://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\r\n<ins class="adsbygoogle"\r\n     style="display:inline-block;width:300px;height:250px"\r\n     data-ad-client="ca-pub-5128894772635532"\r\n     data-ad-slot="3014142402"></ins>\r\n<script>\r\n(adsbygoogle = window.adsbygoogle || []).push({});\r\n</script>', '', 300, 250, 0, 0, '', '', '', '', '', '', '', 'Banner Google Adsense hiển thị trên trang tag (tiêu điểm) phiên bản mobile của trang tintuc.vn', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 19, '2015-05-23 09:52:20', '2015-05-22 05:12:39'),
(33, 5, 24, '', 0, 'html', '', '', '<script async src="http://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\r\n<ins class="adsbygoogle"\r\n     style="display:inline-block;width:300px;height:250px"\r\n     data-ad-client="ca-pub-5128894772635532"\r\n     data-ad-slot="3014142402"></ins>\r\n<script>\r\n(adsbygoogle = window.adsbygoogle || []).push({});\r\n</script>', '', 300, 250, 0, 0, '', '', '', '', '', '', '', 'Banner Google Adsense hiển thị trên trang tin hot phiên bản mobile của trang tintuc.vn', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 20, '2015-05-23 09:52:20', '2015-05-22 05:11:41'),
(34, 5, 25, '', 0, 'html', '', '', '<script async src="http://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\r\n<ins class="adsbygoogle"\r\n     style="display:inline-block;width:300px;height:250px"\r\n     data-ad-client="ca-pub-5128894772635532"\r\n     data-ad-slot="3014142402"></ins>\r\n<script>\r\n(adsbygoogle = window.adsbygoogle || []).push({});\r\n</script>', '', 300, 250, 0, 0, '', '', '', '', '', '', '', 'Banner Google Adsense hiển thị trên trang tin tức 24h phiên bản mobile của trang tintuc.vn', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 21, '2015-05-23 09:52:20', '2015-05-22 05:08:13'),
(35, 5, 22, '', 0, 'html', '', '', '<script async src="http://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\r\n<ins class="adsbygoogle"\r\n     style="display:inline-block;width:300px;height:250px"\r\n     data-ad-client="ca-pub-5128894772635532"\r\n     data-ad-slot="3014142402"></ins>\r\n<script>\r\n(adsbygoogle = window.adsbygoogle || []).push({});\r\n</script>', '', 300, 250, 0, 0, '', '', '', '', '', '', '', 'Banner Google Adsense hiển thị trang chi tiết trên phiên bản mobile của trang tintuc.vn', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 22, '2015-05-23 09:52:20', '2015-05-22 05:07:26'),
(36, 4, 26, '', 0, 'web', 'uploads/adbanner_images/2014-12-16/6v/xm/qo0ucei1jhcipwoneaosdnnb6gad.timvexekhach.png', '', '', '', 300, 90, 1, 0, '', 'http://oto-xemay.vn/tim-ve-xe-khach-truc-tuyen.html', '', '', '', '', '', 'Banner quảng cáo cột phải chuyên mục ô tô - xe máy', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 175, 164, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 23, '2015-05-23 09:52:20', '2015-05-22 23:26:49'),
(37, 4, 7, '', 0, 'html', '', '', '<script async src="http://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\r\n<!-- p-728x90 -->\r\n<ins class="adsbygoogle"\r\n     style="display:inline-block;width:728px;height:90px"\r\n     data-ad-client="ca-pub-5128894772635532"\r\n     data-ad-slot="8148167208"></ins>\r\n<script>\r\n(adsbygoogle = window.adsbygoogle || []).push({});\r\n</script>', '', 728, 90, 1, 0, '', '', '', '', '', '', '', 'Banner top header sacdepvasuckhoe 01', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 3242, 2766, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 24, '2015-05-23 09:52:20', '2015-05-22 05:04:08'),
(38, 4, 27, '', 0, 'html', '', '', '<div class="ads-space" style="margin-top: 15px;">\r\n         <script async src="http://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\r\n         <ins class="adsbygoogle"\r\n              style="display:inline-block;width:160px;height:600px"\r\n              data-ad-client="ca-pub-5128894772635532"\r\n              data-ad-slot="4229753200"></ins>\r\n         <script>\r\n         (adsbygoogle = window.adsbygoogle || []).push({});\r\n         </script>\r\n        </div>', '', 160, 600, 1, 0, '', '', '', '', '', '', '', 'Banner Google Adsense hiển thị trên trang tin tức 24h của trang tintuc.vn', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 25, '2015-05-23 09:52:20', '2015-05-22 05:00:23'),
(39, 6, 28, '', 0, 'web', 'uploads/adbanner_images/2015-01-26/rw/vu/k60qhjob43qj35xnwgej75nulg7c.Pho Ong Hung_banner tin tuc moi_26.1.jpg', '', '', '', 300, 500, 1, 0, '', 'http://phoonghung.vn/vi/tin-tuc/hop-bao-chuong-trinh-thach-thuc-pho-khong-lo-nam-2015-92.html', '', 'Banner quảng cáo cho CÔNG TY TNHH THÔNG TIN TRƯỜNG PHÁT', '', '', '', 'Banner quảng cáo cho CÔNG TY TNHH THÔNG TIN TRƯỜNG PHÁT (trên trang chủ)', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 101, 97, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 26, '2015-05-23 09:52:20', '2015-05-22 04:59:21'),
(41, 6, 29, '', 0, 'html', '', '', '<script async src="http://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\r\n<ins class="adsbygoogle"\r\n     style="display:inline-block;width:300px;height:250px"\r\n     data-ad-client="ca-pub-5128894772635532"\r\n     data-ad-slot="3014142402"></ins>\r\n<script>\r\n(adsbygoogle = window.adsbygoogle || []).push({});\r\n</script>', '', 300, 250, 1, 0, '', '', '', 'Banner quảng cáo cho CÔNG TY TNHH THÔNG TIN TRƯỜNG PHÁT', '', '', '', 'Banner quảng cáo (trên trang danh mục)', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 1854, 1683, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 28, '2015-05-23 09:52:20', '2015-05-22 04:58:27'),
(42, 4, 30, '', 0, 'html', '', '', '<script async src="http://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\r\n<ins class="adsbygoogle"\r\n     style="display:inline-block;width:300px;height:250px"\r\n     data-ad-client="ca-pub-5128894772635532"\r\n     data-ad-slot="3014142402"></ins>\r\n<script>\r\n(adsbygoogle = window.adsbygoogle || []).push({});\r\n</script>', '', 300, 250, 1, 0, '', '', '', '', '', '', '', 'Banner 300 x 250', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 29, '2015-05-23 09:52:20', '2015-05-22 04:54:59'),
(43, 4, 31, '', 0, 'html', '', '', '<script async src="http://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\r\n<!-- tt-728x90 -->\r\n<ins class="adsbygoogle"\r\n     style="display:inline-block;width:728px;height:90px"\r\n     data-ad-client="ca-pub-5128894772635532"\r\n     data-ad-slot="5707338409"></ins>\r\n<script>\r\n(adsbygoogle = window.adsbygoogle || []).push({});\r\n</script>', '', 728, 90, 1, 0, '', '', '', '', '', '', '', 'Banner 728 x 90', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 30, '2015-05-23 09:52:20', '2015-05-22 04:53:56'),
(44, 4, 32, '', 0, 'html', '', '', '<script async src="http://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>\r\n<ins class="adsbygoogle"\r\n     style="display:inline-block;width:300px;height:250px"\r\n     data-ad-client="ca-pub-5128894772635532"\r\n     data-ad-slot="3014142402"></ins>\r\n<script>\r\n(adsbygoogle = window.adsbygoogle || []).push({});\r\n</script>', '', 300, 250, 1, 0, '', '', '', '', '', '', '', 'Banner 300 x 250 (lần 2)', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 31, '2015-05-23 09:52:20', '2015-05-22 04:52:18'),
(45, 7, 33, '', 0, 'html', 'uploads/adbanner_images/2015-05-18/tr/xg/gc9e24k4qpzkfxze1rfsjexdw4rm.TintucVN-Tet-thieu-nhi.swf', '', '<object width="728" height="90" data="http://qc.tintuc.vn/uploads/adbanner_images/2015-05-18/tr/xg/gc9e24k4qpzkfxze1rfsjexdw4rm.TintucVN-Tet-thieu-nhi.swf"></object>', '', 728, 90, 0, 0, '', 'http://gohappy.vn/', '', '', '', '', '', 'Banner hiển thị tới trang gohappy.vn', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 1, 1, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 32, '2015-05-23 09:52:20', '2015-05-22 04:51:23'),
(46, 7, 33, '', 0, 'html', 'uploads/adbanner_images/2015-05-18/bd/7z/zzaclangz0gxrpondqgdgow5u0z6.TintucVN-banner-trang-chu.swf', '', '<object width="728" height="90" data="http://qc.tintuc.vn/uploads/adbanner_images/2015-05-18/bd/7z/zzaclangz0gxrpondqgdgow5u0z6.TintucVN-banner-trang-chu.swf"></object>', '', 728, 90, 0, 0, '', 'http://gohappy.vn/', '', '', '', '', '', 'Banner chạy song song hiển thị tới trang gohappy.vn', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 33, '2015-05-23 09:52:20', '2015-05-22 04:49:49'),
(47, 7, 34, '', 0, 'html', 'uploads/adbanner_images/2015-05-15/il/h0/pwtp0b0lqmejoff906ml69ukd91v.TintucVN-do-choi-cho-be-banner-chay-tat-ca-cac-trang-con.swf', '', '<object width="728" height="90" data="http://qc.tintuc.vn/uploads/adbanner_images/2015-05-15/il/h0/pwtp0b0lqmejoff906ml69ukd91v.TintucVN-do-choi-cho-be-banner-chay-tat-ca-cac-trang-con.swf"></object>', '', 728, 90, 0, 0, '', '', '', '', '', '', '', 'Banner ở top hiển thị trên tất cả các trang con đi tới trang goHappy', '', 0, 0, 0, '', '', 0, 0, 0, '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '', 0, '', 0, 0, 1, 0, 0, 0, '', 34, '2015-05-23 09:52:20', '2015-05-22 04:49:00');

--
-- Triggers `banners`
--
DELIMITER //
CREATE TRIGGER `delete_banners_row` BEFORE DELETE ON `banners`
 FOR EACH ROW BEGIN
  UPDATE banners SET hide = 'Y' WHERE id = pID;
END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `update_banners_row` BEFORE UPDATE ON `banners`
 FOR EACH ROW BEGIN
  UPDATE banners SET hide = 'Y' WHERE id = pID;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE IF NOT EXISTS `campaigns` (
`id` int(11) NOT NULL,
  `campaignname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `campaign_type` int(1) DEFAULT NULL,
  `clientid` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `clicks` int(11) DEFAULT NULL,
  `conversions` int(11) DEFAULT NULL,
  `expire` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `weight` int(4) DEFAULT NULL,
  `target_impression` int(11) DEFAULT NULL,
  `target_click` int(11) DEFAULT NULL,
  `target_conversion` int(11) DEFAULT NULL,
  `anonymous` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `companion` int(1) DEFAULT NULL,
  `comments` text COLLATE utf8_unicode_ci,
  `revenue` float DEFAULT NULL,
  `revenue_type` int(6) NOT NULL,
  `updated` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `block` int(11) DEFAULT NULL,
  `capping` int(11) DEFAULT NULL,
  `session_capping` int(11) DEFAULT NULL,
  `an_campaign_id` int(11) DEFAULT NULL,
  `as_campaign_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `an_status` int(11) DEFAULT NULL,
  `as_reject_reason` int(11) DEFAULT NULL,
  `hosted_views` int(11) DEFAULT NULL,
  `hosted_clicks` int(11) DEFAULT NULL,
  `viewwindow` int(9) DEFAULT NULL,
  `clickwindow` int(9) DEFAULT NULL,
  `ecpm` float DEFAULT NULL,
  `min_impressions` int(11) DEFAULT NULL,
  `ecpm_enabled` int(4) DEFAULT NULL,
  `order_no` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `campaignname`, `campaign_type`, `clientid`, `views`, `clicks`, `conversions`, `expire`, `active`, `priority`, `weight`, `target_impression`, `target_click`, `target_conversion`, `anonymous`, `companion`, `comments`, `revenue`, `revenue_type`, `updated`, `block`, `capping`, `session_capping`, `an_campaign_id`, `as_campaign_id`, `status`, `an_status`, `as_reject_reason`, `hosted_views`, `hosted_clicks`, `viewwindow`, `clickwindow`, `ecpm`, `min_impressions`, `ecpm_enabled`, `order_no`, `created_at`, `updated_at`) VALUES
(4, 'Chiến dịch quảng cáo cho trang sức khỏe cộng đồng', 1, NULL, NULL, 0, NULL, '', '', 10, NULL, NULL, 0, NULL, NULL, NULL, '', 0, 2, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-05-23 09:27:58', '2015-05-22 04:41:02'),
(5, 'Chiến dịch quảng cáo cho trang tin tức Việt Nam', 1, NULL, NULL, 0, NULL, '', '', 10, NULL, NULL, 0, NULL, NULL, NULL, '', 0, 1, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-05-23 09:27:59', '2015-05-22 04:41:21'),
(6, 'Reema', 2, 3, NULL, 0, NULL, 'F9Mg15ywQ', 'iYe1DUwHOhL', 10, NULL, NULL, 0, NULL, NULL, NULL, 'Facebook:If you''re a new page, the first thing you should do is to have a nice ininerstteg campaign and promote it via ads.But make sure your ads are highly targeted. Poorly targeted ads will get you a community that is non-responisve.Once you build the initial set of  likes'', you need to back it up with great content. Content that is both relevant, as well as ininerstteg. More often than not, brands tend to publish relevant content that is not packaged properly. So you have to make sure that it is of great quality.You can also tie up with some other pages that bigger than you and tap into their community. But the community has to be similar in nature.Here''s an example that might help you iin uderstanding this better:Suppose you''re a Facebook Apps Developer. You have impeccable knowledge about something that many would want to know about. What you can do is, you can tie up with any FB page that is about social media and ask them to hold special live chat for their community members where they can ask their doubts about FB apps to you.This will help you build and authority and also get you the much required visiblity.Start off with the above things and I am confident you will not be disappointed.Twitter:Conversations. Conversations. Conversations.  +3Was this answer helpful? http://ojlfhrw.com [url=http://ydbzvwxfja.com]ydbzvwxfja[/url] [link=http://bbeqzypvax.com]bbeqzypvax[/link]', 0, 1, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-05-12 16:45:56', '2015-05-12 09:45:56'),
(7, 'Chiến dịch quảng cáo cho trang sacdepvasuckhoe.wordpress.com', 1, NULL, NULL, 0, NULL, '2015-02-24', '2014-12-24', 10, NULL, NULL, 0, NULL, NULL, NULL, '', 0, 1, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-05-16 07:23:34', '2015-05-16 00:23:34'),
(8, 'Chiến dịch quảng cáo phở ông Hùng trên tintuc.vn', 1, 2, NULL, 0, NULL, '2015-02-26', '', 10, NULL, NULL, 0, NULL, NULL, NULL, '', 0, 1, NULL, NULL, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2015-05-16 07:23:54', '2015-05-16 00:23:54'),
(9, 'Chiến dịch quảng cáo cho trang web goHappy.vn', 1, 3, NULL, 0, NULL, '', '2015-04-22', 10, NULL, NULL, 0, NULL, NULL, NULL, '', 0, 1, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2015-05-23 09:27:59', '2015-05-22 04:42:33');

--
-- Triggers `campaigns`
--
DELIMITER //
CREATE TRIGGER `delete_campaigns_row` BEFORE DELETE ON `campaigns`
 FOR EACH ROW BEGIN UPDATE campaigns SET hide="Y" WHERE id=pID; END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `update_campaigns_row` BEFORE UPDATE ON `campaigns`
 FOR EACH ROW BEGIN
  UPDATE campaigns SET hide = 'Y' WHERE id = pID;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
`id` int(11) NOT NULL,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `order_no` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `parent_id`, `created_at`, `updated_at`, `order_no`, `status`) VALUES
(26, 'Videos/Movies', 20, '2015-04-30 14:12:10', '2015-04-30 07:12:10', 1, 1),
(127, 'Domain Registrations', 124, '2015-05-23 09:29:14', '2015-04-28 04:16:33', 1, 1),
(128, 'Email Marketing', 124, '2015-05-23 09:29:14', '2015-04-28 04:17:14', 1, 1),
(129, 'Internet Service Providers', 124, '2015-05-23 09:29:14', '2015-04-28 04:17:55', 1, 1),
(130, 'Search Engine', 124, '2015-05-23 09:29:14', '2015-04-28 04:18:37', 1, 1),
(131, 'Web Design', 124, '2015-05-23 09:29:14', '2015-04-28 04:18:50', 1, 1),
(132, 'Web Hosting/Servers', 124, '2015-05-23 09:29:14', '2015-04-28 04:19:50', 1, 1),
(133, 'Web Tools', 124, '2015-05-23 09:29:14', '2015-04-28 04:20:28', 1, 1),
(134, 'Recreation : Leisure', 0, '2015-05-23 09:29:14', '2015-04-28 04:22:57', 1, 1),
(135, 'Astrology', 134, '2015-05-23 09:29:14', '2015-04-28 04:24:08', 1, 1),
(136, 'Betting/Gaming', 134, '2015-05-23 09:29:14', '2015-04-28 04:24:23', 1, 1),
(137, 'Camping and Hiking', 134, '2015-05-23 09:29:14', '2015-04-28 04:24:58', 1, 1),
(138, 'Communities', 134, '2015-05-23 09:29:14', '2015-04-28 04:25:39', 1, 1),
(139, 'Matchmaking', 134, '2015-05-23 09:29:14', '2015-04-28 04:26:22', 1, 1),
(140, 'Outdoors', 134, '2015-05-23 09:29:14', '2015-04-28 04:26:36', 1, 1),
(141, 'Tobacco', 134, '2015-05-23 09:29:14', '2015-04-28 04:27:31', 1, 1),
(142, 'Seasonal', 0, '2015-05-23 09:29:14', '2015-04-28 04:29:18', 1, 1),
(143, 'Autumn', 142, '2015-05-23 09:29:14', '2015-04-28 04:29:36', 1, 1),
(144, 'Back to School', 142, '2015-05-23 09:29:14', '2015-04-28 04:30:13', 1, 1),
(145, 'Christmas', 142, '2015-05-23 09:29:14', '2015-04-28 04:30:51', 1, 1),
(146, 'Easter', 142, '2015-05-23 09:29:14', '2015-04-28 04:31:32', 1, 1),
(147, 'Father''s Day', 142, '2015-05-23 09:29:14', '2015-04-28 04:31:51', 1, 1),
(148, 'Halloween', 142, '2015-05-23 09:29:14', '2015-04-28 04:32:29', 1, 1),
(149, 'Mother''s Day', 142, '2015-05-23 09:29:14', '2015-04-28 04:33:08', 1, 1),
(150, 'Spring', 142, '2015-05-23 09:29:14', '2015-04-28 04:33:48', 1, 1),
(151, 'Summer', 142, '2015-05-23 09:29:14', '2015-04-28 04:34:08', 1, 1),
(152, 'Tax Season', 142, '2015-05-23 09:29:14', '2015-04-28 04:34:44', 1, 1),
(153, 'Valentine''s Day', 142, '2015-05-23 09:29:14', '2015-04-28 04:35:24', 1, 1),
(154, 'Winter', 142, '2015-05-23 09:29:14', '2015-04-28 04:36:04', 1, 1),
(155, 'Shops/Malls', 0, '2015-05-23 09:29:14', '2015-04-28 04:36:24', 1, 1),
(156, 'Virtual Malls', 155, '2015-05-23 09:29:14', '2015-04-28 04:37:01', 1, 1),
(157, 'Sports : Fitness', 0, '2015-05-23 09:29:14', '2015-04-28 04:54:05', 1, 1),
(158, 'Apparel', 157, '2015-05-23 09:29:14', '2015-04-28 04:55:24', 1, 1),
(159, 'Collectibles and Memorabilia', 157, '2015-05-23 09:29:14', '2015-04-28 04:55:52', 1, 1),
(160, 'Equipment', 157, '2015-05-23 09:29:14', '2015-04-28 04:56:28', 1, 1),
(161, 'Exercise : Health', 157, '2015-05-23 09:29:14', '2015-04-28 04:56:56', 1, 1),
(162, 'Golf', 157, '2015-05-23 09:29:14', '2015-04-28 04:57:38', 1, 1),
(163, 'Professional Sports Organizations', 157, '2015-05-23 09:29:14', '2015-04-28 05:02:19', 1, 1),
(164, 'Sports', 157, '2015-05-23 09:29:14', '2015-04-28 05:02:55', 1, 1),
(165, 'Summer Sports', 157, '2015-05-23 09:29:14', '2015-04-28 05:03:17', 1, 1),
(166, 'Water Sports', 157, '2015-05-23 09:29:14', '2015-04-28 05:03:55', 1, 1),
(167, 'Winter Sports', 157, '2015-05-23 09:29:14', '2015-04-28 05:04:34', 1, 1),
(168, 'Telecommunications', 0, '2015-05-23 09:29:14', '2015-04-28 05:37:13', 1, 1),
(169, 'Online/Wireless', 168, '2015-05-23 09:29:14', '2015-04-28 05:38:11', 1, 1),
(170, 'Phone Card Services', 168, '2015-05-23 09:29:14', '2015-04-28 05:39:00', 1, 1),
(171, 'Telephone Services', 168, '2015-05-23 09:29:14', '2015-04-28 05:39:48', 1, 1),
(172, 'Travel', 0, '2015-05-23 09:29:14', '2015-04-28 05:51:09', 1, 1),
(173, 'Accessories', 172, '2015-05-23 09:29:14', '2015-04-28 05:51:34', 1, 1),
(174, 'Air', 172, '2015-05-23 09:29:14', '2015-04-28 05:52:12', 1, 1),
(175, 'Car', 172, '2015-05-23 09:29:14', '2015-04-28 05:53:29', 1, 1),
(176, 'Hotel', 172, '2015-05-23 09:29:14', '2015-04-28 05:54:16', 1, 1),
(177, 'Luggage', 172, '2015-05-23 09:29:14', '2015-04-28 05:54:48', 1, 1),
(178, 'Vacation', 172, '2015-05-23 09:29:14', '2015-04-28 05:54:50', 1, 1);

--
-- Triggers `categories`
--
DELIMITER //
CREATE TRIGGER `delete_categories_row` BEFORE DELETE ON `categories`
 FOR EACH ROW BEGIN UPDATE categories SET hide="Y" WHERE id=pID; END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `update_categories_row` BEFORE UPDATE ON `categories`
 FOR EACH ROW BEGIN
  UPDATE categories SET hide = 'Y' WHERE id = pID;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cclicks`
--

CREATE TABLE IF NOT EXISTS `cclicks` (
`id` int(11) NOT NULL,
  `website_id` int(11) NOT NULL,
  `day` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(11) NOT NULL,
  `click` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cclicks`
--

INSERT INTO `cclicks` (`id`, `website_id`, `day`, `user`, `click`) VALUES
(12, 0, '2014-11-07', 5, 6),
(13, 0, '2014-11-08', 1, 40),
(14, 0, '2014-11-09', 1, 15),
(15, 0, '2014-11-10', 13, 16),
(16, 0, '2014-11-11', 11, 25),
(17, 0, '2014-11-12', 0, 18),
(18, 0, '2014-11-13', 2, 7),
(19, 0, '2014-11-14', 1, 13),
(20, 0, '2014-11-15', 1, 3),
(21, 0, '2014-11-16', 1, 2),
(22, 0, '2014-11-17', 1, 88),
(23, 0, '2014-11-18', 1, 116),
(24, 0, '2014-11-19', 38, 111),
(25, 0, '2014-11-20', 78, 81),
(26, 0, '2014-11-21', 84, 86),
(27, 0, '2014-11-22', 61, 62),
(28, 0, '2014-11-23', 33, 33),
(29, 0, '2014-11-24', 70, 73),
(30, 0, '2014-11-25', 64, 67),
(31, 0, '2014-11-26', 40, 42),
(32, 0, '2014-11-27', 7, 8),
(33, 0, '2014-12-02', 17, 18),
(34, 0, '2014-12-03', 25, 30),
(35, 0, '2014-12-04', 36, 37),
(36, 0, '2014-12-05', 39, 42),
(37, 0, '2014-12-06', 31, 35),
(38, 0, '2014-12-07', 27, 29),
(39, 0, '2014-12-08', 42, 48),
(40, 0, '2014-12-09', 41, 48),
(41, 0, '2014-12-10', 35, 35),
(42, 0, '2014-12-11', 29, 31),
(43, 0, '2014-12-12', 29, 32),
(44, 0, '2014-12-13', 33, 36),
(45, 0, '2014-12-14', 27, 30),
(46, 0, '2014-12-15', 25, 26),
(47, 0, '2014-12-16', 26, 31),
(48, 0, '2014-12-17', 37, 41),
(49, 0, '2014-12-18', 42, 46),
(50, 0, '2014-12-19', 37, 51),
(51, 0, '2014-12-20', 42, 45),
(52, 0, '2014-12-21', 39, 43),
(53, 0, '2014-12-22', 46, 51),
(54, 0, '2014-12-23', 6, 7),
(55, 4, '2014-12-23', 42, 84),
(56, 0, '2014-12-24', 4, 5),
(57, 4, '2014-12-24', 37, 70),
(58, 4, '2014-12-25', 42, 69),
(59, 4, '2014-12-26', 31, 42),
(60, 4, '2014-12-27', 36, 40),
(61, 4, '2014-12-28', 31, 32),
(62, 4, '2014-12-29', 41, 50),
(63, 4, '2014-12-30', 46, 67),
(64, 4, '2014-12-31', 39, 48),
(65, 4, '2015-01-01', 39, 39),
(66, 4, '2015-01-02', 52, 52),
(67, 0, '2015-01-03', 2, 2),
(68, 4, '2015-01-03', 46, 46),
(69, 0, '2015-01-04', 2, 2),
(70, 4, '2015-01-04', 59, 61),
(71, 4, '2015-01-05', 44, 45),
(72, 0, '2015-01-06', 2, 2),
(73, 4, '2015-01-06', 50, 50),
(74, 0, '2015-01-07', 1, 2),
(75, 4, '2015-01-07', 46, 46),
(76, 4, '2015-01-08', 64, 72),
(77, 4, '2015-01-09', 52, 60),
(78, 4, '2015-01-10', 51, 54),
(79, 0, '2015-01-11', 2, 2),
(80, 4, '2015-01-11', 63, 64),
(81, 4, '2015-01-12', 58, 61),
(82, 0, '2015-01-13', 2, 2),
(83, 4, '2015-01-13', 46, 53),
(84, 4, '2015-01-14', 51, 55),
(85, 4, '2015-01-15', 58, 60),
(86, 0, '2015-01-16', 1, 1),
(87, 4, '2015-01-16', 45, 46),
(88, 4, '2015-01-17', 56, 61),
(89, 0, '2015-01-18', 2, 3),
(90, 4, '2015-01-18', 50, 50),
(91, 0, '2015-01-19', 1, 1),
(92, 4, '2015-01-19', 49, 50),
(93, 0, '2015-01-20', 2, 2),
(94, 4, '2015-01-20', 49, 50),
(95, 4, '2015-01-21', 87, 88),
(96, 4, '2015-01-22', 75, 78),
(97, 4, '2015-01-23', 96, 100),
(98, 4, '2015-01-24', 73, 74),
(99, 4, '2015-01-25', 80, 82),
(100, 4, '2015-01-26', 52, 52),
(101, 6, '2015-01-26', 57, 59),
(102, 4, '2015-01-27', 91, 94),
(103, 6, '2015-01-27', 185, 197),
(104, 4, '2015-01-28', 66, 70),
(105, 6, '2015-01-28', 186, 194),
(106, 6, '2015-01-29', 211, 221),
(107, 4, '2015-01-29', 74, 81),
(108, 6, '2015-01-30', 167, 177),
(109, 4, '2015-01-30', 62, 63),
(110, 4, '2015-01-31', 84, 91),
(111, 6, '2015-01-31', 192, 204),
(112, 6, '2015-02-01', 147, 152),
(113, 4, '2015-02-01', 62, 66),
(114, 6, '2015-02-02', 165, 172),
(115, 4, '2015-02-02', 85, 88),
(116, 0, '2015-02-03', 3, 3),
(117, 6, '2015-02-03', 172, 176),
(118, 4, '2015-02-03', 93, 96),
(119, 6, '2015-02-04', 174, 185),
(120, 4, '2015-02-04', 90, 94),
(121, 6, '2015-02-05', 51, 53),
(122, 4, '2015-02-05', 15, 16),
(123, 6, '2015-02-06', 1, 1),
(124, 4, '2015-02-06', 1, 1),
(125, 0, '2015-02-07', 1, 1),
(126, 6, '2015-02-07', 1, 1),
(127, 4, '2015-02-07', 3, 3),
(128, 0, '2015-02-08', 1, 1),
(129, 4, '2015-02-08', 1, 1),
(130, 0, '2015-02-09', 1, 1),
(131, 4, '2015-02-10', 3, 3),
(132, 0, '2015-02-11', 1, 1),
(133, 4, '2015-02-11', 3, 3),
(134, 6, '2015-02-11', 1, 1),
(135, 4, '2015-02-12', 8, 8),
(136, 4, '2015-02-13', 3, 3),
(137, 0, '2015-02-14', 1, 1),
(138, 4, '2015-02-14', 6, 6),
(139, 0, '2015-02-15', 1, 1),
(140, 4, '2015-02-15', 2, 2),
(141, 4, '2015-02-16', 7, 7),
(142, 4, '2015-02-17', 7, 7),
(143, 4, '2015-02-18', 4, 4),
(144, 4, '2015-02-19', 3, 3),
(145, 0, '2015-02-20', 2, 2),
(146, 4, '2015-02-20', 2, 2),
(147, 0, '2015-02-21', 1, 1),
(148, 4, '2015-02-21', 4, 4),
(149, 4, '2015-02-22', 4, 4),
(150, 4, '2015-02-23', 8, 8),
(151, 4, '2015-02-24', 3, 3),
(152, 0, '2015-02-25', 1, 1),
(153, 4, '2015-02-25', 2, 2),
(154, 0, '2015-02-26', 1, 1),
(155, 4, '2015-02-26', 5, 5),
(156, 4, '2015-02-27', 3, 3),
(157, 4, '2015-02-28', 3, 3),
(158, 0, '2015-03-01', 1, 1),
(159, 4, '2015-03-01', 5, 5),
(160, 4, '2015-03-02', 4, 4),
(161, 4, '2015-03-03', 1, 1),
(162, 4, '2015-03-04', 6, 6),
(163, 4, '2015-03-05', 5, 6),
(164, 4, '2015-03-06', 5, 5),
(165, 0, '2015-03-07', 1, 1),
(166, 4, '2015-03-07', 2, 2),
(167, 4, '2015-03-08', 2, 2),
(168, 4, '2015-03-09', 5, 5),
(169, 0, '2015-03-10', 1, 1),
(170, 4, '2015-03-10', 4, 4),
(171, 4, '2015-03-11', 7, 7),
(172, 4, '2015-03-12', 5, 5),
(173, 4, '2015-03-13', 4, 4),
(174, 4, '2015-03-14', 3, 3),
(175, 4, '2015-03-15', 7, 7),
(176, 4, '2015-03-16', 4, 4),
(177, 4, '2015-03-17', 3, 3),
(178, 0, '2015-03-18', 1, 1),
(179, 4, '2015-03-18', 2, 2),
(180, 4, '2015-03-19', 6, 6),
(181, 0, '2015-03-20', 2, 2),
(182, 4, '2015-03-20', 2, 2),
(183, 4, '2015-03-21', 5, 5),
(184, 4, '2015-03-22', 6, 6),
(185, 0, '2015-03-23', 1, 1),
(186, 4, '2015-03-23', 3, 3),
(187, 4, '2015-03-24', 6, 6),
(188, 0, '2015-03-25', 1, 1),
(189, 4, '2015-03-25', 5, 5),
(190, 0, '2015-03-26', 1, 1),
(191, 4, '2015-03-26', 6, 6),
(192, 4, '2015-03-27', 6, 6),
(193, 4, '2015-03-28', 5, 5),
(194, 4, '2015-03-29', 4, 4),
(195, 4, '2015-03-30', 4, 5),
(196, 4, '2015-03-31', 4, 4),
(197, 4, '2015-04-01', 7, 7),
(198, 4, '2015-04-02', 1, 1),
(199, 4, '2015-04-03', 5, 5),
(200, 4, '2015-04-04', 6, 6),
(201, 4, '2015-04-05', 7, 7),
(202, 4, '2015-04-06', 3, 3),
(203, 4, '2015-04-07', 6, 6),
(204, 0, '2015-04-08', 1, 1),
(205, 4, '2015-04-08', 5, 5),
(206, 4, '2015-04-09', 3, 3),
(207, 0, '2015-04-10', 1, 1),
(208, 4, '2015-04-10', 2, 2),
(209, 4, '2015-04-11', 7, 7),
(210, 4, '2015-04-12', 5, 5),
(211, 4, '2015-04-13', 4, 4),
(212, 4, '2015-04-14', 3, 3),
(213, 0, '2015-04-15', 1, 1),
(214, 4, '2015-04-20', 1, 2),
(215, 4, '2015-04-21', 2, 2),
(216, 4, '2015-04-22', 1, 1),
(217, 7, '2015-04-22', 1, 1),
(218, 0, '2015-04-23', 1, 1),
(219, 4, '2015-04-23', 1, 1),
(220, 0, '2015-04-24', 1, 1),
(221, 4, '2015-04-24', 1, 1),
(222, 4, '2015-04-25', 2, 2),
(223, 4, '2015-04-26', 1, 1),
(224, 4, '2015-04-27', 1, 1),
(225, 0, '2015-04-28', 1, 1),
(226, 4, '2015-04-28', 3, 3),
(227, 4, '2015-04-29', 2, 2),
(228, 0, '2015-05-02', 1, 1),
(229, 0, '2015-05-03', 2, 2),
(230, 0, '2015-05-04', 1, 1),
(231, 4, '2015-05-05', 1, 1),
(232, 0, '2015-05-06', 1, 1),
(233, 4, '2015-05-06', 2, 2),
(234, 0, '2015-05-07', 1, 1),
(235, 4, '2015-05-07', 2, 2),
(236, 4, '2015-05-08', 2, 3),
(237, 4, '2015-05-09', 5, 6),
(238, 0, '2015-05-10', 1, 1),
(239, 4, '2015-05-10', 1, 1),
(240, 0, '2015-05-11', 2, 2),
(241, 4, '2015-05-11', 1, 1),
(242, 0, '2015-05-12', 2, 3),
(243, 4, '2015-05-12', 3, 4),
(244, 0, '2015-05-13', 2, 2),
(245, 4, '2015-05-13', 2, 2),
(246, 4, '2015-05-14', 2, 2),
(247, 4, '2015-05-15', 3, 3),
(248, 4, '2015-05-16', 2, 2),
(249, 4, '2015-05-17', 1, 1),
(250, 0, '2015-05-18', 2, 2),
(251, 4, '2015-05-18', 1, 1),
(252, 4, '2015-05-19', 3, 8),
(253, 0, '2015-05-20', 2, 2),
(254, 4, '2015-05-20', 1, 1),
(255, 4, '2015-05-21', 1, 1),
(256, 0, '2015-05-22', 1, 1),
(257, 4, '2015-05-22', 1, 1),
(258, 4, '2015-05-23', 1, 1);

--
-- Triggers `cclicks`
--
DELIMITER //
CREATE TRIGGER `delete_cclicks_row` BEFORE DELETE ON `cclicks`
 FOR EACH ROW BEGIN UPDATE cclicks SET hide="Y" WHERE id=pID; END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `update_cclicks_row` BEFORE UPDATE ON `cclicks`
 FOR EACH ROW BEGIN
  UPDATE cclicks SET hide = 'Y' WHERE id = pID;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

CREATE TABLE IF NOT EXISTS `channels` (
`id` int(11) NOT NULL,
  `website_id` int(9) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `compiledlimitation` text COLLATE utf8_unicode_ci NOT NULL,
  `active` int(1) NOT NULL,
  `comments` text COLLATE utf8_unicode_ci NOT NULL,
  `order_no` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Triggers `channels`
--
DELIMITER //
CREATE TRIGGER `delete_channels_row` BEFORE DELETE ON `channels`
 FOR EACH ROW BEGIN UPDATE channels SET hide="Y" WHERE id=pID; END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `update_channels_row` BEFORE UPDATE ON `channels`
 FOR EACH ROW BEGIN
  UPDATE channels SET hide = 'Y' WHERE id = pID;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `clicks`
--

CREATE TABLE IF NOT EXISTS `clicks` (
`id` int(11) NOT NULL,
  `bannerid` int(11) NOT NULL,
  `ip_address` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8_unicode_ci NOT NULL,
  `city` text COLLATE utf8_unicode_ci NOT NULL,
  `region` text COLLATE utf8_unicode_ci NOT NULL,
  `country` text COLLATE utf8_unicode_ci NOT NULL,
  `lat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `long` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `org` text COLLATE utf8_unicode_ci NOT NULL,
  `click_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `clicks`
--

INSERT INTO `clicks` (`id`, `bannerid`, `ip_address`, `user_agent`, `city`, `region`, `country`, `lat`, `long`, `org`, `click_at`) VALUES
(1, 36, '117.2.118.71', '', '', '', '', '', '', '', '2015-05-19 04:38:53'),
(2, 15, '184.168.117.83', '', '', '', '', '', '', '', '2015-05-19 13:29:27'),
(3, 0, '184.168.117.83', '', '', '', '', '', '', '', '2015-05-19 13:29:41'),
(4, 0, '184.168.117.83', '', '', '', '', '', '', '', '2015-05-19 13:30:00'),
(5, 0, '184.168.117.83', '', '', '', '', '', '', '', '2015-05-19 13:30:19'),
(6, 36, '1.54.55.61', '', '', '', '', '', '', '', '2015-05-19 07:15:35'),
(7, 15, '118.70.183.81', '', '', '', '', '', '', '', '2015-05-19 18:38:13'),
(8, 20, '66.249.71.127', '', '', '', '', '', '', '', '2015-05-19 20:12:39'),
(9, 36, '14.174.232.11', '', '', '', '', '', '', '', '2015-05-20 06:56:32'),
(10, 36, '117.6.134.84', '', '', '', '', '', '', '', '2015-05-20 23:54:49'),
(11, 20, '66.249.73.179', '', '', '', '', '', '', '', '2015-05-22 05:29:28'),
(12, 36, '14.164.174.48', '', '', '', '', '', '', '', '2015-05-22 16:35:38'),
(13, 36, '113.174.158.102', '', '', '', '', '', '', '', '2015-05-22 23:26:48');

--
-- Triggers `clicks`
--
DELIMITER //
CREATE TRIGGER `delete_clicks_row` BEFORE DELETE ON `clicks`
 FOR EACH ROW BEGIN UPDATE clicks SET hide="Y" WHERE id=pID; END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `update_clicks_row` BEFORE UPDATE ON `clicks`
 FOR EACH ROW BEGIN
  UPDATE clicks SET hide = 'Y' WHERE id = pID;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
`id` int(11) NOT NULL,
  `clientname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `country` int(6) NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `comments` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `account_id` int(11) NOT NULL,
  `order_no` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `clientname`, `contact`, `email`, `address`, `city`, `country`, `phone`, `comments`, `created_at`, `updated_at`, `account_id`, `order_no`, `status`) VALUES
(1, 'ĐẶNG THỊ CHÂU LOAN (Ms.)', 'Trưởng Phòng Kinh Doanh Quảng Cáo CÔNG TY TNHH PHÁT HÀNH TRƯỜNG PHÁT', 'dtcloan@tpinfo.vn', 'Số 179, Lý Chính Thắng, P.7, Q.3', 'TP.HCM', 247, '(0986) 742-679_', '', '2015-05-23 09:30:46', '2015-05-22 04:39:29', 0, 1, 1),
(2, 'NGUYỄN THỊ THƠM (Ms.)', 'Thư Ký Kinh Doanh', 'ntthom@tpinfo.vn', 'Số 179, Lý Chính Thắng, P.7, Q.3. TP.HCM', '', 247, '(0974) 941-554_', '', '2015-05-23 09:30:46', '2015-05-22 04:40:10', 0, 2, 1),
(3, 'MẠNG BÁN LẺ TRỰC TUYẾN GOHAPPY', 'Khách hàng đặt quảng cáo đến website goHappy.vn', 'sales@gohappy.vn', 'Văn phòng giao dịch: Lô 11-H1 khu đô thị Yên Hòa, quận Cầu Giấy, Hà Nội, Việt Nam', 'Hà Nội', 247, '(8446) 263-5858', '', '2015-05-23 09:30:46', '2015-05-22 04:41:54', 0, 3, 1);

--
-- Triggers `clients`
--
DELIMITER //
CREATE TRIGGER `delete_clients_row` BEFORE DELETE ON `clients`
 FOR EACH ROW BEGIN UPDATE clients SET hide="Y" WHERE id=pID; END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `update_clients_row` BEFORE UPDATE ON `clients`
 FOR EACH ROW BEGIN
  UPDATE clients SET hide = 'Y' WHERE id = pID;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `configs`
--

CREATE TABLE IF NOT EXISTS `configs` (
`id` int(11) NOT NULL,
  `database_default` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `hosting` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `database_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `mail_username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mail_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `charset` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `collection` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prefix_table` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `configs`
--

INSERT INTO `configs` (`id`, `database_default`, `hosting`, `database_name`, `username`, `password`, `mail_username`, `mail_password`, `charset`, `collection`, `prefix_table`, `created_at`, `updated_at`) VALUES
(1, 'mysql', '127.0.0.1', 'qc', 'root', '', '', '', 'utf8', 'utf8_unicode_ci', '', '2015-02-27 03:13:18', '2015-02-27 03:13:18'),
(4, '', '', '', '', '', '', '', '', '', '', '2015-03-16 21:39:45', '2015-05-23 09:33:27');

--
-- Triggers `configs`
--
DELIMITER //
CREATE TRIGGER `delete_configs_row` BEFORE DELETE ON `configs`
 FOR EACH ROW BEGIN UPDATE configs SET hide="Y" WHERE id=pID; END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `update_configs_row` BEFORE UPDATE ON `configs`
 FOR EACH ROW BEGIN
  UPDATE configs SET hide = 'Y' WHERE id = pID;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
`id` int(11) NOT NULL,
  `country_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_name`, `created_at`, `updated_at`, `status`) VALUES
(33, 'Barbados', '2015-05-23 09:33:56', '2015-04-27 19:03:15', 1),
(34, 'Belarus', '2015-05-23 09:33:56', '2015-04-27 19:03:43', 1),
(35, 'Belgium', '2015-05-23 09:33:56', '2015-04-27 19:04:09', 1),
(36, 'Belize', '2015-05-23 09:33:56', '2015-04-27 19:04:22', 1),
(37, 'Benin', '2015-05-23 09:33:56', '2015-04-27 19:04:48', 1),
(38, 'Bermuda', '2015-05-23 09:33:56', '2015-04-27 19:05:41', 1),
(39, 'Bhutan', '2015-05-23 09:33:56', '2015-04-27 19:08:47', 1),
(40, 'Bolivia', '2015-05-23 09:33:56', '2015-04-27 19:09:21', 1),
(41, 'Bosnia and Herzegovina', '2015-05-23 09:33:56', '2015-04-27 19:10:18', 1),
(42, 'Botswana', '2015-05-23 09:33:56', '2015-04-27 19:10:40', 1),
(43, 'Bouvet Island', '2015-05-23 09:33:56', '2015-04-27 19:11:06', 1),
(44, 'Brazil', '2015-05-23 09:33:56', '2015-04-27 19:11:35', 1),
(45, 'British Indian Ocean Territory', '2015-05-23 09:33:56', '2015-04-27 19:11:48', 1),
(46, 'Brunei Darussalam', '2015-05-23 09:33:56', '2015-04-27 19:12:12', 1),
(47, 'Bulgaria', '2015-05-23 09:33:56', '2015-04-27 19:12:34', 1),
(48, 'Burkina Faso', '2015-05-23 09:33:56', '2015-04-27 19:13:05', 1),
(49, 'Burundi', '2015-05-23 09:33:56', '2015-04-27 19:14:59', 1),
(50, 'Cambodia', '2015-05-23 09:33:56', '2015-04-27 19:15:20', 1),
(51, 'Cameroon', '2015-05-23 09:33:56', '2015-04-27 19:17:22', 1),
(52, 'Canada', '2015-05-23 09:33:56', '2015-04-27 19:17:57', 1),
(53, 'Cape Verde', '2015-05-23 09:33:56', '2015-04-27 19:18:27', 1),
(54, 'Cayman Islands', '2015-05-23 09:33:56', '2015-04-27 19:18:36', 1),
(55, 'Central African Republic', '2015-05-23 09:33:56', '2015-04-27 19:19:02', 1),
(56, 'Chad', '2015-05-23 09:33:56', '2015-04-27 19:19:25', 1),
(57, 'Chile', '2015-05-23 09:33:56', '2015-04-27 19:19:52', 1),
(58, 'China', '2015-05-23 09:33:56', '2015-04-27 19:20:19', 1),
(59, 'Christmas Island', '2015-05-23 09:33:56', '2015-04-27 19:20:33', 1),
(60, 'Cocos (Keeling) Islands', '2015-05-23 09:33:56', '2015-04-27 19:21:14', 1),
(61, 'Colombia', '2015-05-23 09:33:56', '2015-04-27 19:24:03', 1),
(62, 'Comoros', '2015-05-23 09:33:56', '2015-04-27 19:24:24', 1),
(63, 'Congo', '2015-05-23 09:33:56', '2015-04-27 19:24:35', 1),
(64, 'Congo - The Democratic Republic of the', '2015-05-23 09:33:56', '2015-04-27 19:24:50', 1),
(65, 'Cook Islands', '2015-05-23 09:33:56', '2015-04-27 19:25:02', 1),
(66, 'Costa Rica', '2015-05-23 09:33:56', '2015-04-27 19:25:35', 1),
(67, 'Cote D''Ivoire', '2015-05-23 09:33:56', '2015-04-27 19:26:16', 1),
(68, 'Croatia', '2015-05-23 09:33:56', '2015-04-27 19:26:33', 1),
(69, 'Cuba', '2015-05-23 09:33:56', '2015-04-27 19:27:13', 1),
(70, 'Cyprus', '2015-05-23 09:33:56', '2015-04-27 19:27:54', 1),
(71, 'Czech Republic', '2015-05-23 09:33:56', '2015-04-27 19:30:13', 1),
(72, 'Denmark', '2015-05-23 09:33:56', '2015-04-27 19:30:58', 1),
(73, 'Djibouti', '2015-05-23 09:33:56', '2015-04-27 19:31:08', 1),
(74, 'Dominica', '2015-05-23 09:33:56', '2015-04-27 19:31:55', 1),
(75, 'Dominican Republic', '2015-05-23 09:33:56', '2015-04-27 19:32:34', 1),
(76, 'East Timor', '2015-05-23 09:33:56', '2015-04-27 19:33:22', 1),
(77, 'Ecuador', '2015-05-23 09:33:56', '2015-04-27 19:34:05', 1),
(78, 'Egypt', '2015-05-23 09:33:56', '2015-04-27 19:34:18', 1),
(79, 'El Salvador', '2015-05-23 09:33:56', '2015-04-27 19:35:02', 1),
(80, 'Equatorial Guinea', '2015-05-23 09:33:56', '2015-04-27 19:35:51', 1),
(81, 'Eritrea', '2015-05-23 09:33:56', '2015-04-27 19:39:02', 1),
(82, 'Estonia', '2015-05-23 09:33:56', '2015-04-27 19:39:31', 1),
(83, 'Ethiopia', '2015-05-23 09:33:56', '2015-04-27 19:40:00', 1),
(84, 'Europe', '2015-05-23 09:33:56', '2015-04-27 19:40:33', 1),
(85, 'Falkland Islands (Malvinas)', '2015-05-23 09:33:56', '2015-04-27 19:41:03', 1),
(86, 'Faroe Islands', '2015-05-23 09:33:56', '2015-04-27 19:41:38', 1),
(87, 'Fiji', '2015-05-23 09:33:56', '2015-04-27 19:41:50', 1),
(88, 'Finland', '2015-05-23 09:33:56', '2015-04-27 19:42:20', 1),
(89, 'France', '2015-05-23 09:33:56', '2015-04-27 19:42:36', 1),
(90, 'France - Metropolitan', '2015-05-23 09:33:56', '2015-04-27 19:42:47', 1),
(91, 'French Guiana', '2015-05-23 09:33:56', '2015-04-27 19:42:59', 1),
(92, 'French Polynesia', '2015-05-23 09:33:56', '2015-04-27 19:43:09', 1),
(93, 'French Southern Territories', '2015-05-23 09:33:56', '2015-04-27 19:44:54', 1),
(94, 'Gabon', '2015-05-23 09:33:56', '2015-04-27 19:46:54', 1),
(95, 'Gambia', '2015-05-23 09:33:56', '2015-04-27 19:47:17', 1),
(96, 'Georgia', '2015-05-23 09:33:56', '2015-04-27 19:47:30', 1),
(97, 'Germany', '2015-05-23 09:33:56', '2015-04-27 19:47:57', 1),
(98, 'Ghana', '2015-05-23 09:33:56', '2015-04-27 19:48:15', 1),
(99, 'Gibraltar', '2015-05-23 09:33:56', '2015-04-27 19:48:35', 1),
(100, 'Greece', '2015-05-23 09:33:56', '2015-04-27 19:48:57', 1),
(101, 'Greenland', '2015-05-23 09:33:56', '2015-04-27 19:49:08', 1),
(102, 'Grenada', '2015-05-23 09:33:56', '2015-04-27 19:49:32', 1),
(103, 'Guadeloupe', '2015-05-23 09:33:56', '2015-04-27 19:50:23', 1),
(104, 'Guam', '2015-05-23 09:33:56', '2015-04-27 19:53:05', 1),
(105, 'Guatemala', '2015-05-23 09:33:56', '2015-04-27 19:53:15', 1),
(106, 'Guinea', '2015-05-23 09:33:56', '2015-04-27 19:53:35', 1),
(107, 'Guinea-Bissau', '2015-05-23 09:33:56', '2015-04-27 19:53:45', 1),
(108, 'Guyana', '2015-05-23 09:33:56', '2015-04-27 19:54:05', 1),
(109, 'Haiti', '2015-05-23 09:33:56', '2015-04-27 19:54:24', 1),
(110, 'Heard Island and McDonald Islands', '2015-05-23 09:33:56', '2015-04-27 19:54:29', 1),
(111, 'Holy See (Vatican City State)', '2015-05-23 09:33:56', '2015-04-27 19:54:43', 1),
(112, 'Honduras', '2015-05-23 09:33:56', '2015-04-27 19:59:20', 1),
(113, 'Hong Kong', '2015-05-23 09:33:56', '2015-04-27 20:02:01', 1),
(114, 'Hungary', '2015-05-23 09:33:56', '2015-04-27 20:06:32', 1),
(115, 'Iceland', '2015-05-23 09:33:56', '2015-04-27 20:06:46', 1),
(116, 'India', '2015-05-23 09:33:56', '2015-04-27 20:10:55', 1),
(117, 'Indonesia', '2015-05-23 09:33:56', '2015-04-27 20:11:16', 1),
(118, 'Iran - Islamic Republic of', '2015-05-23 09:33:56', '2015-04-27 20:11:27', 1),
(119, 'Iraq', '2015-05-23 09:33:56', '2015-04-27 20:11:39', 1),
(120, 'Ireland', '2015-05-23 09:33:56', '2015-04-27 20:11:55', 1),
(121, 'Israel', '2015-05-23 09:33:56', '2015-04-27 20:12:10', 1),
(122, 'Italy', '2015-05-23 09:33:56', '2015-04-27 20:12:22', 1),
(123, 'Jamaica', '2015-05-23 09:33:56', '2015-04-27 20:12:34', 1),
(124, 'Japan', '2015-05-23 09:33:56', '2015-04-27 20:12:49', 1),
(125, 'Jordan', '2015-05-23 09:33:56', '2015-04-27 20:14:10', 1),
(126, 'Kazakhstan', '2015-05-23 09:33:56', '2015-04-27 20:16:39', 1),
(127, 'Kenya', '2015-05-23 09:33:56', '2015-04-27 20:16:54', 1),
(128, 'Kiribati', '2015-05-23 09:33:56', '2015-04-27 20:17:09', 1),
(129, 'Korea - Democratic People''s Republic of', '2015-05-23 09:33:56', '2015-04-27 20:17:22', 1),
(130, 'Korea - Republic of', '2015-05-23 09:33:56', '2015-04-27 20:17:34', 1),
(131, 'Kuwait', '2015-05-23 09:33:56', '2015-04-27 20:17:49', 1),
(132, 'Kyrgyzstan', '2015-05-23 09:33:56', '2015-04-27 20:18:04', 1),
(133, 'Lao People''s Democratic Republic', '2015-05-23 09:33:56', '2015-04-27 20:18:18', 1),
(134, 'Latvia', '2015-05-23 09:33:56', '2015-04-27 20:18:29', 1),
(135, 'Lebanon', '2015-05-23 09:33:56', '2015-04-27 20:18:45', 1),
(136, 'Lesotho', '2015-05-23 09:33:56', '2015-04-27 20:21:21', 1),
(137, 'Liberia', '2015-05-23 09:33:56', '2015-04-27 20:24:03', 1),
(138, 'Libyan Arab Jamahiriya', '2015-05-23 09:33:56', '2015-04-27 20:24:40', 1),
(139, 'Liechtenstein', '2015-05-23 09:33:56', '2015-04-27 20:24:52', 1),
(140, 'Lithuania', '2015-05-23 09:33:56', '2015-04-27 20:25:01', 1),
(141, 'Luxembourg', '2015-05-23 09:33:56', '2015-04-27 20:25:17', 1),
(142, 'Macau', '2015-05-23 09:33:56', '2015-04-27 20:25:36', 1),
(143, 'Macedonia', '2015-05-23 09:33:56', '2015-04-27 20:25:46', 1),
(144, 'Madagascar', '2015-05-23 09:33:56', '2015-04-27 20:25:55', 1),
(145, 'Malawi', '2015-05-23 09:33:56', '2015-04-27 20:26:13', 1),
(146, 'Malaysia', '2015-05-23 09:33:56', '2015-04-27 20:26:33', 1),
(147, 'Maldives', '2015-05-23 09:33:56', '2015-04-27 20:26:58', 1),
(148, 'Mali', '2015-05-23 09:33:56', '2015-04-27 20:30:31', 1),
(149, 'Malta', '2015-05-23 09:33:56', '2015-04-27 20:30:48', 1),
(150, 'Marshall Islands', '2015-05-23 09:33:56', '2015-04-27 20:30:58', 1),
(151, 'Martinique', '2015-05-23 09:33:56', '2015-04-27 20:31:11', 1),
(152, 'Mauritania', '2015-05-23 09:33:56', '2015-04-27 20:31:25', 1),
(153, 'Mauritius', '2015-05-23 09:33:56', '2015-04-27 20:31:42', 1),
(154, 'Mayotte', '2015-05-23 09:33:56', '2015-04-27 20:31:53', 1),
(155, 'Mexico', '2015-05-23 09:33:56', '2015-04-27 20:32:04', 1),
(156, 'Micronesia - Federated States of', '2015-05-23 09:33:56', '2015-04-27 20:32:20', 1),
(157, 'Moldova - Republic of', '2015-05-23 09:33:56', '2015-04-27 20:32:37', 1),
(158, 'Monaco', '2015-05-23 09:33:56', '2015-04-27 20:34:37', 1),
(159, 'Mongolia', '2015-05-23 09:33:56', '2015-04-27 20:35:48', 1),
(160, 'Montserrat', '2015-05-23 09:33:56', '2015-04-27 20:36:06', 1),
(161, 'Morocco', '2015-05-23 09:33:56', '2015-04-27 20:36:20', 1),
(162, 'Mozambique', '2015-05-23 09:33:56', '2015-04-27 20:36:34', 1),
(163, 'Myanmar', '2015-05-23 09:33:56', '2015-04-27 20:36:43', 1),
(164, 'Namibia', '2015-05-23 09:33:56', '2015-04-27 20:37:00', 1),
(165, 'Nauru', '2015-05-23 09:33:56', '2015-04-27 20:37:14', 1),
(166, 'Nepal', '2015-05-23 09:33:56', '2015-04-27 20:37:29', 1),
(167, 'Netherlands', '2015-05-23 09:33:56', '2015-04-27 20:37:38', 1),
(168, 'Netherlands Antilles', '2015-05-23 09:33:56', '2015-04-27 20:38:57', 1),
(169, 'New Caledonia', '2015-05-23 09:33:56', '2015-04-27 20:40:51', 1),
(170, 'New Zealand', '2015-05-23 09:33:56', '2015-04-27 20:41:11', 1),
(171, 'Nicaragua', '2015-05-23 09:33:56', '2015-04-27 20:41:28', 1),
(172, 'Niger', '2015-05-23 09:33:56', '2015-04-27 20:41:41', 1),
(173, 'Nigeria', '2015-05-23 09:33:56', '2015-04-27 20:41:48', 1),
(174, 'Niue', '2015-05-23 09:33:56', '2015-04-27 20:42:05', 1),
(175, 'Norfolk Island', '2015-05-23 09:33:56', '2015-04-27 20:42:20', 1),
(176, 'Northern Mariana Islands', '2015-05-23 09:33:56', '2015-04-27 20:42:36', 1),
(177, 'Norway', '2015-05-23 09:33:56', '2015-04-27 20:42:43', 1),
(178, 'Oman', '2015-05-23 09:33:56', '2015-04-27 20:43:34', 1),
(179, 'Pakistan', '2015-05-23 09:33:56', '2015-04-27 20:46:21', 1),
(180, 'Palau', '2015-05-23 09:33:56', '2015-04-27 20:46:55', 1),
(181, 'Palestinian Territory - Occupied', '2015-05-23 09:33:56', '2015-04-27 20:48:47', 1),
(182, 'Panama', '2015-05-23 09:33:56', '2015-04-27 20:49:06', 1),
(183, 'Papua New Guinea', '2015-05-23 09:33:56', '2015-04-27 20:49:12', 1),
(184, 'Paraguay', '2015-05-23 09:33:56', '2015-04-27 20:49:26', 1),
(185, 'Peru', '2015-05-23 09:33:56', '2015-04-27 20:49:43', 1),
(186, 'Philippines', '2015-05-23 09:33:56', '2015-04-27 20:49:59', 1),
(187, 'Pitcairn', '2015-05-23 09:33:56', '2015-04-27 20:50:07', 1),
(188, 'Poland', '2015-05-23 09:33:56', '2015-04-27 20:50:21', 1),
(189, 'Portugal', '2015-05-23 09:33:56', '2015-04-27 20:50:38', 1),
(190, 'Puerto Rico', '2015-05-23 09:33:56', '2015-04-27 20:51:26', 1),
(191, 'Qatar', '2015-05-23 09:33:56', '2015-04-27 20:54:41', 1),
(192, 'Reunion', '2015-05-23 09:33:56', '2015-04-27 20:56:54', 1),
(193, 'Romania', '2015-05-23 09:33:56', '2015-04-27 20:57:14', 1),
(194, 'Russian Federation', '2015-05-23 09:33:56', '2015-04-27 20:57:24', 1),
(195, 'Rwanda', '2015-05-23 09:33:56', '2015-04-27 20:57:38', 1),
(196, 'Saint Helena', '2015-05-23 09:33:56', '2015-04-27 20:57:51', 1),
(197, 'Saint Kitts and Nevis', '2015-05-23 09:33:56', '2015-04-27 20:58:07', 1),
(198, 'Saint Lucia', '2015-05-23 09:33:56', '2015-04-27 20:58:19', 1),
(199, 'Saint Pierre and Miquelon', '2015-05-23 09:33:56', '2015-04-27 20:58:33', 1),
(200, 'Saint Vincent and the Grenadines', '2015-05-23 09:33:56', '2015-04-27 20:58:46', 1),
(201, 'Samoa', '2015-05-23 09:33:56', '2015-04-27 20:59:31', 1),
(202, 'San Marino', '2015-05-23 09:33:56', '2015-04-27 21:00:45', 1),
(203, 'Sao Tome and Principe', '2015-05-23 09:33:56', '2015-04-27 21:01:08', 1),
(204, 'Saudi Arabia', '2015-05-23 09:33:56', '2015-04-27 21:01:22', 1),
(205, 'Senegal', '2015-05-23 09:33:56', '2015-04-27 21:01:39', 1),
(206, 'Seychelles', '2015-05-23 09:33:56', '2015-04-27 21:01:53', 1),
(207, 'Sierra Leone', '2015-05-23 09:33:56', '2015-04-27 21:02:03', 1),
(208, 'Singapore', '2015-05-23 09:33:56', '2015-04-27 21:02:17', 1),
(209, 'Slovakia', '2015-05-23 09:33:56', '2015-04-27 21:02:33', 1),
(210, 'Slovenia', '2015-05-23 09:33:56', '2015-04-27 21:02:48', 1),
(211, 'Solomon Islands', '2015-05-23 09:33:56', '2015-04-27 21:03:30', 1),
(212, 'Somalia', '2015-05-23 09:33:56', '2015-04-27 21:04:02', 1),
(213, 'South Africa', '2015-05-23 09:33:56', '2015-04-27 21:04:36', 1),
(214, 'South Georgia and the South Sandwich Islands', '2015-05-23 09:33:56', '2015-04-27 21:04:53', 1),
(215, 'Spain', '2015-05-23 09:33:56', '2015-04-27 21:04:57', 1),
(216, 'Sri Lanka', '2015-05-23 09:33:56', '2015-04-27 21:05:14', 1),
(217, 'Sudan', '2015-05-23 09:33:56', '2015-04-27 21:05:31', 1),
(218, 'Suriname', '2015-05-23 09:33:56', '2015-04-27 21:05:48', 1),
(219, 'Svalbard and Jan Mayen', '2015-05-23 09:33:56', '2015-04-27 21:05:51', 1),
(220, 'Swaziland', '2015-05-23 09:33:56', '2015-04-27 21:06:09', 1),
(221, 'Sweden', '2015-05-23 09:33:56', '2015-04-27 21:07:14', 1),
(222, 'Switzerland', '2015-05-23 09:33:56', '2015-04-27 21:07:47', 1),
(223, 'Syrian Arab Republic', '2015-05-23 09:33:56', '2015-04-27 21:08:36', 1),
(224, 'Taiwan - Province of China', '2015-05-23 09:33:56', '2015-04-27 21:08:50', 1),
(225, 'Tajikistan', '2015-05-23 09:33:56', '2015-04-27 21:08:57', 1),
(226, 'Tanzania - United Republic of', '2015-05-23 09:33:56', '2015-04-27 21:09:13', 1),
(227, 'Thailand', '2015-05-23 09:33:56', '2015-04-27 21:09:30', 1),
(228, 'Togo', '2015-05-23 09:33:56', '2015-04-27 21:09:45', 1),
(229, 'Tokelau', '2015-05-23 09:33:56', '2015-04-27 21:09:51', 1),
(230, 'Tonga', '2015-05-23 09:33:56', '2015-04-27 21:10:09', 1),
(231, 'Trinidad and Tobago', '2015-05-23 09:33:56', '2015-04-27 21:11:27', 1),
(232, 'Tunisia', '2015-05-23 09:33:56', '2015-04-27 21:11:56', 1),
(233, 'Turkey', '2015-05-23 09:33:56', '2015-04-27 21:12:31', 1),
(234, 'Turkmenistan', '2015-05-23 09:33:56', '2015-04-27 21:12:48', 1),
(235, 'Turks and Caicos Islands', '2015-05-23 09:33:56', '2015-04-27 21:13:02', 1),
(236, 'Tuvalu', '2015-05-23 09:33:56', '2015-04-27 21:13:08', 1),
(237, 'Uganda', '2015-05-23 09:33:56', '2015-04-27 21:13:25', 1),
(238, 'Ukraine', '2015-05-23 09:33:56', '2015-04-27 21:13:41', 1),
(239, 'United Arab Emirates', '2015-05-23 09:33:56', '2015-04-27 21:13:58', 1),
(240, 'United Kingdom', '2015-05-23 09:33:56', '2015-04-27 21:14:03', 1),
(241, 'United States', '2015-05-23 09:33:56', '2015-04-27 21:14:19', 1),
(242, 'United States Minor Outlying Islands', '2015-05-23 09:33:56', '2015-04-27 21:16:10', 1),
(243, 'Uruguay', '2015-05-23 09:33:56', '2015-04-27 21:19:31', 1),
(244, 'Uzbekistan', '2015-05-23 09:33:56', '2015-04-27 21:20:39', 1),
(245, 'Vanuatu', '2015-05-23 09:33:56', '2015-04-27 21:20:58', 1),
(246, 'Venezuela', '2015-05-23 09:33:56', '2015-04-27 21:21:10', 1),
(247, 'Vietnam', '2015-05-23 09:33:56', '2015-04-27 21:21:24', 1),
(248, 'Virgin Islands - British', '2015-05-23 09:33:56', '2015-04-27 21:21:35', 1),
(249, 'Virgin Islands - U.S.', '2015-05-23 09:33:56', '2015-04-27 21:21:50', 1),
(250, 'Wallis and Futuna', '2015-05-23 09:33:56', '2015-04-27 21:22:05', 1),
(251, 'Western Sahara', '2015-05-23 09:33:56', '2015-04-27 21:22:18', 1),
(252, 'Yemen', '2015-05-23 09:33:56', '2015-04-27 21:22:30', 1),
(253, 'Yugoslavia', '2015-05-23 09:33:56', '2015-04-27 21:23:45', 1),
(254, 'Zaire', '2015-05-23 09:33:56', '2015-04-27 21:27:10', 1),
(255, 'Zambia', '2015-05-23 09:33:56', '2015-04-27 21:27:24', 1),
(256, 'Zimbabwe', '2015-05-23 09:33:56', '2015-04-27 21:27:51', 1);

--
-- Triggers `countries`
--
DELIMITER //
CREATE TRIGGER `delete_countries_row` BEFORE DELETE ON `countries`
 FOR EACH ROW BEGIN UPDATE countries SET hide="Y" WHERE id=pID; END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `update_countries_row` BEFORE UPDATE ON `countries`
 FOR EACH ROW BEGIN
  UPDATE countries SET hide = 'Y' WHERE id = pID;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cviews`
--

CREATE TABLE IF NOT EXISTS `cviews` (
`id` int(11) NOT NULL,
  `website_id` int(11) NOT NULL,
  `day` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `user` int(11) NOT NULL,
  `view` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=318 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cviews`
--

INSERT INTO `cviews` (`id`, `website_id`, `day`, `user`, `view`) VALUES
(3, 0, '2014-11-05', 789, 1596),
(4, 0, '2014-11-06', 652, 1903),
(5, 0, '2014-11-07', 1214, 1576),
(6, 0, '2014-11-08', 4970, 9119),
(7, 0, '2014-11-09', 9373, 13163),
(8, 0, '2014-11-10', 7592, 17443),
(9, 0, '2014-11-11', 0, 529258),
(10, 0, '2014-11-12', 0, 1375127),
(11, 0, '2014-11-13', 43, 415313),
(12, 0, '2014-11-14', 650, 42234),
(13, 0, '2014-11-15', 307, 11285),
(14, 0, '2014-11-16', 49, 1391),
(15, 0, '2014-11-16', 49, 1391),
(16, 0, '2014-11-17', 3835, 218681),
(17, 0, '2014-11-18', 3217, 235121),
(18, 0, '2014-11-19', 157857, 250628),
(19, 0, '2014-11-20', 240868, 241667),
(20, 0, '2014-11-21', 132815, 133484),
(21, 0, '2014-11-22', 92621, 93114),
(22, 0, '2014-11-23', 29372, 30069),
(23, 0, '2014-11-24', 134969, 135908),
(24, 0, '2014-11-25', 144015, 144775),
(25, 0, '2014-11-26', 171813, 172865),
(26, 0, '2014-11-27', 1505, 1508),
(27, 5, '2014-12-23', 23, 38400),
(28, 4, '2014-12-23', 28, 48989),
(29, 4, '2014-12-24', 50, 64210),
(30, 5, '2014-12-24', 22, 52442),
(31, 4, '2014-12-25', 14, 69377),
(32, 5, '2014-12-25', 9, 59052),
(33, 5, '2014-12-26', 25, 70115),
(34, 4, '2014-12-26', 25, 75865),
(35, 5, '2014-12-27', 1, 69604),
(36, 4, '2014-12-27', 8, 68017),
(37, 5, '2014-12-28', 10, 72538),
(38, 4, '2014-12-28', 4, 64827),
(39, 5, '2014-12-29', 5, 76540),
(40, 4, '2014-12-29', 2, 75444),
(41, 3, '2014-12-29', 1, 1),
(42, 4, '2014-12-30', 7, 64130),
(43, 5, '2014-12-30', 2, 70164),
(44, 5, '2014-12-31', 19, 65856),
(45, 4, '2014-12-31', 14, 61014),
(46, 3, '2014-12-31', 1, 1),
(47, 5, '2015-01-01', 11, 65589),
(48, 4, '2015-01-01', 1, 46915),
(49, 4, '2015-01-02', 5, 67246),
(50, 5, '2015-01-02', 9, 74663),
(51, 3, '2015-01-02', 1, 1),
(52, 5, '2015-01-03', 1, 79345),
(53, 4, '2015-01-03', 1, 69414),
(54, 5, '2015-01-04', 8, 78563),
(55, 4, '2015-01-04', 3, 63645),
(56, 4, '2015-01-05', 91, 78016),
(57, 5, '2015-01-05', 85, 80674),
(58, 3, '2015-01-05', 1, 1),
(59, 5, '2015-01-06', 22, 92249),
(60, 4, '2015-01-06', 31, 89183),
(61, 5, '2015-01-07', 19, 94796),
(62, 4, '2015-01-07', 23, 95840),
(63, 3, '2015-01-07', 1, 1),
(64, 5, '2015-01-08', 128, 102823),
(65, 4, '2015-01-08', 143, 100372),
(66, 5, '2015-01-09', 32, 104091),
(67, 4, '2015-01-09', 44, 102026),
(68, 5, '2015-01-10', 139, 99641),
(69, 4, '2015-01-10', 144, 92358),
(70, 4, '2015-01-11', 44, 88341),
(71, 5, '2015-01-11', 33, 109647),
(72, 5, '2015-01-12', 356, 101166),
(73, 4, '2015-01-12', 309, 101041),
(74, 5, '2015-01-13', 4, 97838),
(75, 4, '2015-01-13', 1, 81442),
(76, 4, '2015-01-14', 3, 68154),
(77, 5, '2015-01-14', 6, 95121),
(78, 5, '2015-01-15', 70, 86967),
(79, 4, '2015-01-15', 27, 63964),
(80, 4, '2015-01-16', 7, 59960),
(81, 5, '2015-01-16', 12, 79041),
(82, 4, '2015-01-17', 17, 52444),
(83, 5, '2015-01-17', 28, 80038),
(84, 5, '2015-01-18', 25, 75540),
(85, 4, '2015-01-18', 2, 51325),
(86, 5, '2015-01-19', 31, 85894),
(87, 4, '2015-01-19', 16, 67351),
(88, 5, '2015-01-20', 22, 76506),
(89, 4, '2015-01-20', 4, 64194),
(90, 5, '2015-01-21', 120, 85734),
(91, 4, '2015-01-21', 400, 123564),
(92, 5, '2015-01-22', 176, 80599),
(93, 4, '2015-01-22', 362, 117653),
(94, 4, '2015-01-23', 302, 136357),
(95, 5, '2015-01-23', 172, 99274),
(96, 5, '2015-01-24', 169, 72961),
(97, 4, '2015-01-24', 223, 101180),
(98, 5, '2015-01-25', 135, 62990),
(99, 4, '2015-01-25', 211, 84505),
(100, 5, '2015-01-26', 179, 89569),
(101, 4, '2015-01-26', 351, 118721),
(102, 5, '2015-01-27', 131, 99636),
(103, 4, '2015-01-27', 501, 133130),
(104, 4, '2015-01-28', 830, 100382),
(105, 5, '2015-01-28', 301, 80152),
(106, 5, '2015-01-29', 176, 102948),
(107, 4, '2015-01-29', 196, 133126),
(108, 5, '2015-01-30', 128, 105852),
(109, 4, '2015-01-30', 394, 127129),
(110, 4, '2015-01-31', 338, 123286),
(111, 5, '2015-01-31', 209, 107478),
(112, 4, '2015-02-01', 432, 94666),
(113, 5, '2015-02-01', 182, 84192),
(114, 5, '2015-02-02', 143, 102564),
(115, 4, '2015-02-02', 364, 129466),
(116, 4, '2015-02-03', 387, 136738),
(117, 5, '2015-02-03', 145, 104726),
(118, 4, '2015-02-04', 503, 138301),
(119, 5, '2015-02-04', 187, 104892),
(120, 4, '2015-02-05', 820, 140387),
(121, 5, '2015-02-05', 393, 105543),
(122, 5, '2015-02-06', 124, 98686),
(123, 4, '2015-02-06', 446, 134136),
(124, 4, '2015-02-07', 103, 113067),
(125, 5, '2015-02-07', 47, 89993),
(126, 4, '2015-02-08', 370, 80977),
(127, 5, '2015-02-08', 142, 68280),
(128, 4, '2015-02-09', 307, 133246),
(129, 5, '2015-02-09', 102, 95671),
(130, 5, '2015-02-10', 127, 92176),
(131, 4, '2015-02-10', 351, 126618),
(132, 4, '2015-02-11', 625, 109924),
(133, 5, '2015-02-11', 223, 81625),
(134, 4, '2015-02-12', 171, 114220),
(135, 5, '2015-02-12', 77, 85800),
(136, 4, '2015-02-13', 260, 120785),
(137, 5, '2015-02-13', 51, 97611),
(138, 4, '2015-02-14', 161, 111656),
(139, 5, '2015-02-14', 74, 96594),
(140, 4, '2015-02-15', 96, 99148),
(141, 5, '2015-02-15', 80, 91412),
(142, 4, '2015-02-16', 43, 94544),
(143, 5, '2015-02-16', 29, 86915),
(144, 4, '2015-02-17', 13, 70762),
(145, 5, '2015-02-17', 33, 75193),
(146, 5, '2015-02-18', 2, 73273),
(147, 4, '2015-02-18', 7, 72263),
(148, 4, '2015-02-19', 15, 73614),
(149, 5, '2015-02-19', 1, 73633),
(150, 5, '2015-02-20', 14, 50343),
(151, 4, '2015-02-20', 40, 48961),
(152, 4, '2015-02-21', 11, 79690),
(153, 5, '2015-02-21', 19, 87570),
(154, 4, '2015-02-22', 31, 84019),
(155, 5, '2015-02-22', 41, 92318),
(156, 4, '2015-02-23', 75, 91800),
(157, 5, '2015-02-23', 78, 116273),
(158, 5, '2015-02-24', 71, 116505),
(159, 4, '2015-02-24', 220, 113454),
(160, 5, '2015-02-25', 375, 114028),
(161, 4, '2015-02-25', 541, 116882),
(162, 5, '2015-02-26', 357, 138329),
(163, 4, '2015-02-26', 533, 132305),
(164, 4, '2015-02-27', 456, 135901),
(165, 5, '2015-02-27', 305, 142263),
(166, 4, '2015-02-28', 344, 124543),
(167, 5, '2015-02-28', 516, 160741),
(168, 4, '2015-03-01', 347, 125029),
(169, 5, '2015-03-01', 483, 155698),
(170, 5, '2015-03-02', 643, 158571),
(171, 4, '2015-03-02', 1197, 153145),
(172, 5, '2015-03-03', 365, 143117),
(173, 4, '2015-03-03', 534, 133903),
(174, 5, '2015-03-04', 398, 144770),
(175, 4, '2015-03-04', 623, 144857),
(176, 4, '2015-03-05', 658, 149591),
(177, 5, '2015-03-05', 569, 154348),
(178, 5, '2015-03-06', 466, 134933),
(179, 4, '2015-03-06', 613, 135180),
(180, 5, '2015-03-07', 598, 108920),
(181, 4, '2015-03-07', 796, 95237),
(182, 4, '2015-03-08', 105, 104449),
(183, 5, '2015-03-08', 160, 131913),
(184, 4, '2015-03-09', 540, 134785),
(185, 5, '2015-03-09', 350, 132743),
(186, 5, '2015-03-09', 350, 132743),
(187, 5, '2015-03-10', 759, 93086),
(188, 4, '2015-03-10', 1699, 99471),
(189, 5, '2015-03-11', 1653, 119856),
(190, 4, '2015-03-11', 2826, 123224),
(191, 4, '2015-03-11', 2826, 123224),
(192, 5, '2015-03-12', 1635, 124394),
(193, 4, '2015-03-12', 2949, 124473),
(194, 5, '2015-03-13', 1405, 128073),
(195, 4, '2015-03-13', 2234, 135100),
(196, 5, '2015-03-14', 1745, 129833),
(197, 4, '2015-03-14', 2438, 109447),
(198, 4, '2015-03-15', 1117, 104548),
(199, 5, '2015-03-15', 1396, 136509),
(200, 5, '2015-03-16', 2913, 174501),
(201, 5, '2015-03-16', 2913, 174501),
(202, 4, '2015-03-16', 2348, 125651),
(203, 4, '2015-03-16', 2348, 125651),
(204, 4, '2015-03-17', 1565, 163531),
(205, 5, '2015-03-17', 1526, 193104),
(206, 5, '2015-03-18', 2004, 211882),
(207, 4, '2015-03-18', 1684, 169251),
(208, 4, '2015-03-19', 1464, 166919),
(209, 5, '2015-03-19', 1306, 188110),
(210, 5, '2015-03-20', 2386, 146106),
(211, 4, '2015-03-20', 3041, 146643),
(212, 5, '2015-03-21', 477, 141185),
(213, 4, '2015-03-21', 362, 129476),
(214, 5, '2015-03-22', 440, 153861),
(215, 4, '2015-03-22', 356, 119567),
(216, 4, '2015-03-23', 1936, 172595),
(217, 5, '2015-03-23', 1468, 176481),
(218, 4, '2015-03-24', 2666, 187471),
(219, 5, '2015-03-24', 2111, 189075),
(220, 5, '2015-03-25', 2064, 195619),
(221, 4, '2015-03-25', 2576, 181117),
(222, 5, '2015-03-26', 1973, 215941),
(223, 4, '2015-03-26', 2224, 195426),
(224, 4, '2015-03-27', 2434, 193149),
(225, 5, '2015-03-27', 2408, 230094),
(226, 4, '2015-03-28', 2317, 132954),
(227, 5, '2015-03-28', 2138, 168831),
(228, 5, '2015-03-29', 1963, 187611),
(229, 4, '2015-03-29', 1630, 125553),
(230, 4, '2015-03-30', 2510, 164741),
(231, 5, '2015-03-30', 2500, 177877),
(232, 4, '2015-03-31', 1600, 176417),
(233, 5, '2015-03-31', 1661, 204198),
(234, 5, '2015-04-01', 3021, 228165),
(235, 4, '2015-04-01', 2707, 186223),
(236, 4, '2015-04-02', 2825, 194644),
(237, 5, '2015-04-02', 2893, 236892),
(238, 5, '2015-04-03', 1135, 202787),
(239, 4, '2015-04-03', 1506, 174427),
(240, 4, '2015-04-04', 275, 148773),
(241, 5, '2015-04-04', 429, 197554),
(242, 5, '2015-04-05', 503, 211057),
(243, 4, '2015-04-05', 309, 138873),
(244, 4, '2015-04-06', 1144, 199036),
(245, 5, '2015-04-06', 1407, 233864),
(246, 4, '2015-04-07', 1254, 209362),
(247, 5, '2015-04-07', 1633, 249694),
(248, 5, '2015-04-08', 1476, 241700),
(249, 4, '2015-04-08', 1217, 218170),
(250, 5, '2015-04-09', 1783, 237832),
(251, 4, '2015-04-09', 1635, 208572),
(252, 5, '2015-04-10', 2300, 281762),
(253, 4, '2015-04-10', 1662, 223624),
(254, 5, '2015-04-11', 2184, 243050),
(255, 4, '2015-04-11', 2575, 291174),
(256, 5, '2015-04-12', 4742, 266382),
(257, 4, '2015-04-12', 4502, 282905),
(258, 4, '2015-04-13', 4684, 344072),
(259, 5, '2015-04-13', 3141, 239127),
(260, 5, '2015-04-14', 513, 34892),
(261, 4, '2015-04-14', 1016, 65443),
(262, 4, '2015-04-25', 1175, 187941),
(263, 5, '2015-04-25', 1076, 177254),
(264, 5, '2015-04-25', 1076, 177254),
(265, 5, '2015-04-26', 1466, 216551),
(266, 5, '2015-04-26', 1466, 216551),
(267, 4, '2015-04-26', 1879, 254572),
(268, 4, '2015-04-27', 2307, 276246),
(269, 5, '2015-04-27', 1719, 215533),
(270, 4, '2015-04-28', 833, 211174),
(271, 5, '2015-04-28', 975, 234665),
(272, 5, '2015-04-29', 1636, 239043),
(273, 4, '2015-04-29', 1544, 222932),
(274, 4, '2015-04-30', 728, 210095),
(275, 5, '2015-04-30', 755, 206696),
(276, 5, '2015-05-01', 780, 237186),
(277, 4, '2015-05-01', 380, 122747),
(278, 4, '2015-05-02', 454, 125832),
(279, 5, '2015-05-02', 1012, 264445),
(280, 4, '2015-05-03', 237, 120083),
(281, 5, '2015-05-03', 492, 236499),
(282, 5, '2015-05-04', 1912, 231443),
(283, 4, '2015-05-04', 1568, 166107),
(284, 5, '2015-05-05', 1796, 255108),
(285, 4, '2015-05-05', 1281, 182164),
(286, 5, '2015-05-06', 1706, 246843),
(287, 4, '2015-05-06', 1135, 186558),
(288, 5, '2015-05-07', 3208, 295174),
(289, 4, '2015-05-07', 2804, 253425),
(290, 4, '2015-05-08', 2762, 274359),
(291, 5, '2015-05-08', 3446, 318314),
(292, 5, '2015-05-09', 3497, 297877),
(293, 4, '2015-05-09', 2653, 230863),
(294, 5, '2015-05-10', 2191, 286120),
(295, 4, '2015-05-10', 1492, 195726),
(296, 4, '2015-05-11', 2548, 250541),
(297, 5, '2015-05-11', 2657, 276737),
(298, 4, '2015-05-12', 3174, 251180),
(299, 5, '2015-05-12', 3439, 277442),
(300, 4, '2015-05-13', 2993, 263445),
(301, 5, '2015-05-13', 3808, 346937),
(302, 5, '2015-05-14', 3064, 308156),
(303, 4, '2015-05-14', 2782, 267058),
(304, 5, '2015-05-15', 2859, 292005),
(305, 4, '2015-05-15', 2567, 261286),
(306, 5, '2015-05-16', 2107, 270997),
(307, 4, '2015-05-16', 1790, 218381),
(308, 4, '2015-05-17', 1236, 195616),
(309, 5, '2015-05-17', 1692, 252975),
(310, 5, '2015-05-18', 7443, 112053),
(311, 4, '2015-05-18', 12496, 132072),
(312, 5, '2015-05-19', 12, 11878),
(313, 4, '2015-05-19', 32, 7526),
(314, 5, '2015-05-20', 11, 2171),
(315, 4, '2015-05-20', 17, 2168),
(316, 4, '2015-05-21', 1, 21),
(317, 5, '2015-05-21', 1, 49);

--
-- Triggers `cviews`
--
DELIMITER //
CREATE TRIGGER `delete_cviews_row` BEFORE DELETE ON `cviews`
 FOR EACH ROW BEGIN UPDATE cviews SET hide="Y" WHERE id=pID; END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `update_cviews_row` BEFORE UPDATE ON `cviews`
 FOR EACH ROW BEGIN
  UPDATE cviews SET hide = 'Y' WHERE id = pID;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `data_helper`
--

CREATE TABLE IF NOT EXISTS `data_helper` (
`id` int(11) NOT NULL,
  `uri_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `content_helper_en` text COLLATE utf8_unicode_ci NOT NULL,
  `content_helper_vi` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Triggers `data_helper`
--
DELIMITER //
CREATE TRIGGER `delete_data_helper_row` BEFORE DELETE ON `data_helper`
 FOR EACH ROW BEGIN UPDATE data_helper SET hide="Y" WHERE id=pID; END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `update_data_helper_row` BEFORE UPDATE ON `data_helper`
 FOR EACH ROW BEGIN
  UPDATE data_helper SET hide = 'Y' WHERE id = pID;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `data_uri`
--

CREATE TABLE IF NOT EXISTS `data_uri` (
`id` int(11) NOT NULL,
  `helper_id` int(11) NOT NULL,
  `uri_segment` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Triggers `data_uri`
--
DELIMITER //
CREATE TRIGGER `delete_data_uri_row` BEFORE DELETE ON `data_uri`
 FOR EACH ROW BEGIN UPDATE data_uri SET hide="Y" WHERE id=pID; END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `update_data_uri_row` BEFORE UPDATE ON `data_uri`
 FOR EACH ROW BEGIN
  UPDATE data_uri SET hide = 'Y' WHERE id = pID;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE IF NOT EXISTS `emails` (
`id` int(11) NOT NULL,
  `email_id` text COLLATE utf8_unicode_ci NOT NULL,
  `from` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `to` text COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `html_iframe` text COLLATE utf8_unicode_ci NOT NULL,
  `date` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `seen` int(1) NOT NULL,
  `type_message` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `folder_banners`
--

CREATE TABLE IF NOT EXISTS `folder_banners` (
`id` int(11) NOT NULL,
  `folder_name` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `folder_banners`
--

INSERT INTO `folder_banners` (`id`, `folder_name`, `created_at`, `updated_at`) VALUES
(1, '2014-12-23', '2014-12-23 01:26:52', '2014-12-23 01:26:52'),
(2, '2014-12-24', '2014-12-23 18:43:07', '2014-12-23 18:43:07'),
(3, '2014-12-25', '2014-12-24 19:04:32', '2014-12-24 19:04:32'),
(4, '2014-12-26', '2014-12-25 18:52:29', '2014-12-25 18:52:29'),
(5, '2014-12-27', '2014-12-26 22:16:54', '2014-12-26 22:16:54'),
(6, '2014-12-30', '2014-12-30 00:08:54', '2014-12-30 00:08:54'),
(7, '2014-12-31', '2014-12-30 21:51:53', '2014-12-30 21:51:53'),
(8, '2015-01-01', '2014-12-31 18:06:56', '2014-12-31 18:06:56'),
(9, '2015-01-02', '2015-01-01 17:39:09', '2015-01-01 17:39:09'),
(10, '2015-01-03', '2015-01-03 02:12:59', '2015-01-03 02:12:59'),
(11, '2015-01-05', '2015-01-04 18:32:56', '2015-01-04 18:32:56'),
(12, '2015-01-06', '2015-01-05 23:11:39', '2015-01-05 23:11:39');

--
-- Triggers `folder_banners`
--
DELIMITER //
CREATE TRIGGER `delete_folder_banners_row` BEFORE DELETE ON `folder_banners`
 FOR EACH ROW BEGIN UPDATE folder_banners SET hide="Y" WHERE id=pID; END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `update_folder_banners_row` BEFORE UPDATE ON `folder_banners`
 FOR EACH ROW BEGIN
  UPDATE folder_banners SET hide = 'Y' WHERE id = pID;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
`id` int(11) NOT NULL,
  `language_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language_name`, `created_at`, `updated_at`, `status`) VALUES
(22, 'Czech', '2015-05-22 08:24:54', '2015-04-27 19:02:05', 1),
(23, 'Danish', '2015-05-22 08:24:54', '2015-04-27 19:02:27', 1),
(24, 'Dutch', '2015-05-22 08:24:54', '2015-04-27 19:02:53', 1),
(25, 'English', '2015-05-22 08:24:54', '2015-04-27 19:03:06', 1),
(26, 'Faeroese', '2015-05-22 08:24:54', '2015-04-27 19:03:34', 1),
(27, 'Finnish', '2015-05-22 08:24:54', '2015-04-27 19:04:03', 1),
(28, 'French', '2015-05-22 08:24:54', '2015-04-27 19:04:29', 1),
(29, 'Galician', '2015-05-22 08:24:54', '2015-04-27 19:04:55', 1),
(30, 'German', '2015-05-22 08:24:54', '2015-04-27 19:05:07', 1),
(31, 'Greek', '2015-05-22 08:24:54', '2015-04-27 19:06:03', 1),
(32, 'Hungarian', '2015-05-22 08:24:54', '2015-04-27 19:09:23', 1),
(33, 'Icelandic', '2015-05-22 08:24:54', '2015-04-27 19:10:21', 1),
(34, 'Irish', '2015-05-22 08:24:54', '2015-04-27 19:10:28', 1),
(35, 'Italian', '2015-05-22 08:24:54', '2015-04-27 19:10:59', 1),
(36, 'Japanese', '2015-05-22 08:24:54', '2015-04-27 19:11:26', 1),
(37, 'Korean', '2015-05-22 08:24:54', '2015-04-27 19:11:50', 1),
(38, 'Macedonian', '2015-05-22 08:24:54', '2015-04-27 19:12:14', 1),
(39, 'Norwegian', '2015-05-22 08:24:54', '2015-04-27 19:12:28', 1),
(40, 'Polish', '2015-05-22 08:24:54', '2015-04-27 19:12:54', 1),
(41, 'Portuguese', '2015-05-22 08:24:54', '2015-04-27 19:13:22', 1),
(42, 'Romanian', '2015-05-22 08:24:54', '2015-04-27 19:15:29', 1),
(43, 'Russian', '2015-05-22 08:24:54', '2015-04-27 19:17:37', 1),
(44, 'Scots Gaelic', '2015-05-22 08:24:54', '2015-04-27 19:17:50', 1),
(45, 'Serbian', '2015-05-22 08:24:54', '2015-04-27 19:18:17', 1),
(46, 'Slovak', '2015-05-22 08:24:54', '2015-04-27 19:18:38', 1),
(47, 'Slovenian', '2015-05-22 08:24:54', '2015-04-27 19:19:05', 1),
(48, 'Spanish', '2015-05-22 08:24:54', '2015-04-27 19:19:16', 1),
(49, 'Swedish', '2015-05-22 08:24:54', '2015-04-27 19:19:43', 1),
(50, 'Turkish', '2015-05-22 08:24:54', '2015-04-27 19:20:12', 1),
(51, 'Ukrainian', '2015-05-22 08:24:54', '2015-04-27 19:20:35', 1),
(52, 'Vietnamese', '2015-05-22 08:24:54', '2015-04-27 19:21:24', 1);

--
-- Triggers `languages`
--
DELIMITER //
CREATE TRIGGER `delete_languages_row` BEFORE DELETE ON `languages`
 FOR EACH ROW BEGIN UPDATE languages SET hide="Y" WHERE id=pID; END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `update_languages_row` BEFORE UPDATE ON `languages`
 FOR EACH ROW BEGIN
  UPDATE languages SET hide = 'Y' WHERE id = pID;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_09_12_083509_create_zones_table', 1),
('2014_09_14_075912_create_posts_table', 1),
('2014_09_14_080124_create_comments_table', 1),
('2014_09_15_044839_create_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE IF NOT EXISTS `requests` (
`id` int(11) NOT NULL,
  `sender` text COLLATE utf8_unicode_ci NOT NULL,
  `title_request` text COLLATE utf8_unicode_ci NOT NULL,
  `content_request` text COLLATE utf8_unicode_ci NOT NULL,
  `attach_file` text COLLATE utf8_unicode_ci NOT NULL,
  `date_sent` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `receiver` text COLLATE utf8_unicode_ci NOT NULL,
  `solverid` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `sender`, `title_request`, `content_request`, `attach_file`, `date_sent`, `receiver`, `solverid`, `status`, `created_at`, `updated_at`) VALUES
(1, 'From: Loan Dang Thi Chau <dtcloan@tpinfo.vn>', 'Banner quảng cáo trên Tintuc.vn', '<p>Dear Cường!</p>\r\n\r\n<div>Chị gửi em Top Banner trang <a href="http://tintuc.vn/">tintuc.vn</a>.&nbsp;</div>\r\n\r\n<div>- Thời gian đăng: 2 th&aacute;ng, bắt đầu từ ng&agrave;y 24/12/2014</div>\r\n\r\n<div>- Vị Tr&iacute; Top Banner, cơ chế chia sẻ</div>\r\n\r\n<div>- Mỗi th&aacute;ng c&oacute; 4 b&agrave;i PR ở chuy&ecirc;n mục ph&ugrave; hợp.</div>\r\n\r\n<div>\r\n<p>Em xem hai banner n&agrave;y v&agrave; add đường link v&agrave;o gi&uacute;p chị nh&eacute;</p>\r\n\r\n<p>Đường link:&nbsp;<a href="http://sacdepvasuckhoe.wordpress.com/2014/12/19/qua-tang-giang-sinh-nam-moi/" target="_blank">http://sacdepvasuckhoe.wordpress.com/2014/12/19/qua-tang-giang-sinh-nam-moi/</a></p>\r\n\r\n<p>Cường xem, c&oacute; thể gi&uacute;p chị l&agrave;m thế n&agrave;o để lượng truy cập v&agrave;o www của kh&aacute;ch cao ch&uacute;t nh&eacute;.</p>\r\n\r\n<p>Tr&acirc;n trọng./.</p>\r\n</div>\r\n', '', '2015-04-01', 'To: cuong@tintuc.vn\r\nCc: Huong Phan <ph.huong77@gmail.com>, Thom Nguyen Thi <ntthom@tpinfo.vn>, Lai Van Thu <vanthu2608@gmail.com>, Tuan Vu Nguyen <ntvu@tpinfo.vn>', 1, 1, '2015-03-31 23:14:29', '2015-05-23 09:35:04');

--
-- Triggers `requests`
--
DELIMITER //
CREATE TRIGGER `delete_requests_row` BEFORE DELETE ON `requests`
 FOR EACH ROW BEGIN UPDATE requests SET hide="Y" WHERE id=pID; END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `update_requests_row` BEFORE UPDATE ON `requests`
 FOR EACH ROW BEGIN
  UPDATE requests SET hide = 'Y' WHERE id = pID;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `userlogs`
--

CREATE TABLE IF NOT EXISTS `userlogs` (
`id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `usertype` int(4) NOT NULL,
  `userid` int(11) NOT NULL,
  `username` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contextid` int(11) NOT NULL,
  `object` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `details` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `userlogs`
--

INSERT INTO `userlogs` (`id`, `account_id`, `usertype`, `userid`, `username`, `action`, `context`, `contextid`, `object`, `details`, `created_at`, `updated_at`) VALUES
(1, 2, 0, 8, 'myads', 'updated', 'Banner', 45, 'Banner hiển thị tới trang gohappy.vn', 'myads updated Banner "Banner hiển thị tới trang gohappy.vn" (#45)', '2015-05-18 02:55:09', '2015-05-18 02:55:09'),
(2, 2, 0, 8, 'myads', 'updated', 'Banner', 45, 'Banner hiển thị tới trang gohappy.vn', 'myads updated Banner "Banner hiển thị tới trang gohappy.vn" (#45)', '2015-05-18 02:55:51', '2015-05-18 02:55:51'),
(3, 2, 0, 8, 'myads', 'updated', 'Banner', 46, 'Banner chạy song song hiển thị tới trang gohappy.vn', 'myads updated Banner "Banner chạy song song hiển thị tới trang gohappy.vn" (#46)', '2015-05-18 02:56:20', '2015-05-18 02:56:20'),
(4, 2, 0, 8, 'myads', 'updated', 'Banner', 46, 'Banner chạy song song hiển thị tới trang gohappy.vn', 'myads updated Banner "Banner chạy song song hiển thị tới trang gohappy.vn" (#46)', '2015-05-18 02:56:59', '2015-05-18 02:56:59'),
(5, 2, 0, 8, 'myads', 'inserted', 'User', 9, 'qc.admin', 'myads inserted User "qc.admin" (#9)', '2015-05-22 01:25:29', '2015-05-22 01:25:29');

--
-- Triggers `userlogs`
--
DELIMITER //
CREATE TRIGGER `delete_userlogs_row` BEFORE DELETE ON `userlogs`
 FOR EACH ROW BEGIN UPDATE userlogs SET hide="Y" WHERE id=pID; END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `update_userlogs_row` BEFORE UPDATE ON `userlogs`
 FOR EACH ROW BEGIN
  UPDATE userlogs SET hide = 'Y' WHERE id = pID;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(10) unsigned NOT NULL,
  `contact_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `password_md5` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `password_temp` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `default_account_id` int(11) NOT NULL,
  `permission` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `clientid` int(11) NOT NULL,
  `comments` text COLLATE utf8_unicode_ci NOT NULL,
  `active` int(1) NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_last_login` datetime NOT NULL,
  `ip_address_last_login` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `email_updated` datetime NOT NULL,
  `order_no` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1',
  `online` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `contact_name`, `email_address`, `username`, `password`, `password_md5`, `password_temp`, `language`, `default_account_id`, `permission`, `clientid`, `comments`, `active`, `code`, `remember_token`, `created_at`, `updated_at`, `date_last_login`, `ip_address_last_login`, `email_updated`, `order_no`, `status`, `online`) VALUES
(8, 'DAO TIEN TU - Default', 'tudt@tintuc.vn', 'myads', '$2y$10$VD8XLVKqy4kkkz1sFFZjo.nvKKorSmZu8CLuqihkEuO1B85miGRUO', 'd41d8cd98f00b204e9800998ecf8427e', '', '52', 2, '', 0, '', 1, 'llmZ5pVMeP7F04WkcsukarzTjTR0cdkwq5zmGWUjKRnzoWmoGhTMBeDMktYb', 'zObh25Y28LKM3JfDC0C4KA9bLoWiL1VipkQl29NXwgDLexV3tGaAjioLRTW4', '2015-05-05 01:03:21', '2015-05-23 02:19:09', '2015-05-23 09:19:09', '123.24.18.125', '0000-00-00 00:00:00', 3, 0, 1);

--
-- Triggers `users`
--
DELIMITER //
CREATE TRIGGER `delete_users_row` BEFORE DELETE ON `users`
 FOR EACH ROW BEGIN UPDATE users SET hide="Y" WHERE id=pID; END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `update_users_row` BEFORE UPDATE ON `users`
 FOR EACH ROW BEGIN
  UPDATE users SET hide = 'Y' WHERE id = pID;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `views`
--

CREATE TABLE IF NOT EXISTS `views` (
`id` int(11) NOT NULL,
  `website_id` int(11) NOT NULL,
  `ip_address` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8_unicode_ci NOT NULL,
  `city` text COLLATE utf8_unicode_ci NOT NULL,
  `region` text COLLATE utf8_unicode_ci NOT NULL,
  `country` text COLLATE utf8_unicode_ci NOT NULL,
  `lat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `long` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `org` text COLLATE utf8_unicode_ci NOT NULL,
  `view_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=25668 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `views`
--

INSERT INTO `views` (`id`, `website_id`, `ip_address`, `user_agent`, `city`, `region`, `country`, `lat`, `long`, `org`, `view_at`) VALUES
(25286, 5, '113.162.128.243', 'Mozilla/5.0 (SymbianOS/9.4; Series60/5.0 NokiaC6-00/42.0.004; Profile/MIDP-2.1 Configuration/CLDC-1.1) AppleWebKit/533.4 (KHTML, like Gecko) NokiaBrowser/7.3.1.33 3gpp-gba', '', '', '', '', '', '', '2015-05-20 18:26:19'),
(25287, 4, '116.102.128.193', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/47.0 Chrome/41.0.2272.127_coc_coc Safari/537.36', '', '', '', '', '', '', '2015-05-20 18:31:55'),
(25288, 5, '171.233.110.95', 'Mozilla/5.0 (Linux; U; Android 4.4.4; vi; Lenovo P70-A Build/KOT49H) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.7.5.418 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-20 18:35:23'),
(25289, 4, '113.185.2.62', 'Mozilla/5.0 (Linux; Android 4.4.2; Lenovo A3500-HV Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/30.0.0.0 Safari/537.36 Mobile UCBrowser/3.4.3.532', '', '', '', '', '', '', '2015-05-20 18:38:00'),
(25290, 5, '113.172.194.155', 'Mozilla/5.0 (SymbianOS/9.4; Series60/5.0 NokiaC5-06/23.6.015; Profile/MIDP-2.1 Configuration/CLDC-1.1 ) AppleWebKit/533.4 (KHTML, like Gecko) NokiaBrowser/7.3.1.33 Mobile Safari/533.4 3gpp-gba', '', '', '', '', '', '', '2015-05-20 18:44:46'),
(25291, 4, '27.70.111.47', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '', '', '', '', '', '', '2015-05-20 18:48:09'),
(25292, 5, '113.160.154.80', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 525)', '', '', '', '', '', '', '2015-05-20 18:51:23'),
(25293, 5, '117.140.0.14', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 520) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-20 18:54:41'),
(25294, 5, '123.136.107.186', 'Mozilla/5.0 (Linux; U; Android 2.3.6; vi; GT-I9070 Build/GINGERBREAD) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.7.5.418 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-20 19:14:00'),
(25295, 5, '123.20.140.183', 'Mozilla/5.0 (Linux; Android 4.0.4; HTC Desire SV Build/IMM76D) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19', '', '', '', '', '', '', '2015-05-20 19:16:42'),
(25296, 5, '168.63.200.167', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 530 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-20 19:17:54'),
(25297, 4, '116.104.184.162', 'Mozilla/5.0 (Linux; U; Android 2.2.1; en-US; SHW-M180S Build/FROYO) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/10.0.0.488 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-20 19:20:09'),
(25298, 4, '125.212.201.41', 'Mozilla/5.0 (Linux; U; Android 2.2.1; en-US; SHW-M180S Build/FROYO) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/10.0.0.488 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-20 19:20:22'),
(25299, 5, '113.185.7.92', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 530 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-20 19:20:34'),
(25300, 5, '171.253.4.28', 'Mozilla/5.0 (Linux; Android 4.2.2; R831K Build/JDQ39) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.94 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-20 19:30:16'),
(25301, 5, '168.63.137.102', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 520) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-20 19:33:53'),
(25302, 5, '113.185.5.178', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 530 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-20 19:38:30'),
(25303, 4, '113.172.108.60', 'Mozilla/5.0 (Windows NT 5.1; rv:27.0) Gecko/20100101 Firefox/27.0', '', '', '', '', '', '', '2015-05-20 19:43:12'),
(25304, 5, '171.254.10.183', 'Mozilla/5.0 (Linux; Android 4.1.2; GT-S7392 Build/JZO54K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.82 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-20 19:44:42'),
(25305, 5, '117.140.0.14', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 520) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-20 19:49:26'),
(25306, 5, '113.187.4.164', 'Mozilla/5.0 (Linux; Android 4.4.4; vi-vn; SAMSUNG SM-N910C Build/KTU84P) AppleWebKit/537.36 (KHTML, like Gecko) Version/2.0 Chrome/34.0.1847.76 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-20 19:57:30'),
(25307, 4, '116.106.183.232', 'Mozilla/5.0 (Linux; U; Android 4.0.3; vi; MID9742 Build/IML74K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/9.9.2.467 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-20 20:02:43'),
(25308, 5, '123.18.90.67', 'Mozilla/5.0 (Linux; Android 4.2.2; R831K Build/JDQ39) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.94 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-20 20:04:15'),
(25309, 4, '113.168.75.230', 'Mozilla/5.0 (Windows NT 5.1; rv:36.0) Gecko/20100101 Firefox/36.0', '', '', '', '', '', '', '2015-05-20 20:09:33'),
(25310, 5, '14.171.183.71', 'Mozilla/5.0 (Linux; U; Android 4.2.1; en-US; Paladin Build/JOP40D) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.4.1.565 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-20 20:16:05'),
(25311, 5, '113.185.5.178', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 530 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-20 20:18:23'),
(25312, 5, '171.255.2.185', 'Mozilla/5.0 (Linux; U; Android 4.1.2; zh-CN; M1 Build/JZO54K) AppleWebKit/534.31 (KHTML, like Gecko) UCBrowser/9.0.2.299 U3/0.8.0 Mobile Safari/534.31', '', '', '', '', '', '', '2015-05-20 20:21:48'),
(25313, 4, '14.173.29.246', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/47.0 Chrome/41.0.2272.127_coc_coc Safari/537.36', '', '', '', '', '', '', '2015-05-20 20:25:04'),
(25314, 4, '171.252.129.22', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.127 CoRom/36.0.1985.127 Safari/537.36', '', '', '', '', '', '', '2015-05-20 20:25:53'),
(25315, 5, '113.185.7.112', 'Mozilla/5.0 (Linux; U; Android 4.3; en-us; NokiaX2DS Build/JLS36C) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.7.5.418 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-20 20:26:02'),
(25316, 5, '117.0.60.203', 'UCWEB/2.0 (Linux; U; Adr 4.2.1; vi; E3) U2/1.0.0 UCBrowser/9.1.0.297 U2/1.0.0 Mobile', '', '', '', '', '', '', '2015-05-20 20:31:43'),
(25317, 4, '14.173.30.206', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/47.0 Chrome/41.0.2272.127_coc_coc Safari/537.36', '', '', '', '', '', '', '2015-05-20 20:37:16'),
(25318, 5, '168.63.137.102', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 530 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-20 20:37:37'),
(25319, 5, '222.119.143.209', 'Mozilla/5.0 (Linux; U; Android 4.3; en-US; SHV-E250S Build/JSS15J) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.5.0.575 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-20 20:42:31'),
(25320, 5, '113.163.165.66', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 520)', '', '', '', '', '', '', '2015-05-20 20:43:11'),
(25321, 4, '14.165.97.219', 'Mozilla/5.0 (iPad; CPU OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53', '', '', '', '', '', '', '2015-05-20 20:46:10'),
(25322, 4, '115.78.94.22', 'Mozilla/5.0 (Windows NT 5.1; rv:31.0) Gecko/20100101 Firefox/31.0', '', '', '', '', '', '', '2015-05-20 20:46:41'),
(25323, 4, '171.252.129.22', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.127 CoRom/36.0.1985.127 Safari/537.36', '', '', '', '', '', '', '2015-05-20 20:56:11'),
(25324, 5, '27.66.128.97', 'Mozilla/5.0 (Linux; U; Android 4.0.4; vi; GN800 Build/IMM76D) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.7.5.418 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-20 21:00:23'),
(25325, 5, '113.163.139.209', 'Mozilla/5.0 (Linux; Android 4.4.4; vi-vn; SAMSUNG SM-A700H Build/KTU84P) AppleWebKit/537.36 (KHTML, like Gecko) Version/2.0 Chrome/34.0.1847.76 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-20 21:04:17'),
(25326, 5, '113.163.154.194', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 730 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-20 21:06:16'),
(25327, 4, '113.162.178.69', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '', '', '', '', '', '', '2015-05-20 21:07:12'),
(25328, 4, '27.3.88.67', 'Mozilla/5.0 (Linux; U; Android 4.1.2; vi-vn; GT-N8013 Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30', '', '', '', '', '', '', '2015-05-20 21:09:10'),
(25329, 5, '113.161.14.20', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 530 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-20 21:10:05'),
(25330, 5, '183.171.168.232', 'Mozilla/5.0 (Linux; U; Android 4.2.2; vi-vn; Lenovo S660 Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30 Mobile UCBrowser/3.4.1.483', '', '', '', '', '', '', '2015-05-20 21:12:38'),
(25331, 4, '115.77.15.133', 'Mozilla/5.0 (Linux; Android 4.1.1; X909 Build/JRO03L) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.111 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-20 21:15:34'),
(25332, 5, '123.136.106.153', 'Mozilla/5.0 (Linux; U; Android 2.3.6; vi; GT-I9070 Build/GINGERBREAD) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.7.5.418 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-20 21:15:52'),
(25333, 5, '171.253.31.31', 'Mozilla/5.0 (Linux; U; Android 2.3.6; vi-vn; GT-S5360 Build/GINGERBREAD) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-20 21:17:51'),
(25334, 5, '118.169.34.36', 'Mozilla/5.0 (Linux; U; Android 4.1.2; vi-vn; Nokia_XL Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30 UCBrowser/3.2.0.417', '', '', '', '', '', '', '2015-05-20 21:20:01'),
(25335, 5, '42.118.67.14', 'Mozilla/5.0 (Linux; U; Android 4.0.4; vi; GT-S7560 Build/IMM76I) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.8.0.435 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-20 21:20:41'),
(25336, 5, '113.173.67.238', 'Mozilla/5.0 (Linux; Android 4.2.2; R831K Build/JDQ39) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.94 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-20 21:49:54'),
(25337, 4, '14.164.215.59', 'Mozilla/5.0 (iPad; CPU OS 7_1_1 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D201 Safari/9537.53', '', '', '', '', '', '', '2015-05-20 21:51:07'),
(25338, 4, '1.54.101.222', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/534.14 (KHTML, like Gecko) Chrome/10.0.603.3 Safari/534.14', '', '', '', '', '', '', '2015-05-20 21:55:31'),
(25339, 5, '27.67.35.159', 'Mozilla/5.0 (Linux; U; Android 2.3.6; vi-vn; GT-I9100 Build/GINGERBREAD) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-20 21:57:31'),
(25340, 5, '168.63.200.167', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; Microsoft; Lumia 535 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-20 22:03:45'),
(25341, 4, '220.245.158.106', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Win64; x64; Trident/6.0)', '', '', '', '', '', '', '2015-05-20 22:05:27'),
(25342, 4, '220.245.158.106', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Win64; x64; Trident/6.0)', '', '', '', '', '', '', '2015-05-20 22:05:27'),
(25343, 4, '116.102.99.30', 'Mozilla/5.0 (iPad; CPU OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B554a Safari/9537.53', '', '', '', '', '', '', '2015-05-20 22:06:24'),
(25344, 5, '123.19.146.141', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; Microsoft; Lumia 435 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-20 22:12:34'),
(25345, 5, '113.168.191.74', 'Mozilla/5.0 (Linux; U; Android 4.1.2; vi-vn; GT-I8262 Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-20 22:18:03'),
(25346, 5, '27.67.36.186', 'Mozilla/5.0 (Linux; U; Android 4.1.2; vi; IM-A850L Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/9.9.2.467 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-20 22:26:19'),
(25347, 5, '113.185.7.108', 'Mozilla/5.0 (Linux; U; Android 4.4.4; vi-vn; SM-G360H Build/KTU84P) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-20 22:34:42'),
(25348, 4, '27.79.16.93', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.65 CoRom/31.0.1650.65 Safari/537.36', '', '', '', '', '', '', '2015-05-20 22:37:47'),
(25349, 5, '113.162.70.40', 'Mozilla/5.0 (Linux; Android 4.4.2; HTC Desire 816 dual sim Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.111 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-20 22:43:06'),
(25350, 5, '171.255.20.185', 'Mozilla/5.0 (Linux; U; Android 4.1.2; zh-CN; M1 Build/JZO54K) AppleWebKit/534.31 (KHTML, like Gecko) UCBrowser/9.0.2.299 U3/0.8.0 Mobile Safari/534.31', '', '', '', '', '', '', '2015-05-20 22:48:09'),
(25351, 4, '113.173.182.25', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', '', '', '', '', '', '', '2015-05-20 22:51:35'),
(25352, 5, '14.177.221.205', 'Mozilla/5.0 (Linux; Android 5.0.2; D2502 Build/19.3.A.0.472) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Mobile Safari/537.36 Mobile UCBrowser/3.4.3.532', '', '', '', '', '', '', '2015-05-20 23:02:43'),
(25353, 4, '123.25.250.165', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', '', '', '', '', '', '', '2015-05-20 23:05:01'),
(25354, 5, '42.118.115.34', 'Mozilla/5.0 (Linux; Android 4.2.2; 2013023 Build/HM2013023) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.111 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-20 23:11:35'),
(25355, 4, '113.163.84.180', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/47.0 Chrome/41.0.2272.127_coc_coc Safari/537.36', '', '', '', '', '', '', '2015-05-20 23:24:54'),
(25356, 4, '203.210.231.101', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/42.0 CoRom/36.0.1985.149 Chrome/36.0.1985.149 Safari/537.36', '', '', '', '', '', '', '2015-05-20 23:26:25'),
(25357, 4, '113.190.12.81', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', '', '', '', '', '', '', '2015-05-20 23:26:30'),
(25358, 5, '118.70.26.33', 'Mozilla/5.0 (Linux; U; Android 4.1.2; en-us; Nokia_XL Build/JZO54K) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.7.5.418 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-20 23:35:30'),
(25359, 5, '113.20.116.169', 'Mozilla/5.0 (Linux; U; Android 2.3.5(EditBy-NongDan); en-US; 101DL Build/GRJ90) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/9.9.4.484 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-20 23:38:52'),
(25360, 5, '14.172.103.130', 'Mozilla/5.0 (Linux; U; Android 4.0.4; vi; GT-S7560 Build/IMM76I) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.8.0.435 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-20 23:44:21'),
(25361, 4, '113.169.103.164', 'Mozilla/5.0 (Windows NT 5.1; rv:9.0) Gecko/20100101 Firefox/9.0', '', '', '', '', '', '', '2015-05-20 23:46:43'),
(25362, 5, '113.169.121.232', 'Mozilla/5.0 (Linux; U; Android 4.3; en-US; NokiaX2DS Build/JLS36C) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.1.0.527 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-20 23:47:00'),
(25363, 4, '113.162.65.233', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.127 CoRom/36.0.1985.127 Safari/537.36', '', '', '', '', '', '', '2015-05-20 23:52:51'),
(25364, 4, '113.160.100.154', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.5; .NET CLR 2.0.50727; AskTbFXTV5/5.14.1.20007; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 1.1.4322; InfoPath.2)', '', '', '', '', '', '', '2015-05-21 00:09:30'),
(25365, 4, '113.160.100.154', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB7.5; .NET CLR 2.0.50727; AskTbFXTV5/5.14.1.20007; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 1.1.4322; InfoPath.2)', '', '', '', '', '', '', '2015-05-21 00:09:30'),
(25366, 5, '171.254.27.4', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D257 Safari/9537.53', '', '', '', '', '', '', '2015-05-21 00:10:52'),
(25367, 4, '123.23.41.239', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/47.0 Chrome/41.0.2272.127_coc_coc Safari/537.36', '', '', '', '', '', '', '2015-05-21 00:13:14'),
(25368, 5, '27.67.10.85', 'Mozilla/5.0 (Linux; Android 4.4.2; Masstel Tab 720i Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.111 Safari/537.36', '', '', '', '', '', '', '2015-05-21 00:17:05'),
(25369, 5, '113.187.4.226', 'Mozilla/5.0 (Linux; U; Android 4.4.2; en-US; LG-D686 Build/KOT49I.D68620a) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.4.1.565 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 00:23:52'),
(25370, 5, '168.235.198.198', 'Mozilla/5.0 (Linux; U; Android 4.4.2; en-US; LG-D686 Build/KOT49I.D68620a) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.4.1.565 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 00:25:19'),
(25371, 5, '113.185.6.61', 'Mozilla/5.0 (Linux; U; Android 4.4.2; vi; Lenovo A5000 Build/KOT49H) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/9.9.2.467 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 00:28:04'),
(25372, 4, '113.171.127.134', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/47.0 Chrome/41.0.2272.127_coc_coc Safari/537.36', '', '', '', '', '', '', '2015-05-21 00:42:51'),
(25373, 5, '42.116.59.113', 'Mozilla/5.0 (Linux; U; Android 4.4.2; en-us; GT-I9505 Build/KOT49H) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.5.0.360 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-21 00:48:16'),
(25374, 5, '27.67.46.227', 'Mozilla/5.0 (Linux; U; Android 4.1.2; en-US; IM-A850L Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.4.1.565 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 00:50:08'),
(25375, 4, '123.23.59.215', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/47.0 Chrome/41.0.2272.127_coc_coc Safari/537.36', '', '', '', '', '', '', '2015-05-21 00:58:59'),
(25376, 4, '1.55.138.211', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.874.121 Safari/535.2', '', '', '', '', '', '', '2015-05-21 01:00:55'),
(25377, 4, '113.169.103.164', 'Mozilla/5.0 (Windows NT 5.1; rv:9.0) Gecko/20100101 Firefox/9.0', '', '', '', '', '', '', '2015-05-21 01:02:11'),
(25378, 5, '168.63.139.43', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; Microsoft; Lumia 535 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-21 01:03:49'),
(25379, 5, '171.255.140.87', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; Microsoft; Lumia 535 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-21 01:03:51'),
(25380, 5, '113.175.144.18', 'Mozilla/5.0 (Linux; U; Android 4.1.2; zh-CN; M1 Build/JZO54K) AppleWebKit/534.31 (KHTML, like Gecko) UCBrowser/9.0.2.299 U3/0.8.0 Mobile Safari/534.31', '', '', '', '', '', '', '2015-05-21 01:04:19'),
(25381, 5, '113.188.23.41', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 1520) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-21 01:11:19'),
(25382, 5, '113.187.16.72', 'Mozilla/5.0 (Linux; U; Android 4.3; vi-vn; X9006 Build/JLS36C) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30 Mobile UCBrowser/3.4.3.532', '', '', '', '', '', '', '2015-05-21 01:18:29'),
(25383, 5, '171.255.161.38', 'Mozilla/5.0 (Linux; U; Android 4.2.2; zh-CN; Pioneer_P3 Build/JDQ39) AppleWebKit/534.31 (KHTML, like Gecko) UCBrowser/9.1.0.297 U3/0.8.0 Mobile Safari/534.31', '', '', '', '', '', '', '2015-05-21 01:19:40'),
(25384, 5, '117.6.227.219', 'Mozilla/5.0 (Windows Phone 8.1; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 520) like Gecko', '', '', '', '', '', '', '2015-05-21 01:25:13'),
(25385, 4, '117.6.213.158', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/47.0 Chrome/41.0.2272.127_coc_coc Safari/537.36', '', '', '', '', '', '', '2015-05-21 01:28:14'),
(25386, 4, '113.168.148.160', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36', '', '', '', '', '', '', '2015-05-21 01:38:31'),
(25387, 5, '168.235.195.246', 'Mozilla/5.0 (Linux; U; Android 4.2.2; en-US; R1001 Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.2.0.535 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 01:41:47'),
(25388, 5, '123.21.53.190', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12B435 Safari/600.1.4', '', '', '', '', '', '', '2015-05-21 02:12:41'),
(25389, 5, '14.165.180.114', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 925) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-21 02:23:30'),
(25390, 4, '14.165.97.219', 'Mozilla/5.0 (iPad; CPU OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53', '', '', '', '', '', '', '2015-05-21 02:44:16'),
(25391, 5, '123.26.106.162', 'Mozilla/5.0 (SymbianOS/9.4; Series60/5.0 NokiaC6-00/42.0.004; Profile/MIDP-2.1 Configuration/CLDC-1.1) AppleWebKit/533.4 (KHTML, like Gecko) NokiaBrowser/7.3.1.33 3gpp-gba', '', '', '', '', '', '', '2015-05-21 03:11:17'),
(25392, 5, '14.172.103.130', 'Mozilla/5.0 (Linux; U; Android 4.0.4; vi; GT-S7560 Build/IMM76I) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.8.0.435 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-21 03:27:34'),
(25393, 5, '137.135.176.175', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 630) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-21 03:32:54'),
(25394, 5, '42.117.208.100', 'Mozilla/5.0 (Linux; U; Android 4.3; en-us; NokiaX2DS Build/JLS36C) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.7.5.418 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-21 03:37:46'),
(25395, 5, '14.172.175.254', 'Mozilla/5.0 (Linux; U; Android 2.3.6; en-US; GT-N7000 Build/GINGERBREAD) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.4.1.565 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 03:51:34'),
(25396, 5, '1.55.226.106', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 625H) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-21 03:51:43'),
(25397, 5, '123.26.106.162', 'Mozilla/5.0 (SymbianOS/9.4; Series60/5.0 NokiaC6-00/42.0.004; Profile/MIDP-2.1 Configuration/CLDC-1.1) AppleWebKit/533.4 (KHTML, like Gecko) NokiaBrowser/7.3.1.33 3gpp-gba', '', '', '', '', '', '', '2015-05-21 03:51:56'),
(25398, 5, '42.117.154.193', 'Mozilla/5.0 (Linux; U; Android 4.2.2; zh-CN; Pioneer_P3 Build/JDQ39) AppleWebKit/534.31 (KHTML, like Gecko) UCBrowser/9.1.0.297 U3/0.8.0 Mobile Safari/534.31', '', '', '', '', '', '', '2015-05-21 04:05:20'),
(25399, 5, '27.67.5.170', 'Mozilla/5.0 (Linux; Android 5.0.2; D2502 Build/19.3.A.0.472) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Mobile Safari/537.36 Mobile UCBrowser/3.4.3.532', '', '', '', '', '', '', '2015-05-21 04:24:17'),
(25400, 5, '116.104.163.165', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 520) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-21 04:29:42'),
(25401, 5, '37.228.105.78', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) OPiOS/10.1.1.92212 Mobile/11B554a Safari/9537.53', '', '', '', '', '', '', '2015-05-21 04:30:11'),
(25402, 5, '123.23.185.25', 'Mozilla/5.0 (Linux; U; Android 4.2.2; vi; Pioneer_P3 Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/9.9.3.478 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 04:30:42'),
(25403, 5, '222.119.143.209', 'Mozilla/5.0 (Linux; U; Android 4.3; en-US; SHV-E250S Build/JSS15J) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.5.0.575 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 04:45:32'),
(25404, 5, '37.228.108.17', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) OPiOS/10.1.1.92212 Mobile/11B554a Safari/9537.53', '', '', '', '', '', '', '2015-05-21 04:49:51'),
(25405, 4, '171.255.140.67', 'Mozilla/5.0 (Linux; U; Android 4.2.2; en-US; SM-T111 Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.2.0.535 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 04:57:57'),
(25406, 5, '42.118.127.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D257 Safari/9537.53', '', '', '', '', '', '', '2015-05-21 05:06:51'),
(25407, 5, '168.235.198.213', 'Mozilla/5.0 (Linux; U; Android 4.1.2; en-US; GT-I8552 Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.5.0.575 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 05:12:57'),
(25408, 5, '203.205.40.146', 'Mozilla/5.0 (Windows Phone 8.1; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 630) like Gecko', '', '', '', '', '', '', '2015-05-21 05:18:21'),
(25409, 5, '113.185.6.79', 'Mozilla/5.0 (Linux; U; Android 4.3; en-us; NokiaX2DS Build/JLS36C) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.7.5.418 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-21 05:20:21'),
(25410, 5, '27.67.46.127', 'Mozilla/5.0 (Linux; U; Android 2.3.6; vi-vn; GT-I9100 Build/GINGERBREAD) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-21 05:27:56'),
(25411, 5, '168.63.200.167', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; Microsoft; Lumia 535 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-21 05:30:23'),
(25412, 5, '27.67.20.193', 'Mozilla/5.0 (Linux; U; Android 4.4.4; en-US; C6903 Build/14.4.A.0.157) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.4.1.565 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 05:33:58'),
(25413, 4, '113.169.103.164', 'Mozilla/5.0 (Windows NT 5.1; rv:9.0) Gecko/20100101 Firefox/9.0', '', '', '', '', '', '', '2015-05-21 05:35:04'),
(25414, 4, '1.53.192.70', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/42.0 CoRom/36.0.1985.149 Chrome/36.0.1985.149 Safari/537.36', '', '', '', '', '', '', '2015-05-21 05:41:21'),
(25415, 5, '119.15.191.56', 'Mozilla/5.0 (Linux; U; Android 4.2.1; zh-CN; P2 Build/JOP40D) AppleWebKit/534.31 (KHTML, like Gecko) UCBrowser/9.1.0.297 U3/0.8.0 Mobile Safari/534.31', '', '', '', '', '', '', '2015-05-21 06:03:40'),
(25416, 4, '116.102.129.118', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', '', '', '', '', '', '', '2015-05-21 06:04:43'),
(25417, 5, '123.27.19.30', 'Mozilla/5.0 (Linux; Android 4.2.2; C2305 Build/16.0.B.2.16) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.94 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-21 06:04:45'),
(25418, 4, '123.20.99.14', 'Mozilla/5.0 (Linux; Android 5.1.1; Nexus 7 Build/LMY47V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.111 Safari/537.36', '', '', '', '', '', '', '2015-05-21 06:06:06'),
(25419, 4, '123.19.118.200', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '', '', '', '', '', '', '2015-05-21 06:14:30'),
(25420, 5, '117.0.234.171', 'Mozilla/5.0 (Linux; Android 4.4.4; SM-A500H Build/KTU84P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.111 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-21 06:24:11'),
(25421, 4, '113.181.26.13', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/47.0 Chrome/41.0.2272.127_coc_coc Safari/537.36', '', '', '', '', '', '', '2015-05-21 06:45:08'),
(25422, 5, '168.63.139.43', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; Microsoft; Lumia 535 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-21 06:47:22'),
(25423, 5, '113.187.16.123', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; Microsoft; Lumia 535 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-21 06:47:24'),
(25424, 5, '168.63.200.167', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; Microsoft; Lumia 535 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-21 06:50:30'),
(25425, 5, '113.22.114.216', 'Mozilla/5.0 (Linux; U; Android 4.2.2; zh-CN; SC-04E Build/JDQ39) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.6.1.401 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-21 06:51:45'),
(25426, 5, '27.77.67.208', 'Mozilla/5.0 (Linux; U; Android 4.2.2; zh-CN; Lenovo A680_ROW Build/JDQ39) AppleWebKit/534.31 (KHTML, like Gecko) UCBrowser/9.1.0.297 U3/0.8.0 Mobile Safari/534.31', '', '', '', '', '', '', '2015-05-21 07:00:08'),
(25427, 4, '113.167.62.240', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/47.0 Chrome/41.0.2272.119_coc_coc Safari/537.36', '', '', '', '', '', '', '2015-05-21 07:01:57'),
(25428, 4, '123.18.155.114', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/47.0 Chrome/41.0.2272.127_coc_coc Safari/537.36', '', '', '', '', '', '', '2015-05-21 07:03:33'),
(25429, 4, '113.190.12.81', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', '', '', '', '', '', '', '2015-05-21 07:07:42'),
(25430, 5, '117.0.12.205', 'Mozilla/5.0 (Linux; Android 4.4.2; SM-N900 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.111 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-21 07:12:07'),
(25431, 5, '27.67.42.242', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) CriOS/40.0.2214.73 Mobile/11D257 Safari/9537.53', '', '', '', '', '', '', '2015-05-21 07:13:11'),
(25432, 5, '113.187.17.101', 'Mozilla/5.0 (Linux; Android 4.4.2; SM-G355H Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.109 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-21 07:15:47'),
(25433, 5, '171.255.175.107', 'Mozilla/5.0 (Linux; U; Android 4.4.4; en-US; SM-G530H Build/KTU84P) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.4.1.565 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 07:26:58'),
(25434, 5, '113.189.245.49', 'Mozilla/5.0 (Linux; U; Android 4.3; vi-vn; HUAWEI G6-U10 Build/HuaweiG6-U10) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 07:31:14'),
(25435, 5, '58.186.166.239', 'Mozilla/5.0 (iPhone; CPU iPhone OS 5_1_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9B208 Safari/7534.48.3', '', '', '', '', '', '', '2015-05-21 07:34:44'),
(25436, 5, '168.235.195.70', 'Mozilla/5.0 (Linux; U; Android 4.0.4; en-us ; Lenovo A390_ROW Build/IMM76I) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1/UCBrowser/8.5.3.246/145/33482', '', '', '', '', '', '', '2015-05-21 07:35:12'),
(25437, 4, '123.18.155.114', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/47.0 Chrome/41.0.2272.127_coc_coc Safari/537.36', '', '', '', '', '', '', '2015-05-21 07:39:31'),
(25438, 4, '123.16.209.10', 'Mozilla/5.0 (iPad; CPU OS 5_0_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A405 Safari/7534.48.3', '', '', '', '', '', '', '2015-05-21 07:45:08'),
(25439, 4, '14.171.178.137', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/47.0 Chrome/41.0.2272.107_coc_coc Safari/537.36', '', '', '', '', '', '', '2015-05-21 07:51:17'),
(25440, 5, '27.66.128.202', 'Mozilla/5.0 (Linux; U; Android 4.3; en-US; ASUS_T00I Build/JSS15Q) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/9.9.4.484 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 08:01:46'),
(25441, 5, '113.161.160.176', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; HTC; Windows Phone 8X by HTC)', '', '', '', '', '', '', '2015-05-21 08:03:13'),
(25442, 5, '1.53.209.244', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 520)', '', '', '', '', '', '', '2015-05-21 08:06:59'),
(25443, 5, '58.187.147.13', 'Mozilla/5.0 (Linux; U; Android 4.2.2; en-US; P4 Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.5.0.575 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 08:08:23'),
(25444, 5, '168.235.194.45', 'Mozilla/5.0 (Linux; U; Android 4.2.2; en-US; P4 Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.5.0.575 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 08:08:41'),
(25445, 5, '42.114.43.221', 'Mozilla/5.0 (Linux; Android 4.4.4; C6802 Build/14.4.A.0.108) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/33.0.0.0 Mobile Safari/537.36 Mobile UCBrowser/3.3.1.469', '', '', '', '', '', '', '2015-05-21 08:23:23'),
(25446, 5, '27.72.183.100', 'Mozilla/5.0 (Linux; U; Android 4.3; en-US; X9006 Build/JLS36C) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.4.1.565 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 08:37:42'),
(25447, 5, '168.235.196.45', 'Mozilla/5.0 (Linux; U; Android 4.3; en-US; X9006 Build/JLS36C) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.4.1.565 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 08:39:06'),
(25448, 5, '171.253.35.101', 'Mozilla/5.0 (SymbianOS/9.4; Series60/5.0 NokiaX6-00/40.0.002; Profile/MIDP-2.1 Configuration/CLDC-1.1 ) AppleWebKit/533.4 (KHTML, like Gecko) NokiaBrowser/7.3.1.33 Mobile Safari/533.4 3gpp-gba', '', '', '', '', '', '', '2015-05-21 08:40:21'),
(25449, 5, '118.69.66.119', 'Mozilla/5.0 (Linux; U; Android 4.3; en-US; D5322 Build/19.0.D.0.253) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.1.0.527 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 08:56:10'),
(25450, 5, '168.235.198.213', 'Mozilla/5.0 (Linux; U; Android 4.3; en-US; D5322 Build/19.0.D.0.253) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.1.0.527 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 08:56:20'),
(25451, 5, '171.224.147.72', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 625H) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-21 08:59:07'),
(25452, 5, '112.197.32.209', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 720)', '', '', '', '', '', '', '2015-05-21 09:15:00'),
(25453, 5, '104.34.34.92', 'Mozilla/5.0 (Linux; U; Android 4.3; en-us; SAMSUNG-SGH-I747 Build/JSS15J) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 09:36:19'),
(25454, 5, '123.30.165.32', 'Mozilla/5.0 (Linux; Android 4.2.2; GT-I9152 Build/JDQ39) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.117 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-21 09:38:55'),
(25455, 5, '42.112.251.133', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 630 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-21 10:13:44'),
(25456, 5, '113.20.116.69', 'Mozilla/5.0 (Linux; Android 4.4.3; HTC One Build/KTU84L) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.111 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-21 10:22:10'),
(25457, 4, '123.24.41.82', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/47.0 Chrome/41.0.2272.119_coc_coc Safari/537.36', '', '', '', '', '', '', '2015-05-21 10:29:59'),
(25458, 5, '123.18.162.13', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 520) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-21 10:34:37'),
(25459, 4, '113.185.5.141', 'Mozilla/5.0 (Linux; U; Android 4.2.2; vi-vn; Lenovo A3000-H Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30 Mobile UCBrowser/3.4.2.525', '', '', '', '', '', '', '2015-05-21 11:07:09'),
(25460, 5, '27.67.16.219', 'Mozilla/5.0 (Linux; U; Android 4.1.1; en-US; S32 Build/JRO03C) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/9.9.4.484 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 15:54:54'),
(25461, 4, '113.165.4.59', 'Mozilla/5.0 (iPad; CPU OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53', '', '', '', '', '', '', '2015-05-21 16:19:20'),
(25462, 5, '123.26.86.118', 'Mozilla/5.0 (Linux; U; Android 4.2.1; en-US; GT-I9100 Build/JOP40D) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.2.0.535 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 16:20:18'),
(25463, 5, '171.233.128.235', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; Microsoft; Lumia 535 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-21 16:37:26'),
(25464, 5, '113.174.35.134', 'Mozilla/5.0 (Linux; U; Android 4.1.2; en-US; GT-I8552 Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.0.0.488 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 16:52:33'),
(25465, 4, '123.27.48.158', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/46.0 Chrome/40.0.2214.113_coc_coc Safari/537.36', '', '', '', '', '', '', '2015-05-21 16:59:56'),
(25466, 5, '101.14.26.125', 'Mozilla/5.0 (Linux; U; Android 4.1.2; vi-vn; Nokia_XL Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30 UCBrowser/3.2.0.417', '', '', '', '', '', '', '2015-05-21 17:13:12'),
(25467, 5, '171.224.62.131', 'Mozilla/5.0 (Linux; U; Android 4.4.2; vi; G5 Build/KOT49H) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.7.5.418 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-21 17:21:01'),
(25468, 5, '113.174.35.134', 'Mozilla/5.0 (Linux; U; Android 4.1.2; en-US; GT-I8552 Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.0.0.488 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 17:45:32'),
(25469, 5, '27.67.46.127', 'Mozilla/5.0 (Linux; U; Android 2.3.6; vi-vn; GT-I9100 Build/GINGERBREAD) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-21 17:46:16'),
(25470, 4, '1.200.9.150', 'Mozilla/5.0 (Linux; U; Android 4.1.2; en-US; SM-T211 Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.1.0.527 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 18:02:19'),
(25471, 5, '113.174.255.70', 'Mozilla/5.0 (Linux; U; Android 4.2.2; en-US; V8507 Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/9.9.6.495 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 18:31:09'),
(25472, 5, '117.3.100.131', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 520) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-21 18:34:02'),
(25473, 4, '27.74.132.29', 'Mozilla/5.0 (Linux; Android 4.4.2; A1-830 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.102 Safari/537.36', '', '', '', '', '', '', '2015-05-21 18:47:47'),
(25474, 5, '27.74.212.164', 'Mozilla/5.0 (Linux; Android 4.4.2; D6503 Build/17.1.2.A.0.314) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.111 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-21 18:49:07'),
(25475, 5, '14.174.34.214', 'Mozilla/5.0 (Linux; Android 4.1.2; Nokia_XL Build/JZO54K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.82 Mobile Safari/537.36 NokiaBrowser/1.2.0.12', '', '', '', '', '', '', '2015-05-21 19:11:47'),
(25476, 5, '14.163.155.120', 'Mozilla/5.0 (Linux; U; Android 4.2.2; en-US; Pioneer_P2S Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.3.0.552 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 19:28:38'),
(25477, 5, '168.63.139.43', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; Microsoft; Lumia 535 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-21 19:32:30'),
(25478, 4, '14.174.90.149', 'Mozilla/5.0 (Windows NT 5.1; rv:36.0) Gecko/20100101 Firefox/36.0', '', '', '', '', '', '', '2015-05-21 19:33:31'),
(25479, 5, '27.77.134.253', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 730 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-21 19:51:57'),
(25480, 5, '113.166.18.86', 'Mozilla/5.0 (Linux; U; Android 4.3; en-us; NokiaX2DS Build/JLS36C) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.7.5.418 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-21 19:54:46'),
(25481, 4, '14.169.62.158', 'Mozilla/5.0 (Windows NT 6.1; rv:5.0.1) Gecko/20100101 Firefox/5.0.1', '', '', '', '', '', '', '2015-05-21 19:56:18'),
(25482, 4, '123.20.128.11', 'Mozilla/5.0 (Windows NT 5.1; rv:19.0) Gecko/20100101 Firefox/19.0', '', '', '', '', '', '', '2015-05-21 20:07:08'),
(25483, 4, '14.174.90.149', 'Mozilla/5.0 (Windows NT 5.1; rv:36.0) Gecko/20100101 Firefox/36.0', '', '', '', '', '', '', '2015-05-21 20:08:42'),
(25484, 5, '222.254.74.217', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_1 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D201 Safari/9537.53', '', '', '', '', '', '', '2015-05-21 20:28:40'),
(25485, 5, '222.253.136.52', 'Mozilla/5.0 (SymbianOS/9.4; Series60/5.0 NokiaC5-06/23.6.015; Profile/MIDP-2.1 Configuration/CLDC-1.1 ) AppleWebKit/533.4 (KHTML, like Gecko) NokiaBrowser/7.3.1.33 Mobile Safari/533.4 3gpp-gba', '', '', '', '', '', '', '2015-05-21 20:32:10'),
(25486, 5, '168.63.139.43', 'Mozilla/5.0 (Windows Phone 8.1; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 630) like Gecko', '', '', '', '', '', '', '2015-05-21 20:38:38'),
(25487, 5, '14.174.34.214', 'Mozilla/5.0 (Linux; Android 4.1.2; Nokia_XL Build/JZO54K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.82 Mobile Safari/537.36 NokiaBrowser/1.2.0.12', '', '', '', '', '', '', '2015-05-21 20:41:03'),
(25488, 5, '14.172.103.130', 'Mozilla/5.0 (Linux; U; Android 4.0.4; vi; GT-S7560 Build/IMM76I) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.8.0.435 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-21 20:42:01'),
(25489, 5, '80.251.112.204', 'Mozilla/5.0 (Linux; Android 4.4.2; RioPlay Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-21 21:06:14'),
(25490, 5, '116.111.208.101', 'Mozilla/5.0 (Linux; U; Android 4.2.1; zh-CN; E6 Build/JOP40D) AppleWebKit/534.31 (KHTML, like Gecko) UCBrowser/9.1.0.297 U3/0.8.0 Mobile Safari/534.31', '', '', '', '', '', '', '2015-05-21 21:06:33'),
(25491, 5, '113.175.57.43', 'Mozilla/5.0 (Linux; U; Android 4.1.2; en-US; Nokia_X Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.4.1.565 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 21:14:39'),
(25492, 5, '113.185.5.231', 'Mozilla/5.0 (SymbianOS/9.3; Series60/3.2 NokiaE72-1/091.003; Profile/MIDP-2.1 Configuration/CLDC-1.1 ) AppleWebKit/533.4 (KHTML, like Gecko) NokiaBrowser/7.3.1.34 Mobile Safari/533.4 3gpp-gba', '', '', '', '', '', '', '2015-05-21 21:21:59'),
(25493, 5, '180.93.171.242', 'Mozilla/5.0 (Linux; Android 4.1.2; GT-I9300 Build/JZO54K) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19', '', '', '', '', '', '', '2015-05-21 21:31:00'),
(25494, 5, '113.187.4.174', 'Mozilla/5.0 (Linux; U; Android 4.2.2; zh-CN; Lenovo A316i Build/JDQ39) AppleWebKit/534.31 (KHTML, like Gecko) UCBrowser/9.1.0.297 U3/0.8.0 Mobile Safari/534.31', '', '', '', '', '', '', '2015-05-21 21:39:50'),
(25495, 5, '118.169.34.36', 'Mozilla/5.0 (Linux; U; Android 4.1.2; vi-vn; Nokia_XL Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30 UCBrowser/3.2.0.417', '', '', '', '', '', '', '2015-05-21 21:40:23'),
(25496, 5, '203.144.92.83', 'Mozilla/5.0 (Linux; Android 5.0.1; GT-I9500 Build/LRX22C) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Mobile Safari/537.36 Mobile UCBrowser/3.4.3.532', '', '', '', '', '', '', '2015-05-21 21:50:30'),
(25497, 5, '27.67.33.87', 'Mozilla/5.0 (Linux; Android 4.2.2; R831K Build/JDQ39) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.94 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-21 21:52:08'),
(25498, 5, '27.67.1.211', 'Mozilla/5.0 (Linux; U; Android 4.3; en-US; NokiaX2DS Build/JLS36C) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.1.0.527 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 21:55:44'),
(25499, 5, '168.235.194.105', 'Mozilla/5.0 (Linux; U; Android 4.3; en-US; NokiaX2DS Build/JLS36C) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.1.0.527 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 21:57:14'),
(25500, 5, '42.117.116.111', 'Mozilla/5.0 (Windows Phone 8.1; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 630) like Gecko', '', '', '', '', '', '', '2015-05-21 21:57:43'),
(25501, 4, '113.165.150.114', 'Mozilla/5.0 (iPad; CPU OS 7_1 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D167 Safari/9537.53', '', '', '', '', '', '', '2015-05-21 22:00:52'),
(25502, 5, '115.78.0.122', 'Mozilla/5.0 (Linux; U; Android 2.3.5; vi-vn; Dell V04B Build/GRJ90) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-21 22:06:46');
INSERT INTO `views` (`id`, `website_id`, `ip_address`, `user_agent`, `city`, `region`, `country`, `lat`, `long`, `org`, `view_at`) VALUES
(25503, 5, '116.106.6.21', 'Mozilla/5.0 (Linux; U; Android 2.3.5; vi-vn; Dell V04B Build/GRJ90) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-21 22:09:36'),
(25504, 5, '37.228.105.78', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_2 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) OPiOS/10.1.0.92032 Mobile/12D508 Safari/9537.53', '', '', '', '', '', '', '2015-05-21 22:10:55'),
(25505, 5, '113.179.239.216', 'Mozilla/5.0 (SymbianOS/9.3; Series60/3.2 NokiaE72-1/071.004; Profile/MIDP-2.1 Configuration/CLDC-1.1 ) AppleWebKit/533.4 (KHTML, like Gecko) NokiaBrowser/7.3.1.26 Mobile Safari/533.4 3gpp-gba', '', '', '', '', '', '', '2015-05-21 22:19:23'),
(25506, 5, '113.185.6.99', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 520) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-21 22:20:36'),
(25507, 5, '117.0.208.203', 'Mozilla/5.0 (Linux; U; Android 4.2.2; zh-CN; Lenovo A859 Build/JDQ39) AppleWebKit/534.31 (KHTML, like Gecko) UCBrowser/9.2.0.383 U3/0.8.0 Mobile Safari/534.31', '', '', '', '', '', '', '2015-05-21 22:33:52'),
(25508, 5, '27.67.44.55', 'Mozilla/5.0 (Linux; Android 4.2.2; R1001 Build/JDQ39) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.94 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-21 22:37:08'),
(25509, 4, '113.190.12.81', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', '', '', '', '', '', '', '2015-05-21 22:42:48'),
(25510, 5, '116.106.6.21', 'Mozilla/5.0 (Linux; U; Android 2.3.5; vi-vn; Dell V04B Build/GRJ90) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-21 22:47:43'),
(25511, 4, '118.69.64.122', 'Mozilla/5.0 (Linux; Android 4.4.2; Lenovo A3500-HV Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/30.0.0.0 Safari/537.36 UCBrowser/3.1.0.403', '', '', '', '', '', '', '2015-05-21 22:51:44'),
(25512, 5, '113.187.4.77', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B554a Safari/9537.53', '', '', '', '', '', '', '2015-05-21 22:54:50'),
(25513, 4, '113.165.150.114', 'Mozilla/5.0 (iPad; CPU OS 7_1 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D167 Safari/9537.53', '', '', '', '', '', '', '2015-05-21 22:56:17'),
(25514, 5, '203.205.51.227', 'Mozilla/5.0 (Windows Phone 8.1; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 630) like Gecko', '', '', '', '', '', '', '2015-05-21 23:00:26'),
(25515, 5, '113.171.190.112', 'Mozilla/5.0 (Linux; U; Android 4.3; vi-vn; HUAWEI G6-U10 Build/HuaweiG6-U10) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 23:04:30'),
(25516, 5, '123.19.179.25', 'Mozilla/5.0 (SymbianOS/9.4; Series60/5.0 NokiaC6-00/42.0.004; Profile/MIDP-2.1 Configuration/CLDC-1.1) AppleWebKit/533.4 (KHTML, like Gecko) NokiaBrowser/7.3.1.33 3gpp-gba', '', '', '', '', '', '', '2015-05-21 23:06:18'),
(25517, 4, '222.253.229.161', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/42.0 CoRom/36.0.1985.149 Chrome/36.0.1985.149 Safari/537.36', '', '', '', '', '', '', '2015-05-21 23:13:01'),
(25518, 4, '27.70.79.39', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '', '', '', '', '', '', '2015-05-21 23:17:07'),
(25519, 5, '113.175.130.51', 'Mozilla/5.0 (Linux; U; Android 4.3; en-us; NokiaX2DS Build/JLS36C) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.7.5.418 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-21 23:19:27'),
(25520, 4, '113.190.12.81', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', '', '', '', '', '', '', '2015-05-21 23:20:47'),
(25521, 5, '113.187.4.174', 'Mozilla/5.0 (Linux; U; Android 4.2.2; zh-CN; Lenovo A316i Build/JDQ39) AppleWebKit/534.31 (KHTML, like Gecko) UCBrowser/9.1.0.297 U3/0.8.0 Mobile Safari/534.31', '', '', '', '', '', '', '2015-05-21 23:24:16'),
(25522, 5, '113.185.5.179', 'Mozilla/5.0 (Linux; Android 4.1.2; LG-E435 Build/JZO54K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.170 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-21 23:27:11'),
(25523, 5, '113.185.5.158', 'Mozilla/5.0 (Linux; U; Android 4.1.2; vi-vi; LG-F220K/10c Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-21 23:29:59'),
(25524, 5, '171.254.30.183', 'Mozilla/5.0 (Linux; U; Android 4.2.2; en-us; U3A Build/JDQ39) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.8.0.435 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-21 23:35:25'),
(25525, 4, '116.105.164.13', 'Mozilla/5.0 (Linux; Android 4.2.2; SM-T111 Build/JDQ39) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.111 Safari/537.36', '', '', '', '', '', '', '2015-05-21 23:39:37'),
(25526, 5, '113.187.17.101', 'Mozilla/5.0 (Linux; U; Android 4.2.2; zh-CN; Lenovo A526 Build/JDQ39) AppleWebKit/534.31 (KHTML, like Gecko) UCBrowser/9.2.0.308 U3/0.8.0 Mobile Safari/534.31', '', '', '', '', '', '', '2015-05-21 23:43:23'),
(25527, 4, '113.188.160.209', 'Mozilla/5.0 (iPad; U; CPU OS 5_0_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B334b Safari/531.21.10', '', '', '', '', '', '', '2015-05-21 23:48:01'),
(25528, 5, '183.182.126.112', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 630 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-21 23:57:52'),
(25529, 5, '113.185.5.158', 'Mozilla/5.0 (Linux; U; Android 4.1.2; vi-vi; LG-F220K/10c Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 00:14:52'),
(25530, 4, '118.68.92.187', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/45.0 Chrome/39.0.2171.103 Safari/537.36', '', '', '', '', '', '', '2015-05-22 00:17:42'),
(25531, 5, '113.187.4.105', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 520) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-22 00:18:04'),
(25532, 5, '168.63.137.102', 'Mozilla/5.0 (Windows Phone 8.1; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 530 Dual SIM) like Gecko', '', '', '', '', '', '', '2015-05-22 00:27:53'),
(25533, 5, '113.185.7.109', 'Mozilla/5.0 (Windows Phone 8.1; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 530 Dual SIM) like Gecko', '', '', '', '', '', '', '2015-05-22 00:28:14'),
(25534, 4, '117.6.95.57', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '', '', '', '', '', '', '2015-05-22 00:29:34'),
(25535, 4, '113.168.75.230', 'Mozilla/5.0 (Windows NT 5.1; rv:36.0) Gecko/20100101 Firefox/36.0', '', '', '', '', '', '', '2015-05-22 00:43:33'),
(25536, 5, '113.185.5.158', 'Mozilla/5.0 (Linux; U; Android 4.1.2; vi-vi; LG-F220K/10c Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 00:59:46'),
(25537, 5, '171.224.206.39', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 630 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-22 01:01:32'),
(25538, 5, '27.67.20.239', 'Mozilla/5.0 (Linux; U; Android 4.3; en-us; NokiaX2DS Build/JLS36C) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.7.5.418 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-22 01:14:28'),
(25539, 5, '14.176.93.109', 'Mozilla/5.0 (Linux; U; Android 4.3; en-US; X9076 Build/JLS36C) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.4.1.565 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 01:15:14'),
(25540, 4, '123.18.252.166', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', '', '', '', '', '', '', '2015-05-22 01:16:46'),
(25541, 5, '42.117.18.37', 'Mozilla/5.0 (Linux; U; Android 2.3.6; en-US; GT-I8160 Build/GINGERBREAD) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/9.9.6.495 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 01:18:12'),
(25542, 4, '42.112.66.194', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/47.0 Chrome/41.0.2272.127_coc_coc Safari/537.36', '', '', '', '', '', '', '2015-05-22 01:22:29'),
(25543, 4, '42.112.66.97', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/42.0 CoRom/36.0.1985.147 Chrome/36.0.1985.147 Safari/537.36', '', '', '', '', '', '', '2015-05-22 01:27:18'),
(25544, 5, '113.189.0.34', 'Mozilla/5.0 (Linux; U; Android 2.3.7; en-US; ST27i Build/6.0.B.3.184) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.4.1.565 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 01:44:40'),
(25545, 4, '14.165.79.242', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET4.0C; .NET4.0E)', '', '', '', '', '', '', '2015-05-22 01:48:41'),
(25546, 4, '115.78.94.22', 'Mozilla/5.0 (Windows NT 5.1; rv:31.0) Gecko/20100101 Firefox/31.0', '', '', '', '', '', '', '2015-05-22 01:49:48'),
(25547, 4, '117.6.213.158', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/47.0 Chrome/41.0.2272.127_coc_coc Safari/537.36', '', '', '', '', '', '', '2015-05-22 01:53:48'),
(25548, 4, '118.68.92.187', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/45.0 Chrome/39.0.2171.103 Safari/537.36', '', '', '', '', '', '', '2015-05-22 01:58:12'),
(25549, 5, '1.53.215.164', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 630 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-22 02:00:01'),
(25550, 4, '113.175.40.52', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '', '', '', '', '', '', '2015-05-22 02:06:41'),
(25551, 5, '93.106.166.219', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 630) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-22 02:11:14'),
(25552, 4, '113.162.189.162', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '', '', '', '', '', '', '2015-05-22 02:18:22'),
(25553, 5, '222.119.143.209', 'Mozilla/5.0 (Linux; U; Android 4.3; en-US; SHV-E250S Build/JSS15J) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.5.0.575 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 02:26:43'),
(25554, 4, '113.20.116.57', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.155 CoRom/35.0.1916.155 Safari/537.36', '', '', '', '', '', '', '2015-05-22 02:33:02'),
(25555, 5, '123.19.114.215', 'Mozilla/5.0 (Linux; U; Android 4.1.2; en-us; Nokia_XL Build/JZO54K) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.7.5.418 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-22 02:35:52'),
(25556, 5, '123.27.18.209', 'Mozilla/5.0 (Linux; Android 4.2.2; C2305 Build/16.0.B.2.16) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.94 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-22 02:40:46'),
(25557, 4, '14.172.125.161', 'Mozilla/5.0 (Windows NT 5.1; rv:9.0) Gecko/20100101 Firefox/9.0', '', '', '', '', '', '', '2015-05-22 02:48:29'),
(25558, 5, '113.187.4.105', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 520) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-22 03:08:16'),
(25559, 5, '66.249.82.174', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) CriOS/42.0.2311.47 Mobile/12F70 Safari/600.1.4', '', '', '', '', '', '', '2015-05-22 03:09:47'),
(25560, 5, '27.67.27.138', 'Mozilla/5.0 (Linux; U; Android 4.1.2; en-us; Nokia_XL Build/JZO54K) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.7.5.418 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-22 03:14:40'),
(25561, 5, '113.187.4.113', 'Mozilla/5.0 (Linux; U; Android 4.2.2; zh-CN; Lenovo A316i Build/JDQ39) AppleWebKit/534.31 (KHTML, like Gecko) UCBrowser/9.1.0.297 U3/0.8.0 Mobile Safari/534.31', '', '', '', '', '', '', '2015-05-22 03:30:48'),
(25562, 5, '14.177.126.191', 'Mozilla/5.0 (Linux; U; Android 4.4.4; en-US; C6903 Build/14.4.A.0.157) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.5.0.575 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 03:37:04'),
(25563, 5, '27.72.140.145', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 525) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-22 03:40:40'),
(25564, 5, '42.118.197.213', 'Mozilla/5.0 (Linux; U; Android 4.2.2; zh-CN; Pioneer_P3 Build/JDQ39) AppleWebKit/534.31 (KHTML, like Gecko) UCBrowser/9.1.0.297 U3/0.8.0 Mobile Safari/534.31', '', '', '', '', '', '', '2015-05-22 03:44:33'),
(25565, 5, '14.172.103.130', 'Mozilla/5.0 (Linux; U; Android 4.0.4; vi; GT-S7560 Build/IMM76I) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.8.0.435 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-22 03:51:53'),
(25566, 5, '113.188.186.85', 'Mozilla/5.0 (Linux; Android 4.2.2; R831K Build/JDQ39) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.94 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-22 03:55:12'),
(25567, 5, '113.188.186.85', 'Mozilla/5.0 (Linux; Android 4.2.2; R831K Build/JDQ39) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.94 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-22 03:55:12'),
(25568, 4, '14.169.201.40', 'Mozilla/5.0 (Linux; Android 4.4.2; en-gb; SAMSUNG SM-T230NU Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Version/1.5 Chrome/28.0.1500.94 Safari/537.36', '', '', '', '', '', '', '2015-05-22 04:09:44'),
(25569, 5, '113.185.5.124', 'Mozilla/5.0 (Linux; U; Android 4.1.2; en-us; Nokia_XL Build/JZO54K) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.7.5.418 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-22 04:17:42'),
(25570, 5, '168.63.200.167', 'Mozilla/5.0 (Windows Phone 8.1; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 520; Vodafone) like Gecko', '', '', '', '', '', '', '2015-05-22 04:29:02'),
(25571, 5, '1.52.39.212', 'Mozilla/5.0 (Linux; U; Android 4.3; en-us; NokiaX2DS Build/JLS36C) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.7.5.418 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-22 04:37:07'),
(25572, 5, '123.17.104.162', 'Mozilla/5.0 (Linux; U; Android 4.3; vi-vn; HUAWEI G6-U10 Build/HuaweiG6-U10) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 05:04:57'),
(25573, 4, '14.173.75.32', 'Mozilla/5.0 (iPad; CPU OS 7_1_1 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) CriOS/37.0.2062.60 Mobile/11D201 Safari/9537.53', '', '', '', '', '', '', '2015-05-22 05:13:11'),
(25574, 5, '168.235.194.162', 'Mozilla/5.0 (Linux; U; Android 4.4.4; en-US; SM-G850S Build/KTU84P) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.4.1.565 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 05:34:34'),
(25575, 4, '14.174.31.21', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/47.0 Chrome/41.0.2272.127_coc_coc Safari/537.36', '', '', '', '', '', '', '2015-05-22 05:40:16'),
(25576, 5, '113.187.22.25', 'Mozilla/5.0 (Linux; U; Android 4.4.2; en-US; Philips_I928 Build/KOT49H) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.3.0.552 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 05:56:04'),
(25577, 5, '171.255.149.127', 'Mozilla/5.0 (Linux; U; Android 4.4; en-US; mobiistar LAI 504c Build/mobiistar) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.4.1.565 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 06:00:50'),
(25578, 5, '27.67.35.163', 'Mozilla/5.0 (Linux; Android 4.4.2; D2502 Build/19.2.A.0.391) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-22 06:01:14'),
(25579, 5, '1.52.64.93', 'Mozilla/5.0 (Linux; U; Android 4.4.2; vi; Lenovo P780 Build/KOT49H) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.4.1.362 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-22 06:07:35'),
(25580, 5, '113.185.5.181', 'UCWEB/2.0 (Linux; U; Adr 4.2.2; vi; Lenovo A516) U2/1.0.0 UCBrowser/9.1.0.297 U2/1.0.0 Mobile', '', '', '', '', '', '', '2015-05-22 06:24:52'),
(25581, 5, '113.185.7.47', 'Mozilla/5.0 (Linux; U; Android 4.4.2; vi; LG-F180K Build/KOT49I.F180K30b) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/9.9.2.467 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 06:29:16'),
(25582, 4, '113.166.228.199', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/47.0 Chrome/41.0.2272.127_coc_coc Safari/537.36', '', '', '', '', '', '', '2015-05-22 06:30:56'),
(25583, 5, '116.101.66.70', 'Mozilla/5.0 (Linux; U; Android 4.2.2; vi-vn; V8505 Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 06:37:53'),
(25584, 5, '1.52.60.41', 'Mozilla/5.0 (Linux; U; Android 4.1.2; vi; IM-A840S Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/9.9.2.467 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 06:39:30'),
(25585, 5, '70.39.185.208', 'Mozilla/5.0 (Linux; U; Android 4.1.2; vi; IM-A840S Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/9.9.2.467 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 06:40:02'),
(25586, 5, '123.21.249.138', 'Mozilla/5.0 (Linux; Android 4.4.2; D2305 Build/18.3.A.0.31) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.111 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-22 06:50:12'),
(25587, 5, '113.187.4.113', 'Mozilla/5.0 (Linux; U; Android 4.2.2; zh-CN; Lenovo A316i Build/JDQ39) AppleWebKit/534.31 (KHTML, like Gecko) UCBrowser/9.1.0.297 U3/0.8.0 Mobile Safari/534.31', '', '', '', '', '', '', '2015-05-22 06:52:42'),
(25588, 4, '113.166.228.199', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/47.0 Chrome/41.0.2272.127_coc_coc Safari/537.36', '', '', '', '', '', '', '2015-05-22 07:05:10'),
(25589, 5, '42.113.159.206', 'Mozilla/5.0 (Linux; U; Android 4.2.2; en-US; V8508 Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.3.0.552 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 07:08:11'),
(25590, 5, '113.172.195.164', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B554a Safari/9537.53', '', '', '', '', '', '', '2015-05-22 07:17:29'),
(25591, 5, '123.23.64.80', 'Mozilla/5.0 (Linux; U; Android 4.4.2; en-US; D2305 Build/18.3.A.0.31) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.4.1.565 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 07:25:12'),
(25592, 5, '118.70.89.79', 'Mozilla/5.0 (Linux; U; Android 4.1.2; en-us; Nokia_X Build/JZO54K) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.7.5.418 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-22 07:29:22'),
(25593, 5, '118.69.178.110', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 520) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-22 07:31:54'),
(25594, 4, '113.166.228.199', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/47.0 Chrome/41.0.2272.127_coc_coc Safari/537.36', '', '', '', '', '', '', '2015-05-22 07:38:22'),
(25595, 5, '27.74.64.81', 'Mozilla/5.0 (Symbian/3; Series60/5.2 NokiaN8-00/025.007; Profile/MIDP-2.1 Configuration/CLDC-1.1 ) AppleWebKit/533.4 (KHTML, like Gecko) NokiaBrowser/7.3.1.37 Mobile Safari/533.4 3gpp-gba', '', '', '', '', '', '', '2015-05-22 07:54:40'),
(25596, 5, '123.18.163.108', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 520) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-22 08:03:15'),
(25597, 4, '14.170.239.105', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/47.0 Chrome/41.0.2272.107_coc_coc Safari/537.36', '', '', '', '', '', '', '2015-05-22 08:15:36'),
(25598, 5, '183.182.116.248', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 520) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-22 08:29:12'),
(25599, 5, '113.172.140.76', 'Mozilla/5.0 (Linux; U; Android 4.4.2; vi-vn; L-01F Build/KOT49I.F320K21p) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.2 Chrome/30.0.1599.103 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-22 08:43:13'),
(25600, 5, '117.1.224.199', 'Mozilla/5.0 (Linux; U; Android 4.4.2; en-US; LG-F320L Build/KOT49I.F320L22b) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.3.0.552 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 08:48:07'),
(25601, 5, '168.235.196.133', 'Mozilla/5.0 (Linux; U; Android 4.4.2; en-US; LG-F320L Build/KOT49I.F320L22b) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.3.0.552 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 08:48:34'),
(25602, 5, '171.224.144.92', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 625H) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-22 08:53:05'),
(25603, 5, '1.52.103.109', 'Mozilla/5.0 (Linux; U; Android 4.4.2; en-US; SM-G7102 Build/KOT49H) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.4.1.565 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 08:53:35'),
(25604, 5, '42.116.169.219', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 520) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-22 09:04:24'),
(25605, 5, '171.251.83.98', 'Mozilla/5.0 (Linux; U; Android 4.2.2; vi-vn; R829 Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30 Mobile UCBrowser/3.4.1.483', '', '', '', '', '', '', '2015-05-22 10:19:46'),
(25606, 5, '171.251.83.98', 'Mozilla/5.0 (Linux; U; Android 4.2.2; vi-vn; R829 Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30 Mobile UCBrowser/3.4.1.483', '', '', '', '', '', '', '2015-05-22 11:14:04'),
(25607, 5, '113.187.17.84', 'Mozilla/5.0 (Linux; U; Android 4.2.2; vi; SHV-E310L Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/9.9.2.467 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 11:26:09'),
(25608, 5, '1.53.68.90', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 630 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-22 13:50:25'),
(25609, 5, '27.67.5.165', 'Mozilla/5.0 (Linux; Android 4.4.2; Star 550 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.93 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-22 15:30:30'),
(25610, 5, '171.253.29.12', 'Mozilla/5.0 (SymbianOS/9.4; Series60/5.0 NokiaX6-00/40.0.002; Profile/MIDP-2.1 Configuration/CLDC-1.1 ) AppleWebKit/533.4 (KHTML, like Gecko) NokiaBrowser/7.3.1.33 Mobile Safari/533.4 3gpp-gba', '', '', '', '', '', '', '2015-05-22 15:31:07'),
(25611, 5, '113.181.34.164', 'Mozilla/5.0 (Linux; U; Android 4.1.2; en-US; SHV-E120S Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.4.1.565 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 15:36:52'),
(25612, 5, '168.235.195.70', 'Mozilla/5.0 (Linux; U; Android 4.1.2; en-US; SHV-E120S Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.4.1.565 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 15:49:01'),
(25613, 5, '171.253.29.12', 'Mozilla/5.0 (SymbianOS/9.4; Series60/5.0 NokiaX6-00/40.0.002; Profile/MIDP-2.1 Configuration/CLDC-1.1 ) AppleWebKit/533.4 (KHTML, like Gecko) NokiaBrowser/7.3.1.33 Mobile Safari/533.4 3gpp-gba', '', '', '', '', '', '', '2015-05-22 16:04:59'),
(25614, 5, '113.169.8.138', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 720) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-22 16:28:26'),
(25615, 5, '113.185.7.144', 'Mozilla/5.0 (Linux; U; Android 4.2.2; vi; Pioneer_P2 Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/9.9.2.467 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 16:33:05'),
(25616, 5, '113.182.240.52', 'Mozilla/5.0 (Symbian/3; Series60/5.5 Nokia603/113.010.1506; Profile/MIDP-2.1 Configuration/CLDC-1.1 ) AppleWebKit/535.1 (KHTML, like Gecko) NokiaBrowser/8.3.2.21 Mobile Safari/535.1 3gpp-gba', '', '', '', '', '', '', '2015-05-22 16:37:13'),
(25617, 5, '171.253.9.181', 'Mozilla/5.0 (Linux; U; Android 4.1.2; en-us; Nokia_XL Build/JZO54K) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.7.5.418 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-22 16:46:24'),
(25618, 4, '27.78.8.144', 'Mozilla/5.0 (Linux; Android 4.4.2; SM-P601 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/30.0.0.0 Safari/537.36 Mobile UCBrowser/3.4.3.532', '', '', '', '', '', '', '2015-05-22 17:17:40'),
(25619, 5, '117.3.140.47', 'Mozilla/5.0 (Linux; U; Android 4.2.1; zh-CN; Gpad_G3 Build/JOP40D) AppleWebKit/534.31 (KHTML, like Gecko) UCBrowser/9.1.0.297 U3/0.8.0 Mobile Safari/534.31', '', '', '', '', '', '', '2015-05-22 17:45:36'),
(25620, 5, '116.105.108.28', 'Mozilla/5.0 (Linux; U; Android 4.2.2; vi-vn; Hero40 Build/Hero40) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 17:48:42'),
(25621, 4, '14.165.14.254', 'Mozilla/5.0 (iPad; CPU OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B554a Safari/9537.53', '', '', '', '', '', '', '2015-05-22 17:53:52'),
(25622, 4, '116.101.62.181', 'Mozilla/5.0 (iPad; CPU OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D257 Safari/9537.53', '', '', '', '', '', '', '2015-05-22 18:15:48'),
(25623, 5, '171.250.129.127', 'Mozilla/5.0 (Linux; U; Android 4.4.2; vi-vn; L-01F Build/KOT49I.F320K21p) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.2 Chrome/30.0.1599.103 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-22 20:06:23'),
(25624, 5, '168.63.139.43', 'Mozilla/5.0 (Windows Phone 8.1; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 530 Dual SIM) like Gecko', '', '', '', '', '', '', '2015-05-22 20:20:56'),
(25625, 5, '113.185.7.6', 'Mozilla/5.0 (Windows Phone 8.1; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 530 Dual SIM) like Gecko', '', '', '', '', '', '', '2015-05-22 20:20:59'),
(25626, 4, '113.168.75.230', 'Mozilla/5.0 (Windows NT 5.1; rv:36.0) Gecko/20100101 Firefox/36.0', '', '', '', '', '', '', '2015-05-22 20:22:49'),
(25627, 4, '180.93.167.142', 'Mozilla/5.0 (iPad; CPU OS 5_1_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9B206 Safari/7534.48.3', '', '', '', '', '', '', '2015-05-22 20:27:38'),
(25628, 5, '1.53.215.164', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 630 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-22 20:34:19'),
(25629, 5, '14.174.191.120', 'Mozilla/5.0 (Linux; U; Android 2.3.6; zh-CN; PIONEER_P1 Build/GRK39F) AppleWebKit/534.31 (KHTML, like Gecko) UCBrowser/9.0.2.299 U3/0.8.0 Mobile Safari/534.31', '', '', '', '', '', '', '2015-05-22 20:35:19'),
(25630, 5, '168.235.198.248', 'Mozilla/5.0 (Linux; U; Android 4.4.2; en-US; Lenovo A319 Build/MocorDroid4.4.2) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.4.1.565 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 20:40:06'),
(25631, 4, '222.253.3.105', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/47.0 Chrome/41.0.2272.127_coc_coc Safari/537.36', '', '', '', '', '', '', '2015-05-22 20:42:38'),
(25632, 5, '27.77.119.150', 'Mozilla/5.0 (Linux; U; Android 4.3.1; vi; Android Build/IML74K) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.8.0.435 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-22 20:44:53'),
(25633, 5, '14.172.103.130', 'Mozilla/5.0 (Linux; U; Android 4.0.4; vi; GT-S7560 Build/IMM76I) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.8.0.435 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-22 21:16:29'),
(25634, 5, '27.67.26.251', 'Mozilla/5.0 (Linux; Android 4.2.2; R1001 Build/JDQ39) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.94 Mobile Safari/537.36', '', '', '', '', '', '', '2015-05-22 21:34:49'),
(25635, 5, '222.253.136.52', 'Mozilla/5.0 (SymbianOS/9.4; Series60/5.0 NokiaC5-06/23.6.015; Profile/MIDP-2.1 Configuration/CLDC-1.1 ) AppleWebKit/533.4 (KHTML, like Gecko) NokiaBrowser/7.3.1.33 Mobile Safari/533.4 3gpp-gba', '', '', '', '', '', '', '2015-05-22 21:36:58'),
(25636, 5, '27.66.155.203', 'Mozilla/5.0 (Windows Phone 8.1; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 630) like Gecko', '', '', '', '', '', '', '2015-05-22 21:53:50'),
(25637, 5, '27.74.223.5', 'Mozilla/5.0 (Windows Phone 8.1; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 630) like Gecko', '', '', '', '', '', '', '2015-05-22 21:54:14'),
(25638, 5, '113.174.35.111', 'Mozilla/5.0 (Linux; U; Android 4.1.2; en-US; GT-I8552 Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.0.0.488 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-22 21:58:07'),
(25639, 4, '123.20.81.38', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.127 CoRom/36.0.1985.127 Safari/537.36', '', '', '', '', '', '', '2015-05-22 22:12:36'),
(25640, 5, '168.63.139.43', 'Mozilla/5.0 (Windows Phone 8.1; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 630) like Gecko', '', '', '', '', '', '', '2015-05-22 22:45:22'),
(25641, 5, '171.255.8.149', 'Mozilla/5.0 (Windows Phone 8.1; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 630) like Gecko', '', '', '', '', '', '', '2015-05-22 22:45:29'),
(25642, 5, '183.80.101.17', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D257 Safari/9537.53', '', '', '', '', '', '', '2015-05-22 22:46:17'),
(25643, 5, '118.69.105.146', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 520)', '', '', '', '', '', '', '2015-05-22 23:12:17'),
(25644, 5, '203.205.51.206', 'Mozilla/5.0 (Windows Phone 8.1; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 630) like Gecko', '', '', '', '', '', '', '2015-05-22 23:14:53'),
(25645, 5, '42.113.46.237', 'Mozilla/5.0 (Linux; U; Android 4.2.1; zh-CN; P2 Build/JOP40D) AppleWebKit/534.31 (KHTML, like Gecko) UCBrowser/9.1.0.297 U3/0.8.0 Mobile Safari/534.31', '', '', '', '', '', '', '2015-05-22 23:21:41'),
(25646, 5, '27.66.155.203', 'Mozilla/5.0 (Windows Phone 8.1; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 630) like Gecko', '', '', '', '', '', '', '2015-05-22 23:25:10'),
(25647, 5, '42.117.51.22', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 630 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-22 23:31:24'),
(25648, 5, '1.52.34.106', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 630 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-22 23:33:45'),
(25649, 5, '115.73.19.174', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 520)', '', '', '', '', '', '', '2015-05-22 23:57:15'),
(25650, 5, '27.67.32.175', 'Mozilla/5.0 (Linux; U; Android 4.3; zh-CN; SGH-N075T Build/JSS15J) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 UCBrowser/9.8.9.457 U3/0.8.0 Mobile Safari/533.1', '', '', '', '', '', '', '2015-05-22 23:57:51'),
(25651, 5, '27.66.155.203', 'Mozilla/5.0 (Windows Phone 8.1; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 630) like Gecko', '', '', '', '', '', '', '2015-05-23 00:01:18'),
(25652, 5, '168.63.139.43', 'Mozilla/5.0 (Windows Phone 8.1; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 530 Dual SIM) like Gecko', '', '', '', '', '', '', '2015-05-23 00:06:50'),
(25653, 5, '113.187.17.106', 'Mozilla/5.0 (Windows Phone 8.1; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 530 Dual SIM) like Gecko', '', '', '', '', '', '', '2015-05-23 00:06:51'),
(25654, 5, '112.197.32.234', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 520)', '', '', '', '', '', '', '2015-05-23 00:09:45'),
(25655, 5, '168.63.200.167', 'Mozilla/5.0 (Windows Phone 8.1; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 630) like Gecko', '', '', '', '', '', '', '2015-05-23 00:10:32'),
(25656, 5, '27.66.155.203', 'Mozilla/5.0 (Windows Phone 8.1; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 630) like Gecko', '', '', '', '', '', '', '2015-05-23 00:35:27'),
(25657, 5, '113.22.170.20', 'Mozilla/5.0 (Linux; U; Android 4.2.2; vi; P4 Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/9.9.2.467 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-23 00:35:29'),
(25658, 5, '113.168.76.44', 'Mozilla/5.0 (Linux; U; Android 4.1.2; en-US; SHV-E120K Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/9.9.4.484 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-23 00:42:37'),
(25659, 5, '116.98.163.144', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 730 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-23 00:59:17'),
(25660, 4, '113.167.60.251', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/47.0 Chrome/41.0.2272.127_coc_coc Safari/537.36', '', '', '', '', '', '', '2015-05-23 01:02:15'),
(25661, 5, '27.66.155.203', 'Mozilla/5.0 (Windows Phone 8.1; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 630) like Gecko', '', '', '', '', '', '', '2015-05-23 01:15:53'),
(25662, 4, '123.26.38.129', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/47.0 Chrome/41.0.2272.127_coc_coc Safari/537.36', '', '', '', '', '', '', '2015-05-23 01:45:41'),
(25663, 5, '27.67.40.92', 'Mozilla/5.0 (Linux; Android 4.0.4; Lenovo A390_ROW Build/IMM76I) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19', '', '', '', '', '', '', '2015-05-23 01:53:27'),
(25664, 5, '123.22.54.105', 'Mozilla/5.0 (Linux; U; Android 4.1.2; en-US; GT-I8552 Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/9.9.4.484 U3/0.8.0 Mobile Safari/534.30', '', '', '', '', '', '', '2015-05-23 01:56:16'),
(25665, 4, '113.165.12.94', 'Mozilla/5.0 (iPad; CPU OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53', '', '', '', '', '', '', '2015-05-23 02:05:34'),
(25666, 5, '42.117.51.22', 'Mozilla/5.0 (Mobile; Windows Phone 8.1; Android 4.0; ARM; Trident/7.0; Touch; rv:11.0; IEMobile/11.0; NOKIA; Lumia 630 Dual SIM) like iPhone OS 7_0_3 Mac OS X AppleWebKit/537 (KHTML, like Gecko) Mobile Safari/537', '', '', '', '', '', '', '2015-05-23 02:11:15'),
(25667, 4, '113.185.2.197', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.34 Safari/534.24', '', '', '', '', '', '', '2015-05-23 02:27:32');

--
-- Triggers `views`
--
DELIMITER //
CREATE TRIGGER `delete_views_row` BEFORE DELETE ON `views`
 FOR EACH ROW BEGIN UPDATE views SET hide="Y" WHERE id=pID; END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `update_views_row` BEFORE UPDATE ON `views`
 FOR EACH ROW BEGIN
  UPDATE views SET hide = 'Y' WHERE id = pID;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `websites`
--

CREATE TABLE IF NOT EXISTS `websites` (
`id` int(11) NOT NULL,
  `campaignid` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comments` text COLLATE utf8_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `domain_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `postcode` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `fax` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `payee_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tax_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `mode_of_payment` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `currency` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `unique_users` int(11) NOT NULL,
  `total_views` int(11) NOT NULL,
  `unique_views` int(11) NOT NULL,
  `page_rank` int(11) NOT NULL,
  `category` int(11) DEFAULT NULL,
  `help_file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `account_id` int(11) NOT NULL,
  `order_no` int(11) DEFAULT '1',
  `icp` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '_',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `websites`
--

INSERT INTO `websites` (`id`, `campaignid`, `name`, `logo`, `comments`, `contact`, `email`, `website`, `domain_name`, `language`, `address`, `city`, `postcode`, `country`, `phone`, `fax`, `payee_name`, `tax_id`, `mode_of_payment`, `currency`, `unique_users`, `total_views`, `unique_views`, `page_rank`, `category`, `help_file`, `created_at`, `updated_at`, `account_id`, `order_no`, `icp`, `status`) VALUES
(3, 4, 'Sức khỏe cộng đồng', '', '', 'Công ty Cổ phần iNews 247 quận Cầu Giấy, Hà Nội', 'info@tintuc.vn', 'http://skcd.com.vn/', '', '52', '', '', '', '247', '', '', '', '', '', '', 0, 97271, 28033, 0, 94, '', '2015-05-23 09:45:43', '2015-05-22 04:45:59', 0, 1, '_', 1),
(4, 5, 'Tin tức Việt Nam', '', '', 'Công ty Cổ phần iNews 247 quận Cầu Giấy, Hà Nội', 'info@tintuc.vn', 'http://tintuc.vn/', '', '52', '', '', '', '247', '', '', '', '', '', '', 0, 28362641, 20462619, 0, 24, '', '2015-05-23 09:45:43', '2015-05-22 04:46:40', 0, 2, '_', 1),
(5, 6, 'Mobile tin tức Việt Nam', '', '', '247 Cầu Giấy, quận Cầu Giấy, Hà Nội', 'info@tintuc.vn', 'http://m.tintuc.vn/', '', '52', '', '', '', '247', '', '', '', '', '', '', 0, 24787894, 20215513, 0, 24, '', '2015-05-23 09:45:43', '2015-05-22 04:44:52', 0, 3, '_', 1),
(6, 8, 'CÔNG TY TNHH THÔNG TIN TRƯỜNG PHÁT', '', '', 'Số 179, Lý Chính Thắng, P.7, Q.3. TP.HCM', 'ntthom@tpinfo.vn', 'http://truongphat.com.vn/', '', '52', '', '', '', '247', '', '', '', '', '', '', 0, 0, 0, 0, 0, '', '2015-05-23 09:45:43', '2015-05-22 04:43:15', 0, 4, '_', 1),
(7, 9, 'MẠNG BÁN LẺ TRỰC TUYẾN GOHAPPY', '', '', 'Văn phòng giao dịch:  Lô 11-H1 khu đô thị Yên Hòa, quận Cầu Giấy, Hà Nội, Việt Nam', 'sales@gohappy.vn', 'http://gohappy.vn/', 'gohappy.vn', '52', '', '', '', '247', '', '', '', '', '', '', 0, 0, 0, 0, NULL, '', '2015-05-23 09:45:43', '2015-05-22 04:44:13', 0, 5, '_', 1);

--
-- Triggers `websites`
--
DELIMITER //
CREATE TRIGGER `delete_websites_row` BEFORE DELETE ON `websites`
 FOR EACH ROW BEGIN UPDATE websites SET hide="Y" WHERE id=pID; END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `update_websites_row` BEFORE UPDATE ON `websites`
 FOR EACH ROW BEGIN
  UPDATE websites SET hide = 'Y' WHERE id = pID;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `websites_banners`
--

CREATE TABLE IF NOT EXISTS `websites_banners` (
`id` int(11) NOT NULL,
  `website_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `adbanner_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imagefile` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adbanner_link` text COLLATE utf8_unicode_ci NOT NULL,
  `adbanner_description` text COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `websites_partners`
--

CREATE TABLE IF NOT EXISTS `websites_partners` (
`id` int(11) NOT NULL,
  `website_id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `topic_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icp` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `websites_topics`
--

CREATE TABLE IF NOT EXISTS `websites_topics` (
`id` int(11) NOT NULL,
  `website_id` int(11) NOT NULL,
  `feed_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `feed_address` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL,
  `category_id` int(11) NOT NULL,
  `period` int(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE IF NOT EXISTS `zones` (
`id` int(11) NOT NULL,
  `website_id` int(11) NOT NULL,
  `zonename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `delivery` int(6) NOT NULL,
  `zonetype` int(6) NOT NULL,
  `category` int(6) NOT NULL,
  `width` int(6) NOT NULL,
  `height` int(6) NOT NULL,
  `ad_selection` int(6) NOT NULL,
  `comments` text COLLATE utf8_unicode_ci NOT NULL,
  `cost` int(6) NOT NULL,
  `cost_type` int(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `block` int(11) NOT NULL,
  `rate` int(6) NOT NULL,
  `pricing` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `order_no` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`id`, `website_id`, `zonename`, `description`, `delivery`, `zonetype`, `category`, `width`, `height`, `ad_selection`, `comments`, `cost`, `cost_type`, `created_at`, `updated_at`, `block`, `rate`, `pricing`, `order_no`, `status`) VALUES
(4, 3, 'zone 1', 'Zone 1', 0, 1, 0, 728, 90, 26, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 04:47:55', 0, 0, '', 1, 1),
(5, 3, 'zone 2', 'Zone 2', 0, 1, 0, 300, 250, 34, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 04:50:40', 0, 0, '', 2, 1),
(6, 3, 'zone 3', 'Zone 3', 0, 1, 0, 300, 600, 39, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 04:53:13', 0, 0, '', 3, 1),
(7, 4, 'HT01', 'Vùng hiển thị header top banner 1', 0, 1, 24, 366, 90, 40, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 04:57:57', 0, 0, '', 4, 1),
(8, 4, 'HT02', 'Vùng hiển thị header top banner 2', 0, 1, 24, 366, 90, 40, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 05:02:53', 0, 0, '', 5, 1),
(9, 4, 'Olaifa', 'Peercft answer! That really gets to the heart of it!', 0, 5, 137, 495, 90, 41, 'Peercft answer! That really gets to the heart of it!', 0, 0, '2015-05-23 09:49:51', '2015-05-22 13:22:28', 0, 0, 'QtMQUDqOKQ', 6, 1),
(10, 4, 'HC02', 'Vùng hiển thị ở giữa trang chủ 2', 0, 1, 24, 495, 90, 41, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 05:10:42', 0, 0, '', 7, 1),
(11, 4, 'HC03', 'Vùng hiển thị ở giữa trang chủ 3', 0, 1, 24, 495, 90, 41, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 05:13:45', 0, 0, '', 8, 1),
(12, 4, 'HC04', 'Vùng hiển thị ở giữa trang chủ 4', 0, 1, 24, 495, 90, 41, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 05:16:58', 0, 0, '', 9, 1),
(13, 4, 'C01', 'Vùng hiển thị cho các trang danh mục', 0, 1, 24, 200, 600, 42, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 05:20:28', 0, 0, '', 10, 1),
(14, 4, 'DL01', 'Vùng quảng cáo cho các trang chi tiết phía bên trái', 0, 1, 24, 160, 600, 38, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 05:22:35', 0, 0, '', 11, 1),
(15, 4, 'Zone mobile 320x100', 'Vùng quảng cáo cho mobile kích thước 320x100px', 0, 1, 24, 320, 100, 43, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 05:26:07', 0, 0, '', 12, 1),
(16, 4, 'Zone mobile 320x250', 'Vùng quảng cáo cho mobile kích thước 320x250px', 0, 1, 24, 320, 250, 44, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 05:29:39', 0, 0, '', 13, 1),
(17, 4, 'Zone mobile đáp ứng', 'Vùng quảng cáo cho mobile kích thước tùy chỉnh', 0, 1, 24, 0, 0, 45, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 05:31:30', 0, 0, '', 14, 1),
(18, 5, 'Vùng hiển thị dưới phần comment trên phiên bản mobile của trang tintuc.vn', 'Vùng hiển thị dưới phần comment trên phiên bản mobile của trang tintuc.vn', 0, 1, 24, 300, 250, 34, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 05:33:14', 0, 0, '', 15, 1),
(19, 5, 'Vùng hiển thị dưới bài nổi bật của trang chuyên mục trên phiên bản mobile của trang tintuc.vn', 'Vùng hiển thị dưới bài nổi bật của trang chuyên mục trên phiên bản mobile của trang tintuc.vn', 0, 1, 24, 300, 250, 34, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 05:33:51', 0, 0, '', 16, 1),
(20, 5, 'Vùng hiển thị trên trang chủ phiên bản mobile của trang tintuc.vn', 'Vùng hiển thị trên trang chủ phiên bản mobile của trang tintuc.vn', 0, 1, 24, 300, 250, 34, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 05:34:26', 0, 0, '', 17, 1),
(21, 5, 'Vùng hiển thị dưới cùng của trang chuyên mục trên phiên bản mobile của trang tintuc.vn', 'Vùng hiển thị dưới cùng của trang chuyên mục trên phiên bản mobile của trang tintuc.vn', 0, 1, 24, 300, 250, 34, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 05:35:08', 0, 0, '', 18, 1),
(22, 5, 'Vùng hiển thị trên trang chi tiết phiên bản mobile của trang tintuc.vn', 'Vùng hiển thị trên trang chi tiết phiên bản mobile của trang tintuc.vn', 0, 1, 24, 300, 250, 34, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 05:37:30', 0, 0, '', 19, 1),
(23, 5, 'Vùng hiển thị trên trang tag(tiêu điểm) phiên bản mobile của trang tintuc.vn', 'Vùng hiển thị trên trang tag(tiêu điểm) phiên bản mobile của trang tintuc.vn', 0, 1, 24, 300, 250, 34, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 05:39:25', 0, 0, '', 20, 1),
(24, 5, 'Vùng hiển thị trên trang tin hot phiên bản mobile của trang tintuc.vn', 'Vùng hiển thị trên trang tin hot phiên bản mobile của trang tintuc.vn', 0, 1, 24, 300, 250, 34, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 05:41:05', 0, 0, '', 21, 1),
(25, 5, 'Vùng hiển thị trên trang tin tức 24h phiên bản mobile của trang tintuc.vn', 'Vùng hiển thị trên trang tin tức 24h phiên bản mobile của trang tintuc.vn', 0, 1, 24, 300, 250, 34, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 05:43:06', 0, 0, '', 22, 1),
(26, 4, 'Vùng hiển thị banner cột phải chuyên mục ô tô - xe máy', 'Vùng hiển thị banner cột phải chuyên mục ô tô - xe máy', 0, 1, 11, 300, 90, 40, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 05:44:31', 0, 0, '', 23, 1),
(27, 4, 'Quảng cáo cho chuyên mục tin tức 24h trên trang tintuc.vn', 'Quảng cáo cho chuyên mục tin tức 24h trên trang tintuc.vn', 0, 1, 24, 160, 600, 38, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 05:46:19', 0, 0, '', 24, 1),
(28, 6, 'Vùng quảng cáo banner cho CÔNG TY TNHH THÔNG TIN TRƯỜNG PHÁT (trên trang chủ)', '', 0, 1, 0, 300, 500, 39, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 05:49:28', 0, 0, '', 25, 1),
(29, 6, 'Vùng quảng cáo banner (trên trang danh mục)', '', 0, 1, 0, 300, 250, 34, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 05:51:30', 0, 0, '', 26, 1),
(30, 4, 'Zone 300 x 250', 'Zone 300 x 250', 0, 1, 0, 300, 250, 0, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 05:53:13', 0, 0, '', 27, 1),
(31, 4, 'Banner 728 x 90', 'Banner 728 x 90', 0, 1, 0, 728, 90, 0, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 05:56:23', 0, 0, '', 28, 1),
(32, 4, 'Zone 300 x 250 (lần 2)', 'Zone 300 x 250 (lần 2)', 0, 1, 0, 300, 250, 0, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 05:57:58', 0, 0, '', 29, 1),
(33, 7, 'Vùng hiển thị Top Banner 728x90', '', 0, 1, 0, 728, 90, 26, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 05:58:37', 0, 0, '0', 30, 1),
(34, 7, 'Vùng hiển thị top banner trên tất cả các trang con đi tới trang goHappy', 'Vùng hiển thị top banner trên tất cả các trang con đi tới trang goHappy', 0, 1, 0, 728, 85, 26, '', 0, 0, '2015-05-23 09:49:51', '2015-05-22 05:59:12', 0, 0, '0', 31, 1);

--
-- Triggers `zones`
--
DELIMITER //
CREATE TRIGGER `delete_zones_row` BEFORE DELETE ON `zones`
 FOR EACH ROW BEGIN UPDATE zones SET hide="Y" WHERE id=pID; END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `update_zones_row` BEFORE UPDATE ON `zones`
 FOR EACH ROW BEGIN
  UPDATE zones SET hide = 'Y' WHERE id = pID;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `zonetypes`
--

CREATE TABLE IF NOT EXISTS `zonetypes` (
`id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `zonetypes`
--

INSERT INTO `zonetypes` (`id`, `title`, `description`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Banner, Button or Rectangle', 'A banner advertisement image. The image can be a gif, jpg, or png file.', '0000-00-00 00:00:00', '2015-05-16 01:35:16', 1),
(2, 'Text ad', 'A standard HTML text link to an advertiser''s site.', '0000-00-00 00:00:00', '2015-05-16 01:35:33', 1),
(3, 'Email/Newsletter zone ', '', '0000-00-00 00:00:00', '2015-05-16 01:35:52', 1),
(4, 'Video', 'A video advertisement. The video can be a flash swf/flv file, or an HTML5 mp4/webm video. The ad can be displayed as a standalone video or through VAST.', '0000-00-00 00:00:00', '2015-05-16 01:36:14', 1),
(5, 'Free-form', 'Free-form lets you paste in any ad code format, such as from third party ad providers like Google Adsense.', '0000-00-00 00:00:00', '2015-05-16 01:36:35', 1);

--
-- Triggers `zonetypes`
--
DELIMITER //
CREATE TRIGGER `delete_zonetypes_row` BEFORE DELETE ON `zonetypes`
 FOR EACH ROW BEGIN UPDATE zonetypes SET hide="Y" WHERE id=pID; END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `update_zonetypes_row` BEFORE UPDATE ON `zonetypes`
 FOR EACH ROW BEGIN
  UPDATE zonetypes SET hide = 'Y' WHERE id = pID;
END
//
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adtypes`
--
ALTER TABLE `adtypes`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cclicks`
--
ALTER TABLE `cclicks`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `channels`
--
ALTER TABLE `channels`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clicks`
--
ALTER TABLE `clicks`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configs`
--
ALTER TABLE `configs`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cviews`
--
ALTER TABLE `cviews`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_helper`
--
ALTER TABLE `data_helper`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_uri`
--
ALTER TABLE `data_uri`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `folder_banners`
--
ALTER TABLE `folder_banners`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlogs`
--
ALTER TABLE `userlogs`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `views`
--
ALTER TABLE `views`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `websites`
--
ALTER TABLE `websites`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `websites_banners`
--
ALTER TABLE `websites_banners`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `websites_partners`
--
ALTER TABLE `websites_partners`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `websites_topics`
--
ALTER TABLE `websites_topics`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zonetypes`
--
ALTER TABLE `zonetypes`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `adtypes`
--
ALTER TABLE `adtypes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=179;
--
-- AUTO_INCREMENT for table `cclicks`
--
ALTER TABLE `cclicks`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=259;
--
-- AUTO_INCREMENT for table `channels`
--
ALTER TABLE `channels`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `clicks`
--
ALTER TABLE `clicks`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `configs`
--
ALTER TABLE `configs`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=257;
--
-- AUTO_INCREMENT for table `cviews`
--
ALTER TABLE `cviews`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=318;
--
-- AUTO_INCREMENT for table `data_helper`
--
ALTER TABLE `data_helper`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `data_uri`
--
ALTER TABLE `data_uri`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `folder_banners`
--
ALTER TABLE `folder_banners`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `userlogs`
--
ALTER TABLE `userlogs`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `views`
--
ALTER TABLE `views`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25668;
--
-- AUTO_INCREMENT for table `websites`
--
ALTER TABLE `websites`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `websites_banners`
--
ALTER TABLE `websites_banners`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `websites_partners`
--
ALTER TABLE `websites_partners`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `websites_topics`
--
ALTER TABLE `websites_topics`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `zonetypes`
--
ALTER TABLE `zonetypes`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
