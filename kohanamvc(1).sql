-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Янв 17 2014 г., 00:17
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `kohanamvc`
--

-- --------------------------------------------------------

--
-- Структура таблицы `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `body` text,
  PRIMARY KEY (`id`),
  KEY `title_2` (`title`),
  FULLTEXT KEY `title` (`title`,`body`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`id`, `title`, `body`) VALUES
(1, 'MySQL Tutorial', 'DBMS stands for DataBase ...'),
(2, 'How To Use MySQL Efficiently', 'After you went through a ...'),
(3, 'Optimising MySQL', 'In this tutorial we will show ...'),
(4, '1001 MySQL Trick', '1. Never run mysqld as root. 2. ...'),
(5, 'MySQL vs. YourSQL', 'In the following database comparison ...'),
(6, 'MySQL Security', 'When configured properly, MySQL ...');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `content`, `date`) VALUES
(1, 46, 15, 'asdasdasdads', '2013-11-08'),
(2, 46, 15, 'asdasdasdads', '2013-11-08'),
(3, 46, 14, 'asdasd22221', '2013-12-12'),
(4, 46, 13, '123', '2013-12-12'),
(5, 48, 13, '123', '2013-12-12'),
(6, 50, 13, 'цйфуфывфывфывфа ф ацууууууууй', '2013-12-12'),
(7, 50, 13, 'ыфвы ф', '2013-12-12'),
(8, 50, 13, 'Собщенние\n', '2013-12-14'),
(9, 50, 13, 'asdff asd asd', '2013-12-14'),
(10, 50, 13, 'asdasf fasdf', '2013-12-14'),
(11, 50, 13, 'wqw334124 124 ', '2013-12-14'),
(12, 50, 13, 'asdsad 34231', '2013-12-14'),
(14, 50, 13, '235325 3 ', '2013-12-14'),
(15, 50, 13, '51251233', '2013-12-14'),
(16, 50, 13, '1512 551254', '2013-12-14'),
(17, 43, 13, 'asd ', '2013-12-14'),
(18, 50, 14, 'asd aseqe 1 RJVVEFADSF', '2013-12-18'),
(19, 50, 13, 'репчик йоу', '2013-12-31'),
(20, 50, 13, 'это жесткий репчик\n', '2013-12-31');

-- --------------------------------------------------------

--
-- Структура таблицы `mails`
--

CREATE TABLE IF NOT EXISTS `mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '...',
  `sender_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `sinopsis` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `read` int(1) NOT NULL DEFAULT '0',
  `date` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `content` (`content`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=93 ;

--
-- Дамп данных таблицы `mails`
--

INSERT INTO `mails` (`id`, `title`, `sender_id`, `recipient_id`, `sinopsis`, `content`, `read`, `date`) VALUES
(54, '...', 14, 13, '', 'asdads', 1, 1388866074),
(55, '...', 14, 13, '', 'фыв', 1, 1388868185),
(74, '...', 13, 14, '', '333', 1, 1388870164),
(75, '...', 14, 13, '', 'asdasfd', 1, 1388916837),
(76, '...', 14, 13, '', 'asdasdads', 1, 1388917028),
(77, '...', 14, 13, '', 'явпвпы', 1, 1388934332),
(78, '...', 13, 14, '', '222dsg', 1, 1388934361),
(79, '...', 13, 14, '', '111', 1, 1388934367),
(80, '...', 14, 13, '', 'xf', 1, 1388935040),
(81, '...', 14, 14, 'asd', 'asd', 1, 1389907253),
(88, '...', 0, 0, '', '', 1, 0),
(87, '...', 0, 0, '', '', 1, 0),
(85, '...', 13, 14, 'ОТ 14 к 13', 'ОТ 14 к 13', 1, 1389907813),
(86, '...', 14, 13, 'ОТ 14 к 13', 'ОТ 14 к 13', 1, 1389907907),
(89, '...', 0, 0, '', '', 1, 0),
(90, '...', 0, 0, '', '', 1, 0),
(91, '...', 0, 0, '', '', 1, 0),
(92, '...', 13, 14, 'Привет!', 'Привет!', 1, 1389910474);

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `content` varchar(240) NOT NULL,
  `date_published` bigint(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `content`, `date_published`) VALUES
(27, 10, 'hHHGKKK<br>\nddddddddd', 0),
(28, 10, 'rgrgrgrGGGGGGGGGFFFfggdFF', 0),
(29, 10, 'ddddGGGGGGGGG', 0),
(32, 10, '<b>Новое сообщение</b>.', 0),
(33, 10, '', 0),
(35, 10, 'cff', 0),
(36, 11, '123sssаааа!!!!', 0),
(37, 11, 'xcc', 0),
(38, 11, 'ddfdef', 0),
(39, 11, 'трололо', 0),
(40, 11, '', 0),
(41, 11, '', 0),
(42, 11, '112233', 0),
(43, 12, '123', 1387221152),
(45, 15, 'Собщение!', 138426152),
(49, 13, '213', 1387226152),
(50, 13, '456', 1387226152);

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_name` varchar(240) NOT NULL,
  `title` varchar(240) NOT NULL,
  `description` varchar(240) DEFAULT NULL,
  `content` varchar(800) NOT NULL,
  `language` varchar(2) NOT NULL,
  `date_change` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `content` (`content`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `page_name`, `title`, `description`, `content`, `language`, `date_change`) VALUES
(8, 'why_site', 'Why', 'Why', '<h2>Why</h2><p>Why.</p><p>Why.</p>', 'en', 1384382346),
(9, 'why_site', 'Навищо?', 'Навищо?', '<h2>Навищо?</h2><p>Навищо?</p><p>Навищо?</p>', 'ua', 1292937495),
(7, 'why_site', 'Зачем?', 'Зачем?', '<h2>Зачем</h2><p>Зачем</p><p>Зачем</p>\n<p style="text-align:justify">\nКонечно, в команде у вас могут быть те, кто быстро соображает, хорошо говорит и обладает перфекционистскими взглядами. Однако если только эти люди не предоставляют конечные товары и поставляют их непосредственно потребителю – или делают именно то, чему учат других, – тогда вам придется все начинать сначала. Всегда руководствуйтесь результатом и выбирайте тех, кто его достигнет.<br/>\nВы не идете в бой с той армией, которой вам бы хотелось, вы идете с той, которая есть. Но если сделать все верно, вы поймете, что обе этих команды – на самом деле одна, несмотря на возможный недостаток ресурсов.</br>\nИллюстрации: Everett Collection, shutterstock. Оригинал статьи тут. Перевод компании GreenfieldProject.\n</p>', 'ru', 1331492833),
(6, 'contact', 'Контакти', 'Контакти', '<h2>Контакти</h2><p>Контакти.</p><p>Контакти.</p>', 'ua', 1292937495),
(5, 'contact', 'Contacts ', 'Contacts', '<h2>Contacts</h2><p>Contacts.</p><p>Contacts.</p>', 'en', 1384382122),
(1, 'about', 'О сайте', 'О сайте', '<h2>О сайте</h2><p>О сайте.</p><p>О сайте.</p>\r\n<div class="hero-unit">\r\n        <h1>Привет,мир!</h1>\r\n        <p>Vestibulum id ligula porta felis euismod semper. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>\r\n        <p><a class="btn primary large">Больше »</a></p>\r\n      </div>', 'ru', 1332015256),
(2, 'about', 'About Site', 'About Site', '<h2>About site</h2><p>About site.</p><p>About site.</p>\n<div class="hero-unit">\n        <h1>Hello, world!</h1>\n        <p>Vestibulum id ligula porta felis euismod semper. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>\n        <p><a class="btn primary large">Learn more »</a></p>\n      </div>', 'en', 1332015209),
(3, 'about', 'О сайті', 'О сайті', '<h2>О сайті</h2><p>О сайті.</p><p>О сайті.</p>\r\n<div class="hero-unit">\r\n        <h1>Привіт, мир!</h1>\r\n        <p>Vestibulum id ligula porta felis euismod semper. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>\r\n        <p><a class="btn primary large">Learn more »</a></p>\r\n      </div>', 'ua', 1332015284),
(4, 'contact', 'Контакты', 'Контакты', '<h2>Контакты</h2><p>Контакты</p><p>Контакты.</p>', 'ru', 1292937495);

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`) VALUES
(1, 'login', 'Login privileges, granted after account confirmation'),
(2, 'admin', 'Administrative user, has access to everything.'),
(3, 'participant', 'Participants');

-- --------------------------------------------------------

--
-- Структура таблицы `roles_users`
--

CREATE TABLE IF NOT EXISTS `roles_users` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `roles_users`
--

INSERT INTO `roles_users` (`user_id`, `role_id`) VALUES
(13, 1),
(14, 1),
(15, 1),
(14, 2),
(15, 2),
(13, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(24) NOT NULL,
  `last_active` int(10) unsigned NOT NULL,
  `contents` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_active` (`last_active`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `sessions`
--

INSERT INTO `sessions` (`session_id`, `last_active`, `contents`) VALUES
('52c93161199fc8-54022698', 1388917767, 'I2DnhHtMpHBfwiFqFyplmR9Ty5FVwFQm7tms+uRIJ5niSdtcv0JSruHa6JNXtrj2pPq40Cu5+ZsVu9eCNv0x+DuNU3xp5Vp0EY4picAOq8z/7y54ej9bqKHX+nSawaZDlEUPFMtoT6ijN4SYUhfmujO1t2Q1JxDJOsQNQ9FL/OE9YNwl6Zd1XSJ2vH4KC3D/EEdb6ajGdvKUY2/kBEtSJWTH5x7ourJlBo31dia5UWuqImki+xDbYNWzE0iG1f5Ff0m2cYym+IMh1oZteK5WpMfldwuJnX/fdDLxBE+MOSB/UjOnJzUjMpehZgJeq74HQpfIM5igw/caqJsw93JzO5L5WnmqycLN4spZkyNJggOuGYSdJfGGMKxYlOEKNrVz7SQXdQqwheS1i24OkwXJvL/dJIrY1RyWn7ABpAc/bUvfwjor4za4DfwRL7OajzwKXgybmLttW6CLuCj9xNrqDTqZ/MeCL1xTpY1XFrnyNhknf/VFjjqdCSfEDQYDHPLRiYo2RzFeTSPXhw/BvqLGJfZEd34M6jDkmtIy0j1R9RF+A1mEPaKjAag9xApyknyiR0dzCCKR0fOv+dFSKsl49gP6T6iRbtZo80gPH3i+P0jvstM7LjeMnpvQrCrqkr1VW5vsFae9QCzXqf8aoYisadNYbuSZqtpD00k9lqX0iLfe7+FSr0w2AdICkFAJO8ZNF6wTP9V2t9QT9mPuzWGaWV7XlGZP3h6gVPAmxSYV21m8DQC21Upgg3IL1SlWlYROZT5N6SV3T57vd68OQSjuqXplzZQrKRgEgHKvxLpPFH99t/dv/9gAqdI09NEZgdt5j7xRVN575IziRV1p2rBT5O9b737W/VWCSBbKhwgHIC5zqg8R/f9tB1RHRpRuVtB0m03c3nayr0OzEuXYNHxHnolopFR6TzTJh0sE8w8b4hT8UFx6SlGBBUvUOU0Nv4WMkjbvrhZI3BclKbYWTrBxr2oxPblxnBXpSPhZuLZgEWTGDxpXsaj4DatEyPatP+OwH2uM'),
('52b9d643bfef67-37248869', 1387917480, 'WZpXOMqpdhTx0+6/dmIpQkBRFhDwfj5uCyPHQSSTrNmDj7v57qzFXrzBUeGXGo9BIxNOYc901VaLBCi3kOGjbp5q17mDpZgt125gctzl/MGxeVqh3sQCLQULgiBJr3r7Lgdjh5Y++vs4kM25bJEZixv/GiQf4ePRcBL5hsH7FC0PlSxzg+Nt8tDxrnGop9u5CcjBhtQAfVx/crQXJPpUuP1Uc5dIXmCPhK5Ad75NwARyZk9GLjeMNU+mKzM5R3K0150Z72sd4gQMJj5zvbnxS9U0MMA8whZFqNaHic1OafrVAn79rucEkqu4WhaWk13yX9JX6zWqbX0tWlMMa35dGr/WOLSWgevibp7UY++F3BhUGGBci18ISC/bhItBt0Pq+kpE3tDmlnp/QuBaDXb0Zby1oDs4wniH9dHYLxHb+1UG+8Eo9gVNMbAV/px9Z2iG5J7IbEs4bcVsjptHw9DRp/qA3RoIFPcee/o7d94gwymxy1ddZvJiWlO+1atqgNiPEszX3P/Xcfog7j7Pa6GXgZEo53xZ3ACRUiEk0Dh1S3tX2Vg+LxQWleBZxBDpggjxnCc9KskE5EfLNWJra66ULsIS08l1hWchyP+c0+z6dwL+a7MRDvxAmuHAc6L8AJlg0ZLSIxzYKxsPU062h2Df7pqLS/+IxqdnPOHb2Izi31GsPuKKLT0YRkrL5t4/GUeCDV6JJ/pdu7jonSBPRHMti8LFwwzsDWfTpibwTF8u+A91DymeunV8NKzMRrXhoj/1A4V7Tm9z5man5ZpPTg5O79yYO2JhPrq8bRHIp6Jr5EKWQFDHysO9UH+PrjB4PQBDynoVd/EH3vDQuvtiSnithFj2M6PWBmo6Rk0qWgHmdVJ4NBG/WZhC3oXVAe1SlMFaI61U7vEquKHkBMChMYRdR/lpBEDoMgNhS+zCjDim4f+YUBtBw0mksMsxQsfHekACQZFMegkEq0a3EMwCmyhTkJ3A/YWHgn1sTaYgq+eq/9ZbsESU7d4V5jmP82872E2UgoctUxiA'),
('52ba025cb592b8-05489711', 1387922012, 'V2rJFjSR84/fF4LJYiE8rfCdKv2gkMPeRMQCXjyaWbbvUU6bhfrbq/fT0j0VbKvhHfT+oo0GZO3t+8klslYyJHGaaXUFBj9vhg+ucMK4cjSMsB+66ChKjoW4RF1DHkGGBP/mFfkVVuPVnvqZinHaljj4B5at7mNCUOdv6HTa4uifnwlmby3o4sH17YHFuWsstk3/AN75ehLNJeAC/F3Pzyi7pECm0EN+egAW70XUhYN2BsDVjScNy+izwEEj8PK+8ETKrmzk+inK8G9UVn50veZLSBul10o3se6T3OCeXxYsfoVS3ra5LjvgExHe4ADND0BhyGX2WBnKTOpJf5sd4ULHgoDm/+gvYFppSq3w7pkTX+Q7qHrlL0zicS0d7Rpy5KyRwrlupaKEJiCqFcthX6F/i7Y1NRd3WYxp9RK2oP0ke9rUb3NLHOURCm3y5blWAU0Wi0xzEzfQtEZyohGsdXWshbWnMPFIj5ShHwQ1Vopr0IhMs12BlQNto5G8hmsHTApu9YZJtl8cnHYRedJtWdnF97j+8pBAFZCNffR5n0a006s14nLza1TMeNneNkol3ND7rLlkChfGRHMeBkZCtzHdTdkhbyS92zFYiBofTzcWPq9k30YPhRtHcbzmQ0eFk88SEz+nb7MCm/e2ERCFU/ze1hh9lPZdu963MfpMbrrz+z4weMv+RNw4XCvY9pA57N6wsPNqX8f4mrnp/a2Oja57lqcTXkx4iSREkaO193ivrRJYPjvULt5TscYm3oxq2ERj4KB0+ipf00XuVt3R0JLzUs2PWG4WGoycDgWzkYKI1a9lwyHTue9/54+/5HxVGNafAp/g0/Y7fAf9g97gdRIp6pa0LQC60y0pmkWmA0lzDrV37mvYGp/ULsWPo23TFp/fn394GgwK8DvbsQiAqxQHHuhDOheWWO4/ZxbqI8Of0PH5GP1sfSRq10rIynXw6gnRcmoB6+QR1lKgePuv0D20oK1mfaNDQY+tkGuSLX7l280P6yxpGYzqOiRe4lvJ3XTUcY/adt+N/bB2akx5'),
('52bb232a6524d3-15431638', 1387995946, 'zO6lZOejI07b3cziLkXqh55Rhr16VrTANUSzUWRdJ+xxCU8aw0iIBaOvrxcd2UJJWZwFhNwkvb3jGQwwUQ8kYIuoY+amHbnqyS1nQ6LambUtqF1ePA=='),
('52bb298ad18123-43972760', 1387999203, 'QYNpHME4DpBN9fKRLCUfSZRh9XVM1YjTeUjb5n7fx2DfrA6ZS02zZr41pApwmvK1HcbRGlV1UH6khVgTXKqmhvgpA8XdxODIzHv6LkGJZa5uR0NChLZf4Nh1gqai4SOZUTpPcdvqgYlAyBctJDBErIzBWRYS5mBsKQtaLM5je6d4X5NUFRNeGMLpm7Bof9C7bU579llELDaqZnGPjMVPNUGXc2Kq8Z2CSgxJ8SDmGGtQOaDZkeoRAMaxBlw8c2Cl60CUnNJECrr+dcrWSuRArF0dCRNfW2fpYF+t0arCXpZ7b+3S8jhwpY46NAZ4PSgfBNMsCZ5Riq0eK3232Gc6sTBTrI7T0CgRn8mQQ4GA2OQRoQoh/NaOiofaItkdun+OEnjoyNMiQaq99lSdSB6FFW2eGZ8XGEBKC/w2K5gA+BnHeq2p+nVCqnYzjx0U/n1qsKZppCrau305+8eBE07AFartcWDMKhVESoSHEeI/gnX5MBNqgNR+wdwJBAKv82O6/AK5fAFmKO/+l2m0TVRH6eJyKOspDDnEW9vAufqJopIJpuwuakIMdqZLq9mzG9/JuAI4VtXR0kkyqGq63bZPsCqbSZk68SWOk34YCzndB3g3us9X0W4RD/JkEHw+8YsboGnmkn8ycqyKe1/kJuS+lYLbFdueIKnAqN2xFaQEZkiI5Utfa1U8pZQnxW6/qrMc0AZI5sAU01WJgCSYvtXO5qrjcb94rGiWp13mNkCrbEaoHbFaCnhQ0O/uvoMJlYCRyShdJX+32EZbgUwqjJBasKpa/m7nQ7bd6MaT5nxs2dUUcZVVJpuXmQkNO6ehH2pGRHL8sJIWoTYmbLofb7j5pRaFOlKjVeG+D6f7n6K+uhRcb4erzmgJBHjZApdy9HxcAuUAB0WJJWvZdXjQy4uHY+Hek1+ygDJC5sxtOhrELg8vELmNLTdlWn/bNjLUccjsi2ZG8O2fFZXYEvBusFDs6MYNiwcXlfIEc/mYM+csceqbpKWe1s9/jqhxVJMoD0fx5KTDMApoYqCLzv8Z+VAf'),
('52bb45b8b868b0-28020729', 1388004793, 'Oep1tNRG/LjLO5RZZTJDvvtg5lmKqAEmud3/CFputS2fG3j2majyQ0O39hL0zsNTEU6z82KN8XEcVL5/HqP+nIX1vbPVVs0T6OCmWs6z121L11C7YDhaF/8+fho42v2DGCK2LXnzpOYSbzSiRXQ/FhE3Iv4oTre2bFby8EmdVc3wPmtvdhWW352MiNiYrWpJHBomJReWSF/rIAjWynvUzJm89WI7nv5GNtwExoBlVZgMs6vc+uOt1y/LDZnQqadc2JHayS8ZFKUIdpAIpbEPiHiMCs0A8EETXFAiCH982DePe9ALDmG0ukdHVZqdOPdnfwDz8bQ97RnXI9TE7GiRmrWZCiLtkU6gXjTt2Tdclf2R3icidDvV9rlUYPOsPdHGCgSiESVjlvr4rDnJt/3CEgVCTpWc9sKu9HodKxcKyN5zS82w/w2hUk1c3h3IfMg1EfWqVPmimH6+fhhViOOOIGVq0nP98DLipuGN+7JLms4NrmcArbCsPNYXqkiecRf2muJN5jQq+YmensrmRr4BowQ9wUWB5dKpA100Z1KlKaWakHl6ei4KxFOaGyUI4PlBK8agYmXI9EwMTW49FGbI1Wi5N5zAtfMgka7dz0ml6+vEdR3ksqCmYXMQ6qjlAv9bUnxmk3RBBtQLtrDQYyvHUZKLhSk/bWkpRC/acLCrc4U692jSVQaZhq0Ye6yp+xQzK7B1iouC0sTiFkSsKhdJByY0hL4eFxbeicYbRGs/mf3xqkuGCEO3W4mqjGQhM6FfsaWVcCBKLxUyUZZbuE8sADJbtGB38SjiP5f17AVgvhfKx9mC7bCHgoKiCdlibjHAmVgD7zUpVRk0W72G2YxIXyCU22LQbIDCh+yXRnYWhKtux37Vb6Viny/OtBsbhR6f2uLFV1+hoc3w74WfTeQYbgnlcP5gG5pXTKN1eAiFXHrqJxJ9zjhnLeRy0GFYr59VsMai7VPK0eaYZ9ZbTrjkiofEunoZ1etbGdwTQvh18081ifFz6eg9phcHcvsil7Mc4oKy4/SBbdCehE2EJkGhIjxFZPxieiXl5ihevUJNB7MqBUxxdRMGhMIJWmfQHpyzpiH10y35IIFmbGQIvOJ8nwkRp/hqe0MG3izWiq+vPdrwzPM8'),
('52bc91281bc787-80571076', 1388089640, 'Ox1NmkQFnKxMOgDvXOU/TRMpfOf2NQuUe1WxlGIO8otQhRr8MzeD2H+hSQ2o6G9pgr/DKyc23N5Z70eXtK9S522yUsl6Vf/EzkXdVE3A0I96j+FR'),
('52bde87ef39948-10493579', 1388179696, 'RrDKIYLe3xMRfjy5u3dnvkDgJbIySvJkxf/54Ok89IE9T7mtcq1H5mSUqwARzE95kNiLELJEEgYxLSxNfXDmPF5jedHMaD92I1iWLWHywqN7Gt1tlXLzSc+YGhXdpciMerJvqhaV00SABXHzKfYv2Nn3sGr7NhX/C7vmKK2d9ivw9vfWR8nQBEIIv31QbWrT1U6agZzmMLqUDUH4RixtIbw5BSZGfVTNAabntsffStP8YVaWO+BU4H8/FeF8p/q/Cr8aKFoRmbA+3IjiQCfFD5vHAGgvwoZpjpj+LAbKHHgeInGxML3mvq132plA8tmrLq8DL8YPPfmwvMrVViY5xsZqWXdJ/OAPEiwCCdK6qoKgEA0sGqjkhwuaZChWb/bfOtd/gRF7ZoOwNNp3PIjBb3dMbd7atb5G4x3VssA0JK8C2k093JFOIhvaKATQ1tQnyhVVS19BP8EZu7mRaIDclg7WbJn6PXMjD3vMIhXk+8DNx7NE/iByLw9+c2pkDfcXhJNiWdTMnNvZ3LQ8WIfb3pjFOve+hROViFfc6S+9AonvQvgItsurLauu0IPRZTPVNPS4e2jyvj/2pEy5BqFB5a8X5USgWL6giWjRVREvLBrChmNfOdY/JNBmZXoLKuW6SnJcx+RdU4NH/4poEPUnykr0oJbOa7Vfe4rWyeMGGcNn22FHy3YxevKyDouiaf/CGF6eTkg/qva8IG8qq2TTfgxz2qyDOBiUqFvOcLlDZXlq07jlAIqepcdzwcBmoSBSukjJ4XwOPtAUOiTuc1ZwnPEsmhKiIE1knTWhHmoG7ELeewQf79k/hE4o/i2q+eiHr6tR9ELiE4JTYvCsIvVYuFJY/7r5ppjwBW9FvVvAF6haRUhhV4NmJfnpHWdgYsCJCKo1tvx0Ih4mBRIuSfJqL4cU92IvwZJOVWxPNJnEiRGiSiPSPA5zGzCg7NI3R8vSwLwByMrpMclHgjefNcaAF96ScwixZv2G5+Ny/qE1U1yx08codkLSiPG7IpKuDdEE'),
('52c2d26de88ef2-98172524', 1388499920, 'MaCUf+/Kx/nYnlqhNoNUnlu0d5xnmQReP1F9nEg2Q/TQYCwvViY99KGbS5OEnVaVHI3Vqp4PPcooEoLBJ3RnCmA8wHFEXY1gdZyV8EP8uefGM7zTL1p4lLF6R4VkRgftPIqEgoOQCY/EOn+g/cUJAezUYtvate36BwzR/41J5Ef0NUGuc1oEwqjXlAygXGpLUaOgDNnxOvQefYe4Wdt+jYZ6TotQjp4mCpXZvFOr8UyAZ9detPbhzHrfni2m0OmRYpl6O59AcIDpsJLK90lA1aPMWGM7BueeWxweGeeaB98XcJtZpbWrae2Rf9IpPxfJTZ8gq6OPjrWwEq6Kyl71cxCDlj7k6KpqDE/BM0MsBOfqnAboKp/1v9f27vnqonZ97dJiNKfGgXs7OqdAoHDVLqf7XZUqbnA5MDexFhqPjNEix/fkEVtWesOypfY4jM0GxUpRBGqiUUoLioC3c4N4pyOYqjfv7UjQPgJFnrqxaMT+WAo20cmrcWDIyICyckUC+b0nmb1Ei2EngOFPb9AkH7b/khwebvAOEAbfz/ZHH1wfwJkn0Qmmdxukkr7C8P9yVAurtgBv5U2LbhTfAR9fKKVvIHj4tV/w2C5cYNeIm+OhXH4+jGoK9c0aM75UzseBsrvzFh5ehW0GgX7f/E5K/zdXkyVR9S7KRn2KD295bstwlhXKMXPmrJhsuq9qVI6xWUHBTa8Yp1XWTVneQWBSGF/dGUYFd5wRAFYpkQU56yMoesp54hrki12Tv7RKx9Wl10buot8SLWOQIs9Tfyzg+rJoe/4XjWXLh5Iin9sEen2KZFUxZIUHvjuz6+EQEnN7XiYSvmM1+8a5XVjJ6ravsJqQHdH3fYJaxIetpe/qLXOh2hBtSjC7l5IQygEpGKQn9ggsvnQaxxGBhgtjQFa6pofIXL+f2qBN+Wg5vCB0Td8l0w5ydeC4qj1m94GEdld0pTHIMaEkAIN2XWf+hX8HzH66THlUBNS1pBEC9tyy8eZ6ivbcORi/uhpQR6NCVoNaff2fx8wZGt7ga2iN69dT'),
('52c557a087efa0-84396616', 1388669310, 'oAAUm7rp4EzL+fdGXNej8YwhaArr/LS6nNL7ek3qyBoq7gGfc1L39eKs4SNEb4evnzsi1mUw2m43TEDmhmvtb8HLeeJrljYGkiF4ouZekUHkXqqEg4THoVBghdaCBWr9EPYl3PvCrJ9QUWozdOur/SqBPCCZ+Yl3LG50/6fe4NyWmP3ySiJIZ4K31e7rpNJ3KbB9/ht/tyJDw3ax7He1XDSIMFby+7D/urqY1cRsSF+ZT/8P1auc9ZVqkNCFXljfCIhDeKaYfNcn45mExzK8maPtA71wEMBbcQmI6JNLJQf4Wrx/rFODHH99AO9p9YE3oVDqnGcJQ5moVeAGSQd72t8RaUfxfqHM2MJHUuV4NYbeyS5IdkiWpTj/18ON8msSJl1JZxTFIDwkMQG6PD4GK+jrLd8YGrnHHniXwkD+u5ht4bcG2krYuGNNYOThdgtWxIwIj/ubUqDVFhbMk50wZ+i6E5ZKRE7eE1m/oQ0f7o7VOOZMlCK24q5GHczdaVRRBhaObR7+z73/QenLD1WFiXAiRb23aS6OzTfBS8RXaR7dYsqF4t/9IhlkPOhyR9e0ARgk5mMBkcYU1qtgOSVudmuspjf7SBmD/Eg0KbaRhU8T3gRt/JnQXRfWERY69hg3Aw8mLyLRIG/3bUTsKRsO0oAoBUaW9LCgh6Cwjpa2xkxWAvK2E7RTo6CVNADTXIBn9YXPj3vQnrqhpEVxu2Z2hUtjjOXVz64xJcz0qY6c55+3VlYGqaskMlJhJUuybX9yoOO4P39mgFPPAD8y3knrg5RzyghmLq3OGnjb9hARBlH5GFb0li3QkOWTf3KHZKRs/owitMmA68ThvZPa25KtY+8ZbvGKUfGg3zqnzSTwnd3jAIdgOuCSxO9pEE/LIvX2zX3Nl9/6quqfxSYQXozQEWyBEyJkON4CSmTiHSeED6N6MM2ovHEChT9Wo+T++rZM3D3m45/8coRIzgHnM8s3AEUkYBt+hZSj8Vhmm1kVNiCyexqTKXO47aKMKcDtz+2uT/T+u1Am'),
('52b1e9b2579476-94447459', 1387392617, 'jzmeiAsbkINlqnYRpxAXGMnVGAMrVhAcyZru5QoyPJGkeyBp7byCNcG0UyflS9mhwWCRzNzgrpSSvDIJc9M3u8VmUXpUYl1TkYsvwHY7PYwn3zgOYY8='),
('52b1fe2a708ad5-35266079', 1387398615, '0NWxkWS7XnvLktKazkOVl2zBsNyLcVqkYZf1xTwIu6qO4qgV3S0V/KdeMY+byheChunJYFiKPP9LaYB1kM85LDNMGGr9t1ORnUkemY2ierLfJH+yx13LzHHUS47K6IhFWfmaRZaBDIpwhIRrDOQD0Nrwev3ozX3vnFvMluZ5Voc1mVm/1Ubkey5u3gyUKhKdfRYRIR5nLV+Hq2dBymVVzFvDm8L0JBZMCFvhqPJcYJDosrpKK7D1VxFy4/GkHvwxqxUr1iyH9jxC+1+CHVmfBFf4dHP2yMbouQcg6enrDNgmiAGRNuTW/0wNU7OxeGmeW0L3jTOY1t6Vdstbyl3QZq+WOoIbU8oKDqh8jIJRAtnWUGKOF2q+8M2YDkdzre12hgNbYmse6VfLZZI6qxb1ono8WIXiSOCWiv278f5Ng1U4BAmbVLKALBjInwShHvlq/7NmHuF6i+cTrXjaxTuFbdJrv1zvnyq1WspXsff3mEiAre+F28BENdCqa+HYtbvHXVEMI+tLGroObXai+3/3lZQlpWBA3G50dz1vEhEM3GkrpKrH0lKlDLynx9j4jJIx5zvSfLViVs97PU05Egne5phuViRvoOp9if+89sdSYUqiAceQd6vDuXnUpzD+SxDuzd8wySq0BiKX6wSIDPYgo90BTqE5PToSKzP18rarMhrgjpU0KjPXl5eryotdKsQ6HeMcOqgX3xP1OIcI+WDm+/Saz88dOZl5pWS20FZSvq8HlzEC00DzkU5AdYMxHdsDLfHxJaL8UwyvMRHO6mPhd3vnEKXvHoQeu9QlKslgCFyoWkuiLyJznbJGV8u7f/MDIEbIDm06Rm5sZjqZxhBwlHYtycbYxwLk3nsguAvA62kURysq6/zpKJpcV6uhRXMcwXqLDs8Po+CLxoWBSyI3W7QoxASgoYpOyZg2bfXFwi6KL0VfWPLdZexeiQShj1JwRHBA3+tBBj6d+JCLQ9YJSnM0lGGXu59FW4DUYqRKd4KL3jKjKvubwaBDpdJlQy+H'),
('52b33e5be31e38-78632072', 1387489863, 'aKKRMJZqb40uUDsfl14cq+JM+zGDw6scXNvAQrOQjeze2p9r5T9eYQwpGBXJuivdTPju+7CyjA/pFDqYLKlOIqczozjigKLzXrxmeAYgCKMh1tfdwfDiIlPEG5HmMGmG7yIblREzQdkfHp4FxrzHTsFJgHz/CcoS6fFz3k0Rj9tsO9m3XtLlXtbyTTJIRLvLzo7gdqrsaPVDyYoVF15YuF+v6QxijUTnLLi8gzFG5eHx8RUCuToJsfZ61+wB0EvsJO/dop/6xZO823pK0PKTO3q712OyHrAT87fv638alpdINiz/73F+wUpNPfOJUwFwEh5fNeniRNeIKXCEJsAA+DQYC9UQnozGnVNl0qx3dbzr2pC/y26j9SDesMT6bndCFlxtxWIla8F3MkGbzbdfV34QVDfjuN32o7WISeiBjhdeOa4DdCrrE9TbKr0wmSy+XUO4dixbVkW6QHkRSB3RxAICPgstRIK1rND3Cl8urn82x3GipHaQ8QohS4YHO3EEZUPkqZr+oK4k/F/9Y9ykmvL1Blq2PH+iVKpAB7hTmxDcLIAfhi8a8E8BbI8j/LD5URNKddfdopfQ/CiC2OD5DzW9Es26CBfavRHbLD+db6rcliGzCiNj4+mbcqrIizc4DX99hgv1VCM78d3POh/htHvt9kWrjoYWlqnq+pT490F4EkgqircWCvoZ/A5XWk0ZyDRaK4pmrc+73DNToB2BG3pbuN9CxnhuwSk++HfNmtwSLMRvKsdMe56C5tQF7vAs1vuu7DHZfB5OdB2OZ1d8Bqi3jXtpxdflovjtqTZOMY2usEPtESx0AiZ80w4BYyVcykmyNaDj26B461pTOhp0qzYLQJ6nt+biXZG9DZ1or5FjdawCI/I2VZ9q7bXiTO4MQThjKKzW7KBSysSvlnpCGhEy0B7GUjuph3BOzmtKfS19J9FFo+Toog7TctVOvgoqHvkOFefJIgW+gmTey41wO/N4HlA4DXQ7djWVUTot4YkipQKn4QKlOP4KGJo+gM847zGuS/y8jEKoY+my8RVo'),
('52b4a5e5ea5c14-06443933', 1387573375, 'hiPlkfW1ZmRCLCmPlE0VmgzF8+8XbL0sSWfMGUSDSjSgebBke8Q5O6+QVIBwMfd3+YQKwnPBGmyCNKxfuYwTq3MFW96FnyetsaSzTrnO6zT9N1vuSZ+dZvunLHBf4JR3H+p++9ICK824SqrKU7Yv+5arZOysaoxdChQYDBEhGYAp4EY5fK/LXuP6Oyjb5dS8Ul7vCYmWYiwUZpbScZNWniPW3IfA8Pz2aulWP2A9O88ULJuntBDPhQ6EzFdc9h+JEzRWpI7tLEtYvpjo0CkhFXjahD+NmJn5kNX0rTgYQKN4cUMcgMQZCfoiYVPYQ/MZSFem4m/fyi24FW3shsz+uNSGVFjLInQDikaPvzthVbWQNNcntyOGWkEZmcppU/ZHshdgIzA8Udtoz4fnIDoPj45PQV9EuFB+tSr27XooqBVBqhZycLlI89WO41NqgWOwgxcLrW1IBjvoacvJPIx9oQcWp+HIxTgVx8hZyF0punFlnwsCsJjfBvRKQbEN+SOuooXbqNE7KwgZi47/ui//kaY47MruX+CfUp+NS/KLl24t7tvyufjGf9uOSf8PU5ej5ueytZnIxi90UmtFO7L51sUT2Mp78jF3qujCkropSQ5IYcV2MMBDVtWLhyDOczrl1LxzejIz9iQMP/vondWiExhM0NOmJBiWjxCo9vCCE1bLwivF48zlN2jsYmrHMT7YVwnCTMo7BCJEBYHOpN35wifH23VPrQuaZ6uPvMu7g1Fm4vC22ZYEPMcHXE7UXHsEbmqSK9iQlQWoL2WD7MUI7CyVen8wYVlwlADdWvs7Rn4Qv7/Bhx4teDurDeHfv655veYuAlfEaykvKT8Qe4lmymT99CP7GRf2VkexN4EiH/YnUX8M6crw9JKK4sCM2UyKB9LDzOB/hUUhwvThPgWbV/ukD89cI7UrQAYIJB29Cjcc25AKVtkkVz97ahGS0v6RM+ZZi2blWQB3s3j13DRNTMTbhmRCA3ouuWtIqhmGjOHZvA59CJOZP2OGl2ULg0UI'),
('52b4c015bd0111-22433976', 1387577508, '/RtaFK3GkI+1QiZtgJVAdz5E41uwcD8g2PNMQMnoGfhmKIi5ERViyNlw3AdtZkDIlR2Fin7yMYW9U4v1prM9XtL9dIb3BWbrptHJ3S9WUog='),
('52b4c3a78e1609-25669399', 1387578319, '3OlCtmeIfrUQSz1N/vhlBFu6ceqaXRDCYVbrRQQes/yEiBk7kj6RQ/7QjtsAcbV35rp6Jlzxvs0YJB8IUt9VfWznkgq1s1VE8NfSFJhxVBPDtw0V34ZE'),
('52b5a0575a1064-09861905', 1387634775, 'iaZk5VlfdjS/XXTrRkmldaY5Lim2mJaKf/rGfwGXoOiQ4TIcOLyE4xI2ITqyk/0Y0mznfy59TOuIBqmbC1loBJIlKdCbKJKBQVc/KCwtDsvpFIsJ59PzlDXq4wx8sqmDnUhIHiEAemdh1hs0GLbhXNgRzQ74Ua7e0q8FANjK6kUZ22MpHnEW+ALZKBHPueHxiMQFkjTKT2Amm7YmKatNaVYMsoDIxM8ji+nItRhfb7MkdyXryneZITy1Y8UJuuUFVCqxIVZI7hlV2YSlrxo8c6Ff961nuLS7nuY+dg3J2QOoyN6h1f0WtV46HanI2knZt6ygUpua8VSGeJHqwcTLzZOFtEzWVtX8SrXjknH+fkMDi4G+9xnrs0H2SAZlGQszIkY2wH/nTGZgc0+Hfe4YVlO2fK+DllQF2cRd03VUggOyd7ehJZbg3D+aSltGW5hIoXGf6YcBqDOOEblXEVb2rpQjR4Ewlx8PxxduM2yn+yrXwa6qBb74qiA9Iumn4zIXYe5ubxLYi8NNZIoQ0Zs1ITLN6Ek8Qr4u91kvMgV1nLGVAlmdVyQkdJ3CkklXV2+IVoI9AdNWZ7uKs9Q+cSTg8Hdrgp4oiL9EsxPHyNdLwSWrjkLfDXus/ykdplUaQXbiWIKIRRAAWE3RRYHO46MG7qAO688d+Uy7/Kzh+PTeuns2C0qo/HSQnOmoE9Z3K3HC/oKWEVkd8KlbV6uMXlVAMiyQEv14E3ldHFgRBGMBAy2+NcXt+5hqkGSTvbgRwVx4M+CcD7lzOpf4JPf9QNOPWRZk+qJftL3iaDD74v8fiPtOXwkTpz0gdRs/zAuXXLpHuGz/XNXLXWIixJbePmnFlATWX4d9TC/sqZWEjrHxtnJ/d1pLy0lElIsf3+4+Os1gyIjPLw9z+iCGJhmmLV22TSt4waXJN+p04FwLm+uVBXwFPqz8hZXSoKIfzAmFbwE+BT2szfAPQw4jVWlXi6WIFBd33Xgrtu7TWZB5QSTghYTx6sQO6PuceKA+Zvzk48csX79PYXRmNKJwLYkb65lV'),
('52b5a06f82a7f4-28754006', 1387634799, 'uCbpIejeBFLlKc8K2NA00dBhk8uorIupPDWhQHTd8ejj4BzoIrQlMQnkMvc4z1iiFs03zcaSqER/bz3/+3S2nlgzrFx9Umt0DpB0ZtaHjDobjqEDYuJQ9rdt7xgHGYo4WpNsXT0aj4pgLCpISgH/kGPeoJ58cUWuvH6AVxgF3LLxbp/A7DegfIDVcOG0vqmmrrS2MBh9Qftv240ZgyX6RIPB9uJNZtvUhYf2Wovmw5cBeh26o/x81SeAoceLGnXO/Gjn16Rz64XVPJdgudQXafGS7Dov3VpBxZlJhJ1H+smSAaqKGSGZ0WQPZl9nLu8YzzzDPknWz1N4Wh4nR1X9lwNVtzsHJYHHE/32xMtC7LJulyUtAvSgLrFfkGGvMP9NbbLIYiOBS7c003OnymxyFTt4hgpdoWxfmAVNgorWW4VdGgYhN3L+U59RDq3TV7ZMeB8BU5MruUGUxJv9IvOd2SrwPNC53A9A9huu2TNQZ/r3XCz97DLSMk2ChaXjq9KCh11J/9VlidvCSJoLk5YSuCHC82HPWFNJJLaNqdsR7xnTUVQ4BZEbAkmCA/mZ+LcYLBiC7xVXpDpA0ci2YNR7cQMVI55BZuG+m4n9nmHR5ZFP9nUdsbn680thh17jq/1UhuHcpFtdmYvhQ4mSapW0YitBoDFlBMvYA3SPjKJGugnVz6Pf72heKDaO85cAbGnturU72inLGbQtvvtffRd5BZIjokLCbAe6ovnx80XcHpTHFL2pvrpzK44jHL6zNAZfBq1rqNwznqQgGgKocWycKQnF7G6yXthFqFCS4Ii0RGukncf/prvzndFX4zFBkl3QFrDGl8+DFqDxkyEPPawIWNGoaDlIPThXL3eQ6HApKWoO4hFXWkLVbrHCC4e0pvuvk/H36FwuZqHLhH8GsefX+cQleADewBLcbIm8BRHdnwB4tMUSED6i1DVda8zzAn3rBUwS0MCmco/NKysDevdpGhITZ7UpsGUOOUDgZK6HA2yJQior+mBqqWIv/NUFsF7bscjO0MDZFS0w+jbn9cRR'),
('52b5a527760259-33279084', 1387666040, '1JCfnqxK7zwYtcfO3rqvAJyz1Vu6Sbi8yiikOtyUEiUk98IL41sO19RKkCsx92DUPWpdPDa9KD2OTsqv/aHGicI0bR3Pc+B9dmavgTEgYedfRXJoAQUD3N5jv1E7mLg0FIFbyuG0Z8wPrj6gAqcWlYnhOGvqig9DV2TlgeAoYzdmB3PIwTnc+XfePnzm0nCJvD6pnGygKJFimw9uYdw2I2h6DiheNw2hMEZIEqvoAyzpanGMDhY7uJDo+ny1sjK9w2YJWWGolVdcZi6Wr8j0rMBktyy0g5qtsdXR+IGZRMDLGnve3BbehW7UjF0+iusfjZ8OwX37egrrzIfzu8hCAzs1o+2Xf3ZDy2ZK1pVOf0922K5KvKdChXKWbCdzAlwQrA/Fl2vjC1W8YgK17CxHIX80AGYsITEmA88XE//A5FXiZGR7eFKOVRSl7WUpl5Sl2fgsW+UDXRtGbc8Y4zhnaUGSoqsAr9FedtE9/kAC3gqj5OJDiLWiwLV/k9raXb3tpx64QzrjVqz5qc8UQ/IET7S2th7MU/06uIp1COmMOrLSzHfueH7pO06bTfe//EnqWnlZ0Tv9h6CpBIpfBtoE8QN3OToAx7CCS4OmpUyXIcGxRChSxm9CjF8jhhepg6OnyP9KwA23SEOMxky/FmNndYeLc7N06SNXaLy5Jstn4PCMtN3fXpVkCp9ukzSEIyN7FglkC5jiPYt2swwww7VJUK70R8agbbAtNwOPwMpUmmuOIKZOsNtSp52V8pFiiBdHZOq4GeE2FPTBsRBKwT051CJ7fu5UQyh6amXpZzseTUjgCUxykgJxC65lD/3je36YBswsaOeG6pnPmzDGezWIJ4D+ilAASumW89TwmuRwyIC4CZ6/CD7jAu8gP0C1Tbj8tqOkg59suQZ+n4qZd8939judCkMDSoMKLBP7YBmeflfzjOjEYmUsaL0cba2hJBjb/go3Ci5DLBVv6Yys2ge/wxBPakpaUtlb7qmQ9QMnHOeDpTIc3VH8bVEf7UjSk4LL'),
('52b6bdd835c588-15890596', 1387719836, 'PrrdaS3N3rz5wyFozGWM8v/ZZLOjwZttjAWwOpym828Qfg98DUYV8IjfXN0Rz/9xgbagU5rxYvT8nLueyZznZuJEq5LSTOZWXFA6fuCLM7ojDF5Tta0NWET5eba/BuPEfIAoClCH6nHqJpDxYH6iLKP+W7YrJyu7hbxPhP9aIUX+4a2qVJzROdEe4yOczzacG4VqQs/v6glT18B2/NAKjPQT2yA4QHr9qx1r8mJH+kcjTCF8+s/IexaZ1ZIpZNvAw8rImCGwwCCqgcjozD+zokrHvV0rdYanWWWskZY8AJGM2BTbDoI144mVNGBYgusYnscN+ib7CTCIylxfrJ1afrwfJS7VrOnJP9YcMV9QMHy6la07u1w8dww8ZveuEDNf6gpvnSTTAyM3NrIyCu8jOiTKVf4vkczgbt8J4T2TiwhhrdcXj+D0IfW4KUW9PtPcGJtjdBP4230r/ty4Qno6WfWm2aCXu+WKkbdLefKH+Omf9oNm5mJ+3JrgjZfVDwbBBCbct99/87KwPKNOXssE0vrjHAOaJywedYfjmJ4m8MPI/eiVSrWDV3avcSgEddF3RYgsCrOzVNG6endQFNfwhMPGkdgw3tot3Wl+zfKNNALwy5MGJPY4Uoe72ZozOhQ2SYtuzKAFNBmgMMqCnbZMQsTdqnmj6GiPcnj0RLOTYnHkn5slNKCmlKk6O5Mey5gFg15DrGD/Z51OgMHWl2woO8n/daB1Hhq0g7dXnO7c4YT1kCg0W4dV5Aau6dvomeE8U1RJIoS4tj6CvD8XC/ScdJC+aJUTDR7QVckd2FHNM8T8ux++9bLS/kBSczQ/x5tUw9fsaLmeTfcFm+Nbwwm9C54bhUNrT0bRCkqCYJMhVeNOj7aUgQUkm5YtYOs39cc4pSKt9Da5a8vT0IU/O3d9kRg6zdI3TtoTjJmyYjQvv9VYKpPSyHzobhJPBgL69LZ5ygkSBH/wd0VyG0+fIGsRKcz4hjARRSzGMXQnN0h9el+0fKXA2fjEei9GG69EE7PhsroDvv4Q'),
('52b8a68de4b348-37305298', 1387833419, 'Mn6fbxzdlEzuE0ajMMX52ykmW/bVn9QRdyplZ8/OVctmffx7nHiF2/qC91vu5tVwWV8PAzdHBocUd+NDFIhtFqrCKmBgo7rC+BE5kgCG26JK9YmUuF0g5LKs1lu4XrB8YgIDkyWuVPKOFd9cLtUTFYF66cZtdaOfpA6T80g3wAy5kBSXuIDqhFlQTPiRAvz7KzaszEunMgwbow+xuE3ArH1rcXWY8oszgv2iGayrpf85lPWAQPjNamCzdHrWE3YEo4Z6FWq0dZ5HJ8JwsvRb/ioouRpSWlmuN+1wUl6FyDG71LLohOpJ+hlkvyRlv+muZoGua5FXeRV+HGJmhIam1BLWRyn2Psr4Jsd4XoC1HyQ8XPh1GQW9WczHpnsyhsUYsdCXlBnzZOr9ZXL60IEhzbBDgeDfHh0mqSxdNjFE8P4Qqkpxmrdl7paCBNq+Ppc8aL+KFE1/5JYxgdxmt/BR23UmIKqXjFvG1LYua6/lqA+oFySYs+vJGC++vESj8lsSGiUA0yx2cIoxhMJZnt1PxQhkT+t7tuniHp46k6xPVZKOsR9umXSzCvojmpayteOBqN+AskdGDuDP7QSxeCFwwWr3REI0dRsJ6V1PJJwYWwMtmnrJPl4UBocKczqTIs1qOB7Xm2b7MnMVJnNkOhFpneNKcfcd4mD5jUL8qjrczxtlvOrxHigjY+K7ajaFKVjC5XQuoRZij4PzpH8t9wBuRM7ROohXEFLGThAa3YKWB+F7P5jYBvwoPecVaZMkUw8jR5C7ILjubS3/BWQ4IxJXplDbYeSRQb1HLR7+Zfx8TM34IAnstbbHvDDgb3jIZ7szk26IjZgk1N3P7jPAzQmVamvOD+vIWPZe1f1GzQBmuFcqG1ZZO79g19Q//ljehHihgVedvuX6TNZ1fb1f05AJ09dHSBRkuN2V+pi+BHQJBqpCPa2RIbJs96x/kauS6nZi2Tae9P0MAnLUyRn/wttCPB/r9033+0eWnlblybzcyZKOYJzVR3jnROEW9FQb/VOxwAh49u9ektmNMh/FpI6v'),
('52c5e7317bca71-15256864', 1388702234, 'Nn6+Fx4VArkPICF2jkhjtSya99hkM6UGwJOclWCVvL2NFp39BO15xW/DIp2fHJ2JysSqP6Nx0Y5dbc6SZDpK9S4iWhugxL2v/bVsE1qTstcPuxGMrAxo7Tjr8xoviHRp3/qJsZuQ6vLRY6BkUYMd4DCAjwHCWTxBvFPBcet0gji4l8gcJYMPovY+TJZg6pjyWn91JZvAQeEIm4x0pKbVGBqDO+RJ5eUZnwvWz5RC9GRZemIJfMfAISwSW1ytZivgeEJFH3+K/f8fIhSlIGRYtW/z/P87DAcmvy7dxwLZvwcv9b5ZB9jo/3qCk8K+vV8yQF3aEvNPUctn1UBGrzJKIaL1TZwY92WG2Q76xz/E3EqsBAHO11VOZnuuz3UmRl5rLQ9yV6stIocOIjUJnHOiECq70PXUS5RMCTSI406A9ZT0UJxz35YAftMG090jyglkHgSbNFxZqlgai7TAv5kYHxpE/o8PCTeU93XSFNwXU5a7xGx7gHKePM5TlklPFoqPwrXzeCo4XOHXuZGpWQwI3E32VEYToTGlGISjATegeZyKVMSMcRBmTsmLFoMVZ5SjhQDnOP0JIW2LyQtZE3Kw1vwJmWp9fLlRotpcolfhULLR23ocaWXx5bdsaY8e6P3UYiwC8WICkVZGvjxvVKcO2UMOIb1bL6+YtpWNAh97w7EZ/C8f9Xj1C3YC3yzttP0yhDqaU8ANaGo5cmQmnqrkNidIfushP6UGZByrkG9ogmzoUd9kS8ezmLGvUTqlgVmxdrX/5nH6MGtk5d+RT/Wh+NNWqsRAdJPM/N5EBxHAgat+SlQCbqcf4tKum424p2G0U092SudWtKZIwnoNOPuybxcrFcNcEMHxJX4+ESumhv0yXdegBip/GfFEv+pkye+bjON9azaWo+/8EBEFjQ2ObV0JWCublYaHt2/aqbSDGY5VXM3s2Vcvkrt2ENPMBmUtirhFu4JTVfXj2YCfMwiNbThwRTKoVeDwsYhd3ZEI4f7x0CiS6kwYcoKONHl/CRs+'),
('52c86a23bf5145-63985011', 1388867698, 'lRDmiOyXy9ff+P4EtZqJNgi78rfkjCrFtNHe4TmUPZQZcM6xs1B0WmiHeAFEoRWXmKTLcB1ZfQ86g9PTr7MyS9VuVn4yRZyWQAFKNqw2BqHn4EzRZbopJF2EwaseyAfV8AeDYsznMCoklgg2N17kgUHJLbooubHKzfyo59ihl8lL3rXh0lJgNdUBdHPNeAzMtZST+Z1yLE2iJgYcvsqBrWfqOvFXbzczTTWsMHA4jwBx76ajovRaEVtKEreMVOEENQB3YGVQNFFTWBGTDlcE3ObE4ffDMkQfuuUQ9/ozpExEusZd7+LyJY9htonl0KLzmOGnxh0xVCrszPUNQqAMKbTA/GDiuVrSDJJj1QIxrHBgpIR2N/j2itcT/czJjG8E5vR7wh3H6v0Cu3dMwsdG799t38bIgdoi7aHRuTZ5mpkxeU8Ky+rX+C5bvFtDOw42vNm0iflNm8SDyC+kyYcjolJgvamu7m1at9Sqq9L3hWVgqqEPccPSfIb7soqqj/sU/F6zCQWzuunCFRmSmhk4JKA9P2oEw4/F+tCrzTUe24fwXLplEzmCv0UXIsMHfTs2xOAdbdM8W86+usHEyWmQkz6jYJRDqsAxOtkBnrW7FwpdCqaFjz96gStKmjWZu8KQzbKZeX9+x+TwRXGS15RCixOVSu2Q6jMXbLSIh/oD1DkuzMAo4yBKw93igstSK7FVghp8Scl0mUOw0ty+tgMXdDwhubqE/9iEkydjPgoTaC4308VTKi09MVAJ0/oqlCzdF36dfmCQFhCfAukRSXcWNlTFcOdmbZBKbF/xpVHPYRZLXq8hP094VgNIURZTAwCqzRy+Oxb73QXslaB39Upd+G89zxm49of7rKriBAfHoSmKB++lYdzNrli4fdIcGe/FcfVKgJZFSHCRgA4fiOxuH14x7cqsRdc+hco8IxatVcpSES49B6uiWdWUHKQqeJ00NYmS/lwA4SIpQn5yKEwh1P6GWyAb2VFvejRxQA1aml4L/AhdOD/Td5JmpVe4OYz1xKB/+Q=='),
('52c8709249c4e3-45797356', 1388867730, 'aLAtix5tZoLF8NUWRsQii1LlyxNCLc+RLBBW0J/Hcr4PZRW/+g/yUfzP7fufhP9S71PoYfxlplLjWLSODubzd4eCMyogbF6NqkEtS1pryVnJ0vT9WLGxxWn4wB8GlBRzFjSYYpw1JFEyj2KUqnpUQ1hXHZEbod2ERnxBDQvb9f0k5Ao13oeXLI0K2WP5X2c+vaGZLePyjI0fbARD2vYLRrnd8w6e5fgV94eWo4/1R5QDmLkHOV31f9WgG3PYOMeo/Ani7RNWPdR3cqIZAIA8y6XMhpTthp/p7tVbvOc+n3zD5UYxFJ2sHiBMc/EgLbIc6ti62S94z1IO1mkScGBhm0jScgp6A4MYN8qV3r7TdrahxvgkeBc0OFsM6qzZ+53oxhvpB/F6N/bQOYE2a8oAmzV0AEyML+zyb9JFqjIKGdasDHJXkmhvUyxtDiArC3no0QQIfqLqf/zbodLnjyYJXvU1X0RFuTTEa481RnwYsEf8ud4inBqN2g8btcIGx4XYT+nQogjCMPN9yeK7w9av4GNWDAy/vOZGOjZLTe3KaicS7sTExR8+fCS/2U6QFV/kMPP1i//PhXouek4JGrQH5X5bxnikAkm/9ynrLwVPgNR0xi/trt2BJVPozjKx1cERi+2rIz7OMgA9RSPeWgIu1DygsIuQbhp5BcvT5y4jvksGedn3OrGjcrpj5SA6wFR2wf/V/vvloq7N1cexgPs/0zApHDrZZcuHWGlvxcbYC8zamGVyi1DUQfR0a9u8eeacm4uD5iRBRafzNZECSTYksj51r0px1KfccXF4x4soW710yEPRoUufOkNrT8qxtqLGHF6TGXQ8FhsFCPq37SF/ULAGfZlR0YnRbaWO9xNdC10/UR9vCzUsDSvXAjnThi/yAoe2wVfVq6arnqj9IriYxrMO7Ky6D8Sr8c8yBox9zEgPDJk+R07YHtVmJS5SnEp3FGQj+3AUNUQ3m1zvR5Kal4drYJ7W0jnNCvWxsQNpndJb5U91NKco6+oNU7K6apCs70LTTzL4/0+WzriO0A=='),
('52c87a202810b0-33917772', 1388871265, 'Kvop+QW9etW/Lb9DYXLAKpBqNzm9TEd/VTjvGrKXkwmynB9xUhLiJMObAmArIgsQLYt9oBXr0WwJIJiFK7kDezPq/4YQieb8tg6o7KLCNj2c3i08woXWHycWeOya2X3Vfaz5/Dtm07tXM8dloKjdRp4jRcgcDS8e1pZh03p4LuhAXDnmOSPZEEeaTBB021ou7h5jhd1YJ5tWczlU7msLz/+NG4sbTBCQbbDZ/Kgg0+Gf9P+Qm6Ftp7Rekc4amzjNbbh3Bn0emVJHzo11MdrB3OIIfFqBE88LrGGToMJ71Vc83fLC2Jnp5t5xuTiuqjMvljS2K/CMdd0YSQRicA+rEV/sTm3zX9PwptN2iXMVfu9MKAzex9C+Ni0BUMMckUif/SLNTuqx+KGXrL2nnlrhNpBeqcfQ95ILYZQ4Z6VSOClye1KhJ+J4+Yl1Ez5UspqvFEqK/cXonuN6FDuNoTwtMeasrFxG1EfTuD6V5NKhgGNmnW8hrzzqTqmaeagmKvdGH/Iagawps9koGjUhVm2FBZU0LFVcJYqdn8qq1aLyx+o6dddec2V0yJqIq8J19MQuSx0uuYUm0sjBWgxBPJyb7vLOrlu07rofcq7/5uO90VGy/e15fh+CNkhmQ6e6ey6yyz/CuWgNKYp8PS501yFIUFNgCfE0QFO//KuRHYqDVX0h4EKNZusvgpCKPQsc20FPOvag62M1XSr2JhVAAvGjPVA845HQsU/2p4qCMnxe9Vu8cl3sRPjNGm2z2LmvIj3qU7IVhmxAL2X+qmrG+qBn38Xrk+P/UqP58xD2ktOHKWqgIww9B3wgRy3dPPeDPx7ag1K9sRJ7GfOpPcbE7/RaRET4Zkiyc0R0Bq0g8lfQghz3PcsFkweaO+BWrDHP/3ZVNFfCFdPwYL4kNzHTmWjIDNtJjI/G7zrvuufIfgEAYGRQea8GCvzHw4Ve+gAHQcdqtzmj8Nny2S3u9Op/+9x8zaWWL5CWUIGcEZqtNMnZUJcc3n7m9dQ2UwaoL883mJPfEQYdzYpe'),
('52c9748c0d5ec9-32177990', 1388934284, 'JnaGaBcsr11CEhYWDi/iWVHxOTOaFgWpDIgJNSbiMOtnXRr0C+Yx8L0Fe4e3ctAAdQ/R49aX+P8KynU29es54uz61nMADXac9Swvv04bYeNOIRYj1nvbqyAB89c9m1wXkjK+N46xd3+a9EiDnOY0FBDheL+NiBlCMkfnynj9uCUr5LoK8Htns3W08j1tNLcWHpULf+RQBlSsUditfQ/ndfODIF0JYO9/ghh9w0ILZhe5L2APqNT8vIf+yRrkNUicadn7Zd06kATSDlzpjbhkiwS7UcWyhQr5ddzIt2ISphlTOdnOCpLwcLL9+3n2iYSiL0IuIcPdS6lfhaMRgTpN7kjEj9dT7VzLC0MgXD5C4iGASD6+gB5dqofBpizhGX2rY4b64/fy63lM5tdtksuZXnXYxSK6idK7H7M4i2H2dvoR4gVhGx0agYC+jwuUK5xx0jfidO8Y0esynuziue1aWZyvLmNi8PLlGQSp/l7211obYdexxLPSb98OBNYLL+eLUi2qCM+95osV6FI3uRRjZUZlSOhQ2HIqucjvn9bSpJUZaIP+tde4k0PkrkMNMYJt4pCTWo2lULQxw2ezKwMUdHXX9fd2IhoRS3bHpZfKuXdWAofbmzY3P3MfakW9Hxt/CSHG3E6cU2xYAiZG6oi4bt7e77kZwhNht9z/jqX6Ys33xKNRTgGFljk6RMznn+2wscX5b3qOQwcGYZD4GMyp425/7EmSJH+E9fqZSlNt8xAdY8r/UMo8X+gKOxp32LugM2WvMFifnFGXfj/QjXlPTjFMzFxgArFyJih+l4yPc+vDwBoopQKuBuev5SwGFf7JpYecMzjY4RkP+j+3BssK5dGB2kbFkHldjOwVIAP4KtAc+wRBGJ/7dF9sGWT/Awfh2CM9fkJ1ku4b51ybF6+2yBT+xNDoKNkwiEHpiK1R8VhBMKlYlfuzrN1CUY0EsV4WVwrcIvgE/EU/WDz9M2WTOkVMmGjMPq8V5xdPQ8GkfUwc2wDqlu1vDys2wdqaFX1pvtcXF8lGVn3iVXWmpw=='),
('52c974e52296b1-55825601', 1388936209, 'ohWPQ8viMI+uYI8gspXSu2CZY0CeA14DyAywo3DGN2VXp8+08pXzCsJoKae/e1zbfVC+tH8zL9Xn3iyMJSrukYDrL5GLs7OB1hLhOUGYK76Dv4wgjbGpDCAraLKCnv257tQ6uC20DRf1hSSVqNFfs6BWvD3a65eghclDYfm1kvcGOGpOpE+P8YMLInWwvefodf1sS5QTOWN5D/fh2JT9I/dTdWj1yAytMjC7Ym2SmjlZVwmh1J65qWvoxyRVt5PcVb/gCFpStvSKf7QcQfkrzgMk4KSx1W0fyOhsnwQW8tQ4UceF4q2f/LYioFjOnS0QX+w2GT9/CYiNpCNI+qegzBj/6J6QIz4gOZZdJahn/x22tvCtYwUJriB08ilCh6NS/qX6Lq+qTZ+Bf8NEM/CQkPKlhuXJ51BnKHvlkjF4K//KF7XfZQl5O9tkHLWnHCmy1rs/dIX0jSBAFs2fUYUPDW1pwZgD3VPXyfnTDqukCavqY6Kwyz3MBzP1U31du3tauQTk7atsust62KxyeTEpAlcEgj42/rlIVt0WCmCRTVYSufUg1KIQsWSuD/VeJfFQBSjvmUxBFfhHiYbo6HjP7w0h5CIgiOj0tpGyCV87dwHgbPKeOvpHjUam9fdkLfzmbAHcPGB+RUDBrwosb8/wO/U6qIrJ9bMEzHM3d2antBa0rTa0G8gDGniuEKAshTxNZowhXjmnDZA/5XNzg+CmJ/XOe5C3K5W4FQD2csEW/FwwcVg9M8WGy79aCeZCbbLjSucK/5xJyvneaIWustEvGiXd6fC4HTZv/sucoV0nMHam7sl0xzY/n8Gfuq5rPDKa3L8078LqD+XWQLfHj8vsmoaYyBAcBZpGpx1G5Uyxz57aVmcvCM9DKW8R52gjVJWRGiw+554Xek0Ag7WHrYyl6TZeGvvy+PYjOfa8s9oi6o6TMhWlgnNgxzaq6ZtFYZkJIe3lUvT/GPG+kQP2xmJ80PtEkaANUkPnikJi4CHJv68m+dbIfUFB6qBg2ozX1nOejQI3HU+blQ=='),
('52ca8c580c1095-74727246', 1389008485, '9srhDFMkeNN3s6t06iDBVzKHeJrWJfr7WSgrVFQucIvp1Ts9pfC/i2yXnrBFuhS3eRFsGt6GqTMbPsltfZ0NabQaqqKbXXrzyfXEbLXamxudHV65stFy/JCZNgMbJSpHgWaQnjliQbujz0DylOeAQquS2h7ep8yxNZibJmFRs8faR5+bQXumi22yAGhmmFpDwSkN1jQI+2ObGXNlPHzT3eNgRt7m2H+X2DQ0unBTqWCyiiA64pMs0NSZU3DeCJnq5BqAdyMPWXOUbZgeZJD5WSTNkl4ZTBkcN3GrQiUelCfZ2gH0D38WF9LSHsAjgnbM+Ym3V8R3+BMmpWMgpzLjsXU6xy2x8NbT5qNrj0p7KlNjK12DRHDOt9KOy1/Rtbm0reEzERjekHjzVUUQutde27y6qMCzfvIP8qqqtkGRdBCG7THf+rKPay4n+2sEFQgLte/Fm/+RQzeuLPhlcthFncbmfcTrjWGqu3F9QF+L5kMuXPRDohvGOXFUyzrZmqyYmeAsHixGVaCJJ5j2QhkqtzYTXXrzqfWUvbQcFe0NEbCQhxuQ752s3m7pnsU1hqJtIYfZevX4h8iVPKQQVqtkq/yEMiM31yQSJVGR+xcRieqNX3svvXA7I5AV50rU9nAHGBbVJ6i8jHfmROlttIWwKJlVtYYo+9mkhwfg9xQ5m04xRGhSvVWfzD0FbYcR4fx3+fnA1cYPcF8hdZ+y8JGTkOY7cFZKJU/waapX3HOLDIc3nmj5YNBOC7boLn7gzGO0Ms0Au9nvL9MWeWI3z/3Ey1PygGRaI45/ym/nhutMGCgJYFZMBr1g+RbF/9m3B8/7Itf23MTz/f1pfjRP6I/aLCuOsplQ7EF40IEStgc4O0WU8qkQxeavedAo5OaPC31oc2KYRaODcVzOqTNanGPDweayKMNVyfwaXIXQEG+xa6JLZM6abFhwPOEiwOvmY9lGiYfjZYqOVmOU4nTLVQEIY2u8KYMAYBV47EGJa3gzevVx4jjX+oWmwAUQunQn8ybpGiWO'),
('52caba20f14303-21028285', 1389021949, 'VFwMyOV/6A+3+ssBs1Vb5ZMTTaF4E9lBaidKA6kfeljb+oAw+vc390SZEca/zCmk7sOTO2PvIex33SoOF6s1phmKNOkXxLroy2MokXQw/i+dghc53Pa+c5s7O4TjnzKroousyl4RuwuVecj3JcIvs45D51i4/YkeUKcOIrDFTPRoJZJvoTYmuh3YJJbMZGd24glcClt1SJ+v3nTsSKOnJ/w9Mg9M5Hz2+YGVmRXZaT+Zpko/R/cHAOiJ9W4Tmp3QDA9iI9KTm3uyxqzqdgIwivaDTK55Nddh6e5U5IgSM55rVcs6j4vu/oY91wm60jgwwyiMnEfW5MIawSPwby4TmoqvZz5XmPcl5Iscb+6SInZlvxQ6PQjgKeCRN7XfDwGsyFWtN+HIUUdsEpGg+QobDsUxAugbicIB6T1IRmPvSeuoIZdIPaEDCZLNHmVxfL5thR6HhDAlD/2aqWTa9EfLymAo8LJUjLD8RAGfpO+TRABqPoypinoSy1awvk8zGmllfEzkQqUruGgQ8l2i0QFSkOomuk5fT/r7o0KXO7qotWMA2Rjr+3eWYd+FTKMklRp5hNMeY+sV26qKKYT/wiU4icBcNbEVIUBM2g3m2fZI4wAh2YL5sfzbLcAoGlGWyhfR4hj8Ru2jSmLG1X7vdhG5naGm3pAW+mXYi657jrEi47smlU188zXoU+w0RsRZ7Xd2+wOjnSJToqC10D7Wj3J9j58XqcrEvDSh/wYNKFGLWBB5BKgRKOBI6v2zR5TWQycJPTFzR8Nw3fUn0LYTNJ6C6s6WAMQBNcoKaA0A2emmeCWDTgKx2eCRlPuWNm/azvRJZGcoVG8ItdtbHZrUzxLNmKj2rHUmgOAfnwRoBjxqYROsgsOpybkUyZGpNwYDSc4gKEppOfcpam5vu6uG6iCO+ysvGcrqDkszXi2e7DU8d41cRG3DJrinmB2ruSD1Ahv02rZN32OKI8BkrAMQPEPzDDrcB5COxFqA1nitGRFW+YQi9BBHg66edd6hUNr1SMETPEHtZk8xFclhN0Yb6Bgo'),
('52cce3a897db79-03112413', 1389159337, 'MmWxMSGmHrS+pM5ZE4mKB6ev/aPf/4CMF5TEOhMbqU/O8z3hSjbdlr40pMngmcfDqgTvioWimet7zb3HPjwWHa29RKgJ5tJlUY7J1fdTCNhOrXpvJTmAsbJOAgOIRLmwzyWUnX2oFW8mjfK4dP59zpIPN959oW4ncA3vHSbEBGsGWG4QL2ya+46jwiySYVHUMs57RibHplXU7gPusvZqd4k7L+4xdzsK3BU0JZ9fg+RBhrX61StIMUXinn0OCTmpi/ckpR905A00T2/XLuCgJiJ5qwfM4LOrFWMXZ7xvg1iQJ9wVgRenNVPUVTNHNMZ23AfXLFWnOpv68zv8CVlSwPtOchpQA0Uoqtuh7VrYeePsBq/3ZFPJrK8hNkzya8o9yQcBaoXQlwR2iqt2Y1MiEZ1lWzOMiqEBzskEWZAoUqRRlvWzBBcFD29730J9cs43FwnolvdxLHAkHowrU1sogSuS13g7QB1GqaQB8YTBcwJCC3oMyY2GbAuUR+U9aYpikpzvDP1+e+3uNPEEJilIPpwlV+62XhAA/lJ5w8/iau/h5UmnGEFw7TRkKZdoZQAxTqCMZBJDyedajvKtSDiNxq+sL5yQsLf339h4NlhHo/79IpDVbVQTryYplFKv8RyTeJbeHOn8LkwzWiNLLxsxoYHF1dyc5ySW7agxVoBFQTiUJD0gtqf6S14hULB0M8wXinM7rV7paecIGOQeLQISp0PYiOj3CeU1opnu57Ylbkd0JFmnW5Gnr9tm0FH1fMje+2l9PpgQ9kMzsP9Lw5NTzLJJcQQsQpTfQgSIxhnOgJKWSEOd88h4OH3y5/88Jm3n/VFnT52FITqZQxpXhhpEt4WKGzV/Fdybqj9ZIVlhaG8QdPghlH/RmKyPGSZnB1FGeQETKF56ZzC5HkMyhVtSzF5AyKVxDyotJny8k9ckhubyT+ZVmFWtRqIB1h17+3B/TkXXqne3NFmnj+hUmWIR8DdsF/UsCIX3xAQK7vs6heLROuuU543hSRsDc0eAU8yOTsV7JW59Cy6gblffzUThXsjKPTFS2fFgE6ccWxnygsYqwUddm3RgsuWXuWJvFkK0yq5wu+jesf1vJQSz8jQ6uIlpULQs0EJbqU5LAmAwGbA6kxAI'),
('52cf28553f57b2-07710856', 1389308119, 'hRC1rbxkNJDNCJFXIAPyyKwO6XoVcIwGMpArTl6ZyPJU6WwBwm58cMh3vbbZk5PiI8Pfa+sh0DZKjOLp50P/dtWId8n+IvzGgXgUtAOzBrL3Tsml'),
('52cf1f9192bcd3-49561637', 1389307768, 'l6RNR3TDlinTeyT2m1Gg9+TybvMDv2raoT8TcYpm8yciokhWU/i2KP1jUeauZjOPI6q+vQtaOj5myVjbNvZ92r+OlLZG5UPAn3nqVoghU4yJ8oz49yI6G5w3ZbS74rJosaVwJfldQszqNI6HaWM18ob4+yOfHa9dtfzeHxyxfUe4BF0cRqPfVyu7ypEpksXZWIyh2jDZX15NiRXGRBvy8fiF1TEe7X5+Ab/StXSXbv4ygFjlwlZtYx637s4Rx/LRZXiL9SY3Zsp25HypefKjR+C858he04iS4UpXHTVVRwSuEkujsxtbBbwgmAGFQVIsjz+AswVJZ+V/q2ad92Xa8Mp7Z7m4N02AIgY+b+Fmxzf87j950QJhJO1bYj2hiwn0v5VGtJcyGshKYWrT1RaHXnu0fvHuEWtLTTqR6nkP1QMv0LJqUG8iQdDg7kAK77F8EA5l8g+RLMJ8baF6JAYsraXZDB2H6oIgYPK63rEPQo13k3HPXRsknXS/pREe8Av1NPAyU/ZiP4wX+bOmBc3IWlapAF1erJBz83wwH7eAnJgebtDWlEQoKKRCIBrBxnCI2lcTOBCVTesJnN5tNxr4imolOwlVVgZCnBTxKtxuQiGtgIp0jK36yNMkvHDEHuUeFciCFRHn8vdx1sy2jKkToFPchn/6oxSa9TNdFqTKda5MZ+1J8eqxilfJ2eAP34HTxAJOeJF8O3kCj4DG2PPcw3/qCXZaQFNeFKpEtd5nQjgqQFse0I8n0ah9Ryx6EeoJn1xbc+OuqeFMAzF+T1RWWYD/0bResTh/qqc0OOLWD7QyFs5yU9Q0gZlQGn+ctLiJuK7x8tj5ktK0CTEBTEbijwhWgq9gG8q8j+zqmul/xYaKgWiHYgbozgezuTu8OB1S2WrX72Y7z/03FmppSS+9P66/cQV8IpNgiSwxkGrQ77hqUSJTtJLhmw+Zsmm5NyLtAm6I4Tj+AeCTfjjL3IK/Kls93f9FhBU8heAn6AyM0pJxjVrInYdBc1yaaQL0mctb49jsFrGwNelMrKtZWg=='),
('52d19800ba1cf5-49147405', 1389468374, 'QcvkelSGB6yPIdbRXaN8spP5RhTjEtdomgDjKD49EH/nSRlJ+SCaX178K5/JA61p50TVp0iDayp/bgFjYnqNEhnljEkV8NNE2Tqo0ZkcyuRBsEhVQEbqWcc4gvYZN7PjXCTdZXJHeAklL7Yvm6qfPnZu1xnRoQj+o9wFC/mvbz1rTIjrRxx+9EkKXPEOq03lKVaQAbjKoBmTBqP2iDkaSRLOqeXxzmg7opUzIdlBzAdrhFRB3MmIDpuuN3ZQuoDTFb/YLZ1b4jce0VxHsFTjJ+3uqjAlG5vSRjTRv6AEgzcTitpHlnSaITlsJFoVwAdB456VrkNYtTosU7lc3U4drRQdBpfkf03x0JEnpT8ImnFB7V7CibzdExbSgBNoBfkwq6PbX2nKjyNJsJRvaPQDi9AuLzeNPnXasLKTXFPmSPm3B47mWrmg/zEOa8hJsKZKpM2CpuMl1+8NqrU1I5xbR67HjrDMcKJOGiG/9aYn0mg9FShuu/5qqO1GJuZSiGXMXkPIiWSeqxpStDqYIqP3+wXT1mq1ULCXHQfmikvfxkZxLBp9qflLZyJHjx/7IXUayTQwTjCxCF1LGQN8ME21RlY69KBD8IXrXjwujnto2fkZ3ulx0fFyh4E9SuEGFtEtpMXxq/2SpYaWXVR6Axha79fsdyBZM8wZjJRz42vnvOcErabP9klQoARtk9CgbMl8hGkBy60YzFVE6oCNIsg5c75EwNpiwrQ7pWToQ2PckUlMISZzdhNZlZ3CyFcrpvjWqvyeOct5EIqENVlF8ejE0mt8mINKX+LxEKGlkT9uglr0QPyfZRPA90pzYNQ9aTJXenxXk+/EQct9Zjsobss5z4ozOqA/39N/QPSrMbgJqWvgoBlXRvQtxz9RlTFJQ1WPNcYGN5ND86M6iCDnX9RMp5qVGsmovJfHV0FiK3a3cSvcZucZQWndQew9qTDuwae0O8+eBYmi8gHBraigL4NoLCjXpRsnhCO2JDZuyBDXVjDrXm2oH/B3T0hCu9wAbE16b/pki8/7'),
('52d1a1e4373909-65528541', 1389470485, 'nfBXTmzX1cuk3kF9rQ3CKn2tMoJMuuf3TKJNDn8pa7p22rNmEzysA7AqvpBGJGQkaif7MnSpLt+Lgg3+X5XnHhKgN2wxT/Y+t19gp1YkjFKtmay//SkbHjLc5rKrRO5p7gp7V7mb37JDb6zZhVLkavgbgtnPR/mjNWt3OlxVucj2ATcQ3YWRjYueWF2QEVoQ7iNwyWEWyWOhU+hYjAjvACBQMVaghJVcr/kIFGbIw0+frDKbZ1+HoLa+V82ntzQrwWzZu/FNHN+o/D6zkeDTlJK9h9tIbdRegt9SGSTVJLaExzH9C3uL3kL6Zg2Pd4AkjxhsvtCsKs+j2gtOFqOVx8OBf5iX03zGt9y6lITQBcQV6Nh0/hYZDxEzcb7frU691Wa1OrJqSTD5yg+7V52JEJNz56xfSIxS+OeXltUWwMrgmyQv0xvOetGohhMtam9Wj1a21NDJlUTovvrK56GYc76ONofpElGd/7b2bne1F+w1F94jNih4Xi4djd2J/riioWlAyK1p6+KeIREkKLA2LKWGxz4opp4/gtWzgI0jDlE/BDD/p6Q0+qj00/gJp9OuSvOzK8xESWUplDn54v/5s4/QN98jf6Nj4DbIZHCPWJUFXp77KgmgvIrCEPQDswP7IER+nExg0+XaT5GUDBiNzVJsFw4wWszepgPz0qI8TWuvMXh7LAxAoKLztcaN/asD5jA0WVsZuO3Eh/5Rbu1YIRJbdKcIXS16PA1TOs/2djEt+KzY/5EZqJw8vsoTo0okiU29/N9CE+jy/5hCX+aIzDnh2CiAzXUEEwosa/LMKl3XX25raCoNcyscLrQ1g6vnpbS5wxYroJQN2o8Wvov9KuRw9VtOOr7q3np0nkgLLy6dtsK4/5r4DBpoEunXEeD93XcX7RMDTJl8Hbfb0UjMlwWMkLW2We0fuFABHdnREefGQj3ZYh1pF7tWiyDp2I8ByBuQ5wKW4d5WZ/hhnFkL95P1gDYZozOZm3CtzLYx+zfmlegyIG5xzRDiCGAZBqTG1MyqN34='),
('52d1c70d069a88-11842023', 1389484005, 'Lsy3NasEvqFdDuwiCtDJYQFGEX5P+j/gQEGnXu4dztVoOmcYBL7moWiu9y9SExMVJpAndKff2QwbYGFAzd7u+60IBD1I7jITe6R2EFWAbxrmXb48LCS3lBau4iuRSTpw5ZOVC5U/CC6xxs9nP7RkE7wjy9Voez9SpyqhIGiSUnsJRv4UhvCAxcntWKFvwDHmZ+/AsrlFaeZ0xScgOOCEg4OYj3dSSf6Pf+DnjKgBb4s74LFKH7j19CxEzyUx9SQCWzYMyLlfgnQefTYM3QFpLwYFFVxeyauBhq2I21Jl9UTbR8kfK+vHA+5w0yfagceNl38AnvoA/WF1Q9dO9wh2aKYEDjvgBdiFJNPEtsi4d9xLYwnwVdO94bJPi0NpyoUH9koxSV5iUhAMqYJb7/MwPu2zN/K67r15HN7LmFDhtkwJQMXh2srjwAUhqbEcmLJ2/job0E2nsV6HsbGCjBJOfzuHI5WbDdcbs6qiw2I5W/arrcAk/E/uCCyDPcn4WpmpnVz8MZJXSca0ZOszyUso1F8a/bFDHhX0zcW70z4FPET9QBO7wtw+xfisfhzK3TwJMJb5JjgAC3gbegJG6/16Ymd6MxoqWswG/f85IU/cQyMZliU2Jxd9LaiuKZ9ZmqLESfwf+cgrTlUZ9qBOUaV0Ko4MeloTdAKUjUugjvIxLz9Kf0AQdv90n6f/3T8qFi/ujltv6XEAS37dkgR8ZErwzCFgEj/Jl4wlk+Nf8y/5GnizuGI69PPJOVTclRtuEWQ8qCttHAEkqvTe25Bc/RUt6FojKJaA8zZ7w1NaJ62oUquJjtkoQ0jDBDSRMWWEps1zETk0qAVgEoi3BBhpiSp51ULGyKslb8kD4RQi8LPazd0gFB6ALfLeQOPZHselk1cP30NLTWfCNw/BX/rm83nN/AXXK5xn6N0WDgt/AnaGgoJNJeijlwzFIZWkps0YfCipbT3OuQgb13fTl518fEN9zx6GRNLjkg/86MFqBPRQPlVHkAe8Ys9qi7nNgLb0FhY1Ij48j5A='),
('52d1d84dac4f98-38153936', 1389484686, 'q2UpPeuUXNZ9aibrSG8sw8fFMOmM91mr7tF3hF6la5oL6sMgCaM9iEx/qKonx1V3zw3CuOpRJN6Zo6g7gkAI5+fMGKjRfFP3D7zmD/a3l76wYFhlmMn/WGgwJtsVOJskx7zDn8jX4hWgoOgtaZigkDWRUTzKgtGfA/XYsEl9mfyP1+6GODmYy73UoOe9IR9ZgDKXKR1dG0xoe6jCLQ4ivAFqryH3KWuFh5ei5TpikNhLZGdsXKL3TGJ8qUISjymFZcnndhBIjmnV+IkHrswrBXlj49k2uuvIexw2xoD+R2LSJ+v0cWtSfjImxdLdcr9Jw96aGOpkFwV+KIlqvMIVJXOt+BojBh3gUygYjZtrv1VB3RZ+4iGZFJLJ2+OCY8K62EJzfkA3blKWUVtgE9i2pvU94eKVuGIs7c13PTj3N0xv63e3SUZLHLWgjUff0IPjmQLLxAkCMhST0IzLRgynRNEKaJollHOq7KfHK+KILJ6/v/Qd0ypa6chOFFaxocLksanppQimp26xiSdqRrJ70aViddbHj4iXS0/75LLhCHCiSNemwXvewX2/k/DTJCKA9hr8shnh3iJuGDa0SHv9kaxwHPWzSoU0EmrtIp+XKi744rW4e/x59k76VuU7yi53ZKCxBA6nSYTsIxDNbQ3Vu1ogCB0UzDhVd/sAI7ViXcVdhXfLu4JYRGnRnNC7lhPfzw5A3/td9sW94yKocaebJLK/BdNOYxtdxAx7inlWO1ijAP5BR5m//xULneNBlL6opDy18KptcSs3PA4WZH+4PrljmmlS/V4LfsZft3mjRFJqEH7qp5Eb7tyYKwaSnaS1GcrgqjKieL55/zhNBl3Ukw9IJsOfq44kRPMuNnsfVUU742TyqInYcUZbbHS3RmwkbbDpwypV7fwBjKJGw/1bHqFZtvY+Owxllf52ZdypHSPbtZREwauuFd19ko+DvzI/JkKPq+FZGhTt3ogsBvSySwAN0Stc0wm+O1l9zZ3grIviR+BYAvp62xCmwLy4ACb2N54WSUhnB8HvFIhD'),
('52d288dae51b06-75355236', 1389543722, 'kdB2kbmu2ww2xzt1sWP61vaHeVqYJUH+YbjQXvHl8PAfAcIIE0eA9bRG4HR1MW2iATnFOy8YB1LqcI73dAoKB1lmSV9Uuff4HNm4TBYVlrNr8RJ0U+YQlx6hGV6VnfjNwEnuR9ceKa8Fn6SFS+Wp9tciUbYzuBVZD/9oyGec5Nt76/PG5dll3/Rt6UQfsXGJLMzyWbAPV1z5rWST8FJF9VxcHuKGiPO9VfmXyfSx4VsyxFGQg3a2kwhz2NXgIuTcEPmXKkIQRwD9JbfT2XrIWHOtgByTPkTw6j1Q9p+kKhiABhD2zkMZbRy8APkqYt0iS3/6AgeXa4FjH12NgO9C4otEZO+fHlzPDMbWsd9EK18LUjqmdeXtyaLo5BpAnzBxnH2ZaSu2jkG1tfUaniQ65M0fUaQ5OewJHuLXVjcTYTKz4n7aYUdj4w2dEjqPbk7aB0imd1ea5adHWmW0mw49fGsoPOmv7sVCkDNbaTY84n0EEA26/YU+RsZOAeVXyQzHMEVF2QTVsg14Kn1oGO0VytqXdOSylwQpd5t6U9EkpgQ+5MMmTbLcFBNKM2Xt/yyEWs4cCxu8Q5iAAcdtoZyAYzGiHCjmXvXE4qHV6xInsXWZtnynjhV0GRzCqtM9BdiTsKl+/Y8yhhLlYSGMAqMnHVwd2xqRtIcAQGv0U4lM6LVUQPqI/jKTOpPcjSvMYsFrCNp25N5ahIww/ayL2Gq8VCBKHRVZgBkSE2ReFtKi/d93St574YNiFiRPtq+ILrkMNy+sAKIEGxcEVm4deHDWbnboThEb482O/7VMr8/MFb1mqiHC5ueYGYLl9de5vkorljaYQv12KKWFcenS8wOEK11cpwq6omF/97uxvnEvDmAHyC6px0BAFlSmuNooK+9ZsKqQ3ZAeP9oFrOSQj7E1YMji33ro/VoIIiQMyDPKWqFnuZvpGgq5vifLZSI8HlmYkSnxb5FytGvaBt1wNHlkZ7NfjReMmqac9dIjKIUb5ElrrhYFJengWw239R1nv5EQ7rpuZ+0='),
('52d57f1c279405-78799329', 1389740985, 'VWPrFW51Ql4Ev8fkW6yE0CrcguLq76UZa7eQx/QbEXdc2WWXoKwXVYDpooEAzpHsy0V+9K/yaFYWs0qlOTFsCCk8Y84SssRophbWDRPu8ricHLtTi2hPLMshxglEcc2HjCtAxJtn9pBW/ETBlzg4vFYDg/Mec8VJuHlGw1rGtOM/JjeOo6Hrf7bkTv2ochzeLWXSCpnjvImXD1D6yzzmnyxUZZTAcwVYLOSDL6W512MaG0yNBzrgm3jA80WxLc507eoWla9GCeQsAzbE/S6eP0tPlgjxzaiXivW6BjcHkj+jQ/0b77QviSXJk+GX0coBXeePQv1q9hoARdvv+tKfjmlDCTHhSBVoOPMq/HZx8JBhd3qLc8t6UbZnOIn1Rjw7nAgrwvAetzVSTf4pu7vEEyX3O5y6Xc5lK+fuA0z1r/FIhSogOpo5GlkOYe6eiNbq5BkuJT94OiM6E0NSTR5Q9qaz0BabCqoPYjeqo8Sa36L/PKX7/u808QJFlpiTkA0vACbjlaly7d38p4IIEPHhNhrxIPvEOvT0/dftdWkSlzyfYxv2Ks9Hj2TdsCpTL7nsXgkU9eQiln9IWizvLbdjwVEmQHLB8zgxvm8tVDrjWu4BievxtbVA2RNLJiBLTpNe5BuyZxUxC8mapBhl9wkCpDwfMlPp/XruMMnde5O07K46CP+8WtEBl1z3KZvUNuy3hIQWswma1ZD5u3NzA4XNQpFx29indzL8p5IMuU92nO44HPdf5cOo+YXMq5+CtA9Uf5Cu7ULeM7yZE/Njtu/8Idx/PRnjTwYicXIzsK3MRzNhRPkkYDxktcijUVfXkORdGtb5O+XBGRqpNKh8edk9qdi6IoX1/tdKMCp0sCvlcXx+WOTCs79TfYrL4PcxgZSMoJ1rxHx50iMM24U+CJrMaE1Mty4lfqklIie4NGX9gFkp7QS2qPxuGv1MEbo16faRoghPzwmlz6/QXPLjZ9NqqAW0GNOj496Fo9HCraDMydS1FNiSYtwN1zpIVECb7EssXGk3'),
('52d6d28b51fe26-37638174', 1389823654, 'u0NCyr7zBsak5SHJNwIbeaGmn4j6U29u3oRLhbD8JLtI7uX8+U05hs6RXoZ4Vr1kDx68w35z4OqvBKK6my0486m9eEvFkZ1Fs85QgtpXhywFS+zjByzF2OOgpRu6QFdD4pzA2r85f4xarb5kSUtZ2K2oKsotQiyfEIwX6tCCuLFHE/yKuRRuMggxgp63c3i+3HUbAOB0IY/faNPHNQYvzuvzBybW5Rj15Algqqa/nkcxroMvKL03u2RXYvzC9aVmUvgzkqEbp2MoHH2u3Wr+51eWo55M/ujlL7DxyylXd9M+hrK93UxqLWDO5lMTvUaL79jmDURAVZnbr8bpFIn2srRSs2vxvKRldbDovz7GcfZUhiQbUwkccgHnjwMa1Bl11geaYR5hxXrbBb6QD1TmZjGl1Y1z8uxdL8fkIwhNRWbsstBQPSmIi3YJafvPtHUvC5+0WC3RE+mfzb+6tk+wylk4hYpEogxXHL3J9EUP42wU+L+/KydJ2cAEXlwUFL+TnDN2YdGVqZBjGBxQOk1nLVuC6A4BuQYGBXImac5r79xk5JlLFZabKlUMsdYo1z+r9gavmPKQnvUGbmmBL2fs4uJJRVlyvIZdSkJE7G20bzAJHzslK7VbsNe1dPn68KLt4iDQg4lEiSFhWKyGFH+J5+9ATveuJ8cHH18z27m9dSSPK9ggSNNZEj5qJyBSKjbnICcIWYbfUqZ+J0HMXrW4MovFUsaEd6d/pGwolR18H/pm+a0dsN+M0LjYkqS8uw6EvWukXUXiqvPwXGb8ACjihZK/h9O7WuKS2xZuY2qTd7UkWCShp+cK8WWvtbJlE2oleRtz6i1DQDRQQuo14awu5CDibWsaMLP34GaBaXzTd4u4tICuB9qXDy/nkhtmibycwIgc9kpTxNd0hBQVWQKNmPwZmZCYIjCmjz2WqLIenwVnjc4/S10wBZZfsK4RjQ5T9YhOwPvGcBRofAEQfT8rJOH1ARjh0qFTBU01eMBVyX/deMmjhPocIL5XVXjJT0YJ3hZi'),
('52d7fa7789bd55-14880740', 1389886072, '1tFdo3yypJSelsz9Z0e+ZqqKdxDSbxd3u2VnL4vWJ2JjYRVxg7Vm1+x5/T2br5A/goxviu5QE8zSMALL3lDGuLHWO3Pm3SEfIJtbDNmGR58='),
('52d859d3be3bb1-21213975', 1389910488, 'R0PpZvU8NBMGLaQKYJ3hlWsI0OKknT9iWWlKnGt3jX0505zf8IuF4AV2WevfRzRx49RdJV3op51VOzrIAoXpyF6nuKVmu31Esw/ikASMDT08ZmirlFJpXuOZ2KJagoZk9lfVxULtqZHGyutKILG8bXt4LizOFq9vBiVUkMXI4p5U7mENkl8PN1H2ZWxkmSFKCK4CEVwzvhsB1g406lYWcmbHWmosmuwIAnXRMkmprxi0JnX8IBfSMlPa+6aOiU7uXcv78RgaVGYC+8Gw17utIwpnZVKhyXPWm1k9rh2qbYZ5cT/6prrTNy3ycZKU0t9MreZAPx9Sjs7oXSzAudHWIlkVJ0yycT2Nn98B/aeH4c3iv1AgQObZqM5NuZmUjnspBAeDOg54kc8ed8WTgiKVjJxZq8K+ATgSQLzj7e4i8UH3msuMc8fISjmBYUzMMg2TCFCNmpTYihfIxBhbJsL4Zz21I0GNCj3gzAc+O9XT0pTism27k0FmEm2UtZgFMKXW+/e7bJQKXgvFCSpul2LMZuliW4wEtBY6LluehAr2/Je6ozihFog/XLpplfTEy4o5mL4NX2xXS+ps9BhQKuat3ICcORj9dSI7G6gfxZ3DQQ0fW65Fc+ApxV/l55uFWSfJJ/rdNDar0x0rotkKF2blFLxnSid8zjjT7wg5qd14K4g9MKsrCiuv73K9LGqNffLmdvFA3LE0M4mcyJ0tAACBrdRROvmCf8eALXDKKN+yGswxxld86zshMgS1LluZcKyBSrvS53W1F8z+Gm9JqPpW4yIj71ojupO0DPlDeELutkaxFFPvTdBkS9ZVTAGbr9Vx9eOKMkz0IxMTp6Z8B34sxt1llirDjJ1FZZ/Fcp5uuUQb1qht6yW6D3bqZyP81OGkdrnPTmBc0gbpiJJkVnH34GeVXLRFs/6uH/g4Xx85+R9BYQCgrPM2PIOOnXTrE4HgLvgeiysTgaHxue8uBASWGJYZPb1dkqejVOqRBEbvzbtrMQJt9ZC5araX3kiEKxMcw3A1XqENpXCPAUoR');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `username` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL,
  `logins` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login` int(10) unsigned DEFAULT NULL,
  `reset_token` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_username` (`username`),
  UNIQUE KEY `uniq_email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `logins`, `last_login`, `reset_token`) VALUES
(13, 'user@user.ru', 'user', '3f884a8dcd987e71494a1390f9b0a51306944707ede59dddd003428628c64cf6', 46, 1389910454, NULL),
(14, 'admin@ya.ru', 'admin', 'f4b4ad84a019c58c380e9ac1a9ab12c4bd4171363b8c6822b8f2c5f2ff699230', 63, 1389910483, NULL),
(15, 'Gangsta1@i.ua', 'VladikKiller', '0ceb7798fdcef9e678cd28b0bd6af434e1efbb2381b5a9d447cf497607bbbf3e', 10, 1387570500, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `user_info`
--

CREATE TABLE IF NOT EXISTS `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `fio` varchar(255) NOT NULL,
  `info` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `user_info`
--

INSERT INTO `user_info` (`id`, `user_id`, `fio`, `info`) VALUES
(1, 13, 'Василий Пупкин', 'Короткая информация'),
(2, 14, 'Администратор сайта', ''),
(3, 15, 'Лотыш Владислав Николаевич', '');

-- --------------------------------------------------------

--
-- Структура таблицы `user_tokens`
--

CREATE TABLE IF NOT EXISTS `user_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `user_agent` varchar(40) NOT NULL,
  `token` varchar(40) NOT NULL,
  `type` varchar(100) NOT NULL,
  `created` int(10) unsigned NOT NULL,
  `expires` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_token` (`token`),
  KEY `fk_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `user_tokens`
--

INSERT INTO `user_tokens` (`id`, `user_id`, `user_agent`, `token`, `type`, `created`, `expires`) VALUES
(8, 14, 'd304b5286ed9eea23255c128b19f885557138b7c', 'd85178909285af882c9513a499a97c5e9d108d1e', '', 0, 1388435631),
(10, 14, 'b5710ad457e1899a13437d79c426280f86c19dfd', '7f0c7ed74a116833d6ac18882287e94d84c93ec6', '', 0, 1390693709);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `roles_users`
--
ALTER TABLE `roles_users`
  ADD CONSTRAINT `roles_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `roles_users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD CONSTRAINT `user_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
