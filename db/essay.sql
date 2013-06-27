-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 05, 2012 at 07:44 PM
-- Server version: 5.5.20
-- PHP Version: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `essay`
--

-- --------------------------------------------------------

--
-- Table structure for table `kn_area_range`
--

CREATE TABLE IF NOT EXISTS `kn_area_range` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ordering` int(10) unsigned NOT NULL DEFAULT '0',
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `language_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `kn_area_range`
--

INSERT INTO `kn_area_range` (`id`, `name`, `alias`, `ordering`, `publish`, `language_id`) VALUES
(1, '< 50 m2', '50-m2', 1, 1, 1),
(2, '50 m2 < x < 100 m2', '50-m2-x-100-m2', 2, 1, 1),
(3, '100 m2 - 150 m2', '100-m2-150-m2', 3, 1, 1),
(4, '150 m2 - 200 m2', '150-m2-200-m2', 4, 1, 1),
(5, '200 m2 - 300 m2', '200-m2-300-m2', 5, 1, 1),
(6, '300 m2 - 500 m2', '300-m2-500-m2', 6, 1, 1),
(7, '> 500 m2', '500-m2', 7, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kn_article`
--

CREATE TABLE IF NOT EXISTS `kn_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_create` text COLLATE utf8_unicode_ci NOT NULL,
  `date_update` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_arr` text COLLATE utf8_unicode_ci NOT NULL,
  `b_summarize` text COLLATE utf8_unicode_ci NOT NULL,
  `b_content` text COLLATE utf8_unicode_ci NOT NULL,
  `article_group_id` int(10) unsigned NOT NULL,
  `meta_id` int(10) unsigned NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `flag_homepage` tinyint(1) NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL,
  `language_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `kn_article`
--

INSERT INTO `kn_article` (`id`, `name`, `alias`, `code`, `date_create`, `date_update`, `image`, `image_arr`, `b_summarize`, `b_content`, `article_group_id`, `meta_id`, `publish`, `flag_homepage`, `hits`, `language_id`) VALUES
(5, 'Cafe - Bar - Catering at PearCafe', 'cafe-bar-catering-at-pearcafe', '', '1337391026', '1341515965', '', '11_581867726.jpg&fieldbreak;', '<p>Pearl Cafe opened on June 7, 2010, is one of the most luxuriuos restaurant in Vietnam, located in the campus Ruby Tower Saigon Pearl, Pearl Cafe is in great location by the river Sai Gon this charming quiet space. In here you can organize the party meeting, party, birthday, cocktail party, to enjoy their cuisine. Vietnamese, especially with the United delicious extensive menu, but a diversified and nutritious drink made â€‹â€‹entirely from fresh fruit, what kind of cocktail is famous for best quality of services and prices reasonable. With stylish design in the style of modern, Pearl Cafe will bring for you the moment freely.</p>', '<p>Pearl Cafe opened on June 7, 2010, is one of the most luxuriuos restaurant in Vietnam, located in the campus Ruby Tower Saigon Pearl, Pearl Cafe is in great location by the river Sai Gon this charming quiet space. In here you can organize the party meeting, party, birthday, cocktail party, to enjoy their cuisine. Vietnamese, especially with the United delicious extensive menu, but a diversified and nutritious drink made â€‹â€‹entirely from fresh fruit, what kind of cocktail is famous for best quality of services and prices reasonable. With stylish design in the style of modern, Pearl Cafe will bring for you the moment freely.</p>\r\n<p>The Saigon River Club</p>\r\n<p>Saigon''s largest luxury state of the art health club 3500 m2 of space equipped with the very latest in fitness technology. Vietnams premier members club , an inviting oasis of fitness , relaxation, rejuvenation with social interaction promoting health and wellness along with productive urban living.</p>\r\n<p>Conveniently located 10 minutes from Saigon''s downtown central business District (1) -within the prestigious Saigon Pearl development nestled on the banks of the Saigon river in Binh Thanh district.</p>\r\n<p>The Saigon River Club started operations on October 1st 2010 and our continued mission will be to provide the Saigon community with high class facilities and services. An ideal facility for members to achieve their personal fitness goals leading to a healthier more enriched urban lifestyle. Combat ageing, pollution the stresses and strains of business and city life</p>\r\n<p><img title="Saigon Pearl Club" src="http://www.saigonpearlapartment.net/upload/mainphoto.jpg" alt="Saigon Pearl Club" width="797" height="458" /></p>', 113, 93, 1, 0, 0, 1),
(7, 'Lien he', 'lien-he', '', '1337359041', '1341516686', '', 'P23_453532557.jpg&fieldbreak;P24.jpg&fieldbreak;P22_47230608.jpg&fieldbreak;P18_420215129.jpg', '', '<p>Cáº£m Æ¡n quÃ½ khÃ¡ch hÃ ng Ä‘Ã£ ghÃ© thÄƒm website cá»§a chÃºng tÃ´i.</p>\r\n<p>Náº¿u cÃ³ tháº¯c máº¯c. Vui lÃ²ng Ä‘iá»n thÃ´ng tin vÃ o form bÃªn dÆ°á»›i vÃ  nháº¥n gá»­i.</p>', 109, 95, 0, 0, 0, 1),
(8, 'Äá»‘i tÃ¡c', 'doi-tac', '', '1337387644', '1341516402', '', '11_935039879.jpg&fieldbreak;P23_453532557.jpg&fieldbreak;P24.jpg&fieldbreak;P22_47230608.jpg&fieldbreak;', '', '<p><a title="Apartmentforlease.com.vn" href="http://apartmentforlease.com.vn" target="_blank"> <img src="http://localhost/canhosaigon.com.vn/upload/@files/pa1.png" alt="Apartmentforlease.com.vn" /> </a> <a title="CÄƒn há»™ sai gon" href="http://canhosaigon.com.vn" target="_blank"> <img src="http://localhost/canhosaigon.com.vn/upload/@files/pa2.png" alt="CÄƒn há»™ sai gon" /> </a> <a title="Thiáº¿t káº¿ website thÃ¢n thiá»‡n TOP 10 Google" href="http://www.thietkeweb-seo.com/" target="_blank"> <img src="http://localhost/canhosaigon.com.vn/upload/@files/pa4.png" alt="Thiáº¿t káº¿ website thÃ¢n thiá»‡n TOP 10 Google" /> </a> <a title="Godern Tedragon Corp" href="#" target="_blank"> <img src="http://localhost/canhosaigon.com.vn/upload/@files/pa3.png" alt="Godern Tedragon Corp" /> </a></p>', 111, 96, 0, 0, 0, 1),
(9, 'Quick contact', 'quick-contact', '', '1337387936', '1341516361', '', '', '', '<script type="text/javascript" src="http://download.skype.com/share/skypebuttons/js/skypeCheck.js">// <![CDATA[\r\n    \r\n// ]]></script>\r\n<div class="yahoo"><a href="ymsgr:sendIM?bogiaso&amp;m=Hi!"> <strong> Mr. VÆ°Æ¡ng </strong> <br /> send me messages! </a></div>\r\n<div class="skype"><a href="skype:asdfsdf?call"> <strong> Mr. Nam </strong> <br /> Call me now! </a></div>\r\n<div class="hotline"><strong> (Mr. Nam) </strong> <span> 0919 050 067 </span> <br /> <strong> (Mr. Nam) </strong> <span> 0919 050 067 </span></div>', 109, 97, 0, 0, 0, 1),
(10, 'Apartment SERVICE FEES', 'apartment-seRvice-fees', '', '1337394566', '1341516111', '', '30TAST_2_380293579.jpg&fieldbreak;', '', '<table class="servicesfees" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td><strong> BRANDS </strong></td>\r\n<td><strong> DECRIPTION </strong></td>\r\n<td><strong> PRICE (USD) </strong></td>\r\n</tr>\r\n<tr>\r\n<td>MANAGERMENT FEE</td>\r\n<td width="180">Â </td>\r\n<td width="180">0,88/month/sqm</td>\r\n</tr>\r\n<tr>\r\n<td width="276">RIVER SAIGON CLUB</td>\r\n<td>GYM + SWIMMING POOR</td>\r\n<td>96/month</td>\r\n</tr>\r\n<tr>\r\n<td>CAR PARK</td>\r\n<td>Â </td>\r\n<td>80/month</td>\r\n</tr>\r\n<tr>\r\n<td>ELECTRICT</td>\r\n<td>Â </td>\r\n<td>O,1/KW</td>\r\n</tr>\r\n<tr>\r\n<td>WATER</td>\r\n<td>Â </td>\r\n<td>1/m3</td>\r\n</tr>\r\n<tr>\r\n<td>CABLE TV</td>\r\n<td>Â </td>\r\n<td>4,4/month</td>\r\n</tr>\r\n<tr>\r\n<td>INTERNET</td>\r\n<td>Â </td>\r\n<td>12/month</td>\r\n</tr>\r\n<tr>\r\n<td>GASÂ </td>\r\n<td>Â </td>\r\n<td>Â 15/month</td>\r\n</tr>\r\n<tr>\r\n<td>CLEARNING SERVICE</td>\r\n<td>About: 30hour/month</td>\r\n<td>50/month</td>\r\n</tr>\r\n</tbody>\r\n</table>', 110, 120, 1, 0, 0, 1),
(12, 'TinySlider - Simple JavaScript', 'tinyslider-simple-javascript', '', '1337450374', '1339063418', '', 'e2.jpg&fieldbreak;', '<p>Nam adipiscing augue eget nunc ultricies vel scelerisque massa iaculis. Proin a orci massa. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut quis mi in purus mollis suscipit quis eget purus. Suspendisse potenti. Cras sit amet nunc eget nisi scelerisque lacinia nec eget purus.</p>', '<p>Nam adipiscing augue eget nunc ultricies vel scelerisque massa iaculis. Proin a orci massa. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut quis mi in purus mollis suscipit quis eget purus. Suspendisse potenti. Cras sit amet nunc eget nisi scelerisque lacinia nec eget purus.</p>\r\n<p>Nam adipiscing augue eget nunc ultricies vel scelerisque massa iaculis. Proin a orci massa. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut quis mi in purus mollis suscipit quis eget purus. Suspendisse potenti. Cras sit amet nunc eget nisi scelerisque lacinia nec eget purus.</p>', 99, 126, 1, 0, 0, 1),
(13, 'Tags Cloud', 'tags-cloud', '', '1341516853', '1341516936', '', '', '', '<p>Â <a title="Apartment for rent in district 1" href="http://www.horizontower.net/apartment-for-rent-in-district-1--t4/1">Apartment for rent in district 1</a>, <a title="Apartments in District 1" href="http://www.horizontower.net/apartments-in-district-1--t11/1">Apartments in District 1</a>, <a title="Avalon Apartment" href="http://www.horizontower.net/avalon-apartment--t13/1">Avalon Apartment</a>, <a title="Avalon apartment for rent" href="http://www.horizontower.net/avalon-apartment-for-rent--t25/1">Avalon apartment for rent</a>, <a title="BÃ¡n cÄƒn há»™ Central Garden" href="http://www.horizontower.net/ban-can-ho-central-garden--t21/1">BÃ¡n cÄƒn há»™ Central Garden</a>, <a title="ban can ho horizon" href="http://www.horizontower.net/ban-can-ho-horizon--t7/1">ban can ho horizon</a>, <a title="CÄƒn há»™ Central Garden" href="http://www.horizontower.net/can-ho-central-garden--t20/1">CÄƒn há»™ Central Garden</a>, <a title="CÄƒn há»™ Central Garden quáº­n 1" href="http://www.horizontower.net/can-ho-central-garden-quan-1--t19/1">CÄƒn há»™ Central Garden quáº­n 1</a>, <a title="Can ho Horizon" href="http://www.horizontower.net/can-ho-horizon--t2/1">Can ho Horizon</a>, <a title="can ho horizon q1" href="http://www.horizontower.net/can-ho-horizon-q1--t8/1">can ho horizon q1</a>, <a title="CÄƒn há»™ Horizon quáº­n 1" href="http://www.horizontower.net/can-ho-horizon-quan-1--t6/1">CÄƒn há»™ Horizon quáº­n 1</a>, <a title="CÄƒn há»™ quáº­n 1, can ho quan 1" href="http://www.horizontower.net/can-ho-quan-1-can-ho-quan-1--t26/1">CÄƒn há»™ quáº­n 1, can ho quan 1</a>, <a title="Central Garden" href="http://www.horizontower.net/central-garden--t3/1">Central Garden</a>, <a title="Central Garden Apartment" href="http://www.horizontower.net/central-garden-apartment--t12/1">Central Garden Apartment</a>, <a title="District 1" href="http://www.horizontower.net/district-1--t1/1">District 1</a>, <a title="HCM" href="http://www.horizontower.net/hcm--t15/1">HCM</a>, <a title="Ho Chi Minh" href="http://www.horizontower.net/ho-chi-minh--t14/1">Ho Chi Minh</a>, <a title="Horizon Tower" href="http://www.horizontower.net/horizon-tower--t18/1">Horizon Tower</a>, <a title="Horizon Tower Apartments" href="http://www.horizontower.net/horizon-tower-apartments--t17/1">Horizon Tower Apartments</a>, <a title="Luxurious" href="http://www.horizontower.net/luxurious--t16/1">Luxurious</a>, <a title="Pavillon Apartment" href="http://www.horizontower.net/pavillon-apartment--t27/1">Pavillon Apartment</a>, <a title="Quáº­n 1" href="http://www.horizontower.net/quan-1--t5/1">Quáº­n 1</a>, <a title="Saigon Pavillon Apartment" href="http://www.horizontower.net/saigon-pavillon-apartment--t28/1">Saigon Pavillon Apartment</a>, <a title="Sailing tower" href="http://www.horizontower.net/sailing-tower--t24/1">Sailing tower</a>, <a title="Sailing tower apartments" href="http://www.horizontower.net/sailing-tower-apartments--t22/1">Sailing tower apartments</a>, <a title="Sailing tower ho chi minh" href="http://www.horizontower.net/sailing-tower-ho-chi-minh--t23/1">Sailing tower ho chi minh</a>, <a title="The He Moi apartment" href="http://www.horizontower.net/the-he-moi-apartment--t10/1">The He Moi apartment</a>, <a title="The Lancaster Apartment" href="http://www.horizontower.net/the-lancaster-apartment--t9/1">The Lancaster Apartment</a>,</p>', 109, 176, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kn_article_group`
--

CREATE TABLE IF NOT EXISTS `kn_article_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parents` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `meta_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=121 ;

--
-- Dumping data for table `kn_article_group`
--

INSERT INTO `kn_article_group` (`id`, `name`, `alias`, `parents`, `level`, `lft`, `rgt`, `publish`, `meta_id`) VALUES
(1, 'Root', '', 0, 0, 0, 45, 1, 0),
(99, 'Dá»± Ã¡n', 'du-an', 1, 1, 1, 14, 1, 99),
(100, 'Apartments in District 2', 'apartments-in-district-2', 1, 1, 15, 20, 0, 100),
(101, 'Apartments in District 3', 'apartments-in-district-3', 1, 1, 21, 26, 0, 101),
(102, 'Apartments in District 4', 'apartments-in-district-4', 1, 1, 27, 28, 0, 102),
(103, 'Apartments in District 5', 'apartments-in-district-5', 1, 1, 29, 30, 0, 103),
(104, 'Apartments in District 6', 'apartments-in-district-6', 1, 1, 31, 32, 0, 104),
(105, 'Apartments in District 7', 'apartments-in-district-7', 1, 1, 33, 34, 0, 105),
(106, 'Apartments in District 8', 'apartments-in-district-8', 1, 1, 35, 36, 0, 106),
(107, 'Apartments in District 10', 'apartments-in-district-10', 1, 1, 37, 38, 0, 107),
(108, 'Apartments in Binh Thanh District', 'apartments-in-binh-thanh-district', 1, 1, 39, 42, 0, 108),
(109, 'BÃ i viáº¿t láº»', 'bai-viet-le', 1, 1, 43, 44, 1, 109),
(110, 'Horizon Tower Apartments', 'horizon-tower-apartments', 99, 2, 12, 13, 0, 110),
(111, 'Avalon Apartments', 'avalon-apartments', 99, 2, 2, 3, 0, 111),
(112, 'Indochina Park Tower', 'Indochina Park Tower', 99, 2, 4, 5, 0, 112),
(113, 'Sai Gon Luxury Apartments', 'sai-gon-luxury-apartments', 99, 2, 6, 7, 0, 113),
(114, 'BMC Apartments', 'bmc-apartments', 99, 2, 8, 9, 0, 114),
(115, 'Central Garden Apartments', 'central-garden-apartments', 99, 2, 10, 11, 0, 115),
(116, 'The Vista Apartments', 'the-vista-apartments', 100, 2, 18, 19, 0, 116),
(117, 'Hoang Anh Riverview Apartments', 'hoang-anh-Riverview-apartments', 100, 2, 16, 17, 0, 117),
(118, 'Sai Gon Pavillon Apartment', 'sai-gon-pavillon-apartment', 101, 2, 22, 23, 0, 118),
(119, 'Botanic Tower', 'botanic-tower', 101, 2, 24, 25, 0, 121),
(120, 'Saigon Pearl', 'saigon-pearl', 108, 2, 40, 41, 0, 124);

-- --------------------------------------------------------

--
-- Table structure for table `kn_district`
--

CREATE TABLE IF NOT EXISTS `kn_district` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ordering` int(10) unsigned NOT NULL DEFAULT '0',
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `language_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `kn_district`
--

INSERT INTO `kn_district` (`id`, `name`, `alias`, `ordering`, `publish`, `language_id`) VALUES
(1, 'Quáº­n 1', 'quan-1', 1, 1, 1),
(2, 'Quáº­n 2', 'quan-2', 2, 1, 1),
(3, 'Quáº­n 3', 'quan-3', 3, 1, 1),
(4, 'Quáº­n 4', 'quan-4', 4, 1, 1),
(5, 'Quáº­n 5', 'quan-5', 5, 1, 1),
(6, 'Quáº­n 6', 'quan-6', 6, 1, 1),
(7, 'Quáº­n 7', 'quan-7', 7, 1, 1),
(8, 'Quáº­n 8', 'quan-8', 8, 1, 1),
(9, 'Quáº­n 9', 'quan-9', 9, 1, 1),
(10, 'Quáº­n 10', 'quan-10', 10, 1, 1),
(11, 'Quáº­n 11', 'quan-11', 11, 1, 1),
(12, 'Quáº­n 12', 'quan-12', 12, 1, 1),
(13, 'Quáº­n BÃ¬nh Tháº¡nh', 'quan-binh-thanh', 13, 1, 1),
(14, 'Quáº­n Thá»§ Äá»©c', 'quan-thu-duc', 16, 1, 1),
(15, 'Quáº­n PhÃº Nhuáº­n', 'quan-phu-nhuan', 14, 1, 1),
(16, 'Quáº­n TÃ¢n BÃ¬nh', 'quan-tan-binh', 15, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kn_meta`
--

CREATE TABLE IF NOT EXISTS `kn_meta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  `robots` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=177 ;

--
-- Dumping data for table `kn_meta`
--

INSERT INTO `kn_meta` (`id`, `title`, `description`, `keywords`, `robots`) VALUES
(1, 'a', 'a', 'a', 'a'),
(2, 'Categorya', 'Categorya', 'Categorya', 'index,followa'),
(3, 'Caaaa', 'Caaaa', 'Caaaa', 'index,follow'),
(4, 'sdfsdfsdfsadfasdfsdfasdfsdf', 'asdfsdf', 'dsfdfsdfsdfÃ¡dfsadfasdfsdfasdf', 'index, follow'),
(5, 'sdfsdfsdfsadfasdfsdfasdfsdf', 'asdfsdf', 'dsfdfsdfsdfÃ¡dfsadfasdfsdfasdf', 'index, follow'),
(6, 'aaaaasdfsdf', 'sdfsdf', 'sdfsdf', ''),
(7, 'asdfasdf', 'asdfasdf', 'asdf', ''),
(8, 'asdfasdf', 'asdfasdf', 'asdf', ''),
(9, 'asdfasdf', 'asdfasdf', 'asdf', ''),
(10, 'asdfasdf', 'asdfasd', 'sadfasdf', ''),
(11, 'fasdf', '', '', ''),
(12, '', '', '', ''),
(13, '', '', '', ''),
(14, '', '', '', ''),
(15, '', '', '', ''),
(16, '', '', '', ''),
(17, '', '', '', ''),
(18, '', '', '', ''),
(19, '', '', '', ''),
(20, '', '', '', ''),
(21, '', '', '', ''),
(22, '', '', '', ''),
(23, '', '', '', ''),
(24, '', '', '', ''),
(25, '', '', '', ''),
(26, '', '', '', ''),
(27, '', '', '', ''),
(28, '', '', '', ''),
(29, '', '', '', ''),
(30, '', '', '', ''),
(31, '', '', '', ''),
(32, '', '', '', ''),
(33, '', '', '', ''),
(34, '', '', '', ''),
(35, '', '', '', ''),
(36, '', '', '', ''),
(37, '', '', '', ''),
(38, '', '', '', ''),
(39, '', '', '', ''),
(40, '', '', '', ''),
(41, '', '', '', ''),
(42, '', '', '', ''),
(43, '', '', '', ''),
(44, '', '', '', ''),
(45, '', '', '', ''),
(46, '', '', '', ''),
(47, '', '', '', ''),
(48, '', '', '', ''),
(49, '', '', '', ''),
(50, '', '', '', ''),
(51, '', '', '', ''),
(52, '', '', '', ''),
(53, '', '', '', ''),
(54, '', '', '', ''),
(55, '', '', '', ''),
(56, '', '', '', ''),
(57, '', '', '', ''),
(58, '', '', '', ''),
(59, '', '', '', ''),
(60, '', '', '', ''),
(61, '', '', '', ''),
(62, '', '', '', ''),
(63, '', '', '', ''),
(64, '', '', '', ''),
(65, '', '', '', ''),
(66, '', '', '', ''),
(67, '', '', '', ''),
(68, '', '', '', ''),
(69, '', '', '', ''),
(70, '', '', '', ''),
(71, '', '', '', ''),
(72, '', '', '', ''),
(73, '', '', '', ''),
(74, '', '', '', ''),
(75, '', '', '', ''),
(76, '', '', '', ''),
(77, '', '', '', ''),
(78, '', '', '', ''),
(79, '', '', '', ''),
(80, '', '', '', ''),
(81, '', '', '', ''),
(82, 'Nam 6x', 'Nam 6x', 'Nam 6x', 'noindex, nofollow'),
(83, '', '', '', ''),
(84, 'Nam 8x', 'Nam 8x', 'Nam 8x', 'index, follow'),
(85, '', '', '', ''),
(86, 'Nam 8', 'Nam 8', 'Nam 8', 'index, follow'),
(87, 'Nam 8', 'Nam 8', 'Nam 8', 'index, follow'),
(88, '', '', '', ''),
(89, 'n1', 'n1', 'n1', 'noindex, nofollow'),
(90, 'n1', 'n1', 'n1', 'noindex, nofollow'),
(91, 'n1', 'n1', 'n1', 'noindex, nofollow'),
(92, 'n1', 'n1', 'n1', 'noindex, nofollow'),
(93, 'Ã¡d', 'asdf', 'fasdf', 'index, follow'),
(94, 'asdf', 'asdfasd', 'asdf', 'index, follow'),
(95, 'asdf', '', 'asdf', 'noindex, nofollow'),
(96, 'asdf', '', 'asdf', 'noindex, nofollow'),
(97, 'asdf1', '1', 'asdf1', 'index, follow'),
(98, '', '', '', ''),
(99, '', '', '', 'index, follow'),
(100, 'Apartments in District 2', 'Apartments in District 2', 'Apartments in District 2', 'index, follow'),
(101, 'Apartments in District 3', 'Apartments in District 3', 'Apartments in District 3', 'index, follow'),
(102, 'Apartments in District 3', 'Apartments in District 3', 'Apartments in District 3', 'index, follow'),
(103, 'Apartments in District 5', 'Apartments in District 5', 'Apartments in District 5', 'index, follow'),
(104, 'Apartments in District 6', 'Apartments in District 6', 'Apartments in District 6', 'index, follow'),
(105, 'Apartments in District 7', 'Apartments in District 7', 'Apartments in District 7', 'index, follow'),
(106, 'Apartments in District 8', 'Apartments in District 8', 'Apartments in District 8', 'index, follow'),
(107, 'Apartments in District 10', 'Apartments in District 10', 'Apartments in District 10', 'index, follow'),
(108, 'Apartments in Binh Thanh District', 'Apartments in Binh Thanh District', 'Apartments in Binh Thanh District', 'index, follow'),
(109, 'Apartments in Phu Nhuan District', 'Apartments in Phu Nhuan District', 'Apartments in Phu Nhuan District', 'index, follow'),
(110, 'Horizon Tower Apartments', 'Horizon Tower Apartments', 'Horizon Tower Apartments', ''),
(111, 'Avalon Apartments', 'Avalon Apartments', 'Avalon Apartments', ''),
(112, 'Indochina Park Tower', 'Indochina Park Tower', 'Indochina Park Tower', ''),
(113, 'Sai Gon Luxury Apartments', 'Sai Gon Luxury Apartments', 'Sai Gon Luxury Apartments', ''),
(114, 'BMC Apartments', 'BMC Apartments', 'BMC Apartments', ''),
(115, 'Central Garden Apartments', 'Central Garden Apartments', 'Central Garden Apartments', ''),
(116, 'The Vista Apartments', 'The Vista Apartments', 'The Vista Apartments', ''),
(117, 'Hoang Anh Riverview Apartments', 'Hoang Anh Riverview Apartments', 'Hoang Anh Riverview Apartments', ''),
(118, 'Sai Gon Pavillon Apartment', 'Sai Gon Pavillon Apartment', 'Sai Gon Pavillon Apartment', 'index, follow'),
(119, '', '', '', ''),
(120, '', '', '', ''),
(121, 'Botanic Tower', 'Botanic Tower', 'Botanic Tower', 'index, follow'),
(122, 'Saigon Pearl Apartment', 'Saigon Pearl Apartment', 'Saigon Pearl Apartment', 'index, follow'),
(123, 'The manor apartment', 'The manor apartment', 'The manor apartment', 'index, follow'),
(124, 'Saigon Pearl', 'Saigon Pearl', 'Saigon Pearl', ''),
(125, '111', '111', '111', 'index, follow'),
(126, '222', '222', '222', 'noindex, nofollow'),
(127, '3333', '3333', '3333', 'index, follow'),
(128, '', '', '', ''),
(129, '', '', '', ''),
(130, '', '', '', ''),
(131, '', '', '', ''),
(132, '', '', '', ''),
(133, '', '', '', ''),
(134, '', '', '', ''),
(135, '', '', '', ''),
(136, '', '', '', ''),
(137, 'aaa', 'aaa', 'aaa', 'index, follow'),
(138, '222', '222', '222', 'noindex, nofollow'),
(139, 'NhÃ  biá»‡t thá»± Ngay CÆ° xÃ¡ tá»± do - CMT8', 'NhÃ  biá»‡t thá»± Ngay CÆ° xÃ¡ tá»± do - CMT8', 'NhÃ  biá»‡t thá»± Ngay CÆ° xÃ¡ tá»± do - CMT8', 'index, follow'),
(140, 'BÃ¡n cÄƒn há»™ Horizon tower 100 USD ', 'BÃ¡n cÄƒn há»™ Horizon tower 100 USD ', 'BÃ¡n cÄƒn há»™ Horizon tower 100 USD ', 'index, follow'),
(141, '', '', '', ''),
(142, '', '', '', ''),
(143, '', '', '', ''),
(144, '', '', '', ''),
(145, '', '', '', ''),
(146, '', '', '', ''),
(147, '', '', '', ''),
(148, '', '', '', ''),
(149, '', '', '', ''),
(150, '', '', '', ''),
(151, '', '', '', ''),
(152, '', '', '', ''),
(153, '', '', '', ''),
(154, '', '', '', ''),
(155, '', '', '', ''),
(156, '', '', '', ''),
(157, '', '', '', ''),
(158, '', '', '', ''),
(159, '', '', '', ''),
(160, '', '', '', ''),
(161, '', '', '', ''),
(162, '', '', '', ''),
(163, '', '', '', ''),
(164, '', '', '', ''),
(165, '', '', '', ''),
(166, '', '', '', ''),
(167, '', '', '', ''),
(168, '', '', '', ''),
(169, '', '', '', ''),
(170, '', '', '', ''),
(171, '', '', '', ''),
(172, '', '', '', ''),
(173, '', '', '', ''),
(174, '', '', '', ''),
(175, '', '', '', ''),
(176, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `kn_price_range`
--

CREATE TABLE IF NOT EXISTS `kn_price_range` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ordering` int(10) unsigned NOT NULL DEFAULT '0',
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `language_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `kn_price_range`
--

INSERT INTO `kn_price_range` (`id`, `name`, `alias`, `ordering`, `publish`, `language_id`) VALUES
(1, 'DÆ°á»›i 500 USD', 'duoi-500-usd', 1, 1, 1),
(2, '500 - 1000', '500-1000', 2, 1, 1),
(3, '1000  -  1500', '1000-1500', 3, 1, 1),
(4, '1500 - 2000', '1500-2000', 4, 1, 1),
(5, '2000 - 3000', '2000-3000', 5, 1, 1),
(6, '3000 - 5000', '3000-5000', 6, 1, 1),
(7, '> 5000', '5000', 7, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kn_product`
--

CREATE TABLE IF NOT EXISTS `kn_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_create` text COLLATE utf8_unicode_ci NOT NULL,
  `date_update` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_arr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_group_id` int(10) unsigned NOT NULL,
  `meta_id` int(10) unsigned NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `flag_homepage` tinyint(1) NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL,
  `language_id` int(10) unsigned NOT NULL DEFAULT '1',
  `user_id` int(10) unsigned NOT NULL,
  `district_id` int(10) unsigned NOT NULL,
  `pricerange_id` int(10) unsigned NOT NULL,
  `arearange_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=50 ;

--
-- Dumping data for table `kn_product`
--

INSERT INTO `kn_product` (`id`, `name`, `alias`, `code`, `date_create`, `date_update`, `image`, `image_arr`, `product_group_id`, `meta_id`, `publish`, `flag_homepage`, `hits`, `language_id`, `user_id`, `district_id`, `pricerange_id`, `arearange_id`) VALUES
(5, 'Cáº§n bÃ¡n Shop cÄƒn há»™ PhÃº Má»¹ Thuáº­n', 'can-ban-shop-can-ho-phu-my-thuan', '', '1337391026', '1340683642', '', '3_434128309.JPG&fieldbreak;4_724598399.JPG&fieldbreak;5_529331559.JPG&fieldbreak;6_957820392.JPG&fieldbreak;', 110, 93, 1, 1, 0, 1, 0, 1, 1, 1),
(7, 'Sai Gon Pavillon Apartment 3Bedrooms', 'sai-gon-pavillon-apartment-3bedrooms', '', '1337359041', '1339989794', '', '1_1203285984.jpg&fieldbreak;2_618895335.jpg&fieldbreak;3_1032246628.jpg&fieldbreak;4_1161694852.jpg&fieldbreak;5_815497839.jpg&fieldbreak;', 118, 95, 1, 1, 0, 1, 0, 13, 1, 5),
(8, 'BÃ¡n nhÃ  Quáº­n 12 giÃ¡ Æ°u Ä‘Ã£i, khÃ´ng gian thoÃ¡ng mÃ¡t', 'ban-nha-quan-12-gia-uu-dai-khong-gian-thoang-mat', '', '1337387644', '1340684010', '', '2_252960158.jpg&fieldbreak;1_942200529.jpg&fieldbreak;3_1129675988.jpg&fieldbreak;4_1105671115.jpg&fieldbreak;1_597710200.jpg&fieldbreak;', 111, 96, 1, 1, 0, 1, 0, 1, 1, 1),
(9, 'Cáº§n bÃ¡n cÄƒn há»™ HÃ¹ng VÆ°Æ¡ng Plaza quáº­n 5', 'can-ban-can-ho-hung-vuong-plaza-quan-5', '', '1337387936', '1340683787', '', '5_1065601157.jpg&fieldbreak;2_941124576.jpg&fieldbreak;4_195563654.jpg&fieldbreak;3_1125668992.jpg&fieldbreak;1_896862114.jpg&fieldbreak;', 110, 97, 1, 1, 0, 1, 0, 1, 1, 1),
(10, 'Cáº§n bÃ¡n cÄƒn há»™ chung cÆ° Quáº­n BÃ¬nh Tháº¡nh D5', 'can-ban-can-ho-chung-cu-quan-binh-thanh-d5', '', '1337394566', '1340683473', '', '8.jpg&fieldbreak;2_1067122332.jpg&fieldbreak;6_1087936448.jpg&fieldbreak;3_754205645.jpg&fieldbreak;5_451195142.jpg&fieldbreak;', 110, 120, 1, 1, 0, 1, 0, 1, 1, 1),
(13, 'Cáº§n bÃ¡n cÄƒn há»™ chung cÆ° Nam An giÃ¡ cá»±c ráº» chá»‰ cÃ³ 1,530ty ( khoáº£ng 19,6tr/m2)', 'can-ban-can-ho-chung-cu-nam-an-gia-cuc-re-chi-co-1-530ty-khoang-19-6tr-m2', '', '1339209797', '1340683227', '', '2_932294345.jpg&fieldbreak;3_410828370.jpg&fieldbreak;4_996332073.jpg&fieldbreak;1_1046234011.jpg&fieldbreak;', 110, 133, 1, 0, 0, 1, 0, 2, 2, 4),
(17, 'Cáº§n bÃ¡n chung cÆ° Phan XÃ­ch Long, quáº­n phÃº nhuáº­n ', 'can-ban-chung-cu-phan-xich-long-quan-phu-nhuan', '', '1339212993', '1340683046', '', '12.jpg&fieldbreak;53.JPG&fieldbreak;', 110, 137, 0, 0, 0, 1, 0, 1, 1, 1),
(19, 'NhÃ  biá»‡t thá»± Ngay CÆ° xÃ¡ tá»± do - CMT8', 'nha-biet-thu-ngay-cu-xa-tu-do-cmt8', '', '1339378921', '1339559949', '', '52.JPG&fieldbreak;54.JPG&fieldbreak;24.jpg&fieldbreak;', 112, 139, 1, 1, 0, 1, 6, 0, 0, 0),
(20, 'BÃ¡n cÄƒn há»™ Horizon tower 100 USD ', 'ban-can-ho-horizon-tower-100-usd', '', '1339575927', '1339576071', '', '1_1098213651.jpg&fieldbreak;2_411718814.jpg&fieldbreak;32.jpg&fieldbreak;', 116, 140, 1, 1, 0, 1, 6, 1, 3, 7),
(21, 'bÃ¡n cÄƒn há»™ saigon pearl, Diá»‡n Tich 135 m2 3 phÃ²ng ngá»§, 1 phÃ²ng khÃ¡ch, ná»™i tháº¥t cao cáº¥p.', 'cho-thue-can-ho-saigon-pearl-dien-tich-135-m2-3-phong-ngu-1-phong-khach-noi-that-cao-cap', '', '1339985873', '1340204327', '', '1_34430483.jpg&fieldbreak;', 110, 141, 1, 1, 0, 1, 6, 1, 1, 1),
(22, 'BÃ¡n nhÃ  Quáº­n 12 giÃ¡ Æ°u Ä‘Ã£i, khÃ´ng gian thoÃ¡ng mÃ¡t', 'ban-nha-quan-12-gia-uu-dai-khong-gian-thoang-mat', '', '1339986404', '1339986404', '', '1_895303838.jpg&fieldbreak;2_577007389.jpg&fieldbreak;3.jpg&fieldbreak;4.jpg&fieldbreak;5.jpg&fieldbreak;', 111, 147, 1, 1, 0, 1, 6, 1, 1, 1),
(23, 'BÃ¡n khu cÄƒn há»™ cao cáº¥p Era Town â€“ GiÃ¡ tá»‘t â€“ KhÃ´ng gian Ä‘áº¹p', 'ban-khu-can-ho-cao-cap-era-town-â€“-gia-tot-â€“-khong-gian-dep', '', '1339989599', '1340335341', '', '1_352949543.jpg&fieldbreak;2_6455716.jpg&fieldbreak;3_1199687108.jpg&fieldbreak;4_93644975.jpg&fieldbreak;', 110, 148, 1, 1, 0, 1, 6, 1, 1, 1),
(24, 'Cho thuÃª cÄƒn há»™ saigon pearl', 'cho-thue-can-ho-saigon-pearl', '', '1340417834', '1340417834', '', '1_73647098.jpg&fieldbreak;6.jpg&fieldbreak;2_716139185.jpg&fieldbreak;3_899014019.jpg&fieldbreak;4_905432633.jpg&fieldbreak;5_902204775.jpg&fieldbreak;', 122, 149, 1, 1, 0, 1, 6, 1, 1, 1),
(26, 'bÃ¡n nhÃ  Ä‘Æ°á»ng sá»‘ 10,P15,Q gÃ² váº¥p giÃ¡ ráº»', 'ban-nha-duong-so-10-p15-q-go-vap-gia-re', '', '1340418207', '1340418324', '', '1_1004271861.JPG&fieldbreak;6_1189818026.JPG&fieldbreak;2_119690448.JPG&fieldbreak;3_1156797412.JPG&fieldbreak;4_965537569.JPG&fieldbreak;5_387083210.JPG&fieldbreak;', 111, 151, 1, 1, 0, 1, 6, 1, 1, 1),
(27, 'bÃ¡n nhÃ  phÆ°á»ng 10 quáº­n tÃ¢n bÃ¬nh giÃ¡ 550tr', 'ban-nha-phuong-10-quan-tan-binh-gia-550tr', '', '1340420488', '1340420488', '', '1_531372159.jpg&fieldbreak;2_591365790.jpg&fieldbreak;3_273069341.jpg&fieldbreak;4_1044527328.jpg&fieldbreak;5_923612521.jpg&fieldbreak;', 111, 152, 1, 0, 0, 1, 6, 1, 1, 1),
(28, 'BÃN CÄ‚N Há»˜ HARMONA -Thanh NiÃªn Corp-chiáº¿t kháº¥u cao nháº¥t', 'ban-can-ho-haRmona-thanh-nien-corp-chiet-khau-cao-nhat', '', '1340538458', '1340538458', '', '1_705157049.jpg&fieldbreak;2_461806261.jpg&fieldbreak;4_816091468.jpg&fieldbreak;5_434128309.jpg&fieldbreak;3_724598399.jpg&fieldbreak;', 110, 153, 1, 0, 0, 1, 6, 1, 1, 1),
(29, 'bÃ¡n Ä‘áº¥t máº·t tiá»n liÃªn tá»‰nh lá»™ 25B giÃ¡ tá»‘t nháº¥t', 'ban-dat-mat-tien-lien-tinh-lo-25b-gia-tot-nhat', '', '1340538681', '1340538681', '', '1_529331559.jpg&fieldbreak;', 113, 154, 1, 0, 0, 1, 6, 1, 1, 1),
(30, 'Cáº¦N BÃN CÄ‚N Há»˜ HARMONA giáº£m giÃ¡ cá»±c tá»‘t tá»« chá»§ Ä‘áº§u tÆ°', 'can-ban-can-ho-haRmona-giam-gia-cuc-tot-tu-chu-dau-tu', '', '1340678387', '1340678387', '', '1_494381652.jpg&fieldbreak;7_757544808.jpg&fieldbreak;2_625202643.jpg&fieldbreak;4_10091694.jpg&fieldbreak;5_38326173.jpg&fieldbreak;6_361445858.jpg&fieldbreak;', 110, 155, 1, 0, 0, 1, 6, 1, 1, 1),
(31, 'BÃ¡n nhÃ  Quáº­n 12 giÃ¡ ráº», khÃ´ng gian Ä‘áº¹p', 'ban-nha-quan-12-gia-re-khong-gian-dep', '', '1340678606', '1340678606', '', '1_381666346.jpg&fieldbreak;2_287168029.jpg&fieldbreak;3_833640626.jpg&fieldbreak;4_200423992.jpg&fieldbreak;5_230736172.jpg&fieldbreak;', 111, 156, 1, 0, 0, 1, 6, 1, 1, 1),
(32, 'Cho thuÃª cÄƒn há»™ HÃ¹ng VÆ°Æ¡ng Plaza quáº­n 5 giÃ¡ 16tr/thÃ¡ng', 'cho-thue-can-ho-hung-vuong-plaza-quan-5-gia-16tr-thang', '', '1340678923', '1340678923', '', '1_1177648631.jpg&fieldbreak;2_160947663.jpg&fieldbreak;3_334918062.jpg&fieldbreak;4_282567405.jpg&fieldbreak;', 122, 157, 1, 0, 0, 1, 6, 1, 1, 1),
(33, 'BÃN CÄ‚N Há»˜ 300 TR/CÄ‚N Q.12, TP.HCM', 'ban-can-ho-300-tR-can-q-12-tp-hcm', '', '1340680596', '1340680596', '', '1_420771656.jpg&fieldbreak;3_28568396.jpg&fieldbreak;5_190666215.jpg&fieldbreak;', 110, 158, 1, 0, 0, 1, 6, 1, 1, 1),
(34, 'Cáº¦N BÃN CÄ‚N Há»˜ HARMONA giÃ¡ ráº» vá»‹ trÃ­ Ä‘áº¹p', 'can-ban-can-ho-haRmona-gia-re-vi-tri-dep', '', '1340680836', '1340680836', '', '1_59956530.jpg&fieldbreak;6_610584529.jpg&fieldbreak;2_734244870.jpg&fieldbreak;3_896936318.jpg&fieldbreak;4_526994145.jpg&fieldbreak;5_228139046.jpg&fieldbreak;', 110, 159, 1, 0, 0, 1, 6, 1, 1, 1),
(35, 'BÃ¡n cÄƒn há»™ chung cÆ° Má»¹ PhÆ°á»›c quáº­n BÃ¬nh Tháº¡nh giÃ¡ 1,1ty/cÄƒn', 'ban-can-ho-chung-cu-my-phuoc-quan-binh-thanh-gia-1-1ty-can', '', '1340681231', '1340681231', '', '5_864064112.jpg&fieldbreak;2_705157049.jpg&fieldbreak;7_461806261.jpg&fieldbreak;2_816091468.jpg&fieldbreak;', 110, 160, 1, 0, 0, 1, 6, 1, 1, 1),
(36, 'cho thuÃª nhÃ  nguyÃªn cÄƒn giÃ¡ 7tr ngay ngÃ£ tÆ° láº¡c long quÃ¢n Ã¢u cÆ¡', 'cho-thue-nha-nguyen-can-gia-7tr-ngay-nga-tu-lac-long-quan-au-co', '', '1340681680', '1340681680', '', '3_927693720.jpg&fieldbreak;4_441251857.jpg&fieldbreak;1_285312939.jpg&fieldbreak;6_61551907.jpg&fieldbreak;', 123, 161, 1, 0, 0, 1, 6, 1, 1, 1),
(37, 'BÃ¡n cÄƒn há»™ HoÃ ng Anh Gia Lai 2 Ä‘Æ°á»ng Tráº§n XuÃ¢n Soáº¡n quáº­n 7 giÃ¡ 1,6ty', 'ban-can-ho-hoang-anh-gia-lai-2-duong-tran-xuan-soan-quan-7-gia-1-6ty', '', '1340681961', '1340681961', '', '1_1031430388.jpg&fieldbreak;2_578825377.jpg&fieldbreak;3_159908812.jpg&fieldbreak;4_145698818.jpg&fieldbreak;', 110, 162, 1, 0, 0, 1, 6, 1, 1, 1),
(38, 'BÃ¡ncÄƒn há»™ An HÃ²a Khu Nam long quáº­n 7 ', 'bancan-ho-an-hoa-khu-nam-long-quan-7', '', '1340682283', '1340682283', '', '4_553410636.jpg&fieldbreak;3_524063102.jpg&fieldbreak;2_953442378.jpg&fieldbreak;5_702374413.jpg&fieldbreak;1_519425376.jpg&fieldbreak;', 110, 163, 1, 0, 0, 1, 6, 1, 1, 1),
(39, 'BÃ¡n Ä‘áº¥t Quáº­n Thá»§ Äá»©c giÃ¡ ráº»', 'ban-dat-quan-thu-duc-gia-re', '', '1340684207', '1340684207', '', 'e3.jpg&fieldbreak;', 113, 164, 1, 0, 0, 1, 6, 1, 1, 1),
(40, 'BÃ¡n nhÃ  quáº­n 7 háº»m xe hÆ¡i Nguyá»…n Thá»‹ Tháº­p giÃ¡ 3,3ty ', 'ban-nha-quan-7-hem-xe-hoi-nguyen-thi-thap-gia-3-3ty', '', '1340684439', '1340684439', '', '1_1211559688.jpg&fieldbreak;2_172004003.jpg&fieldbreak;3_1046159808.jpg&fieldbreak;4_873599278.jpg&fieldbreak;5_53834730.jpg&fieldbreak;', 111, 165, 1, 0, 0, 1, 6, 1, 1, 1),
(41, 'giáº£m giÃ¡ cá»±c sá»‘c-bÃ¡n cÄƒn há»™ harmona tÃ¢n bÃ¬nh', 'giam-gia-cuc-soc-ban-can-ho-harmona-tan-binh', '', '1340684576', '1340684576', '', '5_898939816.jpg&fieldbreak;3_631398646.jpg&fieldbreak;1_400514066.jpg&fieldbreak;4_593925815.jpg&fieldbreak;', 110, 166, 1, 0, 0, 1, 6, 1, 1, 1),
(42, 'Cáº§n bÃ¡n cÄƒn há»™ Vstar quáº­n 7 giÃ¡ 1,9ty', 'can-ban-can-ho-vstar-quan-7-gia-1-9ty', '', '1340684826', '1341512193', '', '1_609100456.jpg&fieldbreak;2_116573895.jpg&fieldbreak;3_589139681.jpg&fieldbreak;4_562315071.jpg&fieldbreak;5_582832373.jpg&fieldbreak;', 110, 167, 1, 0, 0, 1, 6, 16, 6, 1),
(49, 'Central Garden Apartments', 'central-garden-apartments', '', '1341477012', '1341500780', '', 'bt1_686309328.jpg&fieldbreak;bt2_155048475.jpg&fieldbreak;', 116, 175, 1, 0, 0, 1, 7, 16, 7, 7);

-- --------------------------------------------------------

--
-- Table structure for table `kn_productgroup`
--

CREATE TABLE IF NOT EXISTS `kn_productgroup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parents` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '1',
  `meta_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=126 ;

--
-- Dumping data for table `kn_productgroup`
--

INSERT INTO `kn_productgroup` (`id`, `name`, `alias`, `parents`, `level`, `lft`, `rgt`, `publish`, `meta_id`) VALUES
(1, 'Loai BDS', '', 0, 0, 0, 21, 1, 0),
(99, 'Báº¥t Ä‘á»™ng sáº£n bÃ¡n', 'bat-dong-san-ban', 1, 1, 1, 10, 1, 99),
(100, 'Báº¥t Ä‘á»™ng sáº£n cho thuÃª', 'bat-dong-san-mua', 1, 1, 11, 20, 1, 100),
(101, 'Äáº¥t ná»n', 'dat-nen', 100, 2, 18, 19, 1, 101),
(110, 'CÄƒn há»™', 'can-ho', 99, 2, 2, 3, 1, 110),
(111, 'NhÃ  phá»‘', 'nha-pho', 99, 2, 4, 5, 1, 111),
(112, 'VÄƒn phÃ²ng', 'van-phong', 99, 2, 6, 7, 1, 112),
(113, 'Äáº¥t ná»n', 'dat-nen', 99, 2, 8, 9, 1, 113),
(116, 'CÄƒn há»™', 'can-ho', 100, 2, 12, 13, 1, 116),
(117, 'NhÃ  phá»‘', 'nha-pho', 100, 2, 14, 15, 1, 117),
(118, 'VÄƒn phÃ²ng', 'van-phong', 100, 2, 16, 17, 1, 118);

-- --------------------------------------------------------

--
-- Table structure for table `kn_product_detail`
--

CREATE TABLE IF NOT EXISTS `kn_product_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `area` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `bedroom` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `price` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `facility` text COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=52 ;

--
-- Dumping data for table `kn_product_detail`
--

INSERT INTO `kn_product_detail` (`id`, `product_id`, `area`, `bedroom`, `price`, `intro`, `facility`, `address`, `description`) VALUES
(1, 0, 'n1', 'n1', 'n1', '', '', '', '<p>n1</p>'),
(2, 0, 'n1', 'n1', 'n1', '', '', '', '<p>n1</p>'),
(3, 0, 'n1', 'n1', 'n1', '', '', '', '<p>n1</p>'),
(4, 0, '100 sqm', '2', '1000000 USD / m', '', '', '', '<p>Saigon Pearl Unfurnished Apartment in Binh Thanh District, Ho Chi Minh City: 900USD</p>'),
(5, 0, 'asdfas', 'asdf', 'asdf', '', '', '', '<p>asdfasdf</p>'),
(6, 0, '130sqm', '3/2', '2500$/month', '', '', '', '<p>Satra Dat Thanh Apartment on Phan Dang Luu street , in Phu Nhuan district , near center district 1 and near airport . Usable area : 88,38sqm , 2 bedrooms , 2 bathrooms , living room , lovely kitchen , full furnished . Rental/month : 950$ .</p>\r\n<p>Facilities : Swimming pool , gym , coffee bar , security 24/24 hour a day , parking car .</p>'),
(7, 0, '104sqm', '2/2', '2500$/month', '', '', '', '<p>Avalon Apartment for rent in Nguyen Thi Minh Khai Street , District 1 Â .<span>Â Â Usable Area</span>: 104sqm ,Â 9th floor ,2 bedrooms , living room and 2 modern bathrooms ,full furnished .</p>\r\n<p>Takes 5 minutes go to center district 1 and tourist attractions: Reunification Palace, Notre Dame Cathedral, Opera House, Ben Thanh Market .</p>\r\n<p><span>Facilities</span>Â : Cable TV , Sauna , ADSL internet , swimming pool , 24 hours security - Fitness centre , Car parking ,Â <span>Rental</span>Â : 2500$/month .</p>'),
(8, 0, '1050$/ month', '2/2', '112 m2', '', '', '', '<p>Horizon Building - Apartment for rent in district 1: 1050 USD</p>\r\n<p>Horizon Building Located in Tran Quang Khai Street, Tan Dinh, District 1, next to Hai Ba Trung Street and near by many commercial businesses and shopping plazas in center of district 1.</p>\r\n<p>Gross Area: 112m2, comes with 2 bedroom, 2 bathrooms, large kitchen and living room.<br />At your request the unit will be fully furnished with all necessary furniture and appliances.</p>'),
(9, 0, ' 112 sqm', '2 / 2', '1200$/month', '', '', '', '<p>Horizon Apartment for rent in district 1, 11th Floor, 112sqm, price: 1200$ per month, balcony, fully furnished .<br />it''s take 5 min go to Sheraton Hotel and center district 1<br />Feature: air conditioning in living room and bedrooms, washing are...<br />Super market in ground floor. Swimming pool and gym on 2th Floor.<br />Many foreigners living in this building.<br />Rental/month: 1200$/month ( can be negotiate )</p>'),
(10, 0, '100 sqm', '2', '1000000 USD / m', '', '', '', '<p>The He Moi apartment for rent in District 1. Apartment for rent in District 1, HCMC, Usable area is 96sqm,8th floor,price: 900$ per month.</p>\r\n<p>The He Moi Apartments Morden apartment with fully furnished: sofa, aircon, tivi, high-class bed, Wardrobe, microwave, refrigerator, Water heater, shower, standing glass bathtub, Internet, phone, cable television, parking, security 24/24... High floor and great view.</p>\r\n<p>CBD area, great location for foreigner. Conveniently near all types of well-known restaurants,<br />Bars, clubs, stores, shopping centers, spa, etc. Rental: $ 900/month.</p>'),
(11, 0, '', '', '', '', '', '', ''),
(12, 0, '', '', '', '', '', '', ''),
(13, 16, '0', '1', '', '', '', '', '<p>MÃ´ táº£ chi tiáº¿t...</p>'),
(14, 17, '', '', 'ThÆ°Æ¡ng lÆ°á»£ng', 'Cáº§n bÃ¡n chung cÆ° Phan XÃ­ch Long, quáº­n phÃº nhuáº­n giÃ¡ 1,1ty/cÄƒn thÆ°Æ¡ng lÆ°á»£ng', '<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">CÄƒn há»™ cao cáº¥p</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Â </td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>1</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>1</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>40 m<sup>2</sup></td>\r\n<td>Â </td>\r\n</tr>\r\n</tbody>\r\n</table>', ' 17 Phan XÃ­ch Long, quáº­n phÃº nhuáº­n', '<div><span>Cáº§n bÃ¡n chung cÆ° Phan XÃ­ch Long, quáº­n phÃº nhuáº­n giÃ¡ 1,1ty/cÄƒn thÆ°Æ¡ng lÆ°á»£ng</span></div>\r\n<p><span>Â Diá»‡n tÃ­ch 40,5m2, nhÃ  Ä‘Ã£ decor thiáº¿t káº¿ Ä‘áº¹p bao gá»“m 1 phÃ²ng khÃ¡ch, 1 phÃ²ng ngá»§, 1wc..nhÃ  trá»‘ng giao ngay, sá»• há»“ng chÃ­nh chá»§.Â lien he :0938775152, MTG, MTB</span></p>'),
(15, 18, '0', '1', '31 triá»‡u / 1m2', 'BÃ¡n biá»‡t thá»± cao cáº¥p khu trung sÆ¡n, 10x20m, 2 láº§u, sÃ¢n vÆ°á»n giÃ¡ 13 tá»· ... BÃ¡n biá»‡t thá»± cao cáº¥p ven sÃ´ng SG thá»§ Ä‘á»©c ', '<table border="0">\r\n<tbody>\r\n<tr>\r\n<td style="text-align: right;">\r\n<div class="l">MÃ£ sá»‘ báº¥t Ä‘á»™ng sáº£n</div>\r\n</td>\r\n<td>\r\n<div class="r"><strong>13183</strong></div>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="text-align: right;">\r\n<div class="l">Diá»‡n tÃ­ch</div>\r\n</td>\r\n<td>\r\n<div class="r"><strong>10x14 m2</strong></div>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="text-align: right;">\r\n<div class="l">GiÃ¡</div>\r\n</td>\r\n<td><strong>33.360.000 VND / ThÃ¡ng </strong></td>\r\n</tr>\r\n<tr>\r\n<td style="text-align: right;">\r\n<div class="l">\r\n<div class="l">Äá»‹a chá»‰</div>\r\n</div>\r\n</td>\r\n<td>\r\n<div class="r"><strong>189 Hai BÃ  TrÆ°ng, F6, Q3, TP HCM</strong></div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', '96 ÄÆ°á»ng Trá»¥c', '<p>BÃ¡n <a href="../../www.canhosaigon.com.vn/?p=item">cÄƒn há»™ cao cáº¥p Tháº¿ Há»‡ Má»›i</a> Ä‘Æ°á»ng Há»“ Háº£o Há»›n, quáº­n 1 DT 90m2, 3ty Gáº§n trÆ°á»ng, bá»‡nh viá»‡n. CÃ¡ch chá»£ Báº¿n ThÃ nh 10 phÃºt. CÃ¡ch Ä‘áº¡i lá»™ ÄÃ´ng TÃ¢y 30m. Ngay khu trung tÃ¢m thÃ nh phá»‘ quáº­n 1. Khu an ninh. Tiá»‡n á»Ÿ, sinh hoáº¡t. Táº·ng thÃªm 4 mÃ¡y láº¡nh, máº·t tiá»n HÆ°á»›ng: ÄÃ´ng Nam, 2pn,2wc. . LiÃªn há»‡: 0938775152</p>'),
(16, 19, '0', '1', '31 triá»‡u / 1m2', 'BÃ¡n biá»‡t thá»± cao cáº¥p khu trung sÆ¡n, 10x20m, 2 láº§u, sÃ¢n vÆ°á»n giÃ¡ 13 tá»· ... BÃ¡n biá»‡t thá»± cao cáº¥p ven sÃ´ng SG thá»§ Ä‘á»©c ', '<table border="0">\r\n<tbody>\r\n<tr>\r\n<td style="text-align: right;">\r\n<div class="l">MÃ£ sá»‘ báº¥t Ä‘á»™ng sáº£n</div>\r\n</td>\r\n<td>\r\n<div class="r"><strong>13183</strong></div>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="text-align: right;">\r\n<div class="l">Diá»‡n tÃ­ch</div>\r\n</td>\r\n<td>\r\n<div class="r"><strong>10x14 m2</strong></div>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="text-align: right;">\r\n<div class="l">GiÃ¡</div>\r\n</td>\r\n<td><strong>33.360.000 VND / ThÃ¡ng </strong></td>\r\n</tr>\r\n<tr>\r\n<td style="text-align: right;">\r\n<div class="l">\r\n<div class="l">Äá»‹a chá»‰</div>\r\n</div>\r\n</td>\r\n<td>\r\n<div class="r"><strong>189 Hai BÃ  TrÆ°ng, F6, Q3, TP HCM</strong></div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', '96 ÄÆ°á»ng Trá»¥c', '<p>BÃ¡n <a href="../../www.canhosaigon.com.vn/?p=item">cÄƒn há»™ cao cáº¥p Tháº¿ Há»‡ Má»›i</a> Ä‘Æ°á»ng Há»“ Háº£o Há»›n, quáº­n 1 DT 90m2, 3ty Gáº§n trÆ°á»ng, bá»‡nh viá»‡n. CÃ¡ch chá»£ Báº¿n ThÃ nh 10 phÃºt. CÃ¡ch Ä‘áº¡i lá»™ ÄÃ´ng TÃ¢y 30m. Ngay khu trung tÃ¢m thÃ nh phá»‘ quáº­n 1. Khu an ninh. Tiá»‡n á»Ÿ, sinh hoáº¡t. Táº·ng thÃªm 4 mÃ¡y láº¡nh, máº·t tiá»n HÆ°á»›ng: ÄÃ´ng Nam, 2pn,2wc. . LiÃªn há»‡: 0938775152</p>'),
(17, 7, '0', '1', '31 triá»‡u / 1m2', 'BÃ¡n biá»‡t thá»± cao cáº¥p khu trung sÆ¡n, 10x20m, 2 láº§u, sÃ¢n vÆ°á»n giÃ¡ 13 tá»· ... BÃ¡n biá»‡t thá»± cao cáº¥p ven sÃ´ng SG thá»§ Ä‘á»©c ', '<table border="0">\r\n<tbody>\r\n<tr>\r\n<td style="text-align: right;">\r\n<div class="l">MÃ£ sá»‘ báº¥t Ä‘á»™ng sáº£n</div>\r\n</td>\r\n<td>\r\n<div class="r"><strong>13183</strong></div>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="text-align: right;">\r\n<div class="l">Diá»‡n tÃ­ch</div>\r\n</td>\r\n<td>\r\n<div class="r"><strong>10x14 m2</strong></div>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td style="text-align: right;">\r\n<div class="l">GiÃ¡</div>\r\n</td>\r\n<td><strong>33.360.000 VND / ThÃ¡ng </strong></td>\r\n</tr>\r\n<tr>\r\n<td style="text-align: right;">\r\n<div class="l">\r\n<div class="l">Äá»‹a chá»‰</div>\r\n</div>\r\n</td>\r\n<td>\r\n<div class="r"><strong>189 Hai BÃ  TrÆ°ng, F6, Q3, TP HCM</strong></div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', '96 ÄÆ°á»ng Trá»¥c', '<p>BÃ¡n <a href="../../www.canhosaigon.com.vn/?p=item">cÄƒn há»™ cao cáº¥p Tháº¿ Há»‡ Má»›i</a> Ä‘Æ°á»ng Há»“ Háº£o Há»›n, quáº­n 1 DT 90m2, 3ty Gáº§n trÆ°á»ng, bá»‡nh viá»‡n. CÃ¡ch chá»£ Báº¿n ThÃ nh 10 phÃºt. CÃ¡ch Ä‘áº¡i lá»™ ÄÃ´ng TÃ¢y 30m. Ngay khu trung tÃ¢m thÃ nh phá»‘ quáº­n 1. Khu an ninh. Tiá»‡n á»Ÿ, sinh hoáº¡t. Táº·ng thÃªm 4 mÃ¡y láº¡nh, máº·t tiá»n HÆ°á»›ng: ÄÃ´ng Nam, 2pn,2wc. . LiÃªn há»‡: 0938775152</p>'),
(18, 20, '0', '1', '100 tr / 1 m2', 'Tiá»‡n Ã­ch. cáº¥u trÃºc...Tiá»‡n Ã­ch. cáº¥u trÃºc...Tiá»‡n Ã­ch. cáº¥u trÃºc...Tiá»‡n Ã­ch. cáº¥u trÃºc...', '<p>Tiá»‡n Ã­ch. cáº¥u trÃºc...</p>', '96 Nguyá»…n Huá»‡', '<p>MÃ´ táº£ chi tiáº¿t...</p>'),
(19, 21, '0', '1', '30 triá»‡u/m2', '', '<p>Tiá»‡n Ã­ch. cáº¥u trÃºc...</p>\r\n<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">CÄƒn há»™ cao cáº¥p</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Â </td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>33</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>3</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>_</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>135 m<sup>2</sup></td>\r\n<td>Â </td>\r\n</tr>\r\n</tbody>\r\n</table>', '', '<p><span>Cho thuÃª cÄƒn há»™ saigon pearl, Ruby 2 láº§u 33 - 06 Diá»‡n Tich 135 m2 3 phÃ²ng ngá»§, 1 phÃ²ng khÃ¡ch, ná»™i tháº¥t cao cáº¥p. view quáº­n 1, giÃ¡ 1600 usd. LH 0908.550813</span></p>'),
(20, 22, '0', '1', 'ThÆ°Æ¡ng lÆ°á»£ng', '', '<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">Báº¥t Ä‘á»™ng sáº£n khÃ¡c</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Sá»• há»“ng</td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>4</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>1</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>5 x 15 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>75 m<sup>2</sup></td>\r\n<td>Â </td>\r\n</tr>\r\n</tbody>\r\n</table>', '', '<div>Â </div>\r\n<div>Diá»‡n tÃ­ch: 5x15 m2</div>\r\n<div>NhÃ  gá»“m 1 phÃ²ng khÃ¡ch, 1 phÃ²ng ngá»§, 1 toilet, 1 phong báº¿p + phÃ²ng Äƒn</div>\r\n<div>Diá»‡n tÃ­ch nhÃ  trÆ°á»›c cÃ³ thá»ƒ lÃ m khu cho cÃ´ng nhÃ¢n may</div>\r\n<div>Äáº·c biá»‡t: phÃ­a sau nhÃ  cÃ²n Ä‘áº¥t trá»‘ng rá»™ng khoáº£ng 20 m2 cÃ³ thá»ƒ trá»“ng cÃ¢y, rau Äƒn quáº£â€¦</div>\r\n<div>GiÃ¡ 1 tá»· bao san sá»•</div>'),
(21, 23, '0', '1', '15 triá»‡u / m2', 'BÃ¡n khu cÄƒn há»™ cao cáº¥p Era Town â€“ GiÃ¡ tá»‘t â€“ KhÃ´ng gian Ä‘áº¹p', '<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">CÄƒn há»™ cao cáº¥p</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Sá»• há»“ng</td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>8</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>4</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>85 m<sup>2</sup></td>\r\n<td>Â </td>\r\n</tr>\r\n</tbody>\r\n</table>', ' Ä‘áº¡i lá»™ Nguyá»…n LÆ°Æ¡ng Báº±ng', '<p>Â <strong>1. Â Vá»‹ trÃ­ thuáº­n lá»£iÂ </strong></p>\r\n<p>Â - TrÃªn máº·t tiá»n Ä‘áº¡i lá»™ Nguyá»…n LÆ°Æ¡ng Báº±ng ná»‘i dÃ i (lá»™ giá»›i 60m)</p>\r\n<p>Â - Ká» vá»›i trung tÃ¢m hÃ nh chÃ­nh cá»§a quáº­n 7Â <br />Â - LÃ  cáº§u ná»‘i trá»±c tiáº¿p Ä‘áº¿n khu Ä‘Ã´ thá»‹ PhÃº Má»¹ HÆ°ng.Â <strong></strong></p>\r\n<p><strong>2. Phong thá»§y</strong></p>\r\n<p>Â Â Â  Vá»›i ba máº·t cá»§a khuÃ´n viÃªn khu Ä‘áº¥t dá»± Ã¡n Ä‘Æ°á»£c bao bá»c bá»Ÿi dÃ²ng sÃ´ng PhÃº XuÃ¢n uá»‘n lÆ°á»£n Ãªm Ä‘á»m nhÆ° vÃ²ng tay Ã´m áº¥p, che chá»Ÿ. Thá»ƒ hiá»‡n cuá»™c sá»‘ng cá»§a sá»± an bÃ¬nh, mang tÃ­nh phong thuá»·. LÃ Â bÃ£i Ä‘áº¥t bá»“i bá»Ÿi phÃ¹ sa phÃ¬ nhiÃªu nhÆ° sá»± ban táº·ng tá»« thiÃªn nhiÃªn cho nhá»¯ng chá»§ nhÃ¢n cÄƒn há»™ trÃªn khu Ä‘áº¥t, thá»ƒ hiá»‡n sá»± may máº¯n, thá»‹nh vÆ°á»£ng, mang tÃ­nh phong thuá»·.<strong></strong></p>\r\n<p><strong>3.Â Dá»‹ch vá»¥ vÃ  tiá»‡n Ã­ch</strong></p>\r\n<p>Â Â Â  Trong khuÃ´n viÃªn dá»± Ã¡n cÃ³ Ä‘áº§y Ä‘á»§ cÃ¡c tiá»‡n Ã­ch vÃ  dá»‹ch vá»¥ nhÆ°: nhÃ  tráº», trÆ°á»ng tiá»ƒu há»c vÃ  trung há»c, siÃªu thá»‹, nhÃ  hÃ ng, dá»‹ch vá»¥ y tÃª, trung tÃ¢m thá»ƒ thao, há»“ bÆ¡i, khu sinh hoáº¡t cá»™ng Ä‘á»“ng.<strong>Â </strong><strong></strong></p>\r\n<p><strong>4. GiÃ¡ tá»‘t nháº¥t Quáº­n 7</strong><br />Â Â  GiÃ¡ bÃ¡n vÃ´ cÃ¹ng Æ°u Ä‘Ã£i chá»‰ tá»« 14,5 â€“ 16 triá»‡u Ä‘á»“ng/m2. Tiáº¿n Ä‘á»™ thanh toÃ¡n cá»±c ká»³ linh hoáº¡t, thanh toÃ¡n 60% nháº­n nhÃ .<strong></strong></p>\r\n<p><strong>5. Diá»‡n tÃ­ch Ä‘a dáº¡ng, nhiá»u lá»±a chá»n</strong><br />Â Â  Tá»« 67- 318m2. Theo Ä‘Ã³, má»—i cÄƒn há»™ sáº½ cÃ³ giÃ¡ khoáº£ng 950 triá»‡u trá»Ÿ lÃªn vÃ  Ä‘Æ°á»£c sá»Ÿ há»¯u vÄ©nh viá»…n.</p>\r\n<p><strong>6. TÃ¬m nÄƒng</strong><br />Â Â  Vá»›i lá»£i tháº¿ hÆ¡n háº³n vá» vá»‹ trÃ­ vÃ  giÃ¡ cáº£ so vá»›i cÃ¡c dá»± Ã¡n khÃ¡c trong khu vá»±c, dá»± Ã¡n Ä‘Æ°á»£c giá»›i chuyÃªn mÃ´n Ä‘Ã¡nh giÃ¡ ráº¥t cao vá» giÃ¡ trá»‹.Â <br />Â Â  Khu cÄƒn há»™ Era Town thá»±c sá»± lÃ  lá»±a chá»n tá»‘t nháº¥t cho nhá»¯ng khÃ¡ch hÃ ng Ä‘ang cÃ³ Ã½ Ä‘á»‹nh Ä‘áº§u tÆ° cÅ©ng nhÆ° tÃ¬m cho mÃ¬nh má»™t khÃ´ng gian sá»‘ng má»›i vá»›i nhá»¯ng tráº£i nghiá»‡m hoÃ n háº£o nháº¥tÂ </p>'),
(22, 24, '0', '1', ' 1.600 USD	 / ThÃ¡ng', 'Cho thuÃª cÄƒn há»™ saigon pearl, Diá»‡n Tich 135 m2 3 phÃ²ng ngá»§, 1 phÃ²ng khÃ¡ch, ná»™i tháº¥t cao cáº¥p.', '<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">CÄƒn há»™ cao cáº¥p</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Â </td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>33</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>3</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>_</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>135 m<sup>2</sup></td>\r\n<td>Â </td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Nguyá»…n Há»¯u Cáº£nh - phÆ°á»ng 26 - BÃ¬nh Tháº¡nh - thÃ nh phá»‘ Há»“ ChÃ­ Minh', '<p><span>Cho thuÃª cÄƒn há»™ saigon pearl, Ruby 2 láº§u 33 - 06 Diá»‡n Tich 135 m2 3 phÃ²ng ngá»§, 1 phÃ²ng khÃ¡ch, ná»™i tháº¥t cao cáº¥p. view quáº­n 1, giÃ¡ 1600 usd. LH 0908.550813</span></p>'),
(23, 25, '0', '1', ' 1.600 USD	 / ThÃ¡ng', 'Cho thuÃª cÄƒn há»™ saigon pearl, Diá»‡n Tich 135 m2 3 phÃ²ng ngá»§, 1 phÃ²ng khÃ¡ch, ná»™i tháº¥t cao cáº¥p.', '<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">CÄƒn há»™ cao cáº¥p</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Â </td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>33</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>3</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>_</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>135 m<sup>2</sup></td>\r\n<td>Â </td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Nguyá»…n Há»¯u Cáº£nh - phÆ°á»ng 26 - BÃ¬nh Tháº¡nh - thÃ nh phá»‘ Há»“ ChÃ­ Minh', '<p><span>Cho thuÃª cÄƒn há»™ saigon pearl, Ruby 2 láº§u 33 - 06 Diá»‡n Tich 135 m2 3 phÃ²ng ngá»§, 1 phÃ²ng khÃ¡ch, ná»™i tháº¥t cao cáº¥p. view quáº­n 1, giÃ¡ 1600 usd. LH 0908.550813</span></p>'),
(24, 26, '0', '1', '3 tá»· 400 triá»‡u', 'BÃ¡n nhÃ  Ä‘Æ°á»ng sá»‘ 10 phÆ°á»ng 15 quáº­n gÃ² váº¥p\r\nDT 5m31x 22m ná»Ÿ háº­u 6m31 DTSH = 122,5m2 giÃ¡ 3tá»·4', '<p>Â </p>\r\n<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">Báº¥t Ä‘á»™ng sáº£n khÃ¡c</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Sá»• há»“ng</td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>_</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>122 m<sup>2</sup></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><span style="font-size: small;"><br /></span></p>', ' Ä‘Æ°á»ng sá»‘ 10 P15 Q gÃ² váº¥p - phÆ°á»ng - GÃ² Váº¥p - thÃ nh phá»‘ Há»“ ChÃ­ Minh', '<p>BÃ¡n nhÃ  Ä‘Æ°á»ng sá»‘ 10 phÆ°á»ng 15 quáº­n gÃ² váº¥p</p>\r\n<p>DT 5m31x 22m ná»Ÿ háº­u 6m31 DTSH = 122,5m2 giÃ¡ 3tá»·4</p>\r\n<p>Tel : 0934.114.152 quá»‘c tiáº¿n</p>'),
(25, 27, '0', '1', '550 triá»‡u', 'BÃ¡n nhÃ  Ä‘Æ°á»ng tráº§n vÄƒn quang, phÆ°á»ng 10, quáº­n tÃ¢n bÃ¬nh giÃ¡ ráº»\r\nDT 3 x4,5 giÃ¡ 550 Ä‘á»• 2 táº¥m giáº£ 4PN,1WC,1 nhÃ  báº¿p ( háº»m 2m)\r\n\r\nCÃ¡ch ngÃ£ tÆ° báº£y hiá»n 2km, cÃ¡ch Ä‘Æ°Æ¡ng láº¡c long quÃ¢n 600m', '<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">Báº¥t Ä‘á»™ng sáº£n khÃ¡c</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Sá»• há»“ng</td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>_</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>122 m<sup>2</sup></td>\r\n</tr>\r\n</tbody>\r\n</table>', 'tráº§n vÄƒn quang - phÆ°á»ng 10 - Quáº­n TÃ¢n BÃ¬nh - thÃ nh phá»‘ Há»“ ChÃ­ Minh', '<p>Â BÃ¡n nhÃ  Ä‘Æ°á»ng sá»‘ 10 phÆ°á»ng 15 quáº­n gÃ² váº¥p</p>\r\n<p>DT 5m31x 22m ná»Ÿ háº­u 6m31 DTSH = 122,5m2 giÃ¡ 3tá»·4</p>\r\n<p>Tel : 0934.114.152 quá»‘c tiáº¿n</p>'),
(26, 28, '0', '1', 'ThÆ°Æ¡ng lÆ°á»£ng', 'Khu cÄƒn há»™ cao cáº¥p The Harmona. Tá»a láº¡c vá»‹ trÃ­ Ä‘áº¯c Ä‘á»‹a ngay trung tÃ¢m Quáº­n TÃ¢n BÃ¬nh.', '<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">CÄƒn há»™ cao cáº¥p</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Â </td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>_</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>76 m<sup>2</sup></td>\r\n<td>Â </td>\r\n</tr>\r\n</tbody>\r\n</table>', ' 33 - trÆ°Æ¡ng cÃ´ng Ä‘á»‹nh - phÆ°á»ng 14 - Quáº­n TÃ¢n BÃ¬nh - thÃ nh phá»‘ Há»“ ChÃ­ Minh', '<p>Khu cÄƒn há»™ cao cáº¥pÂ <strong>The Harmona</strong>. Tá»a láº¡c vá»‹ trÃ­ Ä‘áº¯c Ä‘á»‹a ngay trung tÃ¢m Quáº­n TÃ¢n BÃ¬nh.</p>\r\n<p>CHá»¦ Äáº¦U TÆ¯: CÃ”NG TY CP THANH NIÃŠN</p>\r\n<p>BÃN CÄ‚N Há»˜ HARMONA, 33 TRÆ¯Æ NG CÃ”NG Äá»ŠNH, P14,TÃ‚N BÃŒNH</p>\r\n<p>- Khu CÄƒn há»™Â Â Harmona gá»“m 3 Block cÄƒn há»™, má»—i block cao 18 táº§ng, gá»“m 569 cÄƒn.<br />- CÃ´ng nÄƒng: Trung tÃ¢m thÆ°Æ¡ng máº¡i vÃ  cÄƒn há»™<br />- CÃ¡c cÃ´ng trÃ¬nh phá»¥ gá»“m: há»“ bÆ¡i, cÃ´ng viÃªn, cÃ¢y xanh<br />- Thá»i gian thá»±c hiá»‡n xÃ¢y dá»±ng lÃ  36 thÃ¡ng báº¯t Ä‘áº§u tá»« thÃ¡ng 12/2009 vÃ  káº¿t thÃºc vÃ o thÃ¡ng 12/2012<br />- Diá»‡n tÃ­ch cÄƒn há»™: tá»« 49 â€“ 100m2, má»—i cÄƒn gá»“m tá»« 1-3 phÃ²ng ngá»§<br />- Diá»‡n tÃ­ch khuÃ´n viÃªn: 9137m2<br />- Máº­t Ä‘á»™ xÃ¢y dá»±ng: 43%<br />- Sá»‘ táº§ng cao: 19 táº§ng<br />- Tá»•ng sá»‘ cÄƒn há»™: 569 cÄƒn<br />- Bao gá»“m 3 block: A, B, C<br /><br />Má»—i cÄƒn há»™ Harmona Ä‘á»u cÃ³ phÃ²ng khÃ¡ch, phÃ²ng Äƒn, báº¿p, nhÃ  vá»‡ sinh vÃ  phÃ²ng ngá»§, Ä‘Æ°á»£c trang bá»‹ nhá»¯ng thiáº¿t bá»‹ hiá»‡n Ä‘áº¡i. CÃ¡c cÄƒn há»™ Harmona Ä‘á»u cÃ³ hai máº·t thÃ´ng thoÃ¡ng, tÄƒng diá»‡n tiáº¿p xÃºc vá»›i khÃ´ng gian bÃªn ngoÃ i, giÃºp háº¥p thu tá»‘t nháº¥t Ã¡nh sang tá»± nhiÃªn. KhÃ´ng chá»‰ thá»¥ hÆ°á»Ÿng nhá»¯ng tiá»‡n Ã­ch cÃ³ trong cao á»‘c, cÆ° dÃ¢n cá»§a cÄƒn há»™ Harmona cÃ²n Ä‘Æ°á»£c thá»¥ hÆ°á»Ÿng nhá»¯ng tiá»‡n Ã­ch xung quanh nhÆ° cÃ´ng viÃªn, trÆ°á»ng há»c, khu thá»ƒ thao, trung tÃ¢m vÄƒn hÃ³a... Háº¡ táº§ng ká»¹ thuáº­t Ä‘Æ°á»£c Ä‘áº§u tÆ° Ä‘á»“ng bá»™ Ä‘áº£m báº£m cuá»™c sá»‘ng tiá»‡n nghi cho cÆ° dÃ¢n, cÃ¡c há»‡ thá»‘ng Ä‘iá»‡n, Ä‘iá»‡n thoáº¡i, cáº¥p thoÃ¡t nÆ°á»›c Ä‘áº¡t tiÃªu chuáº©n cá»§a má»™t Ä‘Ã´ thá»‹ hiá»‡n Ä‘áº¡i.<br />Dá»± Ã¡n cÄƒn há»™ Harmona thuá»™c khu vá»±c Ä‘Ã£ Ä‘Æ°á»£c quy hoáº¡ch thÃ nh khu trung tÃ¢m hÃ nh chÃ­nh, trung tÃ¢m thÆ°Æ¡ng máº¡i dá»‹ch vá»¥ vÃ  khu dÃ¢n cÆ° cá»§a quáº­n TÃ¢n BÃ¬nh, náº±m gáº§n sÃ¢n bay TÃ¢n SÆ¡n Nháº¥t (khoáº£ng 2.5 km), cÃ¡ch trung tÃ¢m thÃ nh phá»‘ chá»‰ 4km, gáº§n CÃ´ng viÃªn HoÃ ng VÄƒn Thá»¥, sÃ¢n váº­n Ä‘á»™ng QuÃ¢n Khu 7, gáº§n bá»‡nh viá»‡n, trung tÃ¢m thÆ°Æ¡ng máº¡i quá»‘c táº¿ nhÆ° Parkson, Citimart,.. Vá»›i lá»£i tháº¿ trÃªn, cÄƒn há»™ Harmona khÃ´ng nhá»¯ng lÃ  nÆ¡i an cÆ° lÃ½ tÆ°á»Ÿng hiá»‡n nay mÃ  cáº£ trong tÆ°Æ¡ng lai. CÃ´ng trÃ¬nh do cÃ´ng ty TNHH Ong &amp; Ong thiáº¿t káº¿ theo kiáº¿n trÃºc hiá»‡n Ä‘áº¡i vÃ  sang trá»ng.<br />Táº§ng háº§m Ä‘áº£m báº£o khÃ´ng gian Ä‘á»ƒ xe cÅ©ng nhÆ° bá»‘ trÃ­ há»‡ thá»‘ng háº¡ táº§ng ká»¹ thuáº­t, nháº±m Ä‘Ã¡p á»©ng tá»‘t nháº¥t cÃ¡c nhu cáº§u vá» tiá»‡n Ã­ch cÃ´ng cá»™ng.<br />Táº§ng má»™t lÃ m trung tÃ¢m thÆ°Æ¡ng máº¡i, dá»‹ch vá»¥,phÃ²ng thá»ƒ hÃ¬nh, chÄƒm sÃ³c sá»©c khoáº», sinh hoáº¡t cá»™ng Ä‘á»“ng<br />HoÃ n thÃ nh vÃ o thÃ¡ng 9/2012</p>\r\n<p>Â </p>\r\n<p><strong>ChÆ°Æ¡ng trÃ¬nh khuyáº¿n mÃ£i: CHIáº¾T KHáº¤U CAO NHáº¤T THá»Š TRÆ¯á»œNG</strong></p>\r\n<p><strong>Thanh toÃ¡n theo tiáº¿n Ä‘á»™ cÃ´ng trÃ¬nh linh hoáº¡t vá»›i tá»«ng Ä‘á»‘i tÆ°á»£ng khÃ¡ch hÃ ng.</strong></p>\r\n<p>Â </p>\r\n<p><strong>CHá»¦ Äáº¦U TÆ¯ Dá»° ÃN CTY CP THANH NIÃŠN</strong></p>\r\n<p><strong>Äá»‹a chá»‰: 391 TrÆ°á»ng Chinh, p14, qTB</strong></p>\r\n<p><strong>HOTLINE: 0989 840 246 â€“ Ms.Thanh Loan Ä‘á»ƒ chá»n Ä‘Æ°á»£c cÄƒn há»™ Æ°ng Ã½ nháº¥t.</strong></p>'),
(27, 29, '0', '1', '35 triá»‡u / m2', 'Xuáº¥t cáº£nh bÃ¡n gáº¥p Ä‘áº¥t thá»• cÆ° Máº¶T TIá»€N Ä‘Æ°á»ng tá»‰nh lá»™ 25B, káº¿ bÃªn Ä‘áº¥t dá»± Ã¡n tháº¿ ká»· 21,DT 20x30, giÃ¡ ráº» 35tr/m2,(Sá»” Äá»Ž).', '<p>Â </p>\r\n<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">Báº¥t Ä‘á»™ng sáº£n khÃ¡c</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Sá»• há»“ng</td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>_</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>20 x 30 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>60 m</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>600 m<sup>2</sup></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><span style="font-size: small;"><br /></span></p>', 'tá»‰nh lá»™ 25B - phÆ°á»ng thÃ nh má»¹ lá»£i - Quáº­n 2 - thÃ nh phá»‘ Há»“ ChÃ­ Minh', '<p>-Xuáº¥t cáº£nh bÃ¡n gáº¥p Ä‘áº¥t thá»• cÆ° Máº¶T TIá»€N Ä‘Æ°á»ng tá»‰nh lá»™ 25B, káº¿ bÃªn Ä‘áº¥t dá»± Ã¡n tháº¿ ká»· 21,DT 20x30, giÃ¡ ráº» 35tr/m2,(Sá»” Äá»Ž).</p>\r\n<p>-ThuÃ¢n tiá»‡n Ä‘á»ƒ xÃ¢y biá»‡t thá»±, má»Ÿ ngÃ¢n hÃ ng vÃ  lÃ m showroom.</p>\r\n<p>-Káº¿ bÃªn trung tÃ¢m hÃ nh chÃ­nh Q2,trung tÃ¢m thÆ°Æ¡ng máº¡i,ngÃ¢n hÃ ng vÃ  gáº§n trÆ°á»ng cáº¥p 1 cáº¥p 2 cáº¥p 3,nhÃ  tráº».</p>\r\n<p>-CÃ¡ch háº§m thá»§ thiÃªm 6km,chá»‰ 10 phÃºt Ä‘i xe mÃ¡y tá»›iÂ  ngay trung tÃ¢m thÃ nh phá»‘ Há»’ CHÃ MINHÂ  chá»£ báº¿n thÃ nh quáº­n 1.</p>\r\n<p>-Tel: 0934.114.152 A tiáº¿n â€“Â  0916.886.947 A tÃ¹ng</p>\r\n<p>Â </p>'),
(28, 30, '0', '1', 'ThÆ°Æ¡ng lÆ°á»£ng', 'CÄƒn há»™ The Harmona gá»“m 3 block cao 18 táº§ng Ä‘Æ°á»£c thiáº¿t káº¿ hÃ i hÃ²a sang trá»ng theo phong cÃ¡ch Singapore. Má»—i cÄƒn há»™ Harmona Ä‘á»u cÃ³ khÃ´ng gian thÃ´ng thÃ³ang tiáº¿p xÃºc vá»›i mÃ´i trÆ°á»ng bÃªn ngoÃ i.', '<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">CÄƒn há»™ cao cáº¥p</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Â </td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>2</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>2</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>80 m<sup>2</sup></td>\r\n</tr>\r\n</tbody>\r\n</table>', ' 33 - trÆ°Æ¡ng cÃ´ng Ä‘á»‹nh - phÆ°á»ng 14 - Quáº­n TÃ¢n BÃ¬nh - thÃ nh phá»‘ Há»“ ChÃ­ Minh', '<p>CHá»¦ Äáº¦U TÆ¯: CÃ”NG TY CP THANH NIÃŠN</p>\r\n<p>BÃN CÄ‚N Há»˜ HARMONA, 33 TRÆ¯Æ NG CÃ”NG Äá»ŠNH, P14,TÃ‚N BÃŒNH</p>\r\n<p>Chi tiáº¿t tham kháº£o:</p>\r\n<p><strong><a href="http://thanhniencorp.vn/">http://thanhniencorp.vn</a></strong></p>\r\n<p><strong>Xem video:Â </strong><strong><a href="http://www.youtube.com/watch?v=JvWd2-zPHAM\\\\">http://www.youtube.com/watch?v=JvWd2-zPHAM\\\\</a></strong></p>\r\n<p>Hotline 0989 840 246</p>\r\n<p>Â </p>\r\n<p>CÄƒn há»™Â <strong>The Harmona</strong>Â gá»“m 3 block cao 18 táº§ng Ä‘Æ°á»£c thiáº¿t káº¿ hÃ i hÃ²a sang trá»ng theo phong cÃ¡ch Singapore. Má»—i cÄƒn há»™Â <strong>Harmona</strong>Â Ä‘á»u cÃ³ khÃ´ng gian thÃ´ng thÃ³ang tiáº¿p xÃºc vá»›i mÃ´i trÆ°á»ng bÃªn ngoÃ i.</p>\r\n<p><strong>The Harmona</strong>Â Ä‘Æ°á»£c trang bá»‹ ná»™i tháº¥t hiá»‡n Ä‘áº¡i cao cáº¥p, an tÃ²an, há»‡ thá»‘ng phÃ²ng chÃ¡y chá»¯a chÃ¡y ngay trong tá»«ng cÄƒn há»™.</p>\r\n<p>Khu cÄƒn há»™Â <strong>The Harmona</strong>Â vá»›i Ä‘áº§y Ä‘á»§ tiá»‡n Ã­ch nhÆ°: há»“ bÆ¡i, siÃªu thá»‹, nhÃ  giá»¯ tráº», nhÃ  sinh hoáº¡t cá»™ng Ä‘á»“ng, phÃ²ng táº­p thá»ƒ dá»¥câ€¦</p>\r\n<p><strong>The Harmona</strong>Â náº±m ngay khu thÆ°Æ¡ng máº¡i, khu mua sáº¯m, khu giáº£i trÃ­ lá»›n cá»§a thÃ nh phá»‘.</p>\r\n<p>Gáº§n cÃ¡c bá»‡nh viá»‡n, trÆ°á»ng há»c, cÃ´ng viÃªn lá»›n.</p>\r\n<p>Gáº§n khu vÄƒn phÃ²ng ETOWN.</p>\r\n<p><strong>Quy mÃ´ dá»± Ã¡n: gá»“m 3 Blockâ€™ má»—i block 19 táº§ng vá»›i cÃ¡c tiá»‡n Ã­ch bÃªn trong: TT ThÆ°Æ¡ng Máº¡i, há»“ bÆ¡i, cÃ´ng viÃªnâ€¦</strong></p>\r\n<p><strong>Loáº¡i cÄƒn há»™: 1,2,3 phÃ²ng ngá»§ tá»« 49 Ä‘áº¿n 99m2 vá»›i thiáº¿t káº¿ hiá»‡n Ä‘áº¡i cá»§a Singapore mang Ã¡nh sÃ¡ng tá»± nhiÃªn Ä‘áº¿n tá»«ng phÃ²ng trong gia Ä‘Ã¬nh báº¡n.</strong></p>\r\n<p><strong>Tiáº¿n Ä‘á»™ bÃ n giao: ThÃ¡ng 9/2012</strong></p>\r\n<p><strong>Tiáº¿n Ä‘á»™ xÃ¢y dá»±ng: Ä‘ang vÃ o giai Ä‘oáº¡n hoÃ n thiá»‡n ná»™i tháº¥t.</strong></p>\r\n<p><strong>Há»— trá»£ vay NHÂ Â 70% .</strong></p>\r\n<p>Chiáº¿t kháº¥u cho KH Ä‘áº£m báº£o cao nháº¥t thá»‹ trÆ°á»ng</p>\r\n<p>Hiá»‡n táº¡i Ä‘Ã£ cÃ³ cÄƒn há»™ máº«u. KhÃ¡ch hÃ ng cÃ³ nhu cáº§u xem nhÃ  máº«u vui lÃ²ng liÃªnÂ Â há»‡:</p>\r\n<p>Chá»§ Ä‘áº§u tÆ° dá»± Ã¡nÂ The Harmona<span style="text-decoration: underline;">.</span></p>\r\n<p>CÃ´ng ty CP Thanh NiÃªn</p>\r\n<p>391 TrÆ°á»ng Chinh, P14, TÃ¢n BÃ¬nh</p>'),
(29, 31, '0', '1', 'ThÆ°Æ¡ng lÆ°á»£ng', 'khu an ninh, yÃªn tÄ©nh, náº¿u khÃ¡ch hÃ ng cÃ³ nhu cáº§u mua sá»›m chá»§ nhÃ  sáº½ cÃ³ nhiá»u Æ°u Ä‘Ã£i báº¥t ngá».', '<p>Â </p>\r\n<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">Báº¥t Ä‘á»™ng sáº£n khÃ¡c</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Sá»• há»“ng</td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>6</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>2</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>3 x 14 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>49 m<sup>2</sup></td>\r\n<td>Â </td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><span style="font-size: small;"><br /></span></p>', ' CTH 35 - phÆ°á»ng TÃ¢n chÃ¡nh hiá»‡p - Quáº­n 12 - thÃ nh phá»‘ Há»“ ChÃ­ Minh', '<div>ThÃ´ng tin chung:</div>\r\n<div>Diá»‡n tÃ­ch: 3,5x14 m2</div>\r\n<div>NhÃ  gá»“m 1 trá»‡t, 1 láº§u Ä‘Ãºc kiÃªn cá»‘</div>\r\n<div>1 phÃ²ng khÃ¡ch, 1 phÃ²ng Äƒn + báº¿p, 1 phÃ²ng thá»</div>\r\n<div>2 phÃ²ng ngá»§, 2 toilet</div>\r\n<div>Äáº·c biá»‡t: khu an ninh, yÃªn tÄ©nh, náº¿u khÃ¡ch hÃ ng cÃ³ nhu cáº§u mua sá»›m chá»§ nhÃ  sáº½ cÃ³ nhiá»uÂ <strong>Æ°u Ä‘Ã£i báº¥t ngá».</strong></div>\r\n<div>GiÃ¡ 1 tá»· 2 bao san sá»•</div>\r\n<div><strong>ThÃ´ng tin liÃªn há»‡</strong>:Â <strong><span>0988 654 262 ( Mr DÅ©ng )</span></strong></div>'),
(30, 32, '0', '1', '16 triá»‡u / ThÃ¡ng', 'Cho thuÃª cÄƒn há»™ HÃ¹ng VÆ°Æ¡ng Plaza quáº­n 5 giÃ¡ 16tr/thÃ¡ng', '<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">CÄƒn há»™ cao cáº¥p</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Há»£p Ä‘á»“ng</td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>3</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>3</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>121 m<sup>2</sup></td>\r\n<td>Â </td>\r\n</tr>\r\n</tbody>\r\n</table>', '18 hÃ¹ng vÆ°Æ¡ng - phÆ°á»ng 6 - Quáº­n 5 - thÃ nh phá»‘ Há»“ ChÃ­ Minh', '<p><span lang="VI">Cho thuÃª cÄƒn há»™ HÃ¹ng VÆ°Æ¡ng Plaza quáº­n 5 giÃ¡ 16tr/thÃ¡ng Táº§ng cao, cÄƒn gÃ³c, view trÆ°á»ng Ä‘ua, thoÃ¡ng mÃ¡t, dt 121,6m, cÃ³ 4 mÃ¡y láº¡nh, rÃ¨m cá»­a cÃ¡c phÃ²ng, mÃ¡y nÆ°á»›c nÃ³ng, 3pn, 3wc, phÃ²ng khÃ¡ch, báº¿p, ban cÃ´ng.</span><span>LiÃªn há»‡ 0938447390</span></p>'),
(31, 33, '0', '1', '300 triá»‡u', 'BÃN CÄ‚N Há»˜ 300 TRIá»†U NGAY METRO Q.12, TP.HCM', '<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">CÄƒn há»™ chung cÆ°</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Sá»• há»“ng</td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>3</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>6</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>2</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>30 m</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>55 m<sup>2</sup></td>\r\n<td>Â </td>\r\n</tr>\r\n</tbody>\r\n</table>', 'LÃª VÄƒn KhÆ°Æ¡ng, Q.12, TP.HCM - phÆ°á»ng Thá»›i An - Quáº­n 12 - thÃ nh phá»‘ Há»“ ChÃ­ Minh', '<h1 class="title" align="center"><span id="dtx-highlighting-item">BÃNÂ </span>CÄ‚N Há»˜ 300 TRIá»†U</h1>\r\n<h1 class="title" align="center">Â NGAY METRO Q.<span id="dtx-highlighting-item">1</span>2, TP.HCM</h1>\r\n<p class="p_first"><span style="font-size: small;"><span><span><strong>CÄƒn Há»™ Cheery 2 Quáº­n<span id="dtx-highlighting-item">Â 1</span>2 chá»‰ 300tr nháº­n nhÃ ,Â <br /></strong></span></span></span></p>\r\n<p class="p_first"><span style="font-size: small;"><span><span><strong>tráº£ cháº­m khÃ´ng lÃ£i suáº¥t</strong></span></span></span></p>\r\n<p class="p_first"><span style="font-size: small;"><span><span><strong><br /></strong></span></span></span></p>\r\n<p><span style="font-size: small;"><span><strong><span>Vá»‹ trÃ­:</span>Â </strong><strong>ÄÆ°á»ngÂ </strong></span></span><span style="font-size: small;"><span><strong>LÃª VÄƒn KhÆ°Æ¡ngÂ </strong></span></span><span style="font-size: small;"><span><strong>vÃ Â </strong></span></span><span style="font-size: small;"><span><strong>TA<span id="dtx-highlighting-item">1</span>5, P. Thá»›i An, Q.<span id="dtx-highlighting-item">1</span>2 TPHCM</strong></span></span></p>\r\n<p><span style="font-size: small;"><span><strong><span>Qui mÃ´:</span>Â </strong><strong><span id="dtx-highlighting-item">1</span>4 Táº§ng</strong></span></span></p>\r\n<p><span style="font-size: small;"><span><strong><span>Máº·t Ä‘á»™ xÃ¢y dá»±ng:</span>Â </strong><strong>chá»‰ 42,69 %</strong></span></span></p>\r\n<p><span style="font-size: small;"><span><strong><span>Tá»•ng sá»‘ cÄƒn há»™:</span>Â </strong><strong>294 cÄƒn</strong></span></span></p>\r\n<p><span style="font-size: small;"><span><strong><span>Diá»‡n tÃ­ch khuÃ´n viÃªn:</span>Â 4,205 m<sup>2</sup></strong></span></span></p>\r\n<p><span style="font-size: small;"><span><strong><span>Diá»‡n tÃ­ch cÃ´ng viÃªn cÃ¢y xanh:</span>Â </strong><strong>777mÂ <sup>2</sup></strong></span></span></p>\r\n<p><br /><span style="font-size: small;"><span><img src="http://rongbay2.vcmedia.vn/thumb_max/up_new/2012/06/07/986563/201206165801_quimo2.jpg" alt="Ban can ho 300 trieucan ngay sieu thi METRO Q12 TPHCM-201206165801_quimo2" width="400" height="400" /></span></span></p>\r\n<p><span style="font-size: small;"><span><img src="http://rongbay2.vcmedia.vn/thumb_max/up_new/2012/06/07/986563/201206170030_hc___mat_bang_lung.png" alt="Ban can ho 300 trieucan ngay sieu thi METRO Q12 TPHCM-201206170030_hc___mat_bang_lung" width="400" height="275" /></span></span></p>\r\n<p><span style="font-size: small;"><span><img src="http://rongbay2.vcmedia.vn/thumb_max/up_new/2012/06/07/986563/201206170017_hc____mb_2_4_7_10_13.jpg" alt="Ban can ho 300 trieucan ngay sieu thi METRO Q12 TPHCM-201206170017_hc____mb_2_4_7_10_13" width="400" height="275" /></span></span></p>\r\n<p><span style="font-size: small;"><span>Vá»‹ trÃ­Â <em><strong>CÄƒn há»™ Cheery 2</strong></em><br /><span><img src="http://rongbay2.vcmedia.vn/thumb_max/up_new/2012/06/07/986563/201206170105_hc___vi_tri.jpg" alt="Ban can ho 300 trieucan ngay sieu thi METRO Q12 TPHCM-201206170105_hc___vi_tri" width="400" height="463" /></span></span></span></p>\r\n<p><span style="font-size: small;"><span>ÄÃ¡p á»©ng nhá»¯ng nhu cáº§u tiá»‡n Ã­ch hiá»‡n Ä‘áº¡i,<strong>Â </strong><strong><em><strong>CÄƒn há»™ Cheery 2</strong></em></strong><strong>Â </strong>cÃ²n thá»«a hÆ°á»Ÿng Ä‘Æ°á»£c ráº¥t nhiá»u tiá»‡n Ã­ch cá»§a khu vá»±c</span></span></p>\r\n<p><span style="font-size: small;"><span>Chá»‰ máº¥t 5 phÃºt Ä‘á»ƒ Ä‘áº¿n chá»£, nhÃ  sÃ¡ch, ngÃ¢n hÃ ng, trÆ°á»ng há»c cáº¥p<span id="dtx-highlighting-item">Â 1</span>,2,3, trÆ°á»ng máº«u giÃ¡o, â€¦</span></span></p>\r\n<p><span style="font-size: small;"><span>CÃ¡ch Metro Hiá»‡p phÃº, KCN TÃ¢n Thá»›i Hiá»‡p, Trung tÃ¢m hÃ nh chÃ­nh, khu cÃ´ng viÃªn cÃ¢y xanh chá»‰ 2 phÃºt Chá»‰ máº¥t 20 phÃºt Ä‘áº¿n Trung tÃ¢m thÃ nh phá»‘ qua Tuyáº¿n tÃ u Ä‘iá»‡n ngáº§m sá»‘ 2,Â  Báº¿n thÃ nh â€“ Tham LÆ°Æ¡ng, káº¿t ná»‘i Khu TÃ¢y Báº¯c, khu Ä‘Ã´ thá»‹ má»›i Quáº­n<span id="dtx-highlighting-item">Â 1</span>2, Quáº­n TÃ¢n PhÃº, Quáº­n TÃ¢n BÃ¬nh chá»‰ 20 phÃºt. Â </span></span></p>\r\n<p><span style="font-size: small;"><span><span>CÃ¡c loáº¡i diá»‡n tÃ­chÂ  Â Â </span>Â </span></span></p>\r\n<div><span style="font-size: small;"><span><img src="http://rongbay2.vcmedia.vn/thumb_max/up_new/2012/06/07/986563/201206170430_hc___loai_a.png" alt="Ban can ho 300 trieucan ngay sieu thi METRO Q12 TPHCM-201206170430_hc___loai_a" width="400" height="259" />Â <br /><br /><img src="http://rongbay2.vcmedia.vn/thumb_max/up_new/2012/06/07/986563/201206170437_hc___loai_b.png" alt="Ban can ho 300 trieucan ngay sieu thi METRO Q12 TPHCM-201206170437_hc___loai_b" width="400" height="267" />Â <br /><br /><img src="http://rongbay2.vcmedia.vn/thumb_max/up_new/2012/06/07/986563/201206170444_hc___loai_c.png" alt="Ban can ho 300 trieucan ngay sieu thi METRO Q12 TPHCM-201206170444_hc___loai_c" width="400" height="267" />Â <br /><br /><img src="http://rongbay2.vcmedia.vn/thumb_max/up_new/2012/06/07/986563/201206170451_hc___loai_d.png" alt="Ban can ho 300 trieucan ngay sieu thi METRO Q12 TPHCM-201206170451_hc___loai_d" width="400" height="267" />Â <br /><br /><img src="http://rongbay2.vcmedia.vn/thumb_max/up_new/2012/06/07/986563/201206170500_hc___loai_e.png" alt="Ban can ho 300 trieucan ngay sieu thi METRO Q12 TPHCM-201206170500_hc___loai_e" width="400" height="267" />Â <br /><br /><img src="http://rongbay2.vcmedia.vn/thumb_max/up_new/2012/06/07/986563/201206170507_hc___loai_f.png" alt="Ban can ho 300 trieucan ngay sieu thi METRO Q12 TPHCM-201206170507_hc___loai_f" width="400" height="269" /></span></span></div>\r\n<div>\r\n<div><span style="font-size: small;"><span>Â </span></span></div>\r\n<div>\r\n<div><span style="font-size: small;"><span>Â PhÆ°Æ¡ng thá»©c thanh toÃ¡n háº¥p dáº«n,<br />30% nháº­n nhÃ ,<br />65% tráº£ cháº­m khÃ´ng lÃ£i suáº¥t</span></span></div>\r\n</div>\r\n</div>\r\n<p><br /><br /><span style="font-size: small;"><span><span><span><span>LiÃªn há»‡</span></span></span></span></span></p>\r\n<p><span style="font-size: small;"><br /><span><span>Â  SÃ€N GIAO Dá»ŠCH BÄS BÃŒNH MINH</span></span></span></p>\r\n<p><span style="font-size: small;"><span><span><span id="dtx-highlighting-item">1</span><span id="dtx-highlighting-item">1</span>8 Phan XÃ­ch Long, P.3, Q.BÃ¬nh Tháº¡nh, TP.HCMÂ </span></span></span></p>\r\n<div align="center"><span style="font-size: small;"><span><span>HotlineÂ <strong>0935.<span id="dtx-highlighting-item">1</span>39.334</strong>_Äá»ƒ cÃ³ giÃ¡ gá»‘c tiáº¿t kiá»‡m nháº¥t</span>Â </span></span><br /><br /><span style="font-size: small;"><span><span>CÃ³ xe Ä‘Æ°a Ä‘Ã³n khÃ¡ch Ä‘i xem DA háº±ng ngÃ y</span></span></span></div>');
INSERT INTO `kn_product_detail` (`id`, `product_id`, `area`, `bedroom`, `price`, `intro`, `facility`, `address`, `description`) VALUES
(32, 34, '0', '1', 'ThÆ°Æ¡ng lÆ°á»£ng', 'Cáº§n bÃ¡n cÄƒn há»™ harmona trá»±c tiáº¿p tá»« chá»§ Ä‘áº§u tÆ°-Thanh NiÃªn Corp', '<p style="text-align: center;">Â </p>\r\n<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">CÄƒn há»™ cao cáº¥p</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Â </td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>3</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>2</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>99 m<sup>2</sup></td>\r\n<td>Â </td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style="text-align: center;"><span style="font-size: small;"><strong><br /></strong></span></p>', '33 - trÆ°Æ¡ng cÃ´ng Ä‘á»‹nh - phÆ°á»ng 14 - Quáº­n TÃ¢n BÃ¬nh - thÃ nh phá»‘ Há»“ ChÃ­ Minh', '<p><strong>Cáº§n bÃ¡n cÄƒn há»™ harmona trá»±c tiáº¿p tá»« chá»§ Ä‘áº§u tÆ°-Thanh NiÃªn Corp</strong></p>\r\n<p><strong>Cáº§n bÃ¡n cÄƒn há»™ harmona chiáº¿t kháº¥u cao nháº¥t thá»‹ trÆ°á»ng</strong></p>\r\n<p><strong>Cáº§n bÃ¡n cÃ¡c cÄƒn há»™ harmona vá»‹ trÃ­ Ä‘áº¹p,thiáº¿t káº¿ hiá»‡n Ä‘áº¡i,chiáº¿t kháº¥u Æ°u Ä‘Ã£i</strong></p>\r\n<p><strong>Cáº§n bÃ¡n cÄƒn há»™ harmona Ä‘ang hoÃ n thiá»‡n, thÃ¡ng 9/2012 bÃ n giao cÄƒn há»™.</strong></p>\r\n<p>Â </p>\r\n<p>CHá»¦ Äáº¦U TÆ¯: CÃ”NG TY CP THANH NIÃŠN</p>\r\n<p>BÃN CÄ‚N Há»˜ HARMONA, 33 TRÆ¯Æ NG CÃ”NG Äá»ŠNH, P14,TÃ‚N BÃŒNH</p>\r\n<p>Chi tiáº¿t tham kháº£o:</p>\r\n<p><strong><a href="http://thanhniencorp.vn/">http://thanhniencorp.vn</a></strong></p>\r\n<p><strong>Xem video:Â </strong><strong><a href="http://www.youtube.com/watch?v=JvWd2-zPHAM\\\\">http://www.youtube.com/watch?v=JvWd2-zPHAM\\\\</a></strong></p>\r\n<p>Hotline 0989 840 246</p>\r\n<p><strong>Â </strong></p>\r\n<p>Â </p>\r\n<p><strong>BÃ¡n cÄƒn há»™ The harmona -33 trÆ°Æ¡ng cÃ´ng Ä‘á»‹nh, p14, quáº­n tÃ¢n bÃ¬nh. Khu cÄƒn há»™ vá»›i khuÃ´n viÃªn rá»™ng rÃ£i, thiáº¿t káº¿ hiá»‡n Ä‘áº¡i, vá»‹ trÃ­ trung tÃ¢m, tiá»‡n Ã­ch hoÃ n háº£o sáº½ mang Ä‘áº¿n má»™t mÃ´i trÆ°á»ng sá»‘ng lÃ½ tÆ°á»Ÿng cho gia Ä‘Ã¬nh báº¡n ngay táº¡i trung tÃ¢m thÃ nh phá»‘.</strong></p>\r\n<p><strong>Quy mÃ´ dá»± Ã¡n: gá»“m 3 Blockâ€™ má»—i block 19 táº§ng vá»›i cÃ¡c tiá»‡n Ã­ch bÃªn trong: TT ThÆ°Æ¡ng Máº¡i, há»“ bÆ¡i, cÃ´ng viÃªnâ€¦</strong></p>\r\n<p><strong>Loáº¡i cÄƒn há»™: 1,2,3 phÃ²ng ngá»§ tá»« 49 Ä‘áº¿n 99m2 vá»›i thiáº¿t káº¿ hiá»‡n Ä‘áº¡i cá»§a Singapore mang Ã¡nh sÃ¡ng tá»± nhiÃªn Ä‘áº¿n tá»«ng phÃ²ng trong gia Ä‘Ã¬nh báº¡n.</strong></p>\r\n<p><strong>Tiáº¿n Ä‘á»™ bÃ n giao: ThÃ¡ng 9/2012</strong></p>\r\n<p><strong>Tiáº¿n Ä‘á»™ xÃ¢y dá»±ng: Ä‘ang vÃ o giai Ä‘oáº¡n hoÃ n thiá»‡n ná»™i tháº¥t.</strong></p>\r\n<p><strong>Há»— trá»£ vay NHÂ Â 70% trong vÃ²ng 15 nÄƒm.</strong></p>\r\n<p><strong>ChÆ°Æ¡ng trÃ¬nh khuyáº¿n mÃ£i :chiáº¿t kháº¥u cao nháº¥t thá»‹ trÆ°á»ng</strong></p>\r\n<p><strong>Thanh toÃ¡n theo tiáº¿n Ä‘á»™ cÃ´ng trÃ¬nh linh hoáº¡t vá»›i tá»«ng Ä‘á»‘i tÆ°á»£ng khÃ¡ch hÃ ng.</strong></p>\r\n<p><strong>Â </strong></p>\r\n<p><strong>Vui lÃ²ng liÃªn há»‡ ngay vá»›i chÃºng tÃ´i Ä‘á»ƒ chá»n Ä‘Æ°á»£c cÄƒn há»™ Æ°ng Ã½ nháº¥t.</strong></p>\r\n<p><strong>CHá»¦ Äáº¦U TÆ¯ Dá»° ÃN CTY CP THANH NIÃŠN</strong></p>\r\n<p><strong>Äá»‹a chá»‰: 391 TrÆ°á»ng Chinh, p14, qTB</strong></p>\r\n<p><strong>CHUYÃŠN VIÃŠN TÆ¯ Váº¤N</strong></p>\r\n<p><strong>MS. THANH LOAN</strong></p>\r\n<p><strong>ÄT: 730 66666-108</strong></p>\r\n<p><strong>Hotline: 0989 840 246</strong></p>\r\n<p><strong>Xem video:Â <a href="http://www.youtube.com/watch?v=JvWd2-zPHAM\\&quot; style=">http://www.youtube.com/watch?v=JvWd2-zPHAM\\</a></strong></p>'),
(33, 35, '0', '1', 'ThÆ°Æ¡ng lÆ°á»£ng', 'BÃ¡n cÄƒn há»™ chung cÆ° Má»¹ PhÆ°á»›c quáº­n BÃ¬nh Tháº¡nh giÃ¡ 1,1ty/cÄƒn', '<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">CÄƒn há»™ cao cáº¥p</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Â </td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>1</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>1</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>40 m<sup>2</sup></td>\r\n<td>Â </td>\r\n</tr>\r\n</tbody>\r\n</table>', 'quáº­n BÃ¬nh Tháº¡nh - phÆ°á»ng BÃ¬nh Tháº¡nh - thÃ nh phá»‘ Há»“ ChÃ­ Minh', '<p class="usertext"><span><span style="font-family: ''Times New Roman'';">BÃ¡nÂ cÄƒn há»™ chung cÆ° Má»¹ PhÆ°á»›c quáº­n BÃ¬nh Tháº¡nh giÃ¡ 1,1ty/cÄƒn</span></span></p>\r\n<p class="usertext"><span><span style="font-family: ''Times New Roman'';">Dt 40m, gá»“m 1pn, 1wc, phÃ²ng khÃ¡ch, báº¿p, ná»™i tháº¥t Ä‘áº§y Ä‘á»§ Ä‘ang cÃ³ há»£p Ä‘á»“ng thuÃª 6tr/thÃ¡ng, sá»• há»“ng.Â lien he :0938775152, MTG, MTB.</span></span></p>'),
(34, 36, '0', '1', '7 triá»‡u / thÃ¡ng', ' Cho thuÃª nhÃ  nguyÃªn cÄƒn giÃ¡ 7tr/thÃ¡ng ngay ngÃ£ tÆ° lac long quÃ¢n Ã¢u cÆ¡', '<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">CÄƒn há»™ cao cáº¥p</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Sá»• há»“ng</td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>3</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>2</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>86 m<sup>2</sup></td>\r\n<td>Â </td>\r\n</tr>\r\n</tbody>\r\n</table>', 'láº¡c long quÃ¢n - phÆ°á»ng 9 - Quáº­n TÃ¢n BÃ¬nh - thÃ nh phá»‘ Há»“ ChÃ­ Minh', '<p>Â Cho thuÃª nhÃ  nguyÃªn cÄƒn giÃ¡ 7tr/thÃ¡ng ngay ngÃ£ tÆ° lac long quÃ¢n Ã¢u cÆ¡</p>\r\n<p>Diá»‡n tÃ­ch 3,5 x 13 Ä‘Ãºc 1 táº¥m ,2PN,2WC,1PK,1 báº¿p Äƒn.Ä‘Æ°á»ng trÆ°á»›c nhÃ  4m</p>\r\n<p>Tel : 0934.114.152 quá»‘c tiáº¿n</p>'),
(35, 37, '0', '1', 'ThÆ°Æ¡ng lÆ°á»£ng', 'BÃ¡n cÄƒn há»™ HoÃ ng Anh Gia Lai 2 Ä‘Æ°á»ng Tráº§n XuÃ¢n Soáº¡n quáº­n 7 giÃ¡ 1,6ty', '<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">CÄƒn há»™ cao cáº¥p</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Sá»• há»“ng</td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>3</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>2</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>86 m<sup>2</sup></td>\r\n<td>Â </td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Quáº­n 7 - thÃ nh phá»‘ Há»“ ChÃ­ Minh', '<div><span>Cho thuÃª cÄƒn há»™ Flemington quáº­n 11 giÃ¡ 19tr/thÃ¡ng</span></div>\r\n<div><span>Táº§ng cao, view Ä‘áº¹p, dt 86m, gá»“m 3pn, 2wc, ná»™i tháº¥t trang bá»‹ Ä‘áº§y Ä‘á»§, má»›i 100%, chá»‰ cáº§n vÃ o á»Ÿ. LiÃªn há»‡ 0938447390</span></div>'),
(36, 38, '0', '1', 'ThÆ°Æ¡ng lÆ°á»£ng', 'BÃ¡ncÄƒn há»™ An HÃ²a Khu Nam long quáº­n 7 giÃ¡ 1,25ty', '<p>Â </p>\r\n<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">CÄƒn há»™ cao cáº¥p</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Â </td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>2</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>1</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>61 m<sup>2</sup></td>\r\n<td>Â </td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><span style="font-size: small;"><br /></span></p>', 'Quáº­n 7 - thÃ nh phá»‘ Há»“ ChÃ­ Minh', '<div><span>BÃ¡ncÄƒn há»™ An HÃ²a Khu Nam long quáº­n 7 giÃ¡ 1,25ty</span></div>\r\n<div><span>Láº§u 2( thang mÃ¡y) nhÃ¬n cáº§u phÃº má»¹ ráº¥t Ä‘áº¹p vÃ  thoÃ¡ng mÃ¡t, diá»‡n tÃ­ch 61m, gá»“m 2pn, 1wc, 1 pk, báº¿p, sÃ¢n phÆ¡i, ná»™i tháº¥t cÄƒn báº£n Ä‘áº§y Ä‘á»§ vÃ  má»›i, cÃ³ thÆ°á»£ng lÆ°á»£ng, sá»• há»“ngÂ lien he :0938775152, MTG, MTB.</span></div>'),
(37, 13, '0', '1', 'ThÆ°Æ¡ng lÆ°á»£ng', 'Cáº§n bÃ¡n cÄƒn há»™ chung cÆ° Nam An giÃ¡ cá»±c ráº» chá»‰ cÃ³ 1,530ty ( khoáº£ng 19,6tr/m2)', '<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">CÄƒn há»™ cao cáº¥p</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Â </td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>2</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>2</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>78 m<sup>2</sup></td>\r\n</tr>\r\n</tbody>\r\n</table>', 'BÃ¬nh Tháº¡nh - thÃ nh phá»‘ Há»“ ChÃ­ Minh', '<div><span>Cáº§n bÃ¡n cÄƒn há»™ chung cÆ° Nam An giÃ¡ cá»±c ráº» chá»‰ cÃ³ 1,530ty ( khoáº£ng 19,6tr/m2)</span></div>\r\n<div><span>Táº§ng cao, view Ä‘áº¹p, cÄƒn gÃ³c hÆ°á»›ng Nam, diá»‡n tÃ­ch 78,5m2 gá»“m 2pn, 2wc, ban cÃ´ng, phÃ²ng báº¿p, phÃ²ng khÃ¡ch, táº·ng láº¡i má»™t sá»‘ ná»™i tháº¥t, khu cÄƒn há»™ cÃ³ há»“ bÆ¡i trÃªn táº§ng thÆ°á»£ng, gáº§n trung tÃ¢m. lien he :0938775152, MTG, MTB.</span></div>'),
(38, 10, '0', '1', 'ThÆ°Æ¡ng lÆ°á»£ng', 'Cáº§n bÃ¡n cÄƒn há»™ chung cÆ° Quáº­n BÃ¬nh Tháº¡nh D5 giÃ¡ 2ty/cÄƒn', '<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">CÄƒn há»™ cao cáº¥p</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Â </td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>3</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>2</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>99 m<sup>2</sup></td>\r\n<td>Â </td>\r\n</tr>\r\n</tbody>\r\n</table>', 'BÃ¬nh Tháº¡nh - thÃ nh phá»‘ Há»“ ChÃ­ Minh', '<div><span>Cáº§n bÃ¡n cÄƒn há»™ chung cÆ° Quáº­n BÃ¬nh Tháº¡nh D5 giÃ¡ 2ty/cÄƒn</span></div>\r\n<p><span>Â láº§u 2, diá»‡n tÃ­ch 99m, gá»“m 3 phÃ²ng ngá»§, 2wc, 1 phÃ²ng khÃ¡ch, 1 báº¿p, sá»• há»“ng chÃ­nh chá»§. lien he :0938775152, MTG, MTB</span></p>'),
(39, 5, '0', '1', 'ThÆ°Æ¡ng lÆ°á»£ng', 'Cáº§n bÃ¡n Shop cÄƒn há»™ PhÃº Má»¹ Thuáº­n. GiÃ¡ 1,8 tá»·/cÄƒn', '<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">CÄƒn há»™ cao cáº¥p</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Â </td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>3</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>1</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>188 m<sup>2</sup></td>\r\n<td>Â </td>\r\n</tr>\r\n</tbody>\r\n</table>', ' Huyá»‡n NhÃ  BÃ¨ - thÃ nh phá»‘ Há»“ ChÃ­ Minh', '<div><span>Cáº§n bÃ¡nÂ Shop cÄƒn há»™ PhÃº Má»¹ Thuáº­n</span></div>\r\n<p><span>Â 1trá»‡t (shop, 1WC), 1 lá»¯ng, 188m2,3PN, 2WC, 1 PhÃ²ng Thá», 1 NhÃ  Kho, baoÂ VAT, phÃ­ quáº£n lÃ½, bao sang tÃªn cho ngÆ°á»i mua. GiÃ¡ 1,8 tá»·/cÄƒn. lien he :0938775152</span><span>, MTG, MTB</span></p>'),
(40, 9, '0', '1', '28 triá»‡u/m2', 'Cáº§n bÃ¡n cÄƒn há»™ HÃ¹ng VÆ°Æ¡ng Plaza quáº­n 5 giÃ¡ 28tr/m2 thÆ°Æ¡ng lÆ°á»£ng', '<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">CÄƒn há»™ cao cáº¥p</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Â </td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>3</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>3</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>121 m<sup>2</sup></td>\r\n</tr>\r\n</tbody>\r\n</table>', 'HÃ¹ng VÆ°Æ¡ng - phÆ°á»ng - Quáº­n 5 - thÃ nh phá»‘ Há»“ ChÃ­ Minh', '<div><span>Cáº§n bÃ¡n cÄƒn há»™ HÃ¹ng VÆ°Æ¡ng Plaza quáº­n 5 giÃ¡ 28tr/m2 thÆ°Æ¡ng lÆ°á»£ng</span></div>\r\n<div><span>Táº§ng cao, cÄƒn gÃ³c, view trÆ°á»ng Ä‘ua, thoÃ¡ng mÃ¡t, dt 121,6m, cÃ³ 4 mÃ¡y láº¡nh, rÃ¨m cá»­a cÃ¡c phÃ²ng, mÃ¡y nÆ°á»›c nÃ³ng, 3pn, 3wc, phÃ²ng khÃ¡ch, báº¿p, ban cÃ´ng.Â lien he :0938775152, MTG, MTB.</span></div>'),
(41, 8, '0', '1', 'ThÆ°Æ¡ng lÆ°á»£ng', 'BÃ¡n nhÃ  Quáº­n 12 giÃ¡ Æ°u Ä‘Ã£i, khÃ´ng gian thoÃ¡ng mÃ¡t', '<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">Báº¥t Ä‘á»™ng sáº£n khÃ¡c</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Sá»• há»“ng</td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>4</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>1</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>5 x 15 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>75 m<sup>2</sup></td>\r\n<td>Â </td>\r\n</tr>\r\n</tbody>\r\n</table>', 'TCH 35 - phÆ°á»ng TÃ¢n chÃ¡nh hiá»‡p - Quáº­n 12 - thÃ nh phá»‘ Há»“ ChÃ­ Minh', '<div>ThÃ´ng tin chung:</div>\r\n<div>Diá»‡n tÃ­ch: 5x15 m2</div>\r\n<div>NhÃ  gá»“m 1 phÃ²ng khÃ¡ch, 1 phÃ²ng ngá»§, 1 toilet, 1 phong báº¿p + phÃ²ng Äƒn</div>\r\n<div>Diá»‡n tÃ­ch nhÃ  trÆ°á»›c cÃ³ thá»ƒ lÃ m khu cho cÃ´ng nhÃ¢n may</div>\r\n<div>Äáº·c biá»‡t: phÃ­a sau nhÃ  cÃ²n Ä‘áº¥t trá»‘ng rá»™ng khoáº£ng 20 m2 cÃ³ thá»ƒ trá»“ng cÃ¢y, rau Äƒn quáº£â€¦</div>\r\n<div>GiÃ¡ 1 tá»· bao san sá»•</div>\r\n<div><strong>ThÃ´ng tin liÃªn há»‡:</strong>Â <strong><span>0988 654 262 ( Mr DÅ©ng )</span></strong></div>'),
(42, 39, '0', '1', '14 triá»‡u / m2', 'Liá»n ká» khu chá»£ Ä‘áº§u má»‘i Q.Thá»§ Äá»©c, Ä‘Æ°á»ng dáº«n vÃ o rá»™ng 16m, xung quanh cÃ³ biá»‡t thá»±, an ninh tá»‘tâ€¦', '<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">Báº¥t Ä‘á»™ng sáº£n khÃ¡c</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Sá»• há»“ng</td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>_</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>120 m<sup>2</sup></td>\r\n<td>Â </td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Gáº§n chá»£ Ä‘áº§u má»‘i - phÆ°á»ng - Quáº­n Thá»§ Äá»©c - thÃ nh phá»‘ Há»“ ChÃ­ Minh', '<p>Liá»n ká» khu chá»£ Ä‘áº§u má»‘i Q.Thá»§ Äá»©c, Ä‘Æ°á»ng dáº«n vÃ o rá»™ng 16m, xung quanh cÃ³ biá»‡t thá»±, an ninh tá»‘tâ€¦</p>\r\n<p>Diá»‡n tÃ­ch 120 m2 (6x20)</p>\r\n<p>GiÃ¡ 14 triá»‡u/ m2 bao san sá»• Ä‘á»</p>\r\n<p>ThÃ´ng tin liÃªn há»‡:Â <strong>Mr DÅ©ng 0988 654 262</strong></p>'),
(43, 40, '0', '1', 'ThÆ°Æ¡ng lÆ°á»£ng', 'BÃ¡n nhÃ  quáº­n 7 háº»m xe hÆ¡i Nguyá»…n Thá»‹ Tháº­p giÃ¡ 3,3ty thÆ°Æ¡ng lÆ°á»£ng', '<p>Â </p>\r\n<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">Báº¥t Ä‘á»™ng sáº£n khÃ¡c</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Â </td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>3</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>3</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>40 m<sup>2</sup></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><span style="font-size: small;"><br /></span></p>', '18 Nguyá»…n Thá»‹ Tháº­p - phÆ°á»ng - Quáº­n 7 - thÃ nh phá»‘ Há»“ ChÃ­ Minh', '<div><span>BÃ¡n nhÃ  quáº­n 7 háº»m xe hÆ¡i Nguyá»…n Thá»‹ Tháº­p giÃ¡ 3,3ty thÆ°Æ¡ng lÆ°á»£ng</span></div>\r\n<p><span>Diá»‡n tÃ­ch 4x17,5m, nhÃ  biá»‡t thá»± phá»‘ 1 trá»‡t, 2 láº§u, 1 phÃ²ng khÃ¡ch, 1 báº¿p, 3pn, 3 wc, sÃ¢n thÆ°á»£ng, ná»™i tháº¥t cao cáº¥p, nhÃ  má»›i 100% hoÃ n cÃ´ng Ä‘áº§y Ä‘á»§ lien he :0938775152</span><span>, MTG, MTB</span></p>'),
(44, 41, '0', '1', 'ThÆ°Æ¡ng lÆ°á»£ng', ' BÃ¡n cÄƒn há»™ cao cáº¥p The Harmona tá»a láº¡c táº¡i 33 TrÆ°Æ¡ng CÃ´ng Äá»‹nh, P.14, Q.TÃ¢n BÃ¬nh, ngay trung tÃ¢m hÃ nh chÃ¡nh Quáº­n TB.', '<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">CÄƒn há»™ cao cáº¥p</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Â </td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>2</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>2</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>80 m<sup>2</sup></td>\r\n<td>Â </td>\r\n</tr>\r\n</tbody>\r\n</table>', '33 - trÆ°Æ¡ng cÃ´ng Ä‘á»‹nh - phÆ°á»ng 14 - Quáº­n TÃ¢n BÃ¬nh - thÃ nh phá»‘ Há»“ ChÃ­ Minh', '<p>BÃN CÄ‚N Há»˜ HARMONA, 33 TRÆ¯Æ NG CÃ”NG Äá»ŠNH, P14,TÃ‚N BÃŒNH</p>\r\n<p>Chi tiáº¿t tham kháº£o:</p>\r\n<p><strong><a href="http://thanhniencorp.vn/">http://thanhniencorp.vn</a></strong></p>\r\n<p><strong>Xem video:Â </strong><strong><a href="http://www.youtube.com/watch?v=JvWd2-zPHAM\\\\">http://www.youtube.com/watch?v=JvWd2-zPHAM\\\\</a></strong></p>\r\n<p><strong>HOTLINE 0989 840 246 â€“ MS.LOAN</strong></p>\r\n<p>Â </p>\r\n<p><strong>Â </strong></p>\r\n<p><strong>CÄƒn há»™ cao cáº¥p The Harmona</strong>Â tá»a láº¡c táº¡i 33 TrÆ°Æ¡ng CÃ´ng Äá»‹nh, P.14, Q.TÃ¢n BÃ¬nh, ngay trung tÃ¢m hÃ nh chÃ¡nh Quáº­n TB.</p>\r\n<p><strong>Â </strong></p>\r\n<p><strong>-Â Â Â Â CÄƒn há»™ Harmona</strong>Â cÃ³Â Â v<strong>á»‹ trÃ­ Ä‘áº¯c Ä‘á»‹a nháº¥t Q. TÃ¢n BÃ¬nh</strong>Â :Â CÃ¡ch UBND quáº­n TÃ¢n BÃ¬nh 0.5km. Äi sÃ¢n bay TÃ¢n SÆ¡n Nháº¥t chá»‰ 15 phÃºt. CÃ¡ch trung tÃ¢m thá»ƒ dá»¥c thá»ƒ thao, cÃ´ng viÃªn BÃ u CÃ¡t chá»‰ 3 phÃºt,gáº§n CÃ´ng viÃªn HoÃ ng VÄƒn Thá»¥, sÃ¢n váº­n Ä‘á»™ng QuÃ¢n Khu 7, gáº§n bá»‡nh viá»‡n, trung tÃ¢m thÆ°Æ¡ng máº¡i quá»‘c táº¿ nhÆ° Parkson, Citimartâ€¦.</p>\r\n<p>Â </p>\r\n<p>-Â Â Â Â Â Â Â Â <strong>CÄƒn há»™ Harmona</strong>Â cÃ³Â <strong>thiáº¿t káº¿ cao cáº¥p</strong>:Â <strong>CÄƒn há»™ The Harmona</strong>Â do cÃ´ng ty Ong &amp; Ong cá»§a Singapore thiáº¿t káº¿, gá»“m 3 block A,B,C cao 19 táº§ng, 569Â cÄƒn há»™Â vá»›i tiá»‡n Ã­ch: cÃ´ng viÃªn , há»“ bÆ¡i, trung tÃ¢m thÆ°Æ¡ng máº¡i â€¦</p>\r\n<p>Â </p>\r\n<p>-Â Â Â Â Â Â Â Â <strong>CÄƒn há»™ Harmona</strong>Â cÃ³ d<strong>iá»‡n tÃ­ch Ä‘a dáº¡ng</strong>Â tá»« 49m2 Ä‘áº¿n 99.51m2 gá»“m:<br />-48.9m2 : 1 phÃ²ng ngá»§, 1wc, phÃ²ng khÃ¡ch, báº¿p, balcon.<br />-72.82m2 Ä‘áº¿n 80.74m2: 2 phÃ²ng ngá»§,2 wc, phÃ²ng khÃ¡ch, báº¿p, balcon.<br />-96 Ä‘áº¿n 99.51m2: 3 phÃ²ng ngá»§,2 wc, Â phÃ²ng khÃ¡ch, báº¿p, balcon.</p>\r\n<p>Â Â -Â Â <strong>Thanh toÃ¡n theo tiáº¿n Ä‘á»™ cÃ´ng trÃ¬nh linh hoáº¡t vá»›i tá»«ng Ä‘á»‘i tÆ°á»£ng khÃ¡ch hÃ ng</strong></p>\r\n<p><strong>- KH ÄÆ¯á»¢C CHIáº¾T KHáº¤U CAO NHáº¤T THá»Š TRÆ¯á»œNG</strong></p>\r\n<p>Â </p>\r\n<p><strong>Â Â -Tiáº¿n Ä‘á»™ bÃ n giao:thÃ¡ngÂ 9</strong><strong>/2012(+-3 thÃ¡ng)</strong></p>\r\n<p><strong>Â Â -H</strong><strong>á»—Â tr</strong><strong>á»£Â vay NH Ä‘</strong><strong>áº¿n 70% trong 15 nÄƒm</strong></p>\r\n<p>Â </p>\r\n<p>-Â Â Â Â Â Â Hiá»‡n táº¡i Ä‘Ã£ hoÃ n thÃ nh pháº§n thÃ´ cÃ´ng trÃ¬nh, tiáº¿n Ä‘á»™ luÃ´n Ä‘Æ°á»£c Ä‘áº£m báº£o.</p>\r\n<p><strong>Â GIÃ Gá»C+CHIáº¾T KHáº¤U Æ¯U ÄÃƒI Cá»°C Tá»T Tá»ª CHá»¦ Äáº¦U TÆ¯</strong><strong><br /><br /></strong><em>Má»i thÃ´ng tin chi tiáº¿t vui lÃ²ng liÃªn há»‡ trá»±c tiáº¿p:</em></p>\r\n<p><strong>Chá»§ Ä‘áº§u tÆ°: CÃ´ng Ty Cá»• Pháº§n Thanh NiÃªn</strong></p>\r\n<p><strong>Hotline: 0989 840 246- Ms.Thanh Loan</strong><br />Äá»‹a chá»‰:Â 391 TrÆ°á»ng Chinh, P14, Quáº­n TÃ¢n BÃ¬nhÂ <br />Dá»± Ã¡n khÃ¡c cá»§a cÃ´ng ty: CÄƒn há»™ cao cáº¥p Central PlazaÂ  (Ä‘á»‘i diá»‡n chá»£ Pháº¡m VÄƒn Hai)<br /><a href="http://thanhniencorp.vn/">http://thanhniencorp.vn</a></p>'),
(45, 42, '0', '1', 'ThÆ°Æ¡ng lÆ°á»£ng', 'Cáº§n bÃ¡n cÄƒn há»™ Vstar quáº­n 7 giÃ¡ 1,9tá»·', '<table class="tbl_info" style="width: 100%;" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">CÄƒn há»™ cao cáº¥p</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Â </td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>2</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>1</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>50 m<sup>2</sup></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><span style="font-size: xx-small;"><br /></span></p>', 'Quáº­n 7 - thÃ nh phá»‘ Há»“ ChÃ­ Minh', '<p>Cáº§n bÃ¡n cÄƒn há»™ Vstar quáº­n 7 giÃ¡ 1,9ty</p>\r\n<p>diá»‡n tÃ­ch 119m gá»“m 3pn, 2wc, phÃ²ng khÃ¡ch, tá»§ báº¿p, cÄƒn gÃ³c 2 view, sá»• há»“ng, nhÃ  má»›i 100% chÆ°a qua sá»­ dá»¥ng. . . lien he :0938775152, MTG, MTB.</p>'),
(46, 44, '0', '1', '10 triá»‡u', '', '<table class="tbl_info" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">CÄƒn há»™ cao cáº¥p</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Â </td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>2</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>1</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>50 m<sup>2</sup></td>\r\n</tr>\r\n</tbody>\r\n</table>', '101 HoÃ ng Hoa ThÃ¡m', '<p>Cáº§n bÃ¡n cÄƒn há»™ Vstar quáº­n 7 giÃ¡ 1,9ty</p>\r\n<p>diá»‡n tÃ­ch 119m gá»“m 3pn, 2wc, phÃ²ng khÃ¡ch, tá»§ báº¿p, cÄƒn gÃ³c 2 view, sá»• há»“ng, nhÃ  má»›i 100% chÆ°a qua sá»­ dá»¥ng. . . lien he :0938775152, MTG, MTB.</p>'),
(47, 45, '0', '1', '10 triá»‡u', '', '<table class="tbl_info" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">CÄƒn há»™ cao cáº¥p</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Â </td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>2</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>1</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>50 m<sup>2</sup></td>\r\n</tr>\r\n</tbody>\r\n</table>', '101 HoÃ ng Hoa ThÃ¡m', '<p>Cáº§n bÃ¡n cÄƒn há»™ Vstar quáº­n 7 giÃ¡ 1,9ty</p>\r\n<p>diá»‡n tÃ­ch 119m gá»“m 3pn, 2wc, phÃ²ng khÃ¡ch, tá»§ báº¿p, cÄƒn gÃ³c 2 view, sá»• há»“ng, nhÃ  má»›i 100% chÆ°a qua sá»­ dá»¥ng. . . lien he :0938775152, MTG, MTB.</p>'),
(48, 46, '0', '1', '10 triá»‡u', '', '<table class="tbl_info" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">CÄƒn há»™ cao cáº¥p</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Â </td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>2</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>1</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>50 m<sup>2</sup></td>\r\n</tr>\r\n</tbody>\r\n</table>', '101 HoÃ ng Hoa ThÃ¡m', '<p>Cáº§n bÃ¡n cÄƒn há»™ Vstar quáº­n 7 giÃ¡ 1,9ty</p>\r\n<p>diá»‡n tÃ­ch 119m gá»“m 3pn, 2wc, phÃ²ng khÃ¡ch, tá»§ báº¿p, cÄƒn gÃ³c 2 view, sá»• há»“ng, nhÃ  má»›i 100% chÆ°a qua sá»­ dá»¥ng. . . lien he :0938775152, MTG, MTB.</p>'),
(49, 47, '0', '1', '10 triá»‡u', '', '<table class="tbl_info" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">CÄƒn há»™ cao cáº¥p</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Â </td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>2</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>1</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>50 m<sup>2</sup></td>\r\n</tr>\r\n</tbody>\r\n</table>', '101 HoÃ ng Hoa ThÃ¡m', '<p>Cáº§n bÃ¡n cÄƒn há»™ Vstar quáº­n 7 giÃ¡ 1,9ty</p>\r\n<p>diá»‡n tÃ­ch 119m gá»“m 3pn, 2wc, phÃ²ng khÃ¡ch, tá»§ báº¿p, cÄƒn gÃ³c 2 view, sá»• há»“ng, nhÃ  má»›i 100% chÆ°a qua sá»­ dá»¥ng. . . lien he :0938775152, MTG, MTB.</p>'),
(50, 48, '0', '1', '10 triá»‡u', '', '<table class="tbl_info" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">CÄƒn há»™ cao cáº¥p</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Â </td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>2</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>1</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>50 m<sup>2</sup></td>\r\n</tr>\r\n</tbody>\r\n</table>', '101 HoÃ ng Hoa ThÃ¡m', '<p>Cáº§n bÃ¡n cÄƒn há»™ Vstar quáº­n 7 giÃ¡ 1,9ty</p>\r\n<p>diá»‡n tÃ­ch 119m gá»“m 3pn, 2wc, phÃ²ng khÃ¡ch, tá»§ báº¿p, cÄƒn gÃ³c 2 view, sá»• há»“ng, nhÃ  má»›i 100% chÆ°a qua sá»­ dá»¥ng. . . lien he :0938775152, MTG, MTB.</p>'),
(51, 49, '0', '1', '10 triá»‡u', '', '<table class="tbl_info" border="0" cellspacing="0" cellpadding="4">\r\n<tbody>\r\n<tr><th class="info_title" colspan="4">ThÃ´ng tin</th></tr>\r\n<tr class="info_bg_tr">\r\n<td width="22%">Loáº¡i Ä‘á»‹a á»‘c:</td>\r\n<td width="28%">CÄƒn há»™ cao cáº¥p</td>\r\n<td width="22%">TÃ¬nh tráº¡ng phÃ¡p lÃ½:</td>\r\n<td width="28%">Â </td>\r\n</tr>\r\n<tr>\r\n<td>Sá»‘ láº§u:</td>\r\n<td>_</td>\r\n<td>Sá»‘ phÃ²ng:</td>\r\n<td>2</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch khuÃ´n viÃªn:</td>\r\n<td>0 x 0 m</td>\r\n<td>WC/PhÃ²ng táº¯m:</td>\r\n<td>1</td>\r\n</tr>\r\n<tr>\r\n<td>Diá»‡n tÃ­ch xÃ¢y dá»±ng:</td>\r\n<td>0 x 0 m</td>\r\n<td>ÄÆ°á»ng trÆ°á»›c nhÃ :</td>\r\n<td>_</td>\r\n</tr>\r\n<tr class="info_bg_tr">\r\n<td>Diá»‡n tÃ­ch sá»­ dá»¥ng:</td>\r\n<td>50 m<sup>2</sup></td>\r\n</tr>\r\n</tbody>\r\n</table>', '101 HoÃ ng Hoa ThÃ¡m', '<p>Cáº§n bÃ¡n cÄƒn há»™ Vstar quáº­n 7 giÃ¡ 1,9ty</p>\r\n<p>diá»‡n tÃ­ch 119m gá»“m 3pn, 2wc, phÃ²ng khÃ¡ch, tá»§ báº¿p, cÄƒn gÃ³c 2 view, sá»• há»“ng, nhÃ  má»›i 100% chÆ°a qua sá»­ dá»¥ng. . . lien he :0938775152, MTG, MTB.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `kn_user`
--

CREATE TABLE IF NOT EXISTS `kn_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `idnumber` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_group_id` int(10) unsigned NOT NULL,
  `date_create` text COLLATE utf8_unicode_ci NOT NULL,
  `date_update` text COLLATE utf8_unicode_ci NOT NULL,
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `kn_user`
--

INSERT INTO `kn_user` (`id`, `username`, `password`, `email`, `firstname`, `lastname`, `phone`, `address`, `idnumber`, `user_group_id`, `date_create`, `date_update`, `publish`) VALUES
(1, 'vuongngocnamfd', '111', 'vuongngocnam@gmail.com', 'Nam', 'VÆ°Æ¡ng Ngá»c', '0919 050 067', '117 Hiá»‡p BÃ¬nh ChÃ¡nh - Thá»§ Äá»©c - HCM ', NULL, 1, '1341483456', '1341483456', 1),
(4, 'admin', '81dc9bdb52d04dc20036dbd8313ed055', 'vuongngocnam@gmail.com', 'Nam', 'VÆ°Æ¡ng Ngá»c', '0919 050 067', '96 ÄÆ°á»ng Trá»¥c - BÃ¬nh Tháº¡nh - HCM', NULL, 4, '1338777921', '1338777921', 1),
(5, 'admin', 'd41d8cd98f00b204e9800998ecf8427e', 'vuongngocnam@gmail.com', 'Nam', 'VÆ°Æ¡ng Ngá»c', '0919 050 067', '96 ÄÆ°á»ng Trá»¥c - BÃ¬nh Tháº¡nh - HCM', NULL, 4, '1338777406', '1338777406', 1),
(6, 'admin1', '698d51a19d8a121ce581499d7b701668', 'vuongngoc2nam@gmail.com', '111', '111', '111', '111', NULL, 1, '1338833122', '1338833122', 0),
(7, 'vuongngocnam', '4e7e9270dc88cbd961ff5e12bad98fab', 'namvuonghcm@gmail.com', 'Nam', 'VÆ°Æ¡ng Ngá»c', '0910 050 0607', '101 ÄÆ°á»ng BÃ¬nh Lá»£i - Há»“ ChÃ­ Minh - ', NULL, 1, '1341490605', '1341490605', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kn_user_group`
--

CREATE TABLE IF NOT EXISTS `kn_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comments` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `kn_user_group`
--

INSERT INTO `kn_user_group` (`id`, `name`, `alias`, `comments`) VALUES
(1, 'Guest', 'guest', 'Khách xem website, không có quyền edit bất cứ mục nào của website'),
(2, 'User', 'user', 'Khách đã đăng ký tài khoản. Có quyền thực hiện các thao tác edit được giới hạn ở trang Front end'),
(3, 'Manager', 'manager', 'Quản lý nội dung trong trang quản trị nội dung của mình. không có quyền với các nội dung của Manager khác.'),
(4, 'Administrator', 'administrator', 'Full quyền. ');

-- --------------------------------------------------------

--
-- Table structure for table `nested_menu`
--

CREATE TABLE IF NOT EXISTS `nested_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET latin1 NOT NULL,
  `parents` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `nested_menu`
--

INSERT INTO `nested_menu` (`id`, `name`, `parents`, `level`, `lft`, `rgt`) VALUES
(1, 'Director General', 0, 0, 0, 15),
(2, 'CEO', 1, 1, 5, 8),
(3, 'Maketing manager', 1, 1, 1, 4),
(4, 'Tech manager', 1, 1, 9, 14),
(5, 'Sale manager', 2, 2, 6, 7),
(6, 'Group A', 4, 2, 12, 13),
(7, 'Group B', 4, 2, 10, 11),
(8, 'Group C2', 3, 2, 2, 3);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
