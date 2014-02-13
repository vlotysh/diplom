-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Фев 13 2014 г., 12:33
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `files`
--

INSERT INTO `files` (`id`, `user_id`, `file`, `src`, `type`, `size`, `description`) VALUES
(1, 0, 'demo.zip', 'uploads/201402/demo.zip', 'zip', 8287, ''),
(2, 14, 'Цитати Д.doc', 'uploads/201402/Цитати Д.doc', 'doc', 40960, ''),
(3, 14, 'афоризм.doc', 'uploads/201402/афоризм.doc', 'doc', 31744, '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
