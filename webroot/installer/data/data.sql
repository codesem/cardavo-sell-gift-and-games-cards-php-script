-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : Dim 25 avr. 2021 à 11:33
-- Version du serveur :  10.3.28-MariaDB
-- Version de PHP : 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cardavo`
--

-- --------------------------------------------------------

--
-- Structure de la table `ca_amounts`
--

CREATE TABLE `ca_amounts` (
  `id` int(10) NOT NULL,
  `amount` int(10) NOT NULL DEFAULT 0,
  `status` enum('on','off') NOT NULL DEFAULT 'off',
  `created` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ca_amounts`
--

INSERT INTO `ca_amounts` (`id`, `amount`, `status`, `created`) VALUES
(1, 5, 'on', NULL),
(2, 10, 'on', NULL),
(3, 15, 'on', NULL),
(4, 20, 'on', NULL),
(5, 30, 'on', NULL),
(6, 40, 'on', NULL),
(7, 50, 'on', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `ca_announcements`
--

CREATE TABLE `ca_announcements` (
  `id` int(10) UNSIGNED NOT NULL,
  `link` varchar(300) COLLATE utf8_persian_ci DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `content` text CHARACTER SET utf8 DEFAULT NULL,
  `status` enum('on','off') COLLATE utf8_persian_ci NOT NULL DEFAULT 'on',
  `created` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `ago` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ca_banlist`
--

CREATE TABLE `ca_banlist` (
  `id` int(10) NOT NULL,
  `ip_address` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reason` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('on','off') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'off',
  `created` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ca_cardcodes`
--

CREATE TABLE `ca_cardcodes` (
  `id` int(10) NOT NULL,
  `prod_id` int(10) NOT NULL DEFAULT 0,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `code` varchar(600) DEFAULT NULL,
  `status` enum('on','off','ex') NOT NULL DEFAULT 'on',
  `created` varchar(300) DEFAULT NULL,
  `ago` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ca_cardcodes`
--

INSERT INTO `ca_cardcodes` (`id`, `prod_id`, `amount`, `code`, `status`, `created`, `ago`) VALUES
(21, 24, 5.00, '111111', 'ex', '25 Jan 2021', '2021-01-25 09:55:44'),
(22, 24, 5.00, '22222', 'on', '25 Jan 2021', '2021-01-25 09:55:44'),
(23, 24, 5.00, '333333', 'on', '25 Jan 2021', '2021-01-25 09:55:44'),
(24, 24, 5.00, '444444', 'on', '25 Jan 2021', '2021-01-25 09:55:44'),
(25, 24, 5.00, '555555', 'on', '25 Jan 2021', '2021-01-25 09:55:44'),
(26, 24, 10.00, '11111', 'ex', '25 Jan 2021', '2021-01-25 09:56:01'),
(27, 24, 10.00, '222222', 'on', '25 Jan 2021', '2021-01-25 09:56:01'),
(28, 24, 10.00, '333', 'on', '25 Jan 2021', '2021-01-25 09:56:01'),
(29, 24, 10.00, '4444', 'on', '25 Jan 2021', '2021-01-25 09:56:01'),
(30, 25, 5.00, '11111', 'ex', '25 Jan 2021', '2021-01-25 09:56:17'),
(31, 25, 5.00, '222222', 'ex', '25 Jan 2021', '2021-01-25 09:56:17'),
(32, 25, 5.00, '3333', 'ex', '25 Jan 2021', '2021-01-25 09:56:17'),
(33, 25, 10.00, '11111', 'ex', '25 Jan 2021', '2021-01-25 09:56:28'),
(34, 25, 10.00, '222222', 'ex', '25 Jan 2021', '2021-01-25 09:56:28'),
(35, 25, 10.00, '3333', 'ex', '25 Jan 2021', '2021-01-25 09:56:28'),
(36, 26, 5.00, '111111', 'on', '25 Jan 2021', '2021-01-25 09:56:44'),
(37, 26, 5.00, '222222', 'on', '25 Jan 2021', '2021-01-25 09:56:44'),
(38, 26, 5.00, '33333', 'on', '25 Jan 2021', '2021-01-25 09:56:44'),
(39, 26, 10.00, '111111', 'on', '25 Jan 2021', '2021-01-25 09:56:59'),
(40, 26, 10.00, '2222222', 'on', '25 Jan 2021', '2021-01-25 09:56:59'),
(41, 26, 10.00, '3333333', 'on', '25 Jan 2021', '2021-01-25 09:56:59'),
(42, 27, 5.00, '1111', 'ex', '25 Jan 2021', '2021-01-25 09:57:19'),
(43, 27, 5.00, '222222', 'ex', '25 Jan 2021', '2021-01-25 09:57:19'),
(44, 27, 5.00, '33333', 'on', '25 Jan 2021', '2021-01-25 09:57:19'),
(45, 27, 10.00, '1111', 'on', '25 Jan 2021', '2021-01-25 09:57:29'),
(46, 27, 10.00, '2222', 'on', '25 Jan 2021', '2021-01-25 09:57:29'),
(47, 28, 5.00, '11111', 'on', '25 Jan 2021', '2021-01-25 09:57:43'),
(48, 28, 5.00, '22222', 'on', '25 Jan 2021', '2021-01-25 09:57:43'),
(49, 28, 5.00, '3333', 'on', '25 Jan 2021', '2021-01-25 09:57:43'),
(50, 28, 15.00, '111', 'on', '25 Jan 2021', '2021-01-25 09:57:53'),
(51, 28, 15.00, '222222', 'on', '25 Jan 2021', '2021-01-25 09:57:53'),
(52, 29, 5.00, '111111111', 'ex', '25 Jan 2021', '2021-01-25 09:58:05'),
(53, 29, 5.00, '222222', 'ex', '25 Jan 2021', '2021-01-25 09:58:05'),
(54, 29, 5.00, '33333', 'on', '25 Jan 2021', '2021-01-25 09:58:05'),
(55, 29, 5.00, '11111', 'on', '25 Jan 2021', '2021-01-25 09:58:20'),
(56, 29, 5.00, '22222', 'on', '25 Jan 2021', '2021-01-25 09:58:20'),
(57, 29, 5.00, '333333', 'on', '25 Jan 2021', '2021-01-25 09:58:20'),
(58, 29, 10.00, '11111', 'ex', '25 Jan 2021', '2021-01-25 09:58:38'),
(59, 29, 10.00, '2222', 'on', '25 Jan 2021', '2021-01-25 09:58:38'),
(60, 29, 10.00, '33333', 'on', '25 Jan 2021', '2021-01-25 09:58:38');

-- --------------------------------------------------------

--
-- Structure de la table `ca_categories`
--

CREATE TABLE `ca_categories` (
  `id` int(10) NOT NULL,
  `name` varchar(300) DEFAULT NULL,
  `description` varchar(15000) DEFAULT NULL,
  `link` varchar(600) DEFAULT NULL,
  `status` enum('on','off') NOT NULL DEFAULT 'on',
  `created` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ca_categories`
--

INSERT INTO `ca_categories` (`id`, `name`, `description`, `link`, `status`, `created`) VALUES
(1, 'Games', 'Games', 'games', 'on', '19 Dec 2020'),
(2, 'Gift Cards', 'Gift Cards', 'gift-cards', 'on', '19 Dec 2020'),
(4, 'Social Media', 'Social Media', 'social-media', 'on', '19 Dec 2020'),
(5, 'Software', 'Software', 'software', 'on', '19 Dec 2020');

-- --------------------------------------------------------

--
-- Structure de la table `ca_code_orders`
--

CREATE TABLE `ca_code_orders` (
  `id` int(10) NOT NULL,
  `order_id` int(10) NOT NULL DEFAULT 0,
  `prod_id` int(10) NOT NULL DEFAULT 0,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `code` varchar(600) DEFAULT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `isreviewed` enum('1','2') NOT NULL DEFAULT '2',
  `status` enum('on','off') NOT NULL DEFAULT 'on',
  `created` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ca_comments`
--

CREATE TABLE `ca_comments` (
  `id` int(10) NOT NULL,
  `prod_id` int(10) NOT NULL DEFAULT 0,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `parent_id` int(10) NOT NULL DEFAULT 0,
  `comment` varchar(2000) DEFAULT NULL,
  `created` varchar(300) DEFAULT NULL,
  `status` enum('on','off') NOT NULL DEFAULT 'on',
  `ago` timestamp NOT NULL DEFAULT current_timestamp(),
  `reported` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ca_config`
--

CREATE TABLE `ca_config` (
  `config_id` int(11) NOT NULL,
  `header` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `value` text CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Déchargement des données de la table `ca_config`
--

INSERT INTO `ca_config` (`config_id`, `header`, `value`) VALUES
(1, 'name', 'Cardavo'),
(2, 'search_form_note', 'Games Top Up and Gift Cards'),
(3, 'sumbole', '$'),
(4, 'min_deposit', '5'),
(5, 'reCAPTCHA_site_key', ''),
(6, 'reCAPTCHA_secret_key', ''),
(7, 'meta_perfix', '|'),
(8, 'icon_url', 'https://cardavo.000webhostapp.com/template/uploads/images/favicon.png'),
(9, 'site_description', 'Games Top Up & Gift Cards'),
(10, 'site_title', 'Games Top Up & Gift Cards'),
(11, 'protected_usernames', 'admin, support, username'),
(12, 'language', 'en_US'),
(13, 'support_email', ''),
(14, 'head_code', ''),
(15, 'sumbole_position', 'before'),
(16, 'amount_decimal', '2'),
(17, 'currency', 'USD'),
(18, 'fb_link', '#'),
(19, 'pin_link', '#'),
(20, 'tweet_link', '#'),
(21, 'footer_code', ''),
(22, 'logo_url', 'https://cardavo.000webhostapp.com/template/uploads/images/logo.svg'),
(23, 'logo_url_admin', 'https://cardavo.000webhostapp.com/template/uploads/images/logo-admin.svg'),
(24, 'account_activate_email', '2'),
(25, 'body_code', ''),
(26, 'captcha_type', 'recaptcha'),
(27, 'captcha_signup', '2'),
(28, 'captcha_login', '2'),
(29, 'captcha_forgot', '2'),
(30, 'keywords', 'keyword1,keyword2,keyword3'),
(31, 'enable_search_index', '2'),
(32, 'meta_img', 'https://cardavo.000webhostapp.com/template/uploads/images/meta-image.png'),
(33, 'location', ''),
(34, 'work_email', NULL),
(35, 'popular_after', '5'),
(36, 'mailer_option', 'smtp'),
(37, 'mailer_username', ''),
(38, 'mailer_host', ''),
(39, 'mailer_port', ''),
(40, 'mailer_use', 'ssl'),
(41, 'mailer_pass', ''),
(42, 'countries', 'United States, United Kingdom, Germany, France, Italy, Turkey, India, Brazil, Spain, Canada, Australia, Netherlands, Andorra, United Arab Emirates, Afghanistan, Antigua and Barbuda, Albania, Algeria, Armenia, Angola, Argentina, Austria, Aruba, Azerbaijan, Bosnia and Herzegovina, Barbados, Bangladesh, Belgium, Burkina Faso, Bulgaria, Bahrain, Burundi, Benin, Brunei, Bolivia, Bahamas, Bhutan, Botswana, Belarus, Belize, Democratic Republic of the Congo, Central African Republic, Congo, Switzerland, Ivory Coast, Chile, Cameroon, China, Colombia, Costa Rica, Cuba, Cape Verde, Cyprus, Czech Republic, Djibouti, Denmark, Dominica, Dominican Republic, Ecuador, Estonia, Egypt, Western Sahara, Eritrea, Ethiopia, Finland, Fiji, Micronesia<, Gabon, Grenada, Georgia, Ghana, Gibraltar, Greenland, Gambia, Guinea, Guadeloupe, Equatorial Guinea, Greece, Guatemala, Guinea Bissau, Guyana, Hong Kong, Honduras, Croatia, Haiti, Hungary, Indonesia, Ireland, Israel, Isle of Man, Iraq, Iran, Iceland, Jamaica, Jordan, Japan, Kenya, Kyrgyzstan, Cambodia, Kiribati, Comoros, Saint Kitts and Nevis, North Korea, South Korea, Kuwait, Kazakhstan, Laos, Lebanon<, Saint Lucia, Liechtenstein, Sri Lanka, Liberia, Lesotho, Lithuania, Luxembourg, Latvia, Libya, Morocco, Monaco, Moldova, Montenegro, Madagascar, Macedonia, Mali, Myanmar, Mongolia, Martinique, Mauritania, Malta, Mauritius, Maldives, Malawi, Mexico, Malaysia, Mozambique, Namibia, Niger, Nigeria, Nicaragua, Norway, Nepal, New Zealand, Oman, Panama, Peru, French Polynesia, Papua New Guinea, Philippines<, Pakistan, Poland, Puerto Rico, Palestine, Portugal, Palau, Paraguay, Qatar, Romania, Serbia, Russia, Rwanda, Saudi Arabia, Solomon Islands, Seychelles, Sudan, Sweden, Singapore, Slovenia, Slovakia, Sierra Leone, San Marino, Senegal, Somalia, Suriname, Sao Tome and Principe, El Salvador, Syria<, Swaziland, Chad, Togo, Thailand, Tajikistan, Turkmenistan, Tunisia, Tonga<, East Timor, Trinidad and Tobago, Tuvalu, Taiwan, Tanzania, Ukraine, Uganda, Scotland, Uruguay, Uzbekistan, Saint Vincent and the Grenadines, Venezuela, Virgin Islands, Vietnam, Vanuatu, Samoa, Yemen, South Africa, Zambia, Zimbabwe		'),
(43, 'mode_demo', '2');

-- --------------------------------------------------------

--
-- Structure de la table `ca_currencies`
--

CREATE TABLE `ca_currencies` (
  `id` int(10) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `symbol` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `created` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `ca_currencies`
--

INSERT INTO `ca_currencies` (`id`, `name`, `symbol`, `status`, `created`) VALUES
(1, 'USD', '$', '1', '05 May 2019'),
(2, 'GBP', '&#163', '1', '05 May 2019'),
(3, 'EUR', '&euro;', '1', '05 May 2019'),
(4, 'INR', '&#8377;', '1', '05 May 2019');

-- --------------------------------------------------------

--
-- Structure de la table `ca_dmethods`
--

CREATE TABLE `ca_dmethods` (
  `id` int(10) NOT NULL,
  `role` enum('1','2') NOT NULL DEFAULT '2',
  `name` varchar(300) DEFAULT NULL,
  `methods` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `account` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `public_key` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `secret_key` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `ip_url` varchar(300) DEFAULT NULL,
  `tax_percent` varchar(100) NOT NULL DEFAULT '0',
  `status` enum('on','off') CHARACTER SET utf8 DEFAULT 'on' COMMENT 'on=active, off=inactive',
  `created` varchar(300) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ca_dmethods`
--

INSERT INTO `ca_dmethods` (`id`, `role`, `name`, `methods`, `account`, `public_key`, `secret_key`, `ip_url`, `tax_percent`, `status`, `created`) VALUES
(2, '2', 'Coinbase', 'coinbase', '', '', '', 'ipn/cbs_handler', '1', 'off', ''),
(1, '1', 'PayPal', 'paypal', '', '', '', 'ipn/ppl_handler', '3', 'on', '27 Aug 2020'),
(3, '2', 'Stripe', 'stripe', '', '', '', NULL, '2', 'off', '332');

-- --------------------------------------------------------

--
-- Structure de la table `ca_invoice`
--

CREATE TABLE `ca_invoice` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `cart_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `method` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `token` varchar(600) DEFAULT NULL,
  `status_text` varchar(300) NOT NULL DEFAULT 'Waiting...',
  `total` decimal(20,2) NOT NULL DEFAULT 0.00,
  `type` enum('1','2') NOT NULL DEFAULT '1',
  `status` enum('on','off') CHARACTER SET utf8 NOT NULL DEFAULT 'off' COMMENT 'on=paid,off=unpaid',
  `created` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `ago` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ca_members`
--

CREATE TABLE `ca_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `role` enum('user','admin') CHARACTER SET utf8 DEFAULT 'user',
  `status` enum('1','2','3') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '1=active, 2=inactive, 3=pending',
  `username` varchar(200) COLLATE utf8_persian_ci DEFAULT NULL,
  `password` varchar(200) COLLATE utf8_persian_ci DEFAULT NULL,
  `email` varchar(300) COLLATE utf8_persian_ci DEFAULT NULL,
  `parent_id` int(11) UNSIGNED DEFAULT NULL,
  `balance` decimal(20,2) NOT NULL DEFAULT 0.00,
  `deposit_balance` decimal(20,2) NOT NULL DEFAULT 0.00,
  `first_name` varchar(300) COLLATE utf8_persian_ci DEFAULT NULL,
  `last_name` varchar(300) COLLATE utf8_persian_ci DEFAULT NULL,
  `address_one` varchar(600) COLLATE utf8_persian_ci DEFAULT NULL,
  `address_two` varchar(600) COLLATE utf8_persian_ci DEFAULT NULL,
  `order_notification` enum('on','off') COLLATE utf8_persian_ci NOT NULL DEFAULT 'on',
  `deposit_notification` enum('on','off') COLLATE utf8_persian_ci NOT NULL DEFAULT 'on',
  `support_notification` enum('on','off') COLLATE utf8_persian_ci NOT NULL DEFAULT 'on',
  `country` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
  `login_ip` varchar(500) COLLATE utf8_persian_ci DEFAULT NULL,
  `register_ip` varchar(500) COLLATE utf8_persian_ci DEFAULT NULL,
  `created` varchar(50) COLLATE utf8_persian_ci DEFAULT NULL,
  `token` varchar(50) COLLATE utf8_persian_ci DEFAULT NULL,
  `isactivated` enum('1','2') COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ca_notifications`
--

CREATE TABLE `ca_notifications` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `prod_id` int(10) NOT NULL DEFAULT 0,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `type` enum('support','order','deposit') COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `isread` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '2',
  `created` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ago` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ca_orders`
--

CREATE TABLE `ca_orders` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `codes` int(10) NOT NULL DEFAULT 0,
  `status` enum('on','off') NOT NULL DEFAULT 'on',
  `created` varchar(300) DEFAULT NULL,
  `ago` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ca_pages`
--

CREATE TABLE `ca_pages` (
  `id` int(10) NOT NULL,
  `link` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `short` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `protect` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '2',
  `status` enum('on','off') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'on',
  `created` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `ca_pages`
--

INSERT INTO `ca_pages` (`id`, `link`, `title`, `content`, `short`, `protect`, `status`, `created`) VALUES
(1, 'terms-conditions', 'Terms & Conditions', 'Terms & Conditions', NULL, '1', 'on', '08 Apr 2019'),
(2, 'privacy-policy', 'Privacy Policy\r\n', 'Privacy Policy', NULL, '1', 'on', '08 Apr 2019'),
(3, 'about-us', 'About us', '<p>About-us</p>\r\n', 'About-us\r\n', '1', 'on', '25 Dec 2020'),
(4, 'faqs', 'Faqs', '<p>faq</p>\r\n', 'faq\r\n', '1', 'on', '25 Dec 2020'),
(5, 'order-return', 'Order Return', '<p>Order Return</p>\r\n', 'Order Return\r\n', '1', 'on', '28 Jan 2021');

-- --------------------------------------------------------

--
-- Structure de la table `ca_payments`
--

CREATE TABLE `ca_payments` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `txn_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `item_number` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `payment_gross` decimal(20,2) DEFAULT 0.00,
  `crypto_am` decimal(20,8) DEFAULT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `payment_status` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `created` varchar(20) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ca_prices`
--

CREATE TABLE `ca_prices` (
  `id` int(10) NOT NULL,
  `prod_id` int(10) NOT NULL DEFAULT 0,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `price` decimal(20,2) NOT NULL DEFAULT 0.00,
  `status` enum('on','off') NOT NULL,
  `ago` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ca_prices`
--

INSERT INTO `ca_prices` (`id`, `prod_id`, `amount`, `price`, `status`, `ago`) VALUES
(8, 21, 5.00, 0.00, 'on', '2020-12-27 10:51:37'),
(9, 21, 10.00, 0.00, 'on', '2020-12-27 10:51:37'),
(10, 21, 15.00, 0.00, 'on', '2020-12-27 10:51:37'),
(11, 21, 20.00, 0.00, 'on', '2020-12-27 10:51:37'),
(12, 22, 5.00, 5.10, 'on', '2020-12-27 17:22:25'),
(13, 22, 10.00, 10.15, 'on', '2020-12-27 17:22:25'),
(14, 22, 15.00, 15.20, 'on', '2020-12-27 17:22:25'),
(15, 22, 20.00, 20.50, 'on', '2020-12-27 17:22:25'),
(16, 23, 5.00, 5.10, 'on', '2020-12-29 09:31:30'),
(17, 23, 10.00, 10.15, 'on', '2020-12-29 09:31:30'),
(18, 23, 15.00, 15.20, 'on', '2020-12-29 09:31:30'),
(19, 23, 20.00, 20.50, 'on', '2020-12-29 09:31:30'),
(23, 24, 5.00, 5.12, 'on', '2021-01-25 09:32:51'),
(24, 24, 10.00, 10.33, 'on', '2021-01-25 09:32:51'),
(25, 24, 15.00, 15.40, 'on', '2021-01-25 09:32:51'),
(26, 24, 20.00, 20.80, 'on', '2021-01-25 09:32:51'),
(27, 25, 5.00, 5.11, 'on', '2021-01-25 09:36:29'),
(28, 25, 10.00, 10.22, 'on', '2021-01-25 09:36:29'),
(29, 25, 15.00, 15.33, 'on', '2021-01-25 09:36:29'),
(30, 25, 20.00, 20.50, 'on', '2021-01-25 09:36:29'),
(31, 26, 5.00, 5.12, 'on', '2021-01-25 09:38:44'),
(32, 26, 10.00, 10.20, 'on', '2021-01-25 09:38:44'),
(33, 26, 15.00, 15.50, 'on', '2021-01-25 09:38:44'),
(34, 26, 20.00, 21.00, 'on', '2021-01-25 09:38:44'),
(35, 27, 5.00, 5.20, 'on', '2021-01-25 09:40:12'),
(36, 27, 10.00, 10.30, 'on', '2021-01-25 09:40:12'),
(37, 27, 15.00, 15.50, 'on', '2021-01-25 09:40:12'),
(38, 27, 20.00, 21.00, 'on', '2021-01-25 09:40:12'),
(39, 28, 5.00, 5.12, 'on', '2021-01-25 09:42:26'),
(40, 28, 10.00, 10.20, 'on', '2021-01-25 09:42:26'),
(41, 28, 15.00, 15.20, 'on', '2021-01-25 09:42:26'),
(42, 28, 20.00, 20.50, 'on', '2021-01-25 09:42:26'),
(43, 29, 5.00, 5.12, 'on', '2021-01-25 09:43:33'),
(44, 29, 10.00, 10.20, 'on', '2021-01-25 09:43:33'),
(45, 29, 15.00, 15.50, 'on', '2021-01-25 09:43:33'),
(46, 29, 20.00, 21.00, 'on', '2021-01-25 09:43:33'),
(47, 30, 5.00, 0.00, 'on', '2021-04-25 06:42:15'),
(48, 30, 10.00, 0.00, 'on', '2021-04-25 06:42:15'),
(49, 30, 15.00, 0.00, 'on', '2021-04-25 06:42:15'),
(50, 30, 20.00, 0.00, 'on', '2021-04-25 06:42:15');

-- --------------------------------------------------------

--
-- Structure de la table `ca_products`
--

CREATE TABLE `ca_products` (
  `id` int(10) NOT NULL,
  `link` varchar(600) DEFAULT NULL,
  `name` varchar(300) DEFAULT NULL,
  `price` varchar(300) NOT NULL DEFAULT '5,20',
  `description` varchar(15000) CHARACTER SET utf8 DEFAULT NULL,
  `short_desc` varchar(150) DEFAULT NULL,
  `icon_img` varchar(300) DEFAULT NULL,
  `preview_img` varchar(300) DEFAULT NULL,
  `tags` varchar(300) DEFAULT NULL,
  `category` int(10) NOT NULL DEFAULT 0,
  `subcat` int(10) NOT NULL DEFAULT 0,
  `is_popular` enum('1','2') NOT NULL DEFAULT '2',
  `stars` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `sales` int(10) NOT NULL DEFAULT 0,
  `status` enum('on','off') NOT NULL DEFAULT 'on',
  `created` varchar(300) DEFAULT NULL,
  `ago` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ca_products`
--

INSERT INTO `ca_products` (`id`, `link`, `name`, `price`, `description`, `short_desc`, `icon_img`, `preview_img`, `tags`, `category`, `subcat`, `is_popular`, `stars`, `sales`, `status`, `created`, `ago`) VALUES
(24, 'google-play-gift-card', 'GOOGLE PLAY GIFT CARD', '5, 20', '<p><em><strong>GOOGLE PLAY GIFT CARD DETAILS</strong></em></p>\r\n\r\n<p><span style=\"color:#c0392b\"><u><strong>NICE DESCRIPTION WITH STYLE</strong></u></span></p>\r\n', 'GOOGLE PLAY GIFT CARD DETAILS\r\n\r\nNICE DESCRIPTION WITH STYLE\r\n', 'icon/icon_1611570771.png', 'preview/preview_1611570771.png', 'google play,gift cards', 2, 0, '1', '0', 0, 'on', '25 Jan 2021', '2021-01-25 09:32:51'),
(25, 'free-fire-shells', 'FREE FIRE SHELLS', '5, 20', '<p><u><strong>FREE FIRE SHELLS</strong></u></p>\r\n', 'FREE FIRE SHELLS\r\n', 'icon/icon_1611570990.png', 'preview/preview_1611570990.png', 'free fire,shells', 1, 0, '1', '0', 0, 'on', '25 Jan 2021', '2021-01-25 09:36:29'),
(26, 'playstation-card', 'Playstation Card', '5, 20', '<p><u><strong>Playstation Card</strong></u></p>\r\n', 'Playstation Card\r\n', 'icon/icon_1611571124.png', 'preview/preview_1611571124.png', 'Playstation,gift card', 2, 0, '2', '0', 0, 'on', '25 Jan 2021', '2021-01-25 09:38:44'),
(27, 'apple-card', 'Apple Card', '5, 20', '<p><u><strong>Apple Card</strong></u></p>\r\n', 'Apple Card\r\n', 'icon/icon_1611571212.png', 'preview/preview_1611571212.png', 'apple,gift card', 2, 0, '1', '0', 0, 'on', '25 Jan 2021', '2021-01-25 09:40:12'),
(28, 'legend-of-league', 'Legend of League', '5, 20', '<p><u><strong>Legend of League</strong></u></p>\r\n', 'Legend of League\r\n', 'icon/icon_1611571346.png', 'preview/preview_1611571346.png', 'Legend of League', 1, 0, '2', '0', 0, 'on', '25 Jan 2021', '2021-01-25 09:42:26'),
(29, 'pubg-mobile', 'Pubg Mobile', '5, 20', '<p><u><strong>Pubg Mobile</strong></u></p>\r\n', 'Pubg Mobile\r\n', 'icon/icon_1611571414.png', 'preview/preview_1611571414.png', 'Pubg Mobile,daimonds', 1, 0, '1', '0', 0, 'on', '25 Jan 2021', '2021-01-25 09:43:33');

-- --------------------------------------------------------

--
-- Structure de la table `ca_rating`
--

CREATE TABLE `ca_rating` (
  `id` int(10) NOT NULL,
  `prod_id` int(10) NOT NULL DEFAULT 0,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `review` varchar(12000) DEFAULT NULL,
  `stars` enum('1','2','3','4','5') NOT NULL DEFAULT '1',
  `status` enum('on','off') NOT NULL DEFAULT 'on',
  `created` varchar(300) DEFAULT NULL,
  `ago` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ca_reports`
--

CREATE TABLE `ca_reports` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `reporter_user_id` int(10) NOT NULL DEFAULT 0,
  `prod_id` int(10) NOT NULL DEFAULT 0,
  `report_id` int(10) NOT NULL DEFAULT 0,
  `status` enum('on','off') NOT NULL DEFAULT 'on',
  `created` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ca_support`
--

CREATE TABLE `ca_support` (
  `id` int(10) NOT NULL,
  `sub_id` int(10) NOT NULL DEFAULT 0,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `full_name` varchar(300) DEFAULT NULL,
  `email` varchar(300) DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `message` varchar(12000) DEFAULT NULL,
  `status` enum('open','answered','closed') NOT NULL DEFAULT 'open',
  `created` varchar(300) DEFAULT NULL,
  `ago` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ca_themes`
--

CREATE TABLE `ca_themes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `version` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `author` varchar(300) DEFAULT NULL,
  `screen` varchar(300) DEFAULT 'images/theme.png',
  `status` enum('1','2') CHARACTER SET utf8 NOT NULL DEFAULT '2' COMMENT '1=active,2=inactive',
  `created` varchar(50) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ca_themes`
--

INSERT INTO `ca_themes` (`id`, `name`, `version`, `author`, `screen`, `status`, `created`) VALUES
(1, 'main', '1.0.0', 'Qutescripts', 'images/theme.png', '1', '21/04/18 , 09:20 AM');

-- --------------------------------------------------------

--
-- Structure de la table `ca_uploads`
--

CREATE TABLE `ca_uploads` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `name` varchar(300) DEFAULT NULL,
  `path` varchar(600) DEFAULT NULL,
  `type` enum('png','jpeg','gif','jpg','svg','zip') DEFAULT 'png',
  `ftype` enum('image','file') NOT NULL DEFAULT 'image',
  `width` varchar(300) DEFAULT NULL,
  `height` varchar(300) DEFAULT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1',
  `created` varchar(300) DEFAULT NULL,
  `ago` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ca_amounts`
--
ALTER TABLE `ca_amounts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ca_announcements`
--
ALTER TABLE `ca_announcements`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ca_banlist`
--
ALTER TABLE `ca_banlist`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ca_cardcodes`
--
ALTER TABLE `ca_cardcodes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ca_categories`
--
ALTER TABLE `ca_categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ca_code_orders`
--
ALTER TABLE `ca_code_orders`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ca_comments`
--
ALTER TABLE `ca_comments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ca_config`
--
ALTER TABLE `ca_config`
  ADD PRIMARY KEY (`config_id`);

--
-- Index pour la table `ca_currencies`
--
ALTER TABLE `ca_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ca_dmethods`
--
ALTER TABLE `ca_dmethods`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ca_invoice`
--
ALTER TABLE `ca_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ca_members`
--
ALTER TABLE `ca_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Index pour la table `ca_notifications`
--
ALTER TABLE `ca_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ca_orders`
--
ALTER TABLE `ca_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `ca_pages`
--
ALTER TABLE `ca_pages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ca_payments`
--
ALTER TABLE `ca_payments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ca_prices`
--
ALTER TABLE `ca_prices`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ca_products`
--
ALTER TABLE `ca_products`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ca_rating`
--
ALTER TABLE `ca_rating`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ca_reports`
--
ALTER TABLE `ca_reports`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ca_support`
--
ALTER TABLE `ca_support`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ca_themes`
--
ALTER TABLE `ca_themes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ca_uploads`
--
ALTER TABLE `ca_uploads`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `ca_amounts`
--
ALTER TABLE `ca_amounts`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `ca_announcements`
--
ALTER TABLE `ca_announcements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ca_banlist`
--
ALTER TABLE `ca_banlist`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ca_cardcodes`
--
ALTER TABLE `ca_cardcodes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT pour la table `ca_categories`
--
ALTER TABLE `ca_categories`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `ca_code_orders`
--
ALTER TABLE `ca_code_orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ca_comments`
--
ALTER TABLE `ca_comments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ca_config`
--
ALTER TABLE `ca_config`
  MODIFY `config_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT pour la table `ca_currencies`
--
ALTER TABLE `ca_currencies`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `ca_dmethods`
--
ALTER TABLE `ca_dmethods`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `ca_invoice`
--
ALTER TABLE `ca_invoice`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ca_members`
--
ALTER TABLE `ca_members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ca_notifications`
--
ALTER TABLE `ca_notifications`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ca_orders`
--
ALTER TABLE `ca_orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ca_pages`
--
ALTER TABLE `ca_pages`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `ca_payments`
--
ALTER TABLE `ca_payments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ca_prices`
--
ALTER TABLE `ca_prices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `ca_products`
--
ALTER TABLE `ca_products`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `ca_rating`
--
ALTER TABLE `ca_rating`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ca_reports`
--
ALTER TABLE `ca_reports`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ca_support`
--
ALTER TABLE `ca_support`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ca_themes`
--
ALTER TABLE `ca_themes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `ca_uploads`
--
ALTER TABLE `ca_uploads`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ca_members`
--
ALTER TABLE `ca_members`
  ADD CONSTRAINT `ca_members_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `ca_members` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
