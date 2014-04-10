-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Апр 10 2014 г., 18:54
-- Версия сервера: 5.6.12-log
-- Версия PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `kohanamvc`
--
CREATE DATABASE IF NOT EXISTS `kohanamvc` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `kohanamvc`;

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
-- Структура таблицы `files`
--

CREATE TABLE IF NOT EXISTS `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `file` text NOT NULL,
  `src` varchar(255) NOT NULL,
  `type` varchar(4) NOT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `description` text,
  `date` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `files`
--

INSERT INTO `files` (`id`, `user_id`, `file`, `src`, `type`, `size`, `description`, `date`) VALUES
(1, 0, 'demo.zip', 'uploads/201402/demo.zip', 'zip', 8287, '', 0),
(2, 14, 'Цитати Д.doc', 'uploads/201402/Цитати Д.doc', 'doc', 40960, '', 0),
(3, 14, 'афоризм.doc', 'uploads/201402/афоризм.doc', 'doc', 31744, '', 0),
(4, 14, 'Citati_Deb37_b37a.doc', 'uploads/201403/Citati_Deb37_b37a.doc', 'doc', 40960, NULL, 1395237258),
(5, 14, 'homeb449_f5f6.rar', 'uploads/201403/homeb449_f5f6.rar', 'rar', 183570143, NULL, 1395237278);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=95 ;

--
-- Дамп данных таблицы `mails`
--

INSERT INTO `mails` (`id`, `title`, `sender_id`, `recipient_id`, `sinopsis`, `content`, `read`, `date`) VALUES
(54, '...', 14, 13, '', 'asdads', 1, 1388866074),
(55, '...', 14, 13, '', 'фыв', 1, 1388868185),
(74, '...', 13, 14, '', '333 asd ad', 1, 1388870164),
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
(92, '...', 13, 14, 'Привет!', 'Привет!', 1, 1389910474),
(93, '...', 14, 13, 'хай!', 'хай!', 1, 1396859628),
(94, '...', 13, 14, 'Все супер!', 'Все супер!', 1, 1396859658);

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
(13, 2),
(14, 2),
(15, 2);

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
('5343f8c3e08b54-85215744', 1396963528, 'q+z26q+V11FJuvLmH6Kvs/9vCIEl0x6HhFoAc4qYYirEPTbnbDXec/SNhooxnektQLW5VOJyOWECNJ+3H6uDyIXE9BE/kXcdpCccotsRODoIov2pTPZpkU3ZXfB8dqizxmf4FbM6ZsBUgY48MJOr+w+/tCtWj9iUUhZRcuSgsti6FOc1mO7f/kJ67dpc/1Rd/tSQPoeJd+qzeNY/nzSQPGy1sTErkbasOPAoXmGyAYUhEyugFC7nEvn1cufvf27MI40FnN/x7Vi8IffrXUu3zCzgb9+tbX6ogl6jmxb6KFZ4bpfEgLSGPP3JeB4Ow0qNTN5uCPwx5+4m1wKOGUGLu+W6lptMBv61QSY2D9Yic808wSI6wPRmbdEqu+IAuakrY9HosydvJ7y09m9HK2ZPvUz7bciZX8MgB8UIj6j7GmV+GzKfM4DlFqq99f8wqEtsq+jm4JucqSSmji3xUhk5Os+MBpDuQhfv5KhyyP+7k2R4hIPQeRYxGmDaO928/fc+2NYD/ngFOSky9pkGYsNyQodXN/RkXY85QQ4d4EeV/MBDufuWfMyPAejCi3WwJG953jzJl9dUWRAsxvcqv6QaW7LM7joEiZ3VJBCbveputx2h8Q9jqKcjAKCxOw+CnFg6lN3+bxwpptd0hd8452DJIe4nfyMWwUz99FpUAsLbHB1y/pd0qYovGSxRo+vnzP1mEphjnpBzY16dj+0Vef2mdc4EuxiwkR7pxVWDI5ddX7dYKaJkEWQi86Jm+Cb8XYHOzZlkEe54vSOPI7DhTefiHL2+MSKceH0fkZHJvtBHye/ga9L+DIQgYUIsM6HdxoTLmGSoeVjuvMl22M6U++lQdsdh8s+gZbjpkniF4yBQFM5YFhWp+5jS6gXNMK6dEZ/0ECV1zU5gAAztx1IGyp+aDQJv1PKrcGR3pUeciaUzliuQCNbCYIucum/c9ABqJhftR+X+QvB8IIoIy+238Ql5iXkeqbWcP26C2EvMezhz6Ss2QNC2D0dqyYQPvNyrVGQ2mwMwtAlLzAVBxmVJdsTt3WtW9LRM1l8gEGYtQXkoFR53PGtF8NnvWuAAMpp6dSXK3TuWxEa9pXjy1RKcTLEATkhpN4K/Bv8BjAoIYWNNxSMHtVwtLqpqE+J/uACjoURc72mdDRYnZ7ezxbOt6Y2qljtrl9+Bj+aDCUSrWuV1NET9X2EHjJHgILJLRYYgEEfcj7nYecNSTq/wtNwhduiWw+CTXIOvIFtnbc3mgYNGN0L84y9QxxlFAGYEys7hYOueh1u+nPrO'),
('53426311630f23-19074242', 1396860032, '2UKEjVhLH8k5TN9RY8xtbNXNBtK48+ez2nBubK2aqcYSdXtRKTDn/+WlbzSbPpC4P5modyHB1Q9Y9lyxLVKRxXDQoLP4w6tpqU08cHFflDqST02X2w6aq7hVDclcbqbXKE8r1Q9PFjD5xvfnffsNi5TYbwZJTTsBjIXXqhIaQkBQ9lFVnlyzkurnRlrT6aGz2Avdau1nYuFR50xGtBQJ7SL/OvPrWYpLj73vftsEQDZgNPOydNff/p2yihAZreiOOaqIyWkcOk/XM0kk2P+GjVJ0tO93ds22hQu39ETFzhbPBQwSkLrWncDi1CZIKcMrsvfZ9HfjjlSqNYVqUECKDe8yfwJP5wc1e3Ksvt6PHPCSGOPJxBqtXmeooxHkqzqN3cqsKV1ruAIFCKzpRgPoX6S2VyPBuNqVzYsT38K+Uh5suvKmqPyxiU/bD0tfqLG/9u7IZW4TvoaNOcMlckzZTDyi0U85PSB0QyDSWk2YbpbMeXANnKl05PsXefESTzFkps5yESqlkbD2xJobi160y4esJBsli5McRlWjVrxd4rgZPYhwcvm9fvtAc2IFiqU6orTzjsoVlzyA7FptE8bKyAmffrRKqX5y/n0OvrpjaH5LjeMMiRQJdfKfT9Y+bzVniKpbtsj1dw1XszjdOXhFKL/lWGiltg5mkSSG6amcGGtN8o+V6uw9tZkKl2AcOEvCj3ntKSlZdBSLk9gNw9zTrxPfPAvpCdPy77xzQ/ngpjg3VfU6VsMXR4ht45fiba3LNuG/NGGV27TLMozD1l615X50Wm1BHZfQv6fGy9/EBJgEaLUyTTLFxuYsPadTaLPfTjsiJv1LirVKCdAwGfMjLIoF9YV+OM2CFC5ShOySH9HNCbbKg5yo4kPBGXXPbzE55lmg0COZXjNGUjKF6PL+pYYsVcOYYcj/NSPgrGOzqNu0gxJyPNcEwAlWsWj/jYGRoFQXhPS5FkpJ/F+wHqhZ98RbzMTOwqo/ySfxCJlu3d2YHVHKeqCOGxGR6I/BFinrQZy7x3Xr+aQigr6OrbG3wDSs0iRk2UGTNmblf/SJkpOYqzlNeJYlD1dDcT+SPmXxqca9cJkLYKd8mf0lq/8M76k2MZY79m1TNVngzFncwlr9APeUGnKN+/izHq3paz/PA0Fet+dQUSXpxkUOvkQuFKn89ZZfcdBtkNesvw=='),
('53463d2ce68255-67575498', 1397112109, 'jvW6++zyemRvcdAT3FlHrs2xdPzpspripW2N3WXdU+D5d299UzdsWHbJAWlB8gPifoI6Q8735mqEbL2utdCUHwgpB2ggYqwM/Mpb3wAUY6wB/U76'),
('5321c5d40bb4e8-71712099', 1394722260, 'EplycMt9Vaj5cp41YmHYwCOXHMgkMj7G6hd4Zu/vV7qxEuRzySeCsB1ZQ8PARsEfDPKH7g3V'),
('53299ce52ae537-63857674', 1395237696, 'ysf52J5aoTaDVJ7OYj2Z63YCg5Glgt2gnmmd88DThCRRx+K3TwViW4bArIlNKk/FNJWliO1G5jNQFFunky0TnNuQngU8fMEBfalm4t+PDwdGkra9j0WUqeMOj1l2O6YoPNX9sLo/SfhYW7l/tvtwiRI3MpyA4xFDieAHNBC7+lsBNU0db2kaFmD/fcEVKIKWtj2a9r37pLEw5cFq1X/i8W+a1dRojSHmLLPrZieQfr8brenw3uSLFo02QCLLOkGnwgyjJsNNCAnAkjaQSyNHhcNCF208KZ77L8PRtBdsTh1Pz/h7o3ET0c2nvjz+qjtF2qBt0+G9XcHxsdvG6v4ma0rDBn3mCliEEGfZQoZ8wxv8dkatXTy9q3cGfxMSg0pvc7sC/ia5tuEqxaINx4r4Wt5sta0likAvWiczx+bWt2azQmKztOZKzVckuW9gPgrWXbLNRKXRwEtTI7hCdTChpUCLJhCgZIoDn9wJBCQFLhlKykFrw0WdDvjV5MegZai2CfgAc9x9wO3p33MHEjkBKnMPoTxgpqn1KBL5j+BJXQsJ6/qKjMMrsKkJ7OXP/MzjxmaCy2Dv7QnQzbXb89BH3TyBfP+D/gMfFRHQUbSS0g9lINtwm284XfoJ2+AarIGInWOTJFxi7epg/ZtWFZOCaUCAXq9x9vm749t1sh+QsqWET9LzoQg/clxc9m6R8aw7mPjREMx/pMbpk1IIz0I5EBSlmDuWnU3qI0GyMXVI9UKwrryD0QRFOOybkwkJFrHYgB2hUcKyvwpWmSFd0AFMnWCX0GWV/JNjZPwFBHorZIePCviHuylA0q3uFGTNzHYFKelxq59/SGplSHugovBt/KzpgBOS58XOf9tqrWSij0RUvDkmkypJ3htr52cDkzFVIuEoPbg2WrAxr1CxKYoavy+yQ2Vg5folcS8TW2kLaFMUUzWQ6aDEzlvWoo49dPZIPhO4o9DHUFo4dThsAWQal5wi79Dcn4xs4P1XgztzbgOGxPuYtNJAEWFaoB8T1bE1KcgD/8NYHImn1I+DMgKwBtg9fWRQJpXLZRmJNu3iZDK1qOX11EsXAQfMo9dZIE5AXeXDZYOg8Gbu2OrhKNvRHuKAj3VJ+r/BMmxME7yYsZhrru+qruuCPP7oZBV5vRsFSHuRTbRaSH75MRPSKcAOrH4n6CkjwANH9w=='),
('53463d99051811-76572798', 1397112217, 'qmdPxDpUvp3rwsW7iZrsxrk+ub+9HeXXhFPgmHP+cYhIk3X7f3DxppmHFVL1/Qxa7yHvt8dL3Yq7hTML1BwM5tWEj1n/EazSkh/fQFTsIgt7bmOX'),
('53466058894615-46042354', 1397130185, 'Ds6eRCREroOnbRBpwBKqflDwZZuQUCLZcwkljANfqrIoYXXf00WhWMDYmGXSXqXMd4rI3LrJWhB89T/ULRJHtxjSEFMoO5ycS9/h9rPedWCcBJ4EccOd2Vo+NLo9Q+aP0fP0s4YBqhUw4TvAj8R1quxAvrhnhpyaTKl2VgD89g23OzMiAZF44w8bZw2ufIJD9U5oEs8hBs7Z3N6ZZKk2hoBlqNqO/1OSCzXMWwcuj5XM881tBCJK0XFQu8waOrOOraXCQm4tb4ZdVcml8sTGCGpQewFaSchWMFuvEi8aPjxzUcUHRmujMRLLFMCWNoQygla2gt5u6eRcXN6YO+eQNgOBn78ZOIJpCBuKr4h8AzokD47JvcDZGxIlQyZQUZyAcgfrFE+e7voJRNQ9jo+kO5zN69VmWYLeFYJG6x6G6rnjgCPX2kPmtroTZfgAZvhdPL6U+gWbdDPwO3cA56JxsxqFBLTeMkvmnmdmGkWURsVz65lP1SK4zoMFoLBrurPe0IbWMtYljJ2nHWFaisDY0zrQKHb731LKnE5j8ruKZvdu5+N6sDkDMuYfI5ycdrHws961Vk+QttFKsofH++g9+ZxRHnajPMPScQCl2Ch5MlAYKwz9bHEYCKB/Qt100JWz1/WTQeaHziwK3IT1yI09O6BSsReXE5vRplnpdlxhTCRf9Xmw3Qz/WH7R5G9KKU1ySWyUAvQna3tiFC7kgCu25WrT7ZSEWMgoAe28uBdhIP+1AbsJI86v506455tkexPr7fATuwBFDsQ4nX1kA7cMhPpHJz8IlMa7a8PUqCbAEp3+vqlxy0lHv5+11I4H1N1KPEjJJJUG+FCYpE4LGqUvrzrIc2DMB3MhhiDcpK3E+i4FPY95LK3EVz76p2HMGu9Sn/niKQ3WHyeLPom/JSlGxV5ybnUXhYS5MB99DFC3Q/hhezfPyaFEMiPMdXLP0KbvqkFBBW0wO3h4eQ5/eCnfsaTuEaNZQs4uHZTuhGnsSkawjKSelxA+zIHKl2U4xwVKMhsWLIAb6vGOcwCyKJz9mfo5WK18ei4MGiLrwqkTYpduPOmulKkXNQE1X/Fr0u9JRJZtDwejVCJUz1ltJYP1XBwxwT3zR7VYCyuhzeEcbEvY4nXirwyzaYZojHyTDHZhPrzKqI7Qa3jV2em2YUnW4tC/CKxt9xl2SOdQCjfMT8uqEccXm30='),
('5346e88e254261-45831051', 1397156082, '8JNV9jHgMJL4JGfH0AVB/T0ZRbJt5hfEun9e2NovmgIKmQ9lc9iKYg84MDsIZe7dii57CTUwnPxV4nkMjL/vXL1RLvMvA/FFiikGQ62phZhcW+oPgL9XSBLES1b5nG0dhpRqFDXpmqnIxYqAqTaAvfxj8rWoSO/0riRB9DJrZgovvLcHKKBuUmcfb1uNZcp+lRVGu4i/HGuqqITeiqm8g+Fi2mkiqbCoer/Gjeg2PPoALhBqDCUVxvtU1dt2oHeXxh7wE5HfjCs1OOzxaw/n+LieODmG+/VPOuoSuZFxYNxizwGL4ZS+Fwbf1xl2dsJGqXl5/YayzSzGtgQ4D7uI3GLAu6puWFZKBy3fyDCyCkuhw9Z0N0rVHMPLUDE+NyJgkc+kNTGMVjN8JUgZzmamirN4yLm96ASIULwkNydHTzYq5PKh/Q+K8rHxckCLMQq+7wUXjh+xOJqKRCN4qToVYijVVCMqo2qi/TbWvCk3cRWfhmsWyycjJdG0B7aCkSDElQscYrKVmBu/0wyjh5tQgFxUi8zaNuxjHHU9h7wduhzQVo3R7wiCwo384FhMTXYc0Dc6RDjM0LG6CMujUGkclUx2S1N6lIV2QQc56/yxsavidPUOm6PJgdP58QbXdUz7uLAIebYb4243M24fmoDnzYXO9IpN7PbH/xN+LCXpnY+X8huvSjJBnM69EUiklfWcrTZAl7j3hwjrqfHerX79ORCNzTTFwlCR1yXy43CIMj4ubZ2YFNdrDVo3wSoOuiy4yv7P+mgfSoF1MMujhBKlux2bVKg2/zPCk+P7K9azc4bXDzMSNjx5wNLLMkwdi8pjCfykkicfagc8WpcDIfRyMWhUTAzaS9pbgvqztD4AeKIeov4Hx5fHzX2DcS7Kzo1nDg8w4+agtsIaXkBBh96an5CHLp3/6aLSfvt/eiN4LbDS2ORrXQFOWEHSN4NY2KJrvoLey8CrcoeVDxqy6OkXrWRzST+4krHSkHimZnxG2KwImkC0TRxWwzG0pZ40oDxirlqtaNli1OfpvqyAliNJV6r9q62e50UpXz2XCsgCaJ1jpF+UFfTqwCip81vrUtE7DFhK/oMl+hn/aCxYvffo5dX9vNpu34OFCqTH52AWfoh8/qce6DYw0gK/XnsSJdQbzW2uUV/9qf0sS65dncsqBIzgjM48Tw8FUw==');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `username` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `logins` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(11) DEFAULT NULL,
  `last_login` int(11) unsigned NOT NULL,
  `reset_token` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_username` (`username`),
  UNIQUE KEY `uniq_email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `avatar`, `logins`, `last_activity`, `last_login`, `reset_token`) VALUES
(13, 'user@user.ru', 'user', '3f884a8dcd987e71494a1390f9b0a51306944707ede59dddd003428628c64cf6', '', 53, 1396859656, 1396859637, NULL),
(14, 'admin@ya.ru', 'admin', 'f4b4ad84a019c58c380e9ac1a9ab12c4bd4171363b8c6822b8f2c5f2ff699230', '', 80, 1397156082, 1397155982, NULL),
(15, 'Gangsta1@i.ua', 'VladikKiller', '0ceb7798fdcef9e678cd28b0bd6af434e1efbb2381b5a9d447cf497607bbbf3e', '', 12, 1397121106, 1397112220, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Дамп данных таблицы `user_tokens`
--

INSERT INTO `user_tokens` (`id`, `user_id`, `user_agent`, `token`, `type`, `created`, `expires`) VALUES
(26, 14, '4ef7f953d576e3400cf007b2691f589497e86cac', 'dc4f39f515c744ba3496e5d8753c66361c0f5929', '', 0, 1398330712),
(27, 14, '251b0bb64a1f1b6b72f6ed6227fda26a29132359', 'c583b974fc80e0ccd7ea9cf52acd58b3a2d622cb', '', 0, 1398365582);

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
