-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2022 at 10:29 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sayyor`
--

-- --------------------------------------------------------

--
-- Table structure for table `animals`
--

CREATE TABLE `animals` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `gender` smallint(6) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `inn` varchar(255) DEFAULT NULL,
  `pnfl` varchar(255) DEFAULT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `vet_site_id` int(11) DEFAULT NULL,
  `bsual_tag` varchar(255) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `animals`
--

INSERT INTO `animals` (`id`, `name`, `cat_id`, `gender`, `birthday`, `inn`, `pnfl`, `adress`, `vet_site_id`, `bsual_tag`, `type_id`) VALUES
(25, '1', 1, 1, '2018-10-04', '201333798', '', 'asd', 1, 'UZN100006406', 1),
(26, '1', 1, 1, '2018-10-04', '201333798', '', 'asd', 1, 'UZN100006406', 1),
(27, '1', 1, 1, '2018-10-04', '201333798', '', 'asd', 1, 'UZN100006406', 1),
(28, '1', 1, 1, '2018-10-04', '201333798', '', 'asd', 1, 'UZN100006406', 1),
(29, '1', 1, 1, '2018-10-04', '201333798', '', 'asd', 1, 'UZN100006406', 1),
(30, '1', 1, 1, '2018-10-04', '201333798', '', 'asd', 1, 'UZN100006406', 1);

-- --------------------------------------------------------

--
-- Table structure for table `animaltype`
--

CREATE TABLE `animaltype` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(100) NOT NULL,
  `name_ru` varchar(255) NOT NULL,
  `vet4` varchar(2) NOT NULL,
  `code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `animaltype`
--

INSERT INTO `animaltype` (`id`, `name_uz`, `name_ru`, `vet4`, `code`) VALUES
(1, 'Qoramol', 'Крупно рогатый скот (КРС)', '02', 1),
(2, 'Qo`y', 'Баран (МРС)', '03', 2),
(3, 'Echki', 'Коза (МРС)', '03', 2),
(4, 'Tuya', 'Верблюд', '06', 3),
(5, 'Ot', 'Лошадь', '01', 4),
(6, 'Eshak', 'Осёл', '08', 5),
(7, 'Cho\'chqa', 'Свинья', '04', 6),
(8, 'It', 'Собака', '13', 7),
(9, 'Mushuk', 'Кошка', '14', 8),
(10, 'Boshqa hayvonlar', 'Другие животние', '15', 9),
(11, 'Qushlar', 'Птици', '05', 10),
(12, 'Mo\'ynali hayvonlar', 'Пушные звери', '09', 11),
(13, 'Quyonsimonlar', 'Зайцевые', '10', 12),
(14, 'Baliqlar', 'Рыбы', '19', 13),
(15, 'Asalari', 'Пчёлы', '16', 14),
(16, 'Bug\'ular', 'Олен', '07', 15),
(17, 'Ovalydigan yovvoyi hayvonlar', 'Промысловые и дикие ', '11', 16),
(18, 'Kemirovchilar', 'грызуны', '12', 17),
(19, 'Ipak qurti', 'шелкопряд', '17', 18),
(20, 'Lasoslar', 'ласовые ', '31', 19),
(21, 'Forel', 'Форель', '28', 20),
(22, 'Karplar', 'карповые', '23', 21),
(23, 'Gidrobiontlar', 'гидробионты', '15', 22);

-- --------------------------------------------------------

--
-- Table structure for table `animal_category`
--

CREATE TABLE `animal_category` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `name_uz` varchar(255) NOT NULL,
  `name_ru` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `animal_category`
--

INSERT INTO `animal_category` (`id`, `code`, `name_uz`, `name_ru`) VALUES
(1, 1, 'Tirik', 'Живой'),
(2, 2, 'O\'lik', 'Мертвый');

-- --------------------------------------------------------

--
-- Table structure for table `animal_status`
--

CREATE TABLE `animal_status` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(255) DEFAULT NULL,
  `name_ru` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `composite_samples`
--

CREATE TABLE `composite_samples` (
  `sample_id` int(11) NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  `registration_id` int(11) NOT NULL,
  `ads` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_status_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `composite_samples`
--

INSERT INTO `composite_samples` (`sample_id`, `status_id`, `registration_id`, `ads`, `sample_status_id`) VALUES
(24, 1, 23, 'Namunani Namuna egasi olib ketdi', 2),
(25, 5, 24, '', 1),
(26, 5, 24, '', 1),
(27, 5, 24, '', 1),
(28, 5, 24, '', 1),
(29, 1, 24, '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `countres`
--

CREATE TABLE `countres` (
  `id` int(11) NOT NULL,
  `code` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_uz` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ru` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countres`
--

INSERT INTO `countres` (`id`, `code`, `name_uz`, `name_ru`) VALUES
(1, 'AB', 'Abxaziya', 'Абхазия'),
(2, 'AD', 'Andorra', 'Андорра'),
(3, 'AE', 'Birlashgan Arab Amirliklari', 'Объединенные арабские эмираты'),
(4, 'AF', 'Afg‘oniston', 'Афганистан'),
(5, 'AG', 'Antigua va Barbuda', 'Антигуа и Барбуда'),
(6, 'AI', 'Angliya', 'Англия'),
(7, 'AL', 'Albaniya', 'Албания'),
(8, 'AM', 'Armaniston', 'Армения'),
(9, 'AO', 'Angola', 'Ангола'),
(10, 'AQ', 'Antarktida', 'Антарктида'),
(11, 'AR', 'Argentina', 'Аргентина'),
(12, 'AT', 'Avstriya', 'Австрия'),
(13, 'AU', 'Avstraliya', 'Австралия'),
(14, 'AW', 'Aruba', 'Аруба'),
(15, 'AZ', 'Ozarbayjon', 'Азербайджан'),
(16, 'BA', 'Bosniya va Gersegovina', 'Босния и Герцеговина'),
(17, 'BB', 'Barbados', 'Барбадос'),
(18, 'BD', 'Bangladesh', 'Бангладеш'),
(19, 'BE', 'Belgiya', 'Бельгия'),
(20, 'BF', 'Burkina-Faso', 'Буркина-Фасо'),
(21, 'BG', 'Bolgariya', 'Болгария'),
(22, 'BH', 'Bahrayn', 'Бахрейн'),
(23, 'BI', 'Burundi', 'Бурунди'),
(24, 'BJ', 'Benin', 'Бенин'),
(25, 'BL', 'San-Bartelemi', 'Сан-Бартелеми'),
(26, 'BN', 'Bruney', 'Бруней'),
(27, 'BO', 'Boliviya', 'Боливия'),
(28, 'BR', 'Braziliya', 'Бразилия'),
(29, 'BT', 'Butan', 'Бутан'),
(30, 'BW', 'Botsvana', 'Ботсвана'),
(31, 'BY', 'Belorussiya', 'Белоруссия'),
(32, 'BZ', 'Beliz', 'Белиз'),
(33, 'CA', 'Kanada', 'Канада'),
(34, 'CF', 'Markaziy-Afrika respublikasi', 'Центрально-Африканская Республика'),
(35, 'CG', 'Kongo', 'Конго'),
(36, 'CH', 'Shveysariya', 'Швейцария'),
(37, 'CI', 'Kot-divuar', 'Кот-дивуар'),
(38, 'CL', 'Chili', 'Чили'),
(39, 'CM', 'Kamerun', 'Камерун'),
(40, 'CN', 'Xitoy', 'Китай'),
(41, 'CO', 'Kolumbiya', 'Колумбия'),
(42, 'code', 'name_uz', 'name_ru'),
(43, 'CR', 'Kostarika', 'Коста-Рика'),
(44, 'CU', 'Kuba', 'Куба'),
(45, 'CW', 'Kyurasao', 'Кюрасао'),
(46, 'CY', 'Kipr', 'Кипр'),
(47, 'CZ', 'Chexiya', 'Чехия'),
(48, 'DE', 'Germaniya', 'Германия'),
(49, 'DK', 'Daniya', 'Дания'),
(50, 'DM', 'Dominika', 'Доминика'),
(51, 'DZ', 'Aljir', 'Алжир'),
(52, 'EC', 'Ekvador', 'Эквадор'),
(53, 'EE', 'Estoniya', 'Эстония'),
(54, 'EG', 'Misr', 'Египет'),
(55, 'EH', 'G‘arbiy Saxara', 'Западная Сахара'),
(56, 'ER', 'Eritreya', 'Эритрея'),
(57, 'ES', 'Ispaniya', 'Испания'),
(58, 'ET', 'Efiopiya', 'Эфиопия'),
(59, 'FI', 'Finlandiya', 'Финляндия'),
(60, 'FR', 'Fransiya', 'Франция'),
(61, 'GA', 'Gabon', 'Габон'),
(62, 'GB', 'Buyuk Britaniya', 'Великобритания'),
(63, 'GD', 'Grenada', 'Гренада'),
(64, 'GE', 'Gruziya', 'Грузия'),
(65, 'GH', 'Gana', 'Гана'),
(66, 'GI', 'Gibraltar', 'Гибралтар'),
(67, 'GL', 'Grenlandiya', 'Гренландия'),
(68, 'GM', 'Gambiya', 'Гамбия'),
(69, 'GN', 'Gvineya', 'Гвинея'),
(70, 'GP', 'Gvadelupa', 'Гваделупа'),
(71, 'GQ', 'Ekvatorial gvineyasi', 'Гвинея экваториальная'),
(72, 'GR', 'Gresiya', 'Греция'),
(73, 'GT', 'Gvatemala', 'Гватемала'),
(74, 'GU', 'Guam', 'Гуам'),
(75, 'GW', 'Gvineya-Bisay', 'Гвинея-Бисай'),
(76, 'GY', 'Gayana', 'Гаяна'),
(77, 'HK', 'Gonkong', 'Гонконг'),
(78, 'HN', 'Gonduras', 'Гондурас'),
(79, 'HR', 'Xorvatiya', 'Хорватия'),
(80, 'HT', 'Gaiti', 'Гаити'),
(81, 'HU', 'Vengriya', 'Венгрия'),
(82, 'ID', 'Indoneziya', 'Индонезия'),
(83, 'IE', 'Irlandiya', 'Ирландия'),
(84, 'IL', 'Isroil', 'Израиль'),
(85, 'IN', 'Hindiston', 'Индия'),
(86, 'IQ', 'Iroq', 'Ирак'),
(87, 'IR', 'Eron', 'Иран'),
(88, 'IS', 'Islandiya', 'Исландия'),
(89, 'IT', 'Italiya', 'Италия'),
(90, 'JE', 'Jersi', 'Жерси'),
(91, 'JM', 'Yamayka', 'Ямайка'),
(92, 'JO', 'Iordaniya', 'Иордания'),
(93, 'JP', 'Yaponiya', 'Япония'),
(94, 'KE', 'Keniya', 'Кения'),
(95, 'KG', 'Qirg‘iziston', 'Киргизия'),
(96, 'KH', 'Kambodja', 'Камбоджа'),
(97, 'KI', 'Kiribati', 'Кирибати'),
(98, 'KP', 'Koreya xalq-demokratik respublikasi', 'Народно-демократическая республика Корея'),
(99, 'KR', 'Janubiy Koreya', 'Южная Корея'),
(100, 'KW', 'Quvayt', 'Кувейт'),
(101, 'KZ', 'Qozog‘iston', 'Казахстан'),
(102, 'LA', 'Laos', 'Лаос'),
(103, 'LB', 'Livan', 'Ливан'),
(104, 'LC', 'Sent-Lyus', 'Сент-Люс'),
(105, 'LI', 'Lixtenshteyn', 'Лихтенштейн'),
(106, 'LK', 'Shrilanka', 'Шри-Ланка'),
(107, 'LR', 'Liberiya', 'Либерия'),
(108, 'LS', 'Lesoto', 'Лесото'),
(109, 'LT', 'Litva', 'Литва'),
(110, 'LU', 'Luksemburg', 'Люксембург'),
(111, 'LV', 'Latviya', 'Латвия'),
(112, 'MA', 'Marokash', 'Марракеш'),
(113, 'MC', 'Monako', 'Монако'),
(114, 'MD', 'Moldova', 'Молдова'),
(115, 'ME', 'Chernogoriya', 'Черногория'),
(116, 'MF', 'Sen-Marten', 'Сен-Мартен'),
(117, 'MG', 'Madagaskar', 'Мадагаскар'),
(118, 'MK', 'Makedoniya', 'Македония'),
(119, 'ML', 'Mali', 'Мали'),
(120, 'MM', 'Myanma', 'Мьянма'),
(121, 'MN', 'Mongoliya', 'Монголия'),
(122, 'MO', 'Makao', 'Макао'),
(123, 'MQ', 'Martinika', 'Мартиника'),
(124, 'MR', 'Mavritaniya', 'Мавритания'),
(125, 'MS', 'Monserrat', 'Монсеррат'),
(126, 'MT', 'Malta', 'Мальта'),
(127, 'MU', 'Mavrikiya', 'Маврикия'),
(128, 'MW', 'Malavi', 'Малави'),
(129, 'MX', 'Meksika', 'Мексика'),
(130, 'MY', 'Malayziya', 'Малайзия'),
(131, 'MZ', 'Mozambik', 'Мозамбик'),
(132, 'NA', 'Namibiya', 'Намибия'),
(133, 'NC', 'Yangi Kaledoniya', 'Новая Каледония'),
(134, 'NE', 'Niger', 'Нигер'),
(135, 'NG', 'Nigeriya', 'Нигерия'),
(136, 'NI', 'Nikaragua', 'Никарагуа'),
(137, 'NL', 'Niderlandiya', 'Нидерланды'),
(138, 'NO', 'Norvegiya', 'Норвегия'),
(139, 'NP', 'Nepal', 'Непал'),
(140, 'NR', 'Nauru', 'Науру'),
(141, 'NZ', 'Yangi Zellandiya', 'Новая Зеландия'),
(142, 'OM', 'Oman', 'Оман'),
(143, 'OS', 'Janubiy Osetiya', 'Южная Осетия'),
(144, 'PA', 'Panama', 'Панама'),
(145, 'PE', 'Peru', 'Перу'),
(146, 'PH', 'Filippin', 'Филиппин'),
(147, 'PK', 'Pokiston', 'Пакистан'),
(148, 'PL', 'Polsha', 'Польша'),
(149, 'PN', 'Pitkern', 'Питкерн'),
(150, 'PR', 'Puerto-Riko', 'Пуэрто-Рико'),
(151, 'PT', 'Portugaliya', 'Португалия'),
(152, 'PW', 'Palau', 'Палау'),
(153, 'PY', 'Paragvay', 'Парагвай'),
(154, 'QA', 'Qatar', 'Катар'),
(155, 'RO', 'Ruminiya', 'Румыния'),
(156, 'RS', 'Serbia', 'Сербия'),
(157, 'RU', 'Rossiya', 'Россия'),
(158, 'RW', 'Ruanda', 'Руанда'),
(159, 'SA', 'Saudiya Arabistoni', 'Саудовская Аравия'),
(160, 'SD', 'Sudan', 'Судан'),
(161, 'SE', 'Shvesiya', 'Швеция'),
(162, 'SG', 'Singapur', 'Сингапур'),
(163, 'SI', 'Sloveniya', 'Словения'),
(164, 'SK', 'Slovakiya', 'Словакия'),
(165, 'SL', 'Sierra-lion', 'Сьерра-Леоне'),
(166, 'SM', 'San-Marino', 'Сан-Марино'),
(167, 'SN', 'Senegal', 'Сенегал'),
(168, 'SO', 'Somali', 'Сомали'),
(169, 'SR', 'Surinam', 'Суринам'),
(170, 'ST', 'San-Tome va Prinsipi', 'Сан-Томе и Принсипи'),
(171, 'SV', 'El-Salvador', 'Эл-Сальвадор'),
(172, 'SY', 'Suriya', 'Сирия'),
(173, 'SZ', 'Svazilend', 'Свазиленд'),
(174, 'TD', 'Chad', 'Чад'),
(175, 'TG', 'Togo', 'Того'),
(176, 'TH', 'Tayland', 'Таиланд'),
(177, 'TJ', 'Tojikiston', 'Таджикистан'),
(178, 'TK', 'Tokelau', 'Токелау'),
(179, 'TL', 'Timor-Leste', 'Тимор-Лесте'),
(180, 'TM', 'Turkmaniston', 'Туркменистан'),
(181, 'TN', 'Tunis', 'Тунис'),
(182, 'TO', 'Tonga', 'Тонга'),
(183, 'TR', 'Turkiya', 'Турция'),
(184, 'TT', 'Trinidad va Tobago', 'Тринидад и Тобаго'),
(185, 'TV', 'Tuvalu', 'Тувалу'),
(186, 'TW', 'Tayvan', 'Тайвань'),
(187, 'TZ', 'Tanzaniya', 'Танзания'),
(188, 'UA', 'Ukraina', 'Украина'),
(189, 'UG', 'Uganda', 'Уганда'),
(190, 'US', 'Amerika Qo‘shma Shtatlari', 'Соединенные Штаты Америка'),
(191, 'UY', 'Urugvay', 'Уругвай'),
(192, 'UZ', 'O‘zbekiston', 'Узбекистан'),
(193, 'VN', 'Vetnam', 'Вьетнам'),
(194, 'VU', 'Vanuatu', 'Вануату'),
(195, 'WS', 'Samoa', 'Самоа'),
(196, 'YE', 'Yaman', 'Йемен'),
(197, 'YT', 'Mayotta', 'Маётта'),
(198, 'ZA', 'Janubiy Afrika', 'Южная Африка'),
(199, 'ZM', 'Zambiya', 'Замбия'),
(200, 'ZW', 'Zimbabve', 'Зимбабве');

-- --------------------------------------------------------

--
-- Table structure for table `destruction_sample_animal`
--

CREATE TABLE `destruction_sample_animal` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `code_id` int(11) DEFAULT NULL,
  `sample_id` int(11) DEFAULT NULL,
  `destruction_date` date DEFAULT NULL,
  `ads` varchar(255) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `consent_id` int(11) DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `destruction_sample_animal`
--

INSERT INTO `destruction_sample_animal` (`id`, `code`, `code_id`, `sample_id`, `destruction_date`, `ads`, `creator_id`, `created`, `updated`, `consent_id`, `approved_date`, `state_id`, `org_id`) VALUES
(1, '001-1', NULL, 24, '2022-04-02', 'Namunani Namuna egasi olib ketdi', 1, '2022-04-02 06:00:24', '2022-04-02 06:13:51', 3, '2022-04-02 03:13:51', 1, 1),
(2, '001-1', NULL, 29, '2022-04-05', '', 1, '2022-04-05 22:08:49', '2022-04-05 22:16:32', 3, '2022-04-05 07:16:32', 1, 1),
(3, '001-1', 1, 28, NULL, NULL, 5, '2022-04-18 00:34:15', '2022-04-18 00:34:15', 3, NULL, 3, 1),
(4, '001-2', 2, 27, NULL, NULL, 5, '2022-04-18 01:03:55', '2022-04-18 01:03:55', 3, NULL, 3, 1),
(5, '001-3', 3, 26, NULL, NULL, 5, '2022-04-18 01:04:29', '2022-04-18 01:04:29', 3, NULL, 3, 1),
(6, '001-4', 4, 25, NULL, NULL, 5, '2022-04-18 01:04:35', '2022-04-18 01:04:35', 3, NULL, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `destruction_sample_food`
--

CREATE TABLE `destruction_sample_food` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `code_id` int(11) DEFAULT NULL,
  `sample_id` int(11) DEFAULT NULL,
  `destruction_date` date DEFAULT NULL,
  `ads` varchar(255) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `updated` datetime DEFAULT current_timestamp(),
  `consent_id` int(11) DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `destruction_sample_food`
--

INSERT INTO `destruction_sample_food` (`id`, `code`, `code_id`, `sample_id`, `destruction_date`, `ads`, `creator_id`, `created`, `updated`, `consent_id`, `approved_date`, `state_id`, `org_id`) VALUES
(1, '001-1', 1, 10, '2022-04-05', '', 1, '2022-04-05 22:18:32', '2022-04-05 22:18:32', 3, NULL, 2, 1),
(2, '001-2', 2, 10, '2022-04-05', 'sdasd', 1, '2022-04-05 23:09:24', '2022-04-05 23:09:24', 3, NULL, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `diseases`
--

CREATE TABLE `diseases` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ru` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `vet4` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `diseases`
--

INSERT INTO `diseases` (`id`, `name_uz`, `name_ru`, `category_id`, `group_id`, `vet4`) VALUES
(1, 'Бешенство', 'Бешенство', 1, 1, '101'),
(2, 'Болезнь Ауески', 'Болезнь Ауески', 1, 1, ''),
(3, 'Бруцеллез', 'Бруцеллез', 1, 2, '104'),
(4, 'Везикулярный стоматит', 'Везикулярный стоматит', 1, 1, ''),
(5, 'Гидроперикардит', 'Гидроперикардит', 1, 2, ''),
(6, 'Конго-крымская геморрагическая лихорадка', 'Конго-крымская геморрагическая лихорадка', 1, 1, ''),
(7, 'Лептоспироз', 'Лептоспироз', 1, 2, ''),
(8, 'Лейшманиоз', 'Лейшманиоз', 1, 3, ''),
(9, 'Листериоз', 'Листериоз', 1, 2, ''),
(10, 'Лихорадка долины Рифт', 'Лихорадка долины Рифт', 1, 1, ''),
(11, ' Миаз (Cochliomyia hominivorax)', ' Миаз (Cochliomyia hominivorax)', 1, 4, ''),
(12, 'Паратуберкулез', 'Паратуберкулез', 1, 2, ''),
(13, 'Сибирская язва', 'Сибирская язва', 1, 2, ''),
(14, 'Трихинеллез', 'Трихинеллез', 1, 5, ''),
(15, 'Туляремия', 'Туляремия', 1, 2, ''),
(16, 'Чума крупного рогатого скота', 'Чума крупного рогатого скота', 1, 1, ''),
(17, 'Эпизоотическая геморрагическая болезнь (олени и др жвачные)', 'Эпизоотическая геморрагическая болезнь (олени и др жвачные)', 1, 1, ''),
(18, 'Эхинококкоз', 'Эхинококкоз', 1, 5, ''),
(19, 'Японский энцефалит', 'Японский энцефалит', 1, 1, ''),
(20, 'Ящур', 'Ящур', 1, 1, ''),
(21, 'Чесотка', 'Чесотка', 1, 4, ''),
(22, 'Шмалленберг', 'Шмалленберг', 1, 1, ''),
(23, 'Анаплазмоз крупного рогатого скота', 'Анаплазмоз крупного рогатого скота', 2, 3, ''),
(24, 'Бабезиоз крупного рогатого скота', 'Бабезиоз крупного рогатого скота', 2, 3, ''),
(25, 'Вирусная диарея крупного рогатого скота', 'Вирусная диарея крупного рогатого скота', 2, 1, ''),
(26, 'Пастереллез', 'Пастереллез', 2, 2, ''),
(27, 'Кампилобактериоз крупного рогатого скота', 'Кампилобактериоз крупного рогатого скота', 2, 2, ''),
(28, 'Губкообразная энцефалопатия (BSE)', 'Губкообразная энцефалопатия (BSE)', 2, 1, ''),
(29, 'Злокачественная катаральная лихорадка', 'Злокачественная катаральная лихорадка', 2, 1, ''),
(30, 'Инфекционный ринотрахеит крупного рогатого скота, инфекционный пустулезный вульвовагинит', 'Инфекционный ринотрахеит крупного рогатого скота, инфекционный пустулезный вульвовагинит', 2, 1, ''),
(31, 'Контагиозная плевропневмония крупного рогатого скота', 'Контагиозная плевропневмония крупного рогатого скота', 2, 2, ''),
(32, 'Лейкоз (энзоотический лейкоз крупного рогатого скота)', 'Лейкоз (энзоотический лейкоз крупного рогатого скота)', 2, 1, ''),
(33, 'Нодулярный дерматит (заразный узелковый дерматит)', 'Нодулярный дерматит (заразный узелковый дерматит)', 2, 1, ''),
(34, 'Тейлериоз', 'Тейлериоз', 2, 3, ''),
(35, 'Трихомоноз', 'Трихомоноз', 2, 3, ''),
(36, 'Туберкулез крупного рогатого скота', 'Туберкулез крупного рогатого скота', 2, 2, ''),
(37, 'Эмфизематозный карбункул (эмкар)', 'Эмфизематозный карбункул (эмкар)', 2, 2, ''),
(38, 'Африканская чума лошадей (реовирус)', 'Африканская чума лошадей (реовирус)', 3, 1, ''),
(39, 'Венесуэльский энцефаломиелит (энцефалит) лошадей', 'Венесуэльский энцефаломиелит (энцефалит) лошадей', 3, 1, ''),
(40, 'Вирусный артериит лошадей', 'Вирусный артериит лошадей', 3, 1, ''),
(41, 'Грипп лошадей (заразный катар верхних дыхательных путей)', 'Грипп лошадей (заразный катар верхних дыхательных путей)', 3, 1, ''),
(42, 'Инфекционная анемия лошадей', 'Инфекционная анемия лошадей', 3, 1, ''),
(43, 'Инфекционный (контагиозный) метрит лошадей', 'Инфекционный (контагиозный) метрит лошадей', 3, 2, ''),
(44, 'Контагиозная плевропневмония', 'Контагиозная плевропневмония', 3, 2, ''),
(45, 'Пироплазмоз лошадей', 'Пироплазмоз лошадей', 3, 3, ''),
(46, 'Ринопневмония лошадей', 'Ринопневмония лошадей', 3, 1, ''),
(47, 'Сап', 'Сап', 3, 2, ''),
(48, 'Трипаносомоз лошадей', 'Трипаносомоз лошадей', 3, 3, ''),
(49, 'Аденоматоз', 'Аденоматоз', 4, 1, ''),
(50, 'Анаэробная энтеротоксемия овец', 'Анаэробная энтеротоксемия овец', 4, 2, ''),
(51, 'Артрит/энцефалит коз', 'Артрит/энцефалит коз', 4, 1, ''),
(52, 'Болезнь Найроби', 'Болезнь Найроби', 4, 1, ''),
(53, 'Брадзот', 'Брадзот', 4, 2, ''),
(54, 'Бруцеллез овец и коз (не вызываемый Brucella ovis)', 'Бруцеллез овец и коз (не вызываемый Brucella ovis)', 4, 2, ''),
(55, 'Инфекционная агалактия овец', 'Инфекционная агалактия овец', 4, 2, ''),
(56, 'Инфекционная (контагиозная) плевропневмония коз', 'Инфекционная (контагиозная) плевропневмония коз', 4, 2, ''),
(57, 'Инфекционный эпидидимит баранов (Brucella ovis)', 'Инфекционный эпидидимит баранов (Brucella ovis)', 4, 2, ''),
(58, 'Катаральная лихорадка овец (блютанг)', 'Катаральная лихорадка овец (блютанг)', 4, 1, ''),
(59, 'Контагиозный пустулезный дерматит (контагиозная эктима)', 'Контагиозный пустулезный дерматит (контагиозная эктима)', 4, 1, ''),
(60, 'Меди-Висна', 'Меди-Висна', 4, 1, ''),
(61, 'Оспа овец и коз', 'Оспа овец и коз', 4, 1, ''),
(62, 'Пограничная болезнь овец (Бордер болезнь)', 'Пограничная болезнь овец (Бордер болезнь)', 4, 1, ''),
(63, 'Сальмонеллез (Salmonella abortus ovis)', 'Сальмонеллез (Salmonella abortus ovis)', 4, 2, ''),
(64, 'Скрепи овец и коз', 'Скрепи овец и коз', 4, 1, ''),
(65, 'Чума мелких жвачных животных', 'Чума мелких жвачных животных', 4, 1, ''),
(66, 'Энзоотический (хламидиозный) аборт овец', 'Энзоотический (хламидиозный) аборт овец', 4, 2, ''),
(67, 'Африканская чума свиней', 'Африканская чума свиней', 5, 1, ''),
(68, 'Болезнь Нипах (энцефалит Нипа)', 'Болезнь Нипах (энцефалит Нипа)', 5, 1, ''),
(69, 'Везикулярная болезнь свиней', 'Везикулярная болезнь свиней', 5, 1, ''),
(70, 'Везикулярная экзантема свиней', 'Везикулярная экзантема свиней', 5, 1, ''),
(71, 'Вирусный трансмиссивный гастроэнтерит', 'Вирусный трансмиссивный гастроэнтерит', 5, 1, ''),
(72, 'Грипп', 'Грипп', 5, 1, ''),
(73, 'Классическая чума свиней', 'Классическая чума свиней', 5, 1, ''),
(74, 'Репродуктивный респираторный синдром свиней', 'Репродуктивный респираторный синдром свиней', 5, 1, ''),
(75, 'Рожа', 'Рожа', 5, 2, ''),
(76, 'Хламидиоз', 'Хламидиоз', 5, 1, ''),
(77, 'Цистицеркоз свиней', 'Цистицеркоз свиней', 5, 5, ''),
(78, 'Энзоотический (инфекционный) энцефаломиелит свиней (болезнь Тешена)', 'Энзоотический (инфекционный) энцефаломиелит свиней (болезнь Тешена)', 5, 1, ''),
(79, 'Некробактериоз северных оленей', 'Некробактериоз северных оленей', 6, 2, ''),
(80, 'Нодулярный дерматит (заразный узелковый дерматит) северных оленей', 'Нодулярный дерматит (заразный узелковый дерматит) северных оленей', 6, 1, ''),
(81, 'Оспа верблюдов', 'Оспа верблюдов', 6, 1, ''),
(82, 'Чума верблюдов', 'Чума верблюдов', 6, 2, ''),
(84, 'Вирусный энтерит норок', 'Вирусный энтерит норок', 7, 1, ''),
(85, 'Псевдомоноз норок', 'Псевдомоноз норок', 7, 2, ''),
(86, 'Чума плотоядных', 'Чума плотоядных', 7, 1, ''),
(87, 'Геморрагическая болезнь кроликов', 'Геморрагическая болезнь кроликов', 8, 1, ''),
(88, 'Миксоматоз', 'Миксоматоз', 8, 1, ''),
(89, 'Болезнь Марека', 'Болезнь Марека', 9, 1, ''),
(90, 'Болезнь Ньюкасла', 'Болезнь Ньюкасла', 9, 1, ''),
(91, 'Вирусный гепатит утят', 'Вирусный гепатит утят', 9, 1, ''),
(92, 'Вирусный энтерит уток (чума уток)', 'Вирусный энтерит уток (чума уток)', 9, 1, ''),
(93, 'Грипп птиц', 'Грипп птиц', 9, 1, ''),
(94, 'Инфекционный бронхит кур', 'Инфекционный бронхит кур', 9, 1, ''),
(95, 'Инфекционная бурсальная болезнь (болезнь Гамборо)', 'Инфекционная бурсальная болезнь (болезнь Гамборо)', 9, 1, ''),
(96, 'Инфекционный ларинготрахеит птиц', 'Инфекционный ларинготрахеит птиц', 9, 1, ''),
(97, 'Инфекционный ринотрахеит индеек (метапневмовирусная инфекция)', 'Инфекционный ринотрахеит индеек (метапневмовирусная инфекция)', 9, 1, ''),
(98, 'Микоплазмозы птиц (М Gallisepticum, Msynoviae)', 'Микоплазмозы птиц (М Gallisepticum, Msynoviae)', 9, 2, ''),
(99, 'Оспа кур', 'Оспа кур', 9, 1, ''),
(100, 'Сальмонеллезы птиц (S Gallinarum (тиф птиц), S Pullorum), пуллороз птиц', 'Сальмонеллезы птиц (S Gallinarum (тиф птиц), S Pullorum), пуллороз птиц', 9, 2, ''),
(101, 'Туберкулез птиц', 'Туберкулез птиц', 9, 2, ''),
(102, 'Токсоплазмоз', 'Токсоплазмоз', 9, 3, ''),
(103, 'Хламидиоз (орнитоз птиц)', 'Хламидиоз (орнитоз птиц)', 9, 1, ''),
(104, 'Холера птиц (пастереллез)', 'Холера птиц (пастереллез)', 9, 2, ''),
(105, 'Альфа-вирусная инфекция лососевых', 'Альфа-вирусная инфекция лососевых', 10, 1, ''),
(106, 'Аэромоноз', 'Аэромоноз', 10, 2, ''),
(107, 'Бранхиомикоз', 'Бранхиомикоз', 10, 2, ''),
(108, 'Весенняя виремия карпа (SVC)', 'Весенняя виремия карпа (SVC)', 10, 1, ''),
(109, 'Вирусная геморрагическая септицемия (VHS)', 'Вирусная геморрагическая септицемия (VHS)', 10, 1, ''),
(110, 'Воспаление плавательного пузыря карпов', 'Воспаление плавательного пузыря карпов', 10, 2, ''),
(111, 'Герпесвирусная болезнь карпа (кои) (KHVD)', 'Герпесвирусная болезнь карпа (кои) (KHVD)', 10, 1, ''),
(112, 'Гиродактилез', 'Гиродактилез', 10, 5, ''),
(113, 'Инфекционная анемия лосося (ISA)', 'Инфекционная анемия лосося (ISA)', 10, 1, ''),
(114, 'Инфекционная анемия и фурункулез форелей', 'Инфекционная анемия и фурункулез форелей', 10, 2, ''),
(115, 'Инфекционный гематопоэтический некроз (IHN)', 'Инфекционный гематопоэтический некроз (IHN)', 10, 1, ''),
(116, 'Иридовирусная болезнь красного морского карася (RSIVD)', 'Иридовирусная болезнь красного морского карася (RSIVD)', 10, 1, ''),
(117, 'Описторхоз', 'Описторхоз', 10, 5, ''),
(118, 'Эпизоотический гематопоэтический некроз (EHNV)', 'Эпизоотический гематопоэтический некроз (EHNV)', 10, 1, ''),
(119, 'Эпизоотический язвенный синдром (EUS)', 'Эпизоотический язвенный синдром (EUS)', 10, 2, ''),
(120, 'Акарапидоз медоносных пчел', 'Акарапидоз медоносных пчел', 11, 4, ''),
(121, 'Американский гнилец пчел', 'Американский гнилец пчел', 11, 2, ''),
(122, 'Аскофероз', 'Аскофероз', 11, 2, ''),
(123, 'Варроатоз', 'Варроатоз', 11, 4, ''),
(124, 'Европейский гнилец пчел', 'Европейский гнилец пчел', 11, 2, ''),
(125, 'Малый ульевой жук', 'Малый ульевой жук', 11, 4, ''),
(126, 'Нозематоз', 'Нозематоз', 11, 3, ''),
(127, 'Колибактериоз Ecoli', 'Колибактериоз Ecoli', 12, 2, ''),
(128, 'Злокачественный отек', 'Злокачественный отек', 12, 2, ''),
(129, 'Криптоспоридиоз', 'Криптоспоридиоз', 12, 3, ''),
(130, 'Сальмонеллезы', 'Сальмонеллезы', 12, 2, ''),
(131, 'Токсоплазмоз', 'Токсоплазмоз', 12, 3, ''),
(132, 'Цистициркоз', 'Цистициркоз', 12, 5, ''),
(133, 'Kasallik', 'Kasallik', 9, 2, 'Laa');

-- --------------------------------------------------------

--
-- Table structure for table `disease_category`
--

CREATE TABLE `disease_category` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ru` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `disease_category`
--

INSERT INTO `disease_category` (`id`, `name_uz`, `name_ru`) VALUES
(1, 'I Барча хайвонларда учпайдиган кассалликлар', 'I Болезни, общие для разных видов животных'),
(2, 'II Йирик шохли хайвон касалликлари', 'II Болезни крупного рогатого скота'),
(3, 'III Йилқи касалликлари', 'III Болезни лошадей'),
(4, 'IV Қўй ва эчки касалликлари', 'IV Болезни овец и коз'),
(5, 'V Чўчқалар касалликлари', 'V Болезни свиней'),
(6, 'VI Туя ва шимол буғиси касаллиги', 'VI Болезни верблюдов и северных оленей'),
(7, 'VII Мўйнали хайвонлар касалликлари', 'VII Болезни пушных зверей'),
(8, 'VIII Қўёнсимонлар касалликлари', 'VIII Болезни зайцевых'),
(9, 'IX Қушлар касаллиги', 'IX Болезни птиц'),
(10, 'X Балиқлар касаллиги', 'X Болезни рыб'),
(11, 'XI Асаллари касалликлари', 'XI Болезни пчел'),
(12, 'XII Бошқа хайвонлар касалликлари', 'XII Другие болезни животных');

-- --------------------------------------------------------

--
-- Table structure for table `disease_groups`
--

CREATE TABLE `disease_groups` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ru` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `disease_groups`
--

INSERT INTO `disease_groups` (`id`, `name_uz`, `name_ru`) VALUES
(1, 'вирусли', 'вирусли'),
(2, 'бактерия', 'бактерия'),
(3, 'протозой', 'протозой'),
(4, 'эрахно-энтомология', 'эрахно-энтомология'),
(5, 'гельминтология', 'гельминтология');

-- --------------------------------------------------------

--
-- Stand-in structure for view `district_view`
-- (See below for the actual view)
--
CREATE TABLE `district_view` (
`MHOBT_cod` int(11)
,`region_id` int(11)
,`district_id` int(11)
,`name_lot` varchar(100)
,`center_lot` varchar(50)
,`name_cyr` varchar(100)
,`center_cyr` varchar(50)
,`name_ru` varchar(100)
,`center_ru` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `emlash`
--

CREATE TABLE `emlash` (
  `animal_id` int(11) DEFAULT NULL,
  `antibiotic` varchar(255) NOT NULL,
  `emlash_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Ходимлар жадвали. Рол, статус, ҳолатлар триггерларда тўлдирилади.';

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `email`, `phone`, `password`) VALUES
(1, 'Registrator', 'umidbek@gmail.com', '+998999670395', '$2y$13$eCysDdPvFAeOBC2Fgm.Ide9oDMArgfLbYRokPe5lJQ14xOCKhPCEO'),
(2, 'Admin', 'admin@gmail.com', '+998911347773', '$2y$13$dybfEErKMXu4Vx2OTp.Zzue2A1n2Ee.MeAp22/PBiNJoddsu36znG'),
(3, 'Direktor', 'direktor@gmail.com', '-', '$2y$13$ipIgY9MCqKMI4shgdgJG4egzSu9WJbyPBpIGT5RpyDNvSEloOtCPm'),
(4, 'Labaratoriya mudiri', 'mudir@gmail.com', '-', '$2y$13$wquoqsemFODwjdBg9AiiD.nhc4igu8pctO190BKifMqJ7Dmu0vMqq'),
(5, 'Labarant', 'lab@gmail.com', '-', '$2y$13$RkjVpdujlF/ZGCspf4xvWeKlRdByGje4EPmplHyW/ZWPIBzlBmsee');

-- --------------------------------------------------------

--
-- Table structure for table `employee_passwords_history`
--

CREATE TABLE `employee_passwords_history` (
  `emp_id` int(11) NOT NULL,
  `Pass` varchar(500) DEFAULT NULL,
  `change_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emp_posts`
--

CREATE TABLE `emp_posts` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL COMMENT 'Лавозими ёки статуси ўзгарган вақти. ',
  `state_id` int(11) DEFAULT NULL COMMENT 'Ходимнинг холати. Актив, ноактив',
  `status_id` int(11) DEFAULT NULL COMMENT 'Лавозим статуси :  асосий лавозим, вақтинчалик вазифасини бажарувчи, ва ҳ.к.',
  `org_id` int(11) DEFAULT NULL COMMENT 'Ташкилот (Бўлим)',
  `gov_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Ходимларнинг лавозимлари.';

--
-- Dumping data for table `emp_posts`
--

INSERT INTO `emp_posts` (`id`, `emp_id`, `post_id`, `date`, `state_id`, `status_id`, `org_id`, `gov_id`) VALUES
(3, 1, 1, '2022-02-01 00:00:00', 1, 1, 1, 11),
(5, 2, 5, '2022-03-08 00:00:00', 1, 1, 2, 1),
(6, 3, 4, '2022-03-25 22:57:39', 1, 1, 1, 1),
(7, 4, 3, '2022-03-25 00:00:00', 1, 1, 1, 2),
(8, 5, 2, '2022-03-25 00:00:00', 1, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `emp_posts_history`
--

CREATE TABLE `emp_posts_history` (
  `emp_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL COMMENT 'Лавозими ёки статуси ўзгарган вақти. ',
  `state_id` int(11) DEFAULT NULL COMMENT 'Ходимнинг холати. Актив, ноактив',
  `status_id` int(11) DEFAULT NULL COMMENT 'Лавозим статуси :  асосий лавозим, вақтинчалик вазифасини бажарувчи, ва ҳ.к.',
  `org_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Ходимларнинг фаолияти. Бу жадвалда emp_posts жадвалидаги ўзгаришлар сақланади. Қўлда тўлдирилмайди. (Триггер)';

-- --------------------------------------------------------

--
-- Table structure for table `food_compose`
--

CREATE TABLE `food_compose` (
  `id` int(11) NOT NULL,
  `sample_id` int(11) NOT NULL,
  `registration_id` int(11) NOT NULL,
  `status_id` int(11) DEFAULT 0,
  `ads` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Fudlarni boglanishi arizaga';

--
-- Dumping data for table `food_compose`
--

INSERT INTO `food_compose` (`id`, `sample_id`, `registration_id`, `status_id`, `ads`) VALUES
(8, 9, 11, 1, 'sdasd'),
(9, 10, 11, 2, 'sdasd'),
(10, 11, 11, 1, 'sdasd'),
(11, 12, 11, 1, ''),
(12, 13, 11, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `food_recomendation`
--

CREATE TABLE `food_recomendation` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `sample_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food_recomendation`
--

INSERT INTO `food_recomendation` (`id`, `name`, `sample_id`) VALUES
(1, 'Test', 9),
(2, 'norm ishlab duribdi', 9),
(3, 'rtert', 11);

-- --------------------------------------------------------

--
-- Table structure for table `food_registration`
--

CREATE TABLE `food_registration` (
  `id` int(11) NOT NULL,
  `inn` varchar(255) DEFAULT NULL,
  `pnfl` varchar(255) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `is_research` int(11) DEFAULT NULL,
  `code_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `research_category_id` int(11) DEFAULT NULL,
  `results_conformity_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `reg_date` varchar(255) DEFAULT NULL,
  `sender_name` varchar(255) DEFAULT NULL,
  `sender_phone` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ads` varchar(255) DEFAULT NULL,
  `status_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `food_registration`
--

INSERT INTO `food_registration` (`id`, `inn`, `pnfl`, `organization_id`, `is_research`, `code_id`, `code`, `research_category_id`, `results_conformity_id`, `emp_id`, `reg_date`, `sender_name`, `sender_phone`, `created`, `updated`, `ads`, `status_id`) VALUES
(11, '305634884', NULL, 1, 1, 1, '22-2-001-1', 2, NULL, 1, '2022-04-05', 'Umidbek Jumaniyazov', '(99)-967-0395', '2022-04-05 21:58:24', '2022-04-05 23:10:35', NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `food_route`
--

CREATE TABLE `food_route` (
  `id` int(11) NOT NULL,
  `director_id` int(11) DEFAULT NULL,
  `leader_id` int(11) DEFAULT NULL,
  `executor_id` int(11) DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `ads` varchar(255) DEFAULT NULL,
  `state_id` int(11) DEFAULT 1,
  `created` datetime DEFAULT current_timestamp(),
  `updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sample_id` int(11) DEFAULT NULL,
  `registration_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT 1,
  `vet4` varchar(8) DEFAULT NULL,
  `sample_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Mahsulot ekspertizasi uchun arizalarni yuborilishi';

--
-- Dumping data for table `food_route`
--

INSERT INTO `food_route` (`id`, `director_id`, `leader_id`, `executor_id`, `deadline`, `ads`, `state_id`, `created`, `updated`, `sample_id`, `registration_id`, `status_id`, `vet4`, `sample_type_id`) VALUES
(7, 3, 4, 5, '2022-04-05', '', 1, '2022-04-05 23:09:16', '2022-04-18 00:32:23', 9, 11, 5, NULL, NULL),
(8, 3, 4, 5, '2022-04-05', '', 1, '2022-04-05 23:09:31', '2022-04-18 00:32:42', 11, 11, 5, NULL, NULL),
(9, 3, 4, 5, '2022-04-05', '', 1, '2022-04-05 23:09:36', '2022-04-08 19:18:24', 12, 11, 4, NULL, NULL),
(10, 3, 4, 5, '2022-04-05', '', 1, '2022-04-05 23:09:43', '2022-04-08 19:18:44', 13, 11, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `food_samples`
--

CREATE TABLE `food_samples` (
  `id` int(11) NOT NULL,
  `samp_code` varchar(255) DEFAULT NULL COMMENT 'Namunaning raqami toliq',
  `samp_id` int(11) DEFAULT NULL COMMENT 'namunaning raqami faqat son',
  `sert_id` int(11) DEFAULT NULL COMMENT 'namunaning food_sample_sertification idsi',
  `tasnif_code` varchar(255) DEFAULT NULL COMMENT 'tasnif.soliq.uz dan olinadi',
  `unit_id` int(11) DEFAULT NULL COMMENT 'birligi',
  `count` int(11) DEFAULT NULL COMMENT 'soni',
  `sample_box_id` int(11) DEFAULT NULL,
  `sample_condition_id` int(11) DEFAULT NULL,
  `total_amount` varchar(255) DEFAULT NULL,
  `verification_sample` tinyint(1) DEFAULT NULL,
  `producer` varchar(255) DEFAULT NULL,
  `serial_num` varchar(255) DEFAULT NULL,
  `manufacture_date` date DEFAULT NULL,
  `sell_by` date DEFAULT NULL COMMENT 'yaroqlilik muddati',
  `coments` varchar(255) DEFAULT NULL,
  `laboratory_test_type_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status_id` int(11) DEFAULT 0,
  `state_id` int(11) DEFAULT 1,
  `_country` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `is_group` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='oziq ovqat ekspertizasi uchun namunalar';

--
-- Dumping data for table `food_samples`
--

INSERT INTO `food_samples` (`id`, `samp_code`, `samp_id`, `sert_id`, `tasnif_code`, `unit_id`, `count`, `sample_box_id`, `sample_condition_id`, `total_amount`, `verification_sample`, `producer`, `serial_num`, `manufacture_date`, `sell_by`, `coments`, `laboratory_test_type_id`, `created`, `updated`, `status_id`, `state_id`, `_country`, `emp_id`, `is_group`) VALUES
(9, '33204-22-1/1', 1, 15, '1', 1, 2, 1, 1, '1000', 0, 'UMDSoft MCHJ', '20152365', '2022-04-05', '2022-04-05', 'test malumot', 1, '2022-04-05 21:22:28', '2022-04-05 23:10:35', 4, 1, 192, 1, 1),
(10, '33204-22-1/2', 2, 15, '1', 1, 2, 1, 1, '1000', 0, 'UMDSoft MCHJ', '20152365', '2022-04-05', '2022-04-05', 'test malumot', 1, '2022-04-05 21:22:49', '2022-04-05 23:09:24', 6, 1, 192, NULL, 1),
(11, '33204-22-1/3', 3, 15, '1', 1, 2, 1, 1, '1000', 0, 'UMDSoft MCHJ', '20152365', '2022-04-05', '2022-04-05', 'test malumot', 1, '2022-04-05 21:23:09', '2022-04-05 23:10:41', 4, 1, 192, 1, 1),
(12, '33204-22-1/4', 4, 15, '1', 1, 2, 1, 1, '1000', 0, 'UMDSoft MCHJ', '20152365', '2022-04-05', '2022-04-05', 'test malumot', 1, '2022-04-05 21:23:30', '2022-04-05 23:10:45', 4, 1, 192, 1, 0),
(13, '33204-22-1/5', 5, 15, '1', 1, 2, 1, 1, '1000', 0, 'UMDSoft MCHJ', '20152365', '2022-04-05', '2022-04-06', 'test malumot', 1, '2022-04-05 21:24:46', '2022-04-05 23:10:50', 4, 1, 192, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `food_sampling_certificate`
--

CREATE TABLE `food_sampling_certificate` (
  `id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `food_id` int(11) DEFAULT NULL,
  `inn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pnfl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sampling_soato` int(11) DEFAULT NULL,
  `sampling_site` int(11) DEFAULT NULL,
  `sampling_adress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sampler_person_pnfl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sampler_person_inn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verification_pupose_id` int(11) DEFAULT NULL,
  `sampling_date` date DEFAULT NULL,
  `send_sample_date` date DEFAULT NULL,
  `based_public_information` tinyint(1) DEFAULT NULL,
  `message_number` int(11) DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `explanations` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_id` int(11) DEFAULT 0,
  `state_id` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `food_sampling_certificate`
--

INSERT INTO `food_sampling_certificate` (`id`, `code`, `food_id`, `inn`, `pnfl`, `sampling_soato`, `sampling_site`, `sampling_adress`, `sampler_person_pnfl`, `sampler_person_inn`, `verification_pupose_id`, `sampling_date`, `send_sample_date`, `based_public_information`, `message_number`, `created`, `updated`, `explanations`, `status_id`, `state_id`) VALUES
(15, '33204-22-1', 1, '305634884', NULL, 1733204, 1, 'test', NULL, '306922184', 1, '2022-04-05', '2022-04-05', 0, NULL, '2022-04-05 21:22:06', '2022-04-05 23:09:31', NULL, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `food_type`
--

CREATE TABLE `food_type` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='produktalar turlari';

--
-- Dumping data for table `food_type`
--

INSERT INTO `food_type` (`id`, `name`, `parent_id`) VALUES
(1, 'ТИРИК ҲАЙВОНЛАР', NULL),
(2, 'Тирик отлар, эшаклар, хачирлар', 1),
(3, 'Тирик йирик шохли қорамоллар', 1),
(4, 'Тирик отлар', 2),
(5, 'Тирик эшаклар', 2),
(6, 'Тирик хачирлар', 2),
(7, 'ГЎШТ ВА ГЎШТЛИ ОЗИҚ-ОВҚАТ СУБМАҲСУЛОТЛАРИ', NULL),
(8, 'Йирик шохли қорамол гўшти, янги сўйилган ёки совутилган', 7),
(9, 'Йирик шохли қорамол гўшти, музлатилган', 7),
(10, 'Чўчқа гўшти, янги сўйилган, совутилган ёки музлатилган', 7),
(11, 'Чўчқа гўшти', 10);

-- --------------------------------------------------------

--
-- Table structure for table `goverments`
--

CREATE TABLE `goverments` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name_ru` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `goverments`
--

INSERT INTO `goverments` (`id`, `name_uz`, `name_ru`, `code`) VALUES
(1, 'Rahbariyat', 'Rahbariyat', NULL),
(2, 'Bakteriologiya, parazitalogiya va mikologiya laboratoriyasi', 'Bakteriologiya, parazitalogiya va mikologiya laboratoriyasi', NULL),
(3, 'Toksikologiya laboratoriyasi', 'Toksikologiya laboratoriyasi', NULL),
(4, 'Virusologiya laboratoriyasi', 'Virusologiya laboratoriyasi', NULL),
(5, 'Radiologiya laboratoriyasi', 'Radiologiya laboratoriyasi', NULL),
(6, 'Serologiya va bioximiya laboratoriyasi', 'Serologiya va bioximiya laboratoriyasi', NULL),
(7, 'Ozuqaviy muxitlarni tayyorlash boʼlimi', 'Ozuqaviy muxitlarni tayyorlash boʼlimi', NULL),
(8, 'Аsalari, baliq va quyon kasalliklari laboratoriyasi', 'Аsalari, baliq va quyon kasalliklari laboratoriyasi', NULL),
(9, 'Immuno-ferment taxlil va polimeraz-zanjir reaktsiya laboratoriyasi', 'Immuno-ferment taxlil va polimeraz-zanjir reaktsiya laboratoriyasi', NULL),
(10, 'Oziq-ovqat maxsulotlari xavfsizligi, mikrobiologiya va veteriniriya-sanitariya ekspertiza laboratoriyasi', 'Oziq-ovqat maxsulotlari xavfsizligi, mikrobiologiya va veteriniriya-sanitariya ekspertiza laboratoriyasi', NULL),
(11, 'Tekshirish uchun naʼmunalarni qabul qilish shoʼbasi', 'Tekshirish uchun naʼmunalarni qabul qilish shoʼbasi', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `individuals`
--

CREATE TABLE `individuals` (
  `pnfl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middlename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `soato_id` int(11) DEFAULT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passport` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `individuals`
--

INSERT INTO `individuals` (`pnfl`, `name`, `surname`, `middlename`, `soato_id`, `adress`, `passport`) VALUES
('30507903120132', 'ADHAM', 'AVAZBOYEV', 'SHAVKATOVICH', 1733223551, 'manzil', 'AB0329858'),
('31003953120018', 'DILMUROD', 'ALLABERGENOV', 'YULDASH O‘G‘LI', 1733223551, 'test', 'AC1519650');

-- --------------------------------------------------------

--
-- Table structure for table `laboratory_test_type`
--

CREATE TABLE `laboratory_test_type` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(100) NOT NULL,
  `name_ru` varchar(255) NOT NULL,
  `code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laboratory_test_type`
--

INSERT INTO `laboratory_test_type` (`id`, `name_uz`, `name_ru`, `code`) VALUES
(1, 'тадкикот-01', 'исл-01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `legal_entities`
--

CREATE TABLE `legal_entities` (
  `inn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tshx_id` int(11) NOT NULL,
  `soogu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `soato_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `legal_entities`
--

INSERT INTO `legal_entities` (`inn`, `name`, `tshx_id`, `soogu`, `soato_id`, `status_id`) VALUES
('305634884', 'GEOMAX PLUS МЧЖ', 1, NULL, 1733220830, 1),
('306922184', 'MILLION DASTUR OK', 1, NULL, 1733223551, 1),
('307203793', 'UMDSOFT MCHJ', 1, NULL, 1733223551, 1);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `language` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `translation` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `language`, `translation`) VALUES
(1, 'ru', 'Namunalar ro\'yhati'),
(1, 'uz', 'Namunalar ro\'yhati'),
(2, 'oz', 'ID'),
(2, 'ru', 'ID'),
(2, 'uz', 'ID'),
(3, 'oz', 'Direktor'),
(3, 'ru', 'Direktor'),
(3, 'uz', 'Direktor'),
(4, 'oz', 'Labaratoriya mudiri'),
(4, 'ru', 'Labaratoriya mudiri'),
(4, 'uz', 'Labaratoriya mudiri'),
(5, 'oz', 'Bajaruvchi'),
(5, 'ru', 'Bajaruvchi'),
(5, 'uz', 'Bajaruvchi'),
(6, 'oz', 'Muddat'),
(6, 'ru', 'Muddat'),
(6, 'uz', 'Muddat'),
(7, 'oz', 'Izoh'),
(7, 'ru', 'Izoh'),
(7, 'uz', 'Izoh'),
(8, 'oz', 'Holat'),
(8, 'ru', 'Holat'),
(8, 'uz', 'Holat'),
(9, 'oz', 'Yaratildi'),
(9, 'ru', 'Yaratildi'),
(9, 'uz', 'Yaratildi'),
(10, 'oz', 'O\'zgartirildi'),
(10, 'ru', 'O\'zgartirildi'),
(10, 'uz', 'O\'zgartirildi'),
(11, 'oz', 'Namuna'),
(11, 'ru', 'Namuna'),
(11, 'uz', 'Namuna'),
(12, 'oz', 'Ariza'),
(12, 'ru', 'Ariza'),
(12, 'uz', 'Ariza'),
(13, 'oz', 'Status'),
(13, 'ru', 'Status'),
(13, 'uz', 'Status'),
(14, 'uz', 'ID'),
(15, 'ru', 'Kod'),
(15, 'uz', 'Kod'),
(16, 'ru', 'Namuna belgisi'),
(16, 'uz', 'Namuna belgisi'),
(17, 'ru', 'Namuna turi'),
(17, 'uz', 'Namuna turi'),
(18, 'ru', 'Namuna o\'rami'),
(18, 'uz', 'Namuna o\'rami'),
(19, 'ru', 'Hayvon'),
(19, 'uz', 'Hayvon'),
(20, 'ru', 'Dalolatnoma raqami'),
(20, 'uz', 'Dalolatnoma raqami'),
(21, 'ru', 'Gumonlangan kasallik'),
(21, 'uz', 'Gumonlangan kasallik'),
(22, 'ru', 'Tahlil usuli'),
(22, 'uz', 'Tahlil usuli'),
(23, 'ru', 'Mas\'ul shaxs'),
(23, 'uz', 'Mas\'ul shaxs'),
(24, 'ru', 'Takroriy tahlil'),
(24, 'uz', 'Takroriy tahlil'),
(25, 'uz', 'Status'),
(26, 'ru', 'Holati:'),
(26, 'uz', 'Holati:'),
(27, 'ru', 'Jinsi:'),
(27, 'uz', 'Jinsi:'),
(28, 'ru', 'Tug\'ilgan sanasi:'),
(28, 'uz', 'Tug\'ilgan sanasi:'),
(29, 'uz', 'ID'),
(30, 'ru', 'Raqami'),
(30, 'uz', 'Raqami'),
(31, 'ru', 'Code ID'),
(31, 'uz', 'Code ID'),
(32, 'ru', 'Xona tempraturasi'),
(32, 'uz', 'Xona tempraturasi'),
(33, 'ru', 'Xona namligi'),
(33, 'uz', 'Xona namligi'),
(34, 'ru', 'Reaktiv nomi'),
(34, 'uz', 'Reaktiv nomi'),
(35, 'ru', 'Reaktiv seriyasi'),
(35, 'uz', 'Reaktiv seriyasi'),
(36, 'ru', 'Shartoit'),
(36, 'uz', 'Shartoit'),
(37, 'ru', 'Test tugash vaqti'),
(37, 'uz', 'Test tugash vaqti'),
(38, 'uz', 'Izoh'),
(39, 'ru', 'Labarant'),
(39, 'uz', 'Labarant'),
(40, 'ru', 'Tasdiqladi'),
(40, 'uz', 'Tasdiqladi'),
(41, 'uz', 'Yaratildi'),
(42, 'uz', 'O\'zgartirildi'),
(43, 'oz', 'Holati'),
(43, 'ru', 'Holati'),
(43, 'uz', 'Holati'),
(44, 'ru', 'Parametr nomi'),
(44, 'uz', 'Parametr nomi'),
(45, 'ru', 'Birliki'),
(45, 'uz', 'Birliki'),
(46, 'ru', 'Maksimal-minimal oraliq'),
(46, 'uz', 'Maksimal-minimal oraliq'),
(47, 'ru', 'Qiymat'),
(47, 'uz', 'Qiymat'),
(48, 'ru', 'Emlashga aloqadorligi'),
(48, 'uz', 'Emlashga aloqadorligi'),
(49, 'ru', 'Natija'),
(49, 'uz', 'Natija'),
(50, 'ru', 'Turi'),
(50, 'uz', 'Turi'),
(51, 'ru', 'Shablon'),
(51, 'uz', 'Shablon'),
(52, 'ru', 'Natijani kiriting'),
(52, 'uz', 'Natijani kiriting'),
(53, 'ru', 'Hayvon kasalliklari tashhisi'),
(53, 'uz', 'Hayvon kasalliklari tashhisi'),
(54, 'ru', 'Oziq-ovqat havsizligi'),
(54, 'uz', 'Oziq-ovqat havsizligi'),
(55, 'ru', 'Tizimga kirish'),
(56, 'ru', 'Hayvon kasalliklari tashhisi va oziq-ovqat xavfsizligiga oid laboratoriya tekshiruvlari Yagona elektron ma\'lumotlar bazasini yurishish tizimi (VIS-Sayyor)'),
(57, 'ru', 'Boshqaruv tizimiga xush kelibsiz!'),
(58, 'ru', 'Email'),
(59, 'ru', 'Parol'),
(60, 'ru', 'Kirish'),
(61, 'ru', 'Axborot tizimini yaratish Yevropa Ittifoqi tomonidan moliyalashtirilgan'),
(62, 'uz', 'Tarjimalar'),
(63, 'ru', 'Bosh sahifa'),
(63, 'uz', 'Bosh sahifa'),
(64, 'ru', 'Dalolatnomalar'),
(64, 'uz', 'Dalolatnomalar'),
(65, 'ru', 'Ma\'lumotnoma'),
(65, 'uz', 'Ma\'lumotnoma'),
(66, 'ru', 'Ichki'),
(66, 'uz', 'Ichki'),
(67, 'ru', 'Tashqi'),
(67, 'uz', 'Tashqi'),
(68, 'ru', 'Shablonlar'),
(68, 'uz', 'Shablonlar'),
(69, 'ru', 'Kontragentlar'),
(69, 'uz', 'Kontragentlar'),
(70, 'ru', 'Yuridik shaxslar'),
(70, 'uz', 'Yuridik shaxslar'),
(71, 'ru', 'Jismoniy shaxslar'),
(71, 'uz', 'Jismoniy shaxslar'),
(72, 'ru', 'Sozlamalar'),
(72, 'uz', 'Sozlamalar'),
(73, 'ru', 'Foydalanuvchilar'),
(73, 'uz', 'Foydalanuvchilar'),
(74, 'ru', 'Lavozimlar ro\'yhati'),
(74, 'uz', 'Lavozimlar ro\'yhati'),
(75, 'ru', 'Foydalanuvchilar huquqlari'),
(75, 'uz', 'Foydalanuvchilar huquqlari'),
(76, 'ru', 'Tashkilotlar'),
(76, 'uz', 'Tashkilotlar'),
(77, 'ru', 'Tashkilot turlari'),
(77, 'uz', 'Tashkilot turlari'),
(78, 'uz', 'Tarjimalar'),
(79, 'uz', 'Bosh sahifa'),
(80, 'uz', 'Dalolatnomalar'),
(81, 'uz', 'Ma\'lumotnoma'),
(82, 'uz', 'Ichki'),
(83, 'uz', 'Tashqi'),
(84, 'uz', 'Shablonlar'),
(85, 'uz', 'Kontragentlar'),
(86, 'uz', 'Yuridik shaxslar'),
(87, 'uz', 'Jismoniy shaxslar'),
(88, 'uz', 'Sozlamalar'),
(89, 'uz', 'Foydalanuvchilar'),
(90, 'uz', 'Lavozimlar ro\'yhati'),
(91, 'uz', 'Foydalanuvchilar huquqlari'),
(92, 'uz', 'Tashkilotlar'),
(93, 'uz', 'Tashkilot turlari'),
(94, 'ru', 'Yuboruvchi'),
(95, 'ru', 'JSHSHIR(PNFL)'),
(96, 'ru', 'STIR(INN)'),
(97, 'ru', 'Shoshilinch tekshiruv'),
(98, 'ru', 'Tekshiruv turi'),
(99, 'ru', 'Talablarning natijaga muvofiqligi'),
(100, 'ru', 'Tekshiruvchi tashkilot'),
(101, 'ru', 'Registrator'),
(102, 'ru', 'Ro\'yhatga olingan sana'),
(103, 'ru', 'Kasallik turi'),
(104, 'ru', 'Namunalar'),
(105, 'ru', 'Ariza yuboruvchi FIO'),
(106, 'ru', 'Ariza yuboruvchi telefoni'),
(107, 'ru', 'Namuna qabul qiluvchi'),
(108, 'ru', 'Yuborilgan vaqti'),
(109, 'ru', 'Arizalar ro\'yhati'),
(110, 'ru', 'Namunalarni qabul qilish'),
(111, 'ru', 'Arizalar'),
(112, 'ru', 'Raqamli namunani qabul qilish'),
(113, 'ru', 'Direktorni tanlang'),
(114, 'ru', 'Labaratoriya mudirini tanlang'),
(115, 'ru', 'Saqlash'),
(116, 'ru', 'Namuna muvoffaqiyatli yuborildi'),
(117, 'ru', 'Muvvofaqiyatli'),
(118, 'ru', 'Labarantni tanlang'),
(119, 'ru', 'Topshiriq muvoffaqiyatli yuborildi'),
(120, 'ru', 'Natijalarni yuborish'),
(121, 'ru', 'Nomi'),
(122, 'ru', 'JSH SHIR(PINFL)'),
(123, 'ru', 'Passport'),
(124, 'ru', 'Kontragent turi'),
(125, 'ru', 'Pasport seriya raqami'),
(126, 'ru', 'Hayvon kasalliklari tashhilari'),
(127, 'ru', 'Oziq-ovqat ekspertizalari'),
(128, 'ru', 'Hayvon kasalliklari tashhisi bo\'yicha namuna olish dalolatnomalari'),
(129, 'ru', 'Dalolatnoma qo\'shish'),
(130, 'ru', 'Dalolatnoma'),
(131, 'ru', 'Dalolatnoma raqami(Qog\'ozdagi yoki registondagi)'),
(132, 'ru', 'Sana'),
(133, 'ru', 'PNFL'),
(134, 'ru', 'Egasi'),
(135, 'ru', 'Hayvon egasi'),
(136, 'ru', 'Vet uchstka'),
(137, 'ru', 'Operator'),
(138, 'ru', 'INN(STIR)'),
(139, 'ru', 'Viloyat'),
(140, 'ru', 'Tuman'),
(141, 'ru', 'QFI'),
(142, 'ru', 'Lavozim'),
(143, 'ru', 'Namuna olgan shaxs'),
(144, 'ru', 'Jismoniy shaxs'),
(145, 'ru', 'Yuridik shaxs'),
(146, 'ru', 'Ism'),
(147, 'ru', 'Familya'),
(148, 'ru', 'Otasining ismi'),
(149, 'ru', 'QFY'),
(150, 'ru', 'Manzil'),
(151, 'ru', 'Pasport'),
(152, 'ru', 'Viloyatni tanlang'),
(153, 'ru', 'Tumanni tanlang'),
(154, 'ru', 'QFYni tanlang'),
(155, 'ru', 'TSHX'),
(156, 'ru', 'Soato'),
(157, 'ru', 'Tashkiliy huquqiy shakli'),
(158, 'ru', '- Tumanni tanlang -'),
(159, 'ru', '- QFYni tanlang -'),
(160, 'ru', '- Vet uchastkani tanlang -'),
(161, 'ru', 'O\'zgartirish'),
(162, 'ru', 'Arizani yuborish'),
(163, 'ru', 'Umumiy {n} ta namuna. Shundan {m} tasiga ariza berilmagan'),
(164, 'ru', 'Arizani kuzatish'),
(165, 'ru', 'Hayvon qo\'shish'),
(166, 'ru', 'Hayvon toifasi'),
(167, 'ru', 'Jinsi'),
(168, 'ru', 'Tug\'ilgan kuni'),
(169, 'ru', 'Vet uchastka'),
(170, 'ru', 'Visual birka'),
(171, 'ru', 'Hayvon turi'),
(172, 'ru', 'Hayvon turini tanlang'),
(173, 'ru', 'Erkak'),
(174, 'ru', 'Urg\'ochi'),
(175, 'ru', 'Namuna muvoffaqiyatli saqlandi'),
(176, 'ru', 'sonli dalolatnoma uchun ariza yozish'),
(177, 'ru', 'Labaratoriyani tanlang'),
(178, 'ru', 'Arzani qabul qilish'),
(179, 'ru', 'Natijalar muvoffaqiyatli saqlandi'),
(180, 'ru', 'Boshqa sharoitlar'),
(181, 'ru', 'Natijalar muvoffaqiyatli yuborildi'),
(182, 'ru', 'Normativ hujjatlar'),
(183, 'ru', 'Shablon birliklari'),
(184, 'ru', 'Name Uz'),
(185, 'ru', 'Name Ru'),
(186, 'ru', 'File'),
(187, 'ru', 'Creator ID'),
(188, 'ru', 'Created'),
(189, 'ru', 'Updated'),
(190, 'ru', 'Shablon qo\'shish'),
(191, 'ru', 'Hayvon kasalliklari tashhisi shablonlari'),
(192, 'ru', 'Topshiriq rad etildi'),
(193, 'ru', 'Topshiriq tasdiqlandi'),
(194, 'ru', 'Topshiriq imzolandi'),
(195, 'oz', 'Namuna raqami'),
(195, 'ru', 'Namuna raqami'),
(196, 'ru', 'Namuna yo\'q qilingan sana'),
(197, 'ru', 'Tasdiqlangan sana'),
(198, 'ru', 'Tashkilot'),
(199, 'ru', 'Namunani yo\'q qilish dalolatnomalari ro\'yhati'),
(200, 'ru', 'Namuna raqamlari'),
(201, 'ru', 'Labaratoriya'),
(202, 'ru', 'Mahsulot ekspertizasi uchun namuma olish dalolatnomalari '),
(203, 'ru', 'Export'),
(204, 'ru', 'Excel'),
(205, 'ru', 'Pdf'),
(206, 'ru', 'Buyurtmachi'),
(207, 'ru', 'Namuna oluvchi'),
(208, 'ru', 'Food ID'),
(209, 'ru', 'Namuna beruvchi vet uchaska'),
(210, 'ru', 'Namuna olish manzil'),
(211, 'ru', 'STIR(PNFL)'),
(212, 'ru', 'Namunani tekshirtirishdan maqsad'),
(213, 'ru', 'Namuna olish sanasi'),
(214, 'ru', 'Namuna yuborilgan sana'),
(215, 'ru', 'Xabar asosida tuzilgan'),
(216, 'ru', 'Namunani yuborish sharoiti'),
(217, 'ru', 'Xabar raqami'),
(218, 'ru', 'Yo\'q'),
(219, 'ru', 'Ha'),
(220, 'ru', 'Hayvon Holatini tanlang'),
(221, 'ru', 'Hayvon toifasini tanlang'),
(222, 'ru', 'Hayvon holati'),
(223, 'ru', 'Hayvon holati tanlang'),
(224, 'ru', 'Namuna yo\'q qilingan'),
(225, 'ru', 'Namuna yo\'q qilinish jarayonida'),
(226, 'ru', 'Destruction Sample Animals'),
(227, 'ru', 'Update'),
(228, 'ru', 'Delete'),
(229, 'ru', 'Are you sure you want to delete this item?'),
(230, 'ru', 'Hayvon haqida ma\'lumot'),
(231, 'ru', 'Namunani yo\'q qilish dalolatnomasi'),
(232, 'ru', 'Namunani yo\'q qilish dalolatnomalarii'),
(233, 'ru', 'Rahbar tasdiqlashi kutilmoqda'),
(234, 'ru', 'Namuna yo\'q qilish dalolatnomasi tasdiqlash uchun rahbarga yuborildi'),
(235, 'ru', 'Tasdiqlash'),
(236, 'ru', 'Rad etish'),
(237, 'ru', 'Barchasi'),
(238, 'ru', 'Kategoriyasi'),
(239, 'ru', 'Results Conformity ID'),
(240, 'ru', 'Arizachi FIO'),
(241, 'ru', 'Arizachi telefon'),
(242, 'ru', 'Xabarlar'),
(243, 'ru', 'Hayvon kasalliklari'),
(244, 'ru', 'Dori darmonlar'),
(245, 'ru', 'Mahsulot ekspertizalari'),
(246, 'ru', 'Food Sampling Certificates'),
(247, 'ru', 'Hayvon holat'),
(248, 'ru', 'Lat'),
(249, 'ru', 'Long'),
(250, 'ru', 'Batafsil'),
(251, 'ru', 'Telefon raqami'),
(252, 'ru', 'Tasdiqdan o\'tgan'),
(253, 'ru', 'Code'),
(254, 'ru', 'Rep ID'),
(255, 'ru', 'Til'),
(256, 'ru', 'Bajaruvchi Labaratoriya'),
(257, 'ru', 'Tekshirilmagan'),
(258, 'ru', 'Qabul qilish'),
(259, 'uz', 'Arizalar ro\'yhati'),
(260, 'uz', 'Yuboruvchi'),
(261, 'uz', 'STIR(INN)'),
(262, 'uz', 'JSHSHIR(PNFL)'),
(263, 'uz', 'Tashkilot'),
(264, 'uz', 'Shoshilinch tekshiruv'),
(265, 'uz', 'Raqami'),
(266, 'uz', 'Kategoriyasi'),
(267, 'uz', 'Results Conformity ID'),
(268, 'uz', 'Operator'),
(269, 'uz', 'Sana'),
(270, 'uz', 'Arizachi FIO'),
(271, 'uz', 'Arizachi telefon'),
(272, 'uz', 'Updated'),
(273, 'uz', 'Namunalar'),
(274, 'uz', 'Dalolatnomalar'),
(275, 'uz', 'JSHSHIR(PNFL)'),
(276, 'uz', 'STIR(INN)'),
(277, 'uz', 'Shoshilinch tekshiruv'),
(278, 'uz', 'Kod'),
(279, 'uz', 'Tekshiruv turi'),
(280, 'uz', 'Talablarning natijaga muvofiqligi'),
(281, 'uz', 'Tekshiruvchi tashkilot'),
(282, 'uz', 'Registrator'),
(283, 'uz', 'Ro\'yhatga olingan sana'),
(284, 'uz', 'Kasallik turi'),
(285, 'uz', 'Namunalar'),
(286, 'uz', 'Ariza yuboruvchi FIO'),
(287, 'uz', 'Ariza yuboruvchi telefoni'),
(288, 'uz', 'Namuna qabul qiluvchi'),
(289, 'uz', 'Yuborilgan vaqti'),
(290, 'uz', 'Namuna raqamlari'),
(291, 'uz', 'Labaratoriya'),
(292, 'uz', 'Dalolatnomalar'),
(293, 'uz', 'JSHSHIR(PNFL)'),
(294, 'uz', 'STIR(INN)'),
(295, 'uz', 'Shoshilinch tekshiruv'),
(296, 'uz', 'Kod'),
(297, 'uz', 'Tekshiruv turi'),
(298, 'uz', 'Talablarning natijaga muvofiqligi'),
(299, 'uz', 'Tekshiruvchi tashkilot'),
(300, 'uz', 'Registrator'),
(301, 'uz', 'Ro\'yhatga olingan sana'),
(302, 'uz', 'Kasallik turi'),
(303, 'uz', 'Namunalar'),
(304, 'uz', 'Ariza yuboruvchi FIO'),
(305, 'uz', 'Ariza yuboruvchi telefoni'),
(306, 'uz', 'Namuna qabul qiluvchi'),
(307, 'uz', 'Yuborilgan vaqti'),
(308, 'uz', 'Namuna raqamlari'),
(309, 'uz', 'Labaratoriya'),
(310, 'uz', 'Namuna raqamlari'),
(311, 'ru', 'Dalolatnomalar ro\'yhati'),
(312, 'ru', 'Oziq-ovqat ekspertizasi uchun ariza'),
(313, 'ru', 'Vet uchstkani tanlang'),
(314, 'ru', 'Tekshirishdan maqsadni tanlang'),
(315, 'ru', 'Namuna qo\'shish'),
(316, 'ru', 'Mahsulotni tanlang'),
(317, 'ru', 'Namuna nomi'),
(318, 'ru', 'Birlik'),
(319, 'ru', 'Soni'),
(320, 'ru', 'Namuna holati'),
(321, 'ru', 'Toplam(partiya) miqdori'),
(322, 'ru', 'Nazorat namunasi'),
(323, 'ru', 'Ishlab chiqaruvchi'),
(324, 'ru', 'Seriya raqami'),
(325, 'ru', 'Ishlab chiqarilgan sana'),
(326, 'ru', 'Muddati'),
(327, 'ru', 'Qo\'shimcha ma\'lumot'),
(328, 'ru', 'Laboratoriya test turi'),
(329, 'ru', 'Mahsulot birligini tanlang'),
(330, 'ru', 'Namuna o\'ramini tanlang'),
(331, 'ru', 'Namuna holatini tanlang'),
(332, 'ru', 'Tanlanmagan'),
(333, 'ru', 'Tanlangan'),
(334, 'ru', 'Laboratoriya test turini tanlang'),
(335, 'ru', 'Oziq-ovqat tashhisi'),
(336, 'ru', 'Sample ID'),
(337, 'ru', 'Registration ID'),
(338, 'ru', 'Status ID'),
(339, 'ru', 'Ads'),
(340, 'oz', 'Labaratoriya mudir'),
(340, 'ru', 'Labaratoriya mudir'),
(341, 'oz', 'Ariza raqami'),
(341, 'ru', 'Ariza raqami'),
(342, 'ru', 'Namuna {number} raqami bilan saqlandi'),
(343, 'ru', 'Ro\'yhatga oluvchi'),
(344, 'ru', 'Require ID'),
(345, 'ru', 'Consept ID'),
(346, 'ru', 'State ID'),
(347, 'ru', 'Org ID'),
(348, 'ru', 'Talabga muvofiqligi'),
(349, 'ru', 'Kirituvchi'),
(350, 'ru', 'Tasdiqlovchi'),
(351, 'ru', 'Yaratilgan'),
(352, 'ru', 'O\'zgartirilgan'),
(353, 'ru', 'Natija(oraliq)'),
(354, 'ru', 'Tekshirilgan'),
(355, 'ru', 'Minimal-maksimal oraliq'),
(356, 'ru', 'Talabga muvoffiqligini tanlang'),
(357, 'ru', 'Namuna muvoffaqiyatli tasdiqlandi'),
(358, 'ru', 'Natija muvoffaqiyatli rad qilindi.'),
(359, 'ru', 'Natija muvoffaqiyatli tasdiqlandi. Natija rahbar tasdiqlashi uchun yuborildi.'),
(360, 'ru', 'Topshiriq imzolandi. Namunani yo\'q qilish uchun {code} raqamli dalolatnoma labarantga yuborildi'),
(361, 'ru', 'Destruction Date'),
(362, 'ru', 'Consent ID'),
(363, 'ru', 'Approved Date'),
(364, 'ru', 'Yuborilgan sana'),
(365, 'ru', 'Namuna ma\'lumotlari'),
(366, 'ru', 'Hayvonlar'),
(367, 'ru', 'Hayvon toifalari'),
(368, 'ru', 'Hayvon turlari'),
(369, 'ru', 'Kasalliklar ruyhati'),
(370, 'ru', 'Kasalliklar guruhi'),
(371, 'ru', 'Kasalliklar toifasi'),
(372, 'ru', 'Vaksinalar'),
(373, 'ru', 'Namuna turlari'),
(374, 'ru', 'Namuna o\'ramlari'),
(375, 'ru', 'Tahlil usullari'),
(376, 'ru', 'Birliklar'),
(377, 'ru', 'Tekshirish maqsadlari'),
(378, 'ru', 'Laboratoriya tadqiqot turlari'),
(379, 'ru', 'Mahsulotlar turlari'),
(380, 'ru', 'Dori turlari haqida hisobot'),
(381, 'ru', 'Oziq-ovqat toifalari haqida '),
(382, 'ru', 'Pasport ma\'lumotlari topilmadi'),
(383, 'ru', 'Xatolik'),
(384, 'ru', 'Oziq-ovqat ekspertizasi talablari'),
(385, 'ru', 'Nomi(UZ)'),
(386, 'ru', 'Nomi(RU)'),
(387, 'ru', 'Fayl'),
(388, 'ru', 'Kiritildi'),
(389, 'ru', 'Tasdiqlovchini tanlang'),
(390, 'ru', '{kod} raqamli namuna muvoffaqiyatli saqlandi'),
(391, 'ru', 'Emlash: {name}'),
(392, 'ru', 'Emlash'),
(393, 'ru', 'Kasallikni talang'),
(394, 'ru', 'Animal ID'),
(395, 'ru', 'Vaccina ID'),
(396, 'ru', 'Disease ID'),
(397, 'ru', 'Disease Date'),
(398, 'ru', 'Davolash: {name}'),
(399, 'ru', 'Davolash'),
(400, 'ru', 'Antibiotik'),
(401, 'ru', 'Namuna tekshiruv natijasi imzolandi. Namunani yo\'q qilish uchun topshiriq yuborildi.'),
(402, 'ru', 'Davlatni tanlang'),
(403, 'ru', '{code} raqamli ariza muvoffaqiyatli yuborildi'),
(404, 'ru', 'Vaksinalashlar tarixi'),
(405, 'ru', 'Davolashlar tarixi'),
(406, 'ru', 'Davlat'),
(407, 'uz', 'Tizimga kirish'),
(408, 'uz', 'Hayvon kasalliklari tashhisi va oziq-ovqat xavfsizligiga oid laboratoriya tekshiruvlari Yagona elektron ma\'lumotlar bazasini yurishish tizimi (VIS-Sayyor)'),
(409, 'uz', 'Boshqaruv tizimiga xush kelibsiz!'),
(410, 'uz', 'Email'),
(411, 'uz', 'Parol'),
(412, 'uz', 'Kirish'),
(413, 'uz', 'Axborot tizimini yaratish Yevropa Ittifoqi tomonidan moliyalashtirilgan'),
(414, 'uz', 'Tizimga kirish'),
(415, 'uz', 'Hayvon kasalliklari tashhisi va oziq-ovqat xavfsizligiga oid laboratoriya tekshiruvlari Yagona elektron ma\'lumotlar bazasini yurishish tizimi (VIS-Sayyor)'),
(416, 'uz', 'Boshqaruv tizimiga xush kelibsiz!'),
(417, 'uz', 'Email'),
(418, 'uz', 'Parol'),
(419, 'uz', 'Kirish'),
(420, 'uz', 'Axborot tizimini yaratish Yevropa Ittifoqi tomonidan moliyalashtirilgan'),
(421, 'oz', 'Hayvon kasalliklari namunalar ro\'yhati'),
(421, 'ru', 'Hayvon kasalliklari namunalar ro\'yhati'),
(422, 'uz', 'Hayvon kasalliklari namunalar ro\'yhati'),
(423, 'uz', 'Hayvon kasalliklari namunalar ro\'yhati'),
(424, 'oz', 'Oziq-ovqat havfsizligi namunalar ro\'yhati'),
(424, 'ru', 'Oziq-ovqat havfsizligi namunalar ro\'yhati'),
(425, 'uz', 'Oziq-ovqat havfsizligi namunalar ro\'yhati'),
(426, 'uz', 'Direktor'),
(427, 'uz', 'Labaratoriya mudir'),
(428, 'uz', 'Bajaruvchi'),
(429, 'uz', 'Muddat'),
(430, 'uz', 'Holat'),
(431, 'uz', 'Namuna raqami'),
(432, 'uz', 'Ariza raqami'),
(433, 'ru', 'Hayvon kasalliklari amunalar ro\'yhati'),
(434, 'ru', 'Oziq ovqat havsizligi namunalar ro\'yhati'),
(435, 'ru', 'Oziq ovqat havfsizligi namunalar ro\'yhati'),
(436, 'ru', 'Login yoki parol xato'),
(437, 'ru', 'Yuridik shaxs qo\'shish'),
(438, 'uz', 'Nomi'),
(439, 'uz', 'JSH SHIR(PINFL)'),
(440, 'uz', 'Passport'),
(441, 'uz', 'Kontragent turi'),
(442, 'uz', 'Pasport seriya raqami'),
(443, 'uz', 'JSH SHIR(PINFL)'),
(444, 'ru', 'ERI kalit yordamida kirish'),
(445, 'ru', 'Login parol yordamida kirish'),
(446, 'ru', 'Vet uchaska'),
(447, 'ru', 'Hayvon kategoriyalari'),
(448, 'ru', 'Hayvon kategoriyasini yaratish'),
(449, 'ru', 'Nomi(O\'zbek)'),
(450, 'ru', 'Nomi(Rus)'),
(451, 'ru', 'Hayvon turi qo\'shish'),
(452, 'ru', 'Vet4'),
(453, 'ru', 'Hayvon turilari'),
(454, 'ru', 'O\'chirish'),
(455, 'ru', 'O\'zgartirish: {name}'),
(456, 'ru', 'Biologik, potologik va boshqa materiallardan namuna olish'),
(457, 'ru', 'Mahsulot ekspertizasi'),
(458, 'ru', 'Kasalliklar ro`yhati'),
(459, 'ru', 'Toifasi'),
(460, 'ru', 'Kasallik qo\'shish'),
(461, 'ru', 'Kasalliklar'),
(462, 'ru', 'Namuna turi qo\'shish'),
(463, 'ru', 'Yangi arizalar'),
(464, 'ru', 'Oziq-ovqat havfsizligi'),
(465, 'ru', 'Namunani yo\'q qilish'),
(466, 'ru', 'Namuna turini tanlang'),
(467, 'uz', 'Bosh sahifa'),
(468, 'uz', 'Yangi arizalar'),
(469, 'uz', 'Oziq-ovqat havfsizligi'),
(470, 'uz', 'Namunani yo\'q qilish'),
(471, 'uz', 'Arzani qabul qilish'),
(472, 'uz', 'Namunalarni qabul qilish'),
(473, 'uz', 'Arizalar'),
(474, 'uz', 'Raqamli namunani qabul qilish'),
(475, 'uz', 'Direktorni tanlang'),
(476, 'uz', 'Labaratoriya mudirini tanlang'),
(477, 'uz', 'Saqlash'),
(478, 'uz', 'Namuna turini tanlang'),
(479, 'uz', 'Namuna muvoffaqiyatli yuborildi'),
(480, 'uz', 'Muvvofaqiyatli'),
(481, 'uz', 'O\'zgartirish: {name}'),
(482, 'uz', 'Namuna turlari'),
(483, 'uz', 'O\'zgartirish'),
(484, 'uz', 'ID'),
(485, 'uz', 'Nomi(O\'zbek)'),
(486, 'uz', 'Nomi(Rus)'),
(487, 'uz', 'Vet4'),
(488, 'uz', 'Saqlash'),
(489, 'uz', 'O\'chirish'),
(490, 'uz', 'Are you sure you want to delete this item?'),
(491, 'uz', 'Namuna turi qo\'shish'),
(492, 'uz', 'Hayvonlar'),
(493, 'uz', 'Hayvon toifalari'),
(494, 'uz', 'Hayvon turlari'),
(495, 'uz', 'Kasalliklar ruyhati'),
(496, 'uz', 'Kasalliklar guruhi'),
(497, 'uz', 'Kasalliklar toifasi'),
(498, 'uz', 'Vaksinalar'),
(499, 'uz', 'Namunalar'),
(500, 'uz', 'Namuna turlari'),
(501, 'uz', 'Namuna o\'ramlari'),
(502, 'uz', 'Tahlil usullari'),
(503, 'uz', 'Birliklar'),
(504, 'uz', 'Tekshirish maqsadlari'),
(505, 'uz', 'Namuna holati'),
(506, 'uz', 'Laboratoriya tadqiqot turlari'),
(507, 'uz', 'Mahsulotlar turlari'),
(508, 'uz', 'Dori turlari haqida hisobot'),
(509, 'uz', 'Oziq-ovqat toifalari haqida '),
(510, 'uz', 'Hayvon turlari'),
(511, 'uz', 'Hayvon turi qo\'shish'),
(512, 'uz', 'ID'),
(513, 'uz', 'Nomi(O\'zbek)'),
(514, 'uz', 'Nomi(Rus)'),
(515, 'uz', 'Kod'),
(516, 'uz', 'Vet4'),
(517, 'uz', 'O\'zgartirish: {name}'),
(518, 'uz', 'Hayvon turlari'),
(519, 'uz', 'O\'zgartirish'),
(520, 'uz', 'ID'),
(521, 'uz', 'Nomi(O\'zbek)'),
(522, 'uz', 'Nomi(Rus)'),
(523, 'uz', 'Kod'),
(524, 'uz', 'Vet4'),
(525, 'uz', 'Saqlash'),
(526, 'uz', 'O\'chirish'),
(527, 'uz', 'Are you sure you want to delete this item?'),
(528, 'uz', 'Hayvon turilari'),
(529, 'uz', 'Hayvon turilari'),
(530, 'uz', 'Kasalliklar ro`yhati'),
(531, 'uz', 'ID'),
(532, 'uz', 'Nomi(O\'zbek)'),
(533, 'uz', 'Nomi(Rus)'),
(534, 'uz', 'Toifasi'),
(535, 'uz', 'Turi'),
(536, 'uz', 'Vet4'),
(537, 'uz', 'O\'zgartirish: {name}'),
(538, 'uz', 'Kasalliklar'),
(539, 'uz', 'O\'zgartirish'),
(540, 'uz', 'ID'),
(541, 'uz', 'Nomi(O\'zbek)'),
(542, 'uz', 'Nomi(Rus)'),
(543, 'uz', 'Toifasi'),
(544, 'uz', 'Turi'),
(545, 'uz', 'Vet4'),
(546, 'uz', 'Saqlash'),
(547, 'uz', 'O\'chirish'),
(548, 'uz', 'Are you sure you want to delete this item?'),
(549, 'uz', 'Bosh sahifa'),
(550, 'uz', 'ERI kalit yordamida kirish'),
(551, 'uz', 'Login parol yordamida kirish'),
(552, 'uz', 'Hayvon kasalliklari tashhilari'),
(553, 'uz', 'Oziq-ovqat ekspertizalari'),
(554, 'uz', 'Arizalar'),
(555, 'uz', 'Hayvon kasalliklari tashhilari'),
(556, 'uz', 'Oziq-ovqat ekspertizalari'),
(557, 'uz', 'Arizalar'),
(558, 'uz', 'Hayvon kasalliklari tashhisi bo\'yicha namuna olish dalolatnomalari'),
(559, 'uz', 'Dalolatnoma qo\'shish'),
(560, 'uz', 'Dalolatnoma'),
(561, 'uz', 'Dalolatnoma raqami(Qog\'ozdagi yoki registondagi)'),
(562, 'uz', 'Sana'),
(563, 'uz', 'PNFL'),
(564, 'uz', 'Egasi'),
(565, 'uz', 'Hayvon egasi'),
(566, 'uz', 'Vet uchstka'),
(567, 'uz', 'Operator'),
(568, 'uz', 'INN(STIR)'),
(569, 'uz', 'Viloyat'),
(570, 'uz', 'Tuman'),
(571, 'uz', 'QFI'),
(572, 'uz', 'Status'),
(573, 'uz', 'Lavozim'),
(574, 'uz', 'Namuna olgan shaxs'),
(575, 'uz', 'Hayvon kasalliklari tashhilari'),
(576, 'uz', 'Oziq-ovqat ekspertizalari'),
(577, 'uz', 'Arizalar'),
(578, 'uz', 'Hayvon kasalliklari tashhilari'),
(579, 'uz', 'Oziq-ovqat ekspertizalari'),
(580, 'uz', 'Arizalar'),
(581, 'uz', 'Dalolatnoma'),
(582, 'uz', 'Dalolatnoma raqami(Qog\'ozdagi yoki registondagi)'),
(583, 'uz', 'Sana'),
(584, 'uz', 'PNFL'),
(585, 'uz', 'Egasi'),
(586, 'uz', 'Hayvon egasi'),
(587, 'uz', 'Vet uchstka'),
(588, 'uz', 'Operator'),
(589, 'uz', 'INN(STIR)'),
(590, 'uz', 'Viloyat'),
(591, 'uz', 'Tuman'),
(592, 'uz', 'QFI'),
(593, 'uz', 'Status'),
(594, 'uz', 'Lavozim'),
(595, 'uz', 'Namuna olgan shaxs'),
(596, 'uz', 'Jismoniy shaxs'),
(597, 'uz', 'Yuridik shaxs'),
(598, 'uz', 'PNFL'),
(599, 'uz', 'Ism'),
(600, 'uz', 'Familya'),
(601, 'uz', 'Otasining ismi'),
(602, 'uz', 'QFY'),
(603, 'uz', 'Manzil'),
(604, 'uz', 'Pasport'),
(605, 'uz', 'Viloyat'),
(606, 'uz', 'Tuman'),
(607, 'uz', 'Viloyatni tanlang'),
(608, 'uz', 'Tumanni tanlang'),
(609, 'uz', 'QFYni tanlang'),
(610, 'uz', 'STIR(INN)'),
(611, 'uz', 'Nomi'),
(612, 'uz', 'TSHX'),
(613, 'uz', 'Manzil'),
(614, 'uz', 'Soato'),
(615, 'uz', 'Viloyat'),
(616, 'uz', 'Tuman'),
(617, 'uz', 'Status'),
(618, 'uz', 'Tashkiliy huquqiy shakli'),
(619, 'uz', 'Viloyatni tanlang'),
(620, 'uz', 'Hayvon kasalliklari tashhilari'),
(621, 'uz', 'Oziq-ovqat ekspertizalari'),
(622, 'uz', 'Arizalar'),
(623, 'uz', 'Hayvon kasalliklari tashhilari'),
(624, 'uz', 'Oziq-ovqat ekspertizalari'),
(625, 'uz', 'Arizalar'),
(626, 'uz', 'Hayvon kasalliklari tashhisi bo\'yicha namuna olish dalolatnomalari'),
(627, 'uz', 'Dalolatnoma qo\'shish'),
(628, 'uz', 'Dalolatnoma'),
(629, 'uz', 'Dalolatnoma raqami(Qog\'ozdagi yoki registondagi)'),
(630, 'uz', 'Sana'),
(631, 'uz', 'PNFL'),
(632, 'uz', 'Egasi'),
(633, 'uz', 'Hayvon egasi'),
(634, 'uz', 'Vet uchstka'),
(635, 'uz', 'Operator'),
(636, 'uz', 'INN(STIR)'),
(637, 'uz', 'Viloyat'),
(638, 'uz', 'Tuman'),
(639, 'uz', 'QFI'),
(640, 'uz', 'Status'),
(641, 'uz', 'Lavozim'),
(642, 'uz', 'Namuna olgan shaxs'),
(643, 'uz', 'Hayvon kasalliklari tashhilari'),
(644, 'uz', 'Oziq-ovqat ekspertizalari'),
(645, 'uz', 'Arizalar'),
(646, 'uz', 'Hayvon kasalliklari tashhilari'),
(647, 'uz', 'Oziq-ovqat ekspertizalari'),
(648, 'uz', 'Arizalar'),
(649, 'uz', 'O\'zgartirish'),
(650, 'uz', 'Arizani yuborish'),
(651, 'uz', 'Umumiy {n} ta namuna. Shundan {m} tasiga ariza berilmagan'),
(652, 'uz', 'Dalolatnoma'),
(653, 'uz', 'Dalolatnoma raqami(Qog\'ozdagi yoki registondagi)'),
(654, 'uz', 'Sana'),
(655, 'uz', 'PNFL'),
(656, 'uz', 'Egasi'),
(657, 'uz', 'Hayvon egasi'),
(658, 'uz', 'Vet uchstka'),
(659, 'uz', 'Operator'),
(660, 'uz', 'INN(STIR)'),
(661, 'uz', 'Viloyat'),
(662, 'uz', 'Tuman'),
(663, 'uz', 'QFI'),
(664, 'uz', 'Status'),
(665, 'uz', 'Lavozim'),
(666, 'uz', 'Namuna olgan shaxs'),
(667, 'uz', 'sonli dalolatnoma uchun ariza yozish'),
(668, 'uz', 'Tekshiruv turi'),
(669, 'uz', 'Labaratoriyani tanlang'),
(670, 'uz', 'Mahsulot ekspertizasi uchun namuma olish dalolatnomalari '),
(671, 'uz', 'Buyurtmachi'),
(672, 'uz', 'Namuna oluvchi'),
(673, 'uz', 'ID'),
(674, 'uz', 'Raqami'),
(675, 'uz', 'Food ID'),
(676, 'uz', 'STIR(INN)'),
(677, 'uz', 'JSHSHIR(PNFL)'),
(678, 'uz', 'Vet uchaska'),
(679, 'uz', 'Tuman'),
(680, 'uz', 'Namuna olish manzil'),
(681, 'uz', 'STIR(PNFL)'),
(682, 'uz', 'Namunani tekshirtirishdan maqsad'),
(683, 'uz', 'Namuna olish sanasi'),
(684, 'uz', 'Namuna yuborilgan sana'),
(685, 'uz', 'Xabar asosida tuzilgan'),
(686, 'uz', 'Namunani yuborish sharoiti'),
(687, 'uz', 'Xabar raqami'),
(688, 'uz', 'Yaratildi'),
(689, 'uz', 'O\'zgartirildi'),
(690, 'uz', 'Status'),
(691, 'uz', 'Yo\'q'),
(692, 'uz', 'Ha'),
(693, 'uz', 'Bosh sahifa'),
(694, 'uz', 'Normativ hujjatlar'),
(695, 'uz', 'Shablon birliklari'),
(696, 'uz', 'Hayvon kasalliklari tashhisi'),
(697, 'uz', 'Oziq-ovqat tashhisi'),
(698, 'uz', 'Oziq-ovqat ekspertizasi talablari'),
(699, 'uz', 'Normativ hujjatlar'),
(700, 'uz', 'Tasdiqlovchini tanlang'),
(701, 'uz', 'Namuna turini tanlang'),
(702, 'uz', '4vet'),
(703, 'uz', 'Namuna turi'),
(704, 'uz', 'Normativ hujjatlar'),
(705, 'uz', 'Labarantni tanlang'),
(706, 'uz', 'Vaksinalashlar tarixi'),
(707, 'uz', 'Davolashlar tarixi'),
(708, 'uz', 'Topshiriq muvoffaqiyatli yuborildi'),
(709, 'uz', 'Normativ hujjatlar'),
(710, 'uz', 'Boshqa sharoitlar'),
(711, 'uz', 'Umumlashgan natija'),
(712, 'uz', 'Tashkilot'),
(713, 'uz', 'Birlik'),
(714, 'uz', 'Minimal-maksimal oraliq'),
(715, 'uz', 'Natijalarni yuborish'),
(716, 'uz', 'Natijani tanlang'),
(717, 'uz', 'Kun'),
(718, 'uz', 'Doimiy'),
(719, 'uz', 'Saqlash'),
(720, 'uz', 'Natijalarni yuborish'),
(721, 'uz', 'Saqlash'),
(722, 'uz', 'Natijalar muvoffaqiyatli saqlandi'),
(723, 'uz', 'Natijalar muvoffaqiyatli yuborildi'),
(724, 'uz', 'Topshiriq tasdiqlandi'),
(725, 'uz', 'Namuna tekshiruv natijasi imzolandi. Namunani yo\'q qilish uchun topshiriq yuborildi.'),
(726, 'uz', 'raqami'),
(727, 'uz', 'Dalolatnoma'),
(728, 'uz', 'Namuna nomi'),
(729, 'uz', 'Birlik'),
(730, 'uz', 'Soni'),
(731, 'uz', 'Namuna o\'rami'),
(732, 'uz', 'Namuna holati'),
(733, 'uz', 'Toplam(partiya) miqdori'),
(734, 'uz', 'Nazorat namunasi'),
(735, 'uz', 'Ishlab chiqaruvchi'),
(736, 'uz', 'Seriya raqami'),
(737, 'uz', 'Ishlab chiqarilgan sana'),
(738, 'uz', 'Muddati'),
(739, 'uz', 'Qo\'shimcha ma\'lumot'),
(740, 'uz', 'Laboratoriya test turi'),
(741, 'uz', 'Ro\'yhatga oluvchi'),
(742, 'uz', 'Davlat'),
(743, 'uz', 'Namuna'),
(744, 'uz', 'Talabga muvofiqligi'),
(745, 'uz', 'Kirituvchi'),
(746, 'uz', 'Tasdiqlovchi'),
(747, 'uz', 'Yaratilgan'),
(748, 'uz', 'O\'zgartirilgan'),
(749, 'uz', 'raqami'),
(750, 'uz', 'Dalolatnoma'),
(751, 'uz', 'Namuna nomi'),
(752, 'uz', 'Birlik'),
(753, 'uz', 'Soni'),
(754, 'uz', 'Namuna o\'rami'),
(755, 'uz', 'Namuna holati'),
(756, 'uz', 'Toplam(partiya) miqdori'),
(757, 'uz', 'Nazorat namunasi'),
(758, 'uz', 'Ishlab chiqaruvchi'),
(759, 'uz', 'Seriya raqami'),
(760, 'uz', 'Ishlab chiqarilgan sana'),
(761, 'uz', 'Muddati'),
(762, 'uz', 'Qo\'shimcha ma\'lumot'),
(763, 'uz', 'Laboratoriya test turi'),
(764, 'uz', 'Ro\'yhatga oluvchi'),
(765, 'uz', 'Davlat'),
(766, 'uz', 'Namuna'),
(767, 'uz', 'Talabga muvofiqligi'),
(768, 'uz', 'Kirituvchi'),
(769, 'uz', 'Tasdiqlovchi'),
(770, 'uz', 'Yaratilgan'),
(771, 'uz', 'O\'zgartirilgan'),
(772, 'uz', 'Topshiriq imzolandi. Namunani yo\'q qilish uchun {code} raqamli dalolatnoma labarantga yuborildi'),
(773, 'uz', 'Qabul qilish'),
(774, 'uz', 'Namuna raqami'),
(775, 'uz', 'Ariza raqami'),
(776, 'uz', 'Namunani yo\'q qilish dalolatnomalari ro\'yhati'),
(777, 'uz', 'Namuna yo\'q qilingan sana'),
(778, 'uz', 'Yuborilgan sana'),
(779, 'uz', 'Namuna yo\'q qilingan'),
(780, 'uz', 'Rahbar tasdiqlashi kutilmoqda'),
(781, 'uz', 'Namuna yo\'q qilinish jarayonida'),
(782, 'uz', 'Namunani yo\'q qilish dalolatnomalari ro\'yhati'),
(783, 'uz', 'Barchasi'),
(784, 'uz', 'Namuna yo\'q qilingan'),
(785, 'uz', 'Rahbar tasdiqlashi kutilmoqda'),
(786, 'uz', 'Namuna yo\'q qilinish jarayonida'),
(787, 'uz', 'Namuna yo\'q qilingan sana'),
(788, 'uz', 'yaratildi'),
(789, 'uz', 'Tasdiqlangan sana'),
(790, 'uz', 'Namunani yo\'q qilish dalolatnomalarii'),
(791, 'uz', 'Namuna ma\'lumotlari'),
(792, 'uz', 'Namuna nomi'),
(793, 'uz', 'Soni'),
(794, 'uz', 'Namunani yo\'q qilish dalolatnomalarii'),
(795, 'uz', 'Namuna ma\'lumotlari'),
(796, 'uz', 'Namuna nomi'),
(797, 'uz', 'Soni'),
(798, 'uz', 'Tasdiqlash'),
(799, 'uz', 'Rad etish'),
(800, 'uz', 'Tasdiqlash'),
(801, 'uz', 'Rad etish'),
(802, 'uz', 'Dalolatnoma qo\'shish'),
(803, 'uz', 'Hayvon qo\'shish'),
(804, 'uz', 'ID'),
(805, 'uz', 'Egasi'),
(806, 'uz', 'Hayvon holati'),
(807, 'uz', 'Jinsi'),
(808, 'uz', 'Tug\'ilgan kuni'),
(809, 'uz', 'INN(STIR)'),
(810, 'uz', 'PNFL'),
(811, 'uz', 'Manzil'),
(812, 'uz', 'Vet uchastka'),
(813, 'uz', 'Visual birka'),
(814, 'uz', 'Hayvon turi'),
(815, 'uz', 'Viloyat'),
(816, 'uz', 'Tuman'),
(817, 'uz', 'Hayvon egasi'),
(818, 'uz', 'Hayvon turini tanlang'),
(819, 'uz', 'Hayvon holati tanlang'),
(820, 'uz', 'Erkak'),
(821, 'uz', 'Urg\'ochi'),
(822, 'uz', '- Tumanni tanlang -'),
(823, 'uz', '- Vet uchastkani tanlang -'),
(824, 'uz', '{kod} raqamli namuna muvoffaqiyatli saqlandi'),
(825, 'uz', 'Hayvon haqida ma\'lumot'),
(826, 'uz', 'Hayvon haqida ma\'lumot'),
(827, 'uz', 'Oziq-ovqat ekspertizasi bo\'yicha dalolatnoma qo\'shish'),
(828, 'uz', 'Viloyatni tanlang'),
(829, 'uz', 'Viloyat'),
(830, 'uz', 'Tumanni tanlang'),
(831, 'uz', 'Vet uchstkani tanlang'),
(832, 'uz', 'Tekshirishdan maqsadni tanlang'),
(833, 'uz', 'Saqlash'),
(834, 'uz', '- QFYni tanlang -'),
(835, 'uz', 'Dalolatnomalar ro\'yhati'),
(836, 'uz', 'Namuna qo\'shish'),
(837, 'uz', 'Mahsulotni tanlang'),
(838, 'uz', 'Mahsulot birligini tanlang'),
(839, 'uz', 'Namuna o\'ramini tanlang'),
(840, 'uz', 'Davlatni tanlang'),
(841, 'uz', 'Namuna holatini tanlang'),
(842, 'uz', 'Tanlanmagan'),
(843, 'uz', 'Tanlangan'),
(844, 'uz', 'Laboratoriya test turini tanlang'),
(845, 'uz', 'Saqlash'),
(846, 'uz', 'Arizalar ro\'yhati'),
(847, 'uz', 'Arizalar ro\'yhati'),
(848, 'uz', 'Arizalar ro\'yhati'),
(849, 'uz', 'Arizalar ro\'yhati'),
(850, 'uz', 'Arizalar ro\'yhati'),
(851, 'uz', 'Arizalar ro\'yhati'),
(852, 'uz', 'Arizalar ro\'yhati'),
(853, 'uz', 'Arizalar ro\'yhati'),
(854, 'uz', 'Hayvon holatini tanlang'),
(855, 'uz', 'Oziq ovqat havfsizligi namunalar ro\'yhati'),
(856, 'uz', 'Oziq ovqat havfsizligi namunalar ro\'yhati'),
(857, 'uz', 'Oziq ovqat havfsizligi namunalar ro\'yhati'),
(858, 'uz', 'Oziq ovqat havfsizligi namunalar ro\'yhati'),
(859, 'uz', 'Oziq ovqat havfsizligi namunalar ro\'yhati'),
(860, 'uz', 'Oziq ovqat havfsizligi namunalar ro\'yhati'),
(861, 'uz', 'Xabarlar'),
(862, 'uz', 'Hayvon kasalliklari'),
(863, 'uz', 'Dori darmonlar'),
(864, 'uz', 'Statistika'),
(865, 'uz', 'Hayvon kasalliklari (Arizalar)'),
(866, 'uz', 'Oziq-ovqat ekspertizalari (Arizalar)'),
(867, 'uz', 'Hayvon kasalliklari (Dalolatnomalar)'),
(868, 'uz', 'Oziq-ovqat ekspertizalari (Dalolatnomalar)'),
(869, 'uz', 'Hayvon kasalliklari arizalar ro\'yxati'),
(870, 'uz', 'Xabarlar'),
(871, 'uz', 'Hayvon kasalliklari'),
(872, 'uz', 'Dori darmonlar'),
(873, 'uz', 'Statistika'),
(874, 'uz', 'Hayvon kasalliklari (Arizalar)'),
(875, 'uz', 'Oziq-ovqat ekspertizalari (Arizalar)'),
(876, 'uz', 'Hayvon kasalliklari (Dalolatnomalar)'),
(877, 'uz', 'Oziq-ovqat ekspertizalari (Dalolatnomalar)'),
(878, 'uz', 'Xabarlar'),
(879, 'uz', 'Hayvon kasalliklari'),
(880, 'uz', 'Dori darmonlar'),
(881, 'uz', 'Statistika'),
(882, 'uz', 'Hayvon kasalliklari (Arizalar)'),
(883, 'uz', 'Oziq-ovqat ekspertizalari (Arizalar)'),
(884, 'uz', 'Hayvon kasalliklari (Dalolatnomalar)'),
(885, 'uz', 'Oziq-ovqat ekspertizalari (Dalolatnomalar)'),
(886, 'uz', 'Xabarlar'),
(887, 'uz', 'Hayvon kasalliklari'),
(888, 'uz', 'Dori darmonlar'),
(889, 'uz', 'Statistika'),
(890, 'uz', 'Hayvon kasalliklari (Arizalar)'),
(891, 'uz', 'Oziq-ovqat ekspertizalari (Arizalar)'),
(892, 'uz', 'Hayvon kasalliklari (Dalolatnomalar)'),
(893, 'uz', 'Oziq-ovqat ekspertizalari (Dalolatnomalar)'),
(894, 'uz', 'Arizani kuzatish'),
(895, 'uz', 'Arizani kuzatish'),
(896, 'uz', 'ID'),
(897, 'uz', 'Hayvon turi'),
(898, 'uz', 'Hayvon holat'),
(899, 'uz', 'Manzil'),
(900, 'uz', 'Lat'),
(901, 'uz', 'Long'),
(902, 'uz', 'Batafsil'),
(903, 'uz', 'Telefon raqami'),
(904, 'uz', 'Operator'),
(905, 'uz', 'Tasdiqdan o\'tgan'),
(906, 'uz', 'Status'),
(907, 'uz', 'Created'),
(908, 'uz', 'Updated'),
(909, 'uz', 'Code'),
(910, 'uz', 'Rep ID'),
(911, 'uz', 'Til'),
(912, 'uz', 'Bajaruvchi Labaratoriya'),
(913, 'uz', 'ID'),
(914, 'uz', 'Hayvon turi'),
(915, 'uz', 'Hayvon holat'),
(916, 'uz', 'Manzil'),
(917, 'uz', 'Lat'),
(918, 'uz', 'Long'),
(919, 'uz', 'Batafsil'),
(920, 'uz', 'Telefon raqami'),
(921, 'uz', 'Operator'),
(922, 'uz', 'Tasdiqdan o\'tgan'),
(923, 'uz', 'Status'),
(924, 'uz', 'Created'),
(925, 'uz', 'Updated'),
(926, 'uz', 'Code'),
(927, 'uz', 'Rep ID'),
(928, 'uz', 'Til'),
(929, 'uz', 'Bajaruvchi Labaratoriya'),
(930, 'uz', 'Yo\'q'),
(931, 'uz', 'Ha'),
(932, 'uz', 'Tekshirilmagan'),
(933, 'uz', 'ID'),
(934, 'uz', 'Hayvon turi'),
(935, 'uz', 'Hayvon holat'),
(936, 'uz', 'Manzil'),
(937, 'uz', 'Lat'),
(938, 'uz', 'Long'),
(939, 'uz', 'Batafsil'),
(940, 'uz', 'Telefon raqami'),
(941, 'uz', 'Operator'),
(942, 'uz', 'Tasdiqdan o\'tgan'),
(943, 'uz', 'Status'),
(944, 'uz', 'Created'),
(945, 'uz', 'Updated'),
(946, 'uz', 'Code'),
(947, 'uz', 'Rep ID'),
(948, 'uz', 'Til'),
(949, 'uz', 'Bajaruvchi Labaratoriya'),
(950, 'uz', 'Yo\'q'),
(951, 'uz', 'Ha'),
(952, 'uz', 'Tekshirilmagan'),
(953, 'uz', 'ID'),
(954, 'uz', 'Turi'),
(955, 'uz', 'Holat'),
(956, 'uz', 'Manzil'),
(957, 'uz', 'Lat'),
(958, 'uz', 'Long'),
(959, 'uz', 'Batafsil'),
(960, 'uz', 'Telefon raqami'),
(961, 'uz', 'Code'),
(962, 'uz', 'Rep ID'),
(963, 'uz', 'Created'),
(964, 'uz', 'Operator'),
(965, 'uz', 'Tasdiqdan o\'tgan'),
(966, 'uz', 'Status'),
(967, 'uz', 'Rep ID'),
(968, 'uz', 'Code'),
(969, 'uz', 'Cat ID'),
(970, 'uz', 'Type ID'),
(971, 'uz', 'Soato ID'),
(972, 'uz', 'Lat'),
(973, 'uz', 'Long'),
(974, 'uz', 'Detail'),
(975, 'uz', 'Phone'),
(976, 'uz', 'Created'),
(977, 'uz', 'Operator ID'),
(978, 'uz', 'Is True'),
(979, 'uz', 'Status ID'),
(980, 'uz', 'Rep ID'),
(981, 'uz', 'Code'),
(982, 'uz', 'Cat ID'),
(983, 'uz', 'Type ID'),
(984, 'uz', 'Soato ID'),
(985, 'uz', 'Lat'),
(986, 'uz', 'Long'),
(987, 'uz', 'Detail'),
(988, 'uz', 'Phone'),
(989, 'uz', 'Created'),
(990, 'uz', 'Operator ID'),
(991, 'uz', 'Is True'),
(992, 'uz', 'Status ID'),
(993, 'uz', 'Yo\'q'),
(994, 'uz', 'Ha'),
(995, 'uz', 'Tekshirilmagan'),
(996, 'uz', 'Rep ID'),
(997, 'uz', 'Code'),
(998, 'uz', 'Cat ID'),
(999, 'uz', 'Type ID'),
(1000, 'uz', 'Soato ID'),
(1001, 'uz', 'Lat'),
(1002, 'uz', 'Long'),
(1003, 'uz', 'Detail'),
(1004, 'uz', 'Phone'),
(1005, 'uz', 'Created'),
(1006, 'uz', 'Operator ID'),
(1007, 'uz', 'Is True'),
(1008, 'uz', 'Status ID'),
(1009, 'uz', 'Yo\'q'),
(1010, 'uz', 'Ha'),
(1011, 'uz', 'Tekshirilmagan'),
(1012, 'uz', 'Code'),
(1013, 'uz', 'Rep ID'),
(1014, 'uz', 'Created'),
(1015, 'uz', 'Talabga muvoffiqligini tanlang'),
(1016, 'uz', 'Natija(oraliq)'),
(1017, 'uz', 'Tekshirilgan'),
(1018, 'uz', 'Ariza muvoffaqiyatli yuborildi'),
(1019, 'uz', 'Namuna {number} raqami bilan saqlandi'),
(1020, 'uz', 'Emlash: {name}'),
(1021, 'uz', 'Hayvonlar'),
(1022, 'uz', 'Emlash'),
(1023, 'uz', 'Kasallikni talang'),
(1024, 'uz', 'Animal ID'),
(1025, 'uz', 'Vaccina ID'),
(1026, 'uz', 'Disease ID'),
(1027, 'uz', 'Disease Date'),
(1028, 'uz', 'Saqlash'),
(1029, 'uz', 'Davolash: {name}'),
(1030, 'uz', 'Davolash'),
(1031, 'uz', 'Hayvon'),
(1032, 'uz', 'Antibiotik'),
(1033, 'uz', 'Sana'),
(1034, 'uz', 'Namuna yo\'q qilish dalolatnomasi tasdiqlash uchun rahbarga yuborildi'),
(1035, 'uz', 'Dalolatnomaga namuna biriktirilmagan'),
(1036, 'uz', 'Xatolik'),
(1037, 'uz', 'Birlashgan namunalardan'),
(1038, 'uz', 'Birlashgan namunalardan'),
(1039, 'uz', 'Birlashgan namunalardan'),
(1040, 'uz', 'Birlashgan namunalardan'),
(1041, 'uz', 'Birlashgan namunalardan'),
(1042, 'uz', 'Birlashgan namunalardan'),
(1043, 'uz', 'Tasdiqlanmadi'),
(1044, 'uz', 'Tasdiqlandi'),
(1045, 'uz', 'Umumiy tekshiruv natijasi'),
(1046, 'uz', 'Name'),
(1047, 'uz', 'Sample ID'),
(1048, 'uz', 'Tavfsiya matni'),
(1049, 'uz', 'Mahsulot ekspertizalari'),
(1050, 'uz', 'Topshiriq rad etildi'),
(1051, 'uz', 'Topshiriq rad etildi'),
(1052, 'uz', 'Materiallar soni'),
(1053, 'uz', 'Patonomiya'),
(1054, 'uz', 'Organoleptika'),
(1055, 'uz', 'Mikroskopiya Nurli'),
(1056, 'uz', 'Mikroskopiya Lyuminesent'),
(1057, 'uz', 'Bakterilogik'),
(1058, 'uz', 'Virusologik TE,KE'),
(1059, 'uz', 'Virusologik XM,KK'),
(1060, 'uz', 'Biologik'),
(1061, 'uz', 'RA,KR'),
(1062, 'uz', 'RSK'),
(1063, 'uz', 'RDSK'),
(1064, 'uz', 'RBP'),
(1065, 'uz', 'RMA'),
(1066, 'uz', 'RP,RDP'),
(1067, 'uz', 'RH'),
(1068, 'uz', 'RNGA'),
(1069, 'uz', 'RGA'),
(1070, 'uz', 'IFA'),
(1071, 'uz', 'IXLA'),
(1072, 'uz', 'Boshqa Serologiya'),
(1073, 'uz', 'PSR'),
(1074, 'uz', 'Gistologiya'),
(1075, 'uz', 'Gemotologiya'),
(1076, 'uz', 'Koprologiya'),
(1077, 'uz', 'Kimyoviy'),
(1078, 'uz', 'Biokimyoviy'),
(1079, 'uz', 'Patonomiya'),
(1080, 'uz', 'Organoleptika'),
(1081, 'uz', 'Mikroskopiya Nurli'),
(1082, 'uz', 'Mikroskopiya Lyuminesent'),
(1083, 'uz', 'Bakterilogik'),
(1084, 'uz', 'Virusologik TE,KE'),
(1085, 'uz', 'Virusologik XM,KK'),
(1086, 'uz', 'Biologik'),
(1087, 'uz', 'RA,KR'),
(1088, 'uz', 'RSK'),
(1089, 'uz', 'RDSK'),
(1090, 'uz', 'RBP'),
(1091, 'uz', 'RMA'),
(1092, 'uz', 'RP,RDP'),
(1093, 'uz', 'RH'),
(1094, 'uz', 'RNGA'),
(1095, 'uz', 'RGA'),
(1096, 'uz', 'IFA'),
(1097, 'uz', 'IXLA'),
(1098, 'uz', 'Boshqa Serologiya'),
(1099, 'uz', 'PSR'),
(1100, 'uz', 'Gistologiya'),
(1101, 'uz', 'Gemotologiya'),
(1102, 'uz', 'Koprologiya'),
(1103, 'uz', 'Kimyoviy'),
(1104, 'uz', 'Biokimyoviy'),
(1105, 'uz', 'RGKA'),
(1106, 'uz', 'RGKA'),
(1107, 'uz', 'O\'tkazilgan tekshiruv natijalari kiritlmagan'),
(1108, 'uz', 'Umumlashgan natija kiritlmagan'),
(1109, 'uz', 'Natija muvoffaqiyatli tasdiqlandi. Natija rahbar tasdiqlashi uchun yuborildi.'),
(1110, 'uz', 'Hayvon kasalliklari tashxisi bo`yicha o`tkazilgan tekshiruvlar hisoboti');

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` int(11) NOT NULL,
  `id_from_api` int(11) DEFAULT NULL,
  `TIN` int(11) NOT NULL,
  `NA1_CODE` int(11) NOT NULL,
  `NS10_CODE` int(11) NOT NULL,
  `NS11_CODE` int(11) NOT NULL,
  `NAME_FULL` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ADDRESS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_DATE` datetime DEFAULT NULL,
  `DATE_TIN` datetime DEFAULT NULL,
  `REG_NUM` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NS13_CODE` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TELEFON` int(11) DEFAULT NULL,
  `TELEX` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FAX` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GD_FULL_NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `GD_TIN` int(11) NOT NULL,
  `GD_TEL_WORK` int(11) DEFAULT NULL,
  `GD_TEL_HOME` bit(1) DEFAULT NULL,
  `GD_EMAIL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GB_FULL_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GB_TIN` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GB_TEL_WORK` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GB_TEL_HOME` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OKED` int(11) NOT NULL,
  `OKPO` int(11) NOT NULL,
  `OKONX` int(11) NOT NULL,
  `soato` int(11) NOT NULL,
  `EMAIL` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DATE_END` datetime DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `CHANGED` datetime DEFAULT NULL,
  `GD_MOBILE` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BUDJET` bit(1) NOT NULL,
  `type_id` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`id`, `id_from_api`, `TIN`, `NA1_CODE`, `NS10_CODE`, `NS11_CODE`, `NAME_FULL`, `ADDRESS`, `REG_DATE`, `DATE_TIN`, `REG_NUM`, `NS13_CODE`, `TELEFON`, `TELEX`, `FAX`, `GD_FULL_NAME`, `GD_TIN`, `GD_TEL_WORK`, `GD_TEL_HOME`, `GD_EMAIL`, `GB_FULL_NAME`, `GB_TIN`, `GB_TEL_WORK`, `GB_TEL_HOME`, `OKED`, `OKPO`, `OKONX`, `soato`, `EMAIL`, `DATE_END`, `CREATED`, `CHANGED`, `GD_MOBILE`, `BUDJET`, `type_id`) VALUES
(1, 651597, 201155766, 19, 26, 1, 'RESPUBLIKA MANAVIYAT TARGIBOT MARKAZI', 'ЯККАСАРОЙ УЛ.БОБУРА Д.9', '2012-04-20 14:00:00', '0000-00-00 00:00:00', '', '0', 2390518, '', '', 'KADIROV ALISHER KELDIYEVICH', 488586789, 2155045, b'1', 'test', 'test', '0', 'test', '', 94120, 15320785, 98400, 1726273, '', '0000-00-00 00:00:00', '2018-11-15 10:50:01', '2019-01-11 06:18:42', 'rw', b'1', 1),
(2, 113644, 200935112, 19, 26, 6, 'УЧРЕЖДЕНИЕ \"\"DAVLAT VETERINARIYA BOSH BOSHQARMASI\"\"', 'FARXOD KO`CHASI, 21A-UY', '2017-08-20 17:00:00', '0000-00-00 00:00:00', '', '0', 2769085, '', '', 'НОРКОБИЛОВ БАХРОМЖОН', 509165541, 2763324, b'0', '', '', '0', '', '', 84112, 5596960, 97400, 1726294, '', '0000-00-00 00:00:00', '2018-11-15 10:49:12', '2019-01-11 06:18:42', '', b'1', 2);

-- --------------------------------------------------------

--
-- Table structure for table `organization_type`
--

CREATE TABLE `organization_type` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `organization_type`
--

INSERT INTO `organization_type` (`id`, `name`) VALUES
(1, 'лаборатория'),
(2, 'комитет'),
(3, 'худидий бошкарма'),
(4, 'туман булими');

-- --------------------------------------------------------

--
-- Table structure for table `post_list`
--

CREATE TABLE `post_list` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `def_role` int(11) DEFAULT NULL COMMENT 'Лавозимнинг ҳуқуқи (Default role)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Лавозимлар руйхати.';

--
-- Dumping data for table `post_list`
--

INSERT INTO `post_list` (`id`, `name`, `def_role`) VALUES
(1, 'Registrator', 1),
(2, 'Labarant', 2),
(3, 'Labratoriya mudiri', 3),
(4, 'Rahbar', 4),
(5, 'Administrator', 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `qfi_view`
-- (See below for the actual view)
--
CREATE TABLE `qfi_view` (
`MHOBT_cod` int(11)
,`district_id` int(11)
,`region_id` int(11)
,`qfi_id` int(11)
,`name_lot` varchar(100)
,`center_lot` varchar(50)
,`name_cyr` varchar(100)
,`center_cyr` varchar(50)
,`name_ru` varchar(100)
,`center_ru` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `regions_view`
-- (See below for the actual view)
--
CREATE TABLE `regions_view` (
`region_id` int(11)
,`name_lot` varchar(100)
,`center_lot` varchar(50)
,`name_cyr` varchar(100)
,`center_cyr` varchar(50)
,`name_ru` varchar(100)
,`center_ru` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `regulations`
--

CREATE TABLE `regulations` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(255) DEFAULT NULL,
  `name_ru` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Normativ hujjatlar';

--
-- Dumping data for table `regulations`
--

INSERT INTO `regulations` (`id`, `name_uz`, `name_ru`, `file`, `creator_id`, `status`, `created`, `updated`, `type_id`) VALUES
(1, 'Namunaviy hujjat 1', 'Namunaviy hujjat 1', '', 2, 1, '2022-03-25 20:40:05', '2022-03-30 01:02:43', 1),
(2, 'Namunaviy hujjat 2', 'Namunaviy hujjat 2', '', 2, 1, '2022-03-25 20:40:10', '2022-03-30 01:02:45', 1),
(3, 'Namunaviy hujjat 3', 'Namunaviy hujjat 3', '', 2, 1, '2022-03-25 20:40:15', '2022-03-30 01:02:46', 1);

-- --------------------------------------------------------

--
-- Table structure for table `regulation_types`
--

CREATE TABLE `regulation_types` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(255) DEFAULT NULL,
  `name_ru` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='regulation typelari';

--
-- Dumping data for table `regulation_types`
--

INSERT INTO `regulation_types` (`id`, `name_uz`, `name_ru`) VALUES
(1, 'Hayvon kasalliklari diagnostikasi', 'Hayvon kasalliklari diagnostikasi'),
(2, 'Oziq-ovqat mahsulotlari ekspertizasi', 'Oziq-ovqat mahsulotlari ekspertizasi');

-- --------------------------------------------------------

--
-- Table structure for table `report_animal`
--

CREATE TABLE `report_animal` (
  `id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL COMMENT 'Kirik olik',
  `soato_id` int(11) DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `long` varchar(255) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `is_true` int(11) DEFAULT -1,
  `report_status_id` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `code` varchar(255) DEFAULT NULL,
  `rep_id` int(11) DEFAULT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Hayvon kasalliklari buyicha arizalar';

--
-- Dumping data for table `report_animal`
--

INSERT INTO `report_animal` (`id`, `type_id`, `cat_id`, `soato_id`, `lat`, `long`, `detail`, `operator_id`, `is_true`, `report_status_id`, `phone`, `created`, `updated`, `code`, `rep_id`, `lang`, `organization_id`) VALUES
(4, 1, 1, 1735401554, '123', '123', 'text', NULL, -1, 1, NULL, '2022-03-21 20:25:55', '2022-03-21 20:25:55', '22-35401-1', 1, 'uz', NULL),
(5, 1, 1, 1735401554, '123', '123', 'text', NULL, -1, 1, NULL, '2022-03-21 20:28:48', '2022-03-21 20:28:48', '22-35401-2', 2, 'uz', NULL),
(6, 1, 1, 1735401554, '123', '123', 'text', NULL, -1, 1, NULL, '2022-03-21 20:29:05', '2022-03-21 20:29:05', '22-35401-3', 3, 'uz', NULL),
(7, 1, 1, 1735401554, '123', '123', 'text', NULL, -1, 1, NULL, '2022-03-21 20:29:25', '2022-03-21 20:29:25', '22-35401-4', 4, 'uz', NULL),
(8, 1, 1, 1735401554, '123', '123', 'text', NULL, -1, 1, NULL, '2022-03-21 20:30:12', '2022-03-21 20:30:12', '22-35401-5', 5, 'uz', NULL),
(9, 1, 1, 1735401554, '123', '123', 'text', NULL, -1, 1, NULL, '2022-03-21 20:31:20', '2022-03-21 20:31:20', '22-35401-6', 6, 'uz', NULL),
(10, 1, 1, 1735401554, '123', '123', 'text', NULL, -1, 1, NULL, '2022-03-21 20:31:31', '2022-03-21 20:31:31', '22-35401-7', 7, 'uz', NULL),
(11, 1, 1, 1735401554, '123', '123', 'text', NULL, -1, 1, NULL, '2022-03-21 20:32:47', '2022-03-21 20:32:47', '22-35401-8', 8, 'uz', NULL),
(12, 1, 1, 1735401554, '123', '123', 'text', NULL, -1, 1, NULL, '2022-03-21 20:33:29', '2022-03-21 20:33:29', '22-35401-9', 9, 'uz', NULL),
(13, 1, 1, 1735401554, '123', '123', 'text', NULL, -1, 1, NULL, '2022-03-21 20:34:05', '2022-03-21 20:34:05', '22-35401-10', 10, 'uz', NULL),
(14, 1, 1, 1735401554, '123', '123', 'text', NULL, -1, 1, '998999670395', '2022-03-21 20:34:56', '2022-03-21 20:34:56', '22-35401-11', 11, 'uz', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `report_animal_images`
--

CREATE TABLE `report_animal_images` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report_animal_images`
--

INSERT INTO `report_animal_images` (`id`, `image`, `report_id`) VALUES
(1, 'image1.jpg', 13),
(2, 'image2.jpg', 13),
(3, 'image1.jpg', 14),
(4, 'image2.jpg', 14);

-- --------------------------------------------------------

--
-- Table structure for table `report_drugs`
--

CREATE TABLE `report_drugs` (
  `id` int(11) NOT NULL,
  `rep_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `soato_id` int(11) DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `long` varchar(255) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `operator_id` int(11) DEFAULT NULL,
  `is_true` tinyint(1) DEFAULT -1,
  `status_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='dirlarniki';

--
-- Dumping data for table `report_drugs`
--

INSERT INTO `report_drugs` (`id`, `rep_id`, `code`, `cat_id`, `type_id`, `soato_id`, `lat`, `long`, `detail`, `phone`, `created`, `updated`, `operator_id`, `is_true`, `status_id`) VALUES
(1, 12, '22-35401-12', 1, 1, 1735401554, '441', '155', 'testsd', '998999670395', '2022-03-22 20:00:49', '2022-03-22 20:00:49', NULL, -1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `report_drug_images`
--

CREATE TABLE `report_drug_images` (
  `id` int(11) NOT NULL,
  `report_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report_drug_images`
--

INSERT INTO `report_drug_images` (`id`, `report_id`, `image`) VALUES
(1, 1, 'test.jpg'),
(2, 1, 'test.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `report_drug_type`
--

CREATE TABLE `report_drug_type` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(255) DEFAULT NULL,
  `name_ru` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report_drug_type`
--

INSERT INTO `report_drug_type` (`id`, `name_uz`, `name_ru`) VALUES
(1, 'Test kategory 1', 'Test kategory 1'),
(2, 'Test kategory 2', 'Test kategory 2');

-- --------------------------------------------------------

--
-- Table structure for table `report_food`
--

CREATE TABLE `report_food` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `rep_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `long` varchar(255) DEFAULT NULL,
  `soato_id` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_true` tinyint(1) DEFAULT -1,
  `status_id` int(11) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Oziq ovqat holati haqida';

--
-- Dumping data for table `report_food`
--

INSERT INTO `report_food` (`id`, `code`, `rep_id`, `type_id`, `cat_id`, `lat`, `long`, `soato_id`, `phone`, `detail`, `created`, `updated`, `is_true`, `status_id`, `operator_id`) VALUES
(1, '22-35401-12', 12, 1, 1, '555', '555', 1735401554, '998999670395', 'test', '2022-03-22 19:17:40', '2022-03-22 19:17:40', -1, 1, NULL),
(2, '22-35401-12', 12, 1, 1, '555', '555', 1735401554, '998999670395', 'test', '2022-03-22 19:18:38', '2022-03-22 19:18:38', -1, 1, NULL),
(3, '22-35401-12', 12, 1, 1, '555', '555', 1735401554, '998999670395', 'test', '2022-03-22 19:18:53', '2022-03-22 19:18:53', -1, 1, NULL),
(4, '22-35401-12', 12, 1, 1, '555', '555', 1735401554, '998999670395', 'test', '2022-03-22 19:19:28', '2022-03-22 19:19:28', -1, 1, NULL),
(5, '22-35401-12', 12, 1, 1, '555', '555', 1735401554, '998999670395', 'test', '2022-03-22 19:19:33', '2022-03-22 19:19:33', -1, 1, NULL),
(6, '22-35401-12', 12, 1, 1, '555', '555', 1735401554, '998999670395', 'test', '2022-03-22 19:19:46', '2022-03-22 19:19:46', -1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `report_food_category`
--

CREATE TABLE `report_food_category` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(255) NOT NULL DEFAULT '',
  `name_ru` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report_food_category`
--

INSERT INTO `report_food_category` (`id`, `name_uz`, `name_ru`) VALUES
(1, 'Tashqi ko\'rinishi', 'внешний вид'),
(2, 'Hidi', 'запах'),
(3, 'Ta\'mi', 'вкус ');

-- --------------------------------------------------------

--
-- Table structure for table `report_food_images`
--

CREATE TABLE `report_food_images` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='rasmlar';

--
-- Dumping data for table `report_food_images`
--

INSERT INTO `report_food_images` (`id`, `image`, `report_id`) VALUES
(1, 'test1.jpg', 2),
(2, 'test2.jpg', 2),
(3, 'test1.jpg', 3),
(4, 'test2.jpg', 3),
(5, 'test1.jpg', 4),
(6, 'test2.jpg', 4),
(7, 'test2.jpg', 6);

-- --------------------------------------------------------

--
-- Table structure for table `report_status`
--

CREATE TABLE `report_status` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(255) DEFAULT NULL,
  `name_ru` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report_status`
--

INSERT INTO `report_status` (`id`, `name_uz`, `name_ru`) VALUES
(1, 'Yangi', 'Yangi'),
(2, 'Qayta ishlangan', 'Qayta ishlangan'),
(3, 'Rad etilgan', 'Rad etilgan');

-- --------------------------------------------------------

--
-- Table structure for table `requirements`
--

CREATE TABLE `requirements` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(255) DEFAULT NULL,
  `name_ru` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='talablarga mosligi';

--
-- Dumping data for table `requirements`
--

INSERT INTO `requirements` (`id`, `name_uz`, `name_ru`) VALUES
(1, 'Talablarga mos', 'Talablarga mos'),
(2, 'Talabga mos kelmaydi', 'Talabga mos kelmaydi');

-- --------------------------------------------------------

--
-- Table structure for table `research_category`
--

CREATE TABLE `research_category` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ru` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `research_category`
--

INSERT INTO `research_category` (`id`, `name_uz`, `name_ru`) VALUES
(1, 'Bepul', 'Бесплатно'),
(2, 'Pullik', 'Платный');

-- --------------------------------------------------------

--
-- Table structure for table `result_animal`
--

CREATE TABLE `result_animal` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `code_id` int(11) DEFAULT NULL,
  `temprature` int(11) DEFAULT NULL,
  `humidity` int(11) DEFAULT NULL,
  `reagent_name` varchar(255) DEFAULT NULL,
  `reagent_series` varchar(255) DEFAULT NULL,
  `conditions` text DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `ads` varchar(255) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `consent_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `state_id` int(11) DEFAULT NULL,
  `sample_id` int(11) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  `patonomiya` int(11) NOT NULL DEFAULT 0,
  `organoleptika` int(11) NOT NULL DEFAULT 0,
  `mikroskopiya_nurli` int(11) NOT NULL DEFAULT 0,
  `mikroskopiya_lyuminesent` int(11) NOT NULL DEFAULT 0,
  `bakterilogik` int(11) NOT NULL DEFAULT 0,
  `virusologik_TE_KE` int(11) NOT NULL DEFAULT 0,
  `virusologik_XM_KK` int(11) NOT NULL DEFAULT 0,
  `biologik` int(11) NOT NULL DEFAULT 0,
  `RA_KR` int(11) NOT NULL DEFAULT 0,
  `RSK` int(11) NOT NULL DEFAULT 0,
  `RDSK` int(11) NOT NULL DEFAULT 0,
  `RBP` int(11) NOT NULL DEFAULT 0,
  `RMA` int(11) NOT NULL DEFAULT 0,
  `RP_RDP` int(11) NOT NULL DEFAULT 0,
  `RH` int(11) NOT NULL DEFAULT 0,
  `RNGA` int(11) NOT NULL DEFAULT 0,
  `RGKA` int(11) NOT NULL DEFAULT 0,
  `RGA` int(11) NOT NULL DEFAULT 0,
  `IFA` int(11) NOT NULL DEFAULT 0,
  `IXLA` int(11) NOT NULL DEFAULT 0,
  `boshqa_serologiya` int(11) NOT NULL DEFAULT 0,
  `PSR` int(11) NOT NULL DEFAULT 0,
  `gistologiya` int(11) NOT NULL DEFAULT 0,
  `gemotologiya` int(11) NOT NULL DEFAULT 0,
  `koprologiya` int(11) NOT NULL DEFAULT 0,
  `kimyoviy` int(11) NOT NULL DEFAULT 0,
  `biokimyoviy` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Natijalar';

--
-- Dumping data for table `result_animal`
--

INSERT INTO `result_animal` (`id`, `code`, `code_id`, `temprature`, `humidity`, `reagent_name`, `reagent_series`, `conditions`, `end_date`, `ads`, `creator_id`, `consent_id`, `created`, `updated`, `state_id`, `sample_id`, `org_id`, `patonomiya`, `organoleptika`, `mikroskopiya_nurli`, `mikroskopiya_lyuminesent`, `bakterilogik`, `virusologik_TE_KE`, `virusologik_XM_KK`, `biologik`, `RA_KR`, `RSK`, `RDSK`, `RBP`, `RMA`, `RP_RDP`, `RH`, `RNGA`, `RGKA`, `RGA`, `IFA`, `IXLA`, `boshqa_serologiya`, `PSR`, `gistologiya`, `gemotologiya`, `koprologiya`, `kimyoviy`, `biokimyoviy`) VALUES
(16, '001-1', 1, 1, 2, '4', '3', '45', '2022-04-05', '1', NULL, NULL, '2022-04-05 22:05:43', '2022-04-18 00:31:55', 1, 25, NULL, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(17, '001-1', 1, 1, 2, '54', '3', '234', '2022-04-18', '1', NULL, NULL, '2022-04-05 22:06:48', '2022-04-18 00:31:39', 1, 26, NULL, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18, '001-1', 1, 1, 2, '4', '3', '2', '2022-04-05', '0', NULL, NULL, '2022-04-05 22:08:26', '2022-04-17 23:50:53', 1, 27, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(19, '001-1', 1, 1, 2, '4', '3', '5', '2022-04-05', '1', NULL, NULL, '2022-04-05 22:08:34', '2022-04-17 23:47:05', 1, 28, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `result_animal_tests`
--

CREATE TABLE `result_animal_tests` (
  `id` int(11) NOT NULL,
  `result` varchar(255) NOT NULL,
  `result_2` varchar(255) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `result_id` int(11) DEFAULT NULL,
  `checked` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `result_animal_tests`
--

INSERT INTO `result_animal_tests` (`id`, `result`, `result_2`, `type_id`, `template_id`, `result_id`, `checked`) VALUES
(1, '3', '', 1, 1, 16, 1),
(2, '1', '8', 2, 2, 16, 1),
(3, '3', '', 1, 3, 16, 1),
(4, '2', '', 2, 4, 16, 1),
(5, '1', '', 1, 5, 16, 0),
(6, '123', '', 1, 6, 16, 0);

-- --------------------------------------------------------

--
-- Table structure for table `result_food`
--

CREATE TABLE `result_food` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `code_id` int(11) DEFAULT NULL,
  `ads` varchar(255) DEFAULT NULL,
  `sample_id` int(11) DEFAULT NULL,
  `require_id` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `consept_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `state_id` int(11) DEFAULT 1,
  `org_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='test natijalarini ';

--
-- Dumping data for table `result_food`
--

INSERT INTO `result_food` (`id`, `code`, `code_id`, `ads`, `sample_id`, `require_id`, `creator_id`, `consept_id`, `created`, `updated`, `state_id`, `org_id`) VALUES
(7, '001-1', 1, '0', 9, 1, 5, NULL, '2022-04-08 04:14:07', '2022-04-08 19:14:07', 1, 1),
(8, '001-2', 2, '0', 11, 1, 5, NULL, '2022-04-08 04:15:29', '2022-04-08 19:15:29', 1, 1),
(9, '001-3', 3, '0', 12, 1, 5, NULL, '2022-04-08 04:18:22', '2022-04-08 19:18:22', 1, 1),
(10, '001-4', 4, '0', 13, 2, 5, NULL, '2022-04-08 04:18:42', '2022-04-08 19:18:42', 1, 1),
(11, '001-5', 5, NULL, 9, NULL, NULL, NULL, '2022-04-05 23:09:16', '2022-04-05 23:09:16', 1, 1),
(12, '001-6', 6, NULL, 11, NULL, NULL, NULL, '2022-04-05 23:09:31', '2022-04-05 23:09:31', 1, 1),
(13, '001-7', 7, NULL, 12, NULL, NULL, NULL, '2022-04-05 23:09:36', '2022-04-05 23:09:36', 1, 1),
(14, '001-8', 8, NULL, 13, NULL, NULL, NULL, '2022-04-05 23:09:43', '2022-04-05 23:09:43', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `result_food_tests`
--

CREATE TABLE `result_food_tests` (
  `id` int(11) NOT NULL,
  `result` varchar(255) DEFAULT NULL,
  `result_2` varchar(255) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `template_id` int(11) DEFAULT NULL,
  `result_id` int(11) DEFAULT NULL,
  `checked` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `result_food_tests`
--

INSERT INTO `result_food_tests` (`id`, `result`, `result_2`, `type_id`, `template_id`, `result_id`, `checked`) VALUES
(1, '2', '', 1, 1, 7, 1),
(2, '2', '', 1, 2, 7, 1),
(3, '3', '', 1, 1, 8, 1),
(4, '3', '', 1, 2, 8, 1),
(5, '2', '', 1, 1, 9, 1),
(6, '2', '', 1, 2, 9, 1),
(7, '2', '', 1, 1, 10, 1),
(8, '2', '', 1, 2, 10, 1),
(9, '', '', 1, 1, 11, NULL),
(10, '', '', 1, 2, 11, NULL),
(11, '', '', 1, 1, 12, NULL),
(12, '', '', 1, 2, 12, NULL),
(13, '', '', 1, 1, 13, NULL),
(14, '', '', 1, 2, 13, NULL),
(15, '', '', 1, 1, 14, NULL),
(16, '', '', 1, 2, 14, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Роллар сақланадиган таблица. Роллар ташкилот ходимларига берилади. Масалан: Суперадмин, бўлим админи... Тахминан шундай.';

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Registrator'),
(2, 'Labarant'),
(3, 'Bo\'lim boshlig\'i'),
(4, 'Rahbar'),
(5, 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `route_sert`
--

CREATE TABLE `route_sert` (
  `id` int(11) NOT NULL,
  `director_id` int(11) DEFAULT NULL,
  `leader_id` int(11) DEFAULT NULL,
  `executor_id` int(11) DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `ads` varchar(500) DEFAULT NULL,
  `state_id` int(11) DEFAULT 1,
  `created` datetime DEFAULT current_timestamp(),
  `updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sample_id` int(11) DEFAULT NULL,
  `registration_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT 1,
  `sample_type_id` int(11) DEFAULT NULL,
  `vet4` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Sertifikatlarni oborod qilish uchun';

--
-- Dumping data for table `route_sert`
--

INSERT INTO `route_sert` (`id`, `director_id`, `leader_id`, `executor_id`, `deadline`, `ads`, `state_id`, `created`, `updated`, `sample_id`, `registration_id`, `status_id`, `sample_type_id`, `vet4`) VALUES
(1, 3, 4, 5, '2022-04-05', '', 1, '2022-04-05 22:05:43', '2022-04-18 01:04:35', 25, 24, 3, 1, '10102001'),
(2, 3, 4, 5, '2022-04-05', '', 1, '2022-04-05 22:06:48', '2022-04-18 01:04:29', 26, 24, 3, 1, '10402001'),
(3, 3, 4, 5, '2022-04-05', '', 1, '2022-04-05 22:08:26', '2022-04-18 01:03:54', 27, 24, 3, 1, '10402001'),
(4, 3, 4, 5, '2022-04-05', '', 1, '2022-04-05 22:08:34', '2022-04-18 00:34:15', 28, 24, 3, 1, '10402001');

-- --------------------------------------------------------

--
-- Table structure for table `route_status`
--

CREATE TABLE `route_status` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(255) DEFAULT NULL,
  `name_ru` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `class` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `route_status`
--

INSERT INTO `route_status` (`id`, `name_uz`, `name_ru`, `icon`, `class`) VALUES
(1, 'Yangi', 'Yangi', 'badge bg-primary', '<i class=\"fa fa-plus-square\"></i>'),
(2, 'Jarayonda', 'Jarayonda', 'badge bg-secondary', '<i class=\"fa fa-clock\"></i>'),
(3, 'Bajarilgan', 'Bajarilgan', 'badge bg-success', '<i class=\"fa fa-check\"></i>'),
(4, 'Labaratoriya mudiri imzosi kutilmoqda', 'Labaratoriya mudiri imzosi kutilmoqda', 'badge bg-warning text-dark', '<i class=\"fa fa-clock\"></i>'),
(5, 'Rahbar imzosi kutilmoqda', 'Rahbar imzosi kutilmoqda', 'badge bg-warning text-dark', '<i class=\"fa fa-clock\"></i>'),
(6, 'Rad etilgan', 'Rad etilgan', 'badge bg-danger', '<i class=\"fa fa-times-circle\"></i>');

-- --------------------------------------------------------

--
-- Table structure for table `samples`
--

CREATE TABLE `samples` (
  `id` int(11) NOT NULL,
  `kod` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `samp_id` int(11) DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_type_is` int(11) DEFAULT NULL,
  `sample_box_id` int(11) DEFAULT NULL,
  `animal_id` int(11) DEFAULT NULL,
  `sert_id` int(11) DEFAULT NULL,
  `suspected_disease_id` int(11) DEFAULT NULL,
  `test_mehod_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT 1,
  `status_id` int(11) DEFAULT 1,
  `emp_id` int(11) DEFAULT -1,
  `repeat_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_group` int(11) DEFAULT 0,
  `cnt` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `samples`
--

INSERT INTO `samples` (`id`, `kod`, `samp_id`, `label`, `sample_type_is`, `sample_box_id`, `animal_id`, `sert_id`, `suspected_disease_id`, `test_mehod_id`, `state_id`, `status_id`, `emp_id`, `repeat_code`, `is_group`, `cnt`) VALUES
(24, '33204-22-1/1', 1, 'qizil paket', 1, 1, 25, 32, 1, 1, 1, 6, -1, 'sd', 0, 1),
(25, '33204-22-2/1', 1, 'qizil paket', 1, 1, 26, 33, 1, 1, 1, 5, 1, 'sd', 1, 1),
(26, '33204-22-2/2', 2, 'qizil paket', 1, 1, 27, 33, 3, 1, 1, 5, 1, '', 1, 1),
(27, '33204-22-2/3', 3, 'sas', 1, 1, 28, 33, 3, 1, 1, 5, 1, '', 0, 1),
(28, '33204-22-2/4', 4, 'qizil paket', 1, 1, 29, 33, 3, 1, 1, 5, 1, '', 1, 1),
(29, '33204-22-2/5', 5, 'dfyryrty', 1, 1, 30, 33, 1, 1, 1, 6, -1, '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sample_boxes`
--

CREATE TABLE `sample_boxes` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name_ru` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sample_boxes`
--

INSERT INTO `sample_boxes` (`id`, `name_uz`, `name_ru`) VALUES
(1, 'quti', 'яшик'),
(6, 'xalta', 'мешок');

-- --------------------------------------------------------

--
-- Table structure for table `sample_conditions`
--

CREATE TABLE `sample_conditions` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(100) NOT NULL,
  `name_ru` varchar(255) NOT NULL,
  `code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sample_conditions`
--

INSERT INTO `sample_conditions` (`id`, `name_uz`, `name_ru`, `code`) VALUES
(1, 'коникарли', 'удовлет', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sample_recomendation`
--

CREATE TABLE `sample_recomendation` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `sample_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sample_recomendation`
--

INSERT INTO `sample_recomendation` (`id`, `name`, `sample_id`) VALUES
(1, 'novidir qilish garak', 28),
(2, 'test', 28),
(3, 'asdasd', 28),
(4, 'test', 28),
(5, 'asdasd', 28),
(6, 'qwe123', 28),
(7, 'asd34234s', 28),
(8, 'test', 27),
(9, '123', 27),
(10, '234', 26),
(11, 'tavfsiya1', 25),
(12, 'tavfsiya2', 25);

-- --------------------------------------------------------

--
-- Table structure for table `sample_registration`
--

CREATE TABLE `sample_registration` (
  `id` int(11) NOT NULL,
  `pnfl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_research` tinyint(1) DEFAULT NULL COMMENT 'Текшириладими, йўқми?',
  `code_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'xx-1,2-xxx-xxxx xx-yil, xxx-tashkilot idsi, xxxx-tartib raqam',
  `research_category_id` int(11) DEFAULT NULL COMMENT 'Пуллк, текин',
  `results_conformity_id` int(11) DEFAULT NULL COMMENT 'НД соответствия результатов требованиям',
  `organization_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  `reg_id` int(11) DEFAULT NULL,
  `sender_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ads` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `res` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `res_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Регистрация пробы';

--
-- Dumping data for table `sample_registration`
--

INSERT INTO `sample_registration` (`id`, `pnfl`, `inn`, `is_research`, `code_id`, `code`, `research_category_id`, `results_conformity_id`, `organization_id`, `emp_id`, `reg_date`, `reg_id`, `sender_name`, `sender_phone`, `created`, `updated`, `ads`, `status_id`, `res`, `res_id`) VALUES
(23, NULL, '305634884', 0, 1, '22-1-001-1', 1, NULL, 1, 1, NULL, NULL, 'Allabergenov Dilmurod', '+998999670395', '2022-04-02 05:59:38', '2022-04-02 06:00:24', NULL, 6, NULL, 0),
(24, NULL, '305634884', 1, 2, '22-1-001-2', 1, NULL, 1, 1, NULL, NULL, 'Allabergenov Dilmurod', '(99)-967-0395', '2022-04-05 21:58:41', '2022-04-18 01:04:35', NULL, 5, 'M/001-2', 2);

-- --------------------------------------------------------

--
-- Table structure for table `sample_status`
--

CREATE TABLE `sample_status` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(255) DEFAULT NULL,
  `name_ru` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Namunalarning holati';

--
-- Dumping data for table `sample_status`
--

INSERT INTO `sample_status` (`id`, `name_uz`, `name_ru`, `type`) VALUES
(1, 'Yaroqli', 'Yaroqli', 1),
(2, 'Yaroqsiz', 'Yaroqsiz', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sample_types`
--

CREATE TABLE `sample_types` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name_ru` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `vet4` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sample_types`
--

INSERT INTO `sample_types` (`id`, `name_uz`, `name_ru`, `vet4`) VALUES
(1, 'патматериал', 'патматериал', '001'),
(2, 'аборт. плоды', 'аборт. плоды', '002'),
(3, 'эмбрионы-задохлики', 'эмбрионы-задохлики', '003'),
(4, 'сперма нативная', 'сперма нативная', '010'),
(5, 'сперма импортная', 'сперма импортная', '013'),
(6, 'слизь препуциальная', 'слизь препуциальная', '014'),
(7, 'слизь влагалищная', 'слизь влагалищная', '015'),
(8, 'икра', 'икра', '004'),
(9, 'кровь', 'кровь', '005'),
(10, 'сыворотка крови', 'сыворотка крови', '006'),
(11, 'пчелы патматериал', 'пчелы патматериал', '011');

-- --------------------------------------------------------

--
-- Table structure for table `sertificates`
--

CREATE TABLE `sertificates` (
  `id` int(11) NOT NULL,
  `sert_id` int(11) NOT NULL COMMENT 'Тизимдаги далолатнома рақами (автоматик генерация қилинади: ХХ-1-ХХХ-ХХХХХ (йил-далолатнома тури-лаборатория коди-тартиб рақами, масалан: 22-1-001-00001 – 2022 йил-касаллик диагностикаси-республика лабораторияси-2022 йилдаги далолатнома тартиб раками)',
  `sert_full` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sert_num` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Далолатнома рақами (коғоздаги ёки РЕГИСТОНдаги)',
  `sert_date` date DEFAULT NULL,
  `inn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pnfl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `vet_site_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `owner_inn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_pnfl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sampler_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sampler_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='далолатномалар';

--
-- Dumping data for table `sertificates`
--

INSERT INTO `sertificates` (`id`, `sert_id`, `sert_full`, `sert_num`, `sert_date`, `inn`, `pnfl`, `vet_site_id`, `status_id`, `state_id`, `created`, `owner_inn`, `owner_pnfl`, `sampler_name`, `sampler_position`) VALUES
(32, 1, '33204-22-1', '22', '2022-04-02', '305634884', '', 1, 6, NULL, '2022-04-02 05:58:16', NULL, '30507903120132', 'Allabergenov Dilmurod', 'dasturchi'),
(33, 2, '33204-22-2', '2223', '2022-04-05', '305634884', '', 1, 5, NULL, '2022-04-05 21:02:54', '306922184', NULL, 'Allabergenov Dilmurod', 'dasturchi'),
(34, 3, '33204-22-3', '22', '2022-04-12', '305634884', '', 1, 0, NULL, '2022-04-12 20:31:33', '306922184', NULL, 'Allabergenov Dilmurod', 'dasturchi');

-- --------------------------------------------------------

--
-- Table structure for table `sert_normatives`
--

CREATE TABLE `sert_normatives` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(255) DEFAULT NULL,
  `name_ru` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Normativ hujjatlar';

--
-- Dumping data for table `sert_normatives`
--

INSERT INTO `sert_normatives` (`id`, `name_uz`, `name_ru`) VALUES
(1, 'Test normativ', 'Test normativ');

-- --------------------------------------------------------

--
-- Table structure for table `sert_status`
--

CREATE TABLE `sert_status` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(255) NOT NULL DEFAULT '',
  `name_ru` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(100) NOT NULL,
  `class` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sert_status`
--

INSERT INTO `sert_status` (`id`, `name_uz`, `name_ru`, `icon`, `class`) VALUES
(0, 'Ariza yuborilmagan', 'Ariza yuborilmagan', '<i class=\"fa-solid fa-bookmark text-info\"></i>', 'badge bg-info'),
(1, 'Yangi', 'Новое', '<i class=\"fa-solid fa-share-from-square text-info\"></i>', 'badge bg-primary'),
(2, 'Namunani olib kelish kutilmoqda', 'Ожидание образца', '<i class=\"fa-solid fa-business-time text-info\"></i>', 'badge bg-secondary'),
(3, 'Jarayonda', 'Распределение', '<i class=\"fa-solid fa-clock text-warning\"></i>', 'badge bg-secondary'),
(4, 'Labaratoriya tadqiqoti', 'Лабораторное исследование', '<i class=\"fa-solid fa-clock text-warning\"></i>', 'badge bg-danger'),
(5, 'Bajarilgan', 'Обработано', '<i class=\"fa-solid fa-check-double text-success\"></i>', 'badge bg-success'),
(6, 'Rad etilgan', 'Откленено', '<i class=\"fa-solid fa-circle-xmark text-danger\"></i>', 'badge bg-danger');

-- --------------------------------------------------------

--
-- Table structure for table `soato`
--

CREATE TABLE `soato` (
  `MHOBT_cod` int(11) NOT NULL,
  `res_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `qfi_id` int(11) DEFAULT NULL,
  `name_lot` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `center_lot` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_cyr` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `center_cyr` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ru` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `center_ru` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `soato`
--

INSERT INTO `soato` (`MHOBT_cod`, `res_id`, `region_id`, `district_id`, `qfi_id`, `name_lot`, `center_lot`, `name_cyr`, `center_cyr`, `name_ru`, `center_ru`) VALUES
(17, 17, NULL, NULL, NULL, 'O\'zbekiston Respublikasi', NULL, 'Ўзбекистон Республикаси', NULL, 'Республика Узбекистан', NULL),
(1703, 17, 3, NULL, NULL, 'Andijon viloyati', 'Andijon sh.', 'Андижон вилояти', 'Андижон ш.', 'Андижанская область', 'г. Андижан'),
(1706, 17, 6, NULL, NULL, 'Buxoro viloyati', 'Buxoro sh.', 'Бухоро вилояти', 'Бухоро ш.', 'Бухарская область', 'г. Бухара'),
(1708, 17, 8, NULL, NULL, 'Jizzax viloyati', 'Jizzax sh.', 'Жиззах вилояти', 'Жиззах ш.', 'Джизакская область', 'г. Джизак'),
(1710, 17, 10, NULL, NULL, 'Qashqadaryo viloyati', 'Qarshi sh.', 'Қашқадарё вилояти', 'Қарши ш.', 'Кашкадарьинская область', 'г. Карши'),
(1712, 17, 12, NULL, NULL, 'Navoiy viloyati', 'Navoiy sh.', 'Навоий вилояти', 'Навоий ш.', 'Навоийская область', 'г. Навои'),
(1714, 17, 14, NULL, NULL, 'Namangan viloyati', 'Namangan sh.', 'Наманган вилояти', 'Наманган ш.', 'Наманганская область', 'г. Наманган'),
(1718, 17, 18, NULL, NULL, 'Samarqand viloyati', 'Samarqand sh.', 'Самарқанд вилояти', 'Самарқанд ш.', 'Самаркандская область', 'г. Самарканд'),
(1722, 17, 22, NULL, NULL, 'Surxondaryo viloyati', 'Termiz sh.', 'Сурхондарё вилояти', 'Термиз ш.', 'Сурхандарьинская область', 'г. Термез'),
(1724, 17, 24, NULL, NULL, 'Sirdaryo viloyati', 'Guliston sh.', 'Сирдарё вилояти', 'Гулистон ш.', 'Сырдарьинская область', 'г. Гулистан'),
(1726, 17, 26, NULL, NULL, 'Toshkent shahri', NULL, 'Тошкент шаҳри', NULL, 'город Ташкент', NULL),
(1727, 17, 27, NULL, NULL, 'Toshkent viloyati', 'Nurafshon sh.', 'Тошкент вилояти', 'Нурафшон ш.', 'Ташкентская область', 'г. Нурафшон'),
(1730, 17, 30, NULL, NULL, 'Farg\'ona viloyati', 'Farg\'ona sh.', 'Фарғона вилояти', 'Фарғона ш.', 'Ферганская область', 'г. Фергана'),
(1733, 17, 33, NULL, NULL, 'Xorazm viloyati', 'Urganch sh.', 'Хоразм вилояти', 'Урганч ш.', 'Хорезмская область', 'г. Ургенч'),
(1735, 17, 35, NULL, NULL, 'Qoraqalpog\'iston Respublikasi', 'Nukus sh.', 'Қорақалпоғистон Республикаси', 'Нукус ш.', 'Республика Каракалпакстан', 'г. Hукус'),
(1703200, 17, 3, 200, NULL, 'Andijon viloyatining tumanlari', NULL, 'Андижон вилоятининг туманлари', NULL, 'Районы Андижанской области', NULL),
(1703202, 17, 3, 202, NULL, 'Oltinko\'l tumani', 'Oltinko\'l a.p.', 'Олтинкўл тумани', 'Олтинкўл а.п.', 'Алтынкульский район', 'нп Алтынкуль'),
(1703203, 17, 3, 203, NULL, 'Andijon tumani', 'Kuyganyor shaharchasi', 'Андижон тумани', 'Куйганёр шаҳарчаси', 'Андижанский район', 'гп Куйганяр'),
(1703206, 17, 3, 206, NULL, 'Baliqchi tumani', 'Baliqchi shaharchasi', 'Балиқчи тумани', 'Балиқчи шаҳарчаси', 'Балыкчинский район', 'гп Баликчи'),
(1703209, 17, 3, 209, NULL, 'Bo\'ston tumani', 'Bo\'z shaharchasi', 'Бўстон тумани', 'Бўз шаҳарчаси', 'Бустонский район', 'гп Боз'),
(1703210, 17, 3, 210, NULL, 'Buloqboshi tumani', 'Buloqboshi shaharchasi', 'Булоқбоши тумани', 'Булоқбоши шаҳарчаси', 'Булакбашинский район', 'гп Булокбоши'),
(1703211, 17, 3, 211, NULL, 'Jalaquduq tumani', 'Jalaquduq sh.', 'Жалақудуқ тумани', 'Жалақудуқ ш.', 'Жалакудукский район', 'г.Жалакудук'),
(1703214, 17, 3, 214, NULL, 'Izboskan tumani', 'Paytug sh.', 'Избоскан тумани', 'Пайтуг ш.', 'Избасканский район', 'г.Пайтуг'),
(1703217, 17, 3, 217, NULL, 'Ulug\'nor tumani', 'Oq oltin shaharchasi', 'Улуғнор тумани', 'Оқ олтин шаҳарчаси', 'Улугноpский район', 'гп Ок-олтин'),
(1703220, 17, 3, 220, NULL, 'Qo\'rg\'ontepa tumani', 'Qo\'rg\'ontepa sh.', 'Қўрғонтепа тумани', 'Қўрғонтепа ш.', 'Кургантепинский район', 'г.Кургантепа'),
(1703224, 17, 3, 224, NULL, 'Asaka tumani', 'Asaka sh.', 'Асака тумани', 'Асака ш.', 'Асакинский район', 'г.Асака'),
(1703227, 17, 3, 227, NULL, 'Marxamat tumani', 'Marxamat sh.', 'Мархамат тумани', 'Мархамат ш.', 'Мархаматский район', 'г.Мархамат'),
(1703230, 17, 3, 230, NULL, 'Shaxrixon tumani', 'Shaxrixon sh.', 'Шахрихон тумани', 'Шахрихон ш.', 'Шахриханский район', 'г.Шахрихан'),
(1703232, 17, 3, 232, NULL, 'Paxtaobod tumani', 'Paxtaobod sh.', 'Пахтаобод тумани', 'Пахтаобод ш.', 'Пахтаабадский район', 'г.Пахтаабад'),
(1703236, 17, 3, 236, NULL, 'Xo\'jaobod tumani', 'Xo\'jaobod sh.', 'Хўжаобод тумани', 'Хўжаобод ш.', 'Ходжаабадский район', 'г.Ходжаабад'),
(1703400, 17, 3, 400, NULL, 'Andijon v-tining vil-t ahamiyatiga ega shaharlari', NULL, 'Андижон в-тининг вил-т аҳамиятига эга шаҳарлари', NULL, 'Города областного подчинения Андижанской области', NULL),
(1703401, 17, 3, 401, NULL, 'Andijon', NULL, 'Андижон', NULL, 'Андижан', NULL),
(1703408, 17, 3, 408, NULL, 'Xonobod', NULL, 'Хонобод', NULL, 'Ханабад', NULL),
(1706200, 17, 6, 200, NULL, 'Buxoro viloyatining tumanlari', NULL, 'Бухоро вилоятининг туманлари', NULL, 'Районы Бухарской области', NULL),
(1706204, 17, 6, 204, NULL, 'Olot tumani', 'Olot sh.', 'Олот тумани', 'Олот ш.', 'Алатский район', 'г.Алат'),
(1706207, 17, 6, 207, NULL, 'Buxoro tumani', 'Gala Osiyo shaharchasi', 'Бухоро тумани', 'Гала Осиё шаҳарчаси', 'Бухарский район', 'г. Галлаасия'),
(1706212, 17, 6, 212, NULL, 'Vobkent tumani', 'Vobkent sh.', 'Вобкент тумани', 'Вобкент ш.', 'Вабкентский район', 'г. Вабкент'),
(1706215, 17, 6, 215, NULL, 'G\'ijduvon tumani', 'G\'ijduvon sh.', 'Ғиждувон тумани', 'Ғиждувон ш.', 'Гиждуванский район', 'г. Гиждуван'),
(1706219, 17, 6, 219, NULL, 'Kogon tumani', 'Kogon sh.', 'Когон тумани', 'Когон ш.', 'Каганский район', 'г. Каган'),
(1706230, 17, 6, 230, NULL, 'Qorako\'l tumani', 'Qorako\'l sh.', 'Қоракўл тумани', 'Қоракўл ш.', 'Каракульский район', 'г. Каракуль'),
(1706232, 17, 6, 232, NULL, 'Qorovulbozor tumani', 'Qorovulbozor sh.', 'Қоровулбозор тумани', 'Қоровулбозор ш.', 'Караулбазарский район', 'г. Каpаулбазаp'),
(1706240, 17, 6, 240, NULL, 'Peshku tumani', 'Yangibozor shaharchasi', 'Пешку тумани', 'Янгибозор шаҳарчаси', 'Пешкунский район', 'гп Янгибозор'),
(1706242, 17, 6, 242, NULL, 'Romitan tumani', 'Romitan sh.', 'Ромитан тумани', 'Ромитан ш.', 'Ромитанский район', 'г. Ромитан'),
(1706246, 17, 6, 246, NULL, 'Jondor tumani', 'Jondor shaharchasi', 'Жондор тумани', 'Жондор шаҳарчаси', 'Жондоpский район', 'гп Жондор'),
(1706258, 17, 6, 258, NULL, 'Shofirkon tumani', 'Shofirkon sh.', 'Шофиркон тумани', 'Шофиркон ш.', 'Шафирканский район', 'г. Шафиркан'),
(1706400, 17, 6, 400, NULL, 'Buxoro viloyatining viloyat ahamiyatiga ega shaharlari', NULL, 'Бухоро вилоятининг вилоят аҳамиятига эга шаҳарлари', NULL, 'Города областного подчинения Бухарской области', NULL),
(1706401, 17, 6, 401, NULL, 'Buxoro', NULL, 'Бухоро', NULL, 'Бухара', NULL),
(1706403, 17, 6, 403, NULL, 'Kogon', NULL, 'Когон', NULL, 'Каган', NULL),
(1708200, 17, 8, 200, NULL, 'Jizzax viloyatining tumanlari', NULL, 'Жиззах вилоятининг туманлари', NULL, 'Районы Джизакской области', NULL),
(1708201, 17, 8, 201, NULL, 'Arnasoy tumani', 'G\'oliblar shaharchasi', 'Арнасой тумани', 'Ғолиблар шаҳарчаси', 'Арнасайский район', 'гп Голиблаp'),
(1708204, 17, 8, 204, NULL, 'Baxmal tumani', 'O\'smat shaharchasi', 'Бахмал тумани', 'Ўсмат шаҳарчаси', 'Бахмальский район', 'гп Усмат'),
(1708209, 17, 8, 209, NULL, 'G\'allaorol tumani', 'G\'allaorol sh.', 'Ғаллаорол тумани', 'Ғаллаорол ш.', 'Галляаральский район', 'г. Галляарал'),
(1708212, 17, 8, 212, NULL, 'Sharof Rashidov tumani', 'Uchtepa shaharchasi', 'Шароф Рашидов тумани', 'Учтепа шаҳарчаси', 'Шароф Рашидовский район', 'гп Уч-тепа'),
(1708215, 17, 8, 215, NULL, 'Do\'stlik tumani', 'Do\'stlik sh.', 'Дўстлик тумани', 'Дўстлик ш.', 'Дустликский район', 'г. Дустлик'),
(1708218, 17, 8, 218, NULL, 'Zomin tumani', 'Zomin shaharchasi', 'Зомин тумани', 'Зомин шаҳарчаси', 'Зааминский район', 'гп Заамин'),
(1708220, 17, 8, 220, NULL, 'Zarbdor tumani', 'Zarbdor shaharchasi', 'Зарбдор тумани', 'Зарбдор шаҳарчаси', 'Зарбдарский район', 'гп Зарбдар'),
(1708223, 17, 8, 223, NULL, 'Mirzacho\'l tumani', 'Gagarin sh.', 'Мирзачўл тумани', 'Гагарин ш.', 'Мирзачульский район', 'г. Гагарин'),
(1708225, 17, 8, 225, NULL, 'Zafarobod tumani', 'Zafarobod shaharchasi', 'Зафаробод тумани', 'Зафаробод шаҳарчаси', 'Зафарабадский район', 'гп Зафарабад'),
(1708228, 17, 8, 228, NULL, 'Paxtakor tumani', 'Paxtakor sh.', 'Пахтакор тумани', 'Пахтакор ш.', 'Пахтакорский район', 'г. Пахтакор'),
(1708235, 17, 8, 235, NULL, 'Forish tumani', 'Bog\'don shaharchasi', 'Фориш тумани', 'Боғдон шаҳарчаси', 'Фаришский район', 'гп Богдон'),
(1708237, 17, 8, 237, NULL, 'Yangiobod tumani', 'Balandchaqir a.p.', 'Янгиобод тумани', 'Баландчақир а.п.', 'Янгиободский район', 'нп Баландчакир'),
(1708400, 17, 8, 400, NULL, 'Jizzax viloyatining viloyat ahamiyatiga ega shaharlari', NULL, 'Жиззах вилоятининг вилоят аҳамиятига эга шаҳарлари', NULL, 'Города областного подчинения Джизакской области', NULL),
(1708401, 17, 8, 401, NULL, 'Jizzax', NULL, 'Жиззах', NULL, 'Джизак', NULL),
(1710200, 17, 10, 200, NULL, 'Qashqadaryo viloyatining tumanlari', NULL, 'Қашқадарё вилоятининг туманлари', NULL, 'Районы Кашкадарьинской области', NULL),
(1710207, 17, 10, 207, NULL, 'G\'uzor tumani', 'G\'uzor sh.', 'Ғузор тумани', 'Ғузор ш.', 'Гузарский район', 'г. Гузар'),
(1710212, 17, 10, 212, NULL, 'Dehqonobod tumani', 'Karashina shaharchasi', 'Деҳқонобод тумани', 'Карашина шаҳарчаси', 'Дехканабадский район', 'гп Корашина'),
(1710220, 17, 10, 220, NULL, 'Qamashi tumani', 'Qamashi sh.', 'Қамаши тумани', 'Қамаши ш.', 'Камашинский район', 'г. Камаши'),
(1710224, 17, 10, 224, NULL, 'Qarshi tumani', 'Beshkent sh.', 'Қарши тумани', 'Бешкент ш.', 'Каршинский район', 'г. Бешкент'),
(1710229, 17, 10, 229, NULL, 'Koson tumani', 'Koson sh.', 'Косон тумани', 'Косон ш.', 'Касанский район', 'г. Касан'),
(1710232, 17, 10, 232, NULL, 'Kitob tumani', 'Kitob sh.', 'Китоб тумани', 'Китоб ш.', 'Китабский район', 'г. Китаб'),
(1710233, 17, 10, 233, NULL, 'Mirishkor tumani', 'Yangi Mirishkor shaharchasi', 'Миришкор тумани', 'Янги Миришкор шаҳарчаси', 'Миришкорский район', 'гп Янги Миришкор'),
(1710234, 17, 10, 234, NULL, 'Muborak tumani', 'Muborak sh.', 'Муборак тумани', 'Муборак ш.', 'Мубарекский район', 'г. Мубарек'),
(1710235, 17, 10, 235, NULL, 'Nishon tumani', 'Yangi Nishon sh.', 'Нишон тумани', 'Янги Нишон ш.', 'Нишанский район', 'г. Янги-Нишан'),
(1710237, 17, 10, 237, NULL, 'Kasbi tumani', 'Mug\'lon shaharchasi', 'Касби тумани', 'Муғлон шаҳарчаси', 'Касбинский район', 'гп Муглон'),
(1710242, 17, 10, 242, NULL, 'Chiroqchi tumani', 'Chiroqchi sh.', 'Чироқчи тумани', 'Чироқчи ш.', 'Чиракчинский район', 'г. Чиракчи'),
(1710245, 17, 10, 245, NULL, 'Shahrisabz tumani', 'Shahrisabz sh.', 'Шаҳрисабз тумани', 'Шаҳрисабз ш.', 'Шахрисабзский район', 'г. Шахрисабз'),
(1710250, 17, 10, 250, NULL, 'Yakkabog\' tumani', 'Yakkabog\' sh.', 'Яккабоғ тумани', 'Яккабоғ ш.', 'Яккабагский район', 'г. Яккабаг'),
(1710400, 17, 10, 400, NULL, 'Qashqadaryo viloyatining viloyat ahamiyatiga ega shaharlari', NULL, 'Қашқадарё вилоятининг вилоят аҳамиятига эга шаҳарлари', NULL, 'Города областного подч. Кашкадарьинской области', NULL),
(1710401, 17, 10, 401, NULL, 'Qarshi', NULL, 'Қарши', NULL, 'Карши', NULL),
(1710405, 17, 10, 405, NULL, 'Shahrisabz', NULL, 'Шаҳрисабз', NULL, 'Шахрисабз', NULL),
(1712200, 17, 12, 200, NULL, 'Navoiy viloyatining tumanlari', NULL, 'Навоий вилоятининг туманлари', NULL, 'Районы Навоийской области', NULL),
(1712211, 17, 12, 211, NULL, 'Konimex tumani', 'Konimex shaharchasi', 'Конимех тумани', 'Конимех шаҳарчаси', 'Канимехский район', 'гп Канимех'),
(1712216, 17, 12, 216, NULL, 'Qiziltepa tumani', 'Qiziltepa sh.', 'Қизилтепа тумани', 'Қизилтепа ш.', 'Кызылтепинский район', 'г. Кызылтепа'),
(1712230, 17, 12, 230, NULL, 'Navbahor tumani', 'Beshrabot a.p.', 'Навбаҳор тумани', 'Бешработ а.п.', 'Навбахорский район', 'нп Бешрабад'),
(1712234, 17, 12, 234, NULL, 'Karmana tumani', 'Karmana shaharchasi', 'Кармана тумани', 'Кармана шаҳарчаси', 'Карманинский район', 'гп Кармана'),
(1712238, 17, 12, 238, NULL, 'Nurota tumani', 'Nurota sh.', 'Нурота тумани', 'Нурота ш.', 'Нуратинский район', 'г. Нурата'),
(1712244, 17, 12, 244, NULL, 'Tomdi tumani', 'Tomdibuloq shaharchasi', 'Томди тумани', 'Томдибулоқ шаҳарчаси', 'Тамдынский район', 'гп Томдибулок'),
(1712248, 17, 12, 248, NULL, 'Uchquduq tumani', 'Uchquduq sh.', 'Учқудуқ тумани', 'Учқудуқ ш.', 'Учкудукский район', 'г. Учкудук'),
(1712251, 17, 12, 251, NULL, 'Xatirchi tumani', 'Yangirabod sh.', 'Хатирчи тумани', 'Янгирабод ш.', 'Хатырчинский район', 'г. Янгирабод'),
(1712400, 17, 12, 400, NULL, 'Navoiy viloyatining viloyat ahamiyatiga ega shaharlarii', NULL, 'Навоий вилоятининг вилоят аҳамиятига эга шаҳарларии', NULL, 'Города областного подчинения Навоийской области', NULL),
(1712401, 17, 12, 401, NULL, 'Navoiy', NULL, 'Навоий', NULL, 'Навои', NULL),
(1712408, 17, 12, 408, NULL, 'Zarafshon', NULL, 'Зарафшон', NULL, 'Заpафшан', NULL),
(1712412, 17, 12, 412, NULL, 'G\'ozg\'on', NULL, 'Ғозғон', NULL, 'Газган', NULL),
(1714200, 17, 14, 200, NULL, 'Namangan viloyatining tumanlari', NULL, 'Наманган вилоятининг туманлари', NULL, 'Районы Наманганской области', NULL),
(1714204, 17, 14, 204, NULL, 'Mingbuloq tumani', 'Jo\'masho\'y shaharchasi', 'Мингбулоқ тумани', 'Жўмашўй шаҳарчаси', 'Мингбулакский pайон', 'гп Джумашуй'),
(1714207, 17, 14, 207, NULL, 'Kosonsoy tumani', 'Kosonsoy sh.', 'Косонсой тумани', 'Косонсой ш.', 'Касансайский район', 'г. Касансай'),
(1714212, 17, 14, 212, NULL, 'Namangan tumani', 'Toshbuloq shaharchasi', 'Наманган тумани', 'Тошбулоқ шаҳарчаси', 'Наманганский район', 'гп Ташбулак'),
(1714216, 17, 14, 216, NULL, 'Norin tumani', 'Xaqqulobod sh.', 'Норин тумани', 'Хаққулобод ш.', 'Нарынский район', 'г. Хаккулабад'),
(1714219, 17, 14, 219, NULL, 'Pop tumani', 'Pop sh.', 'Поп тумани', 'Поп ш.', 'Папский район', 'г. Пап'),
(1714224, 17, 14, 224, NULL, 'To\'raqo\'rg\'on tumani', 'To\'raqo\'rg\'on sh.', 'Тўрақўрғон тумани', 'Тўрақўрғон ш.', 'Туракурганский район', 'г. Туракурган'),
(1714229, 17, 14, 229, NULL, 'Uychi tumani', 'Uychi shaharchasi', 'Уйчи тумани', 'Уйчи шаҳарчаси', 'Уйчинский район', 'гп Уйчи'),
(1714234, 17, 14, 234, NULL, 'Uchqo\'rg\'on tumani', 'Uchqo\'rg\'on sh.', 'Учқўрғон тумани', 'Учқўрғон ш.', 'Учкурганский район', 'г. Учкурган'),
(1714236, 17, 14, 236, NULL, 'Chortoq tumani', 'Chortoq sh.', 'Чортоқ тумани', 'Чортоқ ш.', 'Чартакский район', 'г. Чартак'),
(1714237, 17, 14, 237, NULL, 'Chust tumani', 'Chust sh.', 'Чуст тумани', 'Чуст ш.', 'Чустский район', 'г. Чуст'),
(1714242, 17, 14, 242, NULL, 'Yangiqo\'rg\'on tumani', 'Yangiqo\'rg\'on shaharchasi', 'Янгиқўрғон тумани', 'Янгиқўрғон шаҳарчаси', 'Янгикурганский район', 'гп Янгикурган'),
(1714400, 17, 14, 400, NULL, 'Namangan viloyatining viloyat ahamiyatiga ega shaharlari', NULL, 'Наманган вилоятининг вилоят аҳамиятига эга шаҳарлари', NULL, 'Города областного подчинения Наманганской области', NULL),
(1714401, 17, 14, 401, NULL, 'Namangan', NULL, 'Наманган', NULL, 'Наманган', NULL),
(1718200, 17, 18, 200, NULL, 'Samarqand viloyatinung tumanlari', NULL, 'Самарқанд вилоятинунг туманлари', NULL, 'Районы Самаркандской области', NULL),
(1718203, 17, 18, 203, NULL, 'Oqdaryo tumani', 'Loyish shaharchasi', 'Оқдарё тумани', 'Лойиш шаҳарчаси', 'Акдарьинский район', 'гп Лаиш'),
(1718206, 17, 18, 206, NULL, 'Bulung\'ur tumani', 'Bulung\'ur sh.', 'Булунғур тумани', 'Булунғур ш.', 'Булунгурский район', 'г. Булунгур'),
(1718209, 17, 18, 209, NULL, 'Jomboy tumani', 'Jomboy sh.', 'Жомбой тумани', 'Жомбой ш.', 'Джамбайский район', 'г. Джамбай'),
(1718212, 17, 18, 212, NULL, 'Ishtixon tumani', 'Ishtixon sh.', 'Иштихон тумани', 'Иштихон ш.', 'Иштыханский район', 'г. Иштыхан'),
(1718215, 17, 18, 215, NULL, 'Kattaqo\'rg\'on tumani', 'Payshanba shaharchasi', 'Каттақўрғон тумани', 'Пайшанба шаҳарчаси', 'Каттакурганский район', 'гп Пайшанба'),
(1718216, 17, 18, 216, NULL, 'Qo\'shrabot tumani', 'Qo\'shrabot shaharchasi', 'Қўшработ тумани', 'Қўшработ шаҳарчаси', 'Кошрабадский район', 'гп Кушрабад'),
(1718218, 17, 18, 218, NULL, 'Narpay tumani', 'Oqtosh sh.', 'Нарпай тумани', 'Оқтош ш.', 'Нарпайский район', 'г. Акташ'),
(1718224, 17, 18, 224, NULL, 'Payariq tumani', 'Payariq sh.', 'Паяриқ тумани', 'Паяриқ ш.', 'Пайарыкский район', 'г.Пайаpык'),
(1718227, 17, 18, 227, NULL, 'Pastdarg\'om tumani', 'Juma sh.', 'Пастдарғом тумани', 'Жума ш.', 'Пастдаргомский район', 'г. Джума'),
(1718230, 17, 18, 230, NULL, 'Paxtachi tumani', 'Ziyovuddin shaharchasi', 'Пахтачи тумани', 'Зиёвуддин шаҳарчаси', 'Пахтачийский район', 'гп Зиатдин'),
(1718233, 17, 18, 233, NULL, 'Samarqand tumani', 'Gulobod shaharchasi', 'Самарқанд тумани', 'Гулобод шаҳарчаси', 'Самаркандский район', 'гп Гулабад'),
(1718235, 17, 18, 235, NULL, 'Nurobod tumani', 'Nurobod sh.', 'Нуробод тумани', 'Нуробод ш.', 'Нурабадский район', 'г. Нурабад'),
(1718236, 17, 18, 236, NULL, 'Urgut tumani', 'Urgut sh.', 'Ургут тумани', 'Ургут ш.', 'Ургутский район', 'г. Ургут'),
(1718238, 17, 18, 238, NULL, 'Tayloq tumani', 'Toyloq shaharchasi', 'Тайлоқ тумани', 'Тойлоқ шаҳарчаси', 'Тайлякский район', 'гп Тайлок'),
(1718400, 17, 18, 400, NULL, 'Samarqand viloyatining viloyat ahamiyatiga ega shaharlari', NULL, 'Самарқанд вилоятининг вилоят аҳамиятига эга шаҳарлари', NULL, 'Города областного подчинения Самаркандской области', NULL),
(1718401, 17, 18, 401, NULL, 'Samarqand', NULL, 'Самарқанд', NULL, 'Самарканд', NULL),
(1718406, 17, 18, 406, NULL, 'Kattaqo\'rg\'on', NULL, 'Каттақўрғон', NULL, 'Каттакурган', NULL),
(1722200, 17, 22, 200, NULL, 'Surxondaryo viloyatining tumanlari', NULL, 'Сурхондарё вилоятининг туманлари', NULL, 'Районы Сурхандарьинской области', NULL),
(1722201, 17, 22, 201, NULL, 'Oltinsoy tumani', 'Qorliq shaharchasi', 'Олтинсой тумани', 'Қорлиқ шаҳарчаси', 'Алтынсайский район', 'гп Корлик'),
(1722202, 17, 22, 202, NULL, 'Angor tumani', 'Angor shaharchasi', 'Ангор тумани', 'Ангор шаҳарчаси', 'Ангорский район', 'гп Ангор'),
(1722203, 17, 22, 203, NULL, 'Bandixon tumani', 'Bandixon shaharchasi', 'Бандихон тумани', 'Бандихон шаҳарчаси', 'Бандихонский район', 'гп Бандихон'),
(1722204, 17, 22, 204, NULL, 'Boysun tumani', 'Boysun sh.', 'Бойсун тумани', 'Бойсун ш.', 'Байсунский район', 'г. Байсун'),
(1722207, 17, 22, 207, NULL, 'Muzrabot tumani', 'Xalqobod shaharchasi', 'Музработ тумани', 'Халқобод шаҳарчаси', 'Музрабадский район', 'гп Халкабад'),
(1722210, 17, 22, 210, NULL, 'Denov tumani', 'Denov sh.', 'Денов тумани', 'Денов ш.', 'Денауский район', 'г. Денау'),
(1722212, 17, 22, 212, NULL, 'Jarqo\'rg\'on tumani', 'Jarqo\'rg\'on sh.', 'Жарқўрғон тумани', 'Жарқўрғон ш.', 'Джаркурганский район', 'г. Джаркурган'),
(1722214, 17, 22, 214, NULL, 'Qumqo\'rg\'on tumani', 'Qumqo\'rg\'on sh.', 'Қумқўрғон тумани', 'Қумқўрғон ш.', 'Кумкурганский район', 'г. Кумкурган'),
(1722215, 17, 22, 215, NULL, 'Qiziriq tumani', 'Sariq shaharchasi', 'Қизириқ тумани', 'Сариқ шаҳарчаси', 'Кизирикский район', 'гп Сарик'),
(1722217, 17, 22, 217, NULL, 'Sariosiyo tumani', 'Sariosiyo shaharchasi', 'Сариосиё тумани', 'Сариосиё шаҳарчаси', 'Сариасийский район', 'гп Сариасия'),
(1722220, 17, 22, 220, NULL, 'Termiz tumani', 'Uchqizil shaharchasi', 'Термиз тумани', 'Учқизил шаҳарчаси', 'Термезский район', 'гп Учкизил'),
(1722221, 17, 22, 221, NULL, 'Uzun tumani', 'Uzun shaharchasi', 'Узун тумани', 'Узун шаҳарчаси', 'Узунский район', 'гп Узун'),
(1722223, 17, 22, 223, NULL, 'Sherobod tumani', 'Sherobod sh.', 'Шеробод тумани', 'Шеробод ш.', 'Шерабадский район', 'г. Шерабад'),
(1722226, 17, 22, 226, NULL, 'Sho\'rchi tumani', 'Sho\'rchi sh.', 'Шўрчи тумани', 'Шўрчи ш.', 'Шурчинский район', 'г. Шурчи'),
(1722400, 17, 22, 400, NULL, 'Surxondaryo viloyatining viloyat ahamiyatiga ega shaharlari', NULL, 'Сурхондарё вилоятининг вилоят аҳамиятига эга шаҳарлари', NULL, 'Города областного подч. Сурхандарьинской области', NULL),
(1722401, 17, 22, 401, NULL, 'Termiz', NULL, 'Термиз', NULL, 'Термез', NULL),
(1724200, 17, 24, 200, NULL, 'Sirdaryo viloyatining tumanlari', NULL, 'Сирдарё вилоятининг туманлари', NULL, 'Районы Сырдарьинской области', NULL),
(1724206, 17, 24, 206, NULL, 'Oqoltin tumani', 'Sardoba shaharchasi', 'Оқолтин тумани', 'Сардоба шаҳарчаси', 'Акалтынский район', 'гп Сардоба'),
(1724212, 17, 24, 212, NULL, 'Boyovut tumani', 'Boyovut shaharchasi', 'Боёвут тумани', 'Боёвут шаҳарчаси', 'Баяутский район', 'гп Баяут'),
(1724216, 17, 24, 216, NULL, 'Sayxunobod tumani', 'Sayxun shaharcha', 'Сайхунобод тумани', 'Сайхун шаҳарча', 'Сайхунабадский район', 'гп Сайхун'),
(1724220, 17, 24, 220, NULL, 'Guliston tumani', 'Dehqonobod shaharchasi', 'Гулистон тумани', 'Деҳқонобод шаҳарчаси', 'Гулистанский район', 'гп Дехканабад'),
(1724226, 17, 24, 226, NULL, 'Sardoba tumani', 'Paxtaobod shaharchasi', 'Сардоба тумани', 'Пахтаобод шаҳарчаси', 'Сардобский район', 'гп Пахтаабад'),
(1724228, 17, 24, 228, NULL, 'Mirzaobod tumani', 'Navro\'z shaharchasi', 'Мирзаобод тумани', 'Наврўз шаҳарчаси', 'Мирзаабадский район', 'гп Навруз'),
(1724231, 17, 24, 231, NULL, 'Sirdaryo tumani', 'Sirdaryo sh.', 'Сирдарё тумани', 'Сирдарё ш.', 'Сырдарьинский район', 'г. Сырдарья'),
(1724235, 17, 24, 235, NULL, 'Xovos tumani', 'Xovos shaharchasi', 'Ховос тумани', 'Ховос шаҳарчаси', 'Хавасский район', 'гп Хавас'),
(1724400, 17, 24, 400, NULL, 'Sirdaryo viloyatining viloyat ahamiyatiga ega shaharlari', NULL, 'Сирдарё вилоятининг вилоят аҳамиятига эга шаҳарлари', NULL, 'Города областного подчинения Сырдарьинской области', NULL),
(1724401, 17, 24, 401, NULL, 'Guliston', NULL, 'Гулистон', NULL, 'Гулистан', NULL),
(1724410, 17, 24, 410, NULL, 'Shirin', NULL, 'Ширин', NULL, 'Шиpин', NULL),
(1724413, 17, 24, 413, NULL, 'Yangiyer', NULL, 'Янгиер', NULL, 'Янгиеp', NULL),
(1726260, 17, 26, 260, NULL, 'Toshkent shahrining tumanlari', NULL, 'Тошкент шаҳрининг туманлари', NULL, 'Районы города Ташкента', NULL),
(1726262, 17, 26, 262, NULL, 'Uchtepa tumani', NULL, 'Учтепа тумани', NULL, 'Учтепинский район', NULL),
(1726264, 17, 26, 264, NULL, 'Bektemir tumani', NULL, 'Бектемир тумани', NULL, 'Бектемирский район', NULL),
(1726266, 17, 26, 266, NULL, 'Yunusobod tumani', NULL, 'Юнусобод тумани', NULL, 'Юнусабадский район', NULL),
(1726269, 17, 26, 269, NULL, 'Mirzo Ulug\'bek tumani', NULL, 'Мирзо Улуғбек тумани', NULL, 'Мирзо-Улугбекский район', NULL),
(1726273, 17, 26, 273, NULL, 'Mirobod tumani', NULL, 'Миробод тумани', NULL, 'Мирабадский район', NULL),
(1726277, 17, 26, 277, NULL, 'Shayxontoxur tumani', NULL, 'Шайхонтохур тумани', NULL, 'Шайхантахурский район', NULL),
(1726280, 17, 26, 280, NULL, 'Olmazor tumani', NULL, 'Олмазор тумани', NULL, 'Алмазарский район', NULL),
(1726283, 17, 26, 283, NULL, 'Sirg\'ali tumani', NULL, 'Сирғали тумани', NULL, 'Сергелийский район', NULL),
(1726287, 17, 26, 287, NULL, 'Yakkasaroy tumani', NULL, 'Яккасарой тумани', NULL, 'Яккасарайский район', NULL),
(1726290, 17, 26, 290, NULL, 'Yashnobod tumani', NULL, 'Яшнобод тумани', NULL, 'Яшнободский район', NULL),
(1726292, 17, 26, 292, NULL, 'Yangihayot tumani', NULL, 'Янгиҳаёт тумани', NULL, 'Янгихаётский район', NULL),
(1726294, 17, 26, 294, NULL, 'Chilonzor tumani', NULL, 'Чилонзор тумани', NULL, 'Чиланзарский район', NULL),
(1727200, 17, 27, 200, NULL, 'Toshkent viloyatining tumanlari', NULL, 'Тошкент вилоятининг туманлари', NULL, 'Районы Ташкентской области', NULL),
(1727206, 17, 27, 206, NULL, 'Oqqo\'rg\'on tumani', 'Oqqo\'rg\'on sh.', 'Оққўрғон тумани', 'Оққўрғон ш.', 'Аккурганский район', 'г. Аккурган'),
(1727212, 17, 27, 212, NULL, 'Ohangaron tumani', 'Ohangaron sh.', 'Оҳангарон тумани', 'Оҳангарон ш.', 'Ахангаранский район', 'г. Ахангаран'),
(1727220, 17, 27, 220, NULL, 'Bekobod tumani', 'Zafar shaharchasi', 'Бекобод тумани', 'Зафар шаҳарчаси', 'Бекабадский район', 'гп Зафар'),
(1727224, 17, 27, 224, NULL, 'Bo\'stonliq tumani', 'G\'azalkent sh.', 'Бўстонлиқ тумани', 'Ғазалкент ш.', 'Бостанлыкский район', 'г. Газалкент'),
(1727228, 17, 27, 228, NULL, 'Bo\'ka tumani', 'Bo\'ka sh.', 'Бўка тумани', 'Бўка ш.', 'Букинский район', 'г. Бука'),
(1727233, 17, 27, 233, NULL, 'Quyichirchiq tumani', 'Do\'stobod sh.', 'Қуйичирчиқ тумани', 'Дўстобод ш.', 'Куйичирчикский район', 'г. Дустобод'),
(1727237, 17, 27, 237, NULL, 'Zangiota tumani', 'Eshonguzar shaharchasi', 'Зангиота тумани', 'Эшонгузар шаҳарчаси ', 'Зангиатинский район', 'гп Эшангузар'),
(1727239, 17, 27, 239, NULL, 'Yuqorichirchiq tumani', 'Yangibozor shaharchasi', 'Юқоричирчиқ тумани', 'Янгибозор шаҳарчаси', 'Юкоричирчикский район', 'гп Янгибазар'),
(1727248, 17, 27, 248, NULL, 'Qibray tumani', 'Qibray shaharchasi', 'Қибрай тумани', 'Қибрай шаҳарчаси', 'Кибрайский район', 'гп Кибрай'),
(1727249, 17, 27, 249, NULL, 'Parkent tumani', 'Parkent sh.', 'Паркент тумани', 'Паркент ш.', 'Паркентский район', 'г. Паркент'),
(1727250, 17, 27, 250, NULL, 'Pskent tumani', 'Pskent sh.', 'Пскент тумани', 'Пскент ш.', 'Пскентский район', 'г. Пскент'),
(1727253, 17, 27, 253, NULL, 'O\'rtachirchiq tumani', 'Nurafshon sh.', 'Ўртачирчиқ тумани', 'Нурафшон ш.', 'Уртачирчикский район', 'г. Нурафшон'),
(1727256, 17, 27, 256, NULL, 'Chinoz tumani', 'Chinoz sh.', 'Чиноз тумани', 'Чиноз ш.', 'Чиназский район', 'г. Чиназ'),
(1727259, 17, 27, 259, NULL, 'Yangiyo\'l tumani', 'Yangiyo\'l sh.', 'Янгийўл тумани', 'Янгийўл ш.', 'Янгиюльский район', 'г.Янгиюль'),
(1727265, 17, 27, 265, NULL, 'Toshkent tumani', 'Keles sh.', 'Тошкент тумани', 'Келес ш.', 'Ташкентский район', 'г.Келес'),
(1727400, 17, 27, 400, NULL, 'Toshkent viloyatining viloyat ahamiyatiga ega shaharlari', NULL, 'Тошкент вилоятининг вилоят аҳамиятига эга шаҳарлари', NULL, 'Города областного подчинения Ташкентской области', NULL),
(1727401, 17, 27, 401, NULL, 'Nurafshon', NULL, 'Нурафшон', NULL, 'Нурафшон', NULL),
(1727404, 17, 27, 404, NULL, 'Olmaliq', NULL, 'Олмалиқ', NULL, 'Алмалык', NULL),
(1727407, 17, 27, 407, NULL, 'Angren', NULL, 'Ангрен', NULL, 'Ангрен', NULL),
(1727413, 17, 27, 413, NULL, 'Bekobod', NULL, 'Бекобод', NULL, 'Бекабад', NULL),
(1727415, 17, 27, 415, NULL, 'Ohangaron', NULL, 'Оҳангарон', NULL, 'Ахангаран', NULL),
(1727419, 17, 27, 419, NULL, 'Chirchiq', NULL, 'Чирчиқ', NULL, 'Чиpчик', NULL),
(1727424, 17, 27, 424, NULL, 'Yangiyo\'l', NULL, 'Янгийўл', NULL, 'Янгиюль', NULL),
(1730200, 17, 30, 200, NULL, 'Farg\'ona viloyatining tumanlari', NULL, 'Фарғона вилоятининг туманлари', NULL, 'Районы Ферганской области', NULL),
(1730203, 17, 30, 203, NULL, 'Oltiariq tumani', 'Oltiariq shaharchasi', 'Олтиариқ тумани', 'Олтиариқ шаҳарчаси', 'Алтыарыкский район', 'гп Алтыарык'),
(1730206, 17, 30, 206, NULL, 'Qo\'shtepa tumani', 'Langar a.p.', 'Қўштепа тумани', 'Лангар а.п.', 'Куштепинский район', 'нп Лангар'),
(1730209, 17, 30, 209, NULL, 'Bog\'dod tumani', 'Bog\'dod shaharchasi', 'Боғдод тумани', 'Боғдод шаҳарчаси', 'Багдадский район', 'гп Багдад'),
(1730212, 17, 30, 212, NULL, 'Buvayda tumani', 'Ibrat shaharchasi', 'Бувайда тумани', 'Ибрат шаҳарчаси', 'Бувайдинский район', 'гп Ибрат'),
(1730215, 17, 30, 215, NULL, 'Beshariq tumani', 'Beshariq sh.', 'Бешариқ тумани', 'Бешариқ ш.', 'Бешарыкский район', 'г. Бешарык'),
(1730218, 17, 30, 218, NULL, 'Quva tumani', 'Quva sh.', 'Қува тумани', 'Қува ш.', 'Кувинский район', 'г. Кува'),
(1730221, 17, 30, 221, NULL, 'Uchko\'prik tumani', 'Uchko\'prik shaharchasi', 'Учкўприк тумани', 'Учкўприк шаҳарчаси', 'Учкуприкский район', 'гп Учкуприк'),
(1730224, 17, 30, 224, NULL, 'Rishton tumani', 'Rishton sh.', 'Риштон тумани', 'Риштон ш.', 'Риштанский район', 'г. Риштан'),
(1730226, 17, 30, 226, NULL, 'So\'x tumani', 'Ravon shaharchasi', 'Сўх тумани', 'Равон шаҳарчаси', 'Сохский район', 'гп Равон'),
(1730227, 17, 30, 227, NULL, 'Toshloq tumani', 'Toshloq shaharchasi', 'Тошлоқ тумани', 'Тошлоқ шаҳарчаси', 'Ташлакский район', 'гп Ташлак'),
(1730230, 17, 30, 230, NULL, 'O\'zbekiston tumani', 'Yaypan sh.', 'Ўзбекистон тумани', 'Яйпан ш.', 'Узбекистанский район', 'г. Яйпан'),
(1730233, 17, 30, 233, NULL, 'Farg\'ona tumani', 'Chimyon shaharchasi', 'Фарғона тумани', 'Чимён шаҳарчаси', 'Ферганский район', 'гп Чимен'),
(1730236, 17, 30, 236, NULL, 'Dang\'ara tumani', 'Dang\'ara shaharchasi', 'Данғара тумани', 'Данғара шаҳарчаси', 'Дангаринский район', 'гп Дангара'),
(1730238, 17, 30, 238, NULL, 'Furqat tumani', 'Navbahor shaharchasi', 'Фурқат тумани', 'Навбаҳор шаҳарчаси', 'Фуркатский район', 'гп Навбахор'),
(1730242, 17, 30, 242, NULL, 'Yozyovon tumani', 'Yozyovon shaharchasi', 'Ёзёвон тумани', 'Ёзёвон шаҳарчаси', 'Язъяванский район', 'гп Язъяван'),
(1730400, 17, 30, 400, NULL, 'Farg\'ona viloyatining viloyat ahamiyatiga ega shaharlari', NULL, 'Фарғона вилоятининг вилоят аҳамиятига эга шаҳарлари', NULL, 'Города областного подчинения Ферганской области', NULL),
(1730401, 17, 30, 401, NULL, 'Farg\'ona', NULL, 'Фарғона', NULL, 'Фергана', NULL),
(1730405, 17, 30, 405, NULL, 'Qo\'qon', NULL, 'Қўқон', NULL, 'Коканд', NULL),
(1730408, 17, 30, 408, NULL, 'Quvasoy', NULL, 'Қувасой', NULL, 'Кувасай', NULL),
(1730412, 17, 30, 412, NULL, 'Marg\'ilon', NULL, 'Марғилон', NULL, 'Маpгилан', NULL),
(1733200, 17, 33, 200, NULL, 'Xorazm viloyatining tumanlari', NULL, 'Хоразм вилоятининг туманлари', NULL, 'Районы Хорезмской области', NULL),
(1733204, 17, 33, 204, NULL, 'Bog\'ot tumani', 'Bog\'ot shaharchasi', 'Боғот тумани', 'Боғот шаҳарчаси', 'Багатский район', 'гп Багат'),
(1733208, 17, 33, 208, NULL, 'Gurlan tumani', 'Gurlan shaharchasi', 'Гурлан тумани', 'Гурлан шаҳарчаси', 'Гурленский район', 'гп Гурлен'),
(1733212, 17, 33, 212, NULL, 'Qo\'shko\'pir tumani', 'Qo\'shko\'pir shaharchasi', 'Қўшкўпир тумани', 'Қўшкўпир шаҳарчаси', 'Кошкупырский район', 'гп Кошкупыр'),
(1733217, 17, 33, 217, NULL, 'Urganch tumani', 'Qoroul a.p.', 'Урганч тумани', 'Қороул а.п.', 'Ургенчский район', 'нп Караул'),
(1733220, 17, 33, 220, NULL, 'Xazorasp tumani', 'Xazorasp shaharchasi', 'Хазорасп тумани', 'Хазорасп шаҳарчаси', 'Хазараспский район', 'гп Хазарасп'),
(1733221, 17, 33, 221, NULL, 'Tuproqqal\'a tumani', 'Pitnak shahri', 'Тупроққалъа тумани', 'Питнак шаҳри', 'Тупроккалинский район', 'г. Питнак'),
(1733223, 17, 33, 223, NULL, 'Xonqa tumani', 'Xonqa shaharchasi', 'Хонқа тумани', 'Хонқа шаҳарчаси', 'Ханкинский район', 'гп Ханка'),
(1733226, 17, 33, 226, NULL, 'Xiva tumani', 'Xiva sh.', 'Хива тумани', 'Хива ш.', 'Хивинский район', 'г. Хива'),
(1733230, 17, 33, 230, NULL, 'Shovot tumani', 'Shovot shaharchasi', 'Шовот тумани', 'Шовот шаҳарчаси', 'Шаватский район', 'гп Шават'),
(1733233, 17, 33, 233, NULL, 'Yangiariq tumani', 'Yangiariq shaharchasi', 'Янгиариқ тумани', 'Янгиариқ шаҳарчаси', 'Янгиарыкский район', 'гп Янгиарык'),
(1733236, 17, 33, 236, NULL, 'Yangibozor tumani', 'Yangibozor shaharchasi', 'Янгибозор тумани', 'Янгибозор шаҳарчаси', 'Янгибазарский район', 'гп Янгибазар'),
(1733400, 17, 33, 400, NULL, 'Xorazm viloyatining viloyat ahamiyatiga ega shaharlari', NULL, 'Хоразм вилоятининг вилоят аҳамиятига эга шаҳарлари', NULL, 'Города областного подчинения Хорезмской области', NULL),
(1733401, 17, 33, 401, NULL, 'Urganch', NULL, 'Урганч', NULL, 'Ургенч', NULL),
(1733406, 17, 33, 406, NULL, 'Xiva', NULL, 'Хива', NULL, 'Хива', NULL),
(1735200, 17, 35, 200, NULL, 'Qoraqalpog\'iston Respublikasining tumanlari', NULL, 'Қорақалпоғистон Республикасининг туманлари', NULL, 'Районы Республики Каракалпакстан', NULL),
(1735204, 17, 35, 204, NULL, 'Amudaryo tumani', 'Mang\'it sh.', 'Амударё тумани', 'Манғит ш.', 'Амударьинский район', 'г. Мангит'),
(1735207, 17, 35, 207, NULL, 'Beruniy tumani', 'Beruniy sh.', 'Беруний тумани', 'Беруний ш.', 'Берунийский район', 'г. Беруни'),
(1735209, 17, 35, 209, NULL, 'Bo\'zatov tumani', 'Bo\'zatov shaharchasi', 'Бўзатов тумани', 'Бўзатов шаҳарчаси', 'Бозатауский район', 'гп Бозатау'),
(1735211, 17, 35, 211, NULL, 'Qorao\'zak tumani', 'Qorao\'zak shaharchasi', 'Қораўзак тумани', 'Қораўзак шаҳарчаси', 'Караузякский район', 'гп Караузяк'),
(1735212, 17, 35, 212, NULL, 'Kegeyli tumani', 'Kegeyli shaharchasi', 'Кегейли тумани', 'Кегейли шаҳарчаси', 'Кегейлийский район', 'гп Кегейли'),
(1735215, 17, 35, 215, NULL, 'Qo\'ng\'irot tumani', 'Qo\'ng\'irot sh.', 'Қўнғирот тумани', 'Қўнғирот ш.', 'Кунградский район', 'г. Кунград'),
(1735218, 17, 35, 218, NULL, 'Qanliko\'l tumani', 'Qanliko\'l shaharchasi', 'Қанликўл тумани', 'Қанликўл шаҳарчаси', 'Канлыкульский район', 'гп Канлыкуль'),
(1735222, 17, 35, 222, NULL, 'Mo\'ynoq tumani', 'Mo\'ynoq sh.', 'Мўйноқ тумани', 'Мўйноқ ш.', 'Муйнакский район', 'г. Муйнак'),
(1735225, 17, 35, 225, NULL, 'Nukus tumani', 'Oqmang\'it shaharchasi', 'Нукус тумани', 'Оқманғит шаҳарчаси', 'Нукусский район', 'гп Акмангит'),
(1735228, 17, 35, 228, NULL, 'Taxiatosh tumani', 'Taxiatosh sh.', 'Тахиатош тумани', 'Тахиатош ш.', 'Тахиаташский район', 'г.Тахиаташ'),
(1735230, 17, 35, 230, NULL, 'Taxtako\'pir tumani', 'Taxtako\'pir shaharchasi', 'Тахтакўпир тумани', 'Тахтакўпир шаҳарчаси', 'Тахтакупырский район', 'гп Тахтакупыр'),
(1735233, 17, 35, 233, NULL, 'To\'rtko\'l tumani', 'To\'rtko\'l sh.', 'Тўрткўл тумани', 'Тўрткўл ш.', 'Турткульский район', 'г. Турткуль'),
(1735236, 17, 35, 236, NULL, 'Xo\'jayli tumani', 'Xo\'jayli sh.', 'Хўжайли тумани', 'Хўжайли ш.', 'Ходжейлийский район', 'г. Ходжейли'),
(1735240, 17, 35, 240, NULL, 'Chimboy tumani', 'Chimboy sh.', 'Чимбой тумани', 'Чимбой ш.', 'Чимбайский район', 'г. Чимбай'),
(1735243, 17, 35, 243, NULL, 'Shumanay tumani', 'Shumanay sh.', 'Шуманай тумани', 'Шуманай ш.', 'Шуманайский район', 'г. Шуманай'),
(1735250, 17, 35, 250, NULL, 'Ellikkala tumani', 'Bo\'ston sh.', 'Элликкала тумани', 'Бўстон ш.', 'Элликкалинский район', 'г. Бустан'),
(1735400, 17, 35, 400, NULL, 'Qoraqalpog\'iston Respublikasi ahamiyatiga ega shaharlar', NULL, 'Қорақалпоғистон Республикаси аҳамиятига эга шаҳарлар', NULL, 'Гоpода pеспуб-го подч. Республики Каpакалпакстан', NULL),
(1735401, 17, 35, 401, NULL, 'Nukus', NULL, 'Нукус', NULL, 'Нукус', NULL),
(1703202550, 17, 3, 202, 550, 'Oltinko\'l tumanining shaharchalari', NULL, 'Олтинкўл туманининг шаҳарчалари', NULL, 'Городские поселки Алтынкульского района', NULL),
(1703202552, 17, 3, 202, 552, 'Bo\'ston', NULL, 'Бўстон', NULL, 'Бустон', NULL),
(1703202554, 17, 3, 202, 554, 'Dalvarzin', NULL, 'Далварзин', NULL, 'Далварзин', NULL),
(1703202556, 17, 3, 202, 556, 'Jalabek', NULL, 'Жалабек', NULL, 'Жалабек', NULL),
(1703202558, 17, 3, 202, 558, 'Ijtimoiyat', NULL, 'Ижтимоият', NULL, 'Ижтимоият', NULL),
(1703202562, 17, 3, 202, 562, 'Kumakay', NULL, 'Кумакай', NULL, 'Кумакай', NULL),
(1703202564, 17, 3, 202, 564, 'Qo\'shtepa', NULL, 'Қўштепа', NULL, 'Куштепа', NULL),
(1703202566, 17, 3, 202, 566, 'Madaniy mehnat', NULL, 'Маданий меҳнат', NULL, 'Маданий мехнат', NULL),
(1703202568, 17, 3, 202, 568, 'Markaz', NULL, 'Марказ', NULL, 'Марказ', NULL),
(1703202572, 17, 3, 202, 572, 'Maslahat', NULL, 'Маслаҳат', NULL, 'Маслахат', NULL),
(1703202574, 17, 3, 202, 574, 'Namuna', NULL, 'Намуна', NULL, 'Намуна', NULL),
(1703202576, 17, 3, 202, 576, 'Xondibog\'i', NULL, 'Хондибоғи', NULL, 'Хондибоги', NULL),
(1703202800, 17, 3, 202, 800, 'Oltinko\'l tumanining qishloq fuqarolar yig\'inlari', NULL, 'Олтинкўл туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Алтынкульского района', NULL),
(1703202804, 17, 3, 202, 804, 'Oltinko\'l', NULL, 'Олтинкўл', NULL, 'Алтынкуль', NULL),
(1703202807, 17, 3, 202, 807, 'Oxunboboyev nomli', NULL, 'Охунбобоев номли', NULL, 'им. Ахунбабаева', NULL),
(1703202813, 17, 3, 202, 813, 'Jalabek', NULL, 'Жалабек', NULL, 'Джалабек', NULL),
(1703202820, 17, 3, 202, 820, 'Qo\'shtepasaroy', NULL, 'Қўштепасарой', NULL, 'Коштепасарай', NULL),
(1703202825, 17, 3, 202, 825, 'Kumakay', NULL, 'Кумакай', NULL, 'Кумакай', NULL),
(1703202830, 17, 3, 202, 830, 'Maslahat', NULL, 'Маслаҳат', NULL, 'Маслахат', NULL),
(1703202834, 17, 3, 202, 834, 'Oraziy', NULL, 'Оразий', NULL, 'им. Орази', NULL),
(1703202840, 17, 3, 202, 840, 'Suvyulduz', NULL, 'Сувюлдуз', NULL, 'Сувюлдуз', NULL),
(1703203550, 17, 3, 203, 550, 'Andijon tumanining shaharchalari', NULL, 'Андижон туманининг шаҳарчалари', NULL, 'Городские поселки Андижанского района', NULL),
(1703203551, 17, 3, 203, 551, 'Kuyganyor', NULL, 'Куйганёр', NULL, 'Куйган - яр', NULL),
(1703203553, 17, 3, 203, 553, 'Ayrilish', NULL, 'Айрилиш', NULL, 'Айрилиш', NULL),
(1703203555, 17, 3, 203, 555, 'Butaqora', NULL, 'Бутақора', NULL, 'Бутакора', NULL),
(1703203557, 17, 3, 203, 557, 'Guliston', NULL, 'Гулистон', NULL, 'Гулистон', NULL),
(1703203559, 17, 3, 203, 559, 'Gumbaz', NULL, 'Гумбаз', NULL, 'Гумбаз', NULL),
(1703203561, 17, 3, 203, 561, 'Zavroq', NULL, 'Завроқ', NULL, 'Заврок', NULL),
(1703203563, 17, 3, 203, 563, 'Qoraqalpoq', NULL, 'Қорақалпоқ', NULL, 'Каракалпак', NULL),
(1703203567, 17, 3, 203, 567, 'Kunji', NULL, 'Кунжи', NULL, 'Кунжи', NULL),
(1703203569, 17, 3, 203, 569, 'Qo\'shariq', NULL, 'Қўшариқ', NULL, 'Кушарик', NULL),
(1703203571, 17, 3, 203, 571, 'Namuna', NULL, 'Намуна', NULL, 'Намуна', NULL),
(1703203573, 17, 3, 203, 573, 'Og\'ullik', NULL, 'Оғуллик', NULL, 'Огуллик', NULL),
(1703203575, 17, 3, 203, 575, 'Oq-yor', NULL, 'Оқ-ёр', NULL, 'Ок-ер', NULL),
(1703203577, 17, 3, 203, 577, 'Rovvot', NULL, 'Роввот', NULL, 'Роввот', NULL),
(1703203579, 17, 3, 203, 579, 'Xartum', NULL, 'Хартум', NULL, 'Хартум', NULL),
(1703203581, 17, 3, 203, 581, 'Chilon', NULL, 'Чилон', NULL, 'Чилон', NULL),
(1703203583, 17, 3, 203, 583, 'Chumbog\'ich', NULL, 'Чумбоғич', NULL, 'Чумбогич', NULL),
(1703203585, 17, 3, 203, 585, 'Ekin tikin', NULL, 'Экин тикин', NULL, 'Экин-тикин', NULL),
(1703203587, 17, 3, 203, 587, 'Yangiobod', NULL, 'Янгиобод', NULL, 'Янгиабад', NULL),
(1703203589, 17, 3, 203, 589, 'Gulobod', NULL, 'Гулобод', NULL, 'Гулобод', NULL),
(1703203800, 17, 3, 203, 800, 'Andijon tumanining qishloq fuqarolar yig\'inlari', NULL, 'Андижон туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Андижанского района', NULL),
(1703203803, 17, 3, 203, 803, 'Oq-Yor', NULL, 'Оқ-Ёр', NULL, 'Ак-яр', NULL),
(1703203813, 17, 3, 203, 813, 'Bo\'taqora', NULL, 'Бўтақора', NULL, 'Бутакара', NULL),
(1703203829, 17, 3, 203, 829, 'Qo\'nji', NULL, 'Қўнжи', NULL, 'Кунджи', NULL),
(1703203838, 17, 3, 203, 838, 'Nayman', NULL, 'Найман', NULL, 'Найман', NULL),
(1703203849, 17, 3, 203, 849, 'Xakan', NULL, 'Хакан', NULL, 'Хакан', NULL),
(1703203863, 17, 3, 203, 863, 'Xrabek', NULL, 'Храбек', NULL, 'Хирабек', NULL),
(1703203866, 17, 3, 203, 866, 'Xartum', NULL, 'Хартум', NULL, 'Хартум', NULL),
(1703203874, 17, 3, 203, 874, 'Orol', NULL, 'Орол', NULL, 'Аpал', NULL),
(1703203885, 17, 3, 203, 885, 'Yorboshi', NULL, 'Ёрбоши', NULL, 'Ярбаши', NULL),
(1703206550, 17, 3, 206, 550, 'Baliqchi tumanining shaharchalari', NULL, 'Балиқчи туманининг шаҳарчалари', NULL, 'Городские поселки Балыкчинского района', NULL),
(1703206551, 17, 3, 206, 551, 'Baliqchi', NULL, 'Балиқчи', NULL, 'Баликчи', NULL),
(1703206554, 17, 3, 206, 554, 'Xo\'jaobod', NULL, 'Хўжаобод', NULL, 'Хужаабад', NULL),
(1703206558, 17, 3, 206, 558, 'Chinobod markaz', NULL, 'Чинобод марказ', NULL, 'Чинобод марказ', NULL),
(1703206800, 17, 3, 206, 800, 'Baliqchi tumanining qishloq fuqarolar yig\'inlari', NULL, 'Балиқчи туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Балыкчинского района', NULL),
(1703206803, 17, 3, 206, 803, 'Olimbek', NULL, 'Олимбек', NULL, 'Алимбек', NULL),
(1703206807, 17, 3, 206, 807, 'Oxunboboyev nomli', NULL, 'Охунбобоев номли', NULL, 'им. Ахунбабаева', NULL),
(1703206813, 17, 3, 206, 813, 'Baliqchi', NULL, 'Балиқчи', NULL, 'Балыкчи', NULL),
(1703206824, 17, 3, 206, 824, 'Guliston', NULL, 'Гулистон', NULL, 'Гулистан', NULL),
(1703206831, 17, 3, 206, 831, 'Bo\'ston', NULL, 'Бўстон', NULL, 'Бустан', NULL),
(1703206846, 17, 3, 206, 846, 'Siza', NULL, 'Сиза', NULL, 'Сиза', NULL),
(1703206857, 17, 3, 206, 857, 'O\'rmonbek', NULL, 'Ўрмонбек', NULL, 'Урманбек', NULL),
(1703206868, 17, 3, 206, 868, 'Xo\'jaobod', NULL, 'Хўжаобод', NULL, 'Ходжаабад', NULL),
(1703206879, 17, 3, 206, 879, 'Eskixaqqulobod', NULL, 'Эскихаққулобод', NULL, 'Эски Хаккулабад', NULL),
(1703209550, 17, 3, 209, 550, 'Bo\'ston tumanining shaharchalari', NULL, 'Бўстон туманининг шаҳарчалари', NULL, 'Городские поселки Бустонского района', NULL),
(1703209551, 17, 3, 209, 551, 'Bo\'z', NULL, 'Бўз', NULL, 'Боз', NULL),
(1703209555, 17, 3, 209, 555, 'M.Jalolov nomli', NULL, 'М.Жалолов номли', NULL, 'М.Жалолов', NULL),
(1703209559, 17, 3, 209, 559, 'Xoldevonbek', NULL, 'Холдевонбек', NULL, 'Холдевонбек', NULL),
(1703209800, 17, 3, 209, 800, 'Bo\'ston tumanining qishloq fuqarolar yig\'inlari', NULL, 'Бўстон туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Бустонского района', NULL),
(1703209811, 17, 3, 209, 811, 'Xoldevonbek', NULL, 'Холдевонбек', NULL, 'Халдеванбек', NULL),
(1703209846, 17, 3, 209, 846, 'M.Jalolov nomli', NULL, 'М.Жалолов номли', NULL, 'им. М. Джалалова', NULL),
(1703209857, 17, 3, 209, 857, 'Xovos', NULL, 'Ховос', NULL, 'Хавас', NULL),
(1703210550, 17, 3, 210, 550, 'Buloqboshi tumanining shaharchalari', NULL, 'Булоқбоши  туманининг шаҳарчалари', NULL, 'Городские поселки Булакбашинского района', NULL),
(1703210551, 17, 3, 210, 551, 'Buloqboshi', NULL, 'Булоқбоши', NULL, 'Булокбоши', NULL),
(1703210554, 17, 3, 210, 554, 'Andijon', NULL, 'Андижон', NULL, 'Андижан', NULL),
(1703210561, 17, 3, 210, 561, 'Uchtepa', NULL, 'Учтепа', NULL, 'Учтепа', NULL),
(1703210564, 17, 3, 210, 564, 'Shirmonbuloq', NULL, 'Ширмонбулоқ', NULL, 'Ширмонбулок', NULL),
(1703210800, 17, 3, 210, 800, 'Buloqboshi tumanining qishloq fuqarolar yig\'inlari', NULL, 'Булоқбоши туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Булакбашинского района', NULL),
(1703210812, 17, 3, 210, 812, 'Buloqboshi', NULL, 'Булоқбоши', NULL, 'Булакбаши', NULL),
(1703210832, 17, 3, 210, 832, 'Kulla', NULL, 'Кулла', NULL, 'Кулла', NULL),
(1703210838, 17, 3, 210, 838, 'Mayariq', NULL, 'Маяриқ', NULL, 'Майарык', NULL),
(1703210850, 17, 3, 210, 850, 'Nayman', NULL, 'Найман', NULL, 'Найман', NULL),
(1703210894, 17, 3, 210, 894, 'Shirmonbuloq', NULL, 'Ширмонбулоқ', NULL, 'Ширманбулак', NULL),
(1703211500, 17, 3, 211, 500, 'Jalaquduq tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Жалақудуқ туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подч. Жалакудукского района', NULL),
(1703211501, 17, 3, 211, 501, 'Jalaquduq', NULL, 'Жалақудуқ', NULL, 'Жалакудук', NULL),
(1703211550, 17, 3, 211, 550, 'Jalaquduq tumanining shaharchalari', NULL, 'Жалақудуқ туманининг шаҳарчалари', NULL, 'Городские поселки Жалакудукского района', NULL),
(1703211554, 17, 3, 211, 554, 'Janubiy olamushuk', NULL, 'Жанубий оламушук', NULL, 'Южный Аламышик', NULL),
(1703211556, 17, 3, 211, 556, 'Beshtol', NULL, 'Бештол', NULL, 'Бештол', NULL),
(1703211558, 17, 3, 211, 558, 'Yorqishloq', NULL, 'Ёрқишлоқ', NULL, 'Еркишлок', NULL),
(1703211562, 17, 3, 211, 562, 'Jalaquduq', NULL, 'Жалақудуқ', NULL, 'Жалакудук', NULL),
(1703211564, 17, 3, 211, 564, 'Ko\'kalam', NULL, 'Кўкалам', NULL, 'Кукалам', NULL),
(1703211566, 17, 3, 211, 566, 'Qo\'shtepa', NULL, 'қўштепа', NULL, 'Куштепа', NULL),
(1703211568, 17, 3, 211, 568, 'Oyim', NULL, 'Ойим', NULL, 'Ойим', NULL),
(1703211800, 17, 3, 211, 800, 'Jalaquduq tumanining qishloq fuqarolar yig\'inlari', NULL, 'Жалақудуқ туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Жалакудукского района', NULL),
(1703211804, 17, 3, 211, 804, 'Abdullabiy', NULL, 'Абдуллабий', NULL, 'Абдуллабий', NULL),
(1703211807, 17, 3, 211, 807, 'Oyim', NULL, 'Ойим', NULL, 'Аим', NULL),
(1703211814, 17, 3, 211, 814, 'Beshtal', NULL, 'Бештал', NULL, 'Бештал', NULL),
(1703211818, 17, 3, 211, 818, 'Jalolquduq', NULL, 'Жалолқудуқ', NULL, 'Джалалкудук', NULL),
(1703211824, 17, 3, 211, 824, 'Qatortol', NULL, 'Қатортол', NULL, 'Катартал', NULL),
(1703211830, 17, 3, 211, 830, 'Guliston', NULL, 'Гулистон', NULL, 'Гулистан', NULL),
(1703211834, 17, 3, 211, 834, 'Teshiktosh', NULL, 'Тешиктош', NULL, 'Тешикташ', NULL),
(1703211841, 17, 3, 211, 841, 'Yorqishloq', NULL, 'Ёрқишлоқ', NULL, 'Яркишлак', NULL),
(1703214500, 17, 3, 214, 500, 'Izboskan tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Избоскан туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Избасканского района', NULL),
(1703214501, 17, 3, 214, 501, 'Paytug', NULL, 'Пайтуг', NULL, 'Пайтуг', NULL),
(1703214550, 17, 3, 214, 550, 'Izboskan tumanining shaharchalari', NULL, 'Избоскан туманининг  шаҳарчалари', NULL, 'Городские поселки Избасканского района', NULL),
(1703214553, 17, 3, 214, 553, 'Gurkirov', NULL, 'Гуркиров', NULL, 'Гуркиров', NULL),
(1703214556, 17, 3, 214, 556, 'Maygir', NULL, 'Майгир', NULL, 'Майгир', NULL),
(1703214559, 17, 3, 214, 559, 'To\'rtko\'l', NULL, 'Тўрткўл', NULL, 'Турткул', NULL),
(1703214563, 17, 3, 214, 563, 'Uzun ko\'cha', NULL, 'Узун кўча', NULL, 'Узун куча', NULL),
(1703214800, 17, 3, 214, 800, 'Izboskan tumanining qishloq fuqarolar yig\'inlari', NULL, 'Избоскан  туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Избасканского района', NULL),
(1703214811, 17, 3, 214, 811, 'Izboskan', NULL, 'Избоскан', NULL, 'Избаскан', NULL),
(1703214822, 17, 3, 214, 822, 'Maygir', NULL, 'Майгир', NULL, 'Майгир', NULL),
(1703214833, 17, 3, 214, 833, 'Namuna', NULL, 'Намуна', NULL, 'Намуна', NULL),
(1703214844, 17, 3, 214, 844, 'O\'rtoqlar', NULL, 'Ўртоқлар', NULL, 'Уртаклар', NULL),
(1703214855, 17, 3, 214, 855, 'Shermatobod', NULL, 'Шерматобод', NULL, 'Шерматабад', NULL),
(1703214860, 17, 3, 214, 860, 'Erkin', NULL, 'Эркин', NULL, 'Эркин', NULL),
(1703214866, 17, 3, 214, 866, 'Yangizamon', NULL, 'Янгизамон', NULL, 'Янгизамон', NULL),
(1703214877, 17, 3, 214, 877, 'Yangi qishloq', NULL, 'Янги қишлоқ', NULL, 'Янгикишлак', NULL),
(1703214885, 17, 3, 214, 885, 'Yakkatut', NULL, 'Яккатут', NULL, 'Яккатут', NULL),
(1703217550, 17, 3, 217, 550, 'Ulug\'nor tumanining shaharchalari', NULL, 'Улуғнор  туманининг  шаҳарчалари', NULL, 'Городские поселки Улугнарского района', NULL),
(1703217551, 17, 3, 217, 551, 'Oq oltin', NULL, 'Оқ олтин', NULL, 'Ок-олтин', NULL),
(1703217800, 17, 3, 217, 800, 'Ulug\'nor tumanining qishloq fuqarolar yig\'inlari', NULL, 'Улуғнор  туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Улугноpского района', NULL),
(1703217810, 17, 3, 217, 810, 'Oq oltin', NULL, 'Оқ олтин', NULL, 'Акалтын', NULL),
(1703217815, 17, 3, 217, 815, 'Mingchinor', NULL, 'Мингчинор', NULL, 'Мингчинаp', NULL),
(1703217820, 17, 3, 217, 820, 'Mingbuloq', NULL, 'Мингбулоқ', NULL, 'Мингбулак', NULL),
(1703217830, 17, 3, 217, 830, 'Navoiy nomli', NULL, 'Навоий номли', NULL, 'им. Навои', NULL),
(1703220500, 17, 3, 220, 500, 'Qo\'rg\'ontepa tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Қўрғонтепа туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подч. Кургантепинского района', NULL),
(1703220501, 17, 3, 220, 501, 'Qo\'rg\'ontepa', NULL, 'Қўрғонтепа', NULL, 'Кургантепа', NULL),
(1703220505, 17, 3, 220, 505, 'Qorasuv', NULL, 'Қорасув', NULL, 'Карасу', NULL),
(1703220550, 17, 3, 220, 550, 'Qo\'rg\'ontepa tumanining shaharchalari', NULL, 'Қўрғонтепа туманининг  шаҳарчалари', NULL, 'Городские поселки Кургантепинского района', NULL),
(1703220553, 17, 3, 220, 553, 'Sultonobod', NULL, 'Султонобод', NULL, 'Султонабад', NULL),
(1703220800, 17, 3, 220, 800, 'Qo\'rg\'ontepa tumanining qishloq fuqarolar yig\'inlari', NULL, 'Қўрғонтепа  туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Кургантепинского района', NULL),
(1703220813, 17, 3, 220, 813, 'Dardok', NULL, 'Дардок', NULL, 'Дардак', NULL),
(1703220836, 17, 3, 220, 836, 'Qo\'rg\'ontepa', NULL, 'Қўрғонтепа', NULL, 'Кургантепа', NULL),
(1703220847, 17, 3, 220, 847, 'Savay', NULL, 'Савай', NULL, 'Савай', NULL),
(1703220858, 17, 3, 220, 858, 'Sultonobod', NULL, 'Султонобод', NULL, 'Султанабад', NULL),
(1703220872, 17, 3, 220, 872, 'Chimyon', NULL, 'Чимён', NULL, 'Чимион', NULL),
(1703224500, 17, 3, 224, 500, 'Asaka tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Асака туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подч. Асакинского района', NULL),
(1703224501, 17, 3, 224, 501, 'Asaka', NULL, 'Асака', NULL, 'Асака', NULL),
(1703224550, 17, 3, 224, 550, 'Asaka tumanining shaharchalari', NULL, 'Асака туманининг  шаҳарчалари', NULL, 'Городские поселки Асакинского района', NULL),
(1703224552, 17, 3, 224, 552, 'Kujgan', NULL, 'Кужган', NULL, 'Кужган', NULL),
(1703224554, 17, 3, 224, 554, 'Navkan', NULL, 'Навкан', NULL, 'Навкан', NULL),
(1703224556, 17, 3, 224, 556, 'Oqbo\'yra', NULL, 'Оқбўйра', NULL, 'Окбуйра', NULL),
(1703224558, 17, 3, 224, 558, 'T.Aliyev', NULL, 'Т.Алиев', NULL, 'Т.Алиев', NULL),
(1703224800, 17, 3, 224, 800, 'Asaka tumanining qishloq fuqarolar yig\'inlari', NULL, 'Асака  туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Асакинского района', NULL),
(1703224811, 17, 3, 224, 811, 'Zarbdor', NULL, 'Зарбдор', NULL, 'Зарбдар', NULL),
(1703224822, 17, 3, 224, 822, 'Ilg\'or', NULL, 'Илғор', NULL, 'Илгар', NULL),
(1703224833, 17, 3, 224, 833, 'Qoratepa', NULL, 'Қоратепа', NULL, 'Каpатепа', NULL),
(1703224844, 17, 3, 224, 844, 'Kujgan', NULL, 'Кужган', NULL, 'Кужган', NULL),
(1703224855, 17, 3, 224, 855, 'Qadim', NULL, 'Қадим', NULL, 'Кадим', NULL),
(1703224866, 17, 3, 224, 866, 'Mustahkam', NULL, 'Мустаҳкам', NULL, 'Мустахкам', NULL),
(1703224877, 17, 3, 224, 877, 'O\'zbekiston', NULL, 'Ўзбекистон', NULL, 'Узбекистан', NULL),
(1703224885, 17, 3, 224, 885, 'Niyozbotir', NULL, 'Ниёзботир', NULL, 'Ниязбатыр', NULL),
(1703227500, 17, 3, 227, 500, 'Marxamat tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Мархамат туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Мархаматского района', NULL),
(1703227501, 17, 3, 227, 501, 'Marxamat', NULL, 'Мархамат', NULL, 'Мархамат', NULL),
(1703227550, 17, 3, 227, 550, 'Marxamat tumanining shaharchalari', NULL, 'Мархамат  туманининг  шаҳарчалари', NULL, 'Городские поселки Мархаматского района', NULL),
(1703227554, 17, 3, 227, 554, 'Polvontosh', NULL, 'Полвонтош', NULL, 'Палванташ', NULL),
(1703227557, 17, 3, 227, 557, 'Boboxuroson', NULL, 'Бобохуросон', NULL, 'Бобохуросон', NULL),
(1703227561, 17, 3, 227, 561, 'Qorabog\'ish', NULL, 'Қорабоғиш', NULL, 'Корабогиш', NULL),
(1703227564, 17, 3, 227, 564, 'Qoraqo\'rg\'on', NULL, 'Қорақўрғон', NULL, 'Коракургон', NULL),
(1703227567, 17, 3, 227, 567, 'Ko\'tarma', NULL, 'Кўтарма', NULL, 'Кутарма', NULL),
(1703227571, 17, 3, 227, 571, 'Marxamat', NULL, 'Мархамат', NULL, 'Мархамат', NULL),
(1703227574, 17, 3, 227, 574, 'Rovot', NULL, 'Ровот', NULL, 'Ровот', NULL),
(1703227577, 17, 3, 227, 577, 'O\'qchi', NULL, 'Ўқчи', NULL, 'Укчи', NULL),
(1703227581, 17, 3, 227, 581, 'Xakka', NULL, 'Хакка', NULL, 'Хакка', NULL),
(1703227584, 17, 3, 227, 584, 'Xo\'jaariq', NULL, 'Хўжаариқ', NULL, 'Хужаарик', NULL),
(1703227800, 17, 3, 227, 800, 'Marxamat tumanining qishloq fuqarolar yig\'inlari', NULL, 'Мархамат туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Мархаматского района', NULL),
(1703227811, 17, 3, 227, 811, 'Qoraqo\'rg\'on', NULL, 'Қорақўрғон', NULL, 'Каракурган', NULL),
(1703227816, 17, 3, 227, 816, 'Qorabog\'ish', NULL, 'Қорабоғиш', NULL, 'Карабагиш', NULL),
(1703227822, 17, 3, 227, 822, 'Ko\'tarma', NULL, 'Кўтарма', NULL, 'Кутарма', NULL);
INSERT INTO `soato` (`MHOBT_cod`, `res_id`, `region_id`, `district_id`, `qfi_id`, `name_lot`, `center_lot`, `name_cyr`, `center_cyr`, `name_ru`, `center_ru`) VALUES
(1703227833, 17, 3, 227, 833, 'Marxamat', NULL, 'Мархамат', NULL, 'Мархамат', NULL),
(1703227855, 17, 3, 227, 855, 'Shukurmergan', NULL, 'Шукурмерган', NULL, 'Шукурмерган', NULL),
(1703230500, 17, 3, 230, 500, 'Shaxrixon tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Шахрихон туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Шахриханского района', NULL),
(1703230501, 17, 3, 230, 501, 'Shaxrixon', NULL, 'Шахрихон', NULL, 'Шахрихан', NULL),
(1703230550, 17, 3, 230, 550, 'Shaxrixon tumanining shaharchalari', NULL, 'Шахрихон туманининг  шаҳарчалари', NULL, 'Городские поселки Шахриханского района', NULL),
(1703230552, 17, 3, 230, 552, 'Vaxim', NULL, 'Вахим', NULL, 'Вахим', NULL),
(1703230554, 17, 3, 230, 554, 'Cho\'ja', NULL, 'Чўжа', NULL, 'Чужа', NULL),
(1703230556, 17, 3, 230, 556, 'Segaza kum', NULL, 'Сегаза кум', NULL, 'Сегаза кум', NULL),
(1703230800, 17, 3, 230, 800, 'Shaxrixon tumanining qishloq fuqarolar yig\'inlari', NULL, 'Шахрихон туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Шахриханского района', NULL),
(1703230811, 17, 3, 230, 811, 'Cho\'ja', NULL, 'Чўжа', NULL, 'Чужа', NULL),
(1703230822, 17, 3, 230, 822, 'Naynavo', NULL, 'Найнаво', NULL, 'Найнава', NULL),
(1703230826, 17, 3, 230, 826, 'Guliston', NULL, 'Гулистон', NULL, 'Гулистан', NULL),
(1703230835, 17, 3, 230, 835, 'Paxtaobod', NULL, 'Пахтаобод', NULL, 'Пахтаабад', NULL),
(1703230846, 17, 3, 230, 846, 'Toshtepa', NULL, 'Тоштепа', NULL, 'Таштепа', NULL),
(1703230857, 17, 3, 230, 857, 'O\'zbekiston', NULL, 'Ўзбекистон', NULL, 'Узбекистан', NULL),
(1703230862, 17, 3, 230, 862, 'O\'rta Shaxrixon', NULL, 'Ўрта Шахрихон', NULL, 'Урта Шахрихан', NULL),
(1703230869, 17, 3, 230, 869, 'Xaqiqat', NULL, 'Хақиқат', NULL, 'Хакикат', NULL),
(1703230872, 17, 3, 230, 872, 'Abdubiy', NULL, 'Абдубий', NULL, 'Абдубий', NULL),
(1703230882, 17, 3, 230, 882, 'Yangi yo\'l', NULL, 'Янги йўл', NULL, 'Янгиюль', NULL),
(1703230890, 17, 3, 230, 890, 'Nazarmaxram', NULL, 'Назармахрам', NULL, 'Назармахрам', NULL),
(1703230898, 17, 3, 230, 898, 'Yuqori Shaxrixon', NULL, 'Юқори Шахрихон', NULL, 'Юкори  Шахрихан', NULL),
(1703232500, 17, 3, 232, 500, 'Paxtaobod tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Пахтаобод туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Пахтаабадского района', NULL),
(1703232501, 17, 3, 232, 501, 'Paxtaobod', NULL, 'Пахтаобод', NULL, 'Пахтаабад', NULL),
(1703232550, 17, 3, 232, 550, 'Paxtaobod tumanining shaharchalari', NULL, 'Пахтаобод туманининг  шаҳарчалари', NULL, 'Городские поселки Пахтаабадского района', NULL),
(1703232556, 17, 3, 232, 556, 'Do\'stlik', NULL, 'Дўстлик', NULL, 'Дустлик', NULL),
(1703232559, 17, 3, 232, 559, 'Izboskan', NULL, 'Избоскан', NULL, 'Избоскан', NULL),
(1703232563, 17, 3, 232, 563, 'Pushmon', NULL, 'Пушмон', NULL, 'Пушмон', NULL),
(1703232800, 17, 3, 232, 800, 'Paxtaobod tumanining qishloq fuqarolar yig\'inlari', NULL, 'Пахтаобод туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Пахтаабадского района', NULL),
(1703232803, 17, 3, 232, 803, 'Bo\'ston', NULL, 'Бўстон', NULL, 'Бустан', NULL),
(1703232810, 17, 3, 232, 810, 'Ittifoq', NULL, 'Иттифоқ', NULL, 'Иттифак', NULL),
(1703232820, 17, 3, 232, 820, 'Madaniyat', NULL, 'Маданият', NULL, 'Маданият', NULL),
(1703232834, 17, 3, 232, 834, 'Paxtakor', NULL, 'Пахтакор', NULL, 'Пахтакор', NULL),
(1703232845, 17, 3, 232, 845, 'Uyg\'ur', NULL, 'Уйғур', NULL, 'Уйгур', NULL),
(1703236500, 17, 3, 236, 500, 'Xo\'jaobod tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Хўжаобод туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Ходжаабадского района', NULL),
(1703236501, 17, 3, 236, 501, 'Xo\'jaobod', NULL, 'Хўжаобод', NULL, 'Ходжаабад', NULL),
(1703236550, 17, 3, 236, 550, 'Xo\'jaobod tumanining shaharchalari', NULL, 'Хўжаобод туманининг шаҳарчалари', NULL, 'Городские поселки Ходжаабадского района', NULL),
(1703236552, 17, 3, 236, 552, 'Guliston', NULL, 'Гулистон', NULL, 'Гулистон', NULL),
(1703236554, 17, 3, 236, 554, 'Dilkushod', NULL, 'Дилкушод', NULL, 'Дилкушод', NULL),
(1703236558, 17, 3, 236, 558, 'Ko\'tarma', NULL, 'Кўтарма', NULL, 'Кутарма', NULL),
(1703236562, 17, 3, 236, 562, 'Manak', NULL, 'Манак', NULL, 'Манак', NULL),
(1703236564, 17, 3, 236, 564, 'Xidirsha', NULL, 'Хидирша', NULL, 'Хидирша', NULL),
(1703236800, 17, 3, 236, 800, 'Xo\'jaobod tumanining qishloq fuqarolar yig\'inlari', NULL, 'Хўжаобод туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Ходжаабадского района', NULL),
(1703236826, 17, 3, 236, 826, 'Manak', NULL, 'Манак', NULL, 'Манак', NULL),
(1703236861, 17, 3, 236, 861, 'Birlashgan', NULL, 'Бирлашган', NULL, 'Биpлашган', NULL),
(1703236872, 17, 3, 236, 872, 'Oltin vodiy', NULL, 'Олтин водий', NULL, 'Олтин водий', NULL),
(1703236883, 17, 3, 236, 883, 'Xo\'jaobod', NULL, 'Хўжаобод', NULL, 'Ходжаабад', NULL),
(1703408550, 17, 3, 408, 550, 'Xonobod shahar hokimiyatiga qarashli shaharchalari', NULL, 'Хонобод шаҳар ҳокимиятига қарашли шаҳарчалари', NULL, 'Городские поселки, подч. Ханабадскому горхок-ту', NULL),
(1703408553, 17, 3, 408, 553, 'Xonobod', NULL, 'Хонобод', NULL, 'Ханабад', NULL),
(1703408800, 17, 3, 408, 800, 'Xonobod sh. xok-tiga qarashli qishloq fuqarolar yig\'inlari', NULL, 'Хонобод ш. хок-тига қарашли қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы гр-н, подч. Ханабадскому гоpхок-ту', NULL),
(1703408805, 17, 3, 408, 805, 'Xonobod', NULL, 'Хонобод', NULL, 'Ханабад', NULL),
(1706204500, 17, 6, 204, 500, 'Olot tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Олот туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Алатского района', NULL),
(1706204501, 17, 6, 204, 501, 'Olot', NULL, 'Олот', NULL, 'Алат', NULL),
(1706204550, 17, 6, 204, 550, 'Olot tumanining shaharchalari', NULL, 'Олот туманининг шаҳарчалари', NULL, 'Городские поселки Алатского района', NULL),
(1706204552, 17, 6, 204, 552, 'Ganchi Chandir', NULL, 'Ганчи Чандир', NULL, 'Ганчи Чандир', NULL),
(1706204553, 17, 6, 204, 553, 'Kesakli', NULL, 'Кесакли', NULL, 'Кесакли', NULL),
(1706204554, 17, 6, 204, 554, 'Qirtay', NULL, 'Қиртай', NULL, 'Киртай', NULL),
(1706204555, 17, 6, 204, 555, 'Sola qorovul', NULL, 'Сола қоровул', NULL, 'Сола коровул', NULL),
(1706204557, 17, 6, 204, 557, 'Jayxunobod', NULL, 'Жайхунобод', NULL, 'Жайхунобод', NULL),
(1706204558, 17, 6, 204, 558, 'O\'zbekiston', NULL, 'Ўзбекистон', NULL, 'Узбекистан', NULL),
(1706204559, 17, 6, 204, 559, 'Chovdur', NULL, 'Човдур', NULL, 'Човдур', NULL),
(1706204561, 17, 6, 204, 561, 'Bo\'ribek Chandir', NULL, 'Бўрибек Чандир', NULL, 'Бурибек Чандир', NULL),
(1706204800, 17, 6, 204, 800, 'Olot tumanining qishloq fuqarolar yig\'inlari', NULL, 'Олот туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Алатского района', NULL),
(1706204804, 17, 6, 204, 804, 'Bahoriston', NULL, 'Баҳористон', NULL, 'Бахористон', NULL),
(1706204808, 17, 6, 204, 808, 'Guliston', NULL, 'Гулистон', NULL, 'Гулистон', NULL),
(1706204810, 17, 6, 204, 810, 'Denov', NULL, 'Денов', NULL, 'Денау', NULL),
(1706204820, 17, 6, 204, 820, 'Jumabozor', NULL, 'Жумабозор', NULL, 'Джумабазар', NULL),
(1706204830, 17, 6, 204, 830, 'Paxtakor', NULL, 'Пахтакор', NULL, 'Пахтакор', NULL),
(1706204840, 17, 6, 204, 840, 'Talqon-sayyot', NULL, 'Талқон-сайёт', NULL, 'Талкансаят', NULL),
(1706204850, 17, 6, 204, 850, 'Chandir', NULL, 'Чандир', NULL, 'Чандиp', NULL),
(1706204853, 17, 6, 204, 853, 'Chorbog\'', NULL, 'Чорбоғ', NULL, 'Чарбаг', NULL),
(1706204856, 17, 6, 204, 856, 'Qirlishon', NULL, 'Қирлишон', NULL, 'Киpлишон', NULL),
(1706204860, 17, 6, 204, 860, 'Soyin-qorovul', NULL, 'Сойин-қоровул', NULL, 'Соин - Коpавул', NULL),
(1706207500, 17, 6, 207, 500, 'Buxoro tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Бухоро туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Бухарского района', NULL),
(1706207501, 17, 6, 207, 501, 'Gala Osiyo', NULL, 'Гала Осиё', NULL, 'Галлаасия', NULL),
(1706207550, 17, 6, 207, 550, 'Buxoro tumanining shaharchalari', NULL, 'Бухоро туманининг шаҳарчалари', NULL, 'Городские поселки Бухарского района', NULL),
(1706207553, 17, 6, 207, 553, 'Dexcha', NULL, 'Дехча', NULL, 'Дехча', NULL),
(1706207554, 17, 6, 207, 554, 'Podshoyi', NULL, 'Подшойи', NULL, 'Подшойи', NULL),
(1706207555, 17, 6, 207, 555, 'Rabotak', NULL, 'Работак', NULL, 'Работак', NULL),
(1706207557, 17, 6, 207, 557, 'O\'rta Novmetan', NULL, 'Ўрта Новметан', NULL, 'Урта Новметан', NULL),
(1706207558, 17, 6, 207, 558, 'Xumini bolo', NULL, 'Хумини боло', NULL, 'Хумини боло', NULL),
(1706207561, 17, 6, 207, 561, 'Arabxona', NULL, 'Арабхона', NULL, 'Арабхона', NULL),
(1706207800, 17, 6, 207, 800, 'Buxoro tumanining qishloq fuqarolar yig\'inlari', NULL, 'Бухоро туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Бухарского района', NULL),
(1706207810, 17, 6, 207, 810, 'Bog\'ikalon', NULL, 'Боғикалон', NULL, 'Багикалан', NULL),
(1706207824, 17, 6, 207, 824, 'Qavola Maxmud', NULL, 'Қавола Махмуд', NULL, 'Каваля Махмуд', NULL),
(1706207830, 17, 6, 207, 830, 'Kunjiqal\'a', NULL, 'Кунжиқалъа', NULL, 'Кунжикала', NULL),
(1706207835, 17, 6, 207, 835, 'Shexoncha', NULL, 'Шехонча', NULL, 'Шахонча', NULL),
(1706207846, 17, 6, 207, 846, 'Gulshanobod', NULL, 'Гулшанобод', NULL, 'Гулшанобод', NULL),
(1706207857, 17, 6, 207, 857, 'Rabotiqalmoq', NULL, 'Работиқалмоқ', NULL, 'Рабаткалмок', NULL),
(1706207860, 17, 6, 207, 860, 'Saxovat', NULL, 'Саховат', NULL, 'Саховат', NULL),
(1706207880, 17, 6, 207, 880, 'Shergiron', NULL, 'Шергирон', NULL, 'Шергирон', NULL),
(1706207882, 17, 6, 207, 882, 'Yangiobod', NULL, 'Янгиобод', NULL, 'Янгиобод', NULL),
(1706207883, 17, 6, 207, 883, 'Yangi Turmush', NULL, 'Янги Турмуш', NULL, 'Янги Турмуш', NULL),
(1706207886, 17, 6, 207, 886, 'Sohibkor', NULL, 'Соҳибкор', NULL, 'Сохибкоp', NULL),
(1706207890, 17, 6, 207, 890, 'So\'fikorgar', NULL, 'Сўфикоргар', NULL, 'Суфикоpгаp', NULL),
(1706207895, 17, 6, 207, 895, 'Istiqbol', NULL, 'Истиқбол', NULL, 'Истикбол', NULL),
(1706207898, 17, 6, 207, 898, 'Ko\'chko\'mar', NULL, 'Кўчкўмар', NULL, 'Кучкумаp', NULL),
(1706212500, 17, 6, 212, 500, 'Vobkent tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Вобкент туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Вабкентского района', NULL),
(1706212501, 17, 6, 212, 501, 'Vobkent', NULL, 'Вобкент', NULL, 'Вабкент', NULL),
(1706212550, 17, 6, 212, 550, 'Vobkent tumanining shaharchalari', NULL, 'Вобкент туманининг шаҳарчалари', NULL, 'Городские поселки Вобкентского района', NULL),
(1706212554, 17, 6, 212, 554, 'Navbahor', NULL, 'Навбаҳор', NULL, 'Навбахор', NULL),
(1706212556, 17, 6, 212, 556, 'Shirin', NULL, 'Ширин', NULL, 'Ширин', NULL),
(1706212558, 17, 6, 212, 558, 'Kosari', NULL, 'Косари', NULL, 'Косари', NULL),
(1706212800, 17, 6, 212, 800, 'Vobkent tumanining qishloq fuqarolar yig\'inlari', NULL, 'Вобкент туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Вабкентского района', NULL),
(1706212808, 17, 6, 212, 808, 'Imomqazixon', NULL, 'Имомқазихон', NULL, 'Имамказыхан', NULL),
(1706212811, 17, 6, 212, 811, 'Pirmast', NULL, 'Пирмаст', NULL, 'Пиpмаст', NULL),
(1706212822, 17, 6, 212, 822, 'Qo\'ng\'irot', NULL, 'Қўнғирот', NULL, 'Кунград', NULL),
(1706212833, 17, 6, 212, 833, 'Kumushkent', NULL, 'Кумушкент', NULL, 'Кумушкент', NULL),
(1706212844, 17, 6, 212, 844, 'Roxkent', NULL, 'Рохкент', NULL, 'Рахкент', NULL),
(1706212854, 17, 6, 212, 854, 'Xayrobotcha', NULL, 'Хайроботча', NULL, 'Хайрабатча', NULL),
(1706212855, 17, 6, 212, 855, 'Xalach', NULL, 'Халач', NULL, 'Халач', NULL),
(1706212857, 17, 6, 212, 857, 'Xayrxush', NULL, 'Хайрхуш', NULL, 'Хайрхуш', NULL),
(1706212867, 17, 6, 212, 867, 'Qipchoq', NULL, 'Қипчоқ', NULL, 'Кипчак', NULL),
(1706212877, 17, 6, 212, 877, 'Exson', NULL, 'Эхсон', NULL, 'Эхсон', NULL),
(1706212887, 17, 6, 212, 887, 'Yangikent', NULL, 'Янгикент', NULL, 'Янгикент', NULL),
(1706215500, 17, 6, 215, 500, 'G\'ijduvon tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Ғиждувон туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Гиждуванского района', NULL),
(1706215501, 17, 6, 215, 501, 'G\'ijduvon', NULL, 'Ғиждувон', NULL, 'Гиждуван', NULL),
(1706215550, 17, 6, 215, 550, 'G\'ijduvon tumanining shaharchalari', NULL, 'Ғиждувон туманининг шаҳарчалари', NULL, 'Городские поселки Гиждуванского района', NULL),
(1706215556, 17, 6, 215, 556, 'Abadi', NULL, 'Абади', NULL, 'Абади', NULL),
(1706215559, 17, 6, 215, 559, 'Beshtuvo', NULL, 'Бештуво', NULL, 'Бештуво', NULL),
(1706215561, 17, 6, 215, 561, 'Gajdumak', NULL, 'Гаждумак', NULL, 'Гаждумак', NULL),
(1706215562, 17, 6, 215, 562, 'Jovgari', NULL, 'Жовгари', NULL, 'Джовгари', NULL),
(1706215563, 17, 6, 215, 563, 'Ko\'lijabbor', NULL, 'Кўлижаббор', NULL, 'Кулижаббор', NULL),
(1706215564, 17, 6, 215, 564, 'Mazragan', NULL, 'Мазраган', NULL, 'Мазраган', NULL),
(1706215565, 17, 6, 215, 565, 'Yuqori Rostgo\'y', NULL, 'Юқори Ростгўй', NULL, 'Юкори Ростгуй', NULL),
(1706215566, 17, 6, 215, 566, 'O\'zanon', NULL, 'Ўзанон', NULL, 'Узанон', NULL),
(1706215568, 17, 6, 215, 568, 'Xatcha', NULL, 'Хатча', NULL, 'Хатча', NULL),
(1706215569, 17, 6, 215, 569, 'Chag\'dari', NULL, 'Чағдари', NULL, 'Чагдари', NULL),
(1706215574, 17, 6, 215, 574, 'Dodarak', NULL, 'Додарак', NULL, 'Додарак', NULL),
(1706215576, 17, 6, 215, 576, 'Namatgaron', NULL, 'Наматгарон', NULL, 'Наматгарон', NULL),
(1706215578, 17, 6, 215, 578, 'Yuqori Qumoq', NULL, 'Юқори Қумоқ', NULL, 'Юкори Кумок', NULL),
(1706215800, 17, 6, 215, 800, 'G\'ijduvon tumanining qishloq fuqarolar yig\'inlari', NULL, 'Ғиждувон туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Гиждуванского района', NULL),
(1706215803, 17, 6, 215, 803, 'Armechan', NULL, 'Армечан', NULL, 'Армечан', NULL),
(1706215805, 17, 6, 215, 805, 'Buktaroy', NULL, 'Буктарой', NULL, 'Буктарай', NULL),
(1706215810, 17, 6, 215, 810, 'G\'ovshun', NULL, 'Ғовшун', NULL, 'Гавшун', NULL),
(1706215820, 17, 6, 215, 820, 'Zarangari', NULL, 'Зарангари', NULL, 'Зарангаpи', NULL),
(1706215827, 17, 6, 215, 827, 'Qaraxoni', NULL, 'Қарахони', NULL, 'Карахани', NULL),
(1706215831, 17, 6, 215, 831, 'Ko\'kcha', NULL, 'Кўкча', NULL, 'Кукча', NULL),
(1706215836, 17, 6, 215, 836, 'Pozagari', NULL, 'Позагари', NULL, 'Позагари', NULL),
(1706215840, 17, 6, 215, 840, 'Paxtaobod', NULL, 'Пахтаобод', NULL, 'Пахтаобод', NULL),
(1706215848, 17, 6, 215, 848, 'Soktari', NULL, 'Соктари', NULL, 'Соктари', NULL),
(1706215849, 17, 6, 215, 849, 'Sarvari', NULL, 'Сарвари', NULL, 'Сарвари', NULL),
(1706215850, 17, 6, 215, 850, 'Sarmijon', NULL, 'Сармижон', NULL, 'Сармиджан', NULL),
(1706215860, 17, 6, 215, 860, 'Ulfatbibi', NULL, 'Улфатбиби', NULL, 'Ульфатбиби', NULL),
(1706215870, 17, 6, 215, 870, 'G.Yunusov nomli', NULL, 'Г.Юнусов номли', NULL, 'им.Ф. Юнусова', NULL),
(1706215880, 17, 6, 215, 880, 'Firishkent', NULL, 'Фиришкент', NULL, 'Фиришкент', NULL),
(1706219550, 17, 6, 219, 550, 'Kogon tumanining shaharchalari', NULL, 'Когон туманининг шаҳарчалари', NULL, 'Городские поселки Каганского района', NULL),
(1706219557, 17, 6, 219, 557, 'Sarayonobod', NULL, 'Сараёнобод', NULL, 'Сараенобод', NULL),
(1706219559, 17, 6, 219, 559, 'Tutikunda', NULL, 'Тутикунда', NULL, 'Тутикунда', NULL),
(1706219800, 17, 6, 219, 800, 'Kogon tumanining qishloq fuqarolar yig\'inlari', NULL, 'Когон туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Каганского района', NULL),
(1706219811, 17, 6, 219, 811, 'Kogon', NULL, 'Когон', NULL, 'Каган', NULL),
(1706219814, 17, 6, 219, 814, 'Xo\'ja Yakshaba', NULL, 'Хўжа Якшаба', NULL, 'Хужа Якшаба', NULL),
(1706219816, 17, 6, 219, 816, 'Guliston', NULL, 'Гулистон', NULL, 'Гулистон', NULL),
(1706219818, 17, 6, 219, 818, 'Yangi xayot', NULL, 'Янги хаёт', NULL, 'Янги хает', NULL),
(1706219822, 17, 6, 219, 822, 'Nurafshon', NULL, 'Нурафшон', NULL, 'Нурафшон', NULL),
(1706219824, 17, 6, 219, 824, 'Beklar', NULL, 'Беклар', NULL, 'Беклаp', NULL),
(1706219833, 17, 6, 219, 833, 'Niyozhoji', NULL, 'Ниёзҳожи', NULL, 'Ниёзхожи', NULL),
(1706219836, 17, 6, 219, 836, 'Sarayon', NULL, 'Сараён', NULL, 'Саpаен', NULL),
(1706219844, 17, 6, 219, 844, 'B.Naqshband', NULL, 'Б.Нақшбанд', NULL, 'Накшбанди', NULL),
(1706230500, 17, 6, 230, 500, 'Qorako\'l tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Қоракўл туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Каракульского района', NULL),
(1706230501, 17, 6, 230, 501, 'Qorako\'l', NULL, 'Қоракўл', NULL, 'Каракуль', NULL),
(1706230550, 17, 6, 230, 550, 'Qorako\'l tumanining shaharchalari', NULL, 'Қоракўл туманининг шаҳарчалари', NULL, 'Городские поселки Каракульского района', NULL),
(1706230552, 17, 6, 230, 552, 'Bandboshi', NULL, 'Бандбоши', NULL, 'Бандбоши', NULL),
(1706230553, 17, 6, 230, 553, 'Darg\'abog\'i', NULL, 'Дарғабоғи', NULL, 'Даргабоги', NULL),
(1706230554, 17, 6, 230, 554, 'Jig\'achi', NULL, 'Жиғачи', NULL, 'Джигачи', NULL),
(1706230555, 17, 6, 230, 555, 'Qorahoji', NULL, 'Қораҳожи', NULL, 'Корахожи', NULL),
(1706230556, 17, 6, 230, 556, 'Quvvacha', NULL, 'Қуввача', NULL, 'Куввача', NULL),
(1706230557, 17, 6, 230, 557, 'Mirzaqal\'a', NULL, 'Мирзақалъа', NULL, 'Мирзакалъа', NULL),
(1706230558, 17, 6, 230, 558, 'Sayyod', NULL, 'Сайёд', NULL, 'Сайед', NULL),
(1706230559, 17, 6, 230, 559, 'Solur', NULL, 'Солур', NULL, 'Солур', NULL),
(1706230561, 17, 6, 230, 561, 'Chandirobod', NULL, 'Чандиробод', NULL, 'Чандирабад', NULL),
(1706230562, 17, 6, 230, 562, 'Sho\'rabot', NULL, 'Шўработ', NULL, 'Шуррабад', NULL),
(1706230563, 17, 6, 230, 563, 'Yakka A\'lam', NULL, 'Якка Аълам', NULL, 'Якка Аълам', NULL),
(1706230564, 17, 6, 230, 564, 'Yangiqal\'a', NULL, 'Янгиқалъа', NULL, 'Янгикалъа', NULL),
(1706230800, 17, 6, 230, 800, 'Qorako\'l tumanining qishloq fuqarolar yig\'inlari', NULL, 'Қоракўл туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Каракульского района', NULL),
(1706230806, 17, 6, 230, 806, 'Darg\'ali', NULL, 'Дарғали', NULL, 'Даргали', NULL),
(1706230809, 17, 6, 230, 809, 'Bandboshi', NULL, 'Бандбоши', NULL, 'Бандбаши', NULL),
(1706230813, 17, 6, 230, 813, 'Jig\'achi', NULL, 'Жиғачи', NULL, 'Джигачи', NULL),
(1706230815, 17, 6, 230, 815, 'Sho\'rrabot', NULL, 'Шўрработ', NULL, 'Шуppабот', NULL),
(1706230825, 17, 6, 230, 825, 'Ziyorat', NULL, 'Зиёрат', NULL, 'Зиярат', NULL),
(1706230827, 17, 6, 230, 827, 'Kulonchi', NULL, 'Кулончи', NULL, 'Кулончи', NULL),
(1706230832, 17, 6, 230, 832, 'Qozon', NULL, 'Қозон', NULL, 'Казан', NULL),
(1706230834, 17, 6, 230, 834, 'Quvvacha', NULL, 'Қуввача', NULL, 'Куввача', NULL),
(1706230847, 17, 6, 230, 847, 'Qoraun', NULL, 'Қораун', NULL, 'Караун', NULL),
(1706230850, 17, 6, 230, 850, 'Qorako\'l', NULL, 'Қоракўл', NULL, 'Каракуль', NULL),
(1706230854, 17, 6, 230, 854, 'Chandir', NULL, 'Чандир', NULL, 'Чандиp', NULL),
(1706230859, 17, 6, 230, 859, 'Sayyot', NULL, 'Сайёт', NULL, 'Саят', NULL),
(1706230862, 17, 6, 230, 862, 'Mallaishayx', NULL, 'Маллаишайх', NULL, 'Маллаишайх', NULL),
(1706230875, 17, 6, 230, 875, 'Quyi Yangibozor', NULL, 'Қуйи Янгибозор', NULL, 'Куйи Янгибазар', NULL),
(1706230880, 17, 6, 230, 880, 'Qorahoji', NULL, 'Қораҳожи', NULL, 'Каpаходжи', NULL),
(1706230885, 17, 6, 230, 885, 'Chovli', NULL, 'Човли', NULL, 'Човли', NULL),
(1706232500, 17, 6, 232, 500, 'Qorovulbozor tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Қоровулбозор туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подч. Каpаулбазаpского pайона', NULL),
(1706232501, 17, 6, 232, 501, 'Qorovulbozor', NULL, 'Қоровулбозор', NULL, 'Караулбазар', NULL),
(1706232800, 17, 6, 232, 800, 'Qorovulbozor tumanining qishloq fuqarolar yig\'inlari', NULL, 'Қоровулбозор туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Караулбазарского района', NULL),
(1706232803, 17, 6, 232, 803, 'Navbahor', NULL, 'Навбаҳор', NULL, 'Навбахор', NULL),
(1706232807, 17, 6, 232, 807, 'Bo\'ston', NULL, 'Бўстон', NULL, 'Бустон', NULL),
(1706232810, 17, 6, 232, 810, 'Buzachi', NULL, 'Бузачи', NULL, 'Бузачи', NULL),
(1706232815, 17, 6, 232, 815, 'Jarqoq', NULL, 'Жарқоқ', NULL, 'Жаркок', NULL),
(1706240550, 17, 6, 240, 550, 'Peshku tumanining shaharchalari', NULL, 'Пешку туманининг шаҳарчалари', NULL, 'Городские поселки Пешкунского района', NULL),
(1706240551, 17, 6, 240, 551, 'Yangibozor', NULL, 'Янгибозор', NULL, 'Янгибозор', NULL),
(1706240553, 17, 6, 240, 553, 'Peshku', NULL, 'Пешку', NULL, 'Пешку', NULL),
(1706240555, 17, 6, 240, 555, 'Shavgon', NULL, 'Шавгон', NULL, 'Шавгон', NULL),
(1706240557, 17, 6, 240, 557, 'Mahallai-Mirishkor', NULL, 'Маҳаллаи-Миришкор', NULL, 'Махаллаи-Миришкор', NULL),
(1706240800, 17, 6, 240, 800, 'Peshku tumanining qishloq fuqarolar yig\'inlari', NULL, 'Пешку туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Пешкунского района', NULL),
(1706240802, 17, 6, 240, 802, 'Ibn Sino nomli', NULL, 'Ибн Сино номли', NULL, 'им. Абу-Али-Ибн-Сино', NULL),
(1706240805, 17, 6, 240, 805, 'Varaxsho', NULL, 'Варахшо', NULL, 'Варахша', NULL),
(1706240807, 17, 6, 240, 807, 'Jonkeldi', NULL, 'Жонкелди', NULL, 'Джангельды', NULL),
(1706240810, 17, 6, 240, 810, 'Zandani', NULL, 'Зандани', NULL, 'Зандани', NULL),
(1706240821, 17, 6, 240, 821, 'Qal\'ai Mirishkor', NULL, 'Қалъаи Миришкор', NULL, 'Калаймиришкар', NULL),
(1706240832, 17, 6, 240, 832, 'Peshku', NULL, 'Пешку', NULL, 'Пешку', NULL),
(1706240854, 17, 6, 240, 854, 'Yangibozor', NULL, 'Янгибозор', NULL, 'Янгибазар', NULL),
(1706240860, 17, 6, 240, 860, 'Bog\'imuso', NULL, 'Боғимусо', NULL, 'Богимуссо', NULL),
(1706240865, 17, 6, 240, 865, 'Qoraqalpoq', NULL, 'Қорақалпоқ', NULL, 'Каpакалпак', NULL),
(1706240870, 17, 6, 240, 870, 'Chibog\'oni', NULL, 'Чибоғони', NULL, 'Чибогони', NULL),
(1706242500, 17, 6, 242, 500, 'Romitan tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Ромитан туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Ромитанского района', NULL),
(1706242501, 17, 6, 242, 501, 'Romitan', NULL, 'Ромитан', NULL, 'Ромитан', NULL),
(1706242505, 17, 6, 242, 505, 'Gazli', NULL, 'Газли', NULL, 'Газли', NULL),
(1706242550, 17, 6, 242, 550, 'Romitan tumanining shaharchalari', NULL, 'Ромитан туманининг шаҳарчалари', NULL, 'Городские поселки Ромитанского района', NULL),
(1706242552, 17, 6, 242, 552, 'Qoqishtuvon', NULL, 'Қоқиштувон', NULL, 'Кокиштувон', NULL),
(1706242554, 17, 6, 242, 554, 'Xosa', NULL, 'Хоса', NULL, 'Хоса', NULL),
(1706242556, 17, 6, 242, 556, 'Yuqori G\'azberon', NULL, 'Юқори Ғазберон', NULL, 'Юкори Газберон', NULL),
(1706242800, 17, 6, 242, 800, 'Romitan tumanining qishloq fuqarolar yig\'inlari', NULL, 'Ромитан туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Ромитанского района', NULL),
(1706242825, 17, 6, 242, 825, 'Qizil Ravot', NULL, 'Қизил Равот', NULL, 'Кызылрават', NULL),
(1706242834, 17, 6, 242, 834, 'Romitan', NULL, 'Ромитан', NULL, 'Ромитан', NULL),
(1706242864, 17, 6, 242, 864, 'Bog\'iturkon', NULL, 'Боғитуркон', NULL, 'Богитуркон', NULL),
(1706242867, 17, 6, 242, 867, 'Chelong\'u', NULL, 'Челонғу', NULL, 'Чилангу', NULL),
(1706242872, 17, 6, 242, 872, 'Sho\'rcha', NULL, 'Шўрча', NULL, 'Шурча', NULL),
(1706242875, 17, 6, 242, 875, 'Qo\'rg\'on', NULL, 'Қўрғон', NULL, 'Курган', NULL),
(1706246550, 17, 6, 246, 550, 'Jondor tumanining shaharchalari', NULL, 'Жондор туманининг шаҳарчалари', NULL, 'Городские поселки Жондоpского pайона', NULL),
(1706246551, 17, 6, 246, 551, 'Jondor', NULL, 'Жондор', NULL, 'Жондор', NULL),
(1706246552, 17, 6, 246, 552, 'Paxlavon', NULL, 'Пахлавон', NULL, 'Пахлавон', NULL),
(1706246553, 17, 6, 246, 553, 'Dalmun', NULL, 'Далмун', NULL, 'Далмун', NULL),
(1706246554, 17, 6, 246, 554, 'Ko\'liyon', NULL, 'Кўлиён', NULL, 'Кулиен', NULL),
(1706246555, 17, 6, 246, 555, 'Samonchuq', NULL, 'Самончуқ', NULL, 'Самончук', NULL),
(1706246556, 17, 6, 246, 556, 'Tobagar', NULL, 'Тобагар', NULL, 'Тобагар', NULL),
(1706246557, 17, 6, 246, 557, 'Ushot', NULL, 'Ушот', NULL, 'Ушот', NULL),
(1706246558, 17, 6, 246, 558, 'Xazorman', NULL, 'Хазорман', NULL, 'Хазорман', NULL),
(1706246559, 17, 6, 246, 559, 'Chorzona', NULL, 'Чорзона', NULL, 'Чорзона', NULL),
(1706246800, 17, 6, 246, 800, 'Jondor tumanining qishloq fuqarolar yig\'inlari', NULL, 'Жондор туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Жондоpского района', NULL),
(1706246811, 17, 6, 246, 811, 'Dalmun', NULL, 'Далмун', NULL, 'Дальмун', NULL),
(1706246822, 17, 6, 246, 822, 'Qaroli', NULL, 'Қароли', NULL, 'Каpоли', NULL),
(1706246825, 17, 6, 246, 825, 'Lolo', NULL, 'Лоло', NULL, 'Лола', NULL),
(1706246831, 17, 6, 246, 831, 'Romish', NULL, 'Ромиш', NULL, 'Ромиш', NULL),
(1706246833, 17, 6, 246, 833, 'Zarafshon', NULL, 'Зарафшон', NULL, 'Зарафшон', NULL),
(1706246844, 17, 6, 246, 844, 'Oxshix', NULL, 'Охших', NULL, 'Охших', NULL),
(1706246855, 17, 6, 246, 855, 'Xumdonak', NULL, 'Хумдонак', NULL, 'Хумданак', NULL),
(1706246866, 17, 6, 246, 866, 'Xumini bolo', NULL, 'Хумини боло', NULL, 'Хумин', NULL),
(1706246870, 17, 6, 246, 870, 'Mustaqillik', NULL, 'Мустақиллик', NULL, 'Мустакиллик', NULL),
(1706246875, 17, 6, 246, 875, 'Po\'loti', NULL, 'Пўлоти', NULL, 'Пулоти', NULL),
(1706246880, 17, 6, 246, 880, 'Samonchuq', NULL, 'Самончуқ', NULL, 'Самончук', NULL),
(1706246885, 17, 6, 246, 885, 'Aleli', NULL, 'Алели', NULL, 'Алели', NULL),
(1706246890, 17, 6, 246, 890, 'Mirzayon', NULL, 'Мирзаён', NULL, 'Миpзоен', NULL),
(1706258500, 17, 6, 258, 500, 'Shofirkon tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Шофиркон туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Гоpода pайонного подчинения Шафирканского района', NULL),
(1706258501, 17, 6, 258, 501, 'Shofirkon', NULL, 'Шофиркон', NULL, 'Шафиркан', NULL),
(1706258550, 17, 6, 258, 550, 'Shofirkon tumanining shaharchalari', NULL, 'Шофиркон туманининг шаҳарчалари', NULL, 'Городские поселки Шафирканского района', NULL),
(1706258552, 17, 6, 258, 552, 'Jo\'yrabot', NULL, 'Жўйработ', NULL, 'Жуйрабад', NULL),
(1706258553, 17, 6, 258, 553, 'Iskogare', NULL, 'Искогаре', NULL, 'Искогаре', NULL),
(1706258554, 17, 6, 258, 554, 'Quyi Chuqurak', NULL, 'Қуйи Чуқурак', NULL, 'Куйи Чукурак', NULL),
(1706258555, 17, 6, 258, 555, 'Mirzoqul', NULL, 'Мирзоқул', NULL, 'Мирзокул', NULL),
(1706258556, 17, 6, 258, 556, 'Talisafed', NULL, 'Талисафед', NULL, 'Талисафед', NULL),
(1706258557, 17, 6, 258, 557, 'Undare', NULL, 'Ундаре', NULL, 'Ундаре', NULL),
(1706258558, 17, 6, 258, 558, 'Chandir', NULL, 'Чандир', NULL, 'Чандир', NULL),
(1706258561, 17, 6, 258, 561, 'G\'ulomte', NULL, 'Ғуломте', NULL, 'Гуломте', NULL),
(1706258800, 17, 6, 258, 800, 'Shofirkon tumanining qishloq fuqarolar yig\'inlari', NULL, 'Шофиркон туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Шафирканского района', NULL),
(1706258805, 17, 6, 258, 805, 'Vargonze', NULL, 'Варгонзе', NULL, 'Варданзе', NULL),
(1706258811, 17, 6, 258, 811, 'Denov', NULL, 'Денов', NULL, 'Денау', NULL),
(1706258822, 17, 6, 258, 822, 'Jo\'ynav', NULL, 'Жўйнав', NULL, 'Жуйнау', NULL),
(1706258828, 17, 6, 258, 828, 'Jo\'yrabot', NULL, 'Жўйработ', NULL, 'Жуйработ', NULL),
(1706258833, 17, 6, 258, 833, 'Do\'rmon', NULL, 'Дўрмон', NULL, 'Дурмен', NULL),
(1706258844, 17, 6, 258, 844, 'Savrak', NULL, 'Саврак', NULL, 'Саврак', NULL),
(1706258855, 17, 6, 258, 855, 'Sulton Jo\'ra', NULL, 'Султон Жўра', NULL, 'им. С. Джури', NULL),
(1706258866, 17, 6, 258, 866, 'Tezguzar', NULL, 'Тезгузар', NULL, 'Тезгузар', NULL),
(1706258877, 17, 6, 258, 877, 'Mazlaxon chandir', NULL, 'Мазлахон чандир', NULL, 'Мазлахон Чандир', NULL),
(1706258880, 17, 6, 258, 880, 'Sh.Hamroyev nomli', NULL, 'Ш.Ҳамроев номли', NULL, 'им. Ш. Хамраева', NULL),
(1706258885, 17, 6, 258, 885, 'Iskogare', NULL, 'Искогаре', NULL, 'Искогаpе', NULL),
(1706258890, 17, 6, 258, 890, 'Bog\'iafzal', NULL, 'Боғиафзал', NULL, 'Богиафзал', NULL),
(1706401800, 17, 6, 401, 800, 'Buxoro shahar hokimiyatiga qarashli qishloq fuqarolar yig\'inlari', NULL, 'Бухоро шаҳар ҳокимиятига қарашли қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы гр-н, подч. Бухарскому горхокимияту', NULL),
(1706401803, 17, 6, 401, 803, 'Otbozor', NULL, 'Отбозор', NULL, 'Атбазар', NULL),
(1706401805, 17, 6, 401, 805, 'Shirbuddin', NULL, 'Ширбуддин', NULL, 'Шербуддин', NULL),
(1708201550, 17, 8, 201, 550, 'Arnasoy tumanining shaharchalari', NULL, 'Арнасой туманининг шаҳарчалари', NULL, 'Городские поселки Арнасайского района', NULL),
(1708201551, 17, 8, 201, 551, 'G\'oliblar', NULL, 'Ғолиблар', NULL, 'Голиблар', NULL),
(1708201556, 17, 8, 201, 556, 'Gulbahor', NULL, 'Гулбаҳор', NULL, 'Гулбахор', NULL),
(1708201800, 17, 8, 201, 800, 'Arnasoy tumanining qishloq fuqarolar yig\'inlari', NULL, 'Арнасой туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Арнасайского района', NULL),
(1708201802, 17, 8, 201, 802, 'Bo\'ston', NULL, 'Бўстон', NULL, 'Бустон', NULL),
(1708201803, 17, 8, 201, 803, 'Do\'stlik', NULL, 'Дўстлик', NULL, 'Дустлик', NULL),
(1708201804, 17, 8, 201, 804, 'Zarafshon', NULL, 'Зарафшон', NULL, 'Зарафшан', NULL),
(1708201806, 17, 8, 201, 806, 'Oltin vodiy', NULL, 'Олтин водий', NULL, 'Олтин водий', NULL),
(1708201807, 17, 8, 201, 807, 'Cho\'lquvar', NULL, 'Чўлқувар', NULL, 'Чулкувар', NULL),
(1708201813, 17, 8, 201, 813, 'Yangibo\'ston', NULL, 'Янгибўстон', NULL, 'Янгибустан', NULL),
(1708204550, 17, 8, 204, 550, 'Baxmal tumanining shaharchalari', NULL, 'Бахмал туманининг шаҳарчалари', NULL, 'Городские поселки Бахмальского района', NULL),
(1708204551, 17, 8, 204, 551, 'O\'smat', NULL, 'Ўсмат', NULL, 'Усмат', NULL),
(1708204552, 17, 8, 204, 552, 'Oqtosh', NULL, 'Оқтош', NULL, 'Акташ', NULL),
(1708204553, 17, 8, 204, 553, 'Mo\'g\'ol', NULL, 'Мўғол', NULL, 'Мугол', NULL),
(1708204554, 17, 8, 204, 554, 'Novqa', NULL, 'Новқа', NULL, 'Новка', NULL),
(1708204555, 17, 8, 204, 555, 'Alamli', NULL, 'Аламли', NULL, 'Аламли', NULL),
(1708204556, 17, 8, 204, 556, 'Tongotar', NULL, 'Тонготар', NULL, 'Тонготар', NULL),
(1708204558, 17, 8, 204, 558, 'Baxmal', NULL, 'Бахмал', NULL, 'Бахмал', NULL),
(1708204800, 17, 8, 204, 800, 'Baxmal tumanining qishloq fuqarolar yig\'inlari', NULL, 'Бахмал туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Бахмальского района', NULL),
(1708204802, 17, 8, 204, 802, 'Oyqor', NULL, 'Ойқор', NULL, 'Айкар', NULL),
(1708204804, 17, 8, 204, 804, 'Oqtosh', NULL, 'Оқтош', NULL, 'Акташ', NULL),
(1708204808, 17, 8, 204, 808, 'Bog\'ishamol', NULL, 'Боғишамол', NULL, 'Багишамал', NULL),
(1708204810, 17, 8, 204, 810, 'Barlos', NULL, 'Барлос', NULL, 'Барлас', NULL),
(1708204812, 17, 8, 204, 812, 'Baxmal', NULL, 'Бахмал', NULL, 'Бахмал', NULL),
(1708204817, 17, 8, 204, 817, 'Gulbuloq', NULL, 'Гулбулоқ', NULL, 'Гульбулак', NULL),
(1708204830, 17, 8, 204, 830, 'Mo\'g\'ol', NULL, 'Мўғол', NULL, 'Мугал', NULL),
(1708204835, 17, 8, 204, 835, 'Sangzor', NULL, 'Сангзор', NULL, 'Сангзар', NULL),
(1708204840, 17, 8, 204, 840, 'Tongotar', NULL, 'Тонготар', NULL, 'Тонготар', NULL),
(1708204845, 17, 8, 204, 845, 'Uzunbuloq', NULL, 'Узунбулоқ', NULL, 'Узунбулак', NULL),
(1708209500, 17, 8, 209, 500, 'G\'allaorol tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Ғаллаорол туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Галляаральского района', NULL),
(1708209501, 17, 8, 209, 501, 'G\'allaorol', NULL, 'Ғаллаорол', NULL, 'Галляарал', NULL),
(1708209550, 17, 8, 209, 550, 'G\'allaorol tumanining shaharchalari', NULL, 'Ғаллаорол туманининг  шаҳарчалари', NULL, 'Городские поселки Галляаральского района', NULL),
(1708209554, 17, 8, 209, 554, 'Qo\'ytosh', NULL, 'Қўйтош', NULL, 'Кайташ', NULL),
(1708209557, 17, 8, 209, 557, 'Marjonbuloq', NULL, 'Маржонбулоқ', NULL, 'Марджанбулак', NULL),
(1708209559, 17, 8, 209, 559, 'Lalmikor', NULL, 'Лалмикор', NULL, 'Лалмикор', NULL),
(1708209561, 17, 8, 209, 561, 'Qangliobod', NULL, 'Қанглиобод', NULL, 'Канглиобод', NULL),
(1708209565, 17, 8, 209, 565, 'Abdukarim', NULL, 'Абдукарим', NULL, 'Абдукарим', NULL),
(1708209567, 17, 8, 209, 567, 'Chuvilloq', NULL, 'Чувиллоқ', NULL, 'Чувиллок', NULL),
(1708209800, 17, 8, 209, 800, 'G\'allaorol tumanining qishloq fuqarolar yig\'inlari', NULL, 'Ғаллаорол туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Галляаральского района', NULL),
(1708209823, 17, 8, 209, 823, 'G\'ubdin', NULL, 'Ғубдин', NULL, 'Губдин', NULL),
(1708209825, 17, 8, 209, 825, 'Xonimqo\'rg\'on', NULL, 'Хонимқўрғон', NULL, 'Хонимкуpган', NULL),
(1708209834, 17, 8, 209, 834, 'Ittifoq', NULL, 'Иттифоқ', NULL, 'Иттифак', NULL),
(1708209836, 17, 8, 209, 836, 'Gulchambar', NULL, 'Гулчамбар', NULL, 'Гулчамбар', NULL),
(1708209838, 17, 8, 209, 838, 'Qipchoqsuv', NULL, 'Қипчоқсув', NULL, 'Кипчоксув', NULL),
(1708209848, 17, 8, 209, 848, 'Ko\'kbuloq', NULL, 'Кўкбулоқ', NULL, 'Кокбулак', NULL),
(1708209853, 17, 8, 209, 853, 'Korizquduq', NULL, 'Коризқудуқ', NULL, 'Коризкудук', NULL),
(1708209857, 17, 8, 209, 857, 'Guliston', NULL, 'Гулистон', NULL, 'Гулистан', NULL),
(1708209860, 17, 8, 209, 860, 'Buloqboshi', NULL, 'Булоқбоши', NULL, 'Булакбаши', NULL),
(1708209865, 17, 8, 209, 865, 'Madaniyat', NULL, 'Маданият', NULL, 'Маданият', NULL),
(1708209868, 17, 8, 209, 868, 'Mirzabuloq', NULL, 'Мирзабулоқ', NULL, 'Мирзабулак', NULL),
(1708209870, 17, 8, 209, 870, 'Moltob', NULL, 'Молтоб', NULL, 'Молтаб', NULL),
(1708209875, 17, 8, 209, 875, 'Tozaurug\'', NULL, 'Тозауруғ', NULL, 'Тозауpуг', NULL),
(1708209880, 17, 8, 209, 880, 'Mulkush', NULL, 'Мулкуш', NULL, 'Мулкуш', NULL),
(1708212550, 17, 8, 212, 550, 'Sharof Rashidov tumanining shaharchalari', NULL, 'Шароф Рашидов туманининг  шаҳарчалари', NULL, 'Городские поселки Шароф Рашидовского района', NULL),
(1708212551, 17, 8, 212, 551, 'Uch-tepa', NULL, 'Уч-тепа', NULL, 'Уч-тепа', NULL),
(1708212552, 17, 8, 212, 552, 'Gandumtosh', NULL, 'Гандумтош', NULL, 'Гандумтош', NULL),
(1708212553, 17, 8, 212, 553, 'Qorayantoq', NULL, 'Қораянтоқ', NULL, 'Караянтак', NULL),
(1708212554, 17, 8, 212, 554, 'Qang\'li', NULL, 'Қанғли', NULL, 'Кангли', NULL),
(1708212555, 17, 8, 212, 555, 'Toqchiliq', NULL, 'Тоқчилиқ', NULL, 'Токчилик', NULL),
(1708212557, 17, 8, 212, 557, 'Mulkanlik', NULL, 'Мулканлик', NULL, 'Мулканлик', NULL),
(1708212559, 17, 8, 212, 559, 'Jizzaxlik', NULL, 'Жиззахлик', NULL, 'Жиззахлик', NULL),
(1708212800, 17, 8, 212, 800, 'Sharof Rashidov tumanining qishloq fuqarolar yig\'inlari', NULL, 'Шароф Рашидов туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Шароф Рашидовского района', NULL),
(1708212807, 17, 8, 212, 807, 'Oq oltin', NULL, 'Оқ олтин', NULL, 'Акалтын', NULL),
(1708212810, 17, 8, 212, 810, 'Ziyokor', NULL, 'Зиёкор', NULL, 'Зиекор', NULL),
(1708212816, 17, 8, 212, 816, 'Qang\'li', NULL, 'Қанғли', NULL, 'Кангли', NULL),
(1708212820, 17, 8, 212, 820, 'Rovat', NULL, 'Роват', NULL, 'Рават', NULL),
(1708212832, 17, 8, 212, 832, 'Qo\'shbarmoq', NULL, 'Қўшбармоқ', NULL, 'Кушбаpмок', NULL),
(1708212835, 17, 8, 212, 835, 'Paxtaobod', NULL, 'Пахтаобод', NULL, 'Пахтаабад', NULL),
(1708212837, 17, 8, 212, 837, 'Qulama', NULL, 'Қулама', NULL, 'Кулама', NULL),
(1708212854, 17, 8, 212, 854, 'Xayrobod', NULL, 'Хайробод', NULL, 'Хайрабад', NULL),
(1708212860, 17, 8, 212, 860, 'Fayzobod', NULL, 'Файзобод', NULL, 'Файзобод', NULL),
(1708212865, 17, 8, 212, 865, 'Kuyovboshi', NULL, 'Куёвбоши', NULL, 'Куёвбоши', NULL),
(1708212870, 17, 8, 212, 870, 'Samarqand quduq', NULL, 'Самарқанд қудуқ', NULL, 'Самаpканд - кудук', NULL),
(1708212875, 17, 8, 212, 875, 'Uchtepa', NULL, 'Учтепа', NULL, 'Учтепа', NULL),
(1708215500, 17, 8, 215, 500, 'Do\'stlik tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Дўстлик туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Дустликского района', NULL),
(1708215501, 17, 8, 215, 501, 'Do\'stlik', NULL, 'Дўстлик', NULL, 'Дустлик', NULL),
(1708215550, 17, 8, 215, 550, 'Do\'stlik tumanining shaharchalari', NULL, 'Дўстлик туманининг шаҳарчалари', NULL, 'Городские поселки Дустликского района', NULL),
(1708215553, 17, 8, 215, 553, 'Navro\'z', NULL, 'Наврўз', NULL, 'Навруз', NULL),
(1708215800, 17, 8, 215, 800, 'Do\'stlik tumanining qishloq fuqarolar yig\'inlari', NULL, 'Дўстлик туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Дустликского района', NULL),
(1708215803, 17, 8, 215, 803, 'Bog\'zor', NULL, 'Боғзор', NULL, 'Багзар', NULL),
(1708215805, 17, 8, 215, 805, 'Bunyodkor', NULL, 'Бунёдкор', NULL, 'Бунедкор', NULL),
(1708215812, 17, 8, 215, 812, 'Qahramon', NULL, 'Қаҳрамон', NULL, 'Кахрамон', NULL),
(1708215823, 17, 8, 215, 823, 'Manas', NULL, 'Манас', NULL, 'Манас', NULL),
(1708215830, 17, 8, 215, 830, 'Saritepa', NULL, 'Саритепа', NULL, 'Саритепа', NULL),
(1708215840, 17, 8, 215, 840, 'Oltin vodiy', NULL, 'Олтин водий', NULL, 'Олтин водий', NULL),
(1708215845, 17, 8, 215, 845, 'Mevazor', NULL, 'Мевазор', NULL, 'Мевазоp', NULL),
(1708218500, 17, 8, 218, 500, 'Zomin tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Зомин туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Зааминского района', NULL),
(1708218503, 17, 8, 218, 503, 'Dashtobod', NULL, 'Даштобод', NULL, 'Даштобод', NULL),
(1708218550, 17, 8, 218, 550, 'Zomin tumanining shaharchalari', NULL, 'Зомин туманининг шаҳарчалари', NULL, 'Городские поселки Зааминского района', NULL),
(1708218551, 17, 8, 218, 551, 'Zomin', NULL, 'Зомин', NULL, 'Заамин', NULL),
(1708218553, 17, 8, 218, 553, 'Yom', NULL, 'Ём', NULL, 'Ем', NULL),
(1708218555, 17, 8, 218, 555, 'Sirg\'ali', NULL, 'Сирғали', NULL, 'Сиргали', NULL),
(1708218557, 17, 8, 218, 557, 'Pshag\'or', NULL, 'Пшағор', NULL, 'Пшагор', NULL),
(1708218800, 17, 8, 218, 800, 'Zomin tumanining qishloq fuqarolar yig\'inlari', NULL, 'Зомин туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Зааминского района', NULL),
(1708218811, 17, 8, 218, 811, 'G\'allakor', NULL, 'Ғаллакор', NULL, 'Галлякор', NULL),
(1708218813, 17, 8, 218, 813, 'Gulshan', NULL, 'Гулшан', NULL, 'Гульшан', NULL),
(1708218817, 17, 8, 218, 817, 'Duoba', NULL, 'Дуоба', NULL, 'Дуоба', NULL),
(1708218834, 17, 8, 218, 834, 'A.Navoiy', NULL, 'А.Навоий', NULL, 'им. Навои', NULL),
(1708218838, 17, 8, 218, 838, 'Obi hayot', NULL, 'Оби ҳаёт', NULL, 'Обихаят', NULL),
(1708218857, 17, 8, 218, 857, 'Chorvador', NULL, 'Чорвадор', NULL, 'Чарвадар', NULL),
(1708218858, 17, 8, 218, 858, 'Istiqlol', NULL, 'Истиқлол', NULL, 'Истиклол', NULL),
(1708218860, 17, 8, 218, 860, 'Beshkubi', NULL, 'Бешкуби', NULL, 'Бешкуби', NULL),
(1708218870, 17, 8, 218, 870, 'Shirin', NULL, 'Ширин', NULL, 'Шиpин', NULL),
(1708220550, 17, 8, 220, 550, 'Zarbdor tumanining shaharchalari', NULL, 'Зарбдор туманининг шаҳарчалари', NULL, 'Городские поселки Зарбдарского района', NULL),
(1708220551, 17, 8, 220, 551, 'Zarbdor', NULL, 'Зарбдор', NULL, 'Зарбдар', NULL),
(1708220553, 17, 8, 220, 553, 'Bo\'ston', NULL, 'Бўстон', NULL, 'Бустан', NULL),
(1708220555, 17, 8, 220, 555, 'Fayzobod', NULL, 'Файзобод', NULL, 'Файзобод', NULL),
(1708220557, 17, 8, 220, 557, 'Sharq yulduzi', NULL, 'Шарқ юлдузи', NULL, 'Шарк Юлдузи', NULL),
(1708220800, 17, 8, 220, 800, 'Zarbdor tumanining qishloq fuqarolar yig\'inlari', NULL, 'Зарбдор туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Зарбдарского района', NULL),
(1708220827, 17, 8, 220, 827, 'Sharq yulduzi', NULL, 'Шарқ юлдузи', NULL, 'Шаpк Юлдузи', NULL),
(1708220831, 17, 8, 220, 831, 'Toshkesgan', NULL, 'Тошкесган', NULL, 'Ташкесган', NULL),
(1708220835, 17, 8, 220, 835, 'Tinchlik', NULL, 'Тинчлик', NULL, 'Тинчлик', NULL),
(1708220843, 17, 8, 220, 843, 'Oqar', NULL, 'Оқар', NULL, 'Окар', NULL),
(1708220850, 17, 8, 220, 850, 'Lalmikor', NULL, 'Лалмикор', NULL, 'Лалмикоp', NULL),
(1708220863, 17, 8, 220, 863, 'Yangikent', NULL, 'Янгикент', NULL, 'Янгикент', NULL),
(1708220865, 17, 8, 220, 865, 'Andijon', NULL, 'Андижон', NULL, 'Андижан', NULL),
(1708220870, 17, 8, 220, 870, 'Adirobod', NULL, 'Адиробод', NULL, 'Адиpабад', NULL),
(1708223500, 17, 8, 223, 500, 'Mirzacho\'l tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Мирзачўл туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Мирзачульского района', NULL),
(1708223501, 17, 8, 223, 501, 'Gagarin', NULL, 'Гагарин', NULL, 'Гагарин', NULL),
(1708223550, 17, 8, 223, 550, 'Mirzacho\'l tumanining shaharchalari', NULL, 'Мирзачўл туманининг шаҳарчалари', NULL, 'Городские поселки Мирзачульского района', NULL),
(1708223553, 17, 8, 223, 553, 'Paxtazor', NULL, 'Пахтазор', NULL, 'Пахтазор', NULL),
(1708223555, 17, 8, 223, 555, 'Mirzadala', NULL, 'Мирзадала', NULL, 'Мирзадала', NULL),
(1708223800, 17, 8, 223, 800, 'Mirzacho\'l tumanining qishloq fuqarolar yig\'inlari', NULL, 'Мирзачўл туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Мирзачульского района', NULL),
(1708223803, 17, 8, 223, 803, 'Bog\'bon', NULL, 'Боғбон', NULL, 'Багбан', NULL),
(1708223815, 17, 8, 223, 815, 'Jibek-jo\'li', NULL, 'Жибек-жўли', NULL, 'Жибек- жолы', NULL),
(1708223830, 17, 8, 223, 830, 'Toshkent', NULL, 'Тошкент', NULL, 'Ташкент', NULL),
(1708223833, 17, 8, 223, 833, 'O\'zbekiston', NULL, 'Ўзбекистон', NULL, 'Узбекистан', NULL),
(1708223840, 17, 8, 223, 840, 'Yangidala', NULL, 'Янгидала', NULL, 'Янгидала', NULL),
(1708223850, 17, 8, 223, 850, 'Gulzor', NULL, 'Гулзор', NULL, 'Гульзар', NULL),
(1708225550, 17, 8, 225, 550, 'Zafarobod tumanining shaharchalari', NULL, 'Зафаробод туманининг шаҳарчалари', NULL, 'Городские поселки Зафарабадского района', NULL),
(1708225551, 17, 8, 225, 551, 'Zafarobod', NULL, 'Зафаробод', NULL, 'Зафарабад', NULL),
(1708225553, 17, 8, 225, 553, 'Yorqin', NULL, 'Ёрқин', NULL, 'Яркин', NULL),
(1708225555, 17, 8, 225, 555, 'Pistalikent', NULL, 'Писталикент', NULL, 'Писталикент', NULL),
(1708225557, 17, 8, 225, 557, 'Nurafshon', NULL, 'Нурафшон', NULL, 'Нурафшон', NULL),
(1708225800, 17, 8, 225, 800, 'Zafarobod tumanining qishloq fuqarolar yig\'inlari', NULL, 'Зафаробод туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Зафарабадского района', NULL),
(1708225802, 17, 8, 225, 802, 'Birlik', NULL, 'Бирлик', NULL, 'Бирлик', NULL),
(1708225807, 17, 8, 225, 807, 'Yorqin', NULL, 'Ёрқин', NULL, 'Еркин', NULL),
(1708225812, 17, 8, 225, 812, 'Lolazor', NULL, 'Лолазор', NULL, 'Лолазор', NULL),
(1708225828, 17, 8, 225, 828, 'Uzun', NULL, 'Узун ', NULL, 'Узун ', NULL),
(1708225832, 17, 8, 225, 832, 'Xulkar', NULL, 'Хулкар', NULL, 'Хулкар', NULL),
(1708225848, 17, 8, 225, 848, 'Chimqo\'rg\'on', NULL, 'Чимқўрғон', NULL, 'Чимкурган', NULL),
(1708228500, 17, 8, 228, 500, 'Paxtakor tumanining tuman ahamiyatiga ega shaharla', NULL, 'Пахтакор туманининг туман аҳамиятига эга шаҳарла', NULL, 'Города районного подчинения Пахтакорского района', NULL),
(1708228501, 17, 8, 228, 501, 'Paxtakor', NULL, 'Пахтакор', NULL, 'Пахтакор', NULL),
(1708228550, 17, 8, 228, 550, 'Paxtakor tumanining shaharchalari', NULL, 'Пахтакор туманининг шаҳарчалари', NULL, 'Городские поселки Пахтакорского района', NULL),
(1708228553, 17, 8, 228, 553, 'Gulzor', NULL, 'Гулзор', NULL, 'Гулзор', NULL),
(1708228800, 17, 8, 228, 800, 'Paxtakor tumanining qishloq fuqarolar yig\'inlari', NULL, 'Пахтакор туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Пахтакорского района', NULL),
(1708228805, 17, 8, 228, 805, 'Buyuk Ipak yo\'li', NULL, 'Буюк Ипак йўли', NULL, 'Буюк Ипак йули', NULL),
(1708228807, 17, 8, 228, 807, 'Olmazor', NULL, 'Олмазор', NULL, 'Алмазар', NULL),
(1708228819, 17, 8, 228, 819, 'Mingchinor', NULL, 'Мингчинор', NULL, 'Мингчинар', NULL),
(1708228822, 17, 8, 228, 822, 'Paxtakor', NULL, 'Пахтакор', NULL, 'Пахтакор', NULL),
(1708228828, 17, 8, 228, 828, 'Bog\'ishamol', NULL, 'Боғишамол', NULL, 'Богишамол', NULL),
(1708228835, 17, 8, 228, 835, 'Chamanzor', NULL, 'Чаманзор', NULL, 'Чаманзар', NULL),
(1708228840, 17, 8, 228, 840, 'Oq buloq', NULL, 'Оқ булоқ', NULL, 'Акбулак', NULL),
(1708235550, 17, 8, 235, 550, 'Forish tumanining shaharchalari', NULL, 'Фориш туманининг шаҳарчалари', NULL, 'Городские поселки Фаришского pайона', NULL),
(1708235551, 17, 8, 235, 551, 'Bog\'don', NULL, 'Боғдон', NULL, 'Богдон', NULL),
(1708235560, 17, 8, 235, 560, 'Uchquloch', NULL, 'Учқулоч', NULL, 'Учкулач', NULL),
(1708235800, 17, 8, 235, 800, 'Forish tumanining qishloq fuqarolar yig\'inlari', NULL, 'Фориш туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Фаришского района', NULL),
(1708235805, 17, 8, 235, 805, 'Omonkeldi', NULL, 'Омонкелди', NULL, 'Амангельды', NULL),
(1708235813, 17, 8, 235, 813, 'Darvoza', NULL, 'Дарвоза', NULL, 'Дарваза', NULL),
(1708235824, 17, 8, 235, 824, 'Arnasoy', NULL, 'Арнасой', NULL, 'Аpнасай', NULL),
(1708235828, 17, 8, 235, 828, 'Qoraabdol', NULL, 'Қораабдол', NULL, 'Караабдал', NULL),
(1708235835, 17, 8, 235, 835, 'Egizbuloq', NULL, 'Эгизбулоқ', NULL, 'Эгизбулак', NULL),
(1708235846, 17, 8, 235, 846, 'Qizilqum', NULL, 'Қизилқум', NULL, 'Кызылкум', NULL),
(1708235868, 17, 8, 235, 868, 'Forish', NULL, 'Фориш', NULL, 'Фариш', NULL),
(1708235885, 17, 8, 235, 885, 'Uxum', NULL, 'Ухум', NULL, 'Ухум', NULL),
(1708235890, 17, 8, 235, 890, 'Garasha', NULL, 'Гараша', NULL, 'Гараша', NULL),
(1708235895, 17, 8, 235, 895, 'Osmonsoy', NULL, 'Осмонсой', NULL, 'Османсай', NULL),
(1708237550, 17, 8, 237, 550, 'Yangiobod tumanining shaharchalari', NULL, 'Янгиобод туманининг шаҳарчалари', NULL, 'Городские поселки Янгиабадского района', NULL),
(1708237552, 17, 8, 237, 552, 'Yangiobod', NULL, 'Янгиобод', NULL, 'Янгиабад', NULL),
(1708237554, 17, 8, 237, 554, 'Savot', NULL, 'Савот', NULL, 'Савот', NULL),
(1708237800, 17, 8, 237, 800, 'Yangiobod tumanining qishloq fuqarolar yig\'inlari', NULL, 'Янгиобод туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Янгиободского района', NULL),
(1708237804, 17, 8, 237, 804, 'Sarmich', NULL, 'Сармич', NULL, 'Сармич', NULL),
(1708237813, 17, 8, 237, 813, 'Xo\'jamushkent', NULL, 'Хўжамушкент', NULL, 'Ходжамушкент', NULL),
(1708237822, 17, 8, 237, 822, 'Savot', NULL, 'Савот', NULL, 'Сават', NULL),
(1708237831, 17, 8, 237, 831, 'Havotog\'', NULL, 'Ҳавотоғ', NULL, 'Ховотог', NULL),
(1708237840, 17, 8, 237, 840, 'Xovos', NULL, 'Ховос', NULL, 'Хавас', NULL),
(1710207500, 17, 10, 207, 500, 'G\'uzor tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Ғузор туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Гузарского района', NULL),
(1710207501, 17, 10, 207, 501, 'G\'uzor', NULL, 'Ғузор', NULL, 'Гузар', NULL),
(1710207550, 17, 10, 207, 550, 'G\'uzor tumanining shaharchalari', NULL, 'Ғузор туманининг  шаҳарчалари', NULL, 'Городские поселки Гузарского района', NULL),
(1710207552, 17, 10, 207, 552, 'Jarariq', NULL, 'Жарариқ', NULL, 'Жарарик', NULL),
(1710207554, 17, 10, 207, 554, 'Obihayot', NULL, 'Обиҳаёт', NULL, 'Обихает', NULL),
(1710207556, 17, 10, 207, 556, 'Yangikent', NULL, 'Янгикент', NULL, 'Янгикент', NULL),
(1710207558, 17, 10, 207, 558, 'Sherali', NULL, 'Шерали', NULL, 'Шерали', NULL),
(1710207562, 17, 10, 207, 562, 'Mash\'al', NULL, 'Машъал', NULL, 'Машъал', NULL),
(1710207800, 17, 10, 207, 800, 'G\'uzor tumanining qishloq fuqarolar yig\'inlari', NULL, 'Ғузор туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Гузарского района', NULL),
(1710207810, 17, 10, 207, 810, 'Bo\'ston', NULL, 'Бўстон', NULL, 'Бустан', NULL),
(1710207823, 17, 10, 207, 823, 'Guliston', NULL, 'Гулистон', NULL, 'Гулистан', NULL),
(1710207834, 17, 10, 207, 834, 'Gulshan', NULL, 'Гулшан', NULL, 'Гульшан', NULL),
(1710207842, 17, 10, 207, 842, 'Zarbdor', NULL, 'Зарбдор', NULL, 'Зарбдар', NULL),
(1710207844, 17, 10, 207, 844, 'Qorako\'l', NULL, 'Қоракўл', NULL, 'Каракуль', NULL),
(1710207846, 17, 10, 207, 846, 'Shakarbuloq', NULL, 'Шакарбулоқ', NULL, 'Шакарбулак', NULL),
(1710207857, 17, 10, 207, 857, 'Mehnatobod', NULL, 'Меҳнатобод', NULL, 'Мехнатабад', NULL),
(1710207860, 17, 10, 207, 860, 'Qo\'shtepa', NULL, 'Қўштепа', NULL, 'Куштепа', NULL),
(1710207870, 17, 10, 207, 870, 'Pachkamar', NULL, 'Пачкамар', NULL, 'Пачкамар', NULL),
(1710207875, 17, 10, 207, 875, 'Xalqabod', NULL, 'Халқабод', NULL, 'Халкабад', NULL),
(1710207880, 17, 10, 207, 880, 'Batosh', NULL, 'Батош', NULL, 'Батош', NULL),
(1710207885, 17, 10, 207, 885, 'Sherali', NULL, 'Шерали', NULL, 'Шеpали', NULL),
(1710212550, 17, 10, 212, 550, 'Dehqonobod tumanining shaharchalari', NULL, 'Деҳқонобод туманининг  шаҳарчалари', NULL, 'Городские поселки Дехканабадского района', NULL),
(1710212551, 17, 10, 212, 551, 'Karashina', NULL, 'Карашина', NULL, 'Корашина', NULL),
(1710212553, 17, 10, 212, 553, 'Dehqonobod', NULL, 'Деҳқонобод', NULL, 'Дехканабад', NULL),
(1710212558, 17, 10, 212, 558, 'Beshbuloq', NULL, 'Бешбулоқ', NULL, 'Бешбулок', NULL),
(1710212800, 17, 10, 212, 800, 'Dehqonobod tumanining qishloq fuqarolar yig\'inlari', NULL, 'Деҳқонобод туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Дехканабадского района', NULL),
(1710212804, 17, 10, 212, 804, 'Obiravon', NULL, 'Обиравон', NULL, 'Обиравон', NULL),
(1710212809, 17, 10, 212, 809, 'Oqqishloq', NULL, 'Оққишлоқ', NULL, 'Аккишлак', NULL),
(1710212810, 17, 10, 212, 810, 'O\'zbekiston', NULL, 'Ўзбекистон', NULL, 'Узбекистан', NULL),
(1710212811, 17, 10, 212, 811, 'Oqtosh', NULL, 'Оқтош', NULL, 'Акташ', NULL),
(1710212814, 17, 10, 212, 814, 'Boshchorbog\'', NULL, 'Бошчорбоғ', NULL, 'Бошчорбог', NULL),
(1710212816, 17, 10, 212, 816, 'Beshqo\'ton', NULL, 'Бешқўтон', NULL, 'Бешкутан', NULL),
(1710212822, 17, 10, 212, 822, 'Bibiqorasoch', NULL, 'Бибиқорасоч', NULL, 'Бибикарасоч', NULL),
(1710212827, 17, 10, 212, 827, 'Duob', NULL, 'Дуоб', NULL, 'Дуаб', NULL),
(1710212832, 17, 10, 212, 832, 'Qo\'rg\'ontosh', NULL, 'Қўрғонтош', NULL, 'Курганташ', NULL),
(1710212833, 17, 10, 212, 833, 'Qizilcha', NULL, 'Қизилча', NULL, 'Кизилча', NULL),
(1710212836, 17, 10, 212, 836, 'Oqirtma', NULL, 'Оқиртма', NULL, 'Окиpтма', NULL),
(1710212839, 17, 10, 212, 839, 'Bozortepa', NULL, 'Бозортепа', NULL, 'Базаpтепа', NULL),
(1710212845, 17, 10, 212, 845, 'Qirqquloch', NULL, 'Қирққулоч', NULL, 'Киpккулач', NULL),
(1710212850, 17, 10, 212, 850, 'Oqrabod', NULL, 'Оқрабод', NULL, 'Окpабод', NULL),
(1710220500, 17, 10, 220, 500, 'Qamashi tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Қамаши туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Камашинского района', NULL),
(1710220501, 17, 10, 220, 501, 'Qamashi', NULL, 'Қамаши', NULL, 'Камаши', NULL),
(1710220550, 17, 10, 220, 550, 'Qamashi tumanining shaharchalari', NULL, 'Қамаши туманининг шаҳарчалари', NULL, 'Городские поселки Камашинского района', NULL),
(1710220552, 17, 10, 220, 552, 'Balandchayla', NULL, 'Баландчайла', NULL, 'Баландчайла', NULL),
(1710220554, 17, 10, 220, 554, 'Qoratepa', NULL, 'Қоратепа', NULL, 'Коратепа', NULL),
(1710220556, 17, 10, 220, 556, 'Qiziltepa', NULL, 'Қизилтепа', NULL, 'Кызилтепа', NULL),
(1710220558, 17, 10, 220, 558, 'Sarbozor', NULL, 'Сарбозор', NULL, 'Сарбозор', NULL);
INSERT INTO `soato` (`MHOBT_cod`, `res_id`, `region_id`, `district_id`, `qfi_id`, `name_lot`, `center_lot`, `name_cyr`, `center_cyr`, `name_ru`, `center_ru`) VALUES
(1710220562, 17, 10, 220, 562, 'Badahshon', NULL, 'Бадаҳшон', NULL, 'Бадахшон', NULL),
(1710220800, 17, 10, 220, 800, 'Qamashi tumanining qishloq fuqarolar yig\'inlari', NULL, 'Қамаши туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Камашинского района', NULL),
(1710220833, 17, 10, 220, 833, 'Qorabog\'', NULL, 'Қорабоғ', NULL, 'Карабаг', NULL),
(1710220835, 17, 10, 220, 835, 'Qoratepa', NULL, 'Қоратепа', NULL, 'Каратепа', NULL),
(1710220844, 17, 10, 220, 844, 'Ko\'kbuloq', NULL, 'Кўкбулоқ', NULL, 'Кокбулак', NULL),
(1710220845, 17, 10, 220, 845, 'Qiziltepa', NULL, 'Қизилтепа', NULL, 'Кизилтепа', NULL),
(1710220847, 17, 10, 220, 847, 'Rabod', NULL, 'Рабод', NULL, 'Равот', NULL),
(1710220855, 17, 10, 220, 855, 'To\'qboy', NULL, 'Тўқбой', NULL, 'Тукбай', NULL),
(1710220866, 17, 10, 220, 866, 'Chim', NULL, 'Чим', NULL, 'Чим', NULL),
(1710220870, 17, 10, 220, 870, 'Qamay', NULL, 'Қамай', NULL, 'Камай', NULL),
(1710220875, 17, 10, 220, 875, 'Jonbo\'zsoy', NULL, 'Жонбўзсой', NULL, 'Жонбузсой', NULL),
(1710220880, 17, 10, 220, 880, 'Loyqasoy', NULL, 'Лойқасой', NULL, 'Лойкасой', NULL),
(1710220885, 17, 10, 220, 885, 'Yortepa', NULL, 'Ёртепа', NULL, 'Еpтепа', NULL),
(1710224500, 17, 10, 224, 500, 'Qarshi tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Қарши туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Каршинского района', NULL),
(1710224501, 17, 10, 224, 501, 'Beshkent', NULL, 'Бешкент', NULL, 'Бешкент', NULL),
(1710224550, 17, 10, 224, 550, 'Qarshi tumanining shaharchalari', NULL, 'Қарши туманининг  шаҳарчалари', NULL, 'Городские поселки Каршинского района', NULL),
(1710224553, 17, 10, 224, 553, 'Fayzobod', NULL, 'Файзобод', NULL, 'Файзиабад', NULL),
(1710224556, 17, 10, 224, 556, 'Saroy', NULL, 'Сарой', NULL, 'Сарай', NULL),
(1710224559, 17, 10, 224, 559, 'G\'ubdin', NULL, 'Ғубдин', NULL, 'Губдин', NULL),
(1710224563, 17, 10, 224, 563, 'Lag\'mon', NULL, 'Лағмон', NULL, 'Лагмон', NULL),
(1710224566, 17, 10, 224, 566, 'Kuchkak', NULL, 'Кучкак', NULL, 'Кучкак', NULL),
(1710224569, 17, 10, 224, 569, 'Xonobod', NULL, 'Хонобод', NULL, 'Хонабад', NULL),
(1710224573, 17, 10, 224, 573, 'Shilvi', NULL, 'Шилви', NULL, 'Шилви', NULL),
(1710224576, 17, 10, 224, 576, 'Qovchin', NULL, 'Қовчин', NULL, 'Ковчин', NULL),
(1710224579, 17, 10, 224, 579, 'Nuqrabod', NULL, 'Нуқрабод', NULL, 'Нукрабад', NULL),
(1710224583, 17, 10, 224, 583, 'Yertepa', NULL, 'Ертепа', NULL, 'Ертепа', NULL),
(1710224586, 17, 10, 224, 586, 'Navro\'z', NULL, 'Наврўз', NULL, 'Навруз', NULL),
(1710224589, 17, 10, 224, 589, 'Jumabozor', NULL, 'Жумабозор', NULL, 'Жумабозор', NULL),
(1710224593, 17, 10, 224, 593, 'Mustaqillik', NULL, 'Мустақиллик', NULL, 'Мустакиллик', NULL),
(1710224596, 17, 10, 224, 596, 'Mirmiron', NULL, 'Мирмирон', NULL, 'Мирмирон', NULL),
(1710224599, 17, 10, 224, 599, 'Yangi xayot', NULL, 'Янги хаёт', NULL, 'Янгихает', NULL),
(1710224800, 17, 10, 224, 800, 'Qarshi tumanining qishloq fuqarolar yig\'inlari', NULL, 'Қарши туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Каршинского района', NULL),
(1710224808, 17, 10, 224, 808, 'Bog\'obod', NULL, 'Боғобод', NULL, 'Багабад', NULL),
(1710224812, 17, 10, 224, 812, 'Charag\'il', NULL, 'Чарағил', NULL, 'Чарогил', NULL),
(1710224822, 17, 10, 224, 822, 'Dasht', NULL, 'Дашт', NULL, 'Дашт', NULL),
(1710224833, 17, 10, 224, 833, 'Yertepa', NULL, 'Ертепа', NULL, 'Ертепа', NULL),
(1710224840, 17, 10, 224, 840, 'Navbahor', NULL, 'Навбаҳор', NULL, 'Навбахор', NULL),
(1710224842, 17, 10, 224, 842, 'Qoratepa', NULL, 'Қоратепа', NULL, 'Каратепа', NULL),
(1710224843, 17, 10, 224, 843, 'Cho\'libo\'ston', NULL, 'Чўлибўстон', NULL, 'Чулибустан', NULL),
(1710224844, 17, 10, 224, 844, 'Kat', NULL, 'Кат', NULL, 'Кат', NULL),
(1710224847, 17, 10, 224, 847, 'Qovchin', NULL, 'Қовчин', NULL, 'Ковчин', NULL),
(1710224855, 17, 10, 224, 855, 'Chaman', NULL, 'Чаман ', NULL, 'Чаман ', NULL),
(1710224877, 17, 10, 224, 877, 'O\'zbekiston mustaqilligi', NULL, 'Ўзбекистон мустақиллиги', NULL, 'Узбекистон мустакиллиги', NULL),
(1710224880, 17, 10, 224, 880, 'Paxtakor', NULL, 'Пахтакор', NULL, 'Пахтакор', NULL),
(1710224884, 17, 10, 224, 884, 'Poshton', NULL, 'Поштон', NULL, 'Поштон', NULL),
(1710224888, 17, 10, 224, 888, 'Tallikuron', NULL, 'Талликурон', NULL, 'Талликурган', NULL),
(1710224895, 17, 10, 224, 895, 'Hilol', NULL, 'Ҳилол', NULL, 'Хилал', NULL),
(1710229500, 17, 10, 229, 500, 'Koson tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Косон туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Гоpода pайонного подчинения Касанского pайона', NULL),
(1710229501, 17, 10, 229, 501, 'Koson', NULL, 'Косон', NULL, 'Касан', NULL),
(1710229550, 17, 10, 229, 550, 'Koson tumanining shaharchalari', NULL, 'Косон туманининг  шаҳарчалари', NULL, 'Городские поселки Касанского района', NULL),
(1710229552, 17, 10, 229, 552, 'Boyg\'undi', NULL, 'Бойғунди', NULL, 'Бойгунди', NULL),
(1710229554, 17, 10, 229, 554, 'Boyterak', NULL, 'Бойтерак', NULL, 'Бойтерак', NULL),
(1710229556, 17, 10, 229, 556, 'Guvalak', NULL, 'Гувалак', NULL, 'Гувалак', NULL),
(1710229558, 17, 10, 229, 558, 'Istiqlol', NULL, 'Истиқлол', NULL, 'Истиклол', NULL),
(1710229560, 17, 10, 229, 560, 'Qo\'yi Obron', NULL, 'Қўйи Оброн', NULL, 'Куйи Оброн', NULL),
(1710229562, 17, 10, 229, 562, 'Mudin', NULL, 'Мудин', NULL, 'Мудин', NULL),
(1710229564, 17, 10, 229, 564, 'Oqtepa', NULL, 'Оқтепа', NULL, 'Октепа', NULL),
(1710229566, 17, 10, 229, 566, 'Obod', NULL, 'Обод', NULL, 'Абад', NULL),
(1710229568, 17, 10, 229, 568, 'Pudina', NULL, 'Пудина', NULL, 'Пудина', NULL),
(1710229570, 17, 10, 229, 570, 'Po\'lati', NULL, 'Пўлати', NULL, 'Пулоти', NULL),
(1710229572, 17, 10, 229, 572, 'Rahimso\'fi', NULL, 'Раҳимсўфи', NULL, 'Рахимсуфи', NULL),
(1710229574, 17, 10, 229, 574, 'Surhon', NULL, 'Сурҳон', NULL, 'Сурхон', NULL),
(1710229576, 17, 10, 229, 576, 'To\'lg\'a', NULL, 'Тўлға', NULL, 'Тулга', NULL),
(1710229578, 17, 10, 229, 578, 'Esaboy', NULL, 'Эсабой', NULL, 'Эсабой', NULL),
(1710229800, 17, 10, 229, 800, 'Koson tumanining qishloq fuqarolar yig\'inlari', NULL, 'Косон туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Касанского района', NULL),
(1710229807, 17, 10, 229, 807, 'Alachabob', NULL, 'Алачабоб', NULL, 'Алачабаб', NULL),
(1710229812, 17, 10, 229, 812, 'Rudaksoy', NULL, 'Рудаксой', NULL, 'Рудаксой', NULL),
(1710229815, 17, 10, 229, 815, 'Gulbog\'', NULL, 'Гулбоғ', NULL, 'Гульбаг', NULL),
(1710229823, 17, 10, 229, 823, 'Koson', NULL, 'Косон', NULL, 'Касан', NULL),
(1710229835, 17, 10, 229, 835, 'Do\'stlik', NULL, 'Дўстлик', NULL, 'Дустлик', NULL),
(1710229846, 17, 10, 229, 846, 'Qo\'ng\'irtog\'', NULL, 'Қўнғиртоғ', NULL, 'Кунгиртог', NULL),
(1710229860, 17, 10, 229, 860, 'Gulobod', NULL, 'Гулобод', NULL, 'Гулобод', NULL),
(1710229868, 17, 10, 229, 868, 'Istiqlol', NULL, 'Истиқлол', NULL, 'Истиклол', NULL),
(1710229871, 17, 10, 229, 871, 'Tinchlik', NULL, 'Тинчлик', NULL, 'Тинчлик', NULL),
(1710232500, 17, 10, 232, 500, 'Kitob tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Китоб туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Гоpода pайонного подчинения Китабского pайона', NULL),
(1710232501, 17, 10, 232, 501, 'Kitob', NULL, 'Китоб', NULL, 'Китаб', NULL),
(1710232550, 17, 10, 232, 550, 'Kitob tumanining shaharchalari', NULL, 'Китоб туманининг шаҳарчалари', NULL, 'Городские поселки Китабского района', NULL),
(1710232553, 17, 10, 232, 553, 'Alaqo\'yliq', NULL, 'Алақўйлиқ', NULL, 'Алакуйлик', NULL),
(1710232556, 17, 10, 232, 556, 'Bektemir', NULL, 'Бектемир', NULL, 'Бектемир', NULL),
(1710232559, 17, 10, 232, 559, 'Rus qishloq', NULL, 'Рус қишлоқ', NULL, 'Рус', NULL),
(1710232563, 17, 10, 232, 563, 'Baxtdarvozasi', NULL, 'Бахтдарвозаси', NULL, 'Бахтдарвозаси', NULL),
(1710232566, 17, 10, 232, 566, 'Beshterak', NULL, 'Бештерак', NULL, 'Бештерак', NULL),
(1710232569, 17, 10, 232, 569, 'Varganza', NULL, 'Варганза', NULL, 'Варганза', NULL),
(1710232573, 17, 10, 232, 573, 'Obikanda', NULL, 'Обиканда', NULL, 'Обиканда', NULL),
(1710232576, 17, 10, 232, 576, 'Panji', NULL, 'Панжи', NULL, 'Панжи', NULL),
(1710232579, 17, 10, 232, 579, 'Sariosiyo', NULL, 'Сариосиё', NULL, 'Сариосие', NULL),
(1710232583, 17, 10, 232, 583, 'Sevaz', NULL, 'Севаз', NULL, 'Севаз', NULL),
(1710232586, 17, 10, 232, 586, 'Xoji', NULL, 'Хожи', NULL, 'Хожи', NULL),
(1710232589, 17, 10, 232, 589, 'Yakkatut', NULL, 'Яккатут', NULL, 'Яккатут', NULL),
(1710232593, 17, 10, 232, 593, 'Yangiobod', NULL, 'Янгиобод', NULL, 'Янгиабад', NULL),
(1710232800, 17, 10, 232, 800, 'Kitob tumanining qishloq fuqarolar yig\'inlari', NULL, 'Китоб туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Китабского района', NULL),
(1710232803, 17, 10, 232, 803, 'Bektemir', NULL, 'Бектемир', NULL, 'Бектемир', NULL),
(1710232808, 17, 10, 232, 808, 'Qatorbog\'', NULL, 'Қаторбоғ', NULL, 'Катарбаг', NULL),
(1710232809, 17, 10, 232, 809, 'Qaynarbuloq', NULL, 'Қайнарбулоқ', NULL, 'Кайнарбулак', NULL),
(1710232811, 17, 10, 232, 811, 'Qo\'yioqboy', NULL, 'Қўйиоқбой', NULL, 'Куйнакбай', NULL),
(1710232833, 17, 10, 232, 833, 'Makrid', NULL, 'Макрид', NULL, 'Макрид', NULL),
(1710232855, 17, 10, 232, 855, 'Tagob', NULL, 'Тагоб', NULL, 'Тагоб', NULL),
(1710232866, 17, 10, 232, 866, 'Paxtaobod', NULL, 'Пахтаобод', NULL, 'Пахтаабад', NULL),
(1710232877, 17, 10, 232, 877, 'Sevaz', NULL, 'Севаз', NULL, 'Сиваз', NULL),
(1710232880, 17, 10, 232, 880, 'Tupchoq', NULL, 'Тупчоқ', NULL, 'Тупчак', NULL),
(1710232885, 17, 10, 232, 885, 'Bog\'bon', NULL, 'Боғбон', NULL, 'Багбан', NULL),
(1710232890, 17, 10, 232, 890, 'Beshterak', NULL, 'Бештерак', NULL, 'Бештеpак', NULL),
(1710232895, 17, 10, 232, 895, 'Jilisuv', NULL, 'Жилисув', NULL, 'Жилисув', NULL),
(1710233550, 17, 10, 233, 550, 'Mirishkor tumanining shaharchalari', NULL, 'Миришкор туманининг шаҳарчалари', NULL, 'Городские поселки Миришкорского района', NULL),
(1710233551, 17, 10, 233, 551, 'Yangi Mirishkor', NULL, 'Янги Миришкор', NULL, 'Янги Миришкор', NULL),
(1710233555, 17, 10, 233, 555, 'Jeynov', NULL, 'Жейнов', NULL, 'Жейнов', NULL),
(1710233558, 17, 10, 233, 558, 'Pomuq', NULL, 'Помуқ', NULL, 'Помук', NULL),
(1710233800, 17, 10, 233, 800, 'Mirishkor tumanining qishloq fuqarolar yig\'inlari', NULL, 'Миришкор туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Миришкорского района', NULL),
(1710233808, 17, 10, 233, 808, 'Obod', NULL, 'Обод', NULL, 'Абад', NULL),
(1710233812, 17, 10, 233, 812, 'Bo\'ston', NULL, 'Бўстон', NULL, 'Бустон', NULL),
(1710233823, 17, 10, 233, 823, 'Vori', NULL, 'Вори', NULL, 'Вори', NULL),
(1710233828, 17, 10, 233, 828, 'Guliston', NULL, 'Гулистон', NULL, 'Гулистан', NULL),
(1710233832, 17, 10, 233, 832, 'Gulshanbog\'', NULL, 'Гулшанбоғ', NULL, 'Гулшан баг', NULL),
(1710233836, 17, 10, 233, 836, 'Jeynov', NULL, 'Жейнов', NULL, 'Джейнау', NULL),
(1710233842, 17, 10, 233, 842, 'Mirishkor', NULL, 'Миришкор', NULL, 'Миришкор', NULL),
(1710233848, 17, 10, 233, 848, 'Navbahor', NULL, 'Навбаҳор', NULL, 'Навбахор', NULL),
(1710233855, 17, 10, 233, 855, 'Pomuq', NULL, 'Помуқ', NULL, 'Помук', NULL),
(1710233862, 17, 10, 233, 862, 'Chamanzor', NULL, 'Чаманзор', NULL, 'Чаманзар', NULL),
(1710233865, 17, 10, 233, 865, 'Chandir', NULL, 'Чандир', NULL, 'Чандиp', NULL),
(1710233869, 17, 10, 233, 869, 'Yangiobod', NULL, 'Янгиобод', NULL, 'Янгиабад', NULL),
(1710234500, 17, 10, 234, 500, 'Muborak tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Муборак туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Гоpода pайонного подчинения Мубаpекского pайона', NULL),
(1710234501, 17, 10, 234, 501, 'Muborak', NULL, 'Муборак', NULL, 'Мубаpек', NULL),
(1710234550, 17, 10, 234, 550, 'Muborak tumanining shaharchalari', NULL, 'Муборак туманининг шаҳарчалари', NULL, 'Городские поселки Мубарекского района', NULL),
(1710234552, 17, 10, 234, 552, 'Qarliq', NULL, 'Қарлиқ', NULL, 'Карлик', NULL),
(1710234554, 17, 10, 234, 554, 'Baxt', NULL, 'Бахт', NULL, 'Бахт', NULL),
(1710234556, 17, 10, 234, 556, 'Qoraqum', NULL, 'Қорақум', NULL, 'Каракум', NULL),
(1710234558, 17, 10, 234, 558, 'Diyonat', NULL, 'Диёнат', NULL, 'Диёнат', NULL),
(1710234562, 17, 10, 234, 562, 'Shayx', NULL, 'Шайх', NULL, 'Шайх', NULL),
(1710234800, 17, 10, 234, 800, 'Muborak tumanining qishloq fuqarolar yig\'inlari', NULL, 'Муборак туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Мубарекского района', NULL),
(1710234835, 17, 10, 234, 835, 'Qoraqum', NULL, 'Қорақум', NULL, 'Каракум', NULL),
(1710234845, 17, 10, 234, 845, 'Muborak', NULL, 'Муборак', NULL, 'Муборак', NULL),
(1710234878, 17, 10, 234, 878, 'Qarliq', NULL, 'Қарлиқ', NULL, 'Карлик', NULL),
(1710234882, 17, 10, 234, 882, 'Sariq', NULL, 'Сариқ', NULL, 'Саpик', NULL),
(1710235500, 17, 10, 235, 500, 'Nishon tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Нишон туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Нишанского района', NULL),
(1710235501, 17, 10, 235, 501, 'Yangi Nishon', NULL, 'Янги Нишон', NULL, 'Янги-Нишан', NULL),
(1710235505, 17, 10, 235, 505, 'Talimarjon', NULL, 'Талимаржон', NULL, 'Талимарджан', NULL),
(1710235550, 17, 10, 235, 550, 'Nishon tumanining shaharchalari', NULL, 'Нишон туманининг шаҳарчалари', NULL, 'Городские поселки Нишанского района', NULL),
(1710235553, 17, 10, 235, 553, 'Nuriston', NULL, 'Нуристон', NULL, 'Нуристон', NULL),
(1710235555, 17, 10, 235, 555, 'Nishon', NULL, 'Нишон', NULL, 'Нишон', NULL),
(1710235557, 17, 10, 235, 557, 'Guliston', NULL, 'Гулистон', NULL, 'Гулистан', NULL),
(1710235559, 17, 10, 235, 559, 'Oq oltin', NULL, 'Оқ олтин', NULL, 'Ак алтин', NULL),
(1710235561, 17, 10, 235, 561, 'Sardoba', NULL, 'Сардоба', NULL, 'Сардоба', NULL),
(1710235565, 17, 10, 235, 565, 'Paxtachi', NULL, 'Пахтачи', NULL, 'Пахтачи', NULL),
(1710235567, 17, 10, 235, 567, 'Oydin', NULL, 'Ойдин', NULL, 'Ойдин', NULL),
(1710235569, 17, 10, 235, 569, 'Samarqand', NULL, 'Самарқанд', NULL, 'Самарканд', NULL),
(1710235571, 17, 10, 235, 571, 'Paxtaobod', NULL, 'Пахтаобод', NULL, 'Пахтаабад', NULL),
(1710235800, 17, 10, 235, 800, 'Nishon tumanining qishloq fuqarolar yig\'inlari', NULL, 'Нишон туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Нишанского района', NULL),
(1710235804, 17, 10, 235, 804, 'Oydinlik', NULL, 'Ойдинлик', NULL, 'Ойдинлик', NULL),
(1710235807, 17, 10, 235, 807, 'Oq oltin', NULL, 'Оқ олтин', NULL, 'Акалтын', NULL),
(1710235826, 17, 10, 235, 826, 'Qirqquloch', NULL, 'Қирққулоч', NULL, 'Кирккулоч', NULL),
(1710235848, 17, 10, 235, 848, 'Navro\'z', NULL, 'Наврўз', NULL, 'Навруз', NULL),
(1710235850, 17, 10, 235, 850, 'Nishon', NULL, 'Нишон', NULL, 'Нишан', NULL),
(1710235860, 17, 10, 235, 860, 'Paxtazor', NULL, 'Пахтазор', NULL, 'Пахтазар', NULL),
(1710235874, 17, 10, 235, 874, 'Shirinobod', NULL, 'Ширинобод', NULL, 'Ширинабад', NULL),
(1710235880, 17, 10, 235, 880, 'Balxiyak', NULL, 'Балхияк', NULL, 'Балхияк', NULL),
(1710237550, 17, 10, 237, 550, 'Kasbi tumanining shaharchalari', NULL, 'Касби туманининг шаҳарчалари', NULL, 'Городские поселки Касбинского района', NULL),
(1710237551, 17, 10, 237, 551, 'Mug\'lon', NULL, 'Муғлон', NULL, 'Муглон', NULL),
(1710237554, 17, 10, 237, 554, 'Denov', NULL, 'Денов', NULL, 'Денов', NULL),
(1710237556, 17, 10, 237, 556, 'Kasbi', NULL, 'Касби', NULL, 'Касби', NULL),
(1710237558, 17, 10, 237, 558, 'Do\'stlik', NULL, 'Дўстлик', NULL, 'Дустлик', NULL),
(1710237562, 17, 10, 237, 562, 'Yangi qishloq', NULL, 'Янги қишлоқ', NULL, 'Янги кишлок', NULL),
(1710237564, 17, 10, 237, 564, 'Xo\'jakasbi', NULL, 'Хўжакасби', NULL, 'Хужа Касби', NULL),
(1710237566, 17, 10, 237, 566, 'Fazli', NULL, 'Фазли', NULL, 'Фазли', NULL),
(1710237568, 17, 10, 237, 568, 'Maymanoq', NULL, 'Майманоқ', NULL, 'Майманок', NULL),
(1710237572, 17, 10, 237, 572, 'Qatag\'an', NULL, 'Қатаған', NULL, 'Катаган', NULL),
(1710237800, 17, 10, 237, 800, 'Kasbi tumanining qishloq fuqarolar yig\'inlari', NULL, 'Касби туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Касбинского района', NULL),
(1710237822, 17, 10, 237, 822, 'Qamashi', NULL, 'Қамаши', NULL, 'Камаши', NULL),
(1710237825, 17, 10, 237, 825, 'Komilon', NULL, 'Комилон', NULL, 'Камилан', NULL),
(1710237833, 17, 10, 237, 833, 'Qatag\'on', NULL, 'Қатағон', NULL, 'Катаган', NULL),
(1710237840, 17, 10, 237, 840, 'Cho\'lquvar', NULL, 'Чўлқувар', NULL, 'Чулкувар', NULL),
(1710237855, 17, 10, 237, 855, 'Mug\'lon', NULL, 'Муғлон', NULL, 'Муглон', NULL),
(1710237866, 17, 10, 237, 866, 'Denov', NULL, 'Денов', NULL, 'Денау', NULL),
(1710237877, 17, 10, 237, 877, 'Qoraqo\'ng\'irot', NULL, 'Қорақўнғирот', NULL, 'Коракунгирот', NULL),
(1710237882, 17, 10, 237, 882, 'Yuksalish', NULL, 'Юксалиш', NULL, 'Юксалиш', NULL),
(1710237886, 17, 10, 237, 886, 'Paxtakor', NULL, 'Пахтакор', NULL, 'Пахтакор', NULL),
(1710237890, 17, 10, 237, 890, 'G\'alaba', NULL, 'Ғалаба', NULL, 'Галаба', NULL),
(1710242500, 17, 10, 242, 500, 'Chiroqchi tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Чироқчи туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Чиракчинского района', NULL),
(1710242501, 17, 10, 242, 501, 'Chiroqchi', NULL, 'Чироқчи', NULL, 'Чиракчи', NULL),
(1710242550, 17, 10, 242, 550, 'Chiroqchi tumanining shaharchalari', NULL, 'Чироқчи туманининг шаҳарчалари', NULL, 'Городские поселки Чиракчинского района', NULL),
(1710242553, 17, 10, 242, 553, 'Jar', NULL, 'Жар', NULL, 'Джар', NULL),
(1710242556, 17, 10, 242, 556, 'O\'ymovut', NULL, 'Ўймовут', NULL, 'Уймовут', NULL),
(1710242559, 17, 10, 242, 559, 'Dam', NULL, 'Дам', NULL, 'Дам', NULL),
(1710242563, 17, 10, 242, 563, 'Pakandi', NULL, 'Паканди', NULL, 'Паканди', NULL),
(1710242566, 17, 10, 242, 566, 'Paxtaobod', NULL, 'Пахтаобод', NULL, 'Пахтаобод', NULL),
(1710242569, 17, 10, 242, 569, 'Chiyal', NULL, 'Чиял', NULL, 'Чиял', NULL),
(1710242573, 17, 10, 242, 573, 'Ko\'kdala', NULL, 'Кўкдала', NULL, 'Кукдала', NULL),
(1710242576, 17, 10, 242, 576, 'Ayritom', NULL, 'Айритом', NULL, 'Айритом', NULL),
(1710242800, 17, 10, 242, 800, 'Chiroqchi tumanining qishloq fuqarolar yig\'inlari', NULL, 'Чироқчи туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Чиракчинского района', NULL),
(1710242811, 17, 10, 242, 811, 'Olmazor', NULL, 'Олмазор', NULL, 'Олмазор', NULL),
(1710242822, 17, 10, 242, 822, 'Qalqama', NULL, 'Қалқама', NULL, 'Калкама', NULL),
(1710242824, 17, 10, 242, 824, 'Ko\'kdala', NULL, 'Кўкдала', NULL, 'Кокдала', NULL),
(1710242826, 17, 10, 242, 826, 'Xumo', NULL, 'Хумо', NULL, 'Хумо', NULL),
(1710242840, 17, 10, 242, 840, 'Langar', NULL, 'Лангар', NULL, 'Лангар', NULL),
(1710242844, 17, 10, 242, 844, 'Jar', NULL, 'Жар', NULL, 'Джар', NULL),
(1710242856, 17, 10, 242, 856, 'Taraqqiyot', NULL, 'Тараққиёт', NULL, 'Тараккиёт', NULL),
(1710242872, 17, 10, 242, 872, 'Uyshun', NULL, 'Уйшун', NULL, 'Уйшун', NULL),
(1710242874, 17, 10, 242, 874, 'Nurafshon', NULL, 'Нурафшон', NULL, 'Нурафшон', NULL),
(1710242876, 17, 10, 242, 876, 'Chiyal', NULL, 'Чиял', NULL, 'Чиел', NULL),
(1710242877, 17, 10, 242, 877, 'Qumdaryo', NULL, 'Қумдарё', NULL, 'Кумдаре', NULL),
(1710242878, 17, 10, 242, 878, 'Sho\'rquduq', NULL, 'Шўрқудуқ', NULL, 'Шуркудук', NULL),
(1710242880, 17, 10, 242, 880, 'Eski Anxor', NULL, 'Эски Анхор', NULL, 'Эски Ангор', NULL),
(1710242884, 17, 10, 242, 884, 'Yangihayot', NULL, 'Янгиҳаёт', NULL, 'Янгихает', NULL),
(1710242886, 17, 10, 242, 886, 'Paxtaobod', NULL, 'Пахтаобод', NULL, 'Пахтаабад', NULL),
(1710242888, 17, 10, 242, 888, 'Dodiq', NULL, 'Додиқ', NULL, 'Додик', NULL),
(1710242890, 17, 10, 242, 890, 'Qahramon', NULL, 'Қаҳрамон', NULL, 'Кахpамон', NULL),
(1710242892, 17, 10, 242, 892, 'Uymovut', NULL, 'Уймовут', NULL, 'Уймавут', NULL),
(1710242894, 17, 10, 242, 894, 'Mirzato\'p', NULL, 'Мирзатўп', NULL, 'Миpзатуп', NULL),
(1710242896, 17, 10, 242, 896, 'Torjilg\'a', NULL, 'Торжилға', NULL, 'Тоpжилга', NULL),
(1710245550, 17, 10, 245, 550, 'Shahrisabz tumanining shaharchalari', NULL, 'Шаҳрисабз  туманининг  шаҳарчалари', NULL, 'Городские поселки Шахрисабзского района', NULL),
(1710245553, 17, 10, 245, 553, 'Miraki', NULL, 'Мираки', NULL, 'Мираки', NULL),
(1710245555, 17, 10, 245, 555, 'Qumqishloq', NULL, 'Қумқишлоқ', NULL, 'Кумкишлок', NULL),
(1710245557, 17, 10, 245, 557, 'O\'rtaqo\'rg\'on', NULL, 'Ўртақўрғон', NULL, 'Уртакургон', NULL),
(1710245561, 17, 10, 245, 561, 'Chorshanbe', NULL, 'Чоршанбе', NULL, 'Чоршанбе', NULL),
(1710245563, 17, 10, 245, 563, 'Temirchi', NULL, 'Темирчи', NULL, 'Темирчи', NULL),
(1710245565, 17, 10, 245, 565, 'Yangiqishloq', NULL, 'Янгиқишлоқ', NULL, 'Янгикишлок', NULL),
(1710245567, 17, 10, 245, 567, 'Qutchi', NULL, 'Қутчи', NULL, 'Кутчи', NULL),
(1710245569, 17, 10, 245, 569, 'Shamaton', NULL, 'Шаматон', NULL, 'Шаматон', NULL),
(1710245571, 17, 10, 245, 571, 'Ammog\'on-1', NULL, 'Аммоғон-1', NULL, 'Аммогон-1', NULL),
(1710245573, 17, 10, 245, 573, 'Qo\'shqanot', NULL, 'Қўшқанот', NULL, 'Кушканот', NULL),
(1710245575, 17, 10, 245, 575, 'Anday', NULL, 'Андай', NULL, 'Андай', NULL),
(1710245583, 17, 10, 245, 583, 'Xo\'jaxuroson', NULL, 'Хўжахуросон', NULL, 'Хужахуросон', NULL),
(1710245585, 17, 10, 245, 585, 'Keldihayot', NULL, 'Келдиҳаёт', NULL, 'Келдихает', NULL),
(1710245800, 17, 10, 245, 800, 'Shahrisabz tumanining qishloq fuqarolar yig\'inlari', NULL, 'Шаҳрисабз туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Шахрисабзского района', NULL),
(1710245802, 17, 10, 245, 802, 'Oq suv', NULL, 'Оқ сув', NULL, 'Аксу', NULL),
(1710245811, 17, 10, 245, 811, 'Do\'xchi', NULL, 'Дўхчи', NULL, 'Дукчи', NULL),
(1710245818, 17, 10, 245, 818, 'Kunchiqar', NULL, 'Кунчиқар', NULL, 'Кунчикар', NULL),
(1710245823, 17, 10, 245, 823, 'Qutchi', NULL, 'Қутчи', NULL, 'Кутчи', NULL),
(1710245835, 17, 10, 245, 835, 'Mo\'minobod', NULL, 'Мўминобод', NULL, 'Муминабад', NULL),
(1710245840, 17, 10, 245, 840, 'Namaton', NULL, 'Наматон', NULL, 'Наматан', NULL),
(1710245851, 17, 10, 245, 851, 'To\'damaydon', NULL, 'Тўдамайдон', NULL, 'Тудамайдон', NULL),
(1710245860, 17, 10, 245, 860, 'O\'zbekiston', NULL, 'Ўзбекистон', NULL, 'Узбекистан', NULL),
(1710245869, 17, 10, 245, 869, 'Hisorak', NULL, 'Ҳисорак', NULL, 'Хисарак', NULL),
(1710245872, 17, 10, 245, 872, 'Xitoy', NULL, 'Хитой', NULL, 'Хитай', NULL),
(1710245881, 17, 10, 245, 881, 'Shakarteri', NULL, 'Шакартери', NULL, 'Шакартери', NULL),
(1710245892, 17, 10, 245, 892, 'Shamaton', NULL, 'Шаматон', NULL, 'Шаматан', NULL),
(1710250500, 17, 10, 250, 500, 'Yakkabog\' tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Яккабоғ  туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Яккабагского района', NULL),
(1710250501, 17, 10, 250, 501, 'Yakkabog\'', NULL, 'Яккабоғ', NULL, 'Яккабаг', NULL),
(1710250550, 17, 10, 250, 550, 'Yakkabog\' tumanining shaharchalari', NULL, 'Яккабоғ  туманининг  шаҳарчалари', NULL, 'Городские поселки Яккабагского района', NULL),
(1710250555, 17, 10, 250, 555, 'Eski Yakkabog\'', NULL, 'Эски Яккабоғ', NULL, 'Эски Яккабаг', NULL),
(1710250557, 17, 10, 250, 557, 'Alaqarg\'a', NULL, 'Алақарға', NULL, 'Алакарга', NULL),
(1710250558, 17, 10, 250, 558, 'Alako\'ylak', NULL, 'Алакўйлак', NULL, 'Алакуйлак', NULL),
(1710250559, 17, 10, 250, 559, 'Jarqirg\'iz', NULL, 'Жарқирғиз', NULL, 'Жаркиргиз', NULL),
(1710250561, 17, 10, 250, 561, 'Qayrag\'och', NULL, 'Қайрағоч', NULL, 'Кайрагач', NULL),
(1710250563, 17, 10, 250, 563, 'Qatag\'on', NULL, 'Қатағон', NULL, 'Катагон', NULL),
(1710250565, 17, 10, 250, 565, 'Kattabog\'', NULL, 'Каттабоғ', NULL, 'Каттабог', NULL),
(1710250567, 17, 10, 250, 567, 'Madaniyat', NULL, 'Маданият', NULL, 'Маданият', NULL),
(1710250569, 17, 10, 250, 569, 'Mevazor', NULL, 'Мевазор', NULL, 'Мевазор', NULL),
(1710250571, 17, 10, 250, 571, 'Samoq', NULL, 'Самоқ', NULL, 'Самок', NULL),
(1710250573, 17, 10, 250, 573, 'Turon', NULL, 'Турон', NULL, 'Турон', NULL),
(1710250575, 17, 10, 250, 575, 'O\'z', NULL, 'Ўз', NULL, 'Уз', NULL),
(1710250577, 17, 10, 250, 577, 'Chubron', NULL, 'Чуброн', NULL, 'Чуброн', NULL),
(1710250579, 17, 10, 250, 579, 'Edilbek', NULL, 'Эдилбек', NULL, 'Эдилбек', NULL),
(1710250800, 17, 10, 250, 800, 'Yakkabog\' tumanining qishloq fuqarolar yig\'inlari', NULL, 'Яккабоғ туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Яккабагского района', NULL),
(1710250811, 17, 10, 250, 811, 'Qayrag\'och', NULL, 'Қайрағоч', NULL, 'Кайрагач', NULL),
(1710250822, 17, 10, 250, 822, 'Esat', NULL, 'Эсат', NULL, 'Эсат', NULL),
(1710250825, 17, 10, 250, 825, 'Qo\'shchinor', NULL, 'Қўшчинор', NULL, 'Кошчинар', NULL),
(1710250833, 17, 10, 250, 833, 'Qishliq', NULL, 'Қишлиқ', NULL, 'Кишлик', NULL),
(1710250844, 17, 10, 250, 844, 'Samoq', NULL, 'Самоқ', NULL, 'Самак', NULL),
(1710250855, 17, 10, 250, 855, 'Sandal', NULL, 'Сандал', NULL, 'Сандал', NULL),
(1710250858, 17, 10, 250, 858, 'O\'rta', NULL, 'Ўрта', NULL, 'Урта', NULL),
(1710250861, 17, 10, 250, 861, 'Chaydori', NULL, 'Чайдори', NULL, 'Чайдари', NULL),
(1710250866, 17, 10, 250, 866, 'Hiyobon', NULL, 'Ҳиёбон', NULL, 'Хиябан', NULL),
(1710401550, 17, 10, 401, 550, 'Qarshi shahar hokimiyatiga qarashli shaharchalar', NULL, 'Қарши  шаҳар ҳокимиятига қарашли шаҳарчалар', NULL, 'Городские поселки, подч. Каршинскому горхокимияту', NULL),
(1710401555, 17, 10, 401, 555, 'Qashqadaryo', NULL, 'Қашқадарё', NULL, 'Кашкадарья', NULL),
(1712211550, 17, 12, 211, 550, 'Konimex tumanining shaharchalari', NULL, 'Конимех  туманининг  шаҳарчалари', NULL, 'Городские поселки Канимехского района', NULL),
(1712211551, 17, 12, 211, 551, 'Konimex', NULL, 'Конимех', NULL, 'Канимех', NULL),
(1712211552, 17, 12, 211, 552, 'Balaqaraq', NULL, 'Балақарақ', NULL, 'Балакарак', NULL),
(1712211554, 17, 12, 211, 554, 'Mamiqchi', NULL, 'Мамиқчи', NULL, 'Мамикчи', NULL),
(1712211556, 17, 12, 211, 556, 'Sho\'rtepa', NULL, 'Шўртепа', NULL, 'Шуртепа', NULL),
(1712211558, 17, 12, 211, 558, 'Zafarobod', NULL, 'Зафаробод', NULL, 'Зафарабад ', NULL),
(1712211800, 17, 12, 211, 800, 'Konimex tumanining qishloq fuqarolar yig\'inlari', NULL, 'Конимех  туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Канимехского района', NULL),
(1712211811, 17, 12, 211, 811, 'Yangig\'ozg\'on', NULL, 'Янгиғозғон', NULL, 'Янгиказган', NULL),
(1712211818, 17, 12, 211, 818, 'Sarajal', NULL, 'Саражал', NULL, 'Саржал', NULL),
(1712211822, 17, 12, 211, 822, 'Chordara', NULL, 'Чордара', NULL, 'Чардара', NULL),
(1712211826, 17, 12, 211, 826, 'Karakata', NULL, 'Караката', NULL, 'Караката', NULL),
(1712211835, 17, 12, 211, 835, 'Uchtobe', NULL, 'Учтобе', NULL, 'Учтобе', NULL),
(1712211840, 17, 12, 211, 840, 'Boymurot', NULL, 'Боймурот', NULL, 'Баймуpат', NULL),
(1712211845, 17, 12, 211, 845, 'Yangiobod', NULL, 'Янгиобод', NULL, 'Янгиабад', NULL),
(1712216500, 17, 12, 216, 500, 'Qiziltepa tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Қизилтепа  туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Кызылтепинского района', NULL),
(1712216501, 17, 12, 216, 501, 'Qiziltepa', NULL, 'Қизилтепа', NULL, 'Кызылтепа', NULL),
(1712216550, 17, 12, 216, 550, 'Qiziltepa tumanining shaharchalari', NULL, 'Қизилтепа  туманининг шаҳарчалари', NULL, 'Городские поселки Кызылтепинского района', NULL),
(1712216552, 17, 12, 216, 552, 'Husbuddin', NULL, 'Ҳусбуддин', NULL, 'Хусбуддин', NULL),
(1712216554, 17, 12, 216, 554, 'Qalayn-Azizon', NULL, 'Қалайн-Азизон', NULL, 'Калъайи Азизон', NULL),
(1712216556, 17, 12, 216, 556, 'Baland G\'ardiyon', NULL, 'Баланд Ғардиён', NULL, 'Баланд гардиен', NULL),
(1712216558, 17, 12, 216, 558, 'G\'oyibon', NULL, 'Ғойибон', NULL, 'Гойибон', NULL),
(1712216560, 17, 12, 216, 560, 'Oq soch', NULL, 'Оқ соч', NULL, 'Оксоч', NULL),
(1712216562, 17, 12, 216, 562, 'Vang\'ozi', NULL, 'Ванғози', NULL, 'Вангози', NULL),
(1712216564, 17, 12, 216, 564, 'Oqmachit', NULL, 'Оқмачит', NULL, 'Окмачит', NULL),
(1712216566, 17, 12, 216, 566, 'Zarmetan', NULL, 'Зарметан', NULL, 'Зарметан', NULL),
(1712216568, 17, 12, 216, 568, 'G\'amxo\'r', NULL, 'Ғамхўр', NULL, 'Гамхур', NULL),
(1712216572, 17, 12, 216, 572, 'Uzilishkent', NULL, 'Узилишкент', NULL, 'Узилишкент', NULL),
(1712216574, 17, 12, 216, 574, 'O\'rtaqo\'rg\'on', NULL, 'Ўртақўрғон', NULL, 'Уртакургон', NULL),
(1712216576, 17, 12, 216, 576, 'Xo\'jaqo\'rg\'on', NULL, 'Хўжақўрғон', NULL, 'Хужакургон', NULL),
(1712216800, 17, 12, 216, 800, 'Qiziltepa tumanining qishloq fuqarolar yig\'inlari', NULL, 'Қизилтепа  туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Кызылтепинского района', NULL),
(1712216803, 17, 12, 216, 803, 'Oq oltin', NULL, 'Оқ олтин', NULL, 'Акалтын', NULL),
(1712216805, 17, 12, 216, 805, 'Arabon', NULL, 'Арабон', NULL, 'Арабон', NULL),
(1712216808, 17, 12, 216, 808, 'Bo\'ston', NULL, 'Бўстон', NULL, 'Бустан', NULL),
(1712216812, 17, 12, 216, 812, 'Vang\'ozi', NULL, 'Ванғози', NULL, 'Вангази', NULL),
(1712216819, 17, 12, 216, 819, 'G\'ardiyon', NULL, 'Ғардиён', NULL, 'Гардиян', NULL),
(1712216825, 17, 12, 216, 825, 'Zarmitan', NULL, 'Зармитан', NULL, 'Зармитан', NULL),
(1712216840, 17, 12, 216, 840, 'Xo\'ja-Hasan', NULL, 'Хўжа-Ҳасан', NULL, 'Ходжахасан', NULL),
(1712216850, 17, 12, 216, 850, 'Yangi hayot', NULL, 'Янги Ҳаёт', NULL, 'Янгихаят', NULL),
(1712230550, 17, 12, 230, 550, 'Navbahor tumanining shaharchalari', NULL, 'Навбаҳор  туманининг шаҳарчалари', NULL, 'Городские поселки Навбахорского района', NULL),
(1712230552, 17, 12, 230, 552, 'Kalkonota', NULL, 'Калконота', NULL, 'Калконота', NULL),
(1712230553, 17, 12, 230, 553, 'Saroy', NULL, 'Сарой', NULL, 'Сарой', NULL),
(1712230555, 17, 12, 230, 555, 'Quyi Beshrabot', NULL, 'Қуйи Бешработ', NULL, 'Куйи Бешработ', NULL),
(1712230557, 17, 12, 230, 557, 'Keskanterak', NULL, 'Кескантерак', NULL, 'Кескантерак', NULL),
(1712230559, 17, 12, 230, 559, 'Ijant', NULL, 'Ижант', NULL, 'Ижант', NULL),
(1712230800, 17, 12, 230, 800, 'Navbahor tumanining qishloq fuqarolar yig\'inlari', NULL, 'Навбаҳор  туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Навбахорского района', NULL),
(1712230805, 17, 12, 230, 805, 'Olchin', NULL, 'Олчин', NULL, 'Алчин', NULL),
(1712230808, 17, 12, 230, 808, 'Arabsaroy', NULL, 'Арабсарой', NULL, 'Арабсарай', NULL),
(1712230815, 17, 12, 230, 815, 'Keskanterak', NULL, 'Кескантерак', NULL, 'Кескантерак', NULL),
(1712230838, 17, 12, 230, 838, 'Yangi-yo\'l', NULL, 'Янги-йўл', NULL, 'Янгиюль', NULL),
(1712230855, 17, 12, 230, 855, 'Turkiston', NULL, 'Туркистон', NULL, 'Туркестан', NULL),
(1712230880, 17, 12, 230, 880, 'Yangiqo\'rg\'on', NULL, 'Янгиқўрғон', NULL, 'Янгикурган', NULL),
(1712230882, 17, 12, 230, 882, 'Beshrabot', NULL, 'Бешработ', NULL, 'Бешpабот', NULL),
(1712234550, 17, 12, 234, 550, 'Karmana tumanining shaharchalari', NULL, 'Кармана  туманининг шаҳарчалари', NULL, 'Городские поселки Карманинского района', NULL),
(1712234551, 17, 12, 234, 551, 'Karmana', NULL, 'Кармана', NULL, 'Кармана', NULL),
(1712234557, 17, 12, 234, 557, 'Malikrabot', NULL, 'Маликработ', NULL, 'Маликработ', NULL),
(1712234559, 17, 12, 234, 559, 'Paxtaobod', NULL, 'Пахтаобод', NULL, 'Пахтаабад', NULL),
(1712234561, 17, 12, 234, 561, 'Podkoron', NULL, 'Подкорон', NULL, 'Подкорон', NULL),
(1712234563, 17, 12, 234, 563, 'Kamolot', NULL, 'Камолот', NULL, 'Камолот', NULL),
(1712234565, 17, 12, 234, 565, 'Yoshlik', NULL, 'Ёшлик', NULL, 'Ешлик', NULL),
(1712234800, 17, 12, 234, 800, 'Karmana tumanining qishloq fuqarolar yig\'inlari', NULL, 'Кармана  туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Карманинского района', NULL),
(1712234802, 17, 12, 234, 802, 'Uyrot', NULL, 'Уйрот', NULL, 'Уйрат', NULL),
(1712234823, 17, 12, 234, 823, 'Do\'rmon', NULL, 'Дўрмон', NULL, 'Дорман', NULL),
(1712234845, 17, 12, 234, 845, 'Narpay', NULL, 'Нарпай', NULL, 'Нарпай', NULL),
(1712234867, 17, 12, 234, 867, 'Xazora', NULL, 'Хазора', NULL, 'Хазара', NULL),
(1712234878, 17, 12, 234, 878, 'Yangiariq', NULL, 'Янгиариқ', NULL, 'Янгиарык', NULL),
(1712234882, 17, 12, 234, 882, 'Jaloyir', NULL, 'Жалойир', NULL, 'Джалаиp', NULL),
(1712238500, 17, 12, 238, 500, 'Nurota tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Нурота  туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Нуратинского района', NULL),
(1712238501, 17, 12, 238, 501, 'Nurota', NULL, 'Нурота', NULL, 'Нурата', NULL),
(1712238550, 17, 12, 238, 550, 'Nurota tumanining shaharchalari', NULL, 'Нурота  туманининг шаҳарчалари', NULL, 'Городские поселки Нуратинского района', NULL),
(1712238555, 17, 12, 238, 555, 'Qizilcha', NULL, 'Қизилча', NULL, 'Кизилча', NULL),
(1712238557, 17, 12, 238, 557, 'Temurqovuq', NULL, 'Темурқовуқ', NULL, 'Темирковук', NULL),
(1712238558, 17, 12, 238, 558, 'Chuya', NULL, 'Чуя', NULL, 'Чуя', NULL),
(1712238559, 17, 12, 238, 559, 'Yangibino', NULL, 'Янгибино', NULL, 'Янгибино', NULL),
(1712238800, 17, 12, 238, 800, 'Nurota tumanining qishloq fuqarolar yig\'inlari', NULL, 'Нурота  туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Нуратинского района', NULL),
(1712238820, 17, 12, 238, 820, 'Dehibaland', NULL, 'Деҳибаланд', NULL, 'Дебаланд', NULL),
(1712238825, 17, 12, 238, 825, 'Gum', NULL, 'Гум', NULL, 'Гум', NULL),
(1712238835, 17, 12, 238, 835, 'G\'ozg\'on', NULL, 'Ғозғон', NULL, 'Гозгон', NULL),
(1712238840, 17, 12, 238, 840, 'Qizilcha', NULL, 'Қизилча', NULL, 'Кызылча', NULL),
(1712238860, 17, 12, 238, 860, 'Nurota', NULL, 'Нурота', NULL, 'Нурата', NULL),
(1712238877, 17, 12, 238, 877, 'Sentob', NULL, 'Сентоб', NULL, 'Сентяб', NULL),
(1712238890, 17, 12, 238, 890, 'Chuya', NULL, 'Чуя', NULL, 'Чуя', NULL),
(1712244550, 17, 12, 244, 550, 'Tomdi tumanining shaharchalari', NULL, 'Томди туманининг шаҳарчалари', NULL, 'Городские поселки Тамдынского района', NULL),
(1712244551, 17, 12, 244, 551, 'Tomdibuloq', NULL, 'Томдибулоқ', NULL, 'Томдибулок', NULL),
(1712244800, 17, 12, 244, 800, 'Tomdi tumanining qishloq fuqarolar yig\'inlari', NULL, 'Томди  туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Тамдынского района', NULL),
(1712244808, 17, 12, 244, 808, 'Oktau', NULL, 'Октау', NULL, 'Актау', NULL),
(1712244812, 17, 12, 244, 812, 'Ayaqquduq', NULL, 'Аяққудуқ', NULL, 'Аякудук', NULL),
(1712244830, 17, 12, 244, 830, 'Suketti', NULL, 'Сукетти', NULL, 'Сукитти', NULL),
(1712244835, 17, 12, 244, 835, 'Keregetau', NULL, 'Керегетау', NULL, 'Керегетау', NULL),
(1712244837, 17, 12, 244, 837, 'Keriz', NULL, 'Кериз', NULL, 'Кериз', NULL),
(1712244840, 17, 12, 244, 840, 'Tomdibuloq', NULL, 'Томдибулоқ', NULL, 'Тамдыбулак', NULL),
(1712244850, 17, 12, 244, 850, 'Shiyeli', NULL, 'Шиели', NULL, 'Шиели', NULL),
(1712248500, 17, 12, 248, 500, 'Uchquduq tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Учқудуқ  туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Учкудукского района', NULL),
(1712248501, 17, 12, 248, 501, 'Uchquduq', NULL, 'Учқудуқ', NULL, 'Учкудук', NULL),
(1712248550, 17, 12, 248, 550, 'Uchquduq tumanining shaharchalari', NULL, 'Учқудуқ  туманининг  шаҳарчалари', NULL, 'Городские поселки Учкудукского района', NULL),
(1712248555, 17, 12, 248, 555, 'Shalxar', NULL, 'Шалхар', NULL, 'Шалкар', NULL),
(1712248800, 17, 12, 248, 800, 'Uchquduq tumanining qishloq fuqarolar yig\'inlari', NULL, 'Учқудуқ  туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Учкудукского района', NULL),
(1712248805, 17, 12, 248, 805, 'Ko\'kayaz', NULL, 'Кўкаяз', NULL, 'Кукаяз', NULL),
(1712248808, 17, 12, 248, 808, 'Altintov', NULL, 'Алтинтов', NULL, 'Алтинтов', NULL),
(1712248813, 17, 12, 248, 813, 'Bozdun', NULL, 'Боздун', NULL, 'Буздун', NULL),
(1712248826, 17, 12, 248, 826, 'Mingbuloq', NULL, 'Мингбулоқ', NULL, 'Мингбулак', NULL),
(1712248844, 17, 12, 248, 844, 'Uzunquduq', NULL, 'Узунқудуқ', NULL, 'Узункудук', NULL),
(1712251500, 17, 12, 251, 500, 'Xatirchi tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Хатирчи туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Гоpода pайонного подч. Хатыpчинского pайона', NULL),
(1712251501, 17, 12, 251, 501, 'Yangirabod', NULL, 'Янгирабод', NULL, 'Янгиpабод', NULL),
(1712251550, 17, 12, 251, 550, 'Xatirchi tumanining shaharchalari', NULL, 'Хатирчи туманининг шаҳарчалари', NULL, 'Городские поселки Хатырчинского района', NULL),
(1712251558, 17, 12, 251, 558, 'Langar', NULL, 'Лангар', NULL, 'Лянгар', NULL),
(1712251562, 17, 12, 251, 562, 'Jaloyir', NULL, 'Жалойир', NULL, 'Джалойир', NULL),
(1712251564, 17, 12, 251, 564, 'Qo\'shchinor', NULL, 'Қўшчинор', NULL, 'Кушчинор', NULL),
(1712251566, 17, 12, 251, 566, 'Polvontepa', NULL, 'Полвонтепа', NULL, 'Полвонтепа', NULL),
(1712251568, 17, 12, 251, 568, 'Qo\'rg\'on', NULL, 'Қўрғон', NULL, 'Кургон', NULL),
(1712251570, 17, 12, 251, 570, 'Tasmachi', NULL, 'Тасмачи', NULL, 'Тасмачи', NULL),
(1712251573, 17, 12, 251, 573, 'Bog\'ishamol', NULL, 'Боғишамол', NULL, 'Богишамол', NULL),
(1712251575, 17, 12, 251, 575, 'G\'alabek', NULL, 'Ғалабек', NULL, 'Галабек', NULL),
(1712251577, 17, 12, 251, 577, 'Paxtakor', NULL, 'Пахтакор', NULL, 'Пахтакор', NULL),
(1712251579, 17, 12, 251, 579, 'Turkman', NULL, 'Туркман', NULL, 'Туркман', NULL),
(1712251581, 17, 12, 251, 581, 'Yangi qurilish', NULL, 'Янги қурилиш', NULL, 'Янги курилиш', NULL),
(1712251800, 17, 12, 251, 800, 'Xatirchi tumanining qishloq fuqarolar yig\'inlari', NULL, 'Хатирчи туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Хатырчинского района', NULL),
(1712251807, 17, 12, 251, 807, 'Sahovat', NULL, 'Саҳоват', NULL, 'Саховат', NULL),
(1712251812, 17, 12, 251, 812, 'Olchinobod', NULL, 'Олчинобод', NULL, 'Алчинабад', NULL),
(1712251819, 17, 12, 251, 819, 'O\'zbekiston', NULL, 'Ўзбекистон', NULL, 'Узбекистон', NULL),
(1712251824, 17, 12, 251, 824, 'Bog\'chakalon', NULL, 'Боғчакалон', NULL, 'Бахчакалан', NULL),
(1712251835, 17, 12, 251, 835, 'Xonaqa', NULL, 'Хонақа', NULL, 'Ханака', NULL),
(1712251840, 17, 12, 251, 840, 'Qoracha', NULL, 'Қорача', NULL, 'Каpача', NULL),
(1712251851, 17, 12, 251, 851, 'Pulkan shoir', NULL, 'Пулкан шоир', NULL, 'им. Пулкан шаира', NULL),
(1712251865, 17, 12, 251, 865, 'Yangirabod', NULL, 'Янгирабод', NULL, 'Янгирабод', NULL),
(1712251878, 17, 12, 251, 878, 'Ko\'ksaroy', NULL, 'Кўксарой', NULL, 'Куксарой', NULL),
(1712401550, 17, 12, 401, 550, 'Navoiy shahar hokimiyatiga qarashli shaharchalar', NULL, 'Навоий  шаҳар ҳокимиятига қарашли шаҳарчалар', NULL, 'Городские поселки, подч. Навоийскому горхокимияту', NULL),
(1712401564, 17, 12, 401, 564, 'Tinchlik', NULL, 'Тинчлик', NULL, 'Тинчлик', NULL),
(1712408550, 17, 12, 408, 550, 'Zarafshon shahar hokimiyatiga qarashli shaharchalar', NULL, 'Зарафшон шаҳар ҳокимиятига қарашли шаҳарчалар', NULL, 'Городские поселки, подч. Зарафшанскому горхок-ту', NULL),
(1712408556, 17, 12, 408, 556, 'Muruntau', NULL, 'Мурунтау', NULL, 'Мурунтау', NULL),
(1714204550, 17, 14, 204, 550, 'Mingbuloq tumanining shaharchalari', NULL, 'Мингбулоқ туманининг шаҳарчалари', NULL, 'Городские поселки Мингбулакского района', NULL),
(1714204551, 17, 14, 204, 551, 'Jo\'masho\'y', NULL, 'Жўмашўй', NULL, 'Джумашуй', NULL),
(1714204552, 17, 14, 204, 552, 'Go\'rtepa', NULL, 'Гўртепа', NULL, 'Гуртепа', NULL),
(1714204553, 17, 14, 204, 553, 'Dovduq', NULL, 'Довдуқ', NULL, 'Довдук', NULL),
(1714204555, 17, 14, 204, 555, 'O\'zgarish', NULL, 'Ўзгариш', NULL, 'Узгариш', NULL),
(1714204556, 17, 14, 204, 556, 'Mehnatobod', NULL, 'Меҳнатобод', NULL, 'Мехнатабад', NULL),
(1714204557, 17, 14, 204, 557, 'Madyarovul', NULL, 'Мадяровул', NULL, 'Мадяровул', NULL),
(1714204559, 17, 14, 204, 559, 'Kugolikul', NULL, 'Куголикул', NULL, 'Куголикул', NULL),
(1714204800, 17, 14, 204, 800, 'Mingbuloq tumanining qishloq fuqarolar yig\'inlari', NULL, 'Мингбулоқ туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Мингбулакского района', NULL),
(1714204805, 17, 14, 204, 805, 'Bo\'ston', NULL, 'Бўстон', NULL, 'Бустан', NULL),
(1714204810, 17, 14, 204, 810, 'Gulbog\'', NULL, 'Гулбоғ', NULL, 'Гульбаг', NULL),
(1714204820, 17, 14, 204, 820, 'Go\'rtepa', NULL, 'Гўртепа', NULL, 'Гуртепа', NULL),
(1714204822, 17, 14, 204, 822, 'Dovduq', NULL, 'Довдуқ', NULL, 'Довдук', NULL),
(1714204828, 17, 14, 204, 828, 'Oltinko\'l', NULL, 'Олтинкўл', NULL, 'Алтынкуль', NULL),
(1714204830, 17, 14, 204, 830, 'Mehnatobod', NULL, 'Меҳнатобод', NULL, 'Мехнатабад', NULL),
(1714204840, 17, 14, 204, 840, 'Momoxon', NULL, 'Момохон', NULL, 'Момохан', NULL),
(1714207500, 17, 14, 207, 500, 'Kosonsoy tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Косонсой туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Касансайского района', NULL),
(1714207501, 17, 14, 207, 501, 'Kosonsoy', NULL, 'Косонсой', NULL, 'Касансай', NULL),
(1714207550, 17, 14, 207, 550, 'Kosonsoy tumanining shaharchalari', NULL, 'Косонсой туманининг шаҳарчалари', NULL, 'Городские поселки Касансайского района', NULL),
(1714207552, 17, 14, 207, 552, 'Bog\'ishamol', NULL, 'Боғишамол', NULL, 'Богишамол', NULL),
(1714207554, 17, 14, 207, 554, 'Istiqlol', NULL, 'Истиқлол', NULL, 'Истиклол', NULL),
(1714207556, 17, 14, 207, 556, 'Koson', NULL, 'Косон', NULL, 'Косон', NULL),
(1714207558, 17, 14, 207, 558, 'Ququmboy', NULL, 'Қуқумбой', NULL, 'Кукумбой', NULL),
(1714207561, 17, 14, 207, 561, 'Ozod', NULL, 'Озод', NULL, 'Озод', NULL),
(1714207562, 17, 14, 207, 562, 'Tergachi', NULL, 'Тергачи', NULL, 'Тергачи', NULL),
(1714207564, 17, 14, 207, 564, 'Chindavul', NULL, 'Чиндавул', NULL, 'Чиндовул', NULL),
(1714207566, 17, 14, 207, 566, 'Chust ko\'cha', NULL, 'Чуст кўча', NULL, 'Чуст куча', NULL),
(1714207568, 17, 14, 207, 568, 'Yangiyo\'l', NULL, 'Янгийўл', NULL, 'Янгийул', NULL),
(1714207569, 17, 14, 207, 569, 'Yangi shahar', NULL, 'Янги шаҳар', NULL, 'Янгишахар', NULL),
(1714207800, 17, 14, 207, 800, 'Kosonsoy tumanining qishloq fuqarolar yig\'inlari', NULL, 'Косонсой туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Касансайского района', NULL),
(1714207806, 17, 14, 207, 806, 'Qorasuv', NULL, 'Қорасув', NULL, 'Карасув', NULL),
(1714207808, 17, 14, 207, 808, 'Shirin', NULL, 'Ширин', NULL, 'Шиpин', NULL),
(1714207810, 17, 14, 207, 810, 'Ququmboy', NULL, 'Қуқумбой', NULL, 'Кукумбай', NULL),
(1714207820, 17, 14, 207, 820, 'Koson', NULL, 'Косон', NULL, 'Касан', NULL),
(1714207827, 17, 14, 207, 827, 'Yoshlik', NULL, 'Ёшлик', NULL, 'Ешлик', NULL),
(1714207830, 17, 14, 207, 830, 'Tergachi', NULL, 'Тергачи', NULL, 'Тергачи', NULL),
(1714207837, 17, 14, 207, 837, 'Chindovul', NULL, 'Чиндовул', NULL, 'Чиндавал', NULL),
(1714212550, 17, 14, 212, 550, 'Namangan tumanining shaharchalari', NULL, 'Наманган туманининг шаҳарчалари', NULL, 'Городские поселки Наманганского района', NULL),
(1714212551, 17, 14, 212, 551, 'Toshbuloq', NULL, 'Тошбулоқ', NULL, 'Ташбулак', NULL),
(1714212553, 17, 14, 212, 553, 'Navbahor', NULL, 'Навбаҳор', NULL, 'Навбахор', NULL),
(1714212561, 17, 14, 212, 561, 'Qumqo\'rg\'on', NULL, 'Қумқўрғон', NULL, 'Кумкургон', NULL),
(1714212563, 17, 14, 212, 563, 'Sho\'rqo\'rg\'on', NULL, 'Шўрқўрғон', NULL, 'Шуркургон', NULL),
(1714212565, 17, 14, 212, 565, 'Mirishkor', NULL, 'Миришкор', NULL, 'Миришкор', NULL),
(1714212800, 17, 14, 212, 800, 'Namangan tumanining qishloq fuqarolar yig\'inlari', NULL, 'Наманган туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Наманганского района', NULL),
(1714212811, 17, 14, 212, 811, 'Nurafshon', NULL, 'Нурафшон', NULL, 'Нурафшон', NULL),
(1714212822, 17, 14, 212, 822, 'Istiqlol', NULL, 'Истиқлол', NULL, 'Истиклол', NULL),
(1714212833, 17, 14, 212, 833, 'Navbahor', NULL, 'Навбаҳор', NULL, 'Навбахор', NULL),
(1714212855, 17, 14, 212, 855, 'Qumqo\'rg\'on', NULL, 'Қумқўрғон', NULL, 'Кумкурган', NULL),
(1714212859, 17, 14, 212, 859, 'Mirishkor', NULL, 'Миришкор', NULL, 'Миришкор', NULL),
(1714212866, 17, 14, 212, 866, 'Tepaqo\'rg\'on', NULL, 'Тепақўрғон', NULL, 'Тепакурган', NULL),
(1714212877, 17, 14, 212, 877, 'O\'zbekiston', NULL, 'Ўзбекистон', NULL, 'Узбекистан', NULL),
(1714212880, 17, 14, 212, 880, 'Xonabod', NULL, 'Хонабод', NULL, 'Ханабад', NULL),
(1714212885, 17, 14, 212, 885, 'Bog\'ishamol', NULL, 'Боғишамол', NULL, 'Багишамал', NULL),
(1714212890, 17, 14, 212, 890, 'Sho\'rqishloq', NULL, 'Шўрқишлоқ', NULL, 'Шуркишлак', NULL),
(1714216500, 17, 14, 216, 500, 'Norin tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Норин туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Нарынского района', NULL),
(1714216501, 17, 14, 216, 501, 'Xaqqulobod', NULL, 'Хаққулобод', NULL, 'Хаккулабад', NULL),
(1714216550, 17, 14, 216, 550, 'Norin tumanining shaharchalari', NULL, 'Норин туманининг шаҳарчалари', NULL, 'Городские поселки Нарынского района', NULL),
(1714216552, 17, 14, 216, 552, 'Qorateri', NULL, 'Қоратери', NULL, 'Коратери', NULL),
(1714216554, 17, 14, 216, 554, 'Marg\'uzar', NULL, 'Марғузар', NULL, 'Маргузар', NULL),
(1714216556, 17, 14, 216, 556, 'Norinkapa', NULL, 'Норинкапа', NULL, 'Норинкапа', NULL),
(1714216558, 17, 14, 216, 558, 'Pastki cho\'ja', NULL, 'Пастки чўжа', NULL, 'Пастки Чужа', NULL),
(1714216561, 17, 14, 216, 561, 'Uchtepa', NULL, 'Учтепа', NULL, 'Учтепа', NULL),
(1714216562, 17, 14, 216, 562, 'Xo\'jaobod', NULL, 'Хўжаобод', NULL, 'Хужаабад', NULL),
(1714216564, 17, 14, 216, 564, 'Chambil', NULL, 'Чамбил', NULL, 'Чамбил', NULL),
(1714216566, 17, 14, 216, 566, 'Sho\'ra', NULL, 'Шўра', NULL, 'Шуро', NULL),
(1714216800, 17, 14, 216, 800, 'Norin tumanining qishloq fuqarolar yig\'inlari', NULL, 'Норин туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Нарынского района', NULL),
(1714216815, 17, 14, 216, 815, 'Xo\'jaobod', NULL, 'Хўжаобод', NULL, 'Хужаабад', NULL),
(1714216820, 17, 14, 216, 820, 'Marg\'izor', NULL, 'Марғизор', NULL, 'Маргузаp', NULL),
(1714216826, 17, 14, 216, 826, 'Norinkapa', NULL, 'Норинкапа', NULL, 'Нарынкапа', NULL),
(1714216837, 17, 14, 216, 837, 'Paxtaqishloq', NULL, 'Пахтақишлоқ', NULL, 'Пахтакишлак', NULL),
(1714216848, 17, 14, 216, 848, 'To\'da', NULL, 'Тўда', NULL, 'Туда', NULL),
(1714216856, 17, 14, 216, 856, 'Qo\'rg\'ontepa', NULL, 'Қўрғонтепа', NULL, 'Кургонтепа', NULL),
(1714216859, 17, 14, 216, 859, 'Uchtepa', NULL, 'Учтепа', NULL, 'Учтепа', NULL),
(1714216862, 17, 14, 216, 862, 'Toshloq', NULL, 'Тошлоқ', NULL, 'Ташлак', NULL),
(1714219500, 17, 14, 219, 500, 'Pop tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Поп туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Папского района', NULL),
(1714219501, 17, 14, 219, 501, 'Pop', NULL, 'Поп', NULL, 'Пап', NULL),
(1714219550, 17, 14, 219, 550, 'Pop tumanining shaharchalari', NULL, 'Поп туманининг шаҳарчалари', NULL, 'Городские поселки Папского района', NULL),
(1714219554, 17, 14, 219, 554, 'Oltinkon', NULL, 'Олтинкон', NULL, 'Алтынкан', NULL),
(1714219555, 17, 14, 219, 555, 'Navbahor', NULL, 'Навбаҳор', NULL, 'Навбахор', NULL),
(1714219557, 17, 14, 219, 557, 'Uyg\'ursoy', NULL, 'Уйғурсой', NULL, 'Уйгурсай', NULL),
(1714219560, 17, 14, 219, 560, 'Xalqobod', NULL, 'Халқобод', NULL, 'Халкабад', NULL),
(1714219565, 17, 14, 219, 565, 'Chorkesar', NULL, 'Чоркесар', NULL, 'Чаркесар', NULL),
(1714219567, 17, 14, 219, 567, 'Uyg\'ur', NULL, 'Уйғур', NULL, 'Уйгур', NULL),
(1714219569, 17, 14, 219, 569, 'Yangi Xo\'jaobod', NULL, 'Янги Хўжаобод', NULL, 'Янги Хужаабад', NULL),
(1714219571, 17, 14, 219, 571, 'Sang', NULL, 'Санг', NULL, 'Санг', NULL),
(1714219573, 17, 14, 219, 573, 'G\'urumsaroy', NULL, 'Ғурумсарой', NULL, 'Гурумсарай', NULL),
(1714219575, 17, 14, 219, 575, 'Qandig\'on', NULL, 'Қандиғон', NULL, 'Кандигон', NULL),
(1714219576, 17, 14, 219, 576, 'Pungon', NULL, 'Пунгон', NULL, 'Пунгон', NULL),
(1714219578, 17, 14, 219, 578, 'Chodak', NULL, 'Чодак', NULL, 'Чодак', NULL),
(1714219581, 17, 14, 219, 581, 'Madaniyat', NULL, 'Маданият', NULL, 'Маданият', NULL),
(1714219583, 17, 14, 219, 583, 'Qurg\'onobod', NULL, 'Қурғонобод', NULL, 'Кургонобод', NULL),
(1714219585, 17, 14, 219, 585, 'Chorkesar-2', NULL, 'Чоркесар-2', NULL, 'Чаркесар-2', NULL),
(1714219800, 17, 14, 219, 800, 'Pop tumanining qishloq fuqarolar yig\'inlari', NULL, 'Поп туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Папского района', NULL),
(1714219809, 17, 14, 219, 809, 'Madaniyat', NULL, 'Маданият', NULL, 'Маданият', NULL),
(1714219811, 17, 14, 219, 811, 'Sirdaryo', NULL, 'Сирдарё', NULL, 'Сирдарё', NULL),
(1714219822, 17, 14, 219, 822, 'Nayman', NULL, 'Найман', NULL, 'Найман', NULL),
(1714219833, 17, 14, 219, 833, 'Pop', NULL, 'Поп', NULL, 'Пап', NULL),
(1714219834, 17, 14, 219, 834, 'Paxtaobod', NULL, 'Пахтаобод', NULL, 'Пахтаабад', NULL),
(1714219844, 17, 14, 219, 844, 'Uyg\'ur', NULL, 'Уйғур', NULL, 'Уйгур', NULL),
(1714219855, 17, 14, 219, 855, 'G\'urumsaroy', NULL, 'Ғурумсарой', NULL, 'Гурумсарой', NULL),
(1714219866, 17, 14, 219, 866, 'Chodak', NULL, 'Чодак', NULL, 'Чадак', NULL),
(1714219877, 17, 14, 219, 877, 'Yangi hayot', NULL, 'Янги ҳаёт', NULL, 'Янгихаят', NULL),
(1714219885, 17, 14, 219, 885, 'Pungon', NULL, 'Пунгон', NULL, 'Пунган', NULL),
(1714224500, 17, 14, 224, 500, 'To\'raqo\'rg\'on tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Тўрақўрғон туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Туракурганского района', NULL),
(1714224501, 17, 14, 224, 501, 'To\'raqo\'rg\'on', NULL, 'Тўрақўрғон', NULL, 'Туракурган', NULL),
(1714224550, 17, 14, 224, 550, 'To\'raqo\'rg\'on tumanining shaharchalari', NULL, 'Тўрақўрғон туманининг шаҳарчалари', NULL, 'Городские поселки Туракурганского района', NULL),
(1714224554, 17, 14, 224, 554, 'Oqtosh', NULL, 'Оқтош', NULL, 'Акташ', NULL),
(1714224556, 17, 14, 224, 556, 'Yettikon', NULL, 'Еттикон', NULL, 'Еттикан', NULL),
(1714224558, 17, 14, 224, 558, 'Yandama', NULL, 'Яндама', NULL, 'Яндама', NULL),
(1714224561, 17, 14, 224, 561, 'Axsi', NULL, 'Ахси', NULL, 'Ахси', NULL),
(1714224563, 17, 14, 224, 563, 'Kalvak', NULL, 'Калвак', NULL, 'Колвак', NULL),
(1714224565, 17, 14, 224, 565, 'Mozorko\'xna', NULL, 'Мозоркўхна', NULL, 'Мизаркухна', NULL),
(1714224567, 17, 14, 224, 567, 'Buramatut', NULL, 'Бураматут', NULL, 'Бураматут', NULL),
(1714224569, 17, 14, 224, 569, 'Shaxand', NULL, 'Шаханд', NULL, 'Шахант', NULL),
(1714224571, 17, 14, 224, 571, 'Olchin', NULL, 'Олчин', NULL, 'Олчин', NULL),
(1714224575, 17, 14, 224, 575, 'Saroy', NULL, 'Сарой', NULL, 'Сарой', NULL),
(1714224577, 17, 14, 224, 577, 'Katagon', NULL, 'Катагон', NULL, 'Катагон', NULL),
(1714224579, 17, 14, 224, 579, 'Kichikqurama', NULL, 'Кичикқурама', NULL, 'Кичиккурама', NULL),
(1714224581, 17, 14, 224, 581, 'Namdon', NULL, 'Намдон', NULL, 'Намдон', NULL),
(1714224800, 17, 14, 224, 800, 'To\'raqo\'rg\'on tumanining qishloq fuqarolar yig\'inlari', NULL, 'Тўрақўрғон туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Туракурганского района', NULL),
(1714224809, 17, 14, 224, 809, 'Axsi', NULL, 'Ахси', NULL, 'Ахси', NULL),
(1714224812, 17, 14, 224, 812, 'Buramatut', NULL, 'Бураматут', NULL, 'Бураматут', NULL),
(1714224824, 17, 14, 224, 824, 'Katagansaroy', NULL, 'Катагансарой', NULL, 'Катагансаpай', NULL),
(1714224835, 17, 14, 224, 835, 'Sayram', NULL, 'Сайрам', NULL, 'Сайрам', NULL);
INSERT INTO `soato` (`MHOBT_cod`, `res_id`, `region_id`, `district_id`, `qfi_id`, `name_lot`, `center_lot`, `name_cyr`, `center_cyr`, `name_ru`, `center_ru`) VALUES
(1714224846, 17, 14, 224, 846, 'Yandama', NULL, 'Яндама', NULL, 'Яндама', NULL),
(1714224850, 17, 14, 224, 850, 'Xo\'jand', NULL, 'Хўжанд', NULL, 'Ходжанд', NULL),
(1714224857, 17, 14, 224, 857, 'Shaxand', NULL, 'Шаханд', NULL, 'Шаханд', NULL),
(1714224864, 17, 14, 224, 864, 'Yortepa', NULL, 'Ёртепа', NULL, 'Яртепа', NULL),
(1714229550, 17, 14, 229, 550, 'Uychi tumanining shaharchalari', NULL, 'Уйчи туманининг шаҳарчалари', NULL, 'Городские поселки Уйчинского района', NULL),
(1714229551, 17, 14, 229, 551, 'Uychi', NULL, 'Уйчи', NULL, 'Уйчи', NULL),
(1714229555, 17, 14, 229, 555, 'O\'nxayat', NULL, 'Ўнхаят', NULL, 'Унхаят', NULL),
(1714229557, 17, 14, 229, 557, 'Birlashgan', NULL, 'Бирлашган', NULL, 'Бирлашган', NULL),
(1714229559, 17, 14, 229, 559, 'Fayziobod', NULL, 'Файзиобод', NULL, 'Файзиобод', NULL),
(1714229561, 17, 14, 229, 561, 'Churtuk', NULL, 'Чуртук', NULL, 'Чуртук', NULL),
(1714229563, 17, 14, 229, 563, 'Axsi', NULL, 'Ахси', NULL, 'Ахси', NULL),
(1714229565, 17, 14, 229, 565, 'Jiydakapa', NULL, 'Жийдакапа', NULL, 'Джийдакапа', NULL),
(1714229567, 17, 14, 229, 567, 'Kichik toshloq', NULL, 'Кичик тошлоқ', NULL, 'Кичик тошлок', NULL),
(1714229569, 17, 14, 229, 569, 'Mashad', NULL, 'Машад', NULL, 'Машад', NULL),
(1714229573, 17, 14, 229, 573, 'Soku', NULL, 'Соку', NULL, 'Соку', NULL),
(1714229575, 17, 14, 229, 575, 'Boyog\'on', NULL, 'Боёғон', NULL, 'Буеган', NULL),
(1714229577, 17, 14, 229, 577, 'G\'ayrat', NULL, 'Ғайрат', NULL, 'Гайрат', NULL),
(1714229579, 17, 14, 229, 579, 'Ziyokor', NULL, 'Зиёкор', NULL, 'Зиекор', NULL),
(1714229800, 17, 14, 229, 800, 'Uychi tumanining qishloq fuqarolar yig\'inlari', NULL, 'Уйчи туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Уйчинского района', NULL),
(1714229808, 17, 14, 229, 808, 'G\'ayrat', NULL, 'Ғайрат', NULL, 'Гайрат', NULL),
(1714229811, 17, 14, 229, 811, 'Jiydakapa', NULL, 'Жийдакапа', NULL, 'Джидакапа', NULL),
(1714229815, 17, 14, 229, 815, 'Birlashgan', NULL, 'Бирлашган', NULL, 'Бирлашган', NULL),
(1714229822, 17, 14, 229, 822, 'Teshiktosh', NULL, 'Тешиктош', NULL, 'Тешиктош', NULL),
(1714229833, 17, 14, 229, 833, 'Uychi', NULL, 'Уйчи', NULL, 'Уйчи', NULL),
(1714229844, 17, 14, 229, 844, 'Mashad', NULL, 'Машад', NULL, 'Машад', NULL),
(1714229855, 17, 14, 229, 855, 'Yorkatay', NULL, 'Ёркатай', NULL, 'Яркатай', NULL),
(1714229866, 17, 14, 229, 866, 'Yorqo\'rg\'on', NULL, 'Ёрқўрғон', NULL, 'Яркурган', NULL),
(1714234500, 17, 14, 234, 500, 'Uchqo\'rg\'on tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Учқўрғон туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Учкурганского района', NULL),
(1714234501, 17, 14, 234, 501, 'Uchqo\'rg\'on', NULL, 'Учқўрғон', NULL, 'Учкуpган', NULL),
(1714234550, 17, 14, 234, 550, 'Uchqo\'rg\'on tumanining shaharchalari', NULL, 'Учқўрғон туманининг шаҳарчалари', NULL, 'Городские поселки Учкурганского района', NULL),
(1714234552, 17, 14, 234, 552, 'Qayqi', NULL, 'Қайқи', NULL, 'Кайки', NULL),
(1714234554, 17, 14, 234, 554, 'Qo\'g\'ay', NULL, 'Қўғай', NULL, 'Кугай', NULL),
(1714234556, 17, 14, 234, 556, 'Uchyog\'och', NULL, 'Учёғоч', NULL, 'Учагач', NULL),
(1714234558, 17, 14, 234, 558, 'Yangiobod', NULL, 'Янгиобод', NULL, 'Янгиабад', NULL),
(1714234800, 17, 14, 234, 800, 'Uchqo\'rg\'on tumanining qishloq fuqarolar yig\'inlari', NULL, 'Учқўрғон туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Учкурганского района', NULL),
(1714234811, 17, 14, 234, 811, 'Qayqi', NULL, 'Қайқи', NULL, 'Кайки', NULL),
(1714234822, 17, 14, 234, 822, 'Baxt', NULL, 'Бахт', NULL, 'Бахт', NULL),
(1714234833, 17, 14, 234, 833, 'Qo\'g\'ay-o\'lmas', NULL, 'Қўғай-ўлмас', NULL, 'Кугайульмас', NULL),
(1714234844, 17, 14, 234, 844, 'Qo\'g\'ay', NULL, 'Қўғай', NULL, 'Кугай', NULL),
(1714234851, 17, 14, 234, 851, 'O\'zbekiston', NULL, 'Ўзбекистон', NULL, 'Узбекистан', NULL),
(1714234861, 17, 14, 234, 861, 'Yangiobod', NULL, 'Янгиобод', NULL, 'Янгиабад', NULL),
(1714234863, 17, 14, 234, 863, 'Yangi yor', NULL, 'Янги ёр', NULL, 'Янгиер', NULL),
(1714234870, 17, 14, 234, 870, 'Yashiq', NULL, 'Яшиқ', NULL, 'Яшик', NULL),
(1714236500, 17, 14, 236, 500, 'Chortoq tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Чортоқ  туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Чартакского района', NULL),
(1714236501, 17, 14, 236, 501, 'Chortoq', NULL, 'Чортоқ', NULL, 'Чаpтак', NULL),
(1714236550, 17, 14, 236, 550, 'Chortoq tumanining shaharchalari', NULL, 'Чортоқ  туманининг  шаҳарчалари', NULL, 'Городские поселки Чартакского района', NULL),
(1714236552, 17, 14, 236, 552, 'Muchum', NULL, 'Мучум', NULL, 'Мучум', NULL),
(1714236554, 17, 14, 236, 554, 'Koroskon', NULL, 'Короскон', NULL, 'Караскан', NULL),
(1714236556, 17, 14, 236, 556, 'Ko\'shan', NULL, 'Кўшан', NULL, 'Кушан', NULL),
(1714236558, 17, 14, 236, 558, 'Ayqiron', NULL, 'Айқирон', NULL, 'Айкирон', NULL),
(1714236560, 17, 14, 236, 560, 'Alixon', NULL, 'Алихон', NULL, 'Алихон', NULL),
(1714236562, 17, 14, 236, 562, 'Pastki Peshqo\'rg\'on', NULL, 'Пастки Пешқўрғон', NULL, 'Пастки Пешкургон', NULL),
(1714236564, 17, 14, 236, 564, 'Yuqori Peshqo\'rg\'on', NULL, 'Юқори Пешқўрғон', NULL, 'Юкори Пешкургон', NULL),
(1714236566, 17, 14, 236, 566, 'Ora ariq', NULL, 'Ора ариқ', NULL, 'Ораарык', NULL),
(1714236568, 17, 14, 236, 568, 'Baliqli ko\'l', NULL, 'Балиқли кўл', NULL, 'Баликкул', NULL),
(1714236572, 17, 14, 236, 572, 'Xazratishox', NULL, 'Хазратишох', NULL, 'Хазратишох', NULL),
(1714236800, 17, 14, 236, 800, 'Chortoq tumanining qishloq fuqarolar yig\'inlari', NULL, 'Чортоқ  туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Чартакского района', NULL),
(1714236803, 17, 14, 236, 803, 'Ayqiron', NULL, 'Айқирон', NULL, 'Айкиран', NULL),
(1714236805, 17, 14, 236, 805, 'Alixon', NULL, 'Алихон', NULL, 'Алихан', NULL),
(1714236807, 17, 14, 236, 807, 'Bog\'iston', NULL, 'Боғистон', NULL, 'Багистан', NULL),
(1714236809, 17, 14, 236, 809, 'Tinchlik', NULL, 'Тинчлик', NULL, 'Тинчлик', NULL),
(1714236815, 17, 14, 236, 815, 'Karaskan', NULL, 'Караскан', NULL, 'Караскан', NULL),
(1714236820, 17, 14, 236, 820, 'Muchum', NULL, 'Мучум', NULL, 'Мучум', NULL),
(1714236826, 17, 14, 236, 826, 'Peshqo\'rg\'on', NULL, 'Пешқўрғон', NULL, 'Пешкурган', NULL),
(1714236853, 17, 14, 236, 853, 'Xazratishox', NULL, 'Хазратишох', NULL, 'Хазратишо', NULL),
(1714236856, 17, 14, 236, 856, 'Saroy', NULL, 'Сарой', NULL, 'Сарай', NULL),
(1714237500, 17, 14, 237, 500, 'Chust tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Чуст  туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Чустского района', NULL),
(1714237501, 17, 14, 237, 501, 'Chust', NULL, 'Чуст', NULL, 'Чуст', NULL),
(1714237550, 17, 14, 237, 550, 'Chust tumanining shaharchalari', NULL, 'Чуст туманининг  шаҳарчалари', NULL, 'Городские поселки Чустского района', NULL),
(1714237552, 17, 14, 237, 552, 'Olmos', NULL, 'Олмос', NULL, 'Олмос', NULL),
(1714237554, 17, 14, 237, 554, 'Axcha', NULL, 'Ахча', NULL, 'Ахча', NULL),
(1714237556, 17, 14, 237, 556, 'Sarimsoqtepa', NULL, 'Саримсоқтепа', NULL, 'Саримсоктепа', NULL),
(1714237558, 17, 14, 237, 558, 'Varzik', NULL, 'Варзик', NULL, 'Варзик', NULL),
(1714237560, 17, 14, 237, 560, 'Qoraqo\'rg\'on', NULL, 'Қорақўрғон', NULL, 'Коракургон', NULL),
(1714237562, 17, 14, 237, 562, 'G\'ova', NULL, 'Ғова', NULL, 'Гова', NULL),
(1714237564, 17, 14, 237, 564, 'Karkidon', NULL, 'Каркидон', NULL, 'Каркидон', NULL),
(1714237566, 17, 14, 237, 566, 'Karnon', NULL, 'Карнон', NULL, 'Карнон', NULL),
(1714237568, 17, 14, 237, 568, 'Yorqishloq', NULL, 'Ёрқишлоқ', NULL, 'Еркишлок', NULL),
(1714237570, 17, 14, 237, 570, 'Shoyon', NULL, 'Шоён', NULL, 'Шаен', NULL),
(1714237572, 17, 14, 237, 572, 'Xisorak', NULL, 'Хисорак', NULL, 'Хисорак', NULL),
(1714237800, 17, 14, 237, 800, 'Chust tumanining qishloq fuqarolar yig\'inlari', NULL, 'Чуст туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Чустского района', NULL),
(1714237803, 17, 14, 237, 803, 'Og\'asaray', NULL, 'Оғасарай', NULL, 'Огасарай', NULL),
(1714237805, 17, 14, 237, 805, 'Olmos', NULL, 'Олмос', NULL, 'Алмас', NULL),
(1714237807, 17, 14, 237, 807, 'Axcha', NULL, 'Ахча', NULL, 'Ахча', NULL),
(1714237812, 17, 14, 237, 812, 'Varzik', NULL, 'Варзик', NULL, 'Варзик', NULL),
(1714237823, 17, 14, 237, 823, 'G\'ova', NULL, 'Ғова', NULL, 'Гова', NULL),
(1714237834, 17, 14, 237, 834, 'Karkidon', NULL, 'Каркидон', NULL, 'Каркидон', NULL),
(1714237848, 17, 14, 237, 848, 'Xisorak', NULL, 'Хисорак', NULL, 'Хисарак', NULL),
(1714237859, 17, 14, 237, 859, 'Baymoq', NULL, 'Баймоқ', NULL, 'Баймак', NULL),
(1714237870, 17, 14, 237, 870, 'Sho\'rkent', NULL, 'Шўркент', NULL, 'Шуркент', NULL),
(1714237875, 17, 14, 237, 875, 'Karnon', NULL, 'Карнон', NULL, 'Карнан', NULL),
(1714237880, 17, 14, 237, 880, 'Shoyon', NULL, 'Шоён', NULL, 'Шаян', NULL),
(1714242550, 17, 14, 242, 550, 'Yangiqo\'rg\'on tumanining shaharchalari', NULL, 'Янгиқўрғон туманининг  шаҳарчалари', NULL, 'Городские поселки Янгикурганского района', NULL),
(1714242551, 17, 14, 242, 551, 'Yangiqo\'rg\'on', NULL, 'Янгиқўрғон', NULL, 'Янгикурган', NULL),
(1714242553, 17, 14, 242, 553, 'Bekobod', NULL, 'Бекобод', NULL, 'Бекобод', NULL),
(1714242555, 17, 14, 242, 555, 'G\'ovazon', NULL, 'Ғовазон', NULL, 'Говазон', NULL),
(1714242557, 17, 14, 242, 557, 'Zarkent', NULL, 'Заркент', NULL, 'Заркент', NULL),
(1714242559, 17, 14, 242, 559, 'Iskavot', NULL, 'Искавот', NULL, 'Искавот', NULL),
(1714242561, 17, 14, 242, 561, 'Kalisho', NULL, 'Калишо', NULL, 'Калишох', NULL),
(1714242563, 17, 14, 242, 563, 'Qizil qiyoq', NULL, 'Қизил қиёқ', NULL, 'Кизилкиек', NULL),
(1714242565, 17, 14, 242, 565, 'Qorayong\'oq', NULL, 'Қораёнғоқ', NULL, 'Кораенгок', NULL),
(1714242567, 17, 14, 242, 567, 'Qorapolvon', NULL, 'Қораполвон', NULL, 'Кораполвон', NULL),
(1714242569, 17, 14, 242, 569, 'Qorachasho\'rkent', NULL, 'Қорачашўркент', NULL, 'Корачашуркент', NULL),
(1714242571, 17, 14, 242, 571, 'Ko\'kyor', NULL, 'Кўкёр', NULL, 'Кукер', NULL),
(1714242573, 17, 14, 242, 573, 'Navkent', NULL, 'Навкент', NULL, 'Навкент', NULL),
(1714242575, 17, 14, 242, 575, 'Nanay', NULL, 'Нанай', NULL, 'Нанай', NULL),
(1714242577, 17, 14, 242, 577, 'Poromon', NULL, 'Поромон', NULL, 'Парамон', NULL),
(1714242579, 17, 14, 242, 579, 'Rovot', NULL, 'Ровот', NULL, 'Ровут', NULL),
(1714242581, 17, 14, 242, 581, 'Sangiston', NULL, 'Сангистон', NULL, 'Сангистон', NULL),
(1714242583, 17, 14, 242, 583, 'Salmon', NULL, 'Салмон', NULL, 'Солман', NULL),
(1714242585, 17, 14, 242, 585, 'Xo\'jasho\'rkent', NULL, 'Хўжашўркент', NULL, 'Хужашуркент', NULL),
(1714242587, 17, 14, 242, 587, 'Yumaloqtepa', NULL, 'Юмалоқтепа', NULL, 'Юмалок тепа', NULL),
(1714242800, 17, 14, 242, 800, 'Yangiqo\'rg\'on tumanining qishloq fuqarolar yig\'inlari', NULL, 'Янгиқўрғон туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Янгикурганского района', NULL),
(1714242810, 17, 14, 242, 810, 'Bekobod', NULL, 'Бекобод', NULL, 'Бекабад', NULL),
(1714242813, 17, 14, 242, 813, 'Birlashkan', NULL, 'Бирлашкан', NULL, 'Бирлашкан', NULL),
(1714242824, 17, 14, 242, 824, 'Zarbdor', NULL, 'Зарбдор', NULL, 'Зарбдор', NULL),
(1714242830, 17, 14, 242, 830, 'Zarkent', NULL, 'Заркент', NULL, 'Заркент', NULL),
(1714242840, 17, 14, 242, 840, 'Qorapolvon', NULL, 'Қораполвон', NULL, 'Карапалван', NULL),
(1714242846, 17, 14, 242, 846, 'Sharq yulduzi', NULL, 'Шарқ юлдузи', NULL, 'Шарк юлдузи', NULL),
(1714242859, 17, 14, 242, 859, 'Nanay', NULL, 'Нанай', NULL, 'Нанай', NULL),
(1714242862, 17, 14, 242, 862, 'Navkent', NULL, 'Навкент', NULL, 'Новкент', NULL),
(1714242865, 17, 14, 242, 865, 'Poromon', NULL, 'Поромон', NULL, 'Парамон', NULL),
(1714242871, 17, 14, 242, 871, 'Istiqlol', NULL, 'Истиқлол', NULL, 'Истиклол', NULL),
(1714242875, 17, 14, 242, 875, 'Navro\'zobod', NULL, 'Наврўзобод', NULL, 'Наврузабад', NULL),
(1714401360, 17, 14, 401, 360, 'Namangan shahrining tumanlari', NULL, 'Наманган шаҳрининг туманлари', NULL, 'Районы города Наманган', NULL),
(1714401365, 17, 14, 401, 365, 'Davlatobod tumani', NULL, 'Давлатобод тумани', NULL, 'Давлатободский район', NULL),
(1714401367, 17, 14, 401, 367, 'Yangi Namangan tumani', NULL, 'Янги Наманган тумани', NULL, 'Янги Наманганский район', NULL),
(1718203550, 17, 18, 203, 550, 'Oqdaryo tumanining shaharchalari', NULL, 'Оқдарё туманининг шаҳарчалари', NULL, 'Городские поселки Акдарьинского района', NULL),
(1718203551, 17, 18, 203, 551, 'Loyish', NULL, 'Лойиш', NULL, 'Лаиш', NULL),
(1718203555, 17, 18, 203, 555, 'Dahbed', NULL, 'Даҳбед', NULL, 'Дахбед', NULL),
(1718203557, 17, 18, 203, 557, 'Avazali', NULL, 'Авазали', NULL, 'Авазали', NULL),
(1718203559, 17, 18, 203, 559, 'Bolta', NULL, 'Болта', NULL, 'Болта', NULL),
(1718203561, 17, 18, 203, 561, 'Qirqdarxon', NULL, 'Қирқдархон', NULL, 'Киркдархон', NULL),
(1718203563, 17, 18, 203, 563, 'Kumushkent', NULL, 'Кумушкент', NULL, 'Кумушкент', NULL),
(1718203565, 17, 18, 203, 565, 'Oytamg\'ali', NULL, 'Ойтамғали', NULL, 'Ойтамгали', NULL),
(1718203567, 17, 18, 203, 567, 'Oqdaryo', NULL, 'Оқдарё', NULL, 'Окдаре', NULL),
(1718203569, 17, 18, 203, 569, 'Yangiqo\'rg\'on', NULL, 'Янгиқўрғон', NULL, 'Янгикургон', NULL),
(1718203571, 17, 18, 203, 571, 'Yangiobod', NULL, 'Янгиобод', NULL, 'Янгиабад', NULL),
(1718203800, 17, 18, 203, 800, 'Oqdaryo tumanining qishloq fuqarolar yig\'inlari', NULL, 'Оқдарё туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Акдарьинского района', NULL),
(1718203816, 17, 18, 203, 816, 'Zarafshon', NULL, 'Зарафшон', NULL, 'Зарафшан', NULL),
(1718203820, 17, 18, 203, 820, 'Qorateri', NULL, 'Қоратери', NULL, 'Каратери', NULL),
(1718203822, 17, 18, 203, 822, 'A.Navoiy', NULL, 'А.Навоий', NULL, 'Навои', NULL),
(1718203833, 17, 18, 203, 833, 'Primkent', NULL, 'Примкент', NULL, 'Примкент', NULL),
(1718203844, 17, 18, 203, 844, 'Yangikent', NULL, 'Янгикент', NULL, 'Янгикент', NULL),
(1718203855, 17, 18, 203, 855, 'Yangiqo\'rg\'on', NULL, 'Янгиқўрғон', NULL, 'Янгикурган', NULL),
(1718206500, 17, 18, 206, 500, 'Bulung\'ur tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Булунғур туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Булунгурского района', NULL),
(1718206501, 17, 18, 206, 501, 'Bulung\'ur', NULL, 'Булунғур', NULL, 'Булунгур', NULL),
(1718206550, 17, 18, 206, 550, 'Bulung\'ur tumanining shaharchalari', NULL, 'Булунғур туманининг шаҳарчалари', NULL, 'Городские поселки Булунгурского района', NULL),
(1718206553, 17, 18, 206, 553, 'Kildon', NULL, 'Килдон', NULL, 'Килдон', NULL),
(1718206556, 17, 18, 206, 556, 'Soxibkor', NULL, 'Сохибкор', NULL, 'Сохибкор', NULL),
(1718206559, 17, 18, 206, 559, 'Bog\'bon', NULL, 'Боғбон', NULL, 'Богбон', NULL),
(1718206800, 17, 18, 206, 800, 'Bulung\'ur tumanining qishloq fuqarolar yig\'inlari', NULL, 'Булунғур туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Булунгурского района', NULL),
(1718206811, 17, 18, 206, 811, 'Beshqo\'ton', NULL, 'Бешқўтон', NULL, 'Бешкутан', NULL),
(1718206840, 17, 18, 206, 840, 'Kildon', NULL, 'Килдон', NULL, 'Кильдан', NULL),
(1718206845, 17, 18, 206, 845, 'Kulchabiy', NULL, 'Кулчабий', NULL, 'Кулчабий', NULL),
(1718206850, 17, 18, 206, 850, 'O\'rtabuloq', NULL, 'Ўртабулоқ', NULL, 'Уpтабулак', NULL),
(1718206856, 17, 18, 206, 856, 'Navoiy nomli', NULL, 'Навоий номли', NULL, 'им. Навои', NULL),
(1718206867, 17, 18, 206, 867, 'Soxibkor', NULL, 'Сохибкор', NULL, 'Сахибкор', NULL),
(1718206878, 17, 18, 206, 878, 'F.Yo\'ldoshev nomli', NULL, 'Ф.Йўлдошев номли', NULL, 'им. Ф. Юлдашева', NULL),
(1718209500, 17, 18, 209, 500, 'Jomboy tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Жомбой туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Джамбайского района', NULL),
(1718209501, 17, 18, 209, 501, 'Jomboy', NULL, 'Жомбой', NULL, 'Джамбай', NULL),
(1718209550, 17, 18, 209, 550, 'Jomboy tumanining shaharchalari', NULL, 'Жомбой туманининг шаҳарчалари', NULL, 'Городские поселки Джамбайского района', NULL),
(1718209554, 17, 18, 209, 554, 'Dehqonobod', NULL, 'Деҳқонобод', NULL, 'Дехконабад', NULL),
(1718209558, 17, 18, 209, 558, 'Eski Jomboy', NULL, 'Эски Жомбой', NULL, 'Эски Джомбой', NULL),
(1718209564, 17, 18, 209, 564, 'Xo\'ja', NULL, 'Хўжа', NULL, 'Хужа', NULL),
(1718209568, 17, 18, 209, 568, 'G\'azira', NULL, 'Ғазира', NULL, 'Газира', NULL),
(1718209574, 17, 18, 209, 574, 'Kattaqishloq', NULL, 'Каттақишлоқ', NULL, 'Катта кишлак', NULL),
(1718209800, 17, 18, 209, 800, 'Jomboy tumanining qishloq fuqarolar yig\'inlari', NULL, 'Жомбой туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Джамбайского района', NULL),
(1718209820, 17, 18, 209, 820, 'Dehqonobod', NULL, 'Деҳқонобод', NULL, 'Дехканабад', NULL),
(1718209822, 17, 18, 209, 822, 'Jomboy', NULL, 'Жомбой', NULL, 'Джамбай', NULL),
(1718209833, 17, 18, 209, 833, 'Juriyat', NULL, 'Журият', NULL, 'Джурият', NULL),
(1718209844, 17, 18, 209, 844, 'Qangli', NULL, 'Қангли', NULL, 'Кангли', NULL),
(1718209848, 17, 18, 209, 848, 'Qoramuyin', NULL, 'Қорамуйин', NULL, 'Карамуюн', NULL),
(1718209855, 17, 18, 209, 855, 'Qo\'ng\'irot', NULL, 'Қўнғирот', NULL, 'Кунград', NULL),
(1718209866, 17, 18, 209, 866, 'Xolvoyi', NULL, 'Холвойи', NULL, 'Холвай', NULL),
(1718209870, 17, 18, 209, 870, 'Sherqo\'rg\'on', NULL, 'Шерқўрғон', NULL, 'Шеркурган', NULL),
(1718212500, 17, 18, 212, 500, 'Ishtixon tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Иштихон  туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Иштыханского района', NULL),
(1718212501, 17, 18, 212, 501, 'Ishtixon', NULL, 'Иштихон', NULL, 'Иштыхан', NULL),
(1718212550, 17, 18, 212, 550, 'Ishtixon tumanining shaharchalari', NULL, 'Иштихон  туманининг шаҳарчалари', NULL, 'Городские поселки Иштыханского района', NULL),
(1718212555, 17, 18, 212, 555, 'Mitan', NULL, 'Митан', NULL, 'Митан', NULL),
(1718212557, 17, 18, 212, 557, 'Azamat', NULL, 'Азамат', NULL, 'Азамат', NULL),
(1718212559, 17, 18, 212, 559, 'Damariq', NULL, 'Дамариқ', NULL, 'Дамарик', NULL),
(1718212561, 17, 18, 212, 561, 'Bahrin', NULL, 'Баҳрин', NULL, 'Бахрин', NULL),
(1718212563, 17, 18, 212, 563, 'Qirqyigit', NULL, 'Қирқйигит', NULL, 'Киркйигит', NULL),
(1718212565, 17, 18, 212, 565, 'Odil', NULL, 'Одил', NULL, 'Одил', NULL),
(1718212567, 17, 18, 212, 567, 'Sug\'ot', NULL, 'Суғот', NULL, 'Сугот', NULL),
(1718212569, 17, 18, 212, 569, 'Xalqobod', NULL, 'Халқобод', NULL, 'Халкабад', NULL),
(1718212571, 17, 18, 212, 571, 'Shayxislom', NULL, 'Шайхислом', NULL, 'Шайхислом', NULL),
(1718212573, 17, 18, 212, 573, 'Sheyxlar', NULL, 'Шейхлар', NULL, 'Шейхлар', NULL),
(1718212575, 17, 18, 212, 575, 'Yangikent', NULL, 'Янгикент', NULL, 'Янгикент', NULL),
(1718212577, 17, 18, 212, 577, 'Yangirabot', NULL, 'Янгиработ', NULL, 'Янгиработ', NULL),
(1718212800, 17, 18, 212, 800, 'Ishtixon tumanining qishloq fuqarolar yig\'inlari', NULL, 'Иштихон  туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Иштыханского района', NULL),
(1718212803, 17, 18, 212, 803, 'Azamat', NULL, 'Азамат', NULL, 'Азамат', NULL),
(1718212818, 17, 18, 212, 818, 'Zarband', NULL, 'Зарбанд', NULL, 'Зарбанд', NULL),
(1718212824, 17, 18, 212, 824, 'Qurli', NULL, 'Қурли', NULL, 'Курли', NULL),
(1718212844, 17, 18, 212, 844, 'Chordara', NULL, 'Чордара', NULL, 'Чардара', NULL),
(1718212855, 17, 18, 212, 855, 'Ravot', NULL, 'Равот', NULL, 'Рават', NULL),
(1718212866, 17, 18, 212, 866, 'O\'rtaqishloq', NULL, 'Ўртақишлоқ', NULL, 'Уртакишлак', NULL),
(1718212877, 17, 18, 212, 877, 'Haqiqat', NULL, 'Ҳақиқат', NULL, 'Хакикат', NULL),
(1718212879, 17, 18, 212, 879, 'Halqabod', NULL, 'Ҳалқабод', NULL, 'Халкабад', NULL),
(1718212888, 17, 18, 212, 888, 'Fayziobod', NULL, 'Файзиобод', NULL, 'Файзиабад', NULL),
(1718215550, 17, 18, 215, 550, 'Kattaqo\'rg\'on tumanining shaharchalari', NULL, 'Каттақўрғон туманининг шаҳарчалари', NULL, 'Городские поселки Каттакурганского района', NULL),
(1718215551, 17, 18, 215, 551, 'Payshanba', NULL, 'Пайшанба', NULL, 'Пайшанба', NULL),
(1718215554, 17, 18, 215, 554, 'Suv xovuzi', NULL, 'Сув ховузи', NULL, 'Сув ховузи ', NULL),
(1718215558, 17, 18, 215, 558, 'Mundiyon', NULL, 'Мундиён', NULL, 'Мундиен', NULL),
(1718215564, 17, 18, 215, 564, 'Polvontepa', NULL, 'Полвонтепа', NULL, 'Полвонтепа', NULL),
(1718215568, 17, 18, 215, 568, 'Qoradaryo', NULL, 'Қорадарё', NULL, 'Карадарья', NULL),
(1718215574, 17, 18, 215, 574, 'Vayrat', NULL, 'Вайрат', NULL, 'Войрот', NULL),
(1718215578, 17, 18, 215, 578, 'Yangiqo\'rg\'oncha', NULL, 'Янгиқўрғонча', NULL, 'Янгикургонча', NULL),
(1718215584, 17, 18, 215, 584, 'Kattaming', NULL, 'Каттаминг', NULL, 'Каттаминг', NULL),
(1718215800, 17, 18, 215, 800, 'Kattaqo\'rg\'on tumanining qishloq fuqarolar yig\'inlari', NULL, 'Каттақўрғон туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Каттакурганского района', NULL),
(1718215811, 17, 18, 215, 811, 'Girdiqo\'rg\'on', NULL, 'Гирдиқўрғон', NULL, 'Гирдыкурган', NULL),
(1718215815, 17, 18, 215, 815, 'Yangiqo\'rg\'oncha', NULL, 'Янгиқўрғонча', NULL, 'Янгикуpганча', NULL),
(1718215818, 17, 18, 215, 818, 'Omonboy', NULL, 'Омонбой', NULL, 'Аманбай', NULL),
(1718215822, 17, 18, 215, 822, 'Durbesh', NULL, 'Дурбеш', NULL, 'Дурбеш', NULL),
(1718215833, 17, 18, 215, 833, 'Kattako\'rpa', NULL, 'Каттакўрпа', NULL, 'Каттакурпа', NULL),
(1718215837, 17, 18, 215, 837, 'Kattaming', NULL, 'Каттаминг', NULL, 'Каттаминг', NULL),
(1718215845, 17, 18, 215, 845, 'Kichikmundiyon', NULL, 'Кичикмундиён', NULL, 'Кичикмундиян', NULL),
(1718215850, 17, 18, 215, 850, 'Moybuloq', NULL, 'Мойбулоқ', NULL, 'Майбулак', NULL),
(1718215867, 17, 18, 215, 867, 'Saroyqo\'rg\'on', NULL, 'Саройқўрғон', NULL, 'Сарайкурган', NULL),
(1718215889, 17, 18, 215, 889, 'Jumaboy', NULL, 'Жумабой', NULL, 'Джумабай', NULL),
(1718215895, 17, 18, 215, 895, 'Qo\'shtepa', NULL, 'Қўштепа', NULL, 'Куштепа', NULL),
(1718216550, 17, 18, 216, 550, 'Qo\'shrabot tumanining shaharchalari', NULL, 'Қўшработ туманининг шаҳарчалари', NULL, 'Городские поселки Кушрабатского района', NULL),
(1718216551, 17, 18, 216, 551, 'Qo\'shrabot', NULL, 'Қўшработ', NULL, 'Кушрабад', NULL),
(1718216555, 17, 18, 216, 555, 'Zarkent', NULL, 'Заркент', NULL, 'Заркент', NULL),
(1718216800, 17, 18, 216, 800, 'Qo\'shrabot tumanining qishloq fuqarolar yig\'inlari', NULL, 'Қўшработ туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Кошрабадского района', NULL),
(1718216802, 17, 18, 216, 802, 'Oqtepa', NULL, 'Оқтепа', NULL, 'Актепа', NULL),
(1718216805, 17, 18, 216, 805, 'Oxunboboyev nomli', NULL, 'Охунбобоев номли', NULL, 'им. Ахунбабаева', NULL),
(1718216810, 17, 18, 216, 810, 'Jush', NULL, 'Жуш', NULL, 'Джуш', NULL),
(1718216814, 17, 18, 216, 814, 'Zarmitan', NULL, 'Зармитан', NULL, 'Зармитан', NULL),
(1718216820, 17, 18, 216, 820, 'Qo\'shrabot', NULL, 'Қўшработ', NULL, 'Кошрабад', NULL),
(1718216825, 17, 18, 216, 825, 'Pichat', NULL, 'Пичат', NULL, 'Пичат', NULL),
(1718216830, 17, 18, 216, 830, 'Urgandji', NULL, 'Урганджи', NULL, 'Уpганджи', NULL),
(1718218500, 17, 18, 218, 500, 'Narpay tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Нарпай туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Нарпайского района', NULL),
(1718218501, 17, 18, 218, 501, 'Oqtosh', NULL, 'Оқтош', NULL, 'Акташ', NULL),
(1718218550, 17, 18, 218, 550, 'Narpay tumanining shaharchalari', NULL, 'Нарпай туманининг шаҳарчалари', NULL, 'Городские поселки Нарпайского района', NULL),
(1718218554, 17, 18, 218, 554, 'Mirbozor', NULL, 'Мирбозор', NULL, 'Мирбазар', NULL),
(1718218558, 17, 18, 218, 558, 'Guliston', NULL, 'Гулистон', NULL, 'Гулистон', NULL),
(1718218564, 17, 18, 218, 564, 'Qo\'yi Charxin', NULL, 'Қўйи Чархин', NULL, 'Куйи Чархин', NULL),
(1718218800, 17, 18, 218, 800, 'Narpay tumanining qishloq fuqarolar yig\'inlari', NULL, 'Нарпай туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Нарпайского района', NULL),
(1718218811, 17, 18, 218, 811, 'Oltio\'g\'il', NULL, 'Олтиўғил', NULL, 'Алтыугил', NULL),
(1718218819, 17, 18, 218, 819, 'Islom Shoir', NULL, 'Ислом Шоир', NULL, 'им. Ислома Шоира', NULL),
(1718218822, 17, 18, 218, 822, 'Qorako\'l', NULL, 'Қоракўл', NULL, 'Каракуль', NULL),
(1718218826, 17, 18, 218, 826, 'Kosogoron', NULL, 'Косогорон', NULL, 'Косагаpан', NULL),
(1718218835, 17, 18, 218, 835, 'Qadim', NULL, 'Қадим', NULL, 'Кадим', NULL),
(1718218846, 17, 18, 218, 846, 'Chaqar', NULL, 'Чақар', NULL, 'Чакаp', NULL),
(1718218870, 17, 18, 218, 870, 'Balandqo\'rg\'on', NULL, 'Баландқўрғон', NULL, 'Баландкурган', NULL),
(1718218872, 17, 18, 218, 872, 'Yangirabod', NULL, 'Янгирабод', NULL, 'Янгирабад', NULL),
(1718218875, 17, 18, 218, 875, 'Qorasiyrak', NULL, 'Қорасийрак', NULL, 'Каpасиpак', NULL),
(1718224500, 17, 18, 224, 500, 'Payariq tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Паяриқ туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Гоpода pайонного подчинения Пайаpыкского pайона', NULL),
(1718224501, 17, 18, 224, 501, 'Payariq', NULL, 'Паяриқ', NULL, 'Пайаpык', NULL),
(1718224502, 17, 18, 224, 502, 'Chelak', NULL, 'Челак', NULL, 'Челек', NULL),
(1718224550, 17, 18, 224, 550, 'Payariq tumanining shaharchalari', NULL, 'Паяриқ туманининг  шаҳарчалари', NULL, 'Городские поселки Пайарыкского района', NULL),
(1718224552, 17, 18, 224, 552, 'Tomoyrat', NULL, 'Томойрат', NULL, 'Томойрот', NULL),
(1718224554, 17, 18, 224, 554, 'Qorasuv', NULL, 'Қорасув', NULL, 'Карасув', NULL),
(1718224556, 17, 18, 224, 556, 'Ko\'ksaroy', NULL, 'Кўксарой', NULL, 'Куксарой', NULL),
(1718224558, 17, 18, 224, 558, 'G\'ujumsoy', NULL, 'Ғужумсой', NULL, 'Гужумсой', NULL),
(1718224562, 17, 18, 224, 562, 'Xo\'ja Ismoil', NULL, 'Хўжа Исмоил', NULL, 'Хужа Исмоил', NULL),
(1718224564, 17, 18, 224, 564, 'Tupolos', NULL, 'Туполос', NULL, 'Туполос', NULL),
(1718224566, 17, 18, 224, 566, 'Oqqo\'rg\'on', NULL, 'Оққўрғон', NULL, 'Оккургон', NULL),
(1718224568, 17, 18, 224, 568, 'Do\'stlarobod', NULL, 'Дўстларобод', NULL, 'Дустларабад', NULL),
(1718224572, 17, 18, 224, 572, 'Do\'stlik', NULL, 'Дўстлик', NULL, 'Дустлик', NULL),
(1718224800, 17, 18, 224, 800, 'Payariq tumanining qishloq fuqarolar yig\'inlari', NULL, 'Паяриқ туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Пайарыкского района', NULL),
(1718224805, 17, 18, 224, 805, 'Oqqo\'rg\'on', NULL, 'Оққўрғон', NULL, 'Аккурган', NULL),
(1718224810, 17, 18, 224, 810, 'Oytamg\'ali', NULL, 'Ойтамғали', NULL, 'Айтамгали', NULL),
(1718224815, 17, 18, 224, 815, 'Birlashgan', NULL, 'Бирлашган', NULL, 'Бирлашган', NULL),
(1718224825, 17, 18, 224, 825, 'O\'rta saydov', NULL, 'Ўрта сайдов', NULL, 'Уртасайдов', NULL),
(1718224838, 17, 18, 224, 838, 'Choparoshli', NULL, 'Чопарошли', NULL, 'Чапарашли', NULL),
(1718224845, 17, 18, 224, 845, 'Ko\'kdala', NULL, 'Кўкдала', NULL, 'Кокдала', NULL),
(1718224848, 17, 18, 224, 848, 'Ko\'lto\'sin', NULL, 'Кўлтўсин', NULL, 'Культусин', NULL),
(1718224855, 17, 18, 224, 855, 'Guliston', NULL, 'Гулистон', NULL, 'Гулистан', NULL),
(1718224866, 17, 18, 224, 866, 'Qorasuv', NULL, 'Қорасув', NULL, 'Карасув', NULL),
(1718224877, 17, 18, 224, 877, 'Sanoat', NULL, 'Саноат', NULL, 'Саноат', NULL),
(1718224888, 17, 18, 224, 888, 'Choshtepa', NULL, 'Чоштепа', NULL, 'Чаштепа', NULL),
(1718227500, 17, 18, 227, 500, 'Pastdarg\'om tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Пастдарғом туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Пастдаргомского района', NULL),
(1718227501, 17, 18, 227, 501, 'Juma', NULL, 'Жума', NULL, 'Джума', NULL),
(1718227550, 17, 18, 227, 550, 'Pastdarg\'om tumanining shaharchalari', NULL, 'Пастдарғом туманининг шаҳарчалари', NULL, 'Городские поселки Пастдаргомского района', NULL),
(1718227558, 17, 18, 227, 558, 'Charxin', NULL, 'Чархин', NULL, 'Чархин', NULL),
(1718227562, 17, 18, 227, 562, 'Chortut', NULL, 'Чортут', NULL, 'Чортут', NULL),
(1718227564, 17, 18, 227, 564, 'O\'rta Charxin', NULL, 'Ўрта Чархин', NULL, 'Урта Чархин', NULL),
(1718227566, 17, 18, 227, 566, 'Balhiyon', NULL, 'Балҳиён', NULL, 'Балхиен', NULL),
(1718227568, 17, 18, 227, 568, 'Go\'zalkent', NULL, 'Гўзалкент', NULL, 'Гузалкент', NULL),
(1718227572, 17, 18, 227, 572, 'Nayman', NULL, 'Найман', NULL, 'Найман', NULL),
(1718227574, 17, 18, 227, 574, 'Jag\'alboyli', NULL, 'Жағалбойли', NULL, 'Джагалбойли', NULL),
(1718227576, 17, 18, 227, 576, 'Mehnat', NULL, 'Меҳнат', NULL, 'Мехнат', NULL),
(1718227578, 17, 18, 227, 578, 'Hindiboyi', NULL, 'Ҳиндибойи', NULL, 'Хиндибойи', NULL),
(1718227582, 17, 18, 227, 582, 'Agron', NULL, 'Агрон', NULL, 'Агрон', NULL),
(1718227584, 17, 18, 227, 584, 'Iskandari', NULL, 'Искандари', NULL, 'Искандари', NULL),
(1718227586, 17, 18, 227, 586, 'Saribosh', NULL, 'Сарибош', NULL, 'Сарибош', NULL),
(1718227800, 17, 18, 227, 800, 'Pastdarg\'om tumanining qishloq fuqarolar yig\'inlari', NULL, 'Пастдарғом туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Пастдаргомского района', NULL),
(1718227807, 17, 18, 227, 807, 'Arabxona', NULL, 'Арабхона', NULL, 'Арабхана', NULL),
(1718227812, 17, 18, 227, 812, 'Bolatosh', NULL, 'Болатош', NULL, 'Балаташ', NULL),
(1718227817, 17, 18, 227, 817, 'Go\'zalkent', NULL, 'Гўзалкент', NULL, 'Гузалкент', NULL),
(1718227840, 17, 18, 227, 840, 'Anxor', NULL, 'Анхор', NULL, 'Анхоp', NULL),
(1718227842, 17, 18, 227, 842, 'Besh qahramon', NULL, 'Беш қаҳрамон', NULL, 'Бешкахрамон', NULL),
(1718227845, 17, 18, 227, 845, 'Saribosh', NULL, 'Сарибош', NULL, 'Саpибаш', NULL),
(1718227848, 17, 18, 227, 848, 'Po\'latchi', NULL, 'Пўлатчи', NULL, 'Пулатчи', NULL),
(1718227850, 17, 18, 227, 850, 'Namuna', NULL, 'Намуна', NULL, 'Намуна', NULL),
(1718227860, 17, 18, 227, 860, 'Sanchikul', NULL, 'Санчикул', NULL, 'Санчикуль', NULL),
(1718227867, 17, 18, 227, 867, 'Torariq', NULL, 'Торариқ', NULL, 'Тоpаpык', NULL),
(1718227875, 17, 18, 227, 875, 'Do\'rmontepa', NULL, 'Дўрмонтепа', NULL, 'Дурмонтепа', NULL),
(1718227880, 17, 18, 227, 880, 'Dimishkibolo', NULL, 'Димишкиболо', NULL, 'Димишкиболо', NULL),
(1718227890, 17, 18, 227, 890, 'Chimboy', NULL, 'Чимбой', NULL, 'Чимбай', NULL),
(1718230550, 17, 18, 230, 550, 'Paxtachi tumanining shaharchalari', NULL, 'Пахтачи туманининг шаҳарчалари', NULL, 'Городские поселки Пахтачийского района', NULL),
(1718230551, 17, 18, 230, 551, 'Ziyovuddin', NULL, 'Зиёвуддин', NULL, 'Зиатдин', NULL),
(1718230553, 17, 18, 230, 553, 'Qodirist', NULL, 'Қодирист', NULL, 'Кадирист', NULL),
(1718230555, 17, 18, 230, 555, 'Past Burkut', NULL, 'Паст Буркут', NULL, 'Паст Буркут', NULL),
(1718230557, 17, 18, 230, 557, 'Sanchiqul', NULL, 'Санчиқул', NULL, 'Санчикул', NULL),
(1718230559, 17, 18, 230, 559, 'Suluvqo\'rg\'on', NULL, 'Сулувқўрғон', NULL, 'Сулувкургон', NULL),
(1718230561, 17, 18, 230, 561, 'Urgich', NULL, 'Ургич', NULL, 'Ургич', NULL),
(1718230563, 17, 18, 230, 563, 'Xumor', NULL, 'Хумор', NULL, 'Хумор', NULL),
(1718230800, 17, 18, 230, 800, 'Paxtachi tumanining qishloq fuqarolar yig\'inlari', NULL, 'Пахтачи туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Пахтачийского района', NULL),
(1718230804, 17, 18, 230, 804, 'Do\'stobod', NULL, 'Дўстобод', NULL, 'Дустобод', NULL),
(1718230813, 17, 18, 230, 813, 'Xayrobod', NULL, 'Хайробод', NULL, 'Хайpабад', NULL),
(1718230827, 17, 18, 230, 827, 'Misit', NULL, 'Мисит', NULL, 'Мисит', NULL),
(1718230839, 17, 18, 230, 839, 'Sultonobod', NULL, 'Султонобод', NULL, 'Султанабад', NULL),
(1718230850, 17, 18, 230, 850, 'Yuqori Po\'latchi', NULL, 'Юқори Пўлатчи', NULL, 'Юкори Пулатчи', NULL),
(1718230861, 17, 18, 230, 861, 'Quyiboq', NULL, 'Қуйибоқ', NULL, 'Куйбок', NULL),
(1718230870, 17, 18, 230, 870, 'Xumor', NULL, 'Хумор', NULL, 'Хумар', NULL),
(1718230875, 17, 18, 230, 875, 'Karnab', NULL, 'Карнаб', NULL, 'Карнаб', NULL),
(1718233550, 17, 18, 233, 550, 'Samarqand tumanining shaharchalari', NULL, 'Самарқанд туманининг шаҳарчалари', NULL, 'Городские поселки Самаркандского района', NULL),
(1718233551, 17, 18, 233, 551, 'Gulobod', NULL, 'Гулобод', NULL, 'Гулабад', NULL),
(1718233555, 17, 18, 233, 555, 'Xo\'ja Ahrori Vali', NULL, 'Хўжа Аҳрори Вали', NULL, 'Хужа Ахрори Вали', NULL),
(1718233800, 17, 18, 233, 800, 'Samarqand tumanining qishloq fuqarolar yig\'inlari', NULL, 'Самарқанд туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Самаркандского района', NULL),
(1718233806, 17, 18, 233, 806, 'Ohalik', NULL, 'Оҳалик', NULL, 'Агалик', NULL),
(1718233812, 17, 18, 233, 812, 'Qo\'shtamg\'ali', NULL, 'Қўштамғали', NULL, 'Куштамгали', NULL),
(1718233819, 17, 18, 233, 819, 'Bog\'ibaland', NULL, 'Боғибаланд', NULL, 'Багибаланд', NULL),
(1718233830, 17, 18, 233, 830, 'Dashtakibolo', NULL, 'Даштакиболо', NULL, 'Даштакиболо', NULL),
(1718233850, 17, 18, 233, 850, 'Kattaqo\'rg\'onariq', NULL, 'Каттақўрғонариқ', NULL, 'Каттакурганарык', NULL),
(1718233856, 17, 18, 233, 856, 'Kulbaipoyon', NULL, 'Кулбаипоён', NULL, 'Кульбапоян', NULL),
(1718233880, 17, 18, 233, 880, 'Ulug\'bek', NULL, 'Улуғбек', NULL, 'Улугбек', NULL),
(1718233893, 17, 18, 233, 893, 'Qaynama', NULL, 'Қайнама', NULL, 'Кайнама', NULL),
(1718235500, 17, 18, 235, 500, 'Nurobod tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Нуробод туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Гоpода pайонного подчинения Hуpабадского pайона', NULL),
(1718235501, 17, 18, 235, 501, 'Nurobod', NULL, 'Нуробод', NULL, 'Нурабад', NULL),
(1718235550, 17, 18, 235, 550, 'Nurobod tumanining shaharchalari', NULL, 'Нуробод туманининг шаҳарчалари', NULL, 'Городские поселки Нурабадского района', NULL),
(1718235556, 17, 18, 235, 556, 'Nurbuloq', NULL, 'Нурбулоқ', NULL, 'Нурбулок', NULL),
(1718235800, 17, 18, 235, 800, 'Nurobod tumanining qishloq fuqarolar yig\'inlari', NULL, 'Нуробод туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Нурабадского района', NULL),
(1718235817, 17, 18, 235, 817, 'Jom', NULL, 'Жом', NULL, 'Джам', NULL),
(1718235820, 17, 18, 235, 820, 'Jarquduq', NULL, 'Жарқудуқ', NULL, 'Джаркудук', NULL),
(1718235833, 17, 18, 235, 833, 'Nurbuloq', NULL, 'Нурбулоқ', NULL, 'Нуpбулак', NULL),
(1718235840, 17, 18, 235, 840, 'Tim', NULL, 'Тим', NULL, 'Тим', NULL),
(1718235843, 17, 18, 235, 843, 'Sazog\'on', NULL, 'Сазоғон', NULL, 'Сазогон', NULL),
(1718235846, 17, 18, 235, 846, 'Ulus', NULL, 'Улус', NULL, 'Улус', NULL),
(1718235850, 17, 18, 235, 850, 'Tutli', NULL, 'Тутли', NULL, 'Тутли', NULL),
(1718236500, 17, 18, 236, 500, 'Urgut tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Ургут туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Ургутского района', NULL),
(1718236501, 17, 18, 236, 501, 'Urgut', NULL, 'Ургут', NULL, 'Ургут', NULL),
(1718236550, 17, 18, 236, 550, 'Urgut tumanining shaharchalari', NULL, 'Ургут туманининг шаҳарчалари', NULL, 'Городские поселки Ургутского района', NULL),
(1718236553, 17, 18, 236, 553, 'Jartepa', NULL, 'Жартепа', NULL, 'Джартепа', NULL),
(1718236556, 17, 18, 236, 556, 'Kamangaron', NULL, 'Камангарон', NULL, 'Камангарон', NULL),
(1718236559, 17, 18, 236, 559, 'G\'o\'s', NULL, 'Ғўс', NULL, 'Гус', NULL),
(1718236563, 17, 18, 236, 563, 'Pochvon', NULL, 'Почвон', NULL, 'Почвон', NULL),
(1718236566, 17, 18, 236, 566, 'Ispanza', NULL, 'Испанза', NULL, 'Испанза', NULL),
(1718236569, 17, 18, 236, 569, 'Uramas', NULL, 'Урамас', NULL, 'Урамас', NULL),
(1718236573, 17, 18, 236, 573, 'Kenagas', NULL, 'Кенагас', NULL, 'Кенагас', NULL),
(1718236800, 17, 18, 236, 800, 'Urgut tumanining qishloq fuqarolar yig\'inlari', NULL, 'Ургут туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Ургутского района', NULL),
(1718236806, 17, 18, 236, 806, 'Beshbuloq', NULL, 'Бешбулоқ', NULL, 'Бешбулак', NULL),
(1718236811, 17, 18, 236, 811, 'Ispanza', NULL, 'Испанза', NULL, 'Испанза', NULL),
(1718236814, 17, 18, 236, 814, 'G\'o\'s', NULL, 'Ғўс', NULL, 'Гус', NULL),
(1718236823, 17, 18, 236, 823, 'Ilonli', NULL, 'Илонли', NULL, 'Иланли', NULL),
(1718236834, 17, 18, 236, 834, 'Qoratepa', NULL, 'Қоратепа', NULL, 'Каратепа', NULL),
(1718236839, 17, 18, 236, 839, 'Baxrin', NULL, 'Бахрин', NULL, 'Бахpин', NULL),
(1718236846, 17, 18, 236, 846, 'Jartepa', NULL, 'Жартепа', NULL, 'Джаpтепа', NULL),
(1718236852, 17, 18, 236, 852, 'Uramas', NULL, 'Урамас', NULL, 'Уpамас', NULL),
(1718236858, 17, 18, 236, 858, 'Mirzaqishloq', NULL, 'Мирзақишлоқ', NULL, 'Мирзакишлак', NULL),
(1718236869, 17, 18, 236, 869, 'Pochvon', NULL, 'Почвон', NULL, 'Почван', NULL),
(1718236880, 17, 18, 236, 880, 'Buloqboshi', NULL, 'Булоқбоши', NULL, 'Булокбоши', NULL),
(1718236891, 17, 18, 236, 891, 'Yangiariq', NULL, 'Янгиариқ', NULL, 'Янгиарык', NULL),
(1718238550, 17, 18, 238, 550, 'Tayloq tumanining shaharchalari', NULL, 'Тайлоқ туманининг шаҳарчалари', NULL, 'Городские поселки Тайлякского района', NULL),
(1718238551, 17, 18, 238, 551, 'Toyloq', NULL, 'Тойлоқ', NULL, 'Тайлок', NULL),
(1718238554, 17, 18, 238, 554, 'Adas', NULL, 'Адас', NULL, 'Адас', NULL),
(1718238558, 17, 18, 238, 558, 'Bog\'izag\'on', NULL, 'Боғизағон', NULL, 'Богизагон', NULL),
(1718238800, 17, 18, 238, 800, 'Tayloq tumanining qishloq fuqarolar yig\'inlari', NULL, 'Тайлоқ туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Тайлякского района', NULL),
(1718238805, 17, 18, 238, 805, 'Adas', NULL, 'Адас', NULL, 'Адас', NULL),
(1718238815, 17, 18, 238, 815, 'Bog\'izag\'on', NULL, 'Боғизағон', NULL, 'Багизаган', NULL),
(1718238820, 17, 18, 238, 820, 'Jumabozor', NULL, 'Жумабозор', NULL, 'Джумабазар', NULL),
(1718238830, 17, 18, 238, 830, 'G\'o\'lba', NULL, 'Ғўлба', NULL, 'Гулба', NULL),
(1718238840, 17, 18, 238, 840, 'Madaniyat', NULL, 'Маданият', NULL, 'Маданият', NULL),
(1718238845, 17, 18, 238, 845, 'Sochakibolo', NULL, 'Сочакиболо', NULL, 'Сочакиболо', NULL),
(1718238850, 17, 18, 238, 850, 'Tepaqishloq', NULL, 'Тепақишлоқ', NULL, 'Тепакишлак', NULL),
(1718238855, 17, 18, 238, 855, 'Toyloq', NULL, 'Тойлоқ', NULL, 'Тайляк', NULL),
(1718238860, 17, 18, 238, 860, 'Qo\'rg\'oncha', NULL, 'Қўрғонча', NULL, 'Курганча', NULL),
(1718401550, 17, 18, 401, 550, 'Samarqand shahar hokimiyatiga qarashli shaharchalar', NULL, 'Самарқанд шаҳар ҳокимиятига қарашли шаҳарчалар', NULL, 'Городские поселки, подч. Самаркандскому горхок-ту', NULL),
(1718401554, 17, 18, 401, 554, 'Kimyogarlar', NULL, 'Кимёгарлар', NULL, 'Кимегаpлаp', NULL),
(1718401556, 17, 18, 401, 556, 'Farxod', NULL, 'Фарход', NULL, 'Фархад', NULL),
(1718401558, 17, 18, 401, 558, 'Xishrav', NULL, 'Хишрав', NULL, 'Хишрау', NULL),
(1718406550, 17, 18, 406, 550, 'Kattaqo\'rg\'on shahar hokimiyatiga qarashli shaharchalar', NULL, 'Каттақўрғон шаҳар ҳокимиятига қарашли шаҳарчалар', NULL, 'Городские поселки,подч. Каттакуpганскому гоpхок-ту', NULL),
(1718406554, 17, 18, 406, 554, 'Ingichka', NULL, 'Ингичка', NULL, 'Ингичка', NULL),
(1722201550, 17, 22, 201, 550, 'Oltinsoy tumanining shaharchalari', NULL, 'Олтинсой туманининг шаҳарчалари', NULL, 'Городские поселки Алтынсайского района', NULL),
(1722201551, 17, 22, 201, 551, 'Qorliq', NULL, 'Қорлиқ', NULL, 'Корлик', NULL),
(1722201553, 17, 22, 201, 553, 'Botosh', NULL, 'Ботош', NULL, 'Ботош', NULL),
(1722201555, 17, 22, 201, 555, 'Jobu', NULL, 'Жобу', NULL, 'Джобу', NULL),
(1722201557, 17, 22, 201, 557, 'Ipoq', NULL, 'Ипоқ', NULL, 'Ипок', NULL),
(1722201559, 17, 22, 201, 559, 'Qurama', NULL, 'Қурама', NULL, 'Курама', NULL),
(1722201561, 17, 22, 201, 561, 'Bo\'ston', NULL, 'Бўстон', NULL, 'Бустон', NULL),
(1722201563, 17, 22, 201, 563, 'Mormin', NULL, 'Мормин', NULL, 'Мармин', NULL),
(1722201565, 17, 22, 201, 565, 'Xayrandara', NULL, 'Хайрандара', NULL, 'Хайрандора', NULL),
(1722201567, 17, 22, 201, 567, 'Xo\'jasoat', NULL, 'Хўжасоат', NULL, 'Хужасоат', NULL),
(1722201569, 17, 22, 201, 569, 'Chep', NULL, 'Чеп', NULL, 'Чен', NULL),
(1722201571, 17, 22, 201, 571, 'Shakarqamish', NULL, 'Шакарқамиш', NULL, 'Шакаркамиш', NULL),
(1722201573, 17, 22, 201, 573, 'Ekraz', NULL, 'Экраз', NULL, 'Экраз', NULL),
(1722201575, 17, 22, 201, 575, 'Yangiqurilish', NULL, 'Янгиқурилиш', NULL, 'Янгикурилиш', NULL),
(1722201577, 17, 22, 201, 577, 'Gulobod', NULL, 'Гулобод', NULL, 'Гулобод', NULL),
(1722201800, 17, 22, 201, 800, 'Oltinsoy tumanining qishloq fuqarolar yig\'inlari', NULL, 'Олтинсой туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Алтынсайского района', NULL),
(1722201801, 17, 22, 201, 801, 'Oq oltin', NULL, 'Оқ олтин', NULL, 'Акалтын', NULL),
(1722201802, 17, 22, 201, 802, 'Oqarbuloq', NULL, 'Оқарбулоқ', NULL, 'Акарбулак', NULL),
(1722201803, 17, 22, 201, 803, 'Oltinsoy', NULL, 'Олтинсой', NULL, 'Алтынсай', NULL),
(1722201804, 17, 22, 201, 804, 'Vaxshivor', NULL, 'Вахшивор', NULL, 'Вахшивар', NULL),
(1722201807, 17, 22, 201, 807, 'Dug\'oba', NULL, 'Дуғоба', NULL, 'Дугаба', NULL),
(1722201813, 17, 22, 201, 813, 'Qorliq', NULL, 'Қорлиқ', NULL, 'Карлук', NULL),
(1722201816, 17, 22, 201, 816, 'Mirshodi', NULL, 'Миршоди', NULL, 'Миршаде', NULL),
(1722201820, 17, 22, 201, 820, 'Uzumzor', NULL, 'Узумзор', NULL, 'Узумзор', NULL),
(1722201823, 17, 22, 201, 823, 'Lutfiy', NULL, 'Лутфий', NULL, 'Лутфий', NULL),
(1722202550, 17, 22, 202, 550, 'Angor tumanining shaharchalari', NULL, 'Ангор туманининг шаҳарчалари', NULL, 'Городские поселки Ангорского района', NULL),
(1722202551, 17, 22, 202, 551, 'Angor ( mavjud)', NULL, 'Ангор   ( мавжуд)', NULL, 'Ангор', NULL),
(1722202553, 17, 22, 202, 553, 'Tallimaron', NULL, 'Таллимарон', NULL, 'Таллимарон', NULL),
(1722202556, 17, 22, 202, 556, 'Xomkon', NULL, 'Хомкон', NULL, 'Хамкан', NULL),
(1722202559, 17, 22, 202, 559, 'Qorasuv', NULL, 'Қорасув', NULL, 'Карасу', NULL),
(1722202561, 17, 22, 202, 561, 'Yangiobod', NULL, 'Янгиобод', NULL, 'Янгиабад', NULL),
(1722202563, 17, 22, 202, 563, 'Talloshqon', NULL, 'Таллошқон', NULL, 'Таллошкан', NULL),
(1722202566, 17, 22, 202, 566, 'Gilambob', NULL, 'Гиламбоб', NULL, 'Гиламбоб', NULL),
(1722202569, 17, 22, 202, 569, 'Zartepa', NULL, 'Зартепа', NULL, 'Зартепа', NULL),
(1722202571, 17, 22, 202, 571, 'Yangi turmush', NULL, 'Янги турмуш', NULL, 'Янги турмуш', NULL),
(1722202573, 17, 22, 202, 573, 'Angor ( yangi)', NULL, 'Ангор  ( янги)', NULL, 'Ангор', NULL),
(1722202576, 17, 22, 202, 576, 'Kayran', NULL, 'Кайран', NULL, 'Кайран', NULL),
(1722202579, 17, 22, 202, 579, 'Novshahar', NULL, 'Новшаҳар', NULL, 'Новшахар', NULL),
(1722202800, 17, 22, 202, 800, 'Angor tumanining qishloq fuqarolar yig\'inlari', NULL, 'Ангор туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Ангорского района', NULL),
(1722202815, 17, 22, 202, 815, 'Navoiy', NULL, 'Навоий', NULL, 'им. Навои', NULL),
(1722202825, 17, 22, 202, 825, 'Do\'stlik', NULL, 'Дўстлик', NULL, 'Дустлик', NULL),
(1722202829, 17, 22, 202, 829, 'Tallimaron', NULL, 'Таллимарон', NULL, 'Талимаран', NULL),
(1722202838, 17, 22, 202, 838, 'Qorasuv', NULL, 'Қорасув', NULL, 'Корасув', NULL),
(1722202840, 17, 22, 202, 840, 'Istiqlol', NULL, 'Истиқлол', NULL, 'Истиклол', NULL),
(1722202843, 17, 22, 202, 843, 'Zang', NULL, 'Занг', NULL, 'Занг', NULL),
(1722202846, 17, 22, 202, 846, 'Kayran', NULL, 'Кайран', NULL, 'Кайран', NULL),
(1722203550, 17, 22, 203, 550, 'Bandixon tumanining shaharchalari', NULL, 'Бандихон туманининг шаҳарчалари', NULL, 'Городские поселки Бандихонского района', NULL),
(1722203551, 17, 22, 203, 551, 'Bandixon', NULL, 'Бандихон', NULL, 'Бандихон', NULL),
(1722203800, 17, 22, 203, 800, 'Bandixon tumanining qishloq fuqarolar yig\'inlari', NULL, 'Бандихон туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Бандихонского района', NULL),
(1722204500, 17, 22, 204, 500, 'Boysun tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Бойсун туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Байсунского района', NULL),
(1722204501, 17, 22, 204, 501, 'Boysun', NULL, 'Бойсун', NULL, 'Байсун', NULL),
(1722204550, 17, 22, 204, 550, 'Boysun tumanining shaharchalari', NULL, 'Бойсун туманининг  шаҳарчалари', NULL, 'Городские поселки Байсунского района', NULL),
(1722204552, 17, 22, 204, 552, 'Kofrun', NULL, 'Кофрун', NULL, 'Кофрун', NULL),
(1722204554, 17, 22, 204, 554, 'Tangimush', NULL, 'Тангимуш', NULL, 'Тангимуш', NULL),
(1722204556, 17, 22, 204, 556, 'Pasurxi', NULL, 'Пасурхи', NULL, 'Пасурхи', NULL),
(1722204558, 17, 22, 204, 558, 'Qorabo\'yin', NULL, 'Қорабўйин', NULL, 'Корабуйин', NULL),
(1722204562, 17, 22, 204, 562, 'Rabot', NULL, 'Работ', NULL, 'Рабат', NULL),
(1722204800, 17, 22, 204, 800, 'Boysun tumanining qishloq fuqarolar yig\'inlari', NULL, 'Бойсун туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Байсунского района', NULL),
(1722204811, 17, 22, 204, 811, 'Qo\'ng\'irot', NULL, 'Қўнғирот', NULL, 'Кунгирот', NULL),
(1722204825, 17, 22, 204, 825, 'Temir darvoza', NULL, 'Темир дарвоза', NULL, 'Темир дарвоза', NULL),
(1722204828, 17, 22, 204, 828, 'Qo\'rg\'oncha', NULL, 'Қўрғонча', NULL, 'Курганча', NULL),
(1722204830, 17, 22, 204, 830, 'Machay', NULL, 'Мачай', NULL, 'Мачай', NULL),
(1722204832, 17, 22, 204, 832, 'Poyonqo\'rg\'on', NULL, 'Поёнқўрғон', NULL, 'Поенкургон', NULL),
(1722204843, 17, 22, 204, 843, 'Chinorli', NULL, 'Чинорли', NULL, 'Чинорли', NULL),
(1722204846, 17, 22, 204, 846, 'Ketmonchi', NULL, 'Кетмончи', NULL, 'Кетмончи', NULL),
(1722207550, 17, 22, 207, 550, 'Muzrabot tumanining shaharchalari', NULL, 'Музработ туманининг  шаҳарчалари', NULL, 'Городские поселки Музрабадского района', NULL),
(1722207551, 17, 22, 207, 551, 'Xalqobod', NULL, 'Халқобод', NULL, 'Халкабад', NULL),
(1722207553, 17, 22, 207, 553, 'Baxt', NULL, 'Бахт', NULL, 'Бахт', NULL),
(1722207555, 17, 22, 207, 555, 'Baynalmilal', NULL, 'Байналмилал', NULL, 'Байналмилал', NULL),
(1722207557, 17, 22, 207, 557, 'Guliston', NULL, 'Гулистон', NULL, 'Гулистан', NULL),
(1722207559, 17, 22, 207, 559, 'Iftixor', NULL, 'Ифтихор', NULL, 'Ифтихор', NULL),
(1722207561, 17, 22, 207, 561, 'Qozoyoqli', NULL, 'Қозоёқли', NULL, 'Казоекли', NULL),
(1722207563, 17, 22, 207, 563, 'Oq oltin', NULL, 'Оқ олтин', NULL, 'Ак алтин', NULL),
(1722207565, 17, 22, 207, 565, 'Taskent', NULL, 'Таскент', NULL, 'Таскент', NULL),
(1722207567, 17, 22, 207, 567, 'Ozod Vatan', NULL, 'Озод Ватан', NULL, 'Озод Ватан', NULL),
(1722207569, 17, 22, 207, 569, 'Chegarachi', NULL, 'Чегарачи', NULL, 'Чегарачи', NULL),
(1722207800, 17, 22, 207, 800, 'Muzrabot tumanining qishloq fuqarolar yig\'inlari', NULL, 'Музработ туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Музpабадского района', NULL),
(1722207811, 17, 22, 207, 811, 'Beshqo\'ton', NULL, 'Бешқўтон', NULL, 'Бешкутан', NULL),
(1722207815, 17, 22, 207, 815, 'Boldir', NULL, 'Болдир', NULL, 'Больдыр', NULL),
(1722207822, 17, 22, 207, 822, 'Sarhad', NULL, 'Сарҳад', NULL, 'Сархад', NULL),
(1722207830, 17, 22, 207, 830, 'Qorakamar', NULL, 'Қоракамар', NULL, 'Каракамар', NULL),
(1722207833, 17, 22, 207, 833, 'Sharq yulduzi', NULL, 'Шарқ юлдузи', NULL, 'Шарк юлдузи', NULL),
(1722207844, 17, 22, 207, 844, 'Muzrabot', NULL, 'Музработ', NULL, 'Музрабад', NULL),
(1722207847, 17, 22, 207, 847, 'Navbahor', NULL, 'Навбаҳор', NULL, 'Навбахор', NULL),
(1722207849, 17, 22, 207, 849, 'Obodon', NULL, 'Ободон', NULL, 'Абадан', NULL),
(1722207863, 17, 22, 207, 863, 'Sho\'rob', NULL, 'Шўроб', NULL, 'Шураб', NULL),
(1722210500, 17, 22, 210, 500, 'Denov tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Денов туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Денауского района', NULL),
(1722210501, 17, 22, 210, 501, 'Denov', NULL, 'Денов', NULL, 'Денау', NULL),
(1722210550, 17, 22, 210, 550, 'Denov tumanining shaharchalari', NULL, 'Денов туманининг шаҳарчалари', NULL, 'Городские поселки Денауского района', NULL),
(1722210554, 17, 22, 210, 554, 'Do\'stlik', NULL, 'Дўстлик', NULL, 'Дустлик', NULL),
(1722210556, 17, 22, 210, 556, 'Yurchi', NULL, 'Юрчи', NULL, 'Юрчи', NULL),
(1722210558, 17, 22, 210, 558, 'Qiziljar', NULL, 'Қизилжар', NULL, 'Кизилжар', NULL),
(1722210562, 17, 22, 210, 562, 'Xolchayon', NULL, 'Холчаён', NULL, 'Холчаен', NULL),
(1722210564, 17, 22, 210, 564, 'Xitoyan', NULL, 'Хитоян', NULL, 'Китоян', NULL),
(1722210566, 17, 22, 210, 566, 'Paxtakurash', NULL, 'Пахтакураш', NULL, 'Пахтакураш', NULL),
(1722210568, 17, 22, 210, 568, 'Namozgoh', NULL, 'Намозгоҳ', NULL, 'Намазгах', NULL),
(1722210572, 17, 22, 210, 572, 'Jamatak', NULL, 'Жаматак', NULL, 'Джаматак', NULL),
(1722210574, 17, 22, 210, 574, 'Yangi Hazorbog\'', NULL, 'Янги Ҳазорбоғ', NULL, 'Янги Хазарбаг', NULL),
(1722210576, 17, 22, 210, 576, 'Yangibog\'', NULL, 'Янгибоғ', NULL, 'Янгибаг', NULL),
(1722210578, 17, 22, 210, 578, 'Dahana', NULL, 'Даҳана', NULL, 'Дахана', NULL),
(1722210582, 17, 22, 210, 582, 'Yangiobod', NULL, 'Янгиобод', NULL, 'Янгиабад', NULL),
(1722210800, 17, 22, 210, 800, 'Denov tumanining qishloq fuqarolar yig\'inlari', NULL, 'Денов туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Денауского района', NULL),
(1722210806, 17, 22, 210, 806, 'Anbarsoy', NULL, 'Анбарсой', NULL, 'Анбарсай', NULL),
(1722210823, 17, 22, 210, 823, 'Denov', NULL, 'Денов', NULL, 'Денау', NULL),
(1722210830, 17, 22, 210, 830, 'Kenagas', NULL, 'Кенагас', NULL, 'Кенагас', NULL),
(1722210834, 17, 22, 210, 834, 'Qiziljar', NULL, 'Қизилжар', NULL, 'Кызылжаp', NULL),
(1722210838, 17, 22, 210, 838, 'Farg\'ona', NULL, 'Фарғона', NULL, 'Фергана', NULL),
(1722210840, 17, 22, 210, 840, 'Tortuvli', NULL, 'Тортувли', NULL, 'Тоpтувли', NULL),
(1722210845, 17, 22, 210, 845, 'Pistamozor', NULL, 'Пистамозор', NULL, 'Пистамазар', NULL),
(1722210850, 17, 22, 210, 850, 'Sina', NULL, 'Сина', NULL, 'Сина', NULL),
(1722210864, 17, 22, 210, 864, 'Xayrabot', NULL, 'Хайработ', NULL, 'Хайрабад', NULL),
(1722210868, 17, 22, 210, 868, 'Hazarbog\'', NULL, 'Ҳазарбоғ', NULL, 'Хазарбаг', NULL),
(1722210870, 17, 22, 210, 870, 'Xolchayon', NULL, 'Холчаён', NULL, 'Халчиян', NULL),
(1722210873, 17, 22, 210, 873, 'Yangibog\'', NULL, 'Янгибоғ', NULL, 'Янгибаг', NULL),
(1722210875, 17, 22, 210, 875, 'Yangizamon', NULL, 'Янгизамон', NULL, 'Янгизамон', NULL),
(1722210879, 17, 22, 210, 879, 'Yurchi', NULL, 'Юрчи', NULL, 'Юрчи', NULL),
(1722210881, 17, 22, 210, 881, 'Yangiobod', NULL, 'Янгиобод', NULL, 'Янгиабад', NULL),
(1722210883, 17, 22, 210, 883, 'Binokor', NULL, 'Бинокор', NULL, 'Бинокоp', NULL),
(1722210885, 17, 22, 210, 885, 'Dahana', NULL, 'Даҳана', NULL, 'Дахана', NULL),
(1722212500, 17, 22, 212, 500, 'Jarqo\'rg\'on tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Жарқўрғон туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Джаркурганского района', NULL),
(1722212501, 17, 22, 212, 501, 'Jarqo\'rg\'on', NULL, 'Жарқўрғон', NULL, 'Джаркурган', NULL),
(1722212550, 17, 22, 212, 550, 'Jarqo\'rg\'on tumanining shaharchalari', NULL, 'Жарқўрғон туманининг шаҳарчалари', NULL, 'Городские поселки Джаркурганского района', NULL),
(1722212554, 17, 22, 212, 554, 'Kakaydi', NULL, 'Какайди', NULL, 'Какайды', NULL),
(1722212558, 17, 22, 212, 558, 'Minor', NULL, 'Минор', NULL, 'Минор', NULL),
(1722212564, 17, 22, 212, 564, 'Qoraqursoq', NULL, 'Қорақурсоқ', NULL, 'Каракурсак', NULL);
INSERT INTO `soato` (`MHOBT_cod`, `res_id`, `region_id`, `district_id`, `qfi_id`, `name_lot`, `center_lot`, `name_cyr`, `center_cyr`, `name_ru`, `center_ru`) VALUES
(1722212568, 17, 22, 212, 568, 'Markaziy Surxon', NULL, 'Марказий Сурхон', NULL, 'Марказий Сурхан', NULL),
(1722212574, 17, 22, 212, 574, 'Kafrun', NULL, 'Кафрун', NULL, 'Кофрун', NULL),
(1722212800, 17, 22, 212, 800, 'Jarqo\'rg\'on tumanining qishloq fuqarolar yig\'inlari', NULL, 'Жарқўрғон туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Джаркурганского района', NULL),
(1722212811, 17, 22, 212, 811, 'Oqqo\'rg\'on', NULL, 'Оққўрғон', NULL, 'Аккурган', NULL),
(1722212833, 17, 22, 212, 833, 'Jarqo\'rg\'on', NULL, 'Жарқўрғон', NULL, 'Джаркурган', NULL),
(1722212855, 17, 22, 212, 855, 'Dehqonobod', NULL, 'Деҳқонобод', NULL, 'Дехканабад', NULL),
(1722212866, 17, 22, 212, 866, 'Minor', NULL, 'Минор', NULL, 'Минор', NULL),
(1722212877, 17, 22, 212, 877, 'Surxon', NULL, 'Сурхон', NULL, 'Сурхан', NULL),
(1722212880, 17, 22, 212, 880, 'Chorjo\'y', NULL, 'Чоржўй', NULL, 'Чаpджуй', NULL),
(1722212889, 17, 22, 212, 889, 'Sharq Yulduzi', NULL, 'Шарқ юлдузи', NULL, 'Шарк-Юлдузи', NULL),
(1722214500, 17, 22, 214, 500, 'Qumqo\'rg\'on tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Қумқўрғон туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Кумкурганского района', NULL),
(1722214501, 17, 22, 214, 501, 'Qumqo\'rg\'on', NULL, 'Қумқўрғон', NULL, 'Кумкурган', NULL),
(1722214550, 17, 22, 214, 550, 'Qumqo\'rg\'on tumanining shaharchalari', NULL, 'Қумқўрғон туманининг  шаҳарчалари', NULL, 'Городские поселки Кумкурганского района', NULL),
(1722214570, 17, 22, 214, 570, 'Hurriyat', NULL, 'Ҳуррият', NULL, 'Хуppият', NULL),
(1722214572, 17, 22, 214, 572, 'Elbayon', NULL, 'Элбаён', NULL, 'Элбаен', NULL),
(1722214574, 17, 22, 214, 574, 'Elobod', NULL, 'Элобод', NULL, 'Элобод', NULL),
(1722214576, 17, 22, 214, 576, 'Azlarsoy', NULL, 'Азларсой', NULL, 'Азларсай', NULL),
(1722214578, 17, 22, 214, 578, 'Bog\'ora', NULL, 'Боғора', NULL, 'Богара', NULL),
(1722214582, 17, 22, 214, 582, 'Oqsoy', NULL, 'Оқсой', NULL, 'Аксай', NULL),
(1722214584, 17, 22, 214, 584, 'Jiydali', NULL, 'Жийдали', NULL, 'Джийдали', NULL),
(1722214586, 17, 22, 214, 586, 'Navbahor', NULL, 'Навбаҳор', NULL, 'Навбахор', NULL),
(1722214588, 17, 22, 214, 588, 'Qarsoqli', NULL, 'Қарсоқли', NULL, 'Карсакли', NULL),
(1722214592, 17, 22, 214, 592, 'Yangiyer', NULL, 'Янгиер', NULL, 'Янгиер', NULL),
(1722214594, 17, 22, 214, 594, 'Jaloir', NULL, 'Жалоир', NULL, 'Джалойир', NULL),
(1722214800, 17, 22, 214, 800, 'Qumqo\'rg\'on tumanining qishloq fuqarolar yig\'inlari', NULL, 'Қумқўрғон туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Кумкурганского района', NULL),
(1722214803, 17, 22, 214, 803, 'Oqqapchig\'ay', NULL, 'Оққапчиғай', NULL, 'Аккапчигай', NULL),
(1722214810, 17, 22, 214, 810, 'Jaloir Qo\'rg\'oni', NULL, 'Жалоир Қўрғони', NULL, 'Жалоир Кургони', NULL),
(1722214815, 17, 22, 214, 815, 'Sheroziy', NULL, 'Шерозий', NULL, 'Шерозий', NULL),
(1722214818, 17, 22, 214, 818, 'Oqjar', NULL, 'Оқжар', NULL, 'Акжаp', NULL),
(1722214820, 17, 22, 214, 820, 'Qumqo\'rg\'on', NULL, 'Қумқўрғон', NULL, 'Кумкурган', NULL),
(1722214830, 17, 22, 214, 830, 'Yuqori Kakaydi', NULL, 'Юқори Какайди', NULL, 'Юкары-Какайды', NULL),
(1722214833, 17, 22, 214, 833, 'Ketmon', NULL, 'Кетмон', NULL, 'Кетман', NULL),
(1722214836, 17, 22, 214, 836, 'Arslonboyli', NULL, 'Арслонбойли', NULL, 'Аpсланбайли', NULL),
(1722215550, 17, 22, 215, 550, 'Qiziriq tumanining shaharchalari', NULL, 'Қизириқ туманининг  шаҳарчалари', NULL, 'Городские поселки Кизирикского района', NULL),
(1722215551, 17, 22, 215, 551, 'Sariq', NULL, 'Сариқ', NULL, 'Сарик', NULL),
(1722215553, 17, 22, 215, 553, 'Kunchiqish', NULL, 'Кунчиқиш', NULL, 'Кунчикиш', NULL),
(1722215556, 17, 22, 215, 556, 'Yangi hayot', NULL, 'Янги ҳаёт', NULL, 'Янги хает', NULL),
(1722215559, 17, 22, 215, 559, 'Karmaki', NULL, 'Кармаки', NULL, 'Кармаки', NULL),
(1722215563, 17, 22, 215, 563, 'Istara', NULL, 'Истара', NULL, 'Истара', NULL),
(1722215800, 17, 22, 215, 800, 'Qiziriq tumanining qishloq fuqarolar yig\'inlari', NULL, 'Қизириқ туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Кизирикского района', NULL),
(1722215805, 17, 22, 215, 805, 'Zarkamar', NULL, 'Заркамар', NULL, 'Заркамар', NULL),
(1722215841, 17, 22, 215, 841, 'Olmazor', NULL, 'Олмазор', NULL, 'Олмазор', NULL),
(1722215843, 17, 22, 215, 843, 'Bandixon', NULL, 'Бандихон', NULL, 'Бандихон', NULL),
(1722215845, 17, 22, 215, 845, 'Qiziriq', NULL, 'Қизириқ', NULL, 'Кизирик', NULL),
(1722215847, 17, 22, 215, 847, 'Kirshak', NULL, 'Киршак', NULL, 'Киршак', NULL),
(1722215849, 17, 22, 215, 849, 'Chorvador', NULL, 'Чорвадор', NULL, 'Чорвадор', NULL),
(1722215860, 17, 22, 215, 860, 'Paxtakor', NULL, 'Пахтакор', NULL, 'Пахтакор', NULL),
(1722215865, 17, 22, 215, 865, 'Sharq Istara', NULL, 'Шарқ Истара', NULL, 'Шарк Истара', NULL),
(1722215867, 17, 22, 215, 867, 'Yangi yo\'l', NULL, 'Янги йўл', NULL, 'Янгиюль', NULL),
(1722215870, 17, 22, 215, 870, 'Mehnatobod', NULL, 'Меҳнатобод', NULL, 'Мехнатабад', NULL),
(1722217500, 17, 22, 217, 500, 'Sariosiyo tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Сариосиё туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Сариасийского района', NULL),
(1722217505, 17, 22, 217, 505, 'Sharg\'un', NULL, 'Шарғун', NULL, 'Шаргунь', NULL),
(1722217550, 17, 22, 217, 550, 'Sariosiyo tumanining shaharchalari', NULL, 'Сариосиё туманининг шаҳарчалари', NULL, 'Городские поселки Сариасийского района', NULL),
(1722217551, 17, 22, 217, 551, 'Sariosiyo', NULL, 'Сариосиё', NULL, 'Сариасия', NULL),
(1722217554, 17, 22, 217, 554, 'Yangihayot', NULL, 'Янгиҳаёт', NULL, 'Янгихает', NULL),
(1722217558, 17, 22, 217, 558, 'Tortuli', NULL, 'Тортули', NULL, 'Тартули', NULL),
(1722217564, 17, 22, 217, 564, 'Bo\'yropo\'sht', NULL, 'Бўйропўшт', NULL, 'Буйрапушт', NULL),
(1722217800, 17, 22, 217, 800, 'Sariosiyo tumanining qishloq fuqarolar yig\'inlari', NULL, 'Сариосиё туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Сариасийского района', NULL),
(1722217812, 17, 22, 217, 812, 'Dashnobod', NULL, 'Дашнобод', NULL, 'Дашнабад', NULL),
(1722217826, 17, 22, 217, 826, 'Navro\'z', NULL, 'Наврўз', NULL, 'Навруз', NULL),
(1722217828, 17, 22, 217, 828, 'Buyuk kelajak', NULL, 'Буюк келажак', NULL, 'Буюк келажак', NULL),
(1722217832, 17, 22, 217, 832, 'Sangardak', NULL, 'Сангардак', NULL, 'Сангардак', NULL),
(1722217835, 17, 22, 217, 835, 'Bog\'i iram', NULL, 'Боғи ирам', NULL, 'Боги ирам', NULL),
(1722217846, 17, 22, 217, 846, 'So\'fiyon', NULL, 'Сўфиён', NULL, 'Суфиян', NULL),
(1722217851, 17, 22, 217, 851, 'Toqchiyon', NULL, 'Тоқчиён', NULL, 'Такчиян', NULL),
(1722217862, 17, 22, 217, 862, 'O\'zbekiston', NULL, 'Ўзбекистон', NULL, 'Узбекистан', NULL),
(1722217880, 17, 22, 217, 880, 'Xufar', NULL, 'Хуфар', NULL, 'Хуфар', NULL),
(1722220550, 17, 22, 220, 550, 'Termiz tumanining shaharchalari', NULL, 'Термиз туманининг шаҳарчалари', NULL, 'Городские поселки Термезского района', NULL),
(1722220551, 17, 22, 220, 551, 'Uchqizil', NULL, 'Учқизил', NULL, 'Учкизил', NULL),
(1722220553, 17, 22, 220, 553, 'Limonchi', NULL, 'Лимончи', NULL, 'Лимончи', NULL),
(1722220555, 17, 22, 220, 555, 'Tajribakor', NULL, 'Тажрибакор', NULL, 'Тажрибакор', NULL),
(1722220557, 17, 22, 220, 557, 'Namuna', NULL, 'Намуна', NULL, 'Намуна', NULL),
(1722220559, 17, 22, 220, 559, 'At-Termiziy', NULL, 'Ат-Термизий', NULL, 'Ат-Термизий', NULL),
(1722220561, 17, 22, 220, 561, 'Mustaqillik', NULL, 'Мустақиллик', NULL, 'Мустакиллик', NULL),
(1722220563, 17, 22, 220, 563, 'Pattakesar', NULL, 'Паттакесар', NULL, 'Паттакесар', NULL),
(1722220565, 17, 22, 220, 565, 'Chegarachi', NULL, 'Чегарачи', NULL, 'Чегарачи', NULL),
(1722220567, 17, 22, 220, 567, 'Qizilboy', NULL, 'Қизилбой', NULL, 'Кизилбай', NULL),
(1722220800, 17, 22, 220, 800, 'Termiz tumanining qishloq fuqarolar yig\'inlari', NULL, 'Термиз туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Термезского района', NULL),
(1722220844, 17, 22, 220, 844, 'Mehnatobod', NULL, 'Меҳнатобод', NULL, 'Мехнатобод', NULL),
(1722220855, 17, 22, 220, 855, 'Paxtaobod', NULL, 'Пахтаобод', NULL, 'Пахтаабад', NULL),
(1722220870, 17, 22, 220, 870, 'Uchqizil', NULL, 'Учқизил', NULL, 'Учкизил', NULL),
(1722220888, 17, 22, 220, 888, 'Yangiariq', NULL, 'Янгиариқ', NULL, 'Янгиарык', NULL),
(1722220895, 17, 22, 220, 895, 'Kokildorota', NULL, 'Кокилдорота', NULL, 'Кокилдорота', NULL),
(1722221550, 17, 22, 221, 550, 'Uzun tumanining shaharchalari', NULL, 'Узун туманининг шаҳарчалари', NULL, 'Городские поселки Узунского района', NULL),
(1722221551, 17, 22, 221, 551, 'Uzun', NULL, 'Узун', NULL, 'Узун', NULL),
(1722221553, 17, 22, 221, 553, 'Chinor', NULL, 'Чинор', NULL, 'Чинар', NULL),
(1722221556, 17, 22, 221, 556, 'Ulanqul', NULL, 'Уланқул', NULL, 'Уланкул', NULL),
(1722221559, 17, 22, 221, 559, 'Qarashiq', NULL, 'Қарашиқ', NULL, 'Карашик', NULL),
(1722221563, 17, 22, 221, 563, 'Yangi kuch', NULL, 'Янги куч', NULL, 'Янги куч', NULL),
(1722221566, 17, 22, 221, 566, 'Jonchekka', NULL, 'Жончекка', NULL, 'Джанчекка', NULL),
(1722221569, 17, 22, 221, 569, 'Malandiyon', NULL, 'Маландиён', NULL, 'Маландиян', NULL),
(1722221573, 17, 22, 221, 573, 'Mehnat', NULL, 'Меҳнат', NULL, 'Мехнат', NULL),
(1722221576, 17, 22, 221, 576, 'Yangi ro\'zg\'or', NULL, 'Янги рўзғор', NULL, 'Янги рузгор', NULL),
(1722221800, 17, 22, 221, 800, 'Uzun tumanining qishloq fuqarolar yig\'inlari', NULL, 'Узун туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Узунского района', NULL),
(1722221806, 17, 22, 221, 806, 'Bobotog\'', NULL, 'Боботоғ', NULL, 'Бабатаг', NULL),
(1722221816, 17, 22, 221, 816, 'Jonchekka', NULL, 'Жончекка', NULL, 'Джанчека', NULL),
(1722221824, 17, 22, 221, 824, 'Fayzova', NULL, 'Файзова', NULL, 'им. Файзова', NULL),
(1722221856, 17, 22, 221, 856, 'Telpakchinor', NULL, 'Телпакчинор', NULL, 'Тельпакчинар', NULL),
(1722221868, 17, 22, 221, 868, 'Uzun', NULL, 'Узун', NULL, 'Узун', NULL),
(1722221875, 17, 22, 221, 875, 'Oq Ostona', NULL, 'Оқ Остона', NULL, 'Акастана', NULL),
(1722221880, 17, 22, 221, 880, 'Xonjiza', NULL, 'Хонжиза', NULL, 'Хондиза', NULL),
(1722223500, 17, 22, 223, 500, 'Sherobod tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Шеробод туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Шерабадского района', NULL),
(1722223501, 17, 22, 223, 501, 'Sherobod', NULL, 'Шеробод', NULL, 'Шерабад', NULL),
(1722223550, 17, 22, 223, 550, 'Sherobod tumanining shaharchalari', NULL, 'Шеробод туманининг шаҳарчалари', NULL, 'Городские поселки Шерабадского района', NULL),
(1722223552, 17, 22, 223, 552, 'Zarabog\'', NULL, 'Зарабоғ', NULL, 'Зарабаг', NULL),
(1722223554, 17, 22, 223, 554, 'Kilkon', NULL, 'Килкон', NULL, 'Килкон', NULL),
(1722223556, 17, 22, 223, 556, 'Navbog\'', NULL, 'Навбоғ', NULL, 'Навбаг', NULL),
(1722223558, 17, 22, 223, 558, 'Paxtaobod', NULL, 'Пахтаобод', NULL, 'Пахтаабад', NULL),
(1722223562, 17, 22, 223, 562, 'Sariqamish', NULL, 'Сариқамиш', NULL, 'Сарикамиш', NULL),
(1722223564, 17, 22, 223, 564, 'Cho\'yinchi', NULL, 'Чўйинчи', NULL, 'Чуйинчи', NULL),
(1722223566, 17, 22, 223, 566, 'Yangiariq', NULL, 'Янгиариқ', NULL, 'Янги арик', NULL),
(1722223800, 17, 22, 223, 800, 'Sherobod tumanining qishloq fuqarolar yig\'inlari', NULL, 'Шеробод туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Шерабадского района', NULL),
(1722223810, 17, 22, 223, 810, 'Oqqo\'rg\'on', NULL, 'Оққўрғон', NULL, 'Аккурган', NULL),
(1722223822, 17, 22, 223, 822, 'Ko\'hitang', NULL, 'Кўҳитанг', NULL, 'Кухитанг', NULL),
(1722223833, 17, 22, 223, 833, 'Sariqamish', NULL, 'Сариқамиш', NULL, 'Саpикамиш', NULL),
(1722223854, 17, 22, 223, 854, 'Seplon', NULL, 'Сеплон', NULL, 'Сеплан', NULL),
(1722223856, 17, 22, 223, 856, 'Talloshqon', NULL, 'Таллошқон', NULL, 'Талашкан', NULL),
(1722223858, 17, 22, 223, 858, 'Rabatak', NULL, 'Рабатак', NULL, 'Рабатаг', NULL),
(1722223865, 17, 22, 223, 865, 'Yangiturmush', NULL, 'Янгитурмуш', NULL, 'Янгитурмуш', NULL),
(1722223867, 17, 22, 223, 867, 'Bo\'ston', NULL, 'Бўстон', NULL, 'Бустансай', NULL),
(1722223870, 17, 22, 223, 870, 'Chinobod', NULL, 'Чинобод', NULL, 'Чинабад', NULL),
(1722226500, 17, 22, 226, 500, 'Sho\'rchi tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Шўрчи туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Шурчинского района', NULL),
(1722226501, 17, 22, 226, 501, 'Sho\'rchi', NULL, 'Шўрчи', NULL, 'Шурчи', NULL),
(1722226550, 17, 22, 226, 550, 'Sho\'rchi tumanining shaharchalari', NULL, 'Шўрчи туманининг шаҳарчалари', NULL, 'Городские поселки Шурчинского района', NULL),
(1722226554, 17, 22, 226, 554, 'Elbayon', NULL, 'Элбаён', NULL, 'Элбаен', NULL),
(1722226558, 17, 22, 226, 558, 'To\'la', NULL, 'Тўла', NULL, 'Тула', NULL),
(1722226562, 17, 22, 226, 562, 'Yalti', NULL, 'Ялти', NULL, 'Ялти', NULL),
(1722226564, 17, 22, 226, 564, 'Xushchekka', NULL, 'Хушчекка', NULL, 'Хушчека', NULL),
(1722226566, 17, 22, 226, 566, 'Qo\'shtegirmon', NULL, 'Қўштегирмон', NULL, 'Куштегирмон', NULL),
(1722226568, 17, 22, 226, 568, 'Kattasovur', NULL, 'Каттасовур', NULL, 'Катта совур', NULL),
(1722226572, 17, 22, 226, 572, 'Karvon', NULL, 'Карвон', NULL, 'Карвон', NULL),
(1722226574, 17, 22, 226, 574, 'G\'armaqo\'rg\'on', NULL, 'Ғармақўрғон', NULL, 'Гармакурган', NULL),
(1722226576, 17, 22, 226, 576, 'Jarqishloq', NULL, 'Жарқишлоқ', NULL, 'Джаркишлок', NULL),
(1722226578, 17, 22, 226, 578, 'Joyilma', NULL, 'Жойилма', NULL, 'Джайилма', NULL),
(1722226800, 17, 22, 226, 800, 'Sho\'rchi tumanining qishloq fuqarolar yig\'inlari', NULL, 'Шўрчи туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Шурчинского района', NULL),
(1722226816, 17, 22, 226, 816, 'Qo\'ldosh', NULL, 'Қўлдош', NULL, 'Кулдош', NULL),
(1722226820, 17, 22, 226, 820, 'Alpomish', NULL, 'Алпомиш', NULL, 'Алпомиш', NULL),
(1722226824, 17, 22, 226, 824, 'Baxtlitepa', NULL, 'Бахтлитепа', NULL, 'Бахтлитепа', NULL),
(1722226844, 17, 22, 226, 844, 'Savur', NULL, 'Савур', NULL, 'Совур', NULL),
(1722226852, 17, 22, 226, 852, 'Elobod', NULL, 'Элобод', NULL, 'Элабад', NULL),
(1722226863, 17, 22, 226, 863, 'Sohibkor', NULL, 'Соҳибкор', NULL, 'Сахибкор', NULL),
(1722226866, 17, 22, 226, 866, 'Dalvarzin', NULL, 'Далварзин', NULL, 'Дальверзин', NULL),
(1722226869, 17, 22, 226, 869, 'Jaloir', NULL, 'Жалоир', NULL, 'Джалаир', NULL),
(1722226872, 17, 22, 226, 872, 'Sho\'rchi', NULL, 'Шўрчи', NULL, 'Шурчи', NULL),
(1722226882, 17, 22, 226, 882, 'Yangibozor', NULL, 'Янгибозор', NULL, 'Янгибазар', NULL),
(1724206550, 17, 24, 206, 550, 'Oqoltin tumanining shaharchalari', NULL, 'Оқолтин туманининг шаҳарчалари', NULL, 'Городские поселки Акалтынского района', NULL),
(1724206551, 17, 24, 206, 551, 'Sardoba', NULL, 'Сардоба', NULL, 'Сардоба', NULL),
(1724206552, 17, 24, 206, 552, 'Farg\'ona', NULL, 'Фарғона', NULL, 'Фергана', NULL),
(1724206554, 17, 24, 206, 554, 'Andijon', NULL, 'Андижон', NULL, 'Андижон', NULL),
(1724206800, 17, 24, 206, 800, 'Oqoltin tumanining qishloq fuqarolar yig\'inlari', NULL, 'Оқолтин туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Акалтынского pайона', NULL),
(1724206814, 17, 24, 206, 814, 'Bo\'ston', NULL, 'Бўстон', NULL, 'Бустан', NULL),
(1724206824, 17, 24, 206, 824, 'Ahillik', NULL, 'Аҳиллик', NULL, 'Ахиллик', NULL),
(1724206850, 17, 24, 206, 850, 'Shodlik', NULL, 'Шодлик', NULL, 'Шадлик', NULL),
(1724212550, 17, 24, 212, 550, 'Boyovut tumanining shaharchalari', NULL, 'Боёвут туманининг шаҳарчалари', NULL, 'Городские поселки Баяутского района', NULL),
(1724212551, 17, 24, 212, 551, 'Boyovut', NULL, 'Боёвут', NULL, 'Баяут', NULL),
(1724212552, 17, 24, 212, 552, 'Markaz', NULL, 'Марказ', NULL, 'Марказ', NULL),
(1724212553, 17, 24, 212, 553, 'Bekat', NULL, 'Бекат', NULL, 'Бекат', NULL),
(1724212554, 17, 24, 212, 554, 'Do\'stlik', NULL, 'Дўстлик', NULL, 'Дустлик', NULL),
(1724212800, 17, 24, 212, 800, 'Boyovut tumanining qishloq fuqarolar yig\'inlari', NULL, 'Боёвут туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Баяутского района', NULL),
(1724212811, 17, 24, 212, 811, 'Boyovut', NULL, 'Боёвут', NULL, 'Баяут', NULL),
(1724212818, 17, 24, 212, 818, 'G\'allakor', NULL, 'Ғаллакор', NULL, 'Галлакор', NULL),
(1724212830, 17, 24, 212, 830, 'Darvazakir', NULL, 'Дарвазакир', NULL, 'Дарбазакыр', NULL),
(1724212834, 17, 24, 212, 834, 'Dehqonobod', NULL, 'Деҳқонобод', NULL, 'Дехканабад', NULL),
(1724212847, 17, 24, 212, 847, 'Olmazor', NULL, 'Олмазор', NULL, 'Алмазар', NULL),
(1724212850, 17, 24, 212, 850, 'Mingchinor', NULL, 'Мингчинор', NULL, 'Мингчинар', NULL),
(1724212855, 17, 24, 212, 855, 'Buyuk yurt', NULL, 'Буюк юрт', NULL, 'Буюк юрт', NULL),
(1724212861, 17, 24, 212, 861, 'Tabarruk', NULL, 'Табаррук', NULL, 'Табаррук', NULL),
(1724212865, 17, 24, 212, 865, 'Madaniyat', NULL, 'Маданият', NULL, 'Маданият', NULL),
(1724212868, 17, 24, 212, 868, 'Do\'stlik', NULL, 'Дўстлик', NULL, 'Дустлик', NULL),
(1724212875, 17, 24, 212, 875, 'Laylakko\'l', NULL, 'Лайлаккўл', NULL, 'Лайлакуль', NULL),
(1724212880, 17, 24, 212, 880, 'Tinchlik', NULL, 'Тинчлик', NULL, 'Тинчлик', NULL),
(1724216550, 17, 24, 216, 550, 'Sayxunobod tumanining shaharchalari', NULL, 'Сайхунобод туманининг шаҳарчалари', NULL, 'Городские поселки Сайхунабадского района', NULL),
(1724216551, 17, 24, 216, 551, 'Sayxun', NULL, 'Сайхун', NULL, 'Сайхун', NULL),
(1724216553, 17, 24, 216, 553, 'Sohil', NULL, 'Соҳил', NULL, 'Сохил', NULL),
(1724216555, 17, 24, 216, 555, 'Sho\'ro\'zak', NULL, 'Шўрўзак', NULL, 'Шурузак', NULL),
(1724216557, 17, 24, 216, 557, 'Paxtakon', NULL, 'Пахтакон', NULL, 'Пахтакон', NULL),
(1724216800, 17, 24, 216, 800, 'Sayxunobod tumanining qishloq fuqarolar yig\'inlari', NULL, 'Сайхунобод туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Сайхунабадского района', NULL),
(1724216811, 17, 24, 216, 811, 'Ittifak', NULL, 'Иттифак', NULL, 'Иттифак', NULL),
(1724216822, 17, 24, 216, 822, 'Guliston', NULL, 'Гулистон', NULL, 'Гулистан', NULL),
(1724216827, 17, 24, 216, 827, 'Nurota', NULL, 'Нурота', NULL, 'Нурата', NULL),
(1724216830, 17, 24, 216, 830, 'O\'zbekiston', NULL, 'Ўзбекистон', NULL, 'Узбекистон', NULL),
(1724216833, 17, 24, 216, 833, 'Istiqlol', NULL, 'Истиқлол', NULL, 'Истиклол', NULL),
(1724216844, 17, 24, 216, 844, 'Sho\'ro\'zak', NULL, 'Шўрўзак', NULL, 'Шурузяк', NULL),
(1724216855, 17, 24, 216, 855, 'Yangi hayot', NULL, 'Янги ҳаёт', NULL, 'Янгихаят', NULL),
(1724220550, 17, 24, 220, 550, 'Guliston tumanining shaharchalari', NULL, 'Гулистон туманининг шаҳарчалари', NULL, 'Городские поселки Гулистанского района', NULL),
(1724220551, 17, 24, 220, 551, 'Dehqonobod', NULL, 'Деҳқонобод', NULL, 'Дехканабад', NULL),
(1724220552, 17, 24, 220, 552, 'Hulkar', NULL, 'Ҳулкар', NULL, 'Хулкар', NULL),
(1724220553, 17, 24, 220, 553, 'Beshbuloq', NULL, 'Бешбулоқ', NULL, 'Бешбулак', NULL),
(1724220554, 17, 24, 220, 554, 'Ulug\'bek', NULL, 'Улуғбек', NULL, 'Улугбек', NULL),
(1724220556, 17, 24, 220, 556, 'Xalqako\'l', NULL, 'Халқакўл', NULL, 'Халкакул', NULL),
(1724220800, 17, 24, 220, 800, 'Guliston tumanining qishloq fuqarolar yig\'inlari', NULL, 'Гулистон туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Гулистанского района', NULL),
(1724220805, 17, 24, 220, 805, 'Oltintepa', NULL, 'Олтинтепа', NULL, 'Алтынтепа', NULL),
(1724220816, 17, 24, 220, 816, 'Soyibobod', NULL, 'Сойибобод', NULL, 'Саибобод', NULL),
(1724220820, 17, 24, 220, 820, 'Xumo', NULL, 'Хумо', NULL, 'Хумо', NULL),
(1724220823, 17, 24, 220, 823, 'Kunchi', NULL, 'Кунчи', NULL, 'Кунчи', NULL),
(1724220827, 17, 24, 220, 827, 'Beshbuloq', NULL, 'Бешбулоқ', NULL, 'Бешбулак', NULL),
(1724220835, 17, 24, 220, 835, 'Chortoq', NULL, 'Чортоқ', NULL, 'Чоpток', NULL),
(1724220846, 17, 24, 220, 846, 'Oltin O\'rda', NULL, 'Олтин Ўрда', NULL, 'Олтин Уpда', NULL),
(1724220879, 17, 24, 220, 879, 'Zarbdor', NULL, 'Зарбдор', NULL, 'Зарбдар', NULL),
(1724220882, 17, 24, 220, 882, 'Soxilobod', NULL, 'Сохилобод', NULL, 'Сахилабад', NULL),
(1724226550, 17, 24, 226, 550, 'Sardoba tumanining shaharchalari', NULL, 'Сардоба туманининг шаҳарчалари', NULL, 'Городские поселки  Сардобского района', NULL),
(1724226551, 17, 24, 226, 551, 'Paxtaobod', NULL, 'Пахтаобод', NULL, 'Пахтаабад', NULL),
(1724226800, 17, 24, 226, 800, 'Sardoba tumanining qishloq fuqarolar yig\'inlari', NULL, 'Сардоба туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Сардобского района', NULL),
(1724226811, 17, 24, 226, 811, 'Cho\'lquvar', NULL, 'ЧўлҚувар', NULL, 'Чулкуваp', NULL),
(1724226822, 17, 24, 226, 822, 'Guliston', NULL, 'Гулистон', NULL, 'Гулистон', NULL),
(1724226833, 17, 24, 226, 833, 'Yangiqishloq', NULL, 'Янгиқишлоқ', NULL, 'Янгикишлак', NULL),
(1724226844, 17, 24, 226, 844, 'Gulzor', NULL, 'Гулзор', NULL, 'Гульзар', NULL),
(1724226855, 17, 24, 226, 855, 'Yangiobod', NULL, 'Янгиобод', NULL, 'Янгиабад', NULL),
(1724226865, 17, 24, 226, 865, 'Qo\'rg\'ontepa', NULL, 'Қўрғонтепа', NULL, 'Куpгантепа', NULL),
(1724228550, 17, 24, 228, 550, 'Mirzaobod tumanining shaharchalari', NULL, 'Мирзаобод туманининг шаҳарчалари', NULL, 'Городские поселки Мирзаабадского района', NULL),
(1724228551, 17, 24, 228, 551, 'Navro\'z', NULL, 'Наврўз', NULL, 'Навруз', NULL),
(1724228552, 17, 24, 228, 552, 'Oqoltin', NULL, 'Оқолтин', NULL, 'Акалтин', NULL),
(1724228800, 17, 24, 228, 800, 'Mirzaobod tumanining qishloq fuqarolar yig\'inlari', NULL, 'Мирзаобод туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Мирзаабадского района', NULL),
(1724228805, 17, 24, 228, 805, 'Bahoriston', NULL, 'Баҳористон', NULL, 'Бахористан', NULL),
(1724228818, 17, 24, 228, 818, 'Oqoltin', NULL, 'Оқолтин', NULL, 'Акалтын', NULL),
(1724228830, 17, 24, 228, 830, 'Mehnatobod', NULL, 'Меҳнатобод', NULL, 'Мехнатабад', NULL),
(1724228832, 17, 24, 228, 832, 'Mirzacho\'l', NULL, 'Мирзачўл', NULL, 'Мирзачуль', NULL),
(1724228835, 17, 24, 228, 835, 'Navbahor', NULL, 'Навбаҳор', NULL, 'Навбахор', NULL),
(1724228838, 17, 24, 228, 838, 'Toshkent', NULL, 'Тошкент', NULL, 'Ташкент', NULL),
(1724228845, 17, 24, 228, 845, 'Birlashgan', NULL, 'Бирлашган', NULL, 'Биpлашган', NULL),
(1724228860, 17, 24, 228, 860, 'Nurafshon', NULL, 'Нурафшон', NULL, 'Нуpафшан', NULL),
(1724228869, 17, 24, 228, 869, 'Yo\'ldoshobod', NULL, 'Йўлдошобод', NULL, 'Юлдашабад', NULL),
(1724231500, 17, 24, 231, 500, 'Sirdaryo tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Сирдарё туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Сырдарьинского района', NULL),
(1724231501, 17, 24, 231, 501, 'Sirdaryo', NULL, 'Сирдарё', NULL, 'Сыpдаpья', NULL),
(1724231503, 17, 24, 231, 503, 'Baxt', NULL, 'Бахт', NULL, 'Бахт', NULL),
(1724231550, 17, 24, 231, 550, 'Sirdaryo tumanining shaharchalari', NULL, 'Сирдарё туманининг  шаҳарчалари', NULL, 'Городские поселки Сырдарьинского района', NULL),
(1724231552, 17, 24, 231, 552, 'Quyosh', NULL, 'Қуёш', NULL, 'Куеш', NULL),
(1724231553, 17, 24, 231, 553, 'Malik', NULL, 'Малик', NULL, 'Малек', NULL),
(1724231554, 17, 24, 231, 554, 'Ziyokor', NULL, 'Зиёкор', NULL, 'Зиекор', NULL),
(1724231555, 17, 24, 231, 555, 'J.Mamanov', NULL, 'Ж.Маманов', NULL, 'Дж.Маманов', NULL),
(1724231800, 17, 24, 231, 800, 'Sirdaryo tumanining qishloq fuqarolar yig\'inlari', NULL, 'Сирдарё туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Сырдарьинского района', NULL),
(1724231811, 17, 24, 231, 811, 'Xaqiqat', NULL, 'Хақиқат', NULL, 'Хакикат', NULL),
(1724231822, 17, 24, 231, 822, 'Turon', NULL, 'Турон', NULL, 'Туpон', NULL),
(1724231827, 17, 24, 231, 827, 'Xalqobod', NULL, 'Халқобод', NULL, 'Халкабад', NULL),
(1724231833, 17, 24, 231, 833, 'Malik', NULL, 'Малик', NULL, 'Малик', NULL),
(1724231844, 17, 24, 231, 844, 'Oydin', NULL, 'Ойдин', NULL, 'Ойдин', NULL),
(1724231848, 17, 24, 231, 848, 'Paxtazor', NULL, 'Пахтазор', NULL, 'Пахтазор', NULL),
(1724231855, 17, 24, 231, 855, 'Sirdaryo', NULL, 'Сирдарё', NULL, 'Сырдарья', NULL),
(1724231866, 17, 24, 231, 866, 'Cho\'lto\'qay', NULL, 'Чўлтўқай', NULL, 'Чултукай', NULL),
(1724231870, 17, 24, 231, 870, 'Sholikor', NULL, 'Шоликор', NULL, 'Шаликор', NULL),
(1724235550, 17, 24, 235, 550, 'Xovos tumanining shaharchalari', NULL, 'Ховос туманининг шаҳарчалари', NULL, 'Городские поселки Хавасского района', NULL),
(1724235551, 17, 24, 235, 551, 'Xovos', NULL, 'Ховос', NULL, 'Хавас', NULL),
(1724235553, 17, 24, 235, 553, 'Gulbahor', NULL, 'Гулбаҳор', NULL, 'Гулбахор', NULL),
(1724235800, 17, 24, 235, 800, 'Xovos tumanining qishloq fuqarolar yig\'inlari', NULL, 'Ховос туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Хавасского района', NULL),
(1724235805, 17, 24, 235, 805, 'Binokor', NULL, 'Бинокор', NULL, 'Бинокор', NULL),
(1724235808, 17, 24, 235, 808, 'Gulbahor', NULL, 'Гулбаҳор', NULL, 'Гульбахор', NULL),
(1724235813, 17, 24, 235, 813, 'Zafarobod', NULL, 'Зафаробод', NULL, 'Зафарабад', NULL),
(1724235817, 17, 24, 235, 817, 'Paxtakor', NULL, 'Пахтакор', NULL, 'Пахтакор', NULL),
(1724235820, 17, 24, 235, 820, 'Soxibkor', NULL, 'Сохибкор', NULL, 'Сахибкор', NULL),
(1724235821, 17, 24, 235, 821, 'Turkiston', NULL, 'Туркистон', NULL, 'Туpкистан', NULL),
(1724235822, 17, 24, 235, 822, 'Farxod', NULL, 'Фарход', NULL, 'Фархад', NULL),
(1724235835, 17, 24, 235, 835, 'Xovotog\'', NULL, 'Ховотоғ', NULL, 'Хаватаг', NULL),
(1724235837, 17, 24, 235, 837, 'Xusnobod', NULL, 'Хуснобод', NULL, 'Хуснабад', NULL),
(1724235839, 17, 24, 235, 839, 'Chamanzor', NULL, 'Чаманзор', NULL, 'Чаманзар', NULL),
(1724235843, 17, 24, 235, 843, 'Qahramon', NULL, 'Қаҳрамон', NULL, 'Кахрамон', NULL),
(1724401800, 17, 24, 401, 800, 'Guliston shahar hokimiyatiga qarashli qishloq fuqarolar yig\'inlari', NULL, 'Гулистон шаҳар ҳокимиятига қарашли қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы гр-н, подч. Гулистанскому горхок-ту', NULL),
(1724401807, 17, 24, 401, 807, 'Ulug\'obod', NULL, 'Улуғобод', NULL, 'Улугабад', NULL),
(1724401810, 17, 24, 401, 810, 'Do\'stlik', NULL, 'Дўстлик', NULL, 'Дустлик', NULL),
(1724401815, 17, 24, 401, 815, 'Bahor', NULL, 'Баҳор', NULL, 'Бахор', NULL),
(1726269550, 17, 26, 269, 550, 'Mirzo Ulug\'bek tumani hokimiyatiga qarashli shaharlar', NULL, 'Мирзо Улуғбек тумани ҳокимиятига қарашли шаҳарлар', NULL, 'Городские поселки,подч. хок-ту М.Улугбекского р-на', NULL),
(1726269558, 17, 26, 269, 558, 'Ulug\'bek', NULL, 'Улуғбек', NULL, 'Улугбек', NULL),
(1727206500, 17, 27, 206, 500, 'Oqqo\'rg\'on tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Оққўрғон туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Аккурганского района', NULL),
(1727206501, 17, 27, 206, 501, 'Oqqo\'rg\'on', NULL, 'Оққўрғон', NULL, 'Аккурган', NULL),
(1727206550, 17, 27, 206, 550, 'Oqqo\'rg\'on tumanining shaharchalari', NULL, 'Оққўрғон туманининг шаҳарчалари', NULL, 'Городские поселки Аккуpганского pайона', NULL),
(1727206554, 17, 27, 206, 554, 'Olimkent', NULL, 'Олимкент', NULL, 'Алимкент', NULL),
(1727206558, 17, 27, 206, 558, 'Hamzaobod', NULL, 'Ҳамзаобод', NULL, 'Хамзаабад', NULL),
(1727206800, 17, 27, 206, 800, 'Oqqo\'rg\'on tumanining qishloq fuqarolar yig\'inlari', NULL, 'Оққўрғон туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Аккурганского района', NULL),
(1727206804, 17, 27, 206, 804, 'Oytamg\'ali', NULL, 'Ойтамғали', NULL, 'Айтамгали', NULL),
(1727206806, 17, 27, 206, 806, 'Oqqo\'rg\'on', NULL, 'Оққўрғон', NULL, 'Аккурган', NULL),
(1727206808, 17, 27, 206, 808, 'Achchi', NULL, 'Аччи', NULL, 'Аччи', NULL),
(1727206820, 17, 27, 206, 820, 'Do\'stlik', NULL, 'Дўстлик', NULL, 'Дустлик', NULL),
(1727206822, 17, 27, 206, 822, 'Zarbdor', NULL, 'Зарбдор', NULL, 'Зарбдар', NULL),
(1727206824, 17, 27, 206, 824, 'Shoxruxiya', NULL, 'Шохрухия', NULL, 'Шохрухия', NULL),
(1727206838, 17, 27, 206, 838, 'Erkinlik', NULL, 'Эркинлик', NULL, 'Эpкинлик', NULL),
(1727206846, 17, 27, 206, 846, 'Zafar', NULL, 'Зафар', NULL, 'Зафар', NULL),
(1727206854, 17, 27, 206, 854, 'Toshto\'g\'on', NULL, 'Тоштўғон', NULL, 'Таштуган', NULL),
(1727206865, 17, 27, 206, 865, 'Eltamg\'ali', NULL, 'Элтамғали', NULL, 'Элтамгалы', NULL),
(1727212550, 17, 27, 212, 550, 'Ohangaron tumanining shaharchalari', NULL, 'Оҳангарон туманининг шаҳарчалари', NULL, 'Городские поселки Ахангаранского района', NULL),
(1727212552, 17, 27, 212, 552, 'Yon-ariq', NULL, 'Ён-ариқ', NULL, 'Ен-арик', NULL),
(1727212554, 17, 27, 212, 554, 'Qora Xitoy', NULL, 'Қора Хитой', NULL, 'Каракитай', NULL),
(1727212556, 17, 27, 212, 556, 'Telov', NULL, 'Телов', NULL, 'Телов', NULL),
(1727212558, 17, 27, 212, 558, 'Eyvalek', NULL, 'Эйвалек', NULL, 'Эйвалек', NULL),
(1727212800, 17, 27, 212, 800, 'Ohangaron tumanining qishloq fuqarolar yig\'inlari', NULL, 'Оҳангарон туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Ахангаранского района', NULL),
(1727212811, 17, 27, 212, 811, 'Uvaq', NULL, 'Увақ', NULL, 'Увак', NULL),
(1727212814, 17, 27, 212, 814, 'Birlik', NULL, 'Бирлик', NULL, 'Бирлик', NULL),
(1727212820, 17, 27, 212, 820, 'Do\'stlik', NULL, 'Дўстлик', NULL, 'Дустлик', NULL),
(1727212822, 17, 27, 212, 822, 'Qurama', NULL, 'Қурама', NULL, 'Курама', NULL),
(1727212833, 17, 27, 212, 833, 'Qora xitoy', NULL, 'Қора хитой', NULL, 'Карахтай', NULL),
(1727212846, 17, 27, 212, 846, 'Ozodlik', NULL, 'Озодлик', NULL, 'Озодлик', NULL),
(1727212854, 17, 27, 212, 854, 'Susam', NULL, 'Сусам', NULL, 'Сусам', NULL),
(1727212865, 17, 27, 212, 865, 'Telov', NULL, 'Телов', NULL, 'Телав', NULL),
(1727220550, 17, 27, 220, 550, 'Bekobod tumanining shaharchalari', NULL, 'Бекобод туманининг шаҳарчалари', NULL, 'Городские поселки Бекабадского района', NULL),
(1727220551, 17, 27, 220, 551, 'Zafar', NULL, 'Зафар', NULL, 'Зафар', NULL),
(1727220553, 17, 27, 220, 553, 'Bobur', NULL, 'Бобур', NULL, 'Бобур', NULL),
(1727220557, 17, 27, 220, 557, 'Ko\'rkam', NULL, 'Кўркам', NULL, 'Куркам', NULL),
(1727220559, 17, 27, 220, 559, 'Xos', NULL, 'Хос', NULL, 'Хос', NULL),
(1727220561, 17, 27, 220, 561, 'Gulzor', NULL, 'Гулзор', NULL, 'Гулзор', NULL),
(1727220800, 17, 27, 220, 800, 'Bekobod tumanining qishloq fuqarolar yig\'inlari', NULL, 'Бекобод  туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Бекабадского района', NULL),
(1727220804, 17, 27, 220, 804, 'Mo\'yinqum', NULL, 'Мўйинқум', NULL, 'Муйинкум', NULL),
(1727220808, 17, 27, 220, 808, 'Bahoriston', NULL, 'Баҳористон', NULL, 'Бахористан', NULL),
(1727220811, 17, 27, 220, 811, 'Bekobod', NULL, 'Бекобод', NULL, 'Бекабад', NULL),
(1727220822, 17, 27, 220, 822, 'Dalvarzin', NULL, 'Далварзин', NULL, 'Дальверзин', NULL),
(1727220825, 17, 27, 220, 825, 'Guliston', NULL, 'Гулистон', NULL, 'Гулистан', NULL),
(1727220827, 17, 27, 220, 827, 'Madaniyat', NULL, 'Маданият', NULL, 'Маданият', NULL),
(1727220835, 17, 27, 220, 835, 'Jumabozor', NULL, 'Жумабозор', NULL, 'Джумабазар', NULL),
(1727220846, 17, 27, 220, 846, 'Qiyot', NULL, 'Қиёт', NULL, 'Кият', NULL),
(1727220857, 17, 27, 220, 857, 'Mehnatobod', NULL, 'Меҳнатобод', NULL, 'Мехнатабад', NULL),
(1727220868, 17, 27, 220, 868, 'Yangiqo\'rg\'on', NULL, 'Янгиқўрғон', NULL, 'Янгикургон', NULL),
(1727220879, 17, 27, 220, 879, 'Chanoq', NULL, 'Чаноқ', NULL, 'Чанак', NULL),
(1727220890, 17, 27, 220, 890, 'Yangi hayot', NULL, 'Янги ҳаёт', NULL, 'Янгихаят', NULL),
(1727224500, 17, 27, 224, 500, 'Bo\'stonliq tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Бўстонлиқ туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Бостанлыкского района', NULL),
(1727224501, 17, 27, 224, 501, 'G\'azalkent', NULL, 'Ғазалкент', NULL, 'Газалкент', NULL),
(1727224550, 17, 27, 224, 550, 'Bo\'stonliq tumanining shaharchalari', NULL, 'Бўстонлиқ туманининг  шаҳарчалари', NULL, 'Городские поселки Бостанлыкского района', NULL),
(1727224554, 17, 27, 224, 554, 'Iskandar', NULL, 'Искандар', NULL, 'Искандар', NULL),
(1727224558, 17, 27, 224, 558, 'Chorvoq', NULL, 'Чорвоқ', NULL, 'Чарвак', NULL),
(1727224560, 17, 27, 224, 560, 'Burchmullo', NULL, 'Бурчмулло', NULL, 'Бурчмулло', NULL),
(1727224562, 17, 27, 224, 562, 'Pargos', NULL, 'Паргос', NULL, 'Паргос', NULL),
(1727224564, 17, 27, 224, 564, 'Sari qanli', NULL, 'Сари қанли', NULL, 'Сари Канли', NULL),
(1727224566, 17, 27, 224, 566, 'Sobir Raximov', NULL, 'Собир Рахимов', NULL, 'Собир Рахимов', NULL),
(1727224568, 17, 27, 224, 568, 'Soyliq', NULL, 'Сойлиқ', NULL, 'Сойлик', NULL),
(1727224572, 17, 27, 224, 572, 'Talpin', NULL, 'Талпин', NULL, 'Талпин', NULL),
(1727224574, 17, 27, 224, 574, 'Tulabe', NULL, 'Тулабе', NULL, 'Тулабе', NULL),
(1727224576, 17, 27, 224, 576, 'Uyenqulsoy', NULL, 'Уенқулсой', NULL, 'Уенкулсай', NULL),
(1727224578, 17, 27, 224, 578, 'Xumsan', NULL, 'Хумсан', NULL, 'Хумсон', NULL),
(1727224582, 17, 27, 224, 582, 'Ho\'ja', NULL, 'Ҳўжа', NULL, 'Хужа', NULL),
(1727224584, 17, 27, 224, 584, 'Xo\'jakent', NULL, 'Хўжакент', NULL, 'Хужакент', NULL),
(1727224586, 17, 27, 224, 586, 'Chinor', NULL, 'Чинор', NULL, 'Чинор', NULL),
(1727224588, 17, 27, 224, 588, 'Qoronqul', NULL, 'Қоронқул', NULL, 'Коронкул', NULL),
(1727224592, 17, 27, 224, 592, 'Qurbonov nomli', NULL, 'Қурбонов номли', NULL, 'Курбонов', NULL),
(1727224594, 17, 27, 224, 594, 'Qo\'shqo\'rg\'on', NULL, 'Қўшқўрғон', NULL, 'Кушкурган', NULL),
(1727224800, 17, 27, 224, 800, 'Bo\'stonliq tumanining qishloq fuqarolar yig\'inlari', NULL, 'Бўстонлиқ  туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Бостанлыкского района', NULL),
(1727224810, 17, 27, 224, 810, 'Bo\'stonliq', NULL, 'Бўстонлиқ', NULL, 'Бостанлык', NULL),
(1727224815, 17, 27, 224, 815, 'Chimgan', NULL, 'Чимган', NULL, 'Чимган', NULL),
(1727224822, 17, 27, 224, 822, 'G\'azalkent', NULL, 'Ғазалкент', NULL, 'Газалкент', NULL),
(1727224827, 17, 27, 224, 827, 'Xumsan', NULL, 'Хумсан', NULL, 'Хумсан', NULL),
(1727224833, 17, 27, 224, 833, 'Dumaloq', NULL, 'Думалоқ', NULL, 'Думалак', NULL),
(1727224835, 17, 27, 224, 835, 'Nanay', NULL, 'Нанай', NULL, 'Нанай', NULL),
(1727224838, 17, 27, 224, 838, 'Qoramanas', NULL, 'Қораманас', NULL, 'Караманас', NULL),
(1727224845, 17, 27, 224, 845, 'Qo\'shqo\'rg\'on', NULL, 'Қўшқўрғон', NULL, 'Кошкурган', NULL),
(1727224850, 17, 27, 224, 850, 'Chimboyliq', NULL, 'Чимбойлиқ', NULL, 'Чимбайлык', NULL),
(1727224856, 17, 27, 224, 856, 'Soyliq', NULL, 'Сойлиқ', NULL, 'Сайлык', NULL),
(1727224860, 17, 27, 224, 860, 'Sijjak', NULL, 'Сижжак', NULL, 'Сиджак', NULL),
(1727224865, 17, 27, 224, 865, 'Pargos', NULL, 'Паргос', NULL, 'Паpгос', NULL),
(1727224867, 17, 27, 224, 867, 'Pskom', NULL, 'Пском', NULL, 'Пском', NULL),
(1727224878, 17, 27, 224, 878, 'Xo\'jakent', NULL, 'Хўжакент', NULL, 'Хужакент', NULL),
(1727224889, 17, 27, 224, 889, 'Xondoyliq', NULL, 'Хондойлиқ', NULL, 'Хандайлык', NULL),
(1727224893, 17, 27, 224, 893, 'Yangi ovul', NULL, 'Янги овул', NULL, 'Янгиаул', NULL),
(1727224895, 17, 27, 224, 895, 'Azadbash', NULL, 'Азадбаш', NULL, 'Азадбаш', NULL),
(1727224897, 17, 27, 224, 897, 'Bog\'iston', NULL, 'Боғистон', NULL, 'Богустан', NULL),
(1727228500, 17, 27, 228, 500, 'Bo\'ka tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Бўка туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Букинского района', NULL),
(1727228501, 17, 27, 228, 501, 'Bo\'ka', NULL, 'Бўка', NULL, 'Бука', NULL),
(1727228800, 17, 27, 228, 800, 'Bo\'ka tumanining qishloq fuqarolar yig\'inlari', NULL, 'Бўка  туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Букинского района', NULL),
(1727228803, 17, 27, 228, 803, 'Iftixor', NULL, 'Ифтихор', NULL, 'Ифтихор', NULL),
(1727228811, 17, 27, 228, 811, 'Qoraqo\'yli', NULL, 'Қорақўйли', NULL, 'Каракуйли', NULL),
(1727228822, 17, 27, 228, 822, 'Turon', NULL, 'Турон', NULL, 'Туpон', NULL),
(1727228833, 17, 27, 228, 833, 'Ko\'korol', NULL, 'Кўкорол', NULL, 'Кокарал', NULL),
(1727228835, 17, 27, 228, 835, 'Qo\'shtepa', NULL, 'Қўштепа', NULL, 'Коштепа', NULL),
(1727228844, 17, 27, 228, 844, 'Namuna', NULL, 'Намуна', NULL, 'Намуна', NULL),
(1727228855, 17, 27, 228, 855, 'Rovot', NULL, 'Ровот', NULL, 'Рават', NULL),
(1727228866, 17, 27, 228, 866, 'Chig\'atoy', NULL, 'Чиғатой', NULL, 'Чигатай', NULL),
(1727233500, 17, 27, 233, 500, 'Quyichirchiq t-nining tuman ahamiyatiga ega sh-lari', NULL, 'Қуйичирчиқ т-нининг туман аҳамиятига эга ш-лари', NULL, 'Города районного подчинения Куйичирчикского района', NULL),
(1727233501, 17, 27, 233, 501, 'Do\'stobod', NULL, 'Дўстобод', NULL, 'Дустобод', NULL),
(1727233550, 17, 27, 233, 550, 'Quyichirchiq tumanining shaharchalari', NULL, 'Қуйичирчиқ туманининг шаҳарчалари', NULL, 'Городские поселки Куйичирчикского района', NULL),
(1727233552, 17, 27, 233, 552, 'Qo\'rg\'oncha', NULL, 'Қўрғонча', NULL, 'Курганча', NULL),
(1727233554, 17, 27, 233, 554, 'Paxtazor', NULL, 'Пахтазор', NULL, 'Пахтазор', NULL),
(1727233800, 17, 27, 233, 800, 'Quyichirchiq tumanining qishloq fuqarolar yig\'inlari', NULL, 'Қуйичирчиқ туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Куйичирчикского района', NULL),
(1727233804, 17, 27, 233, 804, 'Gul', NULL, 'Гул', NULL, 'Гуль', NULL),
(1727233810, 17, 27, 233, 810, 'Ketmontepa', NULL, 'Кетмонтепа', NULL, 'Кетментепа', NULL),
(1727233815, 17, 27, 233, 815, 'Maydontol', NULL, 'Майдонтол', NULL, 'Майдантал', NULL),
(1727233830, 17, 27, 233, 830, 'Qo\'rg\'oncha', NULL, 'Қўрғонча', NULL, 'Курганча', NULL),
(1727233840, 17, 27, 233, 840, 'Ma\'naviyat', NULL, 'Маънавият', NULL, 'Маънавият', NULL),
(1727233850, 17, 27, 233, 850, 'Ma\'rifat', NULL, 'Маърифат', NULL, 'Маърифат', NULL),
(1727233860, 17, 27, 233, 860, 'O\'zbekiston', NULL, 'Ўзбекистон', NULL, 'Узбекистан', NULL),
(1727233870, 17, 27, 233, 870, 'Toshovul', NULL, 'Тошовул', NULL, 'Ташаул', NULL),
(1727233872, 17, 27, 233, 872, 'Toshloq', NULL, 'Тошлоқ', NULL, 'Ташлак', NULL),
(1727237550, 17, 27, 237, 550, 'Zangiota tumanining shaharchalari', NULL, 'Зангиота туманининг шаҳарчалари', NULL, 'Городские поселки Зангиатинского района', NULL),
(1727237552, 17, 27, 237, 552, 'Eshonguzar', NULL, 'Эшонгузар', NULL, 'Эшангузар', NULL),
(1727237558, 17, 27, 237, 558, 'O\'rtaovul', NULL, 'Ўртаовул', NULL, 'Уртааул', NULL),
(1727237562, 17, 27, 237, 562, 'Xonabod', NULL, 'Хонабод', NULL, 'Ханабад', NULL),
(1727237564, 17, 27, 237, 564, 'Erkin', NULL, 'Эркин', NULL, 'Эркин', NULL),
(1727237566, 17, 27, 237, 566, 'Quyoshli', NULL, 'Қуёшли', NULL, 'Куешли', NULL),
(1727237568, 17, 27, 237, 568, 'Daliguzar', NULL, 'Далигузар', NULL, 'Далигузар', NULL),
(1727237571, 17, 27, 237, 571, 'Pastdarxon', NULL, 'Пастдархон', NULL, 'Пасдархон', NULL),
(1727237572, 17, 27, 237, 572, 'Tarnov', NULL, 'Тарнов', NULL, 'Тарнов', NULL),
(1727237574, 17, 27, 237, 574, 'Zangiota', NULL, 'Зангиота', NULL, 'Зангиата', NULL),
(1727237576, 17, 27, 237, 576, 'Nazarbek', NULL, 'Назарбек', NULL, 'Назарбек', NULL),
(1727237578, 17, 27, 237, 578, 'Axmad Yassaviy', NULL, 'Ахмад Яссавий', NULL, 'Ахмад Яссавий', NULL),
(1727237582, 17, 27, 237, 582, 'Ulug\'bek', NULL, 'Улуғбек', NULL, 'Улугбек', NULL),
(1727237800, 17, 27, 237, 800, 'Zangiota tumanining qishloq fuqarolar yig\'inlari', NULL, 'Зангиота туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Зангиатинского района', NULL),
(1727237809, 17, 27, 237, 809, 'Turkiston', NULL, 'Туркистон', NULL, 'Туркистон', NULL),
(1727237818, 17, 27, 237, 818, 'Qatortol', NULL, 'Қатортол', NULL, 'Катартал', NULL),
(1727237832, 17, 27, 237, 832, 'Chig\'atoy-Oqtepa', NULL, 'Чиғатой-Оқтепа', NULL, 'Чигатай-Актепа', NULL),
(1727237836, 17, 27, 237, 836, 'Nazarbek', NULL, 'Назарбек', NULL, 'Назарбек', NULL),
(1727237840, 17, 27, 237, 840, 'Zangiota', NULL, 'Зангиота', NULL, 'Зангиата', NULL),
(1727237852, 17, 27, 237, 852, 'O\'zgarish', NULL, 'Ўзгариш', NULL, 'Узгариш', NULL),
(1727237859, 17, 27, 237, 859, 'Boz-su', NULL, 'Боз-су', NULL, 'Боз-су', NULL),
(1727237870, 17, 27, 237, 870, 'Honobod', NULL, 'Ҳонобод', NULL, 'Ханабад', NULL),
(1727237875, 17, 27, 237, 875, 'Erkin', NULL, 'Эркин', NULL, 'Эркин', NULL),
(1727239550, 17, 27, 239, 550, 'Yuqorichirchiq tumanining shaharchalari', NULL, 'Юқоричирчиқ туманининг шаҳарчалари', NULL, 'Городские поселки Юкоричирчикского района', NULL),
(1727239551, 17, 27, 239, 551, 'Yangibozor', NULL, 'Янгибозор', NULL, 'Янгибазар', NULL),
(1727239553, 17, 27, 239, 553, 'Mirobod', NULL, 'Миробод', NULL, 'Мирабад', NULL),
(1727239555, 17, 27, 239, 555, 'Xitoy Tepa', NULL, 'Хитой Тепа', NULL, 'Китай тепа', NULL),
(1727239800, 17, 27, 239, 800, 'Yuqorichirchiq tumanining qishloq fuqarolar yig\'inlari', NULL, 'Юқоричирчиқ туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Юкоричирчикского района', NULL),
(1727239806, 17, 27, 239, 806, 'Oqovul', NULL, 'Оқовул', NULL, 'Акаоул', NULL),
(1727239812, 17, 27, 239, 812, 'Arganchi', NULL, 'Арганчи', NULL, 'Арганчи', NULL),
(1727239823, 17, 27, 239, 823, 'Bordonko\'l', NULL, 'Бордонкўл', NULL, 'Барданкуль', NULL),
(1727239830, 17, 27, 239, 830, 'Jambul', NULL, 'Жамбул', NULL, 'Джамбул', NULL),
(1727239835, 17, 27, 239, 835, 'Sakson ota', NULL, 'Саксон ота', NULL, 'Саксан-ата', NULL),
(1727239840, 17, 27, 239, 840, 'Navro\'z', NULL, 'Наврўз', NULL, 'Навруз', NULL),
(1727239867, 17, 27, 239, 867, 'Istiqlol', NULL, 'Истиқлол', NULL, 'Истиклол', NULL),
(1727239882, 17, 27, 239, 882, 'Surnkent', NULL, 'Сурнкент', NULL, 'Суранкент', NULL),
(1727239885, 17, 27, 239, 885, 'Tinchlik', NULL, 'Тинчлик', NULL, 'Тинчлик', NULL),
(1727248550, 17, 27, 248, 550, 'Qibray tumanining shaharchalari', NULL, 'Қибрай туманининг шаҳарчалари', NULL, 'Городские поселки Кибрайского района', NULL),
(1727248551, 17, 27, 248, 551, 'Qibray', NULL, 'Қибрай', NULL, 'Кибрай', NULL),
(1727248556, 17, 27, 248, 556, 'Salar', NULL, 'Салар', NULL, 'Салар', NULL),
(1727248558, 17, 27, 248, 558, 'Argin', NULL, 'Аргин', NULL, 'Аргин', NULL),
(1727248559, 17, 27, 248, 559, 'Taraqqiyot', NULL, 'ТарақҚиёт', NULL, 'Тараккиет', NULL),
(1727248561, 17, 27, 248, 561, 'Alisherobod', NULL, 'Алишеробод', NULL, 'Алишерабад', NULL),
(1727248563, 17, 27, 248, 563, 'Geofizika', NULL, 'Геофизика', NULL, 'Геофизика', NULL),
(1727248565, 17, 27, 248, 565, 'Do\'rmon', NULL, 'Дўрмон', NULL, 'Дурмон', NULL),
(1727248567, 17, 27, 248, 567, 'Yoshlik', NULL, 'Ёшлик', NULL, 'Ешлик', NULL),
(1727248569, 17, 27, 248, 569, 'Ko\'prik boshi', NULL, 'Кўприк боши', NULL, 'Куприк боши', NULL),
(1727248571, 17, 27, 248, 571, 'Madaniyat', NULL, 'Маданият', NULL, 'Маданият', NULL),
(1727248573, 17, 27, 248, 573, 'Mustaqillik', NULL, 'Мустақиллик', NULL, 'Мустакиллик', NULL),
(1727248575, 17, 27, 248, 575, 'Nurafshon', NULL, 'Нурафшон', NULL, 'Нурафшон', NULL),
(1727248577, 17, 27, 248, 577, 'Uymaut', NULL, 'Уймаут', NULL, 'Уймамут', NULL),
(1727248579, 17, 27, 248, 579, 'Unqo\'rg\'on-1', NULL, 'Унқўрғон-1', NULL, 'Ункургон-1', NULL),
(1727248581, 17, 27, 248, 581, 'O\'tkir', NULL, 'Ўткир', NULL, 'Уткир', NULL),
(1727248583, 17, 27, 248, 583, 'X.Amirov', NULL, 'Х.Амиров', NULL, 'Х.Амиров', NULL),
(1727248800, 17, 27, 248, 800, 'Qibray tumanining qishloq fuqarolar yig\'inlari', NULL, 'Қибрай туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Кибрайского района', NULL),
(1727248811, 17, 27, 248, 811, 'Baytqo\'rg\'on', NULL, 'Байтқўрғон', NULL, 'Байткурган', NULL),
(1727248820, 17, 27, 248, 820, 'Yangiobod', NULL, 'Янгиобод', NULL, 'Янгиабад', NULL),
(1727248844, 17, 27, 248, 844, 'Unqo\'rg\'on', NULL, 'Унқўрғон', NULL, 'Ункурган', NULL),
(1727248848, 17, 27, 248, 848, 'Qipchoq', NULL, 'Қипчоқ', NULL, 'Кипчак', NULL),
(1727248855, 17, 27, 248, 855, 'Zafarobod', NULL, 'Зафаробод', NULL, 'Зафаробод', NULL),
(1727248860, 17, 27, 248, 860, 'Oq-qovoq', NULL, 'Оқ-қовоқ', NULL, 'Окковок', NULL),
(1727248866, 17, 27, 248, 866, 'Do\'rmon', NULL, 'Дўрмон', NULL, 'Дурмон', NULL),
(1727248877, 17, 27, 248, 877, 'Tuzel', NULL, 'Тузел', NULL, 'Тузель', NULL),
(1727248888, 17, 27, 248, 888, 'Chinobod', NULL, 'Чинобод', NULL, 'Чинабад', NULL),
(1727248895, 17, 27, 248, 895, 'Yon-ariq', NULL, 'Ён-ариқ', NULL, 'Енарык', NULL),
(1727249500, 17, 27, 249, 500, 'Parkent tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Паркент туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Паркентского района', NULL),
(1727249501, 17, 27, 249, 501, 'Parkent', NULL, 'Паркент', NULL, 'Паркент', NULL),
(1727249550, 17, 27, 249, 550, 'Parkent tumanining shaharchalari', NULL, 'Паркент туманининг шаҳарчалари', NULL, 'Городские поселки Паркентского района', NULL),
(1727249553, 17, 27, 249, 553, 'Quyosh', NULL, 'Қуёш', NULL, 'Куеш', NULL),
(1727249555, 17, 27, 249, 555, 'Qo\'rg\'ontepa', NULL, 'Қўрғонтепа', NULL, 'Кургантепа', NULL),
(1727249557, 17, 27, 249, 557, 'Chinorli', NULL, 'Чинорли', NULL, 'Чинорли', NULL),
(1727249800, 17, 27, 249, 800, 'Parkent tumanining qishloq fuqarolar yig\'inlari', NULL, 'Паркент туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Паркентского района', NULL),
(1727249811, 17, 27, 249, 811, 'Zarkent', NULL, 'Заркент', NULL, 'Заркент', NULL),
(1727249815, 17, 27, 249, 815, 'Qoraqalpoq', NULL, 'Қорақалпоқ', NULL, 'Каракалпак', NULL),
(1727249817, 17, 27, 249, 817, 'Bo\'ston', NULL, 'Бўстон', NULL, 'Бустан', NULL),
(1727249825, 17, 27, 249, 825, 'Nomdanak', NULL, 'Номданак', NULL, 'Намданак', NULL),
(1727249830, 17, 27, 249, 830, 'Parkent', NULL, 'Паркент', NULL, 'Паркент', NULL),
(1727249836, 17, 27, 249, 836, 'So\'qoq', NULL, 'Сўқоқ', NULL, 'Сукок', NULL),
(1727249850, 17, 27, 249, 850, 'Xisarak', NULL, 'Хисарак', NULL, 'Хисарак', NULL),
(1727249855, 17, 27, 249, 855, 'Boshqizilsoy', NULL, 'Бошқизилсой', NULL, 'Бошкизилсой', NULL),
(1727249860, 17, 27, 249, 860, 'Changi', NULL, 'Чанги', NULL, 'Чанги', NULL),
(1727250500, 17, 27, 250, 500, 'Pskent tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Пскент туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Пскентского района', NULL),
(1727250501, 17, 27, 250, 501, 'Pskent', NULL, 'Пскент', NULL, 'Пскент', NULL),
(1727250550, 17, 27, 250, 550, 'Pskent tumanining shaharchalari', NULL, 'Пскент туманининг  шаҳарчалари', NULL, 'Городские поселки Пскентского района', NULL),
(1727250554, 17, 27, 250, 554, 'Muratali', NULL, 'Муратали', NULL, 'Муротали', NULL),
(1727250558, 17, 27, 250, 558, 'Said', NULL, 'Саид', NULL, 'Саид', NULL),
(1727250800, 17, 27, 250, 800, 'Pskent tumanining qishloq fuqarolar yig\'inlari', NULL, 'Пскент туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Пскентского района', NULL),
(1727250811, 17, 27, 250, 811, 'Oq tepa', NULL, 'Оқ тепа', NULL, 'Актепа', NULL),
(1727250822, 17, 27, 250, 822, 'Dungqo\'rg\'on', NULL, 'Дунгқўрғон', NULL, 'Дунгкурган', NULL),
(1727250833, 17, 27, 250, 833, 'Kelovchi', NULL, 'Келовчи', NULL, 'Керавчи', NULL),
(1727250844, 17, 27, 250, 844, 'Murotali', NULL, 'Муротали', NULL, 'Муратали', NULL),
(1727250855, 17, 27, 250, 855, 'Koriz', NULL, 'Кориз', NULL, 'Кариз', NULL),
(1727250860, 17, 27, 250, 860, 'Said', NULL, 'Саид', NULL, 'Саид', NULL),
(1727253550, 17, 27, 253, 550, 'O\'rtachirchiq tumanining shaharchalari', NULL, 'Ўртачирчиқ туманининг шаҳарчалари', NULL, 'Городские поселки Уртачирчикского района', NULL),
(1727253555, 17, 27, 253, 555, 'Tuyabo\'g\'iz', NULL, 'Туябўғиз', NULL, 'Туябугуз', NULL),
(1727253561, 17, 27, 253, 561, 'Kuchluk', NULL, 'Кучлук', NULL, 'Кучлик', NULL),
(1727253565, 17, 27, 253, 565, 'Qorasuv', NULL, 'Қорасув', NULL, 'Корасув', NULL),
(1727253569, 17, 27, 253, 569, 'Sholikor', NULL, 'Шоликор', NULL, 'Шоликор', NULL),
(1727253800, 17, 27, 253, 800, 'O\'rtachirchiq tumanining qishloq fuqarolar yig\'inlari', NULL, 'Ўртачирчиқ туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Уртачирчикского района', NULL),
(1727253808, 17, 27, 253, 808, 'Angor', NULL, 'Ангор', NULL, 'Ангар', NULL),
(1727253813, 17, 27, 253, 813, 'Qumovul', NULL, 'Қумовул', NULL, 'Кумовул', NULL),
(1727253820, 17, 27, 253, 820, 'Qorasuv', NULL, 'Қорасув', NULL, 'Карасу', NULL),
(1727253832, 17, 27, 253, 832, 'Oq ota', NULL, 'Оқ ота', NULL, 'Ок- ота', NULL),
(1727253834, 17, 27, 253, 834, 'Haqiqat', NULL, 'Ҳақиқат', NULL, 'Хакикат', NULL),
(1727253841, 17, 27, 253, 841, 'Navoiy nomli', NULL, 'Навоий номли', NULL, 'им. Навои', NULL),
(1727253849, 17, 27, 253, 849, 'Yo\'ng\'ichqala', NULL, 'Йўнғичқала', NULL, 'Юнучкала', NULL),
(1727253860, 17, 27, 253, 860, 'Paxtaobod', NULL, 'Пахтаобод', NULL, 'Пахтаабад', NULL),
(1727253863, 17, 27, 253, 863, 'Paxtakor', NULL, 'Пахтакор', NULL, 'Пахтакор', NULL),
(1727253865, 17, 27, 253, 865, 'O\'rtasaroy', NULL, 'Ўртасарой', NULL, 'Урта-Сарай', NULL),
(1727253871, 17, 27, 253, 871, 'Istiqbol', NULL, 'Истиқбол', NULL, 'Истикбол', NULL),
(1727253875, 17, 27, 253, 875, 'Yangi turmush', NULL, 'Янги турмуш', NULL, 'Янгитурмуш', NULL),
(1727253880, 17, 27, 253, 880, 'Uyshun', NULL, 'Уйшун', NULL, 'Уйшун', NULL),
(1727256500, 17, 27, 256, 500, 'Chinoz tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Чиноз  туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Чиназского района', NULL),
(1727256501, 17, 27, 256, 501, 'Chinoz', NULL, 'Чиноз', NULL, 'Чиназ', NULL),
(1727256550, 17, 27, 256, 550, 'Chinoz tumanining shaharchalari', NULL, 'Чиноз  туманининг шаҳарчалари', NULL, 'Городские поселки Чиназского района', NULL),
(1727256553, 17, 27, 256, 553, 'Olmazor', NULL, 'Олмазор', NULL, 'Алмазар', NULL),
(1727256555, 17, 27, 256, 555, 'Yangi Chinoz', NULL, 'Янги Чиноз', NULL, 'Янги Чиназ', NULL),
(1727256557, 17, 27, 256, 557, 'Gulzorobod', NULL, 'Гулзоробод', NULL, 'Гулзорабад', NULL),
(1727256559, 17, 27, 256, 559, 'Do\'stlik', NULL, 'Дўстлик', NULL, 'Дустлик', NULL),
(1727256561, 17, 27, 256, 561, 'Paxta', NULL, 'Пахта', NULL, 'Пахта', NULL),
(1727256563, 17, 27, 256, 563, 'A.Temur', NULL, 'А.Темур', NULL, 'А.Темур', NULL),
(1727256565, 17, 27, 256, 565, 'Birlik', NULL, 'Бирлик', NULL, 'Бирлик', NULL),
(1727256567, 17, 27, 256, 567, 'Chorvador', NULL, 'Чорвадор', NULL, 'Чорвадор', NULL),
(1727256569, 17, 27, 256, 569, 'Kir', NULL, 'Кир', NULL, 'Кир', NULL),
(1727256800, 17, 27, 256, 800, 'Chinoz tumanining qishloq fuqarolar yig\'inlari', NULL, 'Чиноз туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Чиназского района', NULL),
(1727256813, 17, 27, 256, 813, 'Isloxat', NULL, 'Ислохат', NULL, 'Ислохат', NULL),
(1727256815, 17, 27, 256, 815, 'Eshonobod', NULL, 'Эшонобод', NULL, 'Эшонобод', NULL),
(1727256826, 17, 27, 256, 826, 'Turkiston', NULL, 'Туркистон', NULL, 'Туpкистан', NULL),
(1727256836, 17, 27, 256, 836, 'O\'zbekiston', NULL, 'Ўзбекистон', NULL, 'Узбекистан', NULL),
(1727256840, 17, 27, 256, 840, 'Chinoz', NULL, 'Чиноз', NULL, 'Чиназ', NULL),
(1727256853, 17, 27, 256, 853, 'Eski Toshkent', NULL, 'Эски Тошкент', NULL, 'Эски-Ташкент', NULL),
(1727256860, 17, 27, 256, 860, 'Ko\'tarma', NULL, 'Кўтарма', NULL, 'Кутарма', NULL),
(1727256864, 17, 27, 256, 864, 'Yollama', NULL, 'Ёллама', NULL, 'Яллама', NULL),
(1727259550, 17, 27, 259, 550, 'Yangiyo\'l tumanining shaharchalari', NULL, 'Янгийўл туманининг шаҳарчалари', NULL, 'Городские поселки Янгиюльского района', NULL);
INSERT INTO `soato` (`MHOBT_cod`, `res_id`, `region_id`, `district_id`, `qfi_id`, `name_lot`, `center_lot`, `name_cyr`, `center_cyr`, `name_ru`, `center_ru`) VALUES
(1727259553, 17, 27, 259, 553, 'Gulbahor', NULL, 'Гулбаҳор', NULL, 'Гульбахор', NULL),
(1727259555, 17, 27, 259, 555, 'Bozsu', NULL, 'Бозсу', NULL, 'Бозсу', NULL),
(1727259557, 17, 27, 259, 557, 'Nov', NULL, 'Нов', NULL, 'Нов', NULL),
(1727259559, 17, 27, 259, 559, 'Kirsadoq', NULL, 'Кирсадоқ', NULL, 'Кирсадок', NULL),
(1727259563, 17, 27, 259, 563, 'Qovunchi', NULL, 'Қовунчи', NULL, 'Ковунчи', NULL),
(1727259800, 17, 27, 259, 800, 'Yangiyo\'l tumanining qishloq fuqarolar yig\'inlari', NULL, 'Янгийўл туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Янгиюльского района', NULL),
(1727259804, 17, 27, 259, 804, 'Yo\'g\'ontepa', NULL, 'Йўғонтепа', NULL, 'Йугонтепа', NULL),
(1727259814, 17, 27, 259, 814, 'Halqobod', NULL, 'Ҳалқобод', NULL, 'Халкабад', NULL),
(1727259825, 17, 27, 259, 825, 'Xonqo\'rg\'on', NULL, 'Хонқўрғон', NULL, 'Хонкургон', NULL),
(1727259834, 17, 27, 259, 834, 'Navbahor', NULL, 'Навбаҳор', NULL, 'Навбахор', NULL),
(1727259837, 17, 27, 259, 837, 'Niyozbosh', NULL, 'Ниёзбош', NULL, 'Ниязбаш', NULL),
(1727259848, 17, 27, 259, 848, 'Qo\'sh yog\'och', NULL, 'Қўш ёғоч', NULL, 'Кушегоч', NULL),
(1727259871, 17, 27, 259, 871, 'Sho\'ralisoy', NULL, 'Шўралисой', NULL, 'Шуралисай', NULL),
(1727259882, 17, 27, 259, 882, 'Eski Qovunchi', NULL, 'Эски Қовунчи', NULL, 'Эски-Каунчи', NULL),
(1727265500, 17, 27, 265, 500, 'Toshkent tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Тошкент туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Ташкентского района', NULL),
(1727265501, 17, 27, 265, 501, 'Keles', NULL, 'Келес', NULL, 'Келес', NULL),
(1727265550, 17, 27, 265, 550, 'Toshkent tumanining shaharchalari', NULL, 'Тошкент туманининг шаҳарчалари', NULL, 'Городские поселки Ташкентского района', NULL),
(1727265553, 17, 27, 265, 553, 'Z.Jalilov', NULL, 'З.Жалилов', NULL, 'З.Жалилов', NULL),
(1727265555, 17, 27, 265, 555, 'Ko\'k saroy', NULL, 'Кўк сарой', NULL, 'Куксарай', NULL),
(1727265557, 17, 27, 265, 557, 'Kensoy', NULL, 'Кенсой', NULL, 'Кенсай', NULL),
(1727265559, 17, 27, 265, 559, 'Sabzavot', NULL, 'Сабзавот', NULL, 'Сабзавот', NULL),
(1727265563, 17, 27, 265, 563, 'M.Fozilov', NULL, 'М.Фозилов', NULL, 'М.Фозилов', NULL),
(1727265565, 17, 27, 265, 565, 'Shamsiobod', NULL, 'Шамсиобод', NULL, 'Шамсиабад', NULL),
(1727265567, 17, 27, 265, 567, 'Chig\'atoy', NULL, 'Чиғатой', NULL, 'Чигатай', NULL),
(1727265569, 17, 27, 265, 569, 'Hasanboy', NULL, 'Ҳасанбой', NULL, 'Хасанбой', NULL),
(1727265573, 17, 27, 265, 573, 'Qashqarlik', NULL, 'Қашқарлик', NULL, 'Кашкарлик', NULL),
(1727265800, 17, 27, 265, 800, 'Toshkent tumanining qishloq fuqarolar yig\'inlari', NULL, 'Тошкент туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Ташкентского района', NULL),
(1727265811, 17, 27, 265, 811, 'Ko\'k-terak', NULL, 'Кўк-терак', NULL, 'Кук-Терак', NULL),
(1727265813, 17, 27, 265, 813, 'Chuvalachi', NULL, 'Чувалачи', NULL, 'Чувалачи', NULL),
(1727265816, 17, 27, 265, 816, 'Masalboy', NULL, 'Масалбой', NULL, 'Масалбай', NULL),
(1727265819, 17, 27, 265, 819, 'Qizg\'aldoq', NULL, 'Қизғалдоқ', NULL, 'Кизгалдак', NULL),
(1727265825, 17, 27, 265, 825, 'Ko\'k Saroy', NULL, 'Кўк Сарой', NULL, 'Куксарай', NULL),
(1727265828, 17, 27, 265, 828, 'Hasanboy', NULL, 'Ҳасанбой', NULL, 'Хасанбай', NULL),
(1727265833, 17, 27, 265, 833, 'Guliston', NULL, 'Гулистон', NULL, 'Гулистан', NULL),
(1727265836, 17, 27, 265, 836, 'Yunusobod', NULL, 'Юнусобод', NULL, 'Юнусабад', NULL),
(1727265839, 17, 27, 265, 839, 'Choshtepa', NULL, 'Чоштепа', NULL, 'Чаштепа', NULL),
(1727407500, 17, 27, 407, 500, 'Angren shahar xokimligiga qarashli shaharlar', NULL, 'Ангрен шаҳар хокимлигига қарашли шаҳарлар', NULL, 'Города, подчиненные Ангренскому горхокимияту', NULL),
(1727407505, 17, 27, 407, 505, 'Yangiobod', NULL, 'Янгиобод', NULL, 'Янгиабад', NULL),
(1727407550, 17, 27, 407, 550, 'Angren shahar xokimligiga qarashli shaharchalar', NULL, 'Ангрен шаҳар хокимлигига қарашли шаҳарчалар', NULL, 'Городские поселки, подч. Ангренскому горхокимияту', NULL),
(1727407554, 17, 27, 407, 554, 'Krasnogorsk', NULL, 'Красногорск', NULL, 'Красногорск', NULL),
(1727407558, 17, 27, 407, 558, 'Nurobod', NULL, 'Нуробод', NULL, 'Нурабад', NULL),
(1730203500, 17, 30, 203, 500, 'Oltiariq tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Олтиариқ туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Алтыарыкского района', NULL),
(1730203508, 17, 30, 203, 508, 'Tinchlik', NULL, 'Тинчлик', NULL, 'Тинчлик', NULL),
(1730203550, 17, 30, 203, 550, 'Oltiariq tumanining shaharchalari', NULL, 'Олтиариқ туманининг шаҳарчалари', NULL, 'Городские поселки Алтыарыкского района', NULL),
(1730203551, 17, 30, 203, 551, 'Oltiariq', NULL, 'Олтиариқ', NULL, 'Алтыарык', NULL),
(1730203552, 17, 30, 203, 552, 'Chinor', NULL, 'Чинор', NULL, 'Чинор', NULL),
(1730203554, 17, 30, 203, 554, 'Azimobod', NULL, 'Азимобод', NULL, 'Азимабад', NULL),
(1730203556, 17, 30, 203, 556, 'Bo\'rbaliq', NULL, 'Бўрбалиқ', NULL, 'Бурбалик', NULL),
(1730203558, 17, 30, 203, 558, 'Djurek', NULL, 'Джурек', NULL, 'Джурек', NULL),
(1730203562, 17, 30, 203, 562, 'Zilxa', NULL, 'Зилха', NULL, 'Зилха', NULL),
(1730203564, 17, 30, 203, 564, 'Katput', NULL, 'Катпут', NULL, 'Катпут', NULL),
(1730203566, 17, 30, 203, 566, 'Oqbo\'yra', NULL, 'Оқбўйра', NULL, 'Окбуйра', NULL),
(1730203568, 17, 30, 203, 568, 'Povulg\'on', NULL, 'Повулғон', NULL, 'Повулган', NULL),
(1730203570, 17, 30, 203, 570, 'Poloson', NULL, 'Полосон', NULL, 'Паласан', NULL),
(1730203572, 17, 30, 203, 572, 'Chordara', NULL, 'Чордара', NULL, 'Чордара', NULL),
(1730203574, 17, 30, 203, 574, 'Eskiarab', NULL, 'Эскиараб', NULL, 'Эскиараб', NULL),
(1730203576, 17, 30, 203, 576, 'Yangiarab', NULL, 'Янгиараб', NULL, 'Янгиараб', NULL),
(1730203578, 17, 30, 203, 578, 'Yangiqo\'rg\'on', NULL, 'Янгиқўрғон', NULL, 'Янгикурган', NULL),
(1730203800, 17, 30, 203, 800, 'Yangiyo\'l tumanining qishloq fuqarolar yig\'inlari', NULL, 'Янгийўл туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Алтыарыкского района', NULL),
(1730203804, 17, 30, 203, 804, 'Oqbo\'yra', NULL, 'Оқбўйра', NULL, 'Акбуйра', NULL),
(1730203806, 17, 30, 203, 806, 'Oltiariq', NULL, 'Олтиариқ', NULL, 'Алтыарык', NULL),
(1730203810, 17, 30, 203, 810, 'Yangiarab', NULL, 'Янгиараб', NULL, 'Янгиараб', NULL),
(1730203812, 17, 30, 203, 812, 'Bo\'rbaliq', NULL, 'Бўрбалиқ', NULL, 'Бурбалык', NULL),
(1730203820, 17, 30, 203, 820, 'G\'ayrat', NULL, 'Ғайрат', NULL, 'Гайрат', NULL),
(1730203824, 17, 30, 203, 824, 'Djurek', NULL, 'Джурек', NULL, 'Джурек', NULL),
(1730203840, 17, 30, 203, 840, 'Qiziltepa', NULL, 'Қизилтепа', NULL, 'Кызылтепа', NULL),
(1730203842, 17, 30, 203, 842, 'Poloson', NULL, 'Полосон', NULL, 'Паласан', NULL),
(1730203848, 17, 30, 203, 848, 'Fayziobod', NULL, 'Файзиобод', NULL, 'Файзиабад', NULL),
(1730203870, 17, 30, 203, 870, 'Toshqo\'rg\'on', NULL, 'Тошқўрғон', NULL, 'Тошкургон', NULL),
(1730203875, 17, 30, 203, 875, 'Kapchugay', NULL, 'Капчугай', NULL, 'Капчугай', NULL),
(1730203881, 17, 30, 203, 881, 'Povulg\'on', NULL, 'Повулғон', NULL, 'Павулган', NULL),
(1730203885, 17, 30, 203, 885, 'Katput', NULL, 'Катпут', NULL, 'Катпут', NULL),
(1730203890, 17, 30, 203, 890, 'Zilxa', NULL, 'Зилха', NULL, 'Зилха', NULL),
(1730203895, 17, 30, 203, 895, 'Azimobod', NULL, 'Азимобод', NULL, 'Азимабад', NULL),
(1730206550, 17, 30, 206, 550, 'Qo\'shtepa tumanining shaharchalari', NULL, 'Қўштепа туманининг шаҳарчалари', NULL, 'Городские поселки Куштепинского района', NULL),
(1730206553, 17, 30, 206, 553, 'Boltako\'l', NULL, 'Болтакўл', NULL, 'Болтакул', NULL),
(1730206555, 17, 30, 206, 555, 'Gishtmon', NULL, 'Гиштмон', NULL, 'Гиштмон', NULL),
(1730206557, 17, 30, 206, 557, 'Do\'rmon', NULL, 'Дўрмон', NULL, 'Дурмон', NULL),
(1730206559, 17, 30, 206, 559, 'Katta Beshkapa', NULL, 'Катта Бешкапа', NULL, 'Катта бешкапа', NULL),
(1730206561, 17, 30, 206, 561, 'Qizil ariq', NULL, 'Қизил ариқ', NULL, 'Кизиларик', NULL),
(1730206563, 17, 30, 206, 563, 'Qorajiyda', NULL, 'Қоражийда', NULL, 'Каражийда', NULL),
(1730206565, 17, 30, 206, 565, 'Qorakaltak', NULL, 'Қоракалтак', NULL, 'Каракалтак', NULL),
(1730206567, 17, 30, 206, 567, 'Qumtepa', NULL, 'Қумтепа', NULL, 'Кумтепа', NULL),
(1730206569, 17, 30, 206, 569, 'Quyi Oqtepa', NULL, 'Қуйи Оқтепа', NULL, 'Куйи Октепа', NULL),
(1730206571, 17, 30, 206, 571, 'Sarmozor', NULL, 'Сармозор', NULL, 'Сармозор', NULL),
(1730206573, 17, 30, 206, 573, 'Xotinariq', NULL, 'Хотинариқ', NULL, 'Хотинарык', NULL),
(1730206575, 17, 30, 206, 575, 'Shahartepa', NULL, 'Шаҳартепа', NULL, 'Шахартепа', NULL),
(1730206577, 17, 30, 206, 577, 'Eshonguzar', NULL, 'Эшонгузар', NULL, 'Эшонгузар', NULL),
(1730206579, 17, 30, 206, 579, 'Yangiariq', NULL, 'Янгиариқ', NULL, 'Янгиарык', NULL),
(1730206800, 17, 30, 206, 800, 'Qo\'shtepa tumanining qishloq fuqarolar yig\'inlari', NULL, 'Қўштепа туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Куштеринского района', NULL),
(1730206806, 17, 30, 206, 806, 'Fayz', NULL, 'Файз', NULL, 'Файз', NULL),
(1730206815, 17, 30, 206, 815, 'Do\'rmon', NULL, 'Дўрмон', NULL, 'Дуpман', NULL),
(1730206822, 17, 30, 206, 822, 'Qoraqo\'shchi', NULL, 'Қорақўшчи', NULL, 'Каракушчи', NULL),
(1730206825, 17, 30, 206, 825, 'Qumtepa', NULL, 'Қумтепа', NULL, 'Кумтепа', NULL),
(1730206827, 17, 30, 206, 827, 'Sarmozor', NULL, 'Сармозор', NULL, 'Саримазар', NULL),
(1730206830, 17, 30, 206, 830, 'Solijonobod', NULL, 'Солижонобод', NULL, 'Салиджанабад', NULL),
(1730206834, 17, 30, 206, 834, 'Langar', NULL, 'Лангар', NULL, 'Лянгар', NULL),
(1730206841, 17, 30, 206, 841, 'Paxtakor', NULL, 'Пахтакор', NULL, 'Пахтакор', NULL),
(1730206854, 17, 30, 206, 854, 'O\'qchi', NULL, 'Ўқчи', NULL, 'Укчи', NULL),
(1730206862, 17, 30, 206, 862, 'Xalqabod', NULL, 'Халқабод', NULL, 'Халкабад', NULL),
(1730206876, 17, 30, 206, 876, 'Shahartepa', NULL, 'Шаҳартепа', NULL, 'Шахартепа', NULL),
(1730206885, 17, 30, 206, 885, 'Yo\'ldoshobod', NULL, 'Йўлдошобод', NULL, 'Юлдашабад', NULL),
(1730206890, 17, 30, 206, 890, 'Loyson', NULL, 'Лойсон', NULL, 'Лайсан', NULL),
(1730206895, 17, 30, 206, 895, 'Boltako\'l', NULL, 'Болтакўл', NULL, 'Балтакуль', NULL),
(1730206898, 17, 30, 206, 898, 'G\'ishtmon', NULL, 'Ғиштмон', NULL, 'Гиштман', NULL),
(1730209550, 17, 30, 209, 550, 'Bog\'dod tumanining shaharchalari', NULL, 'Боғдод туманининг шаҳарчалари', NULL, 'Городские поселки Багдадского района', NULL),
(1730209551, 17, 30, 209, 551, 'Bog\'dod', NULL, 'Боғдод', NULL, 'Багдад', NULL),
(1730209553, 17, 30, 209, 553, 'Amirobod', NULL, 'Амиробод', NULL, 'Амиробод', NULL),
(1730209555, 17, 30, 209, 555, 'Maylavoy', NULL, 'Майлавой', NULL, 'Майлавой', NULL),
(1730209557, 17, 30, 209, 557, 'Oltin vodiy', NULL, 'Олтин водий', NULL, 'Олтин водий', NULL),
(1730209559, 17, 30, 209, 559, 'Bog\'ishamol', NULL, 'Боғишамол', NULL, 'Богишамол', NULL),
(1730209561, 17, 30, 209, 561, 'Bordon', NULL, 'Бордон', NULL, 'Бордон', NULL),
(1730209563, 17, 30, 209, 563, 'Do\'rmoncha', NULL, 'Дўрмонча', NULL, 'Дурманча', NULL),
(1730209565, 17, 30, 209, 565, 'Irgali', NULL, 'Иргали', NULL, 'Иргали', NULL),
(1730209567, 17, 30, 209, 567, 'Qaroqchitol', NULL, 'Қароқчитол', NULL, 'Каракчитол', NULL),
(1730209569, 17, 30, 209, 569, 'Kaxat', NULL, 'Кахат', NULL, 'Кахат', NULL),
(1730209571, 17, 30, 209, 571, 'Qirqboldi', NULL, 'Қирқболди', NULL, 'Киркболды', NULL),
(1730209573, 17, 30, 209, 573, 'Konizar', NULL, 'Конизар', NULL, 'Конизар', NULL),
(1730209575, 17, 30, 209, 575, 'Qo\'shtegirmon', NULL, 'Қўштегирмон', NULL, 'Куштегирмон', NULL),
(1730209577, 17, 30, 209, 577, 'Matqulobod', NULL, 'Матқулобод', NULL, 'Маткулабад', NULL),
(1730209579, 17, 30, 209, 579, 'Mirzaobod', NULL, 'Мирзаобод', NULL, 'Мирзаабад', NULL),
(1730209581, 17, 30, 209, 581, 'Samandarak', NULL, 'Самандарак', NULL, 'Самандарак', NULL),
(1730209583, 17, 30, 209, 583, 'Samarqand', NULL, 'Самарқанд', NULL, 'Самарканд', NULL),
(1730209585, 17, 30, 209, 585, 'O\'ltarma', NULL, 'Ўлтарма', NULL, 'Ултарма', NULL),
(1730209587, 17, 30, 209, 587, 'Xusnobod', NULL, 'Хуснобод', NULL, 'Хуснабад', NULL),
(1730209589, 17, 30, 209, 589, 'Chekmirzaobod', NULL, 'Чекмирзаобод', NULL, 'Чекмирзаабад', NULL),
(1730209591, 17, 30, 209, 591, 'Churindi', NULL, 'Чуринди', NULL, 'Чуринди', NULL),
(1730209800, 17, 30, 209, 800, 'Bog\'dod tumanining qishloq fuqarolar yig\'inlari', NULL, 'Боғдод туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Багдадского района', NULL),
(1730209810, 17, 30, 209, 810, 'Zafarobod', NULL, 'Зафаробод', NULL, 'Зафарабад', NULL),
(1730209820, 17, 30, 209, 820, 'Amirobod', NULL, 'Амиробод', NULL, 'Амирабад', NULL),
(1730209823, 17, 30, 209, 823, 'Qaroqchitol', NULL, 'Қароқчитол', NULL, 'Каракчитал', NULL),
(1730209824, 17, 30, 209, 824, 'Matqulobod', NULL, 'Матқулобод', NULL, 'Маткулабад', NULL),
(1730209826, 17, 30, 209, 826, 'Tinchlik', NULL, 'Тинчлик', NULL, 'Тинчлик', NULL),
(1730209834, 17, 30, 209, 834, 'Paxtaobod', NULL, 'Пахтаобод', NULL, 'Пахтаабад', NULL),
(1730209845, 17, 30, 209, 845, 'O\'ltarma', NULL, 'Ўлтарма', NULL, 'Ультарма', NULL),
(1730209856, 17, 30, 209, 856, 'Chuvalanchi', NULL, 'Чуваланчи', NULL, 'Чуваланчи', NULL),
(1730209860, 17, 30, 209, 860, 'Do\'rmancha', NULL, 'Дўрманча', NULL, 'Дорманча', NULL),
(1730209865, 17, 30, 209, 865, 'Samarqand', NULL, 'Самарқанд', NULL, 'Самарканд', NULL),
(1730212550, 17, 30, 212, 550, 'Buvayda tumanining shaharchalari', NULL, 'Бувайда туманининг шаҳарчалари', NULL, 'Городские поселки Бувайдинского района', NULL),
(1730212551, 17, 30, 212, 551, 'Ibrat', NULL, 'Ибрат', NULL, 'Ибрат', NULL),
(1730212553, 17, 30, 212, 553, 'Yuqori Bachqir', NULL, 'Юқори Бачқир', NULL, 'Юкори Бачкир', NULL),
(1730212555, 17, 30, 212, 555, 'Quyi Bachqir', NULL, 'Қуйи Бачқир', NULL, 'Куйи Бачкир', NULL),
(1730212557, 17, 30, 212, 557, 'Chinobod', NULL, 'Чинобод', NULL, 'Чинабад', NULL),
(1730212559, 17, 30, 212, 559, 'Buvayda', NULL, 'Бувайда', NULL, 'Бувайда', NULL),
(1730212561, 17, 30, 212, 561, 'Zarbuloq', NULL, 'Зарбулоқ', NULL, 'Зарбулок', NULL),
(1730212563, 17, 30, 212, 563, 'Qum', NULL, 'Қум', NULL, 'Кум', NULL),
(1730212565, 17, 30, 212, 565, 'Yuqori Nayman', NULL, 'Юқори Найман', NULL, 'Юкори Найман', NULL),
(1730212567, 17, 30, 212, 567, 'Oqqo\'rg\'on', NULL, 'Оққўрғон', NULL, 'Аккурган', NULL),
(1730212569, 17, 30, 212, 569, 'Quyi Urganji', NULL, 'Қуйи Урганжи', NULL, 'Куйи Урганжи', NULL),
(1730212800, 17, 30, 212, 800, 'Buvayda tumanining qishloq fuqarolar yig\'inlari', NULL, 'Бувайда  туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Бувайдинского района', NULL),
(1730212806, 17, 30, 212, 806, 'Oqqo\'rg\'on', NULL, 'Оққўрғон', NULL, 'Аккурган', NULL),
(1730212810, 17, 30, 212, 810, 'Alqor', NULL, 'Алқор', NULL, 'Алкар', NULL),
(1730212820, 17, 30, 212, 820, 'Begobod', NULL, 'Бегобод', NULL, 'Бекабад', NULL),
(1730212830, 17, 30, 212, 830, 'Beshterak', NULL, 'Бештерак', NULL, 'Бештерак', NULL),
(1730212840, 17, 30, 212, 840, 'Buvayda', NULL, 'Бувайда', NULL, 'Бувайда', NULL),
(1730212850, 17, 30, 212, 850, 'Jalayer', NULL, 'Жалаер', NULL, 'Джалаер', NULL),
(1730212860, 17, 30, 212, 860, 'Qo\'ng\'irot', NULL, 'Қўнғирот', NULL, 'Кунград', NULL),
(1730212862, 17, 30, 212, 862, 'Qo\'rg\'onobod', NULL, 'Қўрғонобод', NULL, 'Курганабад', NULL),
(1730212866, 17, 30, 212, 866, 'Uzumzor', NULL, 'Узумзор', NULL, 'Узумзар', NULL),
(1730212869, 17, 30, 212, 869, 'Yangiqadam', NULL, 'Янгиқадам', NULL, 'Янгикадам', NULL),
(1730212870, 17, 30, 212, 870, 'Yangiqo\'rg\'on', NULL, 'Янгиқўрғон', NULL, 'Янгикурган', NULL),
(1730215500, 17, 30, 215, 500, 'Beshariq tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Бешариқ туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Бешарыкского района', NULL),
(1730215501, 17, 30, 215, 501, 'Beshariq', NULL, 'Бешариқ', NULL, 'Бешарык', NULL),
(1730215550, 17, 30, 215, 550, 'Beshariq tumanining shaharchalari', NULL, 'Бешариқ туманининг шаҳарчалари', NULL, 'Городские поселки Бешарыкского района', NULL),
(1730215553, 17, 30, 215, 553, 'Nafosat', NULL, 'Нафосат', NULL, 'Нафосат', NULL),
(1730215556, 17, 30, 215, 556, 'Zarqaynar', NULL, 'Зарқайнар', NULL, 'Заркайнар', NULL),
(1730215559, 17, 30, 215, 559, 'Kapayangi', NULL, 'Капаянги', NULL, 'Капаянги', NULL),
(1730215563, 17, 30, 215, 563, 'Qumqishloq', NULL, 'Қумқишлоқ', NULL, 'Кумкишлак', NULL),
(1730215566, 17, 30, 215, 566, 'Oqtovuq', NULL, 'Оқтовуқ', NULL, 'Актовук', NULL),
(1730215569, 17, 30, 215, 569, 'Rapqon', NULL, 'Рапқон', NULL, 'Рапкан', NULL),
(1730215573, 17, 30, 215, 573, 'Tovul', NULL, 'Товул', NULL, 'Товул', NULL),
(1730215576, 17, 30, 215, 576, 'Uzun', NULL, 'Узун', NULL, 'Узун', NULL),
(1730215579, 17, 30, 215, 579, 'Chimboy', NULL, 'Чимбой', NULL, 'Чимбай', NULL),
(1730215583, 17, 30, 215, 583, 'Manguobod', NULL, 'Мангуобод', NULL, 'Мангуобод', NULL),
(1730215800, 17, 30, 215, 800, 'Beshariq tumanining qishloq fuqarolar yig\'inlari', NULL, 'Бешариқ  туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Бешарыкского района', NULL),
(1730215804, 17, 30, 215, 804, 'Andarxon', NULL, 'Андархон', NULL, 'Андархан', NULL),
(1730215811, 17, 30, 215, 811, 'Beshariq', NULL, 'Бешариқ', NULL, 'Бешарык', NULL),
(1730215815, 17, 30, 215, 815, 'Vatan', NULL, 'Ватан', NULL, 'Ватан', NULL),
(1730215826, 17, 30, 215, 826, 'Qorajiyda', NULL, 'Қоражийда', NULL, 'Каражийда', NULL),
(1730215828, 17, 30, 215, 828, 'Qashqar', NULL, 'Қашқар', NULL, 'Кашкар', NULL),
(1730215839, 17, 30, 215, 839, 'Beshsari', NULL, 'Бешсари', NULL, 'Бешсари', NULL),
(1730215844, 17, 30, 215, 844, 'Rapqon', NULL, 'Рапқон', NULL, 'Рапкан', NULL),
(1730215848, 17, 30, 215, 848, 'Tovul', NULL, 'Товул', NULL, 'Тавул', NULL),
(1730215855, 17, 30, 215, 855, 'Yakkatut', NULL, 'Яккатут', NULL, 'Яккатут', NULL),
(1730218500, 17, 30, 218, 500, 'Quva tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Қува туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения  Кувинского района', NULL),
(1730218501, 17, 30, 218, 501, 'Quva', NULL, 'Қува', NULL, 'Кува', NULL),
(1730218550, 17, 30, 218, 550, 'Quva tumanining shaharchalari', NULL, 'Қува туманининг шаҳарчалари', NULL, 'Городские поселки Кувинского района', NULL),
(1730218552, 17, 30, 218, 552, 'Sanoatchilar', NULL, 'Саноатчилар', NULL, 'Саноатчилар', NULL),
(1730218553, 17, 30, 218, 553, 'Guliston', NULL, 'Гулистон', NULL, 'Гулистон', NULL),
(1730218554, 17, 30, 218, 554, 'Damariq', NULL, 'Дамариқ', NULL, 'Дамарик', NULL),
(1730218555, 17, 30, 218, 555, 'Jalayer', NULL, 'Жалаер', NULL, 'Джалаер', NULL),
(1730218556, 17, 30, 218, 556, 'Qayirma', NULL, 'Қайирма', NULL, 'Кайирма', NULL),
(1730218557, 17, 30, 218, 557, 'Qaqir', NULL, 'Қақир', NULL, 'Какир', NULL),
(1730218558, 17, 30, 218, 558, 'Qandabuloq', NULL, 'Қандабулоқ', NULL, 'Кандабулок', NULL),
(1730218559, 17, 30, 218, 559, 'Qorashox', NULL, 'Қорашох', NULL, 'Карашох', NULL),
(1730218561, 17, 30, 218, 561, 'Mustaqillik', NULL, 'Мустақиллик', NULL, 'Мустакиллик', NULL),
(1730218562, 17, 30, 218, 562, 'Oltinariq', NULL, 'Олтинариқ', NULL, 'Олтинарик', NULL),
(1730218563, 17, 30, 218, 563, 'Pastki Xo\'ja Xasan', NULL, 'Пастки Хўжа Хасан', NULL, 'Пастки Хужа Хасан', NULL),
(1730218564, 17, 30, 218, 564, 'Tolmozor', NULL, 'Толмозор', NULL, 'Толмазор', NULL),
(1730218565, 17, 30, 218, 565, 'Turk', NULL, 'Турк', NULL, 'Турк', NULL),
(1730218567, 17, 30, 218, 567, 'O\'zbek', NULL, 'Ўзбек', NULL, 'Узбек', NULL),
(1730218569, 17, 30, 218, 569, 'Yuziya', NULL, 'Юзия', NULL, 'Юзия', NULL),
(1730218800, 17, 30, 218, 800, 'Quva tumanining qishloq fuqarolar yig\'inlari', NULL, 'Қува туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Кувинского района', NULL),
(1730218804, 17, 30, 218, 804, 'Akbarabad', NULL, 'Акбарабад', NULL, 'Акбарабад', NULL),
(1730218813, 17, 30, 218, 813, 'Baynalminal', NULL, 'Байналминал', NULL, 'Байналминал', NULL),
(1730218826, 17, 30, 218, 826, 'Dehqonobod', NULL, 'Деҳқонобод', NULL, 'Дехканабад', NULL),
(1730218829, 17, 30, 218, 829, 'Ittifoq', NULL, 'Иттифоқ', NULL, 'Иттифок', NULL),
(1730218837, 17, 30, 218, 837, 'Madaniyat', NULL, 'Маданият', NULL, 'Маданият', NULL),
(1730218842, 17, 30, 218, 842, 'Iftixor', NULL, 'Ифтихор', NULL, 'Ифтихор', NULL),
(1730218851, 17, 30, 218, 851, 'Namuna', NULL, 'Намуна', NULL, 'Намуна', NULL),
(1730218862, 17, 30, 218, 862, 'Bahor', NULL, 'Баҳор', NULL, 'Бахор', NULL),
(1730218871, 17, 30, 218, 871, 'Turkrovot', NULL, 'Туркровот', NULL, 'Туркрават', NULL),
(1730218884, 17, 30, 218, 884, 'Soyguzar', NULL, 'Сойгузар', NULL, 'Сойгузар', NULL),
(1730218886, 17, 30, 218, 886, 'Yangihayot', NULL, 'Янгиҳаёт', NULL, 'Янгихаят', NULL),
(1730221550, 17, 30, 221, 550, 'Uchko\'prik tumanining shaharchalari', NULL, 'Учкўприк туманининг шаҳарчалари', NULL, 'Городские поселки Учкуприкского района', NULL),
(1730221551, 17, 30, 221, 551, 'Uchko\'prik', NULL, 'Учкўприк', NULL, 'Учкуприк', NULL),
(1730221553, 17, 30, 221, 553, 'Begobod', NULL, 'Бегобод', NULL, 'Бегабад', NULL),
(1730221555, 17, 30, 221, 555, 'G\'ijdan', NULL, 'Ғиждан', NULL, 'Гиждан', NULL),
(1730221557, 17, 30, 221, 557, 'Katta Qashqar', NULL, 'Катта Қашқар', NULL, 'Катта кашкар', NULL),
(1730221559, 17, 30, 221, 559, 'Qumariqobod', NULL, 'Қумариқобод', NULL, 'Кумарикобод', NULL),
(1730221561, 17, 30, 221, 561, 'Bog\'ibo\'ston', NULL, 'Боғибўстон', NULL, 'Богибустон', NULL),
(1730221563, 17, 30, 221, 563, 'Mirzaxo\'ja', NULL, 'Мирзахўжа', NULL, 'Мирзахужа', NULL),
(1730221565, 17, 30, 221, 565, 'Palaxon', NULL, 'Палахон', NULL, 'Палахон', NULL),
(1730221567, 17, 30, 221, 567, 'Sobirjon', NULL, 'Собиржон', NULL, 'Собиржан', NULL),
(1730221569, 17, 30, 221, 569, 'Turg\'oq', NULL, 'Турғоқ', NULL, 'Тургок', NULL),
(1730221571, 17, 30, 221, 571, 'Yangiqishloq', NULL, 'Янгиқишлоқ', NULL, 'Янгикишлок', NULL),
(1730221800, 17, 30, 221, 800, 'Uchko\'prik tumanining qishloq fuqarolar yig\'inlari', NULL, 'Учкўприк туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Учкуприкского района', NULL),
(1730221816, 17, 30, 221, 816, 'G\'ijdon', NULL, 'Ғиждон', NULL, 'Гиждан', NULL),
(1730221828, 17, 30, 221, 828, 'Kenagas', NULL, 'Кенагас', NULL, 'Кенагас', NULL),
(1730221839, 17, 30, 221, 839, 'Navro\'z', NULL, 'Наврўз', NULL, 'Навруз', NULL),
(1730221851, 17, 30, 221, 851, 'Chorbog\'', NULL, 'Чорбоғ', NULL, 'Чарбог', NULL),
(1730221856, 17, 30, 221, 856, 'Palaxon', NULL, 'Палахон', NULL, 'Палахан', NULL),
(1730221859, 17, 30, 221, 859, 'Sariqo\'rg\'on', NULL, 'Сариқўрғон', NULL, 'Сарыкурган', NULL),
(1730221862, 17, 30, 221, 862, 'Uchko\'prik', NULL, 'Учкўприк', NULL, 'Учкуприк', NULL),
(1730221873, 17, 30, 221, 873, 'Yangiqishloq', NULL, 'Янгиқишлоқ', NULL, 'Янгикишлак', NULL),
(1730221876, 17, 30, 221, 876, 'Obod diyor', NULL, 'Обод диёр', NULL, 'Обод диер', NULL),
(1730224500, 17, 30, 224, 500, 'Rishton tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Риштон туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Риштанского района', NULL),
(1730224501, 17, 30, 224, 501, 'Rishton', NULL, 'Риштон', NULL, 'Риштан', NULL),
(1730224550, 17, 30, 224, 550, 'Rishton tumanining shaharchalari', NULL, 'Риштон туманининг шаҳарчалари', NULL, 'Городские поселки Риштанского района', NULL),
(1730224552, 17, 30, 224, 552, 'Avazboy', NULL, 'Авазбой', NULL, 'Авазбай', NULL),
(1730224554, 17, 30, 224, 554, 'Beshkapa', NULL, 'Бешкапа', NULL, 'Бешкапа', NULL),
(1730224556, 17, 30, 224, 556, 'Bujay', NULL, 'Бужай', NULL, 'Бужай', NULL),
(1730224558, 17, 30, 224, 558, 'Bo\'ston', NULL, 'Бўстон', NULL, 'Бустан', NULL),
(1730224562, 17, 30, 224, 562, 'Do\'tir', NULL, 'Дўтир', NULL, 'Дутир', NULL),
(1730224564, 17, 30, 224, 564, 'Saxovat', NULL, 'Саховат', NULL, 'Саховат', NULL),
(1730224566, 17, 30, 224, 566, 'Zoxidon', NULL, 'Зохидон', NULL, 'Зохидан', NULL),
(1730224568, 17, 30, 224, 568, 'Qayrag\'och', NULL, 'Қайрағоч', NULL, 'Кайрагач', NULL),
(1730224572, 17, 30, 224, 572, 'Oq-yer', NULL, 'Оқ-ер', NULL, 'Ак-ер', NULL),
(1730224574, 17, 30, 224, 574, 'Pandigon', NULL, 'Пандигон', NULL, 'Пандиган', NULL),
(1730224576, 17, 30, 224, 576, 'To\'da', NULL, 'Тўда', NULL, 'Туда', NULL),
(1730224578, 17, 30, 224, 578, 'O\'yrat', NULL, 'Ўйрат', NULL, 'Уйрат', NULL),
(1730224582, 17, 30, 224, 582, 'Xurramobod', NULL, 'Хуррамобод', NULL, 'Хуррамабад', NULL),
(1730224800, 17, 30, 224, 800, 'Rishton tumanining qishloq fuqarolar yig\'inlari', NULL, 'Риштон туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Риштанского района', NULL),
(1730224804, 17, 30, 224, 804, 'Oq-oltin', NULL, 'Оқ-олтин', NULL, 'Акалтын', NULL),
(1730224806, 17, 30, 224, 806, 'Oq-yer', NULL, 'Оқ-ер', NULL, 'Акъер', NULL),
(1730224823, 17, 30, 224, 823, 'Beshkapa', NULL, 'Бешкапа', NULL, 'Бешкапа', NULL),
(1730224829, 17, 30, 224, 829, 'Bo\'ston', NULL, 'Бўстон', NULL, 'Бустан', NULL),
(1730224835, 17, 30, 224, 835, 'Mehnatobod', NULL, 'Меҳнатобод', NULL, 'Мехнатабад', NULL),
(1730224846, 17, 30, 224, 846, 'Rishton', NULL, 'Риштон', NULL, 'Риштан', NULL),
(1730224868, 17, 30, 224, 868, 'Zoxidon', NULL, 'Зохидон', NULL, 'Зохидон', NULL),
(1730224879, 17, 30, 224, 879, 'To\'da', NULL, 'Тўда', NULL, 'Туда', NULL),
(1730224890, 17, 30, 224, 890, 'O\'smonxo\'jayev', NULL, 'Ўсмонхўжаев', NULL, 'им. Б. Усманходжаева', NULL),
(1730224895, 17, 30, 224, 895, 'Yoyilma', NULL, 'Ёйилма', NULL, 'Яйилма', NULL),
(1730224897, 17, 30, 224, 897, 'Qayrag\'och', NULL, 'Қайрағоч', NULL, 'Кайрагач', NULL),
(1730226550, 17, 30, 226, 550, 'So\'x tumanining shaharchalari', NULL, 'Сўх туманининг шаҳарчалари', NULL, 'Городские поселки Сохского района', NULL),
(1730226551, 17, 30, 226, 551, 'Ravon', NULL, 'Равон', NULL, 'Равон', NULL),
(1730226554, 17, 30, 226, 554, 'Qal\'a', NULL, 'Қалъа', NULL, 'Калъа', NULL),
(1730226557, 17, 30, 226, 557, 'Sarikanda', NULL, 'Сариканда', NULL, 'Сариканда', NULL),
(1730226561, 17, 30, 226, 561, 'So\'x', NULL, 'Сўх', NULL, 'Сох', NULL),
(1730226564, 17, 30, 226, 564, 'Tul', NULL, 'Тул', NULL, 'Тул', NULL),
(1730226567, 17, 30, 226, 567, 'Hushyor', NULL, 'Ҳушёр', NULL, 'Хушер', NULL),
(1730226571, 17, 30, 226, 571, 'Tarovatli', NULL, 'Тароватли', NULL, 'Тароватли', NULL),
(1730226800, 17, 30, 226, 800, 'So\'x tumanining qishloq fuqarolar yig\'inlari', NULL, 'Сўх туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Сохского района', NULL),
(1730226812, 17, 30, 226, 812, 'Sohibkor', NULL, 'Соҳибкор', NULL, 'Сохибкор', NULL),
(1730226840, 17, 30, 226, 840, 'Ravon', NULL, 'Равон', NULL, 'Раван', NULL),
(1730226857, 17, 30, 226, 857, 'So\'x', NULL, 'Сўх', NULL, 'Сох', NULL),
(1730226893, 17, 30, 226, 893, 'Hushyor', NULL, 'Ҳушёр', NULL, 'Хушъяр', NULL),
(1730227550, 17, 30, 227, 550, 'Toshloq tumanining shaharchalari', NULL, 'Тошлоқ туманининг шаҳарчалари', NULL, 'Городские поселки Ташлакского района', NULL),
(1730227551, 17, 30, 227, 551, 'Toshloq', NULL, 'Тошлоқ', NULL, 'Ташлак', NULL),
(1730227553, 17, 30, 227, 553, 'Arabmozor', NULL, 'Арабмозор', NULL, 'Арабмозор', NULL),
(1730227555, 17, 30, 227, 555, 'Axshak', NULL, 'Ахшак', NULL, 'Ахшак', NULL),
(1730227557, 17, 30, 227, 557, 'Varzak', NULL, 'Варзак', NULL, 'Варзак', NULL),
(1730227559, 17, 30, 227, 559, 'Zarkent', NULL, 'Заркент', NULL, 'Заркент', NULL),
(1730227561, 17, 30, 227, 561, 'Qumariq', NULL, 'Қумариқ', NULL, 'Кумарик', NULL),
(1730227563, 17, 30, 227, 563, 'Quyi Nayman', NULL, 'Қуйи Найман', NULL, 'Куйи Найман', NULL),
(1730227565, 17, 30, 227, 565, 'Sadda', NULL, 'Садда', NULL, 'Садда', NULL),
(1730227567, 17, 30, 227, 567, 'Turvat', NULL, 'Турват', NULL, 'Турват', NULL),
(1730227569, 17, 30, 227, 569, 'Yakkatut', NULL, 'Яккатут', NULL, 'Яккатут', NULL),
(1730227800, 17, 30, 227, 800, 'Toshloq tumanining qishloq fuqarolar yig\'inlari', NULL, 'Тошлоқ туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Ташлакского района', NULL),
(1730227810, 17, 30, 227, 810, 'Axshak', NULL, 'Ахшак', NULL, 'Ахшак', NULL),
(1730227815, 17, 30, 227, 815, 'Quyi Yakkatut', NULL, 'Қуйи Яккатут', NULL, 'Куйи Яккатут', NULL),
(1730227823, 17, 30, 227, 823, 'Varzak', NULL, 'Варзак', NULL, 'Варзак', NULL),
(1730227836, 17, 30, 227, 836, 'Arabmozor', NULL, 'Арабмозор', NULL, 'Арабмазар', NULL),
(1730227849, 17, 30, 227, 849, 'Qumariq', NULL, 'Қумариқ', NULL, 'Кумарык', NULL),
(1730227853, 17, 30, 227, 853, 'Nayman', NULL, 'Найман', NULL, 'Найман', NULL),
(1730227855, 17, 30, 227, 855, 'Naymanbo\'ston', NULL, 'Найманбўстон', NULL, 'Найманбустан', NULL),
(1730227872, 17, 30, 227, 872, 'Sadda', NULL, 'Садда', NULL, 'Садда', NULL),
(1730227882, 17, 30, 227, 882, 'Zarkent', NULL, 'Заркент', NULL, 'Заркент', NULL),
(1730227885, 17, 30, 227, 885, 'Qo\'rg\'oncha', NULL, 'Қўрғонча', NULL, 'Курганча', NULL),
(1730230500, 17, 30, 230, 500, 'O\'zbekiston tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Ўзбекистон туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Узбекистанского района', NULL),
(1730230501, 17, 30, 230, 501, 'Yaypan', NULL, 'Яйпан', NULL, 'Яйпан', NULL),
(1730230550, 17, 30, 230, 550, 'O\'zbekiston tumanining shaharchalari', NULL, 'Ўзбекистон туманининг шаҳарчалари', NULL, 'Городские поселки Узбекистанского района', NULL),
(1730230556, 17, 30, 230, 556, 'Sho\'rsuv', NULL, 'Шўрсув', NULL, 'Шорсу', NULL),
(1730230558, 17, 30, 230, 558, 'Avg\'on', NULL, 'Авғон', NULL, 'Авгон', NULL),
(1730230562, 17, 30, 230, 562, 'Dahana Qaqir', NULL, 'Даҳана Қақир', NULL, 'Дахана какир', NULL),
(1730230564, 17, 30, 230, 564, 'Islom', NULL, 'Ислом', NULL, 'Ислам', NULL),
(1730230566, 17, 30, 230, 566, 'Katta Tagob', NULL, 'Катта Тагоб', NULL, 'Катта Тагаб', NULL),
(1730230568, 17, 30, 230, 568, 'Qizil Qaqir', NULL, 'Қизил Қақир', NULL, 'Кизил какир', NULL),
(1730230570, 17, 30, 230, 570, 'Kichik Tagob', NULL, 'Кичик Тагоб', NULL, 'Кичик Тагаб', NULL),
(1730230572, 17, 30, 230, 572, 'Sardoba', NULL, 'Сардоба', NULL, 'Сардоба', NULL),
(1730230574, 17, 30, 230, 574, 'Kudash', NULL, 'Кудаш', NULL, 'Кудаш', NULL),
(1730230576, 17, 30, 230, 576, 'Kul elash', NULL, 'Кул элаш', NULL, 'Кул элаш', NULL),
(1730230577, 17, 30, 230, 577, 'Qulibek', NULL, 'Қулибек', NULL, 'Кулибек', NULL),
(1730230578, 17, 30, 230, 578, 'Qumbosti', NULL, 'Қумбости', NULL, 'Кумбосди', NULL),
(1730230580, 17, 30, 230, 580, 'Qo\'shqo\'noq', NULL, 'Қўшқўноқ', NULL, 'Кушкунак', NULL),
(1730230582, 17, 30, 230, 582, 'Qo\'rg\'oncha', NULL, 'Қўрғонча', NULL, 'Курганча', NULL),
(1730230584, 17, 30, 230, 584, 'Nursux', NULL, 'Нурсух', NULL, 'Нурсух', NULL),
(1730230586, 17, 30, 230, 586, 'Ovchi', NULL, 'Овчи', NULL, 'Овчи', NULL),
(1730230588, 17, 30, 230, 588, 'Oyimcha Qaqir', NULL, 'Ойимча Қақир', NULL, 'Айимча какир', NULL),
(1730230590, 17, 30, 230, 590, 'Oqmachit', NULL, 'Оқмачит', NULL, 'Акмачит', NULL),
(1730230592, 17, 30, 230, 592, 'Oxta Tagob', NULL, 'Охта Тагоб', NULL, 'Ахта Тагаб', NULL),
(1730230594, 17, 30, 230, 594, 'O\'qchi Dasht', NULL, 'Ўқчи Дашт', NULL, 'Укчи Дашт', NULL),
(1730230596, 17, 30, 230, 596, 'O\'qchi Rajabgardi', NULL, 'Ўқчи Ражабгарди', NULL, 'Укчи Ражабгарди', NULL),
(1730230598, 17, 30, 230, 598, 'Iftixor', NULL, 'Ифтихор', NULL, 'Ифтихор', NULL),
(1730230800, 17, 30, 230, 800, 'O\'zbekiston tumanining qishloq fuqarolar yig\'inlari', NULL, 'Ўзбекистон туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Узбекистанского района', NULL),
(1730230807, 17, 30, 230, 807, 'Ovchi', NULL, 'Овчи', NULL, 'Авчи', NULL),
(1730230811, 17, 30, 230, 811, 'Qorayozbobo', NULL, 'Қораёзбобо', NULL, 'Кораезбобо', NULL),
(1730230822, 17, 30, 230, 822, 'G\'aniobod', NULL, 'Ғаниобод', NULL, 'Ганиабад', NULL),
(1730230838, 17, 30, 230, 838, 'Konizar', NULL, 'Конизар', NULL, 'Конизор', NULL),
(1730230844, 17, 30, 230, 844, 'Qaynar', NULL, 'Қайнар', NULL, 'Кайнар', NULL),
(1730230855, 17, 30, 230, 855, 'Mingtut', NULL, 'Мингтут', NULL, 'Мингтут', NULL),
(1730230866, 17, 30, 230, 866, 'Nursux', NULL, 'Нурсух', NULL, 'Нурсук', NULL),
(1730230869, 17, 30, 230, 869, 'Rajabgardi', NULL, 'Ражабгарди', NULL, 'Раджабгарди', NULL),
(1730230873, 17, 30, 230, 873, 'Qizil Qaqir', NULL, 'Қизил Қақир', NULL, 'Кызыл какир', NULL),
(1730230875, 17, 30, 230, 875, 'Tagob', NULL, 'Тагоб', NULL, 'Тагаб', NULL),
(1730233550, 17, 30, 233, 550, 'Farg\'ona tumanining shaharchalari', NULL, 'Фарғона туманининг шаҳарчалари', NULL, 'Городские поселки Ферганского района', NULL),
(1730233555, 17, 30, 233, 555, 'Chimyon ( mavjud)', NULL, 'Чимён  ( мавжуд)', NULL, 'Чимион', NULL),
(1730233557, 17, 30, 233, 557, 'Avval', NULL, 'Аввал', NULL, 'Аввал', NULL),
(1730233559, 17, 30, 233, 559, 'Archa', NULL, 'Арча', NULL, 'Арча', NULL),
(1730233561, 17, 30, 233, 561, 'Vodil', NULL, 'Водил', NULL, 'Водил', NULL),
(1730233563, 17, 30, 233, 563, 'Yuqori Vodil', NULL, 'Юқори Водил', NULL, 'Юкори Водил', NULL),
(1730233565, 17, 30, 233, 565, 'Damko\'l', NULL, 'Дамкўл', NULL, 'Дамкул', NULL),
(1730233567, 17, 30, 233, 567, 'Yoshlarobod', NULL, 'Ёшларобод', NULL, 'Ешларабад', NULL),
(1730233569, 17, 30, 233, 569, 'Qo\'rg\'ontepa', NULL, 'Қўрғонтепа', NULL, 'Кургонтепа', NULL),
(1730233571, 17, 30, 233, 571, 'Langar', NULL, 'Лангар', NULL, 'Лангар', NULL),
(1730233573, 17, 30, 233, 573, 'Log\'on', NULL, 'Лоғон', NULL, 'Лаган', NULL),
(1730233575, 17, 30, 233, 575, 'Mindon', NULL, 'Миндон', NULL, 'Миндон', NULL),
(1730233577, 17, 30, 233, 577, 'Novkent', NULL, 'Новкент', NULL, 'Новкент', NULL),
(1730233579, 17, 30, 233, 579, 'Yuqori Oqtepa', NULL, 'Юқори Оқтепа', NULL, 'Юкори Октепа', NULL),
(1730233581, 17, 30, 233, 581, 'Parvoz', NULL, 'Парвоз', NULL, 'Парвоз', NULL),
(1730233583, 17, 30, 233, 583, 'Yuqori Soybo\'yi', NULL, 'Юқори Сойбўйи', NULL, 'Юкори Сойбуйи', NULL),
(1730233585, 17, 30, 233, 585, 'Bahor', NULL, 'Баҳор', NULL, 'Бахор', NULL),
(1730233587, 17, 30, 233, 587, 'Xonqiz', NULL, 'Хонқиз', NULL, 'Хонкиз', NULL),
(1730233589, 17, 30, 233, 589, 'Xo\'roba', NULL, 'Хўроба', NULL, 'Хуроба', NULL),
(1730233591, 17, 30, 233, 591, 'Neftchilar', NULL, 'Нефтчилар', NULL, 'Нефтчилар', NULL),
(1730233593, 17, 30, 233, 593, 'Shoximardonobod', NULL, 'Шохимардонобод', NULL, 'Шохимардонабад', NULL),
(1730233595, 17, 30, 233, 595, 'Yuqori Mindon', NULL, 'Юқори Миндон', NULL, 'Юкори миндан', NULL),
(1730233800, 17, 30, 233, 800, 'Farg\'ona tumanining qishloq fuqarolar yig\'inlari', NULL, 'Фарғона туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Ферганского района', NULL),
(1730233804, 17, 30, 233, 804, 'Avval', NULL, 'Аввал', NULL, 'Ауваль', NULL),
(1730233816, 17, 30, 233, 816, 'Gulshan', NULL, 'Гулшан', NULL, 'Гульшан', NULL),
(1730233821, 17, 30, 233, 821, 'Qo\'rg\'ontepa', NULL, 'Қўрғонтепа', NULL, 'Кургантепа', NULL),
(1730233826, 17, 30, 233, 826, 'Soy bo\'yi', NULL, 'Сой бўйи', NULL, 'Сайбуйи', NULL),
(1730233830, 17, 30, 233, 830, 'Log\'on', NULL, 'Лоғон', NULL, 'Лаган', NULL),
(1730233836, 17, 30, 233, 836, 'Mindon', NULL, 'Миндон', NULL, 'Миндан', NULL),
(1730233839, 17, 30, 233, 839, 'Navkat', NULL, 'Навкат', NULL, 'Навкат', NULL),
(1730233847, 17, 30, 233, 847, 'Qaptarxona', NULL, 'Қаптархона', NULL, 'Каптаpхона', NULL),
(1730233864, 17, 30, 233, 864, 'Shoximardon', NULL, 'Шохимардон', NULL, 'Шахимаpдан', NULL),
(1730233870, 17, 30, 233, 870, 'Parvoz', NULL, 'Парвоз', NULL, 'Парвоз', NULL),
(1730233876, 17, 30, 233, 876, 'Chimyon', NULL, 'Чимён', NULL, 'Чимион', NULL),
(1730233880, 17, 30, 233, 880, 'Damko\'l', NULL, 'Дамкўл', NULL, 'Дамкуль', NULL),
(1730233885, 17, 30, 233, 885, 'Xonqiz', NULL, 'Хонқиз', NULL, 'Ханкыз', NULL),
(1730233890, 17, 30, 233, 890, 'Oqbilol', NULL, 'Оқбилол', NULL, 'Акбилал', NULL),
(1730233895, 17, 30, 233, 895, 'Yuqori Vodil', NULL, 'Юқори Водил', NULL, 'Юкоpи Вуадыл', NULL),
(1730233898, 17, 30, 233, 898, 'Vodil', NULL, 'Водил', NULL, 'Вуадыл', NULL),
(1730236550, 17, 30, 236, 550, 'Dang\'ara tumanining shaharchalari', NULL, 'Данғара туманининг шаҳарчалари', NULL, 'Городские поселки Дангаринского района', NULL),
(1730236551, 17, 30, 236, 551, 'Dang\'ara', NULL, 'Данғара', NULL, 'Дангара', NULL),
(1730236554, 17, 30, 236, 554, 'Doimobod', NULL, 'Доимобод', NULL, 'Доимабад', NULL),
(1730236557, 17, 30, 236, 557, 'Katta Ganjiravon', NULL, 'Катта Ганжиравон', NULL, 'Катта ганжиравон', NULL),
(1730236561, 17, 30, 236, 561, 'Katta Turk', NULL, 'Катта Турк', NULL, 'Катта турк', NULL),
(1730236564, 17, 30, 236, 564, 'Qum Qiyali', NULL, 'Қум Қияли', NULL, 'Кум кияли', NULL),
(1730236567, 17, 30, 236, 567, 'Toptiqsaroy', NULL, 'Топтиқсарой', NULL, 'Топтиксарай', NULL),
(1730236571, 17, 30, 236, 571, 'Tumor', NULL, 'Тумор', NULL, 'Тумор', NULL),
(1730236574, 17, 30, 236, 574, 'Yuqori Urganji', NULL, 'Юқори Урганжи', NULL, 'Юкори Урганжи', NULL),
(1730236577, 17, 30, 236, 577, 'Yangi zamon', NULL, 'Янги замон', NULL, 'Янги замон', NULL),
(1730236800, 17, 30, 236, 800, 'Dang\'ara tumanining qishloq fuqarolar yig\'inlari', NULL, 'Данғара туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Дангаринского района', NULL),
(1730236803, 17, 30, 236, 803, 'Oqdjar', NULL, 'Оқджар', NULL, 'Акджар', NULL),
(1730236808, 17, 30, 236, 808, 'Sohil', NULL, 'Соҳил', NULL, 'Сохил', NULL),
(1730236822, 17, 30, 236, 822, 'Naymancha', NULL, 'Найманча', NULL, 'Найманча', NULL),
(1730236830, 17, 30, 236, 830, 'Qiyali', NULL, 'Қияли', NULL, 'Кияли', NULL),
(1730236833, 17, 30, 236, 833, 'Mulkobod', NULL, 'Мулкобод', NULL, 'Мулкабад', NULL),
(1730236841, 17, 30, 236, 841, 'Sanam', NULL, 'Санам', NULL, 'Санам', NULL),
(1730236844, 17, 30, 236, 844, 'Chinobod', NULL, 'Чинобод', NULL, 'Чинабад', NULL),
(1730236855, 17, 30, 236, 855, 'Taypoq', NULL, 'Тайпоқ', NULL, 'Тайпак', NULL),
(1730238550, 17, 30, 238, 550, 'Furqat tumanining shaharchalari', NULL, 'Фурқат туманининг шаҳарчалари', NULL, 'Городские поселки Фуркатского района', NULL),
(1730238551, 17, 30, 238, 551, 'Navbahor', NULL, 'Навбаҳор', NULL, 'Навбахор', NULL),
(1730238553, 17, 30, 238, 553, 'Kaldo\'shan', NULL, 'Калдўшан', NULL, 'Калдушан', NULL),
(1730238555, 17, 30, 238, 555, 'Qo\'qonboy', NULL, 'Қўқонбой', NULL, 'Куконбай', NULL),
(1730238557, 17, 30, 238, 557, 'Tomosha', NULL, 'Томоша', NULL, 'Томоша', NULL),
(1730238559, 17, 30, 238, 559, 'Chek chuvaldak', NULL, 'Чек чувалдак', NULL, 'Чек чувалдак', NULL),
(1730238561, 17, 30, 238, 561, 'Shoyinbek', NULL, 'Шойинбек', NULL, 'Шойинбек', NULL),
(1730238563, 17, 30, 238, 563, 'Eski', NULL, 'Эски', NULL, 'Эски', NULL),
(1730238565, 17, 30, 238, 565, 'Eshon', NULL, 'Эшон', NULL, 'Эшон', NULL),
(1730238800, 17, 30, 238, 800, 'Furqat tumanining qishloq fuqarolar yig\'inlari', NULL, 'Фурқат туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Фуркатского района', NULL),
(1730238810, 17, 30, 238, 810, 'G\'allakor', NULL, 'Ғаллакор', NULL, 'Галлакор', NULL),
(1730238830, 17, 30, 238, 830, 'Qo\'qon', NULL, 'Қўқон', NULL, 'Коканд', NULL),
(1730238835, 17, 30, 238, 835, 'Navbahor', NULL, 'Навбаҳор', NULL, 'Навбахор', NULL),
(1730238840, 17, 30, 238, 840, 'Tomosha', NULL, 'Томоша', NULL, 'Тамаша', NULL),
(1730238850, 17, 30, 238, 850, 'Shunkor', NULL, 'Шункор', NULL, 'Шункар', NULL),
(1730238855, 17, 30, 238, 855, 'G\'uncha', NULL, 'Ғунча', NULL, 'Гунча', NULL),
(1730242550, 17, 30, 242, 550, 'Yozyovon tumanining shaharchalari', NULL, 'Ёзёвон туманининг шаҳарчалари', NULL, 'Городские поселки Язъяванского района', NULL),
(1730242551, 17, 30, 242, 551, 'Yozyovon', NULL, 'Ёзёвон', NULL, 'Язъяван', NULL),
(1730242554, 17, 30, 242, 554, 'Yozyovon chek', NULL, 'Ёзёвон чек', NULL, 'Езевон чек', NULL),
(1730242557, 17, 30, 242, 557, 'Yo\'ldoshobod', NULL, 'Йўлдошобод', NULL, 'Йулдошабад', NULL),
(1730242561, 17, 30, 242, 561, 'Qorasoqol', NULL, 'Қорасоқол', NULL, 'Карасакал', NULL),
(1730242564, 17, 30, 242, 564, 'Qoratepa', NULL, 'Қоратепа', NULL, 'Коратепа', NULL),
(1730242567, 17, 30, 242, 567, 'Kelajak', NULL, 'Келажак', NULL, 'Келажак', NULL),
(1730242571, 17, 30, 242, 571, 'Quyi Soybo\'yi', NULL, 'Қуйи Сойбўйи', NULL, 'Куйи Сойбуйи', NULL),
(1730242574, 17, 30, 242, 574, 'Toshxovuz', NULL, 'Тошховуз', NULL, 'Тошховуз', NULL),
(1730242577, 17, 30, 242, 577, 'Xonobod', NULL, 'Хонобод', NULL, 'Хонабад', NULL),
(1730242800, 17, 30, 242, 800, 'Yozyovon tumanining qishloq fuqarolar yig\'inlari', NULL, 'Ёзёвон туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Язъяванского района', NULL),
(1730242806, 17, 30, 242, 806, 'Guliston', NULL, 'Гулистон', NULL, 'Гулистан', NULL),
(1730242810, 17, 30, 242, 810, 'Qatortol', NULL, 'Қатортол', NULL, 'Катартал', NULL),
(1730242817, 17, 30, 242, 817, 'Karatepa', NULL, 'Каратепа', NULL, 'Каpатепа', NULL),
(1730242830, 17, 30, 242, 830, 'Xonobod', NULL, 'Хонобод', NULL, 'Ханабад', NULL),
(1730242832, 17, 30, 242, 832, 'Istiqlol', NULL, 'Истиқлол', NULL, 'Истиклол', NULL),
(1730242848, 17, 30, 242, 848, 'Yozyovon', NULL, 'Ёзёвон', NULL, 'Язъяван', NULL),
(1730242852, 17, 30, 242, 852, 'Yangiobod', NULL, 'Янгиобод', NULL, 'Янгиабад', NULL),
(1730242855, 17, 30, 242, 855, 'Ishtirxon', NULL, 'Иштирхон', NULL, 'Иштиpхон', NULL),
(1730242860, 17, 30, 242, 860, 'Qorasoqol', NULL, 'Қорасоқол', NULL, 'Карасакал', NULL),
(1730242865, 17, 30, 242, 865, 'Yangibo\'ston', NULL, 'Янгибўстон', NULL, 'Янгибустан', NULL),
(1730405550, 17, 30, 405, 550, 'Qo\'qon shahar xokimligiga qarashli shaharchalar', NULL, 'Қўқон шаҳар хокимлигига қарашли шаҳарчалар', NULL, 'Городские поселки, подч. Кокандскому горхокимияту', NULL),
(1730405555, 17, 30, 405, 555, 'Muqimiy', NULL, 'Муқимий', NULL, 'Мукими', NULL),
(1730408550, 17, 30, 408, 550, 'Quvasoy shahar xokimligiga qarashli shaharchalar', NULL, 'Қувасой шаҳар хокимлигига қарашли шаҳарчалар', NULL, 'Городские поселки подч. Кувасайскому горхокимияту', NULL),
(1730408555, 17, 30, 408, 555, 'Do\'stlik', NULL, 'Дўстлик', NULL, 'Дустлик', NULL),
(1730408800, 17, 30, 408, 800, 'Quvasoy shahar xokimligiga qarashli qishloq fuqarolar yig\'inlari', NULL, 'Қувасой шаҳар хокимлигига қарашли қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы гр-н, подч. Кувасайскому горхок-ту', NULL),
(1730408811, 17, 30, 408, 811, 'Arsif', NULL, 'Арсиф', NULL, 'Арсив', NULL),
(1730408822, 17, 30, 408, 822, 'Valik', NULL, 'Валик', NULL, 'Валик', NULL),
(1730408829, 17, 30, 408, 829, 'Qo\'chqorchi', NULL, 'Қўчқорчи', NULL, 'Кучкаpчи', NULL),
(1730408833, 17, 30, 408, 833, 'Muyon', NULL, 'Муён', NULL, 'Муян', NULL),
(1730408841, 17, 30, 408, 841, 'Isfayramsoy', NULL, 'Исфайрамсой', NULL, 'Исфайрамсой', NULL),
(1730408845, 17, 30, 408, 845, 'So\'fon', NULL, 'Сўфон', NULL, 'Суфан', NULL),
(1730412550, 17, 30, 412, 550, 'Marg\'ilon shahar xokimligiga qarashli shaharchalar', NULL, 'Марғилон шаҳар хокимлигига қарашли шаҳарчалар', NULL, 'Городкие поселки, подч. Маргиланскому горхокимияту', NULL),
(1730412557, 17, 30, 412, 557, 'Yangi Marg\'ilon', NULL, 'Янги Марғилон', NULL, 'Янги Маpгилан', NULL),
(1733204550, 17, 33, 204, 550, 'Bog\'ot tumanining shaharchalari', NULL, 'Боғот туманининг шаҳарчалари', NULL, 'Городские поселки Багатского района', NULL),
(1733204551, 17, 33, 204, 551, 'Bog\'ot', NULL, 'Боғот', NULL, 'Багат', NULL),
(1733204553, 17, 33, 204, 553, 'Nurafshon', NULL, 'Нурафшон', NULL, 'Нурафшон', NULL),
(1733204555, 17, 33, 204, 555, 'Oltinqum', NULL, 'Олтинқум', NULL, 'Олтинкум', NULL),
(1733204557, 17, 33, 204, 557, 'Uzumzor', NULL, 'Узумзор', NULL, 'Узумзор', NULL),
(1733204559, 17, 33, 204, 559, 'Yangiqadam', NULL, 'Янгиқадам', NULL, 'Янгикадам', NULL),
(1733204800, 17, 33, 204, 800, 'Bog\'ot tumanining qishloq fuqarolar yig\'inlari', NULL, 'Боғот туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Багатского района', NULL),
(1733204805, 17, 33, 204, 805, 'Qorayong\'oq', NULL, 'Қораёнғоқ', NULL, 'Караянтак', NULL),
(1733204813, 17, 33, 204, 813, 'Beshariq', NULL, 'Бешариқ', NULL, 'Бешарык', NULL),
(1733204822, 17, 33, 204, 822, 'Dehqonbozor', NULL, 'Деҳқонбозор', NULL, 'Дехканбазар', NULL),
(1733204833, 17, 33, 204, 833, 'Qulonqorabog\'', NULL, 'Қулонқорабоғ', NULL, 'Куланкарабаг', NULL),
(1733204844, 17, 33, 204, 844, 'O\'g\'uzrabot', NULL, 'Ўғузработ', NULL, 'Угузработ', NULL),
(1733204849, 17, 33, 204, 849, 'Madaniyat', NULL, 'Маданият', NULL, 'Маданият', NULL),
(1733204855, 17, 33, 204, 855, 'Nayman', NULL, 'Найман', NULL, 'Найман', NULL),
(1733204866, 17, 33, 204, 866, 'Mirishkor', NULL, 'Миришкор', NULL, 'Миришкор', NULL),
(1733204870, 17, 33, 204, 870, 'Xo\'jalik', NULL, 'Хўжалик', NULL, 'Хужалик', NULL),
(1733204875, 17, 33, 204, 875, 'Qipchoq', NULL, 'Қипчоқ', NULL, 'Кипчак', NULL),
(1733208550, 17, 33, 208, 550, 'Gurlan tumanining shaharchalari', NULL, 'Гурлан туманининг шаҳарчалари', NULL, 'Городские поселки Гурленского района', NULL),
(1733208551, 17, 33, 208, 551, 'Gurlan', NULL, 'Гурлан', NULL, 'Гурлен', NULL),
(1733208554, 17, 33, 208, 554, 'Chakkalar', NULL, 'Чаккалар', NULL, 'Чаккалар', NULL),
(1733208557, 17, 33, 208, 557, 'Bo\'zqal\'a', NULL, 'Бўзқалъа', NULL, 'Бузкалъа', NULL),
(1733208561, 17, 33, 208, 561, 'Nurzamin', NULL, 'Нурзамин', NULL, 'Нурзамин', NULL),
(1733208564, 17, 33, 208, 564, 'Nukus yop', NULL, 'Нукус ёп', NULL, 'Нукус еп', NULL),
(1733208567, 17, 33, 208, 567, 'Markaziy Guliston', NULL, 'Марказий Гулистон', NULL, 'Марказий Гулистан', NULL),
(1733208571, 17, 33, 208, 571, 'Do\'simbiy', NULL, 'Дўсимбий', NULL, 'Дусимбий', NULL),
(1733208574, 17, 33, 208, 574, 'Taxtako\'pir', NULL, 'Тахтакўпир', NULL, 'Тахтакупир', NULL),
(1733208577, 17, 33, 208, 577, 'Yormish', NULL, 'Ёрмиш', NULL, 'Ермиш', NULL),
(1733208800, 17, 33, 208, 800, 'Gurlan tumanining qishloq fuqarolar yig\'inlari', NULL, 'Гурлан туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Гурленского района', NULL),
(1733208803, 17, 33, 208, 803, 'Olg\'a', NULL, 'Олға', NULL, 'Алга', NULL),
(1733208820, 17, 33, 208, 820, 'Vazir', NULL, 'Вазир', NULL, 'Вазир', NULL),
(1733208825, 17, 33, 208, 825, 'Guliston', NULL, 'Гулистон', NULL, 'Гулистан', NULL),
(1733208826, 17, 33, 208, 826, 'Xizireli', NULL, 'Хизирели', NULL, 'Хизирэли', NULL),
(1733208835, 17, 33, 208, 835, 'Birlashgan', NULL, 'Бирлашган', NULL, 'Бирлашган', NULL),
(1733208855, 17, 33, 208, 855, 'Saxtiyon', NULL, 'Сахтиён', NULL, 'Сахтиян', NULL),
(1733208857, 17, 33, 208, 857, 'Do\'simbiy', NULL, 'Дўсимбий', NULL, 'Досимбий', NULL),
(1733208874, 17, 33, 208, 874, 'Sholikor', NULL, 'Шоликор', NULL, 'Шаликор', NULL),
(1733208881, 17, 33, 208, 881, 'Eshimjiron', NULL, 'Эшимжирон', NULL, 'Эшимжиран', NULL),
(1733212550, 17, 33, 212, 550, 'Qo\'shko\'pir tumanining shaharchalari', NULL, 'Қўшкўпир туманининг шаҳарчалари', NULL, 'Городские поселки Кошкупырского района', NULL),
(1733212551, 17, 33, 212, 551, 'Qo\'shko\'pir', NULL, 'Қўшкўпир', NULL, 'Кошкупыр', NULL),
(1733212553, 17, 33, 212, 553, 'Qoromon', NULL, 'Қоромон', NULL, 'Караман', NULL),
(1733212555, 17, 33, 212, 555, 'O\'rta qishloq', NULL, 'Ўрта қишлоқ', NULL, 'Урта кишлак', NULL),
(1733212557, 17, 33, 212, 557, 'Xonbod', NULL, 'Хонбод', NULL, 'Хонабад', NULL),
(1733212559, 17, 33, 212, 559, 'Shixmashhad', NULL, 'Шихмашҳад', NULL, 'Шихмашхад', NULL),
(1733212561, 17, 33, 212, 561, 'Sherobod', NULL, 'Шеробод', NULL, 'Шерабад', NULL),
(1733212800, 17, 33, 212, 800, 'Qo\'shko\'pir tumanining qishloq fuqarolar yig\'inlari', NULL, 'Қўшкўпир туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Кошкупырского района', NULL),
(1733212811, 17, 33, 212, 811, 'Shix', NULL, 'Ших', NULL, 'Ших', NULL),
(1733212822, 17, 33, 212, 822, 'G\'ozovot', NULL, 'Ғозовот', NULL, 'Газават', NULL),
(1733212827, 17, 33, 212, 827, 'Oqdarband', NULL, 'Оқдарбанд', NULL, 'Акдарбанд', NULL),
(1733212833, 17, 33, 212, 833, 'Qotog\'on', NULL, 'Қотоғон', NULL, 'Котогон', NULL),
(1733212840, 17, 33, 212, 840, 'Kenagas', NULL, 'Кенагас', NULL, 'Кенегес', NULL),
(1733212856, 17, 33, 212, 856, 'O\'zbekyap', NULL, 'Ўзбекяп', NULL, 'Узбекяб', NULL),
(1733212867, 17, 33, 212, 867, 'O\'rtayap', NULL, 'Ўртаяп', NULL, 'Уртаяп', NULL),
(1733212878, 17, 33, 212, 878, 'Xadra', NULL, 'Хадра', NULL, 'Хадра', NULL),
(1733212889, 17, 33, 212, 889, 'Xonobod', NULL, 'Хонобод', NULL, 'Ханабад', NULL),
(1733212891, 17, 33, 212, 891, 'Xosiyon', NULL, 'Хосиён', NULL, 'Хасиян', NULL),
(1733212893, 17, 33, 212, 893, 'Xayrobod', NULL, 'Хайробод', NULL, 'Хайрабад', NULL),
(1733212895, 17, 33, 212, 895, 'Yangilik', NULL, 'Янгилик', NULL, 'Янгилик', NULL),
(1733217550, 17, 33, 217, 550, 'Urganch tumanining shaharchalari', NULL, 'Урганч туманининг шаҳарчалари', NULL, 'Городские поселки Ургенчского района', NULL),
(1733217554, 17, 33, 217, 554, 'Cholish', NULL, 'Чолиш', NULL, 'Чалыш', NULL),
(1733217558, 17, 33, 217, 558, 'Oq oltin', NULL, 'Оқ олтин', NULL, 'Ак алтин', NULL),
(1733217562, 17, 33, 217, 562, 'Chandir', NULL, 'Чандир', NULL, 'Чондир', NULL),
(1733217566, 17, 33, 217, 566, 'Ko\'palik', NULL, 'Кўпалик', NULL, 'Купалик', NULL),
(1733217572, 17, 33, 217, 572, 'Gardonlar', NULL, 'Гардонлар', NULL, 'Гардонлар', NULL),
(1733217800, 17, 33, 217, 800, 'Urganch tumanining qishloq fuqarolar yig\'inlari', NULL, 'Урганч туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Ургенчского района', NULL),
(1733217822, 17, 33, 217, 822, 'Bekobod', NULL, 'Бекобод', NULL, 'Бекабад', NULL),
(1733217833, 17, 33, 217, 833, 'G\'aybu', NULL, 'Ғайбу', NULL, 'Гайбу', NULL),
(1733217844, 17, 33, 217, 844, 'Qoromon', NULL, 'Қоромон', NULL, 'Караман', NULL),
(1733217855, 17, 33, 217, 855, 'Qoroul', NULL, 'Қороул', NULL, 'Караул', NULL),
(1733217863, 17, 33, 217, 863, 'Chatko\'pir', NULL, 'Чаткўпир', NULL, 'Чаткупыр', NULL),
(1733217869, 17, 33, 217, 869, 'Chakkasholikor', NULL, 'Чаккашоликор', NULL, 'Чаккашаликар', NULL),
(1733217872, 17, 33, 217, 872, 'Chandirkiyat', NULL, 'Чандиркият', NULL, 'Чандиркият', NULL),
(1733217882, 17, 33, 217, 882, 'Yuqori bog\'', NULL, 'Юқори боғ', NULL, 'Юкарибаг', NULL),
(1733217890, 17, 33, 217, 890, 'Yuqori do\'rman', NULL, 'Юқори дўрман', NULL, 'Юкары-Дорман', NULL),
(1733217895, 17, 33, 217, 895, 'G\'alaba', NULL, 'Ғалаба', NULL, 'Галаба', NULL),
(1733220550, 17, 33, 220, 550, 'Xazorasp tumanining shaharchalari', NULL, 'Хазорасп туманининг шаҳарчалари', NULL, 'Городские поселки Хазараспского района', NULL),
(1733220551, 17, 33, 220, 551, 'Xazorasp', NULL, 'Хазорасп', NULL, 'Хазарасп', NULL),
(1733220553, 17, 33, 220, 553, 'Oq yop', NULL, 'Оқ ёп', NULL, 'Ак еп', NULL),
(1733220555, 17, 33, 220, 555, 'Oyok ovvo', NULL, 'Оёк овво', NULL, 'Аек-авва', NULL),
(1733220557, 17, 33, 220, 557, 'Nurxayot', NULL, 'Нурхаёт', NULL, 'Нурхаёт', NULL),
(1733220800, 17, 33, 220, 800, 'Xazorasp tumanining qishloq fuqarolar yig\'inlari', NULL, 'Хазорасп туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Хазараспского района', NULL),
(1733220803, 17, 33, 220, 803, 'Ovshar', NULL, 'Овшар', NULL, 'Авшар', NULL),
(1733220806, 17, 33, 220, 806, 'Karvak', NULL, 'Карвак', NULL, 'Карвак', NULL),
(1733220812, 17, 33, 220, 812, 'Beshta', NULL, 'Бешта', NULL, 'Бешта', NULL),
(1733220814, 17, 33, 220, 814, 'Bo\'ston', NULL, 'Бўстон', NULL, 'Бустан', NULL);
INSERT INTO `soato` (`MHOBT_cod`, `res_id`, `region_id`, `district_id`, `qfi_id`, `name_lot`, `center_lot`, `name_cyr`, `center_cyr`, `name_ru`, `center_ru`) VALUES
(1733220822, 17, 33, 220, 822, 'Pitnak', NULL, 'Питнак', NULL, 'Питнак', NULL),
(1733220830, 17, 33, 220, 830, 'Pichoqchi', NULL, 'Пичоқчи', NULL, 'Пичакчи', NULL),
(1733220845, 17, 33, 220, 845, 'Sanoat', NULL, 'Саноат', NULL, 'Саноат', NULL),
(1733220852, 17, 33, 220, 852, 'Sarimoy', NULL, 'Саримой', NULL, 'Саримай', NULL),
(1733220862, 17, 33, 220, 862, 'Tuproqqal\'a', NULL, 'Тупроққалъа', NULL, 'Тупраккала', NULL),
(1733220868, 17, 33, 220, 868, 'Muxomon', NULL, 'Мухомон', NULL, 'Мухаман', NULL),
(1733220879, 17, 33, 220, 879, 'Yangibozor', NULL, 'Янгибозор', NULL, 'Янгибазар', NULL),
(1733221500, 17, 33, 221, 500, 'Tuproqqal\'a tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Тупроққалъа туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Тупроккалинского района', NULL),
(1733221501, 17, 33, 221, 501, 'Pitnak', NULL, 'Питнак', NULL, 'Питнак', NULL),
(1733221550, 17, 33, 221, 550, 'Tuproqqal\'a tumanining shaharchalari', NULL, 'Тупроққалъа туманининг шаҳарчалари', NULL, 'Городские поселки Тупроккалинского района', NULL),
(1733221800, 17, 33, 221, 800, 'Tuproqqal\'a tumanining qishloq fuqarolar yig\'inlari', NULL, 'Тупроққалъа туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Тупроккалинского района', NULL),
(1733223550, 17, 33, 223, 550, 'Xonqa tumanining shaharchalari', NULL, 'Хонқа туманининг шаҳарчалари', NULL, 'Городские поселки Ханкинского pайона', NULL),
(1733223551, 17, 33, 223, 551, 'Xonqa', NULL, 'Хонқа', NULL, 'Ханка', NULL),
(1733223553, 17, 33, 223, 553, 'Istiqlol', NULL, 'Истиқлол', NULL, 'Истиклол', NULL),
(1733223555, 17, 33, 223, 555, 'Madaniy yer', NULL, 'Маданий ер', NULL, 'Маданий ер', NULL),
(1733223557, 17, 33, 223, 557, 'Birlashgan', NULL, 'Бирлашган', NULL, 'Бирлашган', NULL),
(1733223559, 17, 33, 223, 559, 'Yosh kuch', NULL, 'Ёш куч', NULL, 'Еш куч', NULL),
(1733223800, 17, 33, 223, 800, 'Xonqa tumanining qishloq fuqarolar yig\'inlari', NULL, 'Хонқа туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Ханкинского района', NULL),
(1733223803, 17, 33, 223, 803, 'Amudaryo', NULL, 'Амударё', NULL, 'Амударья', NULL),
(1733223810, 17, 33, 223, 810, 'Qoraqosh', NULL, 'Қорақош', NULL, 'Каракош', NULL),
(1733223812, 17, 33, 223, 812, 'Katta Jirmiz', NULL, 'Катта Жирмиз', NULL, 'Катта Жирмиз', NULL),
(1733223820, 17, 33, 223, 820, 'Madir', NULL, 'Мадир', NULL, 'Мадир', NULL),
(1733223830, 17, 33, 223, 830, 'Qirq-yop', NULL, 'Қирқ-ёп', NULL, 'Кыркяп', NULL),
(1733223835, 17, 33, 223, 835, 'Navxos', NULL, 'Навхос', NULL, 'Навхас', NULL),
(1733223840, 17, 33, 223, 840, 'Namuna', NULL, 'Намуна', NULL, 'Намуна', NULL),
(1733223860, 17, 33, 223, 860, 'Sarapoyon', NULL, 'Сарапоён', NULL, 'Сарыпаян', NULL),
(1733223870, 17, 33, 223, 870, 'Tomadurgadik', NULL, 'Томадургадик', NULL, 'Тамадургадык', NULL),
(1733223890, 17, 33, 223, 890, 'Olaja', NULL, 'Олажа', NULL, 'Аладжа', NULL),
(1733226550, 17, 33, 226, 550, 'Xiva tumanining shaharchalari', NULL, 'Хива туманининг шаҳарчалари', NULL, 'Городские поселки Хивинского района', NULL),
(1733226552, 17, 33, 226, 552, 'Gullanbog\'', NULL, 'Гулланбоғ', NULL, 'Гулланбаг', NULL),
(1733226554, 17, 33, 226, 554, 'Parchanxos', NULL, 'Парчанхос', NULL, 'Парчанхас', NULL),
(1733226562, 17, 33, 226, 562, 'Iftixor', NULL, 'Ифтихор', NULL, 'Ифтихор', NULL),
(1733226564, 17, 33, 226, 564, 'Sho\'r-Qal\'a', NULL, 'Шўр-қалъа', NULL, 'Шуркалъа', NULL),
(1733226566, 17, 33, 226, 566, 'Yuqori qo\'m', NULL, 'Юқори қўм', NULL, 'Юкориком', NULL),
(1733226568, 17, 33, 226, 568, 'Hamkor', NULL, 'Ҳамкор', NULL, 'Хамкор', NULL),
(1733226800, 17, 33, 226, 800, 'Xiva tumanining qishloq fuqarolar yig\'inlari', NULL, 'Хива туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Хивинского района', NULL),
(1733226805, 17, 33, 226, 805, 'Oq-yop', NULL, 'Оқ-ёп', NULL, 'Акяп', NULL),
(1733226810, 17, 33, 226, 810, 'Gandimyon', NULL, 'Гандимён', NULL, 'Гандимян', NULL),
(1733226820, 17, 33, 226, 820, 'Dashyoq', NULL, 'Дашёқ', NULL, 'Дашьяк', NULL),
(1733226826, 17, 33, 226, 826, 'Juryon', NULL, 'Журён', NULL, 'Журян', NULL),
(1733226834, 17, 33, 226, 834, 'Irdinzon', NULL, 'Ирдинзон', NULL, 'Ирдимзан', NULL),
(1733226845, 17, 33, 226, 845, 'Eski-Qiyot', NULL, 'Эски-Қиёт', NULL, 'Эски кият', NULL),
(1733226856, 17, 33, 226, 856, 'Sayot', NULL, 'Саёт', NULL, 'Саят', NULL),
(1733226867, 17, 33, 226, 867, 'Shomoxulum', NULL, 'Шомохулум', NULL, 'Шамахулум', NULL),
(1733226878, 17, 33, 226, 878, 'Chinobod', NULL, 'Чинобод', NULL, 'Чинабад', NULL),
(1733230550, 17, 33, 230, 550, 'Shovot tumanining shaharchalari', NULL, 'Шовот туманининг шаҳарчалари', NULL, 'Городские поселки Шаватского района', NULL),
(1733230551, 17, 33, 230, 551, 'Shovot', NULL, 'Шовот', NULL, 'Шават', NULL),
(1733230554, 17, 33, 230, 554, 'Bo\'yrochi', NULL, 'Бўйрочи', NULL, 'Буйрачи', NULL),
(1733230557, 17, 33, 230, 557, 'Ipakchi', NULL, 'Ипакчи', NULL, 'Ипакчи', NULL),
(1733230561, 17, 33, 230, 561, 'Kangli', NULL, 'Кангли', NULL, 'Кангли', NULL),
(1733230564, 17, 33, 230, 564, 'Qat-qal\'a', NULL, 'Қат-қалъа', NULL, 'Кат-калъа', NULL),
(1733230567, 17, 33, 230, 567, 'Monoq', NULL, 'Моноқ', NULL, 'Монак', NULL),
(1733230571, 17, 33, 230, 571, 'Chig\'atoy', NULL, 'Чиғатой', NULL, 'Чигатай', NULL),
(1733230800, 17, 33, 230, 800, 'Shovot tumanining qishloq fuqarolar yig\'inlari', NULL, 'Шовот туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Шаватского района', NULL),
(1733230811, 17, 33, 230, 811, 'Qat-qal\'a', NULL, 'Қат-қалъа', NULL, 'Каткала', NULL),
(1733230822, 17, 33, 230, 822, 'Hurriyat', NULL, 'Ҳуррият', NULL, 'Хуррият', NULL),
(1733230825, 17, 33, 230, 825, 'Bo\'yroqchi', NULL, 'Бўйроқчи', NULL, 'Буйрачи', NULL),
(1733230830, 17, 33, 230, 830, 'Beshmergan', NULL, 'Бешмерган', NULL, 'Бешмерган', NULL),
(1733230833, 17, 33, 230, 833, 'Ijtimoyat', NULL, 'Ижтимоят', NULL, 'Ижтимаят', NULL),
(1733230839, 17, 33, 230, 839, 'Kangli', NULL, 'Кангли', NULL, 'Кангли', NULL),
(1733230844, 17, 33, 230, 844, 'Qiyot', NULL, 'Қиёт', NULL, 'Кият', NULL),
(1733230855, 17, 33, 230, 855, 'Chig\'atoyqal\'a', NULL, 'Чиғатойқалъа', NULL, 'Чигатай кала', NULL),
(1733230866, 17, 33, 230, 866, 'O\'zbekiston', NULL, 'Ўзбекистон', NULL, 'Узбекистан', NULL),
(1733230877, 17, 33, 230, 877, 'Cho\'qli', NULL, 'Чўқли', NULL, 'Чоклы', NULL),
(1733230888, 17, 33, 230, 888, 'Shovotqal\'a', NULL, 'Шовотқалъа', NULL, 'Шават кала', NULL),
(1733233550, 17, 33, 233, 550, 'Yangiariq tumanining shaharchalari', NULL, 'Янгиариқ туманининг шаҳарчалари', NULL, 'Городские поселки Янгиарыкского района', NULL),
(1733233551, 17, 33, 233, 551, 'Yangiariq', NULL, 'Янгиариқ', NULL, 'Янгиарык', NULL),
(1733233553, 17, 33, 233, 553, 'Gulbog\'', NULL, 'Гулбоғ', NULL, 'Гулбог', NULL),
(1733233555, 17, 33, 233, 555, 'Soburzon', NULL, 'Собурзон', NULL, 'Собурзан', NULL),
(1733233557, 17, 33, 233, 557, 'Suvgan', NULL, 'Сувган', NULL, 'Сувган', NULL),
(1733233561, 17, 33, 233, 561, 'Tagan', NULL, 'Таган', NULL, 'Таган', NULL),
(1733233563, 17, 33, 233, 563, 'Qo\'shloq', NULL, 'Қўшлоқ', NULL, 'Кушлок', NULL),
(1733233800, 17, 33, 233, 800, 'Yangiariq tumanining qishloq fuqarolar yig\'inlari', NULL, 'Янгиариқ туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Янгиарыкского района', NULL),
(1733233811, 17, 33, 233, 811, 'Qarmish', NULL, 'Қармиш', NULL, 'Кармиш', NULL),
(1733233822, 17, 33, 233, 822, 'Ostona', NULL, 'Остона', NULL, 'Астана', NULL),
(1733233833, 17, 33, 233, 833, 'Kattabog\'', NULL, 'Каттабоғ', NULL, 'Каттабаг', NULL),
(1733233844, 17, 33, 233, 844, 'Gulobod', NULL, 'Гулобод', NULL, 'Гулобод', NULL),
(1733233855, 17, 33, 233, 855, 'Gullanbog\'', NULL, 'Гулланбоғ', NULL, 'Гулланбаг', NULL),
(1733233872, 17, 33, 233, 872, 'Tagan', NULL, 'Таган', NULL, 'Таган', NULL),
(1733233884, 17, 33, 233, 884, 'Qo\'riqtom', NULL, 'Қўриқтом', NULL, 'Куриктам', NULL),
(1733233897, 17, 33, 233, 897, 'Chiriqchi', NULL, 'Чириқчи', NULL, 'Чикирчи', NULL),
(1733236550, 17, 33, 236, 550, 'Yangibozor tumanining shaharchalari', NULL, 'Янгибозор туманининг шаҳарчалари', NULL, 'Городские поселки Янгибазарского района', NULL),
(1733236551, 17, 33, 236, 551, 'Yangibozor', NULL, 'Янгибозор', NULL, 'Янгибазар', NULL),
(1733236554, 17, 33, 236, 554, 'Yangi yop', NULL, 'Янги ёп', NULL, 'Янги-еп', NULL),
(1733236558, 17, 33, 236, 558, 'Mangitlar', NULL, 'Мангитлар', NULL, 'Мангитлар', NULL),
(1733236800, 17, 33, 236, 800, 'Yangibozor tumanining qishloq fuqarolar yig\'inlari', NULL, 'Янгибозор туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Янгибазарского района', NULL),
(1733236803, 17, 33, 236, 803, 'Oyoqdo\'rman', NULL, 'Оёқдўрман', NULL, 'Аякдорман', NULL),
(1733236805, 17, 33, 236, 805, 'Bog\'olon', NULL, 'Боғолон', NULL, 'Багалан', NULL),
(1733236806, 17, 33, 236, 806, 'Boshkirshix', NULL, 'Бошкирших', NULL, 'Башкирших', NULL),
(1733236808, 17, 33, 236, 808, 'Bo\'zqal\'a', NULL, 'Бўзқалъа', NULL, 'Бозкала', NULL),
(1733236812, 17, 33, 236, 812, 'Qalandardo\'rman', NULL, 'Қаландардўрман', NULL, 'Каландардорман', NULL),
(1733236830, 17, 33, 236, 830, 'Uyg\'ur', NULL, 'Уйғур', NULL, 'Уйгур', NULL),
(1733236834, 17, 33, 236, 834, 'Cho\'bolonchi', NULL, 'Чўболончи', NULL, 'Чубаланчи', NULL),
(1733236836, 17, 33, 236, 836, 'Shirinqo\'ng\'irot', NULL, 'ШиринҚўнғирот', NULL, 'Ширинкунград', NULL),
(1735204500, 17, 35, 204, 500, 'Amudaryo tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Амударё туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Амударьинского района', NULL),
(1735204501, 17, 35, 204, 501, 'Mang\'it', NULL, 'Манғит', NULL, 'Мангит', NULL),
(1735204550, 17, 35, 204, 550, 'Amudaryo tumanining shaharchalari', NULL, 'Амударё туманининг шаҳарчалари', NULL, 'Гоpодские поселки Амударьинского района', NULL),
(1735204554, 17, 35, 204, 554, 'Jumurtov', NULL, 'Жумуртов', NULL, 'Джумуртау', NULL),
(1735204555, 17, 35, 204, 555, 'Kipshak', NULL, 'Кипшак', NULL, 'Кипчок', NULL),
(1735204556, 17, 35, 204, 556, 'Kilichboy', NULL, 'Киличбой', NULL, 'Киличбай', NULL),
(1735204557, 17, 35, 204, 557, 'Xitoy', NULL, 'Хитой', NULL, 'Китай', NULL),
(1735204800, 17, 35, 204, 800, 'Amudaryo tumanining qishloq fuqarolar yig\'inlari', NULL, 'Амударё туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Амударьинского района', NULL),
(1735204805, 17, 35, 204, 805, 'Nazarxon', NULL, 'Назархон', NULL, 'Назаpхан', NULL),
(1735204811, 17, 35, 204, 811, 'O\'rta-qala', NULL, 'Ўрта-қала', NULL, 'Оpта - кала', NULL),
(1735204822, 17, 35, 204, 822, 'Qipchaq', NULL, 'Қипчақ', NULL, 'Кипчак', NULL),
(1735204833, 17, 35, 204, 833, 'Quyuq-kupir', NULL, 'Қуюқ-купир', NULL, 'Куюк- Купиp', NULL),
(1735204844, 17, 35, 204, 844, 'Xitay', NULL, 'Хитай', NULL, 'Ктай', NULL),
(1735204848, 17, 35, 204, 848, 'Oq oltin', NULL, 'Оқ олтин', NULL, 'Ок олтин', NULL),
(1735204855, 17, 35, 204, 855, 'Chaykul', NULL, 'Чайкул', NULL, 'Чайкол', NULL),
(1735204866, 17, 35, 204, 866, 'Qlichboy', NULL, 'Қличбой', NULL, 'Кличбай', NULL),
(1735204870, 17, 35, 204, 870, 'Kangli', NULL, 'Кангли', NULL, 'Канлы', NULL),
(1735204874, 17, 35, 204, 874, 'Amir Temur', NULL, 'Амир Темур', NULL, 'Амир Темур', NULL),
(1735204875, 17, 35, 204, 875, 'Durman', NULL, 'Дурман', NULL, 'Дурман', NULL),
(1735204880, 17, 35, 204, 880, 'Bobur nomli', NULL, 'Бобур номли', NULL, 'им. Бабура', NULL),
(1735204883, 17, 35, 204, 883, 'Buzyop', NULL, 'Бузёп', NULL, 'Бузяп', NULL),
(1735204887, 17, 35, 204, 887, 'To\'lqin', NULL, 'Тўлқин', NULL, 'Тулкин', NULL),
(1735204889, 17, 35, 204, 889, 'Tashyop', NULL, 'Ташёп', NULL, 'Ташеп', NULL),
(1735204892, 17, 35, 204, 892, 'Xolimbeg', NULL, 'Холимбег', NULL, 'Холимбег', NULL),
(1735207500, 17, 35, 207, 500, 'Beruniy tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Беруний туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Берунийского района', NULL),
(1735207501, 17, 35, 207, 501, 'Beruniy', NULL, 'Беруний', NULL, 'Беруни', NULL),
(1735207550, 17, 35, 207, 550, 'Beruniy tumanining shaharchalari', NULL, 'Беруний туманининг шаҳарчалари', NULL, 'Городские поселки Берунийского района', NULL),
(1735207552, 17, 35, 207, 552, 'Bulish', NULL, 'Булиш', NULL, 'Булиш', NULL),
(1735207800, 17, 35, 207, 800, 'Beruniy tumanining qishloq fuqarolar yig\'inlari', NULL, 'Беруний туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Берунийского района', NULL),
(1735207807, 17, 35, 207, 807, 'Abay', NULL, 'Абай', NULL, 'Абай', NULL),
(1735207811, 17, 35, 207, 811, 'Ozod', NULL, 'Озод', NULL, 'Азад', NULL),
(1735207814, 17, 35, 207, 814, 'Sarkop', NULL, 'Саркоп', NULL, 'Саpкоп', NULL),
(1735207816, 17, 35, 207, 816, 'Navoiy', NULL, 'Навоий', NULL, 'Навои', NULL),
(1735207818, 17, 35, 207, 818, 'Beruniy', NULL, 'Беруний', NULL, 'Беpуни', NULL),
(1735207822, 17, 35, 207, 822, 'Maxtumquli', NULL, 'Махтумқули', NULL, 'Махтумкули', NULL),
(1735207827, 17, 35, 207, 827, 'Biybazar', NULL, 'Бийбазар', NULL, 'Бийбазар', NULL),
(1735207829, 17, 35, 207, 829, 'Do\'stlik', NULL, 'Дўстлик', NULL, 'Дустлик', NULL),
(1735207832, 17, 35, 207, 832, 'Altinsay', NULL, 'Алтинсай', NULL, 'Алтынсай', NULL),
(1735207843, 17, 35, 207, 843, 'Qizilqal\'a', NULL, 'Қизилқалъа', NULL, 'Кызылкала', NULL),
(1735207865, 17, 35, 207, 865, 'Shabaz', NULL, 'Шабаз', NULL, 'Шабаз', NULL),
(1735207876, 17, 35, 207, 876, 'Shimam', NULL, 'Шимам', NULL, 'Шимам', NULL),
(1735207880, 17, 35, 207, 880, 'Tinchlik', NULL, 'Тинчлик', NULL, 'Тинчлик', NULL),
(1735209550, 17, 35, 209, 550, 'Bo\'zatov tumanining shaharchalari', NULL, 'Бўзатов туманининг  шаҳарчалари', NULL, 'Гоpодские поселки Бозатауского района', NULL),
(1735209551, 17, 35, 209, 551, 'Bo\'zatov', NULL, 'Бўзатов', NULL, 'Бозатау', NULL),
(1735209800, 17, 35, 209, 800, 'Bo\'zatov tumanining qishloq fuqarolar yig\'inlari', NULL, 'Бўзатов туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Бозатауского района', NULL),
(1735209804, 17, 35, 209, 804, 'Aspantay', NULL, 'Аспантай', NULL, 'Аспантай', NULL),
(1735209808, 17, 35, 209, 808, 'Yerkindarya', NULL, 'Еркиндаря', NULL, 'Еркиндарья', NULL),
(1735209812, 17, 35, 209, 812, 'Ko\'k-suv', NULL, 'Кўк-сув', NULL, 'Кук-су', NULL),
(1735209818, 17, 35, 209, 818, 'Qusqanatov', NULL, 'Қусқанатов', NULL, 'Кусканатау', NULL),
(1735211550, 17, 35, 211, 550, 'Qorao\'zak tumanining shaharchalari', NULL, 'Қораўзак туманининг  шаҳарчалари', NULL, 'Гоpодские поселки Караузякского района', NULL),
(1735211551, 17, 35, 211, 551, 'Qorao\'zak', NULL, 'Қораўзак', NULL, 'Караузяк', NULL),
(1735211800, 17, 35, 211, 800, 'Qorao\'zak tumanining qishloq fuqarolar yig\'inlari', NULL, 'Қораўзак туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Караузякского района', NULL),
(1735211803, 17, 35, 211, 803, 'Olgabas', NULL, 'Олгабас', NULL, 'Алгабас', NULL),
(1735211815, 17, 35, 211, 815, 'Yesimuzak', NULL, 'Есимузак', NULL, 'Есимозек', NULL),
(1735211823, 17, 35, 211, 823, 'Qarakul', NULL, 'Қаракул', NULL, 'Каpакуль', NULL),
(1735211826, 17, 35, 211, 826, 'Qarabug\'a', NULL, 'Қарабуға', NULL, 'Карабуга', NULL),
(1735211828, 17, 35, 211, 828, 'Qorauzek', NULL, 'Қораузек', NULL, 'Караузяк', NULL),
(1735211830, 17, 35, 211, 830, 'Qoyboq', NULL, 'Қойбоқ', NULL, 'Койбак', NULL),
(1735211835, 17, 35, 211, 835, 'Madeniyat', NULL, 'Маденият', NULL, 'Маденият', NULL),
(1735211837, 17, 35, 211, 837, 'Berdax', NULL, 'Бердах', NULL, 'им. Бердах', NULL),
(1735212500, 17, 35, 212, 500, 'Kegeyli tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Кегейли туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Кегейлийского района', NULL),
(1735212505, 17, 35, 212, 505, 'Xalqobod', NULL, 'Халқобод', NULL, 'Халкабад', NULL),
(1735212550, 17, 35, 212, 550, 'Kegeyli tumanining shaharchalari', NULL, 'Кегейли туманининг шаҳарчалари', NULL, 'Гоpодские поселки Кегейлийского района', NULL),
(1735212551, 17, 35, 212, 551, 'Kegeyli', NULL, 'Кегейли', NULL, 'Кегейли', NULL),
(1735212800, 17, 35, 212, 800, 'Kegeyli tumanining qishloq fuqarolar yig\'inlari', NULL, 'Кегейли туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Кегейлийского района', NULL),
(1735212806, 17, 35, 212, 806, 'Aktuba', NULL, 'Актуба', NULL, 'Актуба', NULL),
(1735212815, 17, 35, 212, 815, 'Janabazar', NULL, 'Жанабазар', NULL, 'Жанабазар', NULL),
(1735212833, 17, 35, 212, 833, 'Jalpak jap', NULL, 'Жалпак жап', NULL, 'Жалпакжап', NULL),
(1735212834, 17, 35, 212, 834, 'Кок Озек', NULL, 'Kok Ozek', NULL, 'Кок Озек', NULL),
(1735212835, 17, 35, 212, 835, 'Kumshunkul', NULL, 'Кумшункул', NULL, 'Кумшункуль', NULL),
(1735212839, 17, 35, 212, 839, 'Juzim bag\'', NULL, 'Жузим бағ', NULL, 'Жузим баг', NULL),
(1735212841, 17, 35, 212, 841, 'Ийшан кала', NULL, 'Iyshan kala', NULL, 'Ийшан кала', NULL),
(1735212855, 17, 35, 212, 855, 'Obad', NULL, 'Обад', NULL, 'Абад', NULL),
(1735215500, 17, 35, 215, 500, 'Qo\'ng\'irot tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Қўнғирот туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Кунградского района', NULL),
(1735215501, 17, 35, 215, 501, 'Qo\'ng\'irot', NULL, 'Қўнғирот', NULL, 'Кунград', NULL),
(1735215550, 17, 35, 215, 550, 'Qo\'ng\'irot tumanining shaharchalari', NULL, 'Қўнғирот туманининг шаҳарчалари', NULL, 'Гоpодские поселки Кунградского района', NULL),
(1735215552, 17, 35, 215, 552, 'Jasliq', NULL, 'Жаслиқ', NULL, 'Жаслык', NULL),
(1735215554, 17, 35, 215, 554, 'Qaraqalpaqstan', NULL, 'Қарақалпақстан', NULL, 'Каракалпакстан', NULL),
(1735215560, 17, 35, 215, 560, 'Qiriqqiz', NULL, 'Қириққиз', NULL, 'Кырыккыз', NULL),
(1735215562, 17, 35, 215, 562, 'Oltinko\'l', NULL, 'Олтинкўл', NULL, 'Алтынкуль', NULL),
(1735215567, 17, 35, 215, 567, 'Yelabad', NULL, 'Елабад', NULL, 'Елабад', NULL),
(1735215800, 17, 35, 215, 800, 'Qo\'ng\'irot tumanining qishloq fuqarolar yig\'inlari', NULL, 'Қўнғирот туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Кунградского района', NULL),
(1735215806, 17, 35, 215, 806, 'Adebiyat', NULL, 'Адебият', NULL, 'Адебият', NULL),
(1735215809, 17, 35, 215, 809, 'Ajaniyaz-ata nomli', NULL, 'Ажанияз-ата номли', NULL, 'им.Ажинияза', NULL),
(1735215811, 17, 35, 215, 811, 'Qo\'ng\'irot', NULL, 'Қўнғирот', NULL, 'Кунгpад', NULL),
(1735215814, 17, 35, 215, 814, 'Kanli', NULL, 'Канли', NULL, 'Канлы', NULL),
(1735215818, 17, 35, 215, 818, 'Urnek', NULL, 'Урнек', NULL, 'Орнек', NULL),
(1735215822, 17, 35, 215, 822, 'Raushan', NULL, 'Раушан', NULL, 'Раушан', NULL),
(1735215826, 17, 35, 215, 826, 'Suuyenli', NULL, 'Сууенли', NULL, 'Сууенли', NULL),
(1735215830, 17, 35, 215, 830, 'Ustyurt', NULL, 'Устюрт', NULL, 'Устирт', NULL),
(1735215834, 17, 35, 215, 834, 'Xorezm', NULL, 'Хорезм', NULL, 'Хорезм', NULL),
(1735215841, 17, 35, 215, 841, 'Kokdarya', NULL, 'Кокдаря', NULL, 'Кокдарья', NULL),
(1735215845, 17, 35, 215, 845, 'Miynetabad', NULL, 'Мийнетабад', NULL, 'Мийнетабад', NULL),
(1735215847, 17, 35, 215, 847, 'Qipshaq', NULL, 'Қипшақ', NULL, 'Кыпшак', NULL),
(1735218550, 17, 35, 218, 550, 'Qanliko\'l tumanining shaharchalari', NULL, 'Қанликўл туманининг шаҳарчалари', NULL, 'Гоpодские поселки Канлыкульского района', NULL),
(1735218551, 17, 35, 218, 551, 'Qanliko\'l', NULL, 'Қанликўл', NULL, 'Канлыкуль', NULL),
(1735218800, 17, 35, 218, 800, 'Qanliko\'l tumanining qishloq fuqarolar yig\'inlari', NULL, 'Қанликўл туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Канлыкульского района', NULL),
(1735218805, 17, 35, 218, 805, 'Arzimbet qum', NULL, 'Арзимбет қум', NULL, 'Арзымбет кум', NULL),
(1735218808, 17, 35, 218, 808, 'Bustan', NULL, 'Бустан', NULL, 'Бостон', NULL),
(1735218816, 17, 35, 218, 816, 'Qanliko\'l', NULL, 'Қанликўл', NULL, 'Канлыкуль', NULL),
(1735218817, 17, 35, 218, 817, 'Kosjap', NULL, 'Косжап', NULL, 'Косжап', NULL),
(1735218819, 17, 35, 218, 819, 'Beskupir', NULL, 'Бескупир', NULL, 'Бескопыр', NULL),
(1735218821, 17, 35, 218, 821, 'Navriz', NULL, 'Навриз', NULL, 'Наурыз', NULL),
(1735218823, 17, 35, 218, 823, 'Jana qal\'a', NULL, 'Жана қалъа', NULL, 'Жана кала', NULL),
(1735222500, 17, 35, 222, 500, 'Mo\'ynoq tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Мўйноқ туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Муйнакского района', NULL),
(1735222501, 17, 35, 222, 501, 'Mo\'ynoq', NULL, 'Мўйноқ', NULL, 'Муйнак', NULL),
(1735222800, 17, 35, 222, 800, 'Mo\'ynoq tumanining qishloq fuqarolar yig\'inlari', NULL, 'Мўйноқ туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Муйнакского района', NULL),
(1735222811, 17, 35, 222, 811, 'Bozatau', NULL, 'Бозатау', NULL, 'Бозатау', NULL),
(1735222822, 17, 35, 222, 822, 'Kazax-darya', NULL, 'Казах-даря', NULL, 'Казахдарья', NULL),
(1735222833, 17, 35, 222, 833, 'Madeli', NULL, 'Мадели', NULL, 'Мадели', NULL),
(1735222844, 17, 35, 222, 844, 'Tik-uzyak', NULL, 'Тик-узяк', NULL, 'Тикузяк', NULL),
(1735222855, 17, 35, 222, 855, 'Uchsay', NULL, 'Учсай', NULL, 'Учсай', NULL),
(1735222866, 17, 35, 222, 866, 'Xakim-ata', NULL, 'Хаким-ата', NULL, 'Хаким-ата', NULL),
(1735222877, 17, 35, 222, 877, 'Qizil jar', NULL, 'Қизил жар', NULL, 'Кизил жар', NULL),
(1735225550, 17, 35, 225, 550, 'Nukus tumanining shaharchalari', NULL, 'Нукус туманининг шаҳарчалари', NULL, 'Гоpодские поселки Нукусского района', NULL),
(1735225551, 17, 35, 225, 551, 'Oqmang\'it', NULL, 'Оқманғит', NULL, 'Акмангит', NULL),
(1735225800, 17, 35, 225, 800, 'Nukus tumanining qishloq fuqarolar yig\'inlari', NULL, 'Нукус туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Нукусского района', NULL),
(1735225822, 17, 35, 225, 822, 'Bakanshakli', NULL, 'Баканшакли', NULL, 'Баканшаклы', NULL),
(1735225835, 17, 35, 225, 835, 'Krantau', NULL, 'Крантау', NULL, 'Крантау', NULL),
(1735225843, 17, 35, 225, 843, 'Takirkul', NULL, 'Такиркул', NULL, 'Такыркол', NULL),
(1735225846, 17, 35, 225, 846, 'Samanbay', NULL, 'Саманбай', NULL, 'Саманбай', NULL),
(1735225854, 17, 35, 225, 854, 'Arbashi', NULL, 'Арбаши', NULL, 'Арбаши', NULL),
(1735225858, 17, 35, 225, 858, 'Kerder', NULL, 'Кердер', NULL, 'Кеpдеp', NULL),
(1735228500, 17, 35, 228, 500, 'Taxiatosh tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Тахиатош туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Тахиаташского района', NULL),
(1735228501, 17, 35, 228, 501, 'Taxiatosh', NULL, 'Тахиатош ', NULL, 'Тахиаташ', NULL),
(1735228550, 17, 35, 228, 550, 'Taxiatosh tumanining shaharchalari', NULL, 'Тахиатош туманининг шаҳарчалари', NULL, 'Гоpодские поселки Тахиаташского района', NULL),
(1735228553, 17, 35, 228, 553, 'Naymanko\'l', NULL, 'Найманкўл', NULL, 'Найманкул', NULL),
(1735228800, 17, 35, 228, 800, 'Taxiatosh tumanining qishloq fuqarolar yig\'inlari', NULL, 'Тахиатош туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Тахиаташского района', NULL),
(1735228806, 17, 35, 228, 806, 'Kenеgеs', NULL, 'Кенегес', NULL, 'Кенегес', NULL),
(1735228809, 17, 35, 228, 809, 'Naymanko\'l', NULL, 'Найманкўл', NULL, 'Найманкул', NULL),
(1735228812, 17, 35, 228, 812, 'Sarаyko\'l', NULL, 'Сарайкўл', NULL, 'Сарайкул', NULL),
(1735230550, 17, 35, 230, 550, 'Taxtako\'pir tumanining shaharchalari', NULL, 'Тахтакўпир туманининг шаҳарчалари', NULL, 'Гоpодские поселки Тахтакупырского района', NULL),
(1735230551, 17, 35, 230, 551, 'Taxtako\'pir', NULL, 'Тахтакўпир', NULL, 'Тахтакупыр', NULL),
(1735230800, 17, 35, 230, 800, 'Taxtako\'pir tumanining qishloq fuqarolar yig\'inlari', NULL, 'Тахтакўпир туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Тахтакупырского района', NULL),
(1735230803, 17, 35, 230, 803, 'Atakul', NULL, 'Атакул', NULL, 'Атакуль', NULL),
(1735230820, 17, 35, 230, 820, 'Qara-oy', NULL, 'Қара-ой', NULL, 'Караой', NULL),
(1735230833, 17, 35, 230, 833, 'Mulik', NULL, 'Мулик', NULL, 'Мулик', NULL),
(1735230835, 17, 35, 230, 835, 'Qungrat kul', NULL, 'Қунграт кул', NULL, 'Коныраткол', NULL),
(1735230837, 17, 35, 230, 837, 'Janadarya', NULL, 'Жанадаря', NULL, 'Жанадаpья', NULL),
(1735230840, 17, 35, 230, 840, 'Beltau', NULL, 'Белтау', NULL, 'Белтау', NULL),
(1735230844, 17, 35, 230, 844, 'Qarateren', NULL, 'Қаратерен', NULL, 'Каратерен', NULL),
(1735230877, 17, 35, 230, 877, 'Taxtako\'pir', NULL, 'Тахтакўпир', NULL, 'Тахтакупыр', NULL),
(1735233500, 17, 35, 233, 500, 'To\'rtko\'l tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Тўрткўл туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Турткульского района', NULL),
(1735233501, 17, 35, 233, 501, 'To\'rtko\'l', NULL, 'Тўрткўл', NULL, 'Турткуль', NULL),
(1735233550, 17, 35, 233, 550, 'To\'rtko\'l tumanining shaharchalari', NULL, 'Тўрткўл туманининг шаҳарчалари', NULL, 'Городские поселки Турткульского района', NULL),
(1735233552, 17, 35, 233, 552, 'Miskin', NULL, 'Мискин', NULL, 'Мискин', NULL),
(1735233554, 17, 35, 233, 554, 'Turkmankuli', NULL, 'Туркманкули', NULL, 'Туркманкули', NULL),
(1735233556, 17, 35, 233, 556, 'Tozabog\'', NULL, 'Тозабоғ', NULL, 'Тозабог', NULL),
(1735233558, 17, 35, 233, 558, 'Nurli yo\'l', NULL, 'Нурли йўл', NULL, 'Нурли-йул', NULL),
(1735233560, 17, 35, 233, 560, 'Amirobod', NULL, 'Амиробод', NULL, 'Амирабад', NULL),
(1735233800, 17, 35, 233, 800, 'To\'rtko\'l tumanining qishloq fuqarolar yig\'inlari', NULL, 'Тўрткўл туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Турткульского района', NULL),
(1735233804, 17, 35, 233, 804, 'Aqboshli', NULL, 'Ақбошли', NULL, 'Акбашлы', NULL),
(1735233806, 17, 35, 233, 806, 'Aqqamish', NULL, 'Аққамиш', NULL, 'Аккамыш', NULL),
(1735233808, 17, 35, 233, 808, 'Paxtaabad', NULL, 'Пахтаабад', NULL, 'Пахтаабад', NULL),
(1735233812, 17, 35, 233, 812, 'Ata uba', NULL, 'Ата уба', NULL, 'Атауба', NULL),
(1735233816, 17, 35, 233, 816, 'Kana Turtkul', NULL, 'Кана Турткул', NULL, 'Кана Турткул', NULL),
(1735233828, 17, 35, 233, 828, 'Yonboshqal\'a', NULL, 'Ёнбошқалъа', NULL, 'Джамбаскала', NULL),
(1735233830, 17, 35, 233, 830, 'A.Durdiyeva', NULL, 'А.Дурдиева', NULL, 'им. Дурдыева', NULL),
(1735233840, 17, 35, 233, 840, 'Kelteminar', NULL, 'Келтеминар', NULL, 'Кельтеминар', NULL),
(1735233842, 17, 35, 233, 842, 'Kukcha', NULL, 'Кукча', NULL, 'Кокча', NULL),
(1735233844, 17, 35, 233, 844, 'Qumbaskan', NULL, 'Қумбаскан', NULL, 'Кумбаскан', NULL),
(1735233878, 17, 35, 233, 878, 'O\'zbekiston', NULL, 'Ўзбекистон', NULL, 'Узбекистон', NULL),
(1735233880, 17, 35, 233, 880, 'Paxtachi', NULL, 'Пахтачи', NULL, 'Пахтачи', NULL),
(1735233881, 17, 35, 233, 881, 'Tazabogyap', NULL, 'Тазабогяп', NULL, 'Тазабагяб', NULL),
(1735233892, 17, 35, 233, 892, 'Ullubog\'', NULL, 'Уллубоғ', NULL, 'Уллубаг', NULL),
(1735233896, 17, 35, 233, 896, 'Shuraxan', NULL, 'Шурахан', NULL, 'Шурахан', NULL),
(1735236500, 17, 35, 236, 500, 'Xo\'jayli tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Хўжайли туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Ходжелийского района', NULL),
(1735236501, 17, 35, 236, 501, 'Xo\'jayli', NULL, 'Хўжайли', NULL, 'Ходжейли', NULL),
(1735236550, 17, 35, 236, 550, 'Xo\'jayli tumanining shaharchalari', NULL, 'Хўжайли туманининг  шаҳарчалари', NULL, 'Городские поселки, подч. Ходжелийскому горхок-ту', NULL),
(1735236553, 17, 35, 236, 553, 'Vodnik', NULL, 'Водник', NULL, 'Водник', NULL),
(1735236800, 17, 35, 236, 800, 'Xo\'jayli tumanining qishloq fuqarolar yig\'inlari', NULL, 'Хўжайли туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Ходжейлийского района', NULL),
(1735236811, 17, 35, 236, 811, 'Amudarya', NULL, 'Амударя', NULL, 'Амударья', NULL),
(1735236819, 17, 35, 236, 819, 'Janajap', NULL, 'Жанажап', NULL, 'Жанажап', NULL),
(1735236833, 17, 35, 236, 833, 'Kulyab', NULL, 'Куляб', NULL, 'Куляб', NULL),
(1735236839, 17, 35, 236, 839, 'Mustaqillik', NULL, 'Мустақиллик', NULL, 'Мустакиллик', NULL),
(1735236855, 17, 35, 236, 855, 'Samankol', NULL, 'Саманкол', NULL, 'Саманкуль', NULL),
(1735236877, 17, 35, 236, 877, 'Sarishunkul', NULL, 'Саришункул', NULL, 'Сарычункуль', NULL),
(1735236888, 17, 35, 236, 888, 'Qumjiqqin', NULL, 'Қумжиққин', NULL, 'Кумжиккин', NULL),
(1735240500, 17, 35, 240, 500, 'Chimboy tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Чимбой туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Чимбайского района', NULL),
(1735240501, 17, 35, 240, 501, 'Chimboy', NULL, 'Чимбой', NULL, 'Чимбай', NULL),
(1735240550, 17, 35, 240, 550, 'Chimboy tumanining shaharchalari', NULL, 'Чимбой туманининг шаҳарчалари', NULL, 'Городские поселки Чимбайского района', NULL),
(1735240553, 17, 35, 240, 553, 'Ayteke', NULL, 'Айтеке', NULL, 'Айтеке', NULL),
(1735240800, 17, 35, 240, 800, 'Chimboy tumanining qishloq fuqarolar yig\'inlari', NULL, 'Чимбой туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Чимбайского района', NULL),
(1735240802, 17, 35, 240, 802, 'Kizil uzek', NULL, 'Кизил узек', NULL, 'Кызыл Озек', NULL),
(1735240812, 17, 35, 240, 812, 'Kamisarik', NULL, 'Камисарик', NULL, 'Камыс арык', NULL),
(1735240822, 17, 35, 240, 822, 'Baxitli', NULL, 'Бахитли', NULL, 'Бахытлы', NULL),
(1735240833, 17, 35, 240, 833, 'Kenes', NULL, 'Кенес', NULL, 'Кенес', NULL),
(1735240844, 17, 35, 240, 844, 'Mayjap', NULL, 'Майжап', NULL, 'Майжап', NULL),
(1735240848, 17, 35, 240, 848, 'Pashen tov', NULL, 'Пашен тов', NULL, 'Пашент тау', NULL),
(1735240855, 17, 35, 240, 855, 'Tazgara', NULL, 'Тазгара', NULL, 'Тазгаpа', NULL),
(1735240862, 17, 35, 240, 862, 'Tagjap', NULL, 'Тагжап', NULL, 'Тагжап', NULL),
(1735240866, 17, 35, 240, 866, 'Tazajol', NULL, 'Тазажол', NULL, 'Тазажол', NULL),
(1735240870, 17, 35, 240, 870, 'Kosterek', NULL, 'Костерек', NULL, 'Костеpек', NULL),
(1735243500, 17, 35, 243, 500, 'Shumanay tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Шуманай туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Шуманайского района', NULL),
(1735243501, 17, 35, 243, 501, 'Shumanay', NULL, 'Шуманай', NULL, 'Шуманай', NULL),
(1735243800, 17, 35, 243, 800, 'Shumanay tumanining qishloq fuqarolar yig\'inlari', NULL, 'Шуманай туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Шуманайского района', NULL),
(1735243805, 17, 35, 243, 805, 'Birleshik', NULL, 'Бирлешик', NULL, 'Бирлешик', NULL),
(1735243809, 17, 35, 243, 809, 'Begjap', NULL, 'Бегжап', NULL, 'Бегжап', NULL),
(1735243812, 17, 35, 243, 812, 'Diyxanabad', NULL, 'Дийханабад', NULL, 'Дийханабад', NULL),
(1735243818, 17, 35, 243, 818, 'Mamiy', NULL, 'Мамий', NULL, 'Мамый', NULL),
(1735243821, 17, 35, 243, 821, 'Sarmanbaykol', NULL, 'Сарманбайкол', NULL, 'Сарманбайкол', NULL),
(1735243825, 17, 35, 243, 825, 'Ak jap', NULL, 'Ак жап', NULL, 'Акжап', NULL),
(1735243830, 17, 35, 243, 830, 'Ketenler', NULL, 'Кетенлер', NULL, 'Кетенлер', NULL),
(1735250500, 17, 35, 250, 500, 'Ellikkala tumanining tuman ahamiyatiga ega shaharlari', NULL, 'Элликкала туманининг туман аҳамиятига эга шаҳарлари', NULL, 'Города районного подчинения Элликкалинского района', NULL),
(1735250501, 17, 35, 250, 501, 'Bo\'ston', NULL, 'Бўстон', NULL, 'Бустан', NULL),
(1735250550, 17, 35, 250, 550, 'Ellikkala tumanining shaharchalari', NULL, 'Элликкала туманининг шаҳарчалари', NULL, 'Городские поселки Элликкалинского района', NULL),
(1735250555, 17, 35, 250, 555, 'Saxtiyon', NULL, 'Сахтиён', NULL, 'Сахтиен', NULL),
(1735250800, 17, 35, 250, 800, 'Ellikkala tumanining qishloq fuqarolar yig\'inlari', NULL, 'Элликкала туманининг қишлоқ фуқаролар йиғинлари', NULL, 'Сельские сходы граждан Элликкалинского района', NULL),
(1735250803, 17, 35, 250, 803, 'Aqchakul', NULL, 'Ақчакул', NULL, 'Акчакуль', NULL),
(1735250807, 17, 35, 250, 807, 'Gulistan', NULL, 'Гулистан', NULL, 'Гулистан', NULL),
(1735250808, 17, 35, 250, 808, 'Guldursun', NULL, 'Гулдурсун', NULL, 'Гульдирсин', NULL),
(1735250812, 17, 35, 250, 812, 'Taza bog\'', NULL, 'Таза боғ', NULL, 'Тазабог', NULL),
(1735250815, 17, 35, 250, 815, 'Sarabiy', NULL, 'Сарабий', NULL, 'Саpабий', NULL),
(1735250820, 17, 35, 250, 820, 'Qizil qum', NULL, 'Қизил қум', NULL, 'Кызылкум', NULL),
(1735250823, 17, 35, 250, 823, 'Qirqqiz', NULL, 'Қирққиз', NULL, 'Кырккыз', NULL),
(1735250827, 17, 35, 250, 827, 'Navoiy nomli', NULL, 'Навоий номли', NULL, 'им. Навои', NULL),
(1735250830, 17, 35, 250, 830, 'Qilchinok', NULL, 'Қилчинок', NULL, 'Килчинак', NULL),
(1735250835, 17, 35, 250, 835, 'Amirabad', NULL, 'Амирабад', NULL, 'Амирабад', NULL),
(1735250850, 17, 35, 250, 850, 'Sharq Yulduzi', NULL, 'Шарқ юлдузи', NULL, 'Шарк-Юлдузи', NULL),
(1735250855, 17, 35, 250, 855, 'Ellikkala', NULL, 'Элликкала', NULL, 'Элликкала', NULL),
(1735250860, 17, 35, 250, 860, 'Do\'stlik', NULL, 'Дўстлик', NULL, 'Дустлик', NULL),
(1735401550, 17, 35, 401, 550, 'Nukus shahar hokimiyatiga qarashli shaharchalar', NULL, 'Нукус шаҳар ҳокимиятига қарашли шаҳарчалар', NULL, 'Городские поселки, подч. Нукусскому горхокимияту', NULL),
(1735401554, 17, 35, 401, 554, 'Karatau', NULL, 'Каратау', NULL, 'Каратау', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `source_message`
--

CREATE TABLE `source_message` (
  `id` int(11) NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `source_message`
--

INSERT INTO `source_message` (`id`, `category`, `message`) VALUES
(1, 'food', 'Namunalar ro\'yhati'),
(2, 'food', 'ID'),
(3, 'food', 'Direktor'),
(4, 'food', 'Labaratoriya mudiri'),
(5, 'food', 'Bajaruvchi'),
(6, 'food', 'Muddat'),
(7, 'food', 'Izoh'),
(8, 'food', 'Holat'),
(9, 'food', 'Yaratildi'),
(10, 'food', 'O\'zgartirildi'),
(11, 'food', 'Namuna'),
(12, 'food', 'Ariza'),
(13, 'food', 'Status'),
(14, 'model.samples', 'ID'),
(15, 'model.samples', 'Kod'),
(16, 'model.samples', 'Namuna belgisi'),
(17, 'model.samples', 'Namuna turi'),
(18, 'model.samples', 'Namuna o\'rami'),
(19, 'model.samples', 'Hayvon'),
(20, 'model.samples', 'Dalolatnoma raqami'),
(21, 'model.samples', 'Gumonlangan kasallik'),
(22, 'model.samples', 'Tahlil usuli'),
(23, 'model.samples', 'Mas\'ul shaxs'),
(24, 'model.samples', 'Takroriy tahlil'),
(25, 'model.samples', 'Status'),
(26, 'lab', 'Holati:'),
(27, 'lab', 'Jinsi:'),
(28, 'lab', 'Tug\'ilgan sanasi:'),
(29, 'model', 'ID'),
(30, 'model', 'Raqami'),
(31, 'model', 'Code ID'),
(32, 'model', 'Xona tempraturasi'),
(33, 'model', 'Xona namligi'),
(34, 'model', 'Reaktiv nomi'),
(35, 'model', 'Reaktiv seriyasi'),
(36, 'model', 'Shartoit'),
(37, 'model', 'Test tugash vaqti'),
(38, 'model', 'Izoh'),
(39, 'model', 'Labarant'),
(40, 'model', 'Tasdiqladi'),
(41, 'model', 'Yaratildi'),
(42, 'model', 'O\'zgartirildi'),
(43, 'model', 'Holati'),
(44, 'lab', 'Parametr nomi'),
(45, 'lab', 'Birliki'),
(46, 'lab', 'Maksimal-minimal oraliq'),
(47, 'lab', 'Qiymat'),
(48, 'lab', 'Emlashga aloqadorligi'),
(49, 'model', 'Natija'),
(50, 'model', 'Turi'),
(51, 'model', 'Shablon'),
(52, 'lab', 'Natijani kiriting'),
(53, 'menu', 'Hayvon kasalliklari tashhisi'),
(54, 'menu', 'Oziq-ovqat havsizligi'),
(55, 'login', 'Tizimga kirish'),
(56, 'login', 'Hayvon kasalliklari tashhisi va oziq-ovqat xavfsizligiga oid laboratoriya tekshiruvlari Yagona elektron ma\'lumotlar bazasini yurishish tizimi (VIS-Sayyor)'),
(57, 'login', 'Boshqaruv tizimiga xush kelibsiz!'),
(58, 'login', 'Email'),
(59, 'login', 'Parol'),
(60, 'login', 'Kirish'),
(61, 'login', 'Axborot tizimini yaratish Yevropa Ittifoqi tomonidan moliyalashtirilgan'),
(62, 'cp', 'Tarjimalar'),
(63, 'cp.menu', 'Bosh sahifa'),
(64, 'cp.menu', 'Dalolatnomalar'),
(65, 'cp.menu', 'Ma\'lumotnoma'),
(66, 'cp.menu', 'Ichki'),
(67, 'cp.menu', 'Tashqi'),
(68, 'cp.menu', 'Shablonlar'),
(69, 'cp.menu', 'Kontragentlar'),
(70, 'cp.menu', 'Yuridik shaxslar'),
(71, 'cp.menu', 'Jismoniy shaxslar'),
(72, 'cp.menu', 'Sozlamalar'),
(73, 'cp.menu', 'Foydalanuvchilar'),
(74, 'cp.menu', 'Lavozimlar ro\'yhati'),
(75, 'cp.menu', 'Foydalanuvchilar huquqlari'),
(76, 'cp.menu', 'Tashkilotlar'),
(77, 'cp.menu', 'Tashkilot turlari'),
(78, 'cp', 'Tarjimalar'),
(79, 'cp.menu', 'Bosh sahifa'),
(80, 'cp.menu', 'Dalolatnomalar'),
(81, 'cp.menu', 'Ma\'lumotnoma'),
(82, 'cp.menu', 'Ichki'),
(83, 'cp.menu', 'Tashqi'),
(84, 'cp.menu', 'Shablonlar'),
(85, 'cp.menu', 'Kontragentlar'),
(86, 'cp.menu', 'Yuridik shaxslar'),
(87, 'cp.menu', 'Jismoniy shaxslar'),
(88, 'cp.menu', 'Sozlamalar'),
(89, 'cp.menu', 'Foydalanuvchilar'),
(90, 'cp.menu', 'Lavozimlar ro\'yhati'),
(91, 'cp.menu', 'Foydalanuvchilar huquqlari'),
(92, 'cp.menu', 'Tashkilotlar'),
(93, 'cp.menu', 'Tashkilot turlari'),
(94, 'register', 'Yuboruvchi'),
(95, 'model', 'JSHSHIR(PNFL)'),
(96, 'model', 'STIR(INN)'),
(97, 'model', 'Shoshilinch tekshiruv'),
(98, 'model', 'Tekshiruv turi'),
(99, 'model', 'Talablarning natijaga muvofiqligi'),
(100, 'model', 'Tekshiruvchi tashkilot'),
(101, 'model', 'Registrator'),
(102, 'model', 'Ro\'yhatga olingan sana'),
(103, 'model', 'Kasallik turi'),
(104, 'model', 'Namunalar'),
(105, 'model', 'Ariza yuboruvchi FIO'),
(106, 'model', 'Ariza yuboruvchi telefoni'),
(107, 'model', 'Namuna qabul qiluvchi'),
(108, 'model', 'Yuborilgan vaqti'),
(109, 'cp.sertificates', 'Arizalar ro\'yhati'),
(110, 'cp.sertificates', 'Namunalarni qabul qilish'),
(111, 'cp.sertificates', 'Arizalar'),
(112, 'register', 'Raqamli namunani qabul qilish'),
(113, 'test', 'Direktorni tanlang'),
(114, 'test', 'Labaratoriya mudirini tanlang'),
(115, 'cp.sertificates', 'Saqlash'),
(116, 'test', 'Namuna muvoffaqiyatli yuborildi'),
(117, 'reg', 'Muvvofaqiyatli'),
(118, 'leader', 'Labarantni tanlang'),
(119, 'leader', 'Topshiriq muvoffaqiyatli yuborildi'),
(120, 'lab', 'Natijalarni yuborish'),
(121, 'model', 'Nomi'),
(122, 'model', 'JSH SHIR(PINFL)'),
(123, 'model', 'Passport'),
(124, 'model', 'Kontragent turi'),
(125, 'login', 'Pasport seriya raqami'),
(126, 'cp.menu', 'Hayvon kasalliklari tashhilari'),
(127, 'cp.menu', 'Oziq-ovqat ekspertizalari'),
(128, 'client', 'Hayvon kasalliklari tashhisi bo\'yicha namuna olish dalolatnomalari'),
(129, 'client', 'Dalolatnoma qo\'shish'),
(130, 'model.sertificates', 'Dalolatnoma'),
(131, 'model.sertificates', 'Dalolatnoma raqami(Qog\'ozdagi yoki registondagi)'),
(132, 'model.sertificates', 'Sana'),
(133, 'model.sertificates', 'PNFL'),
(134, 'model.sertificates', 'Egasi'),
(135, 'model.sertificates', 'Hayvon egasi'),
(136, 'model.sertificates', 'Vet uchstka'),
(137, 'model.sertificates', 'Operator'),
(138, 'model.sertificates', 'INN(STIR)'),
(139, 'model.sertificates', 'Viloyat'),
(140, 'model.sertificates', 'Tuman'),
(141, 'model.sertificates', 'QFI'),
(142, 'model.sertificates', 'Lavozim'),
(143, 'model.sertificates', 'Namuna olgan shaxs'),
(144, 'reg', 'Jismoniy shaxs'),
(145, 'reg', 'Yuridik shaxs'),
(146, 'model.individuals', 'Ism'),
(147, 'model.individuals', 'Familya'),
(148, 'model.individuals', 'Otasining ismi'),
(149, 'model.individuals', 'QFY'),
(150, 'model.individuals', 'Manzil'),
(151, 'model.individuals', 'Pasport'),
(152, 'cp.individuals', 'Viloyatni tanlang'),
(153, 'cp.individuals', 'Tumanni tanlang'),
(154, 'cp.individuals', 'QFYni tanlang'),
(155, 'model.legal_entities', 'TSHX'),
(156, 'model.legal_entities', 'Soato'),
(157, 'test', 'Tashkiliy huquqiy shakli'),
(158, 'cp.vetsites', '- Tumanni tanlang -'),
(159, 'cp.vetsites', '- QFYni tanlang -'),
(160, 'cp.vetsites', '- Vet uchastkani tanlang -'),
(161, 'cp.sertificates', 'O\'zgartirish'),
(162, 'cp.sertificates', 'Arizani yuborish'),
(163, 'client', 'Umumiy {n} ta namuna. Shundan {m} tasiga ariza berilmagan'),
(164, 'client', 'Arizani kuzatish'),
(165, 'cp.sertificates', 'Hayvon qo\'shish'),
(166, 'model.animals', 'Hayvon toifasi'),
(167, 'model.animals', 'Jinsi'),
(168, 'model.animals', 'Tug\'ilgan kuni'),
(169, 'model.animals', 'Vet uchastka'),
(170, 'model.animals', 'Visual birka'),
(171, 'model.animals', 'Hayvon turi'),
(172, 'cp.animals', 'Hayvon turini tanlang'),
(173, 'cp.animals', 'Erkak'),
(174, 'cp.animals', 'Urg\'ochi'),
(175, 'client', 'Namuna muvoffaqiyatli saqlandi'),
(176, 'client', 'sonli dalolatnoma uchun ariza yozish'),
(177, 'client', 'Labaratoriyani tanlang'),
(178, 'register', 'Arzani qabul qilish'),
(179, 'lab', 'Natijalar muvoffaqiyatli saqlandi'),
(180, 'model', 'Boshqa sharoitlar'),
(181, 'lab', 'Natijalar muvoffaqiyatli yuborildi'),
(182, 'cp', 'Normativ hujjatlar'),
(183, 'cp', 'Shablon birliklari'),
(184, 'model.food_sampling_certificate', 'Name Uz'),
(185, 'model.food_sampling_certificate', 'Name Ru'),
(186, 'model.food_sampling_certificate', 'File'),
(187, 'model.food_sampling_certificate', 'Creator ID'),
(188, 'model.food_sampling_certificate', 'Created'),
(189, 'model.food_sampling_certificate', 'Updated'),
(190, 'cp', 'Shablon qo\'shish'),
(191, 'cp', 'Hayvon kasalliklari tashhisi shablonlari'),
(192, 'leader', 'Topshiriq rad etildi'),
(193, 'leader', 'Topshiriq tasdiqlandi'),
(194, 'leader', 'Topshiriq imzolandi'),
(195, 'model', 'Namuna raqami'),
(196, 'model', 'Namuna yo\'q qilingan sana'),
(197, 'model', 'Tasdiqlangan sana'),
(198, 'model', 'Tashkilot'),
(199, 'food', 'Namunani yo\'q qilish dalolatnomalari ro\'yhati'),
(200, 'client', 'Namuna raqamlari'),
(201, 'register', 'Labaratoriya'),
(202, 'cp.food_sampling_certificate', 'Mahsulot ekspertizasi uchun namuma olish dalolatnomalari '),
(203, 'cp', 'Export'),
(204, 'cp', 'Excel'),
(205, 'cp', 'Pdf'),
(206, 'client', 'Buyurtmachi'),
(207, 'client', 'Namuna oluvchi'),
(208, 'model.food_sampling_certificate', 'Food ID'),
(209, 'model.food_sampling_certificate', 'Namuna beruvchi vet uchaska'),
(210, 'model.food_sampling_certificate', 'Namuna olish manzil'),
(211, 'model.food_sampling_certificate', 'STIR(PNFL)'),
(212, 'model.food_sampling_certificate', 'Namunani tekshirtirishdan maqsad'),
(213, 'model.food_sampling_certificate', 'Namuna olish sanasi'),
(214, 'model.food_sampling_certificate', 'Namuna yuborilgan sana'),
(215, 'model.food_sampling_certificate', 'Xabar asosida tuzilgan'),
(216, 'model.food_sampling_certificate', 'Namunani yuborish sharoiti'),
(217, 'model.food_sampling_certificate', 'Xabar raqami'),
(218, 'client', 'Yo\'q'),
(219, 'client', 'Ha'),
(220, 'cp.animals', 'Hayvon Holatini tanlang'),
(221, 'cp.animals', 'Hayvon toifasini tanlang'),
(222, 'model.animals', 'Hayvon holati'),
(223, 'cp.animals', 'Hayvon holati tanlang'),
(224, 'lab', 'Namuna yo\'q qilingan'),
(225, 'lab', 'Namuna yo\'q qilinish jarayonida'),
(226, 'food', 'Destruction Sample Animals'),
(227, 'food', 'Update'),
(228, 'food', 'Delete'),
(229, 'food', 'Are you sure you want to delete this item?'),
(230, 'lab', 'Hayvon haqida ma\'lumot'),
(231, 'food', 'Namunani yo\'q qilish dalolatnomasi'),
(232, 'food', 'Namunani yo\'q qilish dalolatnomalarii'),
(233, 'lab', 'Rahbar tasdiqlashi kutilmoqda'),
(234, 'lab', 'Namuna yo\'q qilish dalolatnomasi tasdiqlash uchun rahbarga yuborildi'),
(235, 'lab', 'Tasdiqlash'),
(236, 'lab', 'Rad etish'),
(237, 'lab', 'Barchasi'),
(238, 'food', 'Kategoriyasi'),
(239, 'food', 'Results Conformity ID'),
(240, 'food', 'Arizachi FIO'),
(241, 'food', 'Arizachi telefon'),
(242, 'cp.menu', 'Xabarlar'),
(243, 'cp.menu', 'Hayvon kasalliklari'),
(244, 'cp.menu', 'Dori darmonlar'),
(245, 'cp.food_sampling_certificate', 'Mahsulot ekspertizalari'),
(246, 'cp.food_sampling_certificate', 'Food Sampling Certificates'),
(247, 'report', 'Hayvon holat'),
(248, 'report', 'Lat'),
(249, 'report', 'Long'),
(250, 'report', 'Batafsil'),
(251, 'report', 'Telefon raqami'),
(252, 'report', 'Tasdiqdan o\'tgan'),
(253, 'report', 'Code'),
(254, 'report', 'Rep ID'),
(255, 'report', 'Til'),
(256, 'report', 'Bajaruvchi Labaratoriya'),
(257, 'komitet', 'Tekshirilmagan'),
(258, 'register', 'Qabul qilish'),
(259, 'cp.sertificates', 'Arizalar ro\'yhati'),
(260, 'register', 'Yuboruvchi'),
(261, 'food', 'STIR(INN)'),
(262, 'food', 'JSHSHIR(PNFL)'),
(263, 'food', 'Tashkilot'),
(264, 'food', 'Shoshilinch tekshiruv'),
(265, 'food', 'Raqami'),
(266, 'food', 'Kategoriyasi'),
(267, 'food', 'Results Conformity ID'),
(268, 'food', 'Operator'),
(269, 'food', 'Sana'),
(270, 'food', 'Arizachi FIO'),
(271, 'food', 'Arizachi telefon'),
(272, 'food', 'Updated'),
(273, 'food', 'Namunalar'),
(274, 'cp.sertificates', 'Dalolatnomalar'),
(275, 'model', 'JSHSHIR(PNFL)'),
(276, 'model', 'STIR(INN)'),
(277, 'model', 'Shoshilinch tekshiruv'),
(278, 'model', 'Kod'),
(279, 'model', 'Tekshiruv turi'),
(280, 'model', 'Talablarning natijaga muvofiqligi'),
(281, 'model', 'Tekshiruvchi tashkilot'),
(282, 'model', 'Registrator'),
(283, 'model', 'Ro\'yhatga olingan sana'),
(284, 'model', 'Kasallik turi'),
(285, 'model', 'Namunalar'),
(286, 'model', 'Ariza yuboruvchi FIO'),
(287, 'model', 'Ariza yuboruvchi telefoni'),
(288, 'model', 'Namuna qabul qiluvchi'),
(289, 'model', 'Yuborilgan vaqti'),
(290, 'client', 'Namuna raqamlari'),
(291, 'register', 'Labaratoriya'),
(292, 'cp.sertificates', 'Dalolatnomalar'),
(293, 'model', 'JSHSHIR(PNFL)'),
(294, 'model', 'STIR(INN)'),
(295, 'model', 'Shoshilinch tekshiruv'),
(296, 'model', 'Kod'),
(297, 'model', 'Tekshiruv turi'),
(298, 'model', 'Talablarning natijaga muvofiqligi'),
(299, 'model', 'Tekshiruvchi tashkilot'),
(300, 'model', 'Registrator'),
(301, 'model', 'Ro\'yhatga olingan sana'),
(302, 'model', 'Kasallik turi'),
(303, 'model', 'Namunalar'),
(304, 'model', 'Ariza yuboruvchi FIO'),
(305, 'model', 'Ariza yuboruvchi telefoni'),
(306, 'model', 'Namuna qabul qiluvchi'),
(307, 'model', 'Yuborilgan vaqti'),
(308, 'client', 'Namuna raqamlari'),
(309, 'register', 'Labaratoriya'),
(310, 'client', 'Namuna raqamlari'),
(311, 'cp.food_sampling_certificate', 'Dalolatnomalar ro\'yhati'),
(312, 'client', 'Oziq-ovqat ekspertizasi uchun ariza'),
(313, 'cp.vetsites', 'Vet uchstkani tanlang'),
(314, 'cp.individuals', 'Tekshirishdan maqsadni tanlang'),
(315, 'food', 'Namuna qo\'shish'),
(316, 'client', 'Mahsulotni tanlang'),
(317, 'food', 'Namuna nomi'),
(318, 'food', 'Birlik'),
(319, 'food', 'Soni'),
(320, 'food', 'Namuna holati'),
(321, 'food', 'Toplam(partiya) miqdori'),
(322, 'food', 'Nazorat namunasi'),
(323, 'food', 'Ishlab chiqaruvchi'),
(324, 'food', 'Seriya raqami'),
(325, 'food', 'Ishlab chiqarilgan sana'),
(326, 'food', 'Muddati'),
(327, 'food', 'Qo\'shimcha ma\'lumot'),
(328, 'food', 'Laboratoriya test turi'),
(329, 'client', 'Mahsulot birligini tanlang'),
(330, 'client', 'Namuna o\'ramini tanlang'),
(331, 'client', 'Namuna holatini tanlang'),
(332, 'client', 'Tanlanmagan'),
(333, 'client', 'Tanlangan'),
(334, 'client', 'Laboratoriya test turini tanlang'),
(335, 'cp', 'Oziq-ovqat tashhisi'),
(336, 'food', 'Sample ID'),
(337, 'food', 'Registration ID'),
(338, 'food', 'Status ID'),
(339, 'food', 'Ads'),
(340, 'model', 'Labaratoriya mudir'),
(341, 'model', 'Ariza raqami'),
(342, 'test', 'Namuna {number} raqami bilan saqlandi'),
(343, 'food', 'Ro\'yhatga oluvchi'),
(344, 'model', 'Require ID'),
(345, 'model', 'Consept ID'),
(346, 'model', 'State ID'),
(347, 'model', 'Org ID'),
(348, 'model', 'Talabga muvofiqligi'),
(349, 'model', 'Kirituvchi'),
(350, 'model', 'Tasdiqlovchi'),
(351, 'model', 'Yaratilgan'),
(352, 'model', 'O\'zgartirilgan'),
(353, 'model', 'Natija(oraliq)'),
(354, 'model', 'Tekshirilgan'),
(355, 'lab', 'Minimal-maksimal oraliq'),
(356, 'lab', 'Talabga muvoffiqligini tanlang'),
(357, 'lab', 'Namuna muvoffaqiyatli tasdiqlandi'),
(358, 'lab', 'Natija muvoffaqiyatli rad qilindi.'),
(359, 'lab', 'Natija muvoffaqiyatli tasdiqlandi. Natija rahbar tasdiqlashi uchun yuborildi.'),
(360, 'lab', 'Topshiriq imzolandi. Namunani yo\'q qilish uchun {code} raqamli dalolatnoma labarantga yuborildi'),
(361, 'model', 'Destruction Date'),
(362, 'model', 'Consent ID'),
(363, 'model', 'Approved Date'),
(364, 'model', 'Yuborilgan sana'),
(365, 'lab', 'Namuna ma\'lumotlari'),
(366, 'cp', 'Hayvonlar'),
(367, 'cp', 'Hayvon toifalari'),
(368, 'cp', 'Hayvon turlari'),
(369, 'cp', 'Kasalliklar ruyhati'),
(370, 'cp', 'Kasalliklar guruhi'),
(371, 'cp', 'Kasalliklar toifasi'),
(372, 'cp', 'Vaksinalar'),
(373, 'cp', 'Namuna turlari'),
(374, 'cp', 'Namuna o\'ramlari'),
(375, 'cp', 'Tahlil usullari'),
(376, 'cp', 'Birliklar'),
(377, 'cp', 'Tekshirish maqsadlari'),
(378, 'cp', 'Laboratoriya tadqiqot turlari'),
(379, 'cp', 'Mahsulotlar turlari'),
(380, 'cp', 'Dori turlari haqida hisobot'),
(381, 'cp', 'Oziq-ovqat toifalari haqida '),
(382, 'client', 'Pasport ma\'lumotlari topilmadi'),
(383, 'reg', 'Xatolik'),
(384, 'cp', 'Oziq-ovqat ekspertizasi talablari'),
(385, 'model.food_sampling_certificate', 'Nomi(UZ)'),
(386, 'model.food_sampling_certificate', 'Nomi(RU)'),
(387, 'model.food_sampling_certificate', 'Fayl'),
(388, 'model.food_sampling_certificate', 'Kiritildi'),
(389, 'cp', 'Tasdiqlovchini tanlang'),
(390, 'client', '{kod} raqamli namuna muvoffaqiyatli saqlandi'),
(391, 'cp.animals', 'Emlash: {name}'),
(392, 'cp.animals', 'Emlash'),
(393, 'cp.animals', 'Kasallikni talang'),
(394, 'model.roles', 'Animal ID'),
(395, 'model.roles', 'Vaccina ID'),
(396, 'model.roles', 'Disease ID'),
(397, 'model.roles', 'Disease Date'),
(398, 'cp.animals', 'Davolash: {name}'),
(399, 'cp.animals', 'Davolash'),
(400, 'model.emlash', 'Antibiotik'),
(401, 'leader', 'Namuna tekshiruv natijasi imzolandi. Namunani yo\'q qilish uchun topshiriq yuborildi.'),
(402, 'client', 'Davlatni tanlang'),
(403, 'client', '{code} raqamli ariza muvoffaqiyatli yuborildi'),
(404, 'lab', 'Vaksinalashlar tarixi'),
(405, 'lab', 'Davolashlar tarixi'),
(406, 'food', 'Davlat'),
(407, 'login', 'Tizimga kirish'),
(408, 'login', 'Hayvon kasalliklari tashhisi va oziq-ovqat xavfsizligiga oid laboratoriya tekshiruvlari Yagona elektron ma\'lumotlar bazasini yurishish tizimi (VIS-Sayyor)'),
(409, 'login', 'Boshqaruv tizimiga xush kelibsiz!'),
(410, 'login', 'Email'),
(411, 'login', 'Parol'),
(412, 'login', 'Kirish'),
(413, 'login', 'Axborot tizimini yaratish Yevropa Ittifoqi tomonidan moliyalashtirilgan'),
(414, 'login', 'Tizimga kirish'),
(415, 'login', 'Hayvon kasalliklari tashhisi va oziq-ovqat xavfsizligiga oid laboratoriya tekshiruvlari Yagona elektron ma\'lumotlar bazasini yurishish tizimi (VIS-Sayyor)'),
(416, 'login', 'Boshqaruv tizimiga xush kelibsiz!'),
(417, 'login', 'Email'),
(418, 'login', 'Parol'),
(419, 'login', 'Kirish'),
(420, 'login', 'Axborot tizimini yaratish Yevropa Ittifoqi tomonidan moliyalashtirilgan'),
(421, 'food', 'Hayvon kasalliklari namunalar ro\'yhati'),
(422, 'food', 'Hayvon kasalliklari namunalar ro\'yhati'),
(423, 'food', 'Hayvon kasalliklari namunalar ro\'yhati'),
(424, 'food', 'Oziq-ovqat havfsizligi namunalar ro\'yhati'),
(425, 'food', 'Oziq-ovqat havfsizligi namunalar ro\'yhati'),
(426, 'model', 'Direktor'),
(427, 'model', 'Labaratoriya mudir'),
(428, 'model', 'Bajaruvchi'),
(429, 'model', 'Muddat'),
(430, 'model', 'Holat'),
(431, 'model', 'Namuna raqami'),
(432, 'model', 'Ariza raqami'),
(433, 'food', 'Hayvon kasalliklari amunalar ro\'yhati'),
(434, 'food', 'Oziq ovqat havsizligi namunalar ro\'yhati'),
(435, 'food', 'Oziq ovqat havfsizligi namunalar ro\'yhati'),
(436, 'client', 'Login yoki parol xato'),
(437, 'cp.legal_entities', 'Yuridik shaxs qo\'shish'),
(438, 'model', 'Nomi'),
(439, 'model', 'JSH SHIR(PINFL)'),
(440, 'model', 'Passport'),
(441, 'model', 'Kontragent turi'),
(442, 'login', 'Pasport seriya raqami'),
(443, 'login', 'JSH SHIR(PINFL)'),
(444, 'login', 'ERI kalit yordamida kirish'),
(445, 'login', 'Login parol yordamida kirish'),
(446, 'model.food_sampling_certificate', 'Vet uchaska'),
(447, 'cp.animal', 'Hayvon kategoriyalari'),
(448, 'cp.animal', 'Hayvon kategoriyasini yaratish'),
(449, 'model.animal', 'Nomi(O\'zbek)'),
(450, 'model.animal', 'Nomi(Rus)'),
(451, 'cp.animaltype', 'Hayvon turi qo\'shish'),
(452, 'model.animaltype', 'Vet4'),
(453, 'cp.animaltype', 'Hayvon turilari'),
(454, 'cp.animaltype', 'O\'chirish'),
(455, 'cp.animaltype', 'O\'zgartirish: {name}'),
(456, 'cp', 'Biologik, potologik va boshqa materiallardan namuna olish'),
(457, 'cp', 'Mahsulot ekspertizasi'),
(458, 'cp.diseases', 'Kasalliklar ro`yhati'),
(459, 'model.diseases', 'Toifasi'),
(460, 'cp.diseases', 'Kasallik qo\'shish'),
(461, 'cp.diseases', 'Kasalliklar'),
(462, 'cp.sample_types', 'Namuna turi qo\'shish'),
(463, 'lab', 'Yangi arizalar'),
(464, 'menu', 'Oziq-ovqat havfsizligi'),
(465, 'lab', 'Namunani yo\'q qilish'),
(466, 'test', 'Namuna turini tanlang'),
(467, 'lab', 'Bosh sahifa'),
(468, 'lab', 'Yangi arizalar'),
(469, 'menu', 'Oziq-ovqat havfsizligi'),
(470, 'lab', 'Namunani yo\'q qilish'),
(471, 'register', 'Arzani qabul qilish'),
(472, 'cp.sertificates', 'Namunalarni qabul qilish'),
(473, 'cp.sertificates', 'Arizalar'),
(474, 'register', 'Raqamli namunani qabul qilish'),
(475, 'test', 'Direktorni tanlang'),
(476, 'test', 'Labaratoriya mudirini tanlang'),
(477, 'cp.sertificates', 'Saqlash'),
(478, 'test', 'Namuna turini tanlang'),
(479, 'test', 'Namuna muvoffaqiyatli yuborildi'),
(480, 'reg', 'Muvvofaqiyatli'),
(481, 'cp.sample_types', 'O\'zgartirish: {name}'),
(482, 'cp.sample_types', 'Namuna turlari'),
(483, 'cp.sample_types', 'O\'zgartirish'),
(484, 'model.sample_types', 'ID'),
(485, 'model.sample_types', 'Nomi(O\'zbek)'),
(486, 'model.sample_types', 'Nomi(Rus)'),
(487, 'model.sample_types', 'Vet4'),
(488, 'cp.sample_types', 'Saqlash'),
(489, 'cp.sample_types', 'O\'chirish'),
(490, 'cp.sample_types', 'Are you sure you want to delete this item?'),
(491, 'cp.sample_types', 'Namuna turi qo\'shish'),
(492, 'cp', 'Hayvonlar'),
(493, 'cp', 'Hayvon toifalari'),
(494, 'cp', 'Hayvon turlari'),
(495, 'cp', 'Kasalliklar ruyhati'),
(496, 'cp', 'Kasalliklar guruhi'),
(497, 'cp', 'Kasalliklar toifasi'),
(498, 'cp', 'Vaksinalar'),
(499, 'cp', 'Namunalar'),
(500, 'cp', 'Namuna turlari'),
(501, 'cp', 'Namuna o\'ramlari'),
(502, 'cp', 'Tahlil usullari'),
(503, 'cp', 'Birliklar'),
(504, 'cp', 'Tekshirish maqsadlari'),
(505, 'cp', 'Namuna holati'),
(506, 'cp', 'Laboratoriya tadqiqot turlari'),
(507, 'cp', 'Mahsulotlar turlari'),
(508, 'cp', 'Dori turlari haqida hisobot'),
(509, 'cp', 'Oziq-ovqat toifalari haqida '),
(510, 'cp.animaltype', 'Hayvon turlari'),
(511, 'cp.animaltype', 'Hayvon turi qo\'shish'),
(512, 'model.animaltype', 'ID'),
(513, 'model.animaltype', 'Nomi(O\'zbek)'),
(514, 'model.animaltype', 'Nomi(Rus)'),
(515, 'model.animaltype', 'Kod'),
(516, 'model.animaltype', 'Vet4'),
(517, 'cp.animaltype', 'O\'zgartirish: {name}'),
(518, 'cp.animaltype', 'Hayvon turlari'),
(519, 'cp.animaltype', 'O\'zgartirish'),
(520, 'model.animaltype', 'ID'),
(521, 'model.animaltype', 'Nomi(O\'zbek)'),
(522, 'model.animaltype', 'Nomi(Rus)'),
(523, 'model.animaltype', 'Kod'),
(524, 'model.animaltype', 'Vet4'),
(525, 'cp.animaltype', 'Saqlash'),
(526, 'cp.animaltype', 'O\'chirish'),
(527, 'cp.animaltype', 'Are you sure you want to delete this item?'),
(528, 'cp.animaltype', 'Hayvon turilari'),
(529, 'cp.animaltype', 'Hayvon turilari'),
(530, 'cp.diseases', 'Kasalliklar ro`yhati'),
(531, 'model.diseases', 'ID'),
(532, 'model.diseases', 'Nomi(O\'zbek)'),
(533, 'model.diseases', 'Nomi(Rus)'),
(534, 'model.diseases', 'Toifasi'),
(535, 'model.diseases', 'Turi'),
(536, 'model.diseases', 'Vet4'),
(537, 'cp.diseases', 'O\'zgartirish: {name}'),
(538, 'cp.diseases', 'Kasalliklar'),
(539, 'cp.diseases', 'O\'zgartirish'),
(540, 'model.diseases', 'ID'),
(541, 'model.diseases', 'Nomi(O\'zbek)'),
(542, 'model.diseases', 'Nomi(Rus)'),
(543, 'model.diseases', 'Toifasi'),
(544, 'model.diseases', 'Turi'),
(545, 'model.diseases', 'Vet4'),
(546, 'cp.diseases', 'Saqlash'),
(547, 'cp.diseases', 'O\'chirish'),
(548, 'cp.diseases', 'Are you sure you want to delete this item?'),
(549, 'client', 'Bosh sahifa'),
(550, 'login', 'ERI kalit yordamida kirish'),
(551, 'login', 'Login parol yordamida kirish'),
(552, 'cp.menu', 'Hayvon kasalliklari tashhilari'),
(553, 'cp.menu', 'Oziq-ovqat ekspertizalari'),
(554, 'cp.menu', 'Arizalar'),
(555, 'cp.menu', 'Hayvon kasalliklari tashhilari'),
(556, 'cp.menu', 'Oziq-ovqat ekspertizalari'),
(557, 'cp.menu', 'Arizalar'),
(558, 'client', 'Hayvon kasalliklari tashhisi bo\'yicha namuna olish dalolatnomalari'),
(559, 'client', 'Dalolatnoma qo\'shish'),
(560, 'model.sertificates', 'Dalolatnoma'),
(561, 'model.sertificates', 'Dalolatnoma raqami(Qog\'ozdagi yoki registondagi)'),
(562, 'model.sertificates', 'Sana'),
(563, 'model.sertificates', 'PNFL'),
(564, 'model.sertificates', 'Egasi'),
(565, 'model.sertificates', 'Hayvon egasi'),
(566, 'model.sertificates', 'Vet uchstka'),
(567, 'model.sertificates', 'Operator'),
(568, 'model.sertificates', 'INN(STIR)'),
(569, 'model.sertificates', 'Viloyat'),
(570, 'model.sertificates', 'Tuman'),
(571, 'model.sertificates', 'QFI'),
(572, 'model.sertificates', 'Status'),
(573, 'model.sertificates', 'Lavozim'),
(574, 'model.sertificates', 'Namuna olgan shaxs'),
(575, 'cp.menu', 'Hayvon kasalliklari tashhilari'),
(576, 'cp.menu', 'Oziq-ovqat ekspertizalari'),
(577, 'cp.menu', 'Arizalar'),
(578, 'cp.menu', 'Hayvon kasalliklari tashhilari'),
(579, 'cp.menu', 'Oziq-ovqat ekspertizalari'),
(580, 'cp.menu', 'Arizalar'),
(581, 'model.sertificates', 'Dalolatnoma'),
(582, 'model.sertificates', 'Dalolatnoma raqami(Qog\'ozdagi yoki registondagi)'),
(583, 'model.sertificates', 'Sana'),
(584, 'model.sertificates', 'PNFL'),
(585, 'model.sertificates', 'Egasi'),
(586, 'model.sertificates', 'Hayvon egasi'),
(587, 'model.sertificates', 'Vet uchstka'),
(588, 'model.sertificates', 'Operator'),
(589, 'model.sertificates', 'INN(STIR)'),
(590, 'model.sertificates', 'Viloyat'),
(591, 'model.sertificates', 'Tuman'),
(592, 'model.sertificates', 'QFI'),
(593, 'model.sertificates', 'Status'),
(594, 'model.sertificates', 'Lavozim'),
(595, 'model.sertificates', 'Namuna olgan shaxs'),
(596, 'reg', 'Jismoniy shaxs'),
(597, 'reg', 'Yuridik shaxs'),
(598, 'model.individuals', 'PNFL'),
(599, 'model.individuals', 'Ism'),
(600, 'model.individuals', 'Familya'),
(601, 'model.individuals', 'Otasining ismi'),
(602, 'model.individuals', 'QFY'),
(603, 'model.individuals', 'Manzil'),
(604, 'model.individuals', 'Pasport'),
(605, 'model.individuals', 'Viloyat'),
(606, 'model.individuals', 'Tuman'),
(607, 'cp.individuals', 'Viloyatni tanlang'),
(608, 'cp.individuals', 'Tumanni tanlang'),
(609, 'cp.individuals', 'QFYni tanlang'),
(610, 'model.legal_entities', 'STIR(INN)'),
(611, 'model.legal_entities', 'Nomi'),
(612, 'model.legal_entities', 'TSHX'),
(613, 'model.legal_entities', 'Manzil'),
(614, 'model.legal_entities', 'Soato'),
(615, 'model.legal_entities', 'Viloyat'),
(616, 'model.legal_entities', 'Tuman'),
(617, 'model.legal_entities', 'Status'),
(618, 'test', 'Tashkiliy huquqiy shakli'),
(619, 'client', 'Viloyatni tanlang'),
(620, 'cp.menu', 'Hayvon kasalliklari tashhilari'),
(621, 'cp.menu', 'Oziq-ovqat ekspertizalari'),
(622, 'cp.menu', 'Arizalar'),
(623, 'cp.menu', 'Hayvon kasalliklari tashhilari'),
(624, 'cp.menu', 'Oziq-ovqat ekspertizalari'),
(625, 'cp.menu', 'Arizalar'),
(626, 'client', 'Hayvon kasalliklari tashhisi bo\'yicha namuna olish dalolatnomalari'),
(627, 'client', 'Dalolatnoma qo\'shish'),
(628, 'model.sertificates', 'Dalolatnoma'),
(629, 'model.sertificates', 'Dalolatnoma raqami(Qog\'ozdagi yoki registondagi)'),
(630, 'model.sertificates', 'Sana'),
(631, 'model.sertificates', 'PNFL'),
(632, 'model.sertificates', 'Egasi'),
(633, 'model.sertificates', 'Hayvon egasi'),
(634, 'model.sertificates', 'Vet uchstka'),
(635, 'model.sertificates', 'Operator'),
(636, 'model.sertificates', 'INN(STIR)'),
(637, 'model.sertificates', 'Viloyat'),
(638, 'model.sertificates', 'Tuman'),
(639, 'model.sertificates', 'QFI'),
(640, 'model.sertificates', 'Status'),
(641, 'model.sertificates', 'Lavozim'),
(642, 'model.sertificates', 'Namuna olgan shaxs'),
(643, 'cp.menu', 'Hayvon kasalliklari tashhilari'),
(644, 'cp.menu', 'Oziq-ovqat ekspertizalari'),
(645, 'cp.menu', 'Arizalar'),
(646, 'cp.menu', 'Hayvon kasalliklari tashhilari'),
(647, 'cp.menu', 'Oziq-ovqat ekspertizalari'),
(648, 'cp.menu', 'Arizalar'),
(649, 'cp.sertificates', 'O\'zgartirish'),
(650, 'cp.sertificates', 'Arizani yuborish'),
(651, 'client', 'Umumiy {n} ta namuna. Shundan {m} tasiga ariza berilmagan'),
(652, 'model.sertificates', 'Dalolatnoma'),
(653, 'model.sertificates', 'Dalolatnoma raqami(Qog\'ozdagi yoki registondagi)'),
(654, 'model.sertificates', 'Sana'),
(655, 'model.sertificates', 'PNFL'),
(656, 'model.sertificates', 'Egasi'),
(657, 'model.sertificates', 'Hayvon egasi'),
(658, 'model.sertificates', 'Vet uchstka'),
(659, 'model.sertificates', 'Operator'),
(660, 'model.sertificates', 'INN(STIR)'),
(661, 'model.sertificates', 'Viloyat'),
(662, 'model.sertificates', 'Tuman'),
(663, 'model.sertificates', 'QFI'),
(664, 'model.sertificates', 'Status'),
(665, 'model.sertificates', 'Lavozim'),
(666, 'model.sertificates', 'Namuna olgan shaxs'),
(667, 'client', 'sonli dalolatnoma uchun ariza yozish'),
(668, 'client', 'Tekshiruv turi'),
(669, 'client', 'Labaratoriyani tanlang'),
(670, 'cp.food_sampling_certificate', 'Mahsulot ekspertizasi uchun namuma olish dalolatnomalari '),
(671, 'client', 'Buyurtmachi'),
(672, 'client', 'Namuna oluvchi'),
(673, 'model.food_sampling_certificate', 'ID'),
(674, 'model.food_sampling_certificate', 'Raqami'),
(675, 'model.food_sampling_certificate', 'Food ID'),
(676, 'model.food_sampling_certificate', 'STIR(INN)'),
(677, 'model.food_sampling_certificate', 'JSHSHIR(PNFL)'),
(678, 'model.food_sampling_certificate', 'Vet uchaska'),
(679, 'model.food_sampling_certificate', 'Tuman'),
(680, 'model.food_sampling_certificate', 'Namuna olish manzil'),
(681, 'model.food_sampling_certificate', 'STIR(PNFL)'),
(682, 'model.food_sampling_certificate', 'Namunani tekshirtirishdan maqsad'),
(683, 'model.food_sampling_certificate', 'Namuna olish sanasi'),
(684, 'model.food_sampling_certificate', 'Namuna yuborilgan sana'),
(685, 'model.food_sampling_certificate', 'Xabar asosida tuzilgan'),
(686, 'model.food_sampling_certificate', 'Namunani yuborish sharoiti'),
(687, 'model.food_sampling_certificate', 'Xabar raqami'),
(688, 'model.food_sampling_certificate', 'Yaratildi'),
(689, 'model.food_sampling_certificate', 'O\'zgartirildi'),
(690, 'model.food_sampling_certificate', 'Status'),
(691, 'client', 'Yo\'q'),
(692, 'client', 'Ha'),
(693, 'cp', 'Bosh sahifa'),
(694, 'cp', 'Normativ hujjatlar'),
(695, 'cp', 'Shablon birliklari'),
(696, 'cp', 'Hayvon kasalliklari tashhisi'),
(697, 'cp', 'Oziq-ovqat tashhisi'),
(698, 'cp', 'Oziq-ovqat ekspertizasi talablari'),
(699, 'cp', 'Normativ hujjatlar'),
(700, 'cp', 'Tasdiqlovchini tanlang'),
(701, 'lab', 'Namuna turini tanlang'),
(702, 'food', '4vet'),
(703, 'food', 'Namuna turi'),
(704, 'leader', 'Normativ hujjatlar'),
(705, 'leader', 'Labarantni tanlang'),
(706, 'lab', 'Vaksinalashlar tarixi'),
(707, 'lab', 'Davolashlar tarixi'),
(708, 'leader', 'Topshiriq muvoffaqiyatli yuborildi'),
(709, 'leader', 'Normativ hujjatlar'),
(710, 'model', 'Boshqa sharoitlar'),
(711, 'model', 'Umumlashgan natija'),
(712, 'model', 'Tashkilot'),
(713, 'lab', 'Birlik'),
(714, 'lab', 'Minimal-maksimal oraliq'),
(715, 'lab', 'Natijalarni yuborish'),
(716, 'lab', 'Natijani tanlang'),
(717, 'lab', 'Kun'),
(718, 'lab', 'Doimiy'),
(719, 'lab', 'Saqlash'),
(720, 'lab', 'Natijalarni yuborish'),
(721, 'lab', 'Saqlash'),
(722, 'lab', 'Natijalar muvoffaqiyatli saqlandi'),
(723, 'lab', 'Natijalar muvoffaqiyatli yuborildi'),
(724, 'leader', 'Topshiriq tasdiqlandi'),
(725, 'leader', 'Namuna tekshiruv natijasi imzolandi. Namunani yo\'q qilish uchun topshiriq yuborildi.'),
(726, 'food', 'raqami'),
(727, 'food', 'Dalolatnoma'),
(728, 'food', 'Namuna nomi'),
(729, 'food', 'Birlik'),
(730, 'food', 'Soni'),
(731, 'food', 'Namuna o\'rami'),
(732, 'food', 'Namuna holati'),
(733, 'food', 'Toplam(partiya) miqdori'),
(734, 'food', 'Nazorat namunasi'),
(735, 'food', 'Ishlab chiqaruvchi'),
(736, 'food', 'Seriya raqami'),
(737, 'food', 'Ishlab chiqarilgan sana'),
(738, 'food', 'Muddati'),
(739, 'food', 'Qo\'shimcha ma\'lumot'),
(740, 'food', 'Laboratoriya test turi'),
(741, 'food', 'Ro\'yhatga oluvchi'),
(742, 'food', 'Davlat'),
(743, 'model', 'Namuna'),
(744, 'model', 'Talabga muvofiqligi'),
(745, 'model', 'Kirituvchi'),
(746, 'model', 'Tasdiqlovchi'),
(747, 'model', 'Yaratilgan'),
(748, 'model', 'O\'zgartirilgan'),
(749, 'food', 'raqami'),
(750, 'food', 'Dalolatnoma'),
(751, 'food', 'Namuna nomi'),
(752, 'food', 'Birlik'),
(753, 'food', 'Soni'),
(754, 'food', 'Namuna o\'rami'),
(755, 'food', 'Namuna holati'),
(756, 'food', 'Toplam(partiya) miqdori'),
(757, 'food', 'Nazorat namunasi'),
(758, 'food', 'Ishlab chiqaruvchi'),
(759, 'food', 'Seriya raqami'),
(760, 'food', 'Ishlab chiqarilgan sana'),
(761, 'food', 'Muddati'),
(762, 'food', 'Qo\'shimcha ma\'lumot'),
(763, 'food', 'Laboratoriya test turi'),
(764, 'food', 'Ro\'yhatga oluvchi'),
(765, 'food', 'Davlat'),
(766, 'model', 'Namuna'),
(767, 'model', 'Talabga muvofiqligi'),
(768, 'model', 'Kirituvchi'),
(769, 'model', 'Tasdiqlovchi'),
(770, 'model', 'Yaratilgan'),
(771, 'model', 'O\'zgartirilgan'),
(772, 'lab', 'Topshiriq imzolandi. Namunani yo\'q qilish uchun {code} raqamli dalolatnoma labarantga yuborildi'),
(773, 'register', 'Qabul qilish'),
(774, 'food', 'Namuna raqami'),
(775, 'food', 'Ariza raqami'),
(776, 'food', 'Namunani yo\'q qilish dalolatnomalari ro\'yhati'),
(777, 'model', 'Namuna yo\'q qilingan sana'),
(778, 'model', 'Yuborilgan sana'),
(779, 'lab', 'Namuna yo\'q qilingan'),
(780, 'lab', 'Rahbar tasdiqlashi kutilmoqda'),
(781, 'lab', 'Namuna yo\'q qilinish jarayonida'),
(782, 'food', 'Namunani yo\'q qilish dalolatnomalari ro\'yhati'),
(783, 'lab', 'Barchasi'),
(784, 'lab', 'Namuna yo\'q qilingan'),
(785, 'lab', 'Rahbar tasdiqlashi kutilmoqda'),
(786, 'lab', 'Namuna yo\'q qilinish jarayonida'),
(787, 'model', 'Namuna yo\'q qilingan sana'),
(788, 'model', 'yaratildi'),
(789, 'model', 'Tasdiqlangan sana'),
(790, 'food', 'Namunani yo\'q qilish dalolatnomalarii'),
(791, 'lab', 'Namuna ma\'lumotlari'),
(792, 'model', 'Namuna nomi'),
(793, 'model', 'Soni'),
(794, 'food', 'Namunani yo\'q qilish dalolatnomalarii'),
(795, 'lab', 'Namuna ma\'lumotlari'),
(796, 'model', 'Namuna nomi'),
(797, 'model', 'Soni'),
(798, 'lab', 'Tasdiqlash'),
(799, 'lab', 'Rad etish'),
(800, 'lab', 'Tasdiqlash'),
(801, 'lab', 'Rad etish'),
(802, 'cp.sertificates', 'Dalolatnoma qo\'shish'),
(803, 'cp.sertificates', 'Hayvon qo\'shish'),
(804, 'model.animals', 'ID'),
(805, 'model.animals', 'Egasi'),
(806, 'model.animals', 'Hayvon holati'),
(807, 'model.animals', 'Jinsi'),
(808, 'model.animals', 'Tug\'ilgan kuni'),
(809, 'model.animals', 'INN(STIR)'),
(810, 'model.animals', 'PNFL'),
(811, 'model.animals', 'Manzil'),
(812, 'model.animals', 'Vet uchastka'),
(813, 'model.animals', 'Visual birka'),
(814, 'model.animals', 'Hayvon turi'),
(815, 'model.animals', 'Viloyat'),
(816, 'model.animals', 'Tuman'),
(817, 'model.animals', 'Hayvon egasi'),
(818, 'cp.animals', 'Hayvon turini tanlang'),
(819, 'cp.animals', 'Hayvon holati tanlang'),
(820, 'cp.animals', 'Erkak'),
(821, 'cp.animals', 'Urg\'ochi'),
(822, 'cp.vetsites', '- Tumanni tanlang -'),
(823, 'cp.vetsites', '- Vet uchastkani tanlang -'),
(824, 'client', '{kod} raqamli namuna muvoffaqiyatli saqlandi'),
(825, 'lab', 'Hayvon haqida ma\'lumot'),
(826, 'lab', 'Hayvon haqida ma\'lumot'),
(827, 'client', 'Oziq-ovqat ekspertizasi bo\'yicha dalolatnoma qo\'shish'),
(828, 'cp.vetsites', 'Viloyatni tanlang'),
(829, 'client', 'Viloyat'),
(830, 'cp.vetsites', 'Tumanni tanlang'),
(831, 'cp.vetsites', 'Vet uchstkani tanlang'),
(832, 'cp.individuals', 'Tekshirishdan maqsadni tanlang'),
(833, 'cp.food_sampling_certificate', 'Saqlash'),
(834, 'cp.vetsites', '- QFYni tanlang -'),
(835, 'cp.food_sampling_certificate', 'Dalolatnomalar ro\'yhati'),
(836, 'food', 'Namuna qo\'shish'),
(837, 'client', 'Mahsulotni tanlang'),
(838, 'client', 'Mahsulot birligini tanlang'),
(839, 'client', 'Namuna o\'ramini tanlang'),
(840, 'client', 'Davlatni tanlang'),
(841, 'client', 'Namuna holatini tanlang'),
(842, 'client', 'Tanlanmagan'),
(843, 'client', 'Tanlangan'),
(844, 'client', 'Laboratoriya test turini tanlang'),
(845, 'food', 'Saqlash'),
(846, 'cp.menu', 'Arizalar ro\'yhati'),
(847, 'cp.menu', 'Arizalar ro\'yhati'),
(848, 'cp.menu', 'Arizalar ro\'yhati'),
(849, 'cp.menu', 'Arizalar ro\'yhati'),
(850, 'cp.menu', 'Arizalar ro\'yhati'),
(851, 'cp.menu', 'Arizalar ro\'yhati'),
(852, 'cp.menu', 'Arizalar ro\'yhati'),
(853, 'cp.menu', 'Arizalar ro\'yhati'),
(854, 'cp.animals', 'Hayvon holatini tanlang'),
(855, 'food', 'Oziq ovqat havfsizligi namunalar ro\'yhati'),
(856, 'food', 'Oziq ovqat havfsizligi namunalar ro\'yhati'),
(857, 'food', 'Oziq ovqat havfsizligi namunalar ro\'yhati'),
(858, 'food', 'Oziq ovqat havfsizligi namunalar ro\'yhati'),
(859, 'food', 'Oziq ovqat havfsizligi namunalar ro\'yhati'),
(860, 'food', 'Oziq ovqat havfsizligi namunalar ro\'yhati'),
(861, 'cp.menu', 'Xabarlar'),
(862, 'cp.menu', 'Hayvon kasalliklari'),
(863, 'cp.menu', 'Dori darmonlar'),
(864, 'cp.menu', 'Statistika'),
(865, 'cp.menu', 'Hayvon kasalliklari (Arizalar)'),
(866, 'cp.menu', 'Oziq-ovqat ekspertizalari (Arizalar)'),
(867, 'cp.menu', 'Hayvon kasalliklari (Dalolatnomalar)'),
(868, 'cp.menu', 'Oziq-ovqat ekspertizalari (Dalolatnomalar)'),
(869, 'cp.sertificates', 'Hayvon kasalliklari arizalar ro\'yxati'),
(870, 'cp.menu', 'Xabarlar'),
(871, 'cp.menu', 'Hayvon kasalliklari'),
(872, 'cp.menu', 'Dori darmonlar'),
(873, 'cp.menu', 'Statistika'),
(874, 'cp.menu', 'Hayvon kasalliklari (Arizalar)'),
(875, 'cp.menu', 'Oziq-ovqat ekspertizalari (Arizalar)'),
(876, 'cp.menu', 'Hayvon kasalliklari (Dalolatnomalar)'),
(877, 'cp.menu', 'Oziq-ovqat ekspertizalari (Dalolatnomalar)'),
(878, 'cp.menu', 'Xabarlar'),
(879, 'cp.menu', 'Hayvon kasalliklari'),
(880, 'cp.menu', 'Dori darmonlar'),
(881, 'cp.menu', 'Statistika'),
(882, 'cp.menu', 'Hayvon kasalliklari (Arizalar)'),
(883, 'cp.menu', 'Oziq-ovqat ekspertizalari (Arizalar)'),
(884, 'cp.menu', 'Hayvon kasalliklari (Dalolatnomalar)'),
(885, 'cp.menu', 'Oziq-ovqat ekspertizalari (Dalolatnomalar)'),
(886, 'cp.menu', 'Xabarlar'),
(887, 'cp.menu', 'Hayvon kasalliklari'),
(888, 'cp.menu', 'Dori darmonlar'),
(889, 'cp.menu', 'Statistika'),
(890, 'cp.menu', 'Hayvon kasalliklari (Arizalar)'),
(891, 'cp.menu', 'Oziq-ovqat ekspertizalari (Arizalar)'),
(892, 'cp.menu', 'Hayvon kasalliklari (Dalolatnomalar)'),
(893, 'cp.menu', 'Oziq-ovqat ekspertizalari (Dalolatnomalar)'),
(894, 'client', 'Arizani kuzatish'),
(895, 'client', 'Arizani kuzatish'),
(896, 'report', 'ID'),
(897, 'report', 'Hayvon turi'),
(898, 'report', 'Hayvon holat'),
(899, 'report', 'Manzil'),
(900, 'report', 'Lat'),
(901, 'report', 'Long'),
(902, 'report', 'Batafsil'),
(903, 'report', 'Telefon raqami'),
(904, 'report', 'Operator'),
(905, 'report', 'Tasdiqdan o\'tgan'),
(906, 'report', 'Status'),
(907, 'report', 'Created'),
(908, 'report', 'Updated'),
(909, 'report', 'Code'),
(910, 'report', 'Rep ID'),
(911, 'report', 'Til'),
(912, 'report', 'Bajaruvchi Labaratoriya'),
(913, 'report', 'ID'),
(914, 'report', 'Hayvon turi'),
(915, 'report', 'Hayvon holat'),
(916, 'report', 'Manzil'),
(917, 'report', 'Lat'),
(918, 'report', 'Long'),
(919, 'report', 'Batafsil'),
(920, 'report', 'Telefon raqami'),
(921, 'report', 'Operator'),
(922, 'report', 'Tasdiqdan o\'tgan'),
(923, 'report', 'Status'),
(924, 'report', 'Created'),
(925, 'report', 'Updated'),
(926, 'report', 'Code'),
(927, 'report', 'Rep ID'),
(928, 'report', 'Til'),
(929, 'report', 'Bajaruvchi Labaratoriya'),
(930, 'komitet', 'Yo\'q'),
(931, 'komitet', 'Ha'),
(932, 'komitet', 'Tekshirilmagan'),
(933, 'report', 'ID'),
(934, 'report', 'Hayvon turi'),
(935, 'report', 'Hayvon holat'),
(936, 'report', 'Manzil'),
(937, 'report', 'Lat'),
(938, 'report', 'Long'),
(939, 'report', 'Batafsil'),
(940, 'report', 'Telefon raqami'),
(941, 'report', 'Operator'),
(942, 'report', 'Tasdiqdan o\'tgan'),
(943, 'report', 'Status'),
(944, 'report', 'Created'),
(945, 'report', 'Updated'),
(946, 'report', 'Code'),
(947, 'report', 'Rep ID'),
(948, 'report', 'Til'),
(949, 'report', 'Bajaruvchi Labaratoriya'),
(950, 'komitet', 'Yo\'q'),
(951, 'komitet', 'Ha'),
(952, 'komitet', 'Tekshirilmagan'),
(953, 'report', 'ID'),
(954, 'report', 'Turi'),
(955, 'report', 'Holat'),
(956, 'report', 'Manzil'),
(957, 'report', 'Lat'),
(958, 'report', 'Long'),
(959, 'report', 'Batafsil'),
(960, 'report', 'Telefon raqami'),
(961, 'food', 'Code'),
(962, 'food', 'Rep ID'),
(963, 'food', 'Created'),
(964, 'report', 'Operator'),
(965, 'report', 'Tasdiqdan o\'tgan'),
(966, 'report', 'Status'),
(967, 'food', 'Rep ID'),
(968, 'food', 'Code'),
(969, 'food', 'Cat ID'),
(970, 'food', 'Type ID'),
(971, 'food', 'Soato ID'),
(972, 'food', 'Lat'),
(973, 'food', 'Long'),
(974, 'food', 'Detail'),
(975, 'food', 'Phone'),
(976, 'food', 'Created'),
(977, 'food', 'Operator ID'),
(978, 'food', 'Is True'),
(979, 'food', 'Status ID'),
(980, 'food', 'Rep ID'),
(981, 'food', 'Code'),
(982, 'food', 'Cat ID'),
(983, 'food', 'Type ID'),
(984, 'food', 'Soato ID'),
(985, 'food', 'Lat'),
(986, 'food', 'Long'),
(987, 'food', 'Detail'),
(988, 'food', 'Phone'),
(989, 'food', 'Created'),
(990, 'food', 'Operator ID'),
(991, 'food', 'Is True'),
(992, 'food', 'Status ID'),
(993, 'komitet', 'Yo\'q'),
(994, 'komitet', 'Ha'),
(995, 'komitet', 'Tekshirilmagan'),
(996, 'food', 'Rep ID'),
(997, 'food', 'Code'),
(998, 'food', 'Cat ID'),
(999, 'food', 'Type ID'),
(1000, 'food', 'Soato ID'),
(1001, 'food', 'Lat'),
(1002, 'food', 'Long'),
(1003, 'food', 'Detail'),
(1004, 'food', 'Phone'),
(1005, 'food', 'Created'),
(1006, 'food', 'Operator ID'),
(1007, 'food', 'Is True'),
(1008, 'food', 'Status ID'),
(1009, 'komitet', 'Yo\'q'),
(1010, 'komitet', 'Ha'),
(1011, 'komitet', 'Tekshirilmagan'),
(1012, 'food', 'Code'),
(1013, 'food', 'Rep ID'),
(1014, 'food', 'Created'),
(1015, 'lab', 'Talabga muvoffiqligini tanlang'),
(1016, 'model', 'Natija(oraliq)'),
(1017, 'model', 'Tekshirilgan'),
(1018, 'client', 'Ariza muvoffaqiyatli yuborildi'),
(1019, 'test', 'Namuna {number} raqami bilan saqlandi'),
(1020, 'cp.animals', 'Emlash: {name}'),
(1021, 'cp.animals', 'Hayvonlar'),
(1022, 'cp.animals', 'Emlash'),
(1023, 'cp.animals', 'Kasallikni talang'),
(1024, 'model.roles', 'Animal ID'),
(1025, 'model.roles', 'Vaccina ID'),
(1026, 'model.roles', 'Disease ID'),
(1027, 'model.roles', 'Disease Date'),
(1028, 'cp.animals', 'Saqlash'),
(1029, 'cp.animals', 'Davolash: {name}'),
(1030, 'cp.animals', 'Davolash'),
(1031, 'model.emlash', 'Hayvon'),
(1032, 'model.emlash', 'Antibiotik'),
(1033, 'model.emlash', 'Sana'),
(1034, 'lab', 'Namuna yo\'q qilish dalolatnomasi tasdiqlash uchun rahbarga yuborildi'),
(1035, 'client', 'Dalolatnomaga namuna biriktirilmagan'),
(1036, 'reg', 'Xatolik'),
(1037, 'model.samples', 'Birlashgan namunalardan'),
(1038, 'model.samples', 'Birlashgan namunalardan'),
(1039, 'model.samples', 'Birlashgan namunalardan'),
(1040, 'model.samples', 'Birlashgan namunalardan'),
(1041, 'model.samples', 'Birlashgan namunalardan'),
(1042, 'food', 'Birlashgan namunalardan'),
(1043, 'lab', 'Tasdiqlanmadi'),
(1044, 'lab', 'Tasdiqlandi'),
(1045, 'lab', 'Umumiy tekshiruv natijasi'),
(1046, 'model', 'Name'),
(1047, 'model', 'Sample ID'),
(1048, 'model', 'Tavfsiya matni'),
(1049, 'cp.food_sampling_certificate', 'Mahsulot ekspertizalari'),
(1050, 'leader', 'Topshiriq rad etildi'),
(1051, 'leader', 'Topshiriq rad etildi'),
(1052, 'model.samples', 'Materiallar soni'),
(1053, 'model', 'Patonomiya'),
(1054, 'model', 'Organoleptika'),
(1055, 'model', 'Mikroskopiya Nurli'),
(1056, 'model', 'Mikroskopiya Lyuminesent'),
(1057, 'model', 'Bakterilogik'),
(1058, 'model', 'Virusologik TE,KE'),
(1059, 'model', 'Virusologik XM,KK'),
(1060, 'model', 'Biologik'),
(1061, 'model', 'RA,KR'),
(1062, 'model', 'RSK'),
(1063, 'model', 'RDSK'),
(1064, 'model', 'RBP'),
(1065, 'model', 'RMA'),
(1066, 'model', 'RP,RDP'),
(1067, 'model', 'RH'),
(1068, 'model', 'RNGA'),
(1069, 'model', 'RGA'),
(1070, 'model', 'IFA'),
(1071, 'model', 'IXLA'),
(1072, 'model', 'Boshqa Serologiya'),
(1073, 'model', 'PSR'),
(1074, 'model', 'Gistologiya'),
(1075, 'model', 'Gemotologiya'),
(1076, 'model', 'Koprologiya'),
(1077, 'model', 'Kimyoviy'),
(1078, 'model', 'Biokimyoviy'),
(1079, 'model', 'Patonomiya'),
(1080, 'model', 'Organoleptika'),
(1081, 'model', 'Mikroskopiya Nurli'),
(1082, 'model', 'Mikroskopiya Lyuminesent'),
(1083, 'model', 'Bakterilogik'),
(1084, 'model', 'Virusologik TE,KE'),
(1085, 'model', 'Virusologik XM,KK'),
(1086, 'model', 'Biologik'),
(1087, 'model', 'RA,KR'),
(1088, 'model', 'RSK'),
(1089, 'model', 'RDSK'),
(1090, 'model', 'RBP'),
(1091, 'model', 'RMA'),
(1092, 'model', 'RP,RDP'),
(1093, 'model', 'RH'),
(1094, 'model', 'RNGA'),
(1095, 'model', 'RGA'),
(1096, 'model', 'IFA'),
(1097, 'model', 'IXLA'),
(1098, 'model', 'Boshqa Serologiya'),
(1099, 'model', 'PSR'),
(1100, 'model', 'Gistologiya'),
(1101, 'model', 'Gemotologiya'),
(1102, 'model', 'Koprologiya'),
(1103, 'model', 'Kimyoviy'),
(1104, 'model', 'Biokimyoviy'),
(1105, 'model', 'RGKA'),
(1106, 'model', 'RGKA'),
(1107, 'lab', 'O\'tkazilgan tekshiruv natijalari kiritlmagan'),
(1108, 'lab', 'Umumlashgan natija kiritlmagan'),
(1109, 'lab', 'Natija muvoffaqiyatli tasdiqlandi. Natija rahbar tasdiqlashi uchun yuborildi.'),
(1110, 'food', 'Hayvon kasalliklari tashxisi bo`yicha o`tkazilgan tekshiruvlar hisoboti');

-- --------------------------------------------------------

--
-- Table structure for table `state_list`
--

CREATE TABLE `state_list` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Холатлар рўйхати. Масалан, актив, ноактив ва ҳ.к.';

--
-- Dumping data for table `state_list`
--

INSERT INTO `state_list` (`id`, `name`) VALUES
(1, 'Aktiv'),
(2, 'Passiv'),
(3, 'O\'chirilgan');

-- --------------------------------------------------------

--
-- Table structure for table `status_list`
--

CREATE TABLE `status_list` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Статуслар рўйхати. Масалан: доимий, вақтинчалик вазифасини бажарувчи, ходатайство ва ҳ.к.';

--
-- Dumping data for table `status_list`
--

INSERT INTO `status_list` (`id`, `name`) VALUES
(1, 'Doimiy'),
(2, 'Vaqtincha');

-- --------------------------------------------------------

--
-- Table structure for table `tamplate_animal`
--

CREATE TABLE `tamplate_animal` (
  `id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL COMMENT 'Yoshi oyda ko''rsatiladi',
  `diseases_id` int(11) DEFAULT NULL,
  `test_method_id` int(11) DEFAULT NULL,
  `name_uz` varchar(255) DEFAULT NULL,
  `name_ru` varchar(255) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `min` varchar(255) DEFAULT NULL,
  `min_1` varchar(255) DEFAULT NULL,
  `max` varchar(255) DEFAULT NULL,
  `max_1` varchar(255) DEFAULT NULL,
  `is_vaccination` int(11) DEFAULT NULL,
  `dead_days` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `consent_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `updated` datetime DEFAULT current_timestamp(),
  `state_id` int(11) DEFAULT NULL,
  `ads` varchar(255) DEFAULT NULL,
  `vet4` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Hayvon kasalliklari tashhisi shablonlari';

--
-- Dumping data for table `tamplate_animal`
--

INSERT INTO `tamplate_animal` (`id`, `type_id`, `gender`, `age`, `diseases_id`, `test_method_id`, `name_uz`, `name_ru`, `unit_id`, `min`, `min_1`, `max`, `max_1`, `is_vaccination`, `dead_days`, `creator_id`, `consent_id`, `created`, `updated`, `state_id`, `ads`, `vet4`) VALUES
(1, 1, 1, 10, 1, 1, 'shablon1', 'shablon1', 2, '12', '', '15', '', 0, NULL, 2, 2, '2022-03-25 20:50:33', '2022-03-26 06:31:52', 1, NULL, '10102001'),
(2, 2, 1, 3, 1, 1, 'asd', 'asd', 4, '1', '5', '2', '10', 1, 100, 2, NULL, '2022-03-25 21:24:35', '2022-03-26 06:32:09', 1, NULL, '10102001'),
(3, 1, 1, 5, 1, 1, 'asd', 'asd', 2, '1', '', '4', '', 0, -1, 2, NULL, '2022-03-26 06:31:18', '2022-03-26 06:31:18', 1, NULL, '10102001'),
(4, 2, 1, 10, 1, 1, 'qoy uchun', 'qoy uchun', 6, '1', '', '', '', 0, -1, 2, NULL, '2022-03-26 06:33:13', '2022-03-26 06:33:13', 1, NULL, '10102001'),
(5, 1, 1, 50, 1, 1, '45', '45', 1, '0', '', '0', '', 0, NULL, 2, NULL, '2022-03-30 10:41:55', '2022-03-30 10:41:55', 1, NULL, '10102001'),
(6, 1, 1, 10, 1, 1, 'ParUz', 'ParRu', 2, '0', '', '1', '', 1, -1, 2, 1, '2022-04-01 07:32:21', '2022-04-01 07:32:21', 1, NULL, '10102001');

-- --------------------------------------------------------

--
-- Table structure for table `template_animal_regulations`
--

CREATE TABLE `template_animal_regulations` (
  `regulation_id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `state_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Shablonga qonunlarni boglanishi';

--
-- Dumping data for table `template_animal_regulations`
--

INSERT INTO `template_animal_regulations` (`regulation_id`, `template_id`, `state_id`) VALUES
(1, 2, 1),
(1, 3, 1),
(1, 4, 1),
(1, 5, 1),
(1, 6, 1),
(2, 3, 1),
(2, 4, 1),
(3, 1, 1),
(3, 3, 1),
(3, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `template_food`
--

CREATE TABLE `template_food` (
  `id` int(11) NOT NULL,
  `tasnif_code` varchar(255) DEFAULT NULL,
  `laboratory_test_type_id` int(11) DEFAULT NULL,
  `name_uz` varchar(255) DEFAULT NULL,
  `name_ru` varchar(255) DEFAULT NULL,
  `unit_uz` varchar(255) DEFAULT NULL,
  `unit_ru` varchar(255) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `min` varchar(255) DEFAULT NULL,
  `min_1` varchar(255) DEFAULT NULL,
  `max` varchar(255) DEFAULT NULL,
  `max_1` varchar(255) DEFAULT NULL,
  `ads` varchar(255) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `consept_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='foodni templatelari';

--
-- Dumping data for table `template_food`
--

INSERT INTO `template_food` (`id`, `tasnif_code`, `laboratory_test_type_id`, `name_uz`, `name_ru`, `unit_uz`, `unit_ru`, `type_id`, `min`, `min_1`, `max`, `max_1`, `ads`, `creator_id`, `consept_id`, `created`, `updated`) VALUES
(1, '1', 1, 'shablon1uz', 'shalon1ru', 'birlik1uz', 'birlik1ru', 1, '1', '', '2', '', 'asd', NULL, NULL, '2022-03-28 21:37:50', '2022-03-28 21:37:50'),
(2, '1', 1, 'shablon2uz', 'shalon2ru', 'birlik2uz', 'birlik2ru', 1, '1', '', '2', '', 'asd', NULL, NULL, '2022-03-28 21:38:05', '2022-03-28 21:38:05');

-- --------------------------------------------------------

--
-- Table structure for table `template_food_regulations`
--

CREATE TABLE `template_food_regulations` (
  `regulation_id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `state_id` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Regulationslar';

-- --------------------------------------------------------

--
-- Table structure for table `template_unit`
--

CREATE TABLE `template_unit` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(255) DEFAULT NULL,
  `name_ru` varchar(255) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Shablon birligi';

--
-- Dumping data for table `template_unit`
--

INSERT INTO `template_unit` (`id`, `name_uz`, `name_ru`, `type_id`) VALUES
(1, 'Belgi', 'Признак', 2),
(2, 'шт', 'шт', 1),
(3, 'МЕ/см3', 'МЕ/см3', 1),
(4, 'Nisbat', 'Соотношение ', 4),
(5, 'Soat', 'час ', 1),
(6, 'Ед.ОП', 'Ед.ОП', 1),
(7, '%', '%', 3);

-- --------------------------------------------------------

--
-- Table structure for table `template_unit_type`
--

CREATE TABLE `template_unit_type` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(255) DEFAULT NULL,
  `name_ru` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `template_unit_type`
--

INSERT INTO `template_unit_type` (`id`, `name_uz`, `name_ru`) VALUES
(1, 'Son', 'Son'),
(2, 'Ha/Yo\'q', 'Ha/Yo\'q'),
(3, 'Matn', 'Matn'),
(4, 'Nisbat', 'Nisbat');

-- --------------------------------------------------------

--
-- Table structure for table `test_method`
--

CREATE TABLE `test_method` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name_ru` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_method`
--

INSERT INTO `test_method` (`id`, `name_uz`, `name_ru`, `state`) VALUES
(1, 'тахлил усули 01', 'способ исследования 01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `test_types`
--

CREATE TABLE `test_types` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name_ru` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tshx`
--

CREATE TABLE `tshx` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ru` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tshx`
--

INSERT INTO `tshx` (`id`, `name_uz`, `name_ru`, `code`) VALUES
(1, 'тест01', 'тест01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(100) NOT NULL,
  `name_ru` varchar(255) NOT NULL,
  `code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name_uz`, `name_ru`, `code`) VALUES
(1, 'дона', 'штук', 1),
(2, 'грамм', 'грамм', 2),
(3, 'дона', 'штук', 55);

-- --------------------------------------------------------

--
-- Table structure for table `vaccination`
--

CREATE TABLE `vaccination` (
  `animal_id` int(11) NOT NULL,
  `vaccina_id` int(11) DEFAULT NULL,
  `disease_id` int(11) DEFAULT NULL,
  `disease_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vaccines`
--

CREATE TABLE `vaccines` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verification_purposes`
--

CREATE TABLE `verification_purposes` (
  `id` int(11) NOT NULL,
  `name_uz` varchar(100) NOT NULL,
  `name_ru` varchar(255) NOT NULL,
  `code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `verification_purposes`
--

INSERT INTO `verification_purposes` (`id`, `name_uz`, `name_ru`, `code`) VALUES
(1, 'максад-01', 'цель -01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vet_sites`
--

CREATE TABLE `vet_sites` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `soato` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vet_sites`
--

INSERT INTO `vet_sites` (`id`, `code`, `name`, `soato`) VALUES
(1, 1, 'Bogot vet', 1733204551);

-- --------------------------------------------------------

--
-- Structure for view `district_view`
--
DROP TABLE IF EXISTS `district_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `district_view`  AS SELECT `s`.`MHOBT_cod` AS `MHOBT_cod`, `s`.`region_id` AS `region_id`, `s`.`district_id` AS `district_id`, `s`.`name_lot` AS `name_lot`, `s`.`center_lot` AS `center_lot`, `s`.`name_cyr` AS `name_cyr`, `s`.`center_cyr` AS `center_cyr`, `s`.`name_ru` AS `name_ru`, `s`.`center_ru` AS `center_ru` FROM `soato` AS `s` WHERE `s`.`qfi_id` is null AND `s`.`district_id` is not null ;

-- --------------------------------------------------------

--
-- Structure for view `qfi_view`
--
DROP TABLE IF EXISTS `qfi_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qfi_view`  AS SELECT `s`.`MHOBT_cod` AS `MHOBT_cod`, `s`.`district_id` AS `district_id`, `s`.`region_id` AS `region_id`, `s`.`qfi_id` AS `qfi_id`, `s`.`name_lot` AS `name_lot`, `s`.`center_lot` AS `center_lot`, `s`.`name_cyr` AS `name_cyr`, `s`.`center_cyr` AS `center_cyr`, `s`.`name_ru` AS `name_ru`, `s`.`center_ru` AS `center_ru` FROM `soato` AS `s` WHERE `s`.`qfi_id` is not null ;

-- --------------------------------------------------------

--
-- Structure for view `regions_view`
--
DROP TABLE IF EXISTS `regions_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `regions_view`  AS SELECT `s`.`region_id` AS `region_id`, `s`.`name_lot` AS `name_lot`, `s`.`center_lot` AS `center_lot`, `s`.`name_cyr` AS `name_cyr`, `s`.`center_cyr` AS `center_cyr`, `s`.`name_ru` AS `name_ru`, `s`.`center_ru` AS `center_ru` FROM `soato` AS `s` WHERE `s`.`district_id` is null ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `animals`
--
ALTER TABLE `animals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_animals_animaltype_id` (`type_id`),
  ADD KEY `FK_animals_vet_site_id` (`vet_site_id`);

--
-- Indexes for table `animaltype`
--
ALTER TABLE `animaltype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `animal_category`
--
ALTER TABLE `animal_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `animal_status`
--
ALTER TABLE `animal_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `composite_samples`
--
ALTER TABLE `composite_samples`
  ADD PRIMARY KEY (`sample_id`,`registration_id`),
  ADD KEY `FK_composite_samples_registration_id` (`registration_id`);

--
-- Indexes for table `countres`
--
ALTER TABLE `countres`
  ADD PRIMARY KEY (`code`),
  ADD UNIQUE KEY `uni` (`id`);

--
-- Indexes for table `destruction_sample_animal`
--
ALTER TABLE `destruction_sample_animal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_destruction_sample_animal_sample_id` (`sample_id`),
  ADD KEY `FK_destruction_sample_animal_creator_id` (`creator_id`),
  ADD KEY `FK_destruction_sample_animal_state_id` (`state_id`),
  ADD KEY `FK_destruction_sample_animal_org_id` (`org_id`);

--
-- Indexes for table `destruction_sample_food`
--
ALTER TABLE `destruction_sample_food`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_destruction_sample_food_sample_id` (`sample_id`),
  ADD KEY `FK_destruction_sample_food_state_id` (`state_id`),
  ADD KEY `FK_destruction_sample_food_org_id` (`org_id`),
  ADD KEY `FK_destruction_sample_food_consept_id` (`consent_id`);

--
-- Indexes for table `diseases`
--
ALTER TABLE `diseases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_diseases` (`group_id`),
  ADD KEY `FK_diseases_disease_category_id` (`category_id`);

--
-- Indexes for table `disease_category`
--
ALTER TABLE `disease_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disease_groups`
--
ALTER TABLE `disease_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_passwords_history`
--
ALTER TABLE `employee_passwords_history`
  ADD KEY `FK_employee_passwords_history_employees_id` (`emp_id`);

--
-- Indexes for table `emp_posts`
--
ALTER TABLE `emp_posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_emp_posts_emp_id` (`emp_id`),
  ADD KEY `FK_emp_posts` (`status_id`),
  ADD KEY `FK_emp_posts2` (`org_id`),
  ADD KEY `FK_emp_posts_post_list_id` (`post_id`),
  ADD KEY `FK_emp_posts_state_list_id` (`state_id`),
  ADD KEY `FK_emp_posts_gov_id` (`gov_id`);

--
-- Indexes for table `emp_posts_history`
--
ALTER TABLE `emp_posts_history`
  ADD KEY `FK_emp_posts_history_emp_posts_emp_id` (`emp_id`),
  ADD KEY `FK_emp_posts_history_organizations_id` (`org_id`),
  ADD KEY `FK_emp_posts_history_post_list_id` (`post_id`),
  ADD KEY `FK_emp_posts_history_state_list_id` (`state_id`),
  ADD KEY `FK_emp_posts_history_status_list_id` (`status_id`);

--
-- Indexes for table `food_compose`
--
ALTER TABLE `food_compose`
  ADD PRIMARY KEY (`id`,`sample_id`,`registration_id`),
  ADD KEY `FK_food_compose_sample_id` (`sample_id`),
  ADD KEY `FK_food_compose_registration_id` (`registration_id`);

--
-- Indexes for table `food_recomendation`
--
ALTER TABLE `food_recomendation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_registration`
--
ALTER TABLE `food_registration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_food_registration_organization_id` (`organization_id`),
  ADD KEY `FK_food_registration_research_category_id` (`research_category_id`),
  ADD KEY `FK_food_registration_status_id` (`status_id`);

--
-- Indexes for table `food_route`
--
ALTER TABLE `food_route`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_food_route_director_id` (`director_id`),
  ADD KEY `FK_food_route_leader_id` (`leader_id`),
  ADD KEY `FK_food_route_state_id` (`state_id`),
  ADD KEY `FK_food_route_sample_id` (`sample_id`),
  ADD KEY `FK_food_route_registration_id` (`registration_id`),
  ADD KEY `FK_food_route_status_id` (`status_id`);

--
-- Indexes for table `food_samples`
--
ALTER TABLE `food_samples`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_food_samples_sert_id` (`sert_id`),
  ADD KEY `FK_food_samples_unit_id` (`unit_id`),
  ADD KEY `FK_food_samples_sample_box_id` (`sample_box_id`),
  ADD KEY `FK_food_samples_sample_condition_id` (`sample_condition_id`),
  ADD KEY `FK_food_samples_laboratory_test_type_id` (`laboratory_test_type_id`),
  ADD KEY `FK_food_samples_status_id` (`status_id`),
  ADD KEY `FK_food_samples_state_id` (`state_id`),
  ADD KEY `FK_food_samples__country` (`_country`);

--
-- Indexes for table `food_sampling_certificate`
--
ALTER TABLE `food_sampling_certificate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_sampling_certificate_ibfk_2` (`verification_pupose_id`),
  ADD KEY `food_sampling_certificate_ibfk_3` (`pnfl`),
  ADD KEY `FK_food_sampling_certificate_status_id` (`status_id`),
  ADD KEY `FK_food_sampling_certificate_state_id` (`state_id`);

--
-- Indexes for table `food_type`
--
ALTER TABLE `food_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goverments`
--
ALTER TABLE `goverments`
  ADD PRIMARY KEY (`id`,`name_uz`,`name_ru`);

--
-- Indexes for table `individuals`
--
ALTER TABLE `individuals`
  ADD PRIMARY KEY (`pnfl`),
  ADD KEY `FK_individuals_soato_MHOBT_cod` (`soato_id`);

--
-- Indexes for table `laboratory_test_type`
--
ALTER TABLE `laboratory_test_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `legal_entities`
--
ALTER TABLE `legal_entities`
  ADD PRIMARY KEY (`inn`),
  ADD KEY `FK_legal_entities_tshx` (`tshx_id`),
  ADD KEY `FK_legal_entities_soato_MHOBT_cod` (`soato_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`,`language`),
  ADD KEY `idx_message_language` (`language`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organization_type`
--
ALTER TABLE `organization_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_list`
--
ALTER TABLE `post_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_post_list_roles_id` (`def_role`);

--
-- Indexes for table `regulations`
--
ALTER TABLE `regulations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Regulations_creator_id` (`creator_id`),
  ADD KEY `FK_regulations_status` (`status`),
  ADD KEY `FK_regulations_type_id` (`type_id`);

--
-- Indexes for table `regulation_types`
--
ALTER TABLE `regulation_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_animal`
--
ALTER TABLE `report_animal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_report_animal_type_id` (`type_id`),
  ADD KEY `FK_report_animal_report_status_id` (`report_status_id`),
  ADD KEY `FK_report_animal_status_id` (`cat_id`),
  ADD KEY `FK_report_animal_soato_id` (`soato_id`);

--
-- Indexes for table `report_animal_images`
--
ALTER TABLE `report_animal_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_drugs`
--
ALTER TABLE `report_drugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_report_drugs_cat_id` (`cat_id`),
  ADD KEY `FK_report_drugs_type_id` (`type_id`),
  ADD KEY `FK_report_drugs_soato_id` (`soato_id`),
  ADD KEY `FK_report_drugs_status_id` (`status_id`);

--
-- Indexes for table `report_drug_images`
--
ALTER TABLE `report_drug_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_drug_type`
--
ALTER TABLE `report_drug_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_food`
--
ALTER TABLE `report_food`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_report_food_type_id` (`type_id`),
  ADD KEY `FK_report_food_cat_id` (`cat_id`),
  ADD KEY `FK_report_food_soato_id` (`soato_id`),
  ADD KEY `FK_report_food_status_id` (`status_id`);

--
-- Indexes for table `report_food_category`
--
ALTER TABLE `report_food_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_food_images`
--
ALTER TABLE `report_food_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_report_food_images_report_id` (`report_id`);

--
-- Indexes for table `report_status`
--
ALTER TABLE `report_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requirements`
--
ALTER TABLE `requirements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `research_category`
--
ALTER TABLE `research_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `result_animal`
--
ALTER TABLE `result_animal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_result_animal_sample_id` (`sample_id`),
  ADD KEY `FK_result_animal_state_id` (`state_id`);

--
-- Indexes for table `result_animal_tests`
--
ALTER TABLE `result_animal_tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_result_animal_tests_template_id` (`template_id`),
  ADD KEY `FK_result_animal_tests_type_id` (`type_id`),
  ADD KEY `FK_result_animal_tests_result_id` (`result_id`);

--
-- Indexes for table `result_food`
--
ALTER TABLE `result_food`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_result_food_sample_id` (`sample_id`),
  ADD KEY `FK_result_food_require_id` (`require_id`),
  ADD KEY `FK_result_food_state_id` (`state_id`),
  ADD KEY `FK_result_food_org_id` (`org_id`);

--
-- Indexes for table `result_food_tests`
--
ALTER TABLE `result_food_tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_result_food_tests_template_id` (`template_id`),
  ADD KEY `FK_result_food_tests_type_id` (`type_id`),
  ADD KEY `FK_result_food_tests_result_id` (`result_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `route_sert`
--
ALTER TABLE `route_sert`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_route_sert_status_id` (`state_id`),
  ADD KEY `FK_route_sert_reciever_id` (`leader_id`),
  ADD KEY `FK_route_sert_sender_id` (`director_id`),
  ADD KEY `FK_route_sert_sample_id2` (`sample_id`),
  ADD KEY `FK_route_sert_registration_id` (`registration_id`),
  ADD KEY `FK_route_sert_status_id2` (`status_id`);

--
-- Indexes for table `route_status`
--
ALTER TABLE `route_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `samples`
--
ALTER TABLE `samples`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_samples_animals_id` (`animal_id`),
  ADD KEY `FK_samples_sample_boxes_id` (`sample_box_id`),
  ADD KEY `FK_samples_sample_types_id` (`sample_type_is`),
  ADD KEY `FK_samples_suspected_disease_id` (`suspected_disease_id`),
  ADD KEY `FK_samples_test_mehod_id` (`test_mehod_id`),
  ADD KEY `FK_samples_sert_id` (`sert_id`);

--
-- Indexes for table `sample_boxes`
--
ALTER TABLE `sample_boxes`
  ADD PRIMARY KEY (`id`,`name_uz`,`name_ru`),
  ADD UNIQUE KEY `UK_sample_boxes_id` (`id`);

--
-- Indexes for table `sample_conditions`
--
ALTER TABLE `sample_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sample_recomendation`
--
ALTER TABLE `sample_recomendation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sample_registration`
--
ALTER TABLE `sample_registration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_sample_registration_samples_id` (`emp_id`),
  ADD KEY `FK_sample_registration_organizations_id` (`organization_id`),
  ADD KEY `FK_sample_registration_research_category` (`research_category_id`),
  ADD KEY `FK_sample_registration_status_id` (`status_id`);

--
-- Indexes for table `sample_status`
--
ALTER TABLE `sample_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sample_types`
--
ALTER TABLE `sample_types`
  ADD PRIMARY KEY (`id`,`name_uz`,`name_ru`),
  ADD UNIQUE KEY `UK_sample_types_id` (`id`);

--
-- Indexes for table `sertificates`
--
ALTER TABLE `sertificates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_sertificates_vet_site_id` (`vet_site_id`),
  ADD KEY `FK_sertificates_status_id` (`status_id`),
  ADD KEY `FK_sertificates_state_id` (`state_id`);

--
-- Indexes for table `sert_normatives`
--
ALTER TABLE `sert_normatives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sert_status`
--
ALTER TABLE `sert_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soato`
--
ALTER TABLE `soato`
  ADD PRIMARY KEY (`MHOBT_cod`);

--
-- Indexes for table `source_message`
--
ALTER TABLE `source_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_source_message_category` (`category`);

--
-- Indexes for table `state_list`
--
ALTER TABLE `state_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status_list`
--
ALTER TABLE `status_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tamplate_animal`
--
ALTER TABLE `tamplate_animal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tamplate_animal_type_id` (`type_id`),
  ADD KEY `FK_tamplate_animal_unit_id` (`unit_id`),
  ADD KEY `FK_tamplate_animal_test_method_id` (`test_method_id`),
  ADD KEY `FK_tamplate_animal_diseases_id` (`diseases_id`),
  ADD KEY `FK_tamplate_animal_state_id` (`state_id`);

--
-- Indexes for table `template_animal_regulations`
--
ALTER TABLE `template_animal_regulations`
  ADD PRIMARY KEY (`regulation_id`,`template_id`),
  ADD KEY `FK_template_animal_regulations_template_id` (`template_id`),
  ADD KEY `FK_template_animal_regulations_state_id` (`state_id`);

--
-- Indexes for table `template_food`
--
ALTER TABLE `template_food`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_template_food_laboratory_test_type_id` (`laboratory_test_type_id`),
  ADD KEY `FK_template_food_type_id` (`type_id`);

--
-- Indexes for table `template_food_regulations`
--
ALTER TABLE `template_food_regulations`
  ADD PRIMARY KEY (`regulation_id`,`template_id`),
  ADD KEY `FK_template_food_regulations_template_id` (`template_id`);

--
-- Indexes for table `template_unit`
--
ALTER TABLE `template_unit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_template_unit_type_id` (`type_id`);

--
-- Indexes for table `template_unit_type`
--
ALTER TABLE `template_unit_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_method`
--
ALTER TABLE `test_method`
  ADD PRIMARY KEY (`id`,`name_uz`,`name_ru`),
  ADD UNIQUE KEY `UK_test_method_id` (`id`),
  ADD KEY `FK_test_method_status_list_id` (`state`);

--
-- Indexes for table `test_types`
--
ALTER TABLE `test_types`
  ADD PRIMARY KEY (`id`,`name_uz`,`name_ru`);

--
-- Indexes for table `tshx`
--
ALTER TABLE `tshx`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vaccination`
--
ALTER TABLE `vaccination`
  ADD KEY `FK_vaccination_animals_id` (`animal_id`),
  ADD KEY `FK_vaccination_diseases_id` (`disease_id`);

--
-- Indexes for table `vaccines`
--
ALTER TABLE `vaccines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `verification_purposes`
--
ALTER TABLE `verification_purposes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vet_sites`
--
ALTER TABLE `vet_sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_vet_sites_soato_MHOBT_cod` (`soato`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `animals`
--
ALTER TABLE `animals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `animal_status`
--
ALTER TABLE `animal_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countres`
--
ALTER TABLE `countres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `destruction_sample_animal`
--
ALTER TABLE `destruction_sample_animal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `destruction_sample_food`
--
ALTER TABLE `destruction_sample_food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `diseases`
--
ALTER TABLE `diseases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `emp_posts`
--
ALTER TABLE `emp_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `food_compose`
--
ALTER TABLE `food_compose`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `food_recomendation`
--
ALTER TABLE `food_recomendation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `food_registration`
--
ALTER TABLE `food_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `food_route`
--
ALTER TABLE `food_route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `food_samples`
--
ALTER TABLE `food_samples`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `food_sampling_certificate`
--
ALTER TABLE `food_sampling_certificate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `food_type`
--
ALTER TABLE `food_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `organization_type`
--
ALTER TABLE `organization_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `post_list`
--
ALTER TABLE `post_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `regulations`
--
ALTER TABLE `regulations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `regulation_types`
--
ALTER TABLE `regulation_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `report_animal`
--
ALTER TABLE `report_animal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `report_animal_images`
--
ALTER TABLE `report_animal_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `report_drugs`
--
ALTER TABLE `report_drugs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `report_drug_images`
--
ALTER TABLE `report_drug_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `report_drug_type`
--
ALTER TABLE `report_drug_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `report_food`
--
ALTER TABLE `report_food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `report_food_category`
--
ALTER TABLE `report_food_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `report_food_images`
--
ALTER TABLE `report_food_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `report_status`
--
ALTER TABLE `report_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `requirements`
--
ALTER TABLE `requirements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `research_category`
--
ALTER TABLE `research_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `result_animal`
--
ALTER TABLE `result_animal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `result_animal_tests`
--
ALTER TABLE `result_animal_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `result_food`
--
ALTER TABLE `result_food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `result_food_tests`
--
ALTER TABLE `result_food_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `route_sert`
--
ALTER TABLE `route_sert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `route_status`
--
ALTER TABLE `route_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `samples`
--
ALTER TABLE `samples`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `sample_conditions`
--
ALTER TABLE `sample_conditions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sample_recomendation`
--
ALTER TABLE `sample_recomendation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sample_registration`
--
ALTER TABLE `sample_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `sample_status`
--
ALTER TABLE `sample_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sertificates`
--
ALTER TABLE `sertificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `sert_normatives`
--
ALTER TABLE `sert_normatives`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sert_status`
--
ALTER TABLE `sert_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `source_message`
--
ALTER TABLE `source_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1111;

--
-- AUTO_INCREMENT for table `state_list`
--
ALTER TABLE `state_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `status_list`
--
ALTER TABLE `status_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tamplate_animal`
--
ALTER TABLE `tamplate_animal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `template_food`
--
ALTER TABLE `template_food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `template_unit`
--
ALTER TABLE `template_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `template_unit_type`
--
ALTER TABLE `template_unit_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vaccines`
--
ALTER TABLE `vaccines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vet_sites`
--
ALTER TABLE `vet_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `animals`
--
ALTER TABLE `animals`
  ADD CONSTRAINT `FK_animals_animaltype_id` FOREIGN KEY (`type_id`) REFERENCES `animaltype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_animals_vet_site_id` FOREIGN KEY (`vet_site_id`) REFERENCES `vet_sites` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `composite_samples`
--
ALTER TABLE `composite_samples`
  ADD CONSTRAINT `FK_composite_samples_registration_id` FOREIGN KEY (`registration_id`) REFERENCES `sample_registration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_composite_samples_samples_id` FOREIGN KEY (`sample_id`) REFERENCES `samples` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `destruction_sample_animal`
--
ALTER TABLE `destruction_sample_animal`
  ADD CONSTRAINT `FK_destruction_sample_animal_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_destruction_sample_animal_org_id` FOREIGN KEY (`org_id`) REFERENCES `organizations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_destruction_sample_animal_sample_id` FOREIGN KEY (`sample_id`) REFERENCES `samples` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_destruction_sample_animal_state_id` FOREIGN KEY (`state_id`) REFERENCES `state_list` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `destruction_sample_food`
--
ALTER TABLE `destruction_sample_food`
  ADD CONSTRAINT `FK_destruction_sample_food_consept_id` FOREIGN KEY (`consent_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `FK_destruction_sample_food_org_id` FOREIGN KEY (`org_id`) REFERENCES `organizations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_destruction_sample_food_sample_id` FOREIGN KEY (`sample_id`) REFERENCES `food_samples` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_destruction_sample_food_state_id` FOREIGN KEY (`state_id`) REFERENCES `state_list` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `diseases`
--
ALTER TABLE `diseases`
  ADD CONSTRAINT `FK_diseases` FOREIGN KEY (`group_id`) REFERENCES `disease_groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_diseases_disease_category_id` FOREIGN KEY (`category_id`) REFERENCES `disease_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `employee_passwords_history`
--
ALTER TABLE `employee_passwords_history`
  ADD CONSTRAINT `FK_employee_passwords_history_employees_id` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `emp_posts`
--
ALTER TABLE `emp_posts`
  ADD CONSTRAINT `FK_emp_posts` FOREIGN KEY (`status_id`) REFERENCES `status_list` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_emp_posts2` FOREIGN KEY (`org_id`) REFERENCES `organizations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_emp_posts_gov_id` FOREIGN KEY (`gov_id`) REFERENCES `goverments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_emp_posts_post_list_id` FOREIGN KEY (`post_id`) REFERENCES `post_list` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_emp_posts_state_list_id` FOREIGN KEY (`state_id`) REFERENCES `state_list` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_emp_roles_employees_id` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `emp_posts_history`
--
ALTER TABLE `emp_posts_history`
  ADD CONSTRAINT `FK_emp_posts_history_emp_posts_emp_id` FOREIGN KEY (`emp_id`) REFERENCES `emp_posts` (`emp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_emp_posts_history_organizations_id` FOREIGN KEY (`org_id`) REFERENCES `organizations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_emp_posts_history_post_list_id` FOREIGN KEY (`post_id`) REFERENCES `post_list` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_emp_posts_history_state_list_id` FOREIGN KEY (`state_id`) REFERENCES `state_list` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_emp_posts_history_status_list_id` FOREIGN KEY (`status_id`) REFERENCES `status_list` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `food_compose`
--
ALTER TABLE `food_compose`
  ADD CONSTRAINT `FK_food_compose_registration_id` FOREIGN KEY (`registration_id`) REFERENCES `food_registration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_food_compose_sample_id` FOREIGN KEY (`sample_id`) REFERENCES `food_samples` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `food_registration`
--
ALTER TABLE `food_registration`
  ADD CONSTRAINT `FK_food_registration_organization_id` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_food_registration_research_category_id` FOREIGN KEY (`research_category_id`) REFERENCES `research_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_food_registration_status_id` FOREIGN KEY (`status_id`) REFERENCES `sert_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `food_route`
--
ALTER TABLE `food_route`
  ADD CONSTRAINT `FK_food_route_director_id` FOREIGN KEY (`director_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_food_route_leader_id` FOREIGN KEY (`leader_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_food_route_registration_id` FOREIGN KEY (`registration_id`) REFERENCES `food_registration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_food_route_sample_id` FOREIGN KEY (`sample_id`) REFERENCES `food_samples` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_food_route_state_id` FOREIGN KEY (`state_id`) REFERENCES `state_list` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_food_route_status_id` FOREIGN KEY (`status_id`) REFERENCES `route_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `food_samples`
--
ALTER TABLE `food_samples`
  ADD CONSTRAINT `FK_food_samples__country` FOREIGN KEY (`_country`) REFERENCES `countres` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_food_samples_laboratory_test_type_id` FOREIGN KEY (`laboratory_test_type_id`) REFERENCES `laboratory_test_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_food_samples_sample_box_id` FOREIGN KEY (`sample_box_id`) REFERENCES `sample_boxes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_food_samples_sample_condition_id` FOREIGN KEY (`sample_condition_id`) REFERENCES `sample_conditions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_food_samples_sert_id` FOREIGN KEY (`sert_id`) REFERENCES `food_sampling_certificate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_food_samples_state_id` FOREIGN KEY (`state_id`) REFERENCES `state_list` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_food_samples_status_id` FOREIGN KEY (`status_id`) REFERENCES `sert_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_food_samples_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `food_sampling_certificate`
--
ALTER TABLE `food_sampling_certificate`
  ADD CONSTRAINT `FK_food_sampling_certificate_state_id` FOREIGN KEY (`state_id`) REFERENCES `state_list` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_food_sampling_certificate_status_id` FOREIGN KEY (`status_id`) REFERENCES `sert_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_food_sampling_certificate_verification_puposes_id` FOREIGN KEY (`verification_pupose_id`) REFERENCES `verification_purposes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `individuals`
--
ALTER TABLE `individuals`
  ADD CONSTRAINT `FK_individuals_soato_MHOBT_cod` FOREIGN KEY (`soato_id`) REFERENCES `soato` (`MHOBT_cod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `legal_entities`
--
ALTER TABLE `legal_entities`
  ADD CONSTRAINT `FK_legal_entities_soato_MHOBT_cod` FOREIGN KEY (`soato_id`) REFERENCES `soato` (`MHOBT_cod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_legal_entities_tshx` FOREIGN KEY (`tshx_id`) REFERENCES `tshx` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `fk_message_source_message` FOREIGN KEY (`id`) REFERENCES `source_message` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `organizations`
--
ALTER TABLE `organizations`
  ADD CONSTRAINT `FK_organizations_id` FOREIGN KEY (`id`) REFERENCES `organization_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `post_list`
--
ALTER TABLE `post_list`
  ADD CONSTRAINT `FK_post_list_def_role` FOREIGN KEY (`def_role`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `regulations`
--
ALTER TABLE `regulations`
  ADD CONSTRAINT `FK_Regulations_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `FK_regulations_status` FOREIGN KEY (`status`) REFERENCES `status_list` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `FK_regulations_type_id` FOREIGN KEY (`type_id`) REFERENCES `regulation_types` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `report_animal`
--
ALTER TABLE `report_animal`
  ADD CONSTRAINT `FK_report_animal_cat_id` FOREIGN KEY (`cat_id`) REFERENCES `animal_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_report_animal_report_status_id` FOREIGN KEY (`report_status_id`) REFERENCES `report_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_report_animal_soato_id` FOREIGN KEY (`soato_id`) REFERENCES `soato` (`MHOBT_cod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_report_animal_status_id` FOREIGN KEY (`cat_id`) REFERENCES `animal_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_report_animal_type_id` FOREIGN KEY (`type_id`) REFERENCES `animaltype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `report_drugs`
--
ALTER TABLE `report_drugs`
  ADD CONSTRAINT `FK_report_drugs_cat_id` FOREIGN KEY (`cat_id`) REFERENCES `report_food_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_report_drugs_soato_id` FOREIGN KEY (`soato_id`) REFERENCES `soato` (`MHOBT_cod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_report_drugs_status_id` FOREIGN KEY (`status_id`) REFERENCES `report_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_report_drugs_type_id` FOREIGN KEY (`type_id`) REFERENCES `report_drug_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `report_food`
--
ALTER TABLE `report_food`
  ADD CONSTRAINT `FK_report_food_cat_id` FOREIGN KEY (`cat_id`) REFERENCES `report_food_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_report_food_soato_id` FOREIGN KEY (`soato_id`) REFERENCES `soato` (`MHOBT_cod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_report_food_status_id` FOREIGN KEY (`status_id`) REFERENCES `report_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_report_food_type_id` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `report_food_images`
--
ALTER TABLE `report_food_images`
  ADD CONSTRAINT `FK_report_food_images_report_id` FOREIGN KEY (`report_id`) REFERENCES `report_food` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `result_animal`
--
ALTER TABLE `result_animal`
  ADD CONSTRAINT `FK_result_animal_sample_id` FOREIGN KEY (`sample_id`) REFERENCES `samples` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_result_animal_state_id` FOREIGN KEY (`state_id`) REFERENCES `state_list` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `result_animal_tests`
--
ALTER TABLE `result_animal_tests`
  ADD CONSTRAINT `FK_result_animal_tests_result_id` FOREIGN KEY (`result_id`) REFERENCES `result_animal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_result_animal_tests_template_id` FOREIGN KEY (`template_id`) REFERENCES `tamplate_animal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_result_animal_tests_type_id` FOREIGN KEY (`type_id`) REFERENCES `template_unit_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `result_food`
--
ALTER TABLE `result_food`
  ADD CONSTRAINT `FK_result_food_org_id` FOREIGN KEY (`org_id`) REFERENCES `organizations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_result_food_require_id` FOREIGN KEY (`require_id`) REFERENCES `requirements` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_result_food_sample_id` FOREIGN KEY (`sample_id`) REFERENCES `food_samples` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_result_food_state_id` FOREIGN KEY (`state_id`) REFERENCES `state_list` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `result_food_tests`
--
ALTER TABLE `result_food_tests`
  ADD CONSTRAINT `FK_result_food_tests_result_id` FOREIGN KEY (`result_id`) REFERENCES `result_food` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_result_food_tests_template_id` FOREIGN KEY (`template_id`) REFERENCES `template_food` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_result_food_tests_type_id` FOREIGN KEY (`type_id`) REFERENCES `template_unit_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `route_sert`
--
ALTER TABLE `route_sert`
  ADD CONSTRAINT `FK_route_sert_reciever_id` FOREIGN KEY (`leader_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_route_sert_registration_id` FOREIGN KEY (`registration_id`) REFERENCES `sample_registration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_route_sert_sample_id2` FOREIGN KEY (`sample_id`) REFERENCES `samples` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_route_sert_sender_id` FOREIGN KEY (`director_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_route_sert_status_id` FOREIGN KEY (`state_id`) REFERENCES `state_list` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `FK_route_sert_status_id2` FOREIGN KEY (`status_id`) REFERENCES `route_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `samples`
--
ALTER TABLE `samples`
  ADD CONSTRAINT `FK_samples_animals_id` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_samples_sample_boxes_id` FOREIGN KEY (`sample_box_id`) REFERENCES `sample_boxes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_samples_sample_types_id` FOREIGN KEY (`sample_type_is`) REFERENCES `sample_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_samples_sert_id` FOREIGN KEY (`sert_id`) REFERENCES `sertificates` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `FK_samples_suspected_disease_id` FOREIGN KEY (`suspected_disease_id`) REFERENCES `diseases` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `FK_samples_test_mehod_id` FOREIGN KEY (`test_mehod_id`) REFERENCES `test_method` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `sample_registration`
--
ALTER TABLE `sample_registration`
  ADD CONSTRAINT `FK_sample_registration_organizations_id` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_sample_registration_research_category` FOREIGN KEY (`research_category_id`) REFERENCES `research_category` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `FK_sample_registration_status_id` FOREIGN KEY (`status_id`) REFERENCES `sert_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sertificates`
--
ALTER TABLE `sertificates`
  ADD CONSTRAINT `FK_sertificates_state_id` FOREIGN KEY (`state_id`) REFERENCES `state_list` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_sertificates_status_id` FOREIGN KEY (`status_id`) REFERENCES `sert_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_sertificates_vet_site_id` FOREIGN KEY (`vet_site_id`) REFERENCES `vet_sites` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `tamplate_animal`
--
ALTER TABLE `tamplate_animal`
  ADD CONSTRAINT `FK_tamplate_animal_diseases_id` FOREIGN KEY (`diseases_id`) REFERENCES `diseases` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_tamplate_animal_state_id` FOREIGN KEY (`state_id`) REFERENCES `state_list` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_tamplate_animal_test_method_id` FOREIGN KEY (`test_method_id`) REFERENCES `test_method` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_tamplate_animal_type_id` FOREIGN KEY (`type_id`) REFERENCES `animaltype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_tamplate_animal_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `template_unit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `template_animal_regulations`
--
ALTER TABLE `template_animal_regulations`
  ADD CONSTRAINT `FK_template_animal_regulations_regulation_id` FOREIGN KEY (`regulation_id`) REFERENCES `regulations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_template_animal_regulations_state_id` FOREIGN KEY (`state_id`) REFERENCES `state_list` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_template_animal_regulations_template_id` FOREIGN KEY (`template_id`) REFERENCES `tamplate_animal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `template_food`
--
ALTER TABLE `template_food`
  ADD CONSTRAINT `FK_template_food_laboratory_test_type_id` FOREIGN KEY (`laboratory_test_type_id`) REFERENCES `laboratory_test_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_template_food_type_id` FOREIGN KEY (`type_id`) REFERENCES `template_unit_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `template_food_regulations`
--
ALTER TABLE `template_food_regulations`
  ADD CONSTRAINT `FK_template_food_regulations_regulation_id` FOREIGN KEY (`regulation_id`) REFERENCES `regulations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_template_food_regulations_template_id` FOREIGN KEY (`template_id`) REFERENCES `template_food` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `template_unit`
--
ALTER TABLE `template_unit`
  ADD CONSTRAINT `FK_template_unit_type_id` FOREIGN KEY (`type_id`) REFERENCES `template_unit_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `test_method`
--
ALTER TABLE `test_method`
  ADD CONSTRAINT `FK_test_method_status_list_id` FOREIGN KEY (`state`) REFERENCES `status_list` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `vaccination`
--
ALTER TABLE `vaccination`
  ADD CONSTRAINT `FK_vaccination_animals_id` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_vaccination_diseases_id` FOREIGN KEY (`disease_id`) REFERENCES `diseases` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `vet_sites`
--
ALTER TABLE `vet_sites`
  ADD CONSTRAINT `FK_vet_sites_soato_MHOBT_cod` FOREIGN KEY (`soato`) REFERENCES `soato` (`MHOBT_cod`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
