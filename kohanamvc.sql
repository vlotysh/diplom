-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Дек 18 2013 г., 19:38
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
-- Структура таблицы `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

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
(13, 50, 13, '234235 1', '2013-12-14'),
(14, 50, 13, '235325 3 ', '2013-12-14'),
(15, 50, 13, '51251233', '2013-12-14'),
(16, 50, 13, '1512 551254', '2013-12-14'),
(17, 43, 13, 'asd ', '2013-12-14');

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
  `content` text NOT NULL,
  `language` varchar(2) NOT NULL,
  `date_change` int(10) NOT NULL,
  PRIMARY KEY (`id`)
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
('52a9f29f789b76-85521042', 1386869407, 'I8t+ezBHMgH70bl4kJDcyZA+1rP7o7B3Np7Z8wlUoRetR/pSX2H/76uR5vsGU/s5cLPYK+FvnP5Mw7T8kOjt4pI4UHV41XyTVE9QHIMzjno='),
('52a9f8aebebf93-68498730', 1386870958, '6OufrW4txv5wcc7HGYCgkNN4+5xOfyG2DZMdaZeXj/IE/ZIp9ZErwdXQDAOUvgsO/h6L3l2TG/P75G9hqM7z3thXJt1x+e0rpAXFbc1j48k='),
('52a9faeac0d3d4-66109316', 1386871534, 'B622qCWRv2rqC0Rl4MGMAaZeVc1R9DHMQLV2TaCb1qECCnxXutcZTpPaxNjNdNJSVbrJjeCW3RUGgcUjOE2xaSlftHMFAHrzHChUcdNKcktC/ja33q14htTxWl55qP989qesundBkQT8zjlrdRtVQttB9ycZLA9TvNin4bxuzca1w52MQZotHzNcqrEzXKFnBLP4806KpUzE9GNFrzz4OC5T4ejjTBjKgVUN6eINpXa+uqgqg75Wqp606B1H215RBLn436K1PL8cbvIx5PAEMA7OPXaO7xkeawLRHYxx2+WvnVQTC9hONUt0tfIsbkoJMml9tUGFOgeGZbqL/4+JqF5k46CMkatjSLqm4y/Cbm7Y+xM06VMBGAg4Lmeb5LSTjmT+PlBFOcALsZLsKJ+oY0K5R1Ez3dDWwBuOBsJb02l6tuA1Y2CUYP0c62ATBFOHI/GsiD3NKCSTOgLiEyb7Jsjs8vharqb+vg+po58ezg1K1mAAwHucvu/s9qIqeZv7ruzFZ48/qU2rqMa4I3QDRPSTCsCmSlvFUq/XjbPtgReyAZkA/oHNzhnipRwYFVKPVfxCLkQKvprcuLznOxklMPDF4cF/6lBxBm0fGhb0jlGVLoN/RMmHVvwAV3ZKquMs/vpQwzG9twtxl7S0GAXED0WuVsJcuO8mcWG/i7bDlxsBfQ8GycNMxLMugzsm30NelyOLSJnDgJfu7EVIG+ZyQqQKNZ3e5TAw5326WDsYi3XfjBJl5C5GbUPnouX30Q282ZzO6+rwJSqnM0S55eGSNr8sOeZ6wNQuzd+D2fOo9naefnIRMajawcV3tN1ooQsG6/3ub7iTdja/amGHcaJ83K7p0hP3f+wW0GsZYlHX4LqbfVmcKqNis6GxF35A7aI4tKwvpCnenLkdzQ+SwwT0qq5Fda2dWag49J1IiHhGavVtf50DSs7Jw67pfORbDcKR9Z3GxKNrNqneLfAyZj6iasNLseudIjSYA/KExqdsFdZ+Z7r0lBNHPwejUomfaCEV'),
('52a9f28f9e6647-22581960', 1386869391, 'uNaMLAnBC8jnyq3mXxg7b7+EMa8WvPyDSIoZIwVhu2znmToy9eAa0xiUi2PACc85z4uAaddtfPIkQUmRa0DqDkobJxjvh6N1oFlnF/s7MiX5v59VSqkayLmFQDQoXflCso/SChmVFiEDOmbemoUMedIrhuDsVQ/ftuC5SB5j8SOfKhK+VZ3ZccZMYWNvYNdOKJaBHbwIuC5/gE3OK7TBMRn+Lmm5fQscpc/EvSvgo6t18wcqGbKN6phSEFppuswoOMsmRKferexvOab7YefebGDxKyiq8xwqlCCvZF7R9I6qIotMOLGzsGxWtUS7tV0Rs/73EFtBBQ8VYrTaHMbxuIOnv78iJy6dx4VAEo/Zgct7orMuErNpcNBkplzrdkB8JIo84YumnIJsWa4giTyZWKvSVR+s659muFzdiL33x2AF/sh9TApCgs7pFDA1CadP52YhI38w5EYQejczcl+OjzYzlRh63qFr5KqVeoZQYVn1tq8ZTmgqPPg1pSM/d/YiczidbV8FYAv9wF+YjGdee6LSRK5zAFReeYzHnBgHuFO0oeYb7WgrMqDqO6yvVYpE2nU0I7toT+yeTbvsPAgkgBNE90plAht+Y8kDomxpiWCPDcoDpjPY4/1NLZe/426QSec7sAHv8z7AMv/QIBV0fLztcLdcoRrrUpKxA7KS0USbETw3oG26RceMM3mnu9AzCkyq6buQVLkQVDPhgxjYQ4raFInQR1FuwB6b4+ZyiP3FPUlYgduIwiiIEswtklDeDPz4W2diNwUjAggnSg45+MOvmnlcE2Du29w2ibOwR6m3ueW9GhzGqfm7NwYrvXOIIqjy3MOajCKgBhC1geWgjnuGKzO/MOLcbJ9gsAvu53Bl0PEv/tLUo9pZhtPit2nyFeCUEFcZ2bZyJ0r9ehY1a91uVQjQXk4MA9VrjgXvuxDuEvBu6yJL3A1f+VrfslZUsQnhUYw3HIP4VawhBUBi/D0w6NlVAJoAby8I5ELE2X8M+5+Lc5is/i5fI7X4yWnd7h57wlFkOuLByTZd+Q=='),
('52a9f1e3da8718-25872142', 1386869220, '0R4u8PYKV5cPvrbaAMHyAdevza9zp4YF8NARHMMWPA0yjLrfSImmk6jlJ6CAhW8os7iy21espCSjql7Nvsm5e9nQEF/kLCKqLCj/G0IuXlcXFVSBlL/ltDGeI59Xhd8xWp4wbQWTXELwf7Bm0xgCCpoy8vJoP4695f7wLM88mzJ4U54yC1Ue65VX1jzTX26fFXJSdPlHdfapE6/2wtMSeJtrqV9n/7p5T1++0Jf3EDL6XAh/+zGDacbz0CAFNyYMjyM1WwobjhjJ1HuFG3FvOzaO6faIViy76Nb/4dHiUlpWeI4POuQv13LHqF0VKap/qBnTDdMpSzFXuOx6D7ooRfeMQCvaN/AbcO4TCb5dEfPNdFM7hGpJknxKD1U84NXtqSQ/WfK8B8F78ABUVcbZQT/TAewihF9DZgvWJZWv6o4mhaGbjGzxaHaN+/xCx7SAekPVxLYfTD7xIv9IpaALjsVdHXYJuzfDVzaC+3nwKPcyx1CckUGz1IS5vTGS1KPgL2tpNL58/NtrV5gEgb82Js+n1DPq2SxNR5qei7IaMrnYRAkcDnBZ11OuaOVtIHXktefAYsNlpmvwEvVzjA2dmrGuparXsKy4jTI8z+YP5hatFi8wigkrXokExWpR7eRgk0h3zLHN5o9OMqaoTR5moCxuHghoV37nSn4qD1PbzKosYCE/8lbIzrBKVw9WBW4cN3BG/v/qtJejjooYKcESf96IVMNkfctou8uQMyUa/mSvPDGyEm3oTkfcka8ayJ3eUy/KBvNxrEFF7eYZk45BRVFeXYqTc28psa1mI5N0eFx+EHmRUjT3Q4CM9TvhjXFGTGztjh4Z6wAelBshY0cUzQNAkSyJPZqzkd/4XehzExv7MBBB2aGU1Ef64HYxzZDK/3E1srZEOcCSJd6e8CVOCbEJJyTAaK+C+QGRcOKl1fWEZDoGXLA1WRZkslVsN6mVN0h3944yIJaF6xb7Gz58CN5+QHBQo8VwStkssSesaUI9/Jm+GfUJ2AAAX+QwGHTzYMW12Yz2pS7XsSg='),
('52a9f176b23b25-31969238', 1386869110, '/UZ4NeFPOvpb1DXwER3RHnF9oEh3QmlCReQJvPMLCmrxBmY263BdtK25LAD17eyEnfexMPcMJRtK5sY38YZix8+HFWAxsa0/JDmMHtOZ/gOGOaBRDA/mSUpB4XatzAZxUOS7a4ylKH/3drRWoEHvASrnUaBKz5SQjSpKmjDXkdfiW/DDIXGgzvvVroT4dLisUpZFdJWKUpoHZYYe9NYse6y+PQ3FLQCA1n9Rpck+e0IV/NgAcpLjiqXJUVCR1zPZO0wl0+lYr0i6NkdpljwKGas1i1OeFEgE6ITYVBOYIeoumyt8TzudW+vy77IDi7wcIMxz/67upEUI7cpwXFMv2e3eRLgF+kLeli1lumJ6tx+zAoJjFgoIFOpq/CZBOr3wNxiQYAkK9opdRUEbcwhAgZa6tCoeE2vJRd/Fnt43Fo/hUCzFSBjJ6myrA0edyZoBni99bHJID80BlHPHwQog6tzBgcfYBF6UPCq8/S2dZ/rbOLlSzBF+QuNAUPcUu81MCj0/+1P8EtBIBD9KSICGfUaMTKF5G+zvNp0k8G5c1Fr8O+TvyZradzCKUyxFqKWNhGOoFSxcqdIgomYfj372p5jfilD6PkC5lRGIwfXWN5Z+qiWDF02+FtfBtWKIapdtNHSC9eNBRDhHXUXF8baE35/VxsYL7I0P92NBSrp2nFvnRXub7KQ/PdllMsvUOz7YaHZ/oWDsEG9SthK5jgGddL5MPfcDETM0jzeenKY7dhwEGMhLq2vHlGWq5eOtphI+1+oXvOA+sdfs1ZxYazfGMrjQNjdcf6Q9UPNvhfl1OjVZfBGTd+Cxv+NddcATbcFr8uPTwEauNqAU7wqN21/OTfviUF9jxPVeeo2UkJvF51bHy5qjzC81wyZ4H1XJbuwcpVRYLdDOSwHcOj3AUY+9PFJGrhfBCoa+AbXIMFwkNGeV2dj5YuvOuvoW0YXD3JDufnsumF8dwpdVZQEQsw80SBVS417ElGWnIlcCJ/VXAp4/wtl3NBJZTFzBVobtHtyA4vthNX8QGWWHX6g='),
('52a760685c7b54-92819865', 1386701347, '/u44qLRlQQWhQdTqTis8wqGjQebJg3cnktpBUFRvOpl1xJDqDIYI2fZOhhWRNGEVg/mQGBt6aPaN/mkHLbE+yu9YhTRFKMXJVTguZRpY/8kmsPz6a2zbVPbdWxAW4ETUVrswZwt6u5/Bc27fKds4RXcvWDOOyddmknCXSgdG/PgGvkr4RXE71AdUkzVhVzkMBCr8h1SNrd9CuoskA9Ke8UfmiqBOFGlgeyWjwpbw0Ow/T2R7/LHvtwUuyemRMdqu7NmE2Jr9+ZHDlQO1ZuWO74sx9OtuKZxVAGHIMD6LRNW4WTMGQhPhsnHZdB0DxDWkaIh7FfKIftfz3O6ItWSR2IjPKOhN1vmGO0wGuKC+tzHwl88ZdIZ2AKdIeb+Mg9n7Nq7HKZhvNxtPWUWCsKZwKcbobMSS1k0sYjKaNH/pK+hVHfF/7ZWLGAkZz0lFBoyvvH8Z5NpVQDscHyxEperICzNR3vpCiAiMQSDN0AAZ4ZCct07zHyIHwRcSY7UeZ4fq/QvGIHYo5Ac50heRV8Ka3Tgr/0gFpIvHcQa/oRxVJn5vy+gd7+S3fx4TPWqOWM0qSu120CEF0B2kvHA5AG2J/PO50tzUzatDtEukzwOtmItVGZwhfhzzk+MJG+RvUunR7007F3iNeUPDMwxi5JVFSSp5jxZj9bDGJSwwrBOifmh6+7BVKKOhhlatJr83ciRBgrTNaOo/EoZT4bxVFQIZn1bO7BuJa2MOZYTv+UXF9Hn/5t45ZXYPZCvbppsT0kS1d4WzGPTeQ+mdvV+vbzkJsBwfDImgDxD2zxtah9dO2zyDzqgizVhHgVj0e6qDw8owDQNe/Us4pbMPIYMbyT0TMdVUVs2D/3x1GtFTLWsz9RnHedZGCJAWzxqGhOhGzgTg/LoJFD7156LaTXvivuYl6k4AIK4Xd/S9WmupCg1g1q+UtQKPEtNGo3flXNG9+IChLEw5a8xgdNqYkPvRUipGoHWa6hI0I+5v4iKQq/Xp25jnKhr+twHFLYBwzr7FSeWJHdy5m/L54eaaEAA='),
('529f996c72e851-05044409', 1386191213, 'FfrXeNJTdiGNL3fCbVfA4s3lvqZD204AiV+Z4i5hXFIx/ON1UnGCe7Ks3+9Qbg039aHhUVMqKPxqkPDgAbXHfRcHS8jnkOmx2WcfMWttjLY='),
('528bd467498485-99016064', 1384896051, '9gN3TIXIXYuz/PYdisUM5xwCqA7IVWKytuDZ5bYyBwibRayNAoecu3FlVyu1TTPTFzWA3ci6cytsM0O6kmokquYgbqag25RRPIrEd36BAHo4ZgyA'),
('528cfd88507fe2-65315861', 1384971856, 'DBFkKUA2WDV9mtmULUcRD1ucBoHEPrwcWd3jptf0dcF8Q9+hxvhtXra84+jmQ5BaBl1CIFQJY3NzQup9vz9ieEal4UMyzNfHxj5R7CRlSTk='),
('52963681baf608-12921987', 1385578538, 'kBr0OxDVfEboYWC0g8TKTm1ys6mSv+nMagAPaEbSmSUN8wl1bfRPY3p3QSt3RXxj0uejJlc8+otAF7wbiJkFGCIsT4iXyxmaZgJx6zADVO4goYICKrV9XVfGsjF+BQ=='),
('5285133f2cb257-53950025', 1384459675, '4gNKBt1GFYCB6AxtN/JZlr/s4HdQmFKC7IhfXl0dE+sHxV+38ShWNlfiOSc95jZluQcHP4nkwrvSTU1K9ad1MdMiLQbqIvvJ17ajgDvuPKjVXmlBRosqDQfK32EMQ4pezCVSDmsTf/TyGspOujHTWJg6aSrBWsmqjyvtmb1XTiraiwS2ZgHBSzILxtBjKrIEGx47ETlCBwDCMFRU8/vjWJLn9n2IyeaW9XfFiI0XXeFYikwEIF0KUbeAT6mPfOOWykov43fP8B491sGpyaMEmzp3bRbGl7V1I5/OseieNv9bNDGGUH8P6fr4Y3CR+6dBRsW7iMcM1bxN14Zh0sO8AR0DCi9uW2Z2GSU9jvXPm8+rYF2ip3DmtCS3diDVd2bof30A7yVA328DJ+muqbH+Vr7mwoIXzIMSavlEM2pY6da8u1dhtaMD60xhqN0dRB3WwwSmQxraoXgaY0n2iFO2COfUgYLWjllFMGZkO2ng26RjXzejW/Poc5H5PF3QYEl5nlPNaWmmKlHQk8Lb7/SQ4fSuEMIMvgt4Pffqw3Z36YT2iHyZg1RjzUCJoBMdzpnACXqOzIQVZSrUcwi2QdXLGvtEdRc3M7AmzLOExJDFbS+Ir3MGQ4kiHIDwua1W5eYNIVMufNceYYy6S1lhSyEd0HgR4WABF/qINnu1YWBfFpVJDD8jIMg0GuEhGo2ibqumwzvrNDv10ax+KNHYNSwl6ZY8xae4RN6635mxW2LMPGF/JC/yGVo9NvtFJdN/WiDrHWUoABPxSWBa9+Gq7tUJuoT6FISi1r+NytZl9Xek56VbvDPYvUq4aObTS8pDmv0b4CPJKBXG4qjlQxjWZrib1dw9n6IMLc65bJ+p/HtYfAr2jp821Dqcmjj4v2kgyK/bJH5jWw3v89ykGAlmaDlpgpPzsmUCYYJF3rmcy7x8bVepArqIp21/vfWLn/mJ5E7Ym3wndBGTp3qC3dE1HZDXEy3GJBtmghl55TbC6EnHGMcHiHHranCK3vW3qo7w0fAPuoqp01NDufcW8H0ZvGxXdyMO'),
('527539f7250d12-54669308', 1383418128, 'W29ZCVwv4DPcvPwO5EBzgzIbXFPYrKrweu/KrXM0xyR8gA50cGMEKG2zZ+Kwh1aGxTvMIDof7/VIN/s96jd7LvRxeZ7wJPznyQYlBG8OyREfi87dMCYXw1V3rRHrIH8Ay0sd4un/yJ42Jffhz1HAKAdJ35SLwDwv+3psrrALSR7DVNjKO2sLqqr3IyYwrQisbt+eVBn/ZplmZ0gJuJgXagYLZ7Ud2oxAXovk1/vTwa9F59ALmNC/AmJvqI0xhLKlCdLU9XAaf5QphKZelli7/Z9iwwrdQQABUrgmmhRt+gSV6yz0EARW0Wbi8SBJb38Rt79ZN4Hq34KPi9Gqj/7DufFH5KqaaXj2E8Hi/V2aW07acWMqXbzdqW3dfdJDNMtJTurmIrf+pfpJl8zzpGUE/KUEa2BgQpbK2v1DKmjvFZYCntJRbPFkK4l7EO4ziSAi/DL5+FTRhGI/1P8uQQPgksw0NDMmzfIKRnnVfzv/evPFJ6VEtMbg9S5JIpWeyJe6XPFUWaRA6RNV+E76qK2icEtLRnvYdTiMRBPTVZHKgTxYKZtUf1A9AsUtN6CtQDSKJayZCiQDmjuf5KQYpH1oQ4045WWOJ9BjAizgh8DAmacNj+czuKZuxnB191u8pao9qxdfFlreErHXFm0wExWSzKNr968QG5PD6VuJaIa7rBNTNX+eq1EBTJ4ZZzi5FdPJKIigDG601vy/+C+VENrToXDH6mT19W21wR8sy93pzzuS8/aOC8ex1W16aMVxcdz3qGTuHrQ03KHFhIR7hFJh6zVTOWT92hyZn8v2/QKv+6gOlRiqAIEd3bi6oU/tSwBlHcS84xUNXLd3El5mUcAnf/VHUpLFaccsp82VAsemgY1y9ZpyVxIH/2vvAuuJhmomw/eVKreZG+gy3HqYrctdi/zDjx5L+JbFGBhIuKDInvO4a9nteRDAK1r1IPJXMg2ykprKUfRqHH3gujA6LXWV4ZYNDcXvuePIcr6nxsmqcT6XfnV18jzoc+oJB6rbvI1fzmG3Qh8qtP2kLHVPHMq1KI8J'),
('527550828454e2-42919245', 1383420043, '6N4EUuUpzwrY0DTRahuasHRixcUXsErh7+7gQpEMXwiJ1wleheOrHDa1OxoiwWpyQHF01YqCSEn5FxL6ks1ZkSbyT1iYBCBDbSOQgptsZjesbEOyijX4mQcCZpjAbWCmpqJHWnH3wHdUm6WPfKeZVIxtNNAyokz6TAZJ6gZc/HgJq11mUogKlAzD+EWvgxS3wuI2qMoj0mGrXcMBlr1Tv8tJOTFfg0fhPmFIxox7gpcjZs6bWSuJ+mB7achEgJPF39luC+ZqPWxzzunm6Vtx4UjkcLINRCF2RTWSvwf9+bmHsGj+1haMyQO/MB9+QmuC4hHQOej2VoDXes11CzfTufCUCjY4JsuFqRX48j1eNj2JO/91/xVWQzmKiPCkUTQBmbfgndAcCV1etG5/smsZasrR2GlkcmnlY6X1zsj8cJg1FCE6ThSY+j4Ud83elfkw++/XCt8e2F5v73nA8886NC1sM+c/yh8kJeFldgi52k/EuT9q0p/Qvb3yr1BGfUrSMwfYYTBGsbA11xaPg+vXPUSBI+XPhi8UIDr95OyqMxJDDvveiAyzZgolZN/Y2PvFy//ZaLHd2dbgwNlxLBd5M4a3DAg07rmujPNN9sBMFeiPa9NWn+nBz01Xa9e0roBJCh3sfp1wofVAh3uNaXzIlYejzlhLMFegqNkYIUoKSsY+NTDF+Q6dNL3m6tig98dZ15ou/PzdsT/p4ZG3hYuRPgOkO1XubkomYPmaBY5/ajhg/a77Y+MSdCMLAEsVLPNBsPuN5P6iPMQ7TdFZWGKkskAvn+PZXfTRecOVyUCPKZEQ4A7qgihm8WLUhLQ8qU3qnvP2/SKFt/9pqubJdI01uV26KVgmAhLoib/aeWzDa/duiMYAYcwn4dKTimKQykxAOURGe5ytLc0eKPlsL2ZEAwyXTucIHSq+P5Z9a6E4oKCi5GF1hes+ZCJ0PKKaCx7ndifaJCQoH8VNvova5iZXSedsZ0blnVDF5lhQxoY8GMRS2iqjpgCmYW/VgTe124+xDRn/hbqTnLBlB3rrnFhJARfqHpMwf1Cqua/k5SO/jqE4'),
('527bc8eb854932-52518941', 1383859797, 'nSeiycbVnBRy5Y2EakD9wYoCVEI+zlG5ejOhvfyWdxNHPz00WeqXgenQ+zmOrFHEa7O/pBOY6IoaBc33mJi9sJXkDz4CrhYl4NiZLDQXX7w='),
('527d41cdca4a06-66916992', 1383940558, '7q1qu3vYCvCY6n/hL2xx1cO8i8Kw7dLGOfCn0Nw3erVwE4WIVqh27J/IbhR3eO9gkuyOjTuV8FgJ4+NKYUO3J+BiovVy1HmbRt0tI0aLzjg='),
('527d4205161b52-23178299', 1383943499, 'bFxYtY85nogLG5CDZap2EZ1KipLgZdsK41LZI/KhULYMJz3HEN8POcs09b8yXuyphLpMnLwEHihA1z/bANrVFPfVfNuKw37sTGUHlpQdgv8gsEA9uvo='),
('527df070350717-20500575', 1383985295, 'uQGExe6KUW4eBByarnUMEq4dbTEGiLGS+c+f8vOkpGYcOCCQ68WSdEN0Hrx+DqEnkB6pyf8APhuCbvLYQldyZT/NTxIigi6zt+jRVgO4i51OY56z'),
('527f63ad8e99a2-63633576', 1384080993, 'WCgHfNt48fp4WPmdl85IK0dPI+9lwhZ8Qvxde85/Qlm0iqxU9sLtRWaioN7wGxA0RAel79wRba0+98CMisMYGgxJYy8xOXBgMSwXF074OnWj84qt'),
('528113f43473f0-35563887', 1384199889, 'W+QbEHLG5YI00pCh6HAil025u7U6eDyfGrZUVglBiNxThB5WwHjho4iGS2QR04IU8pUQQHjcLGUMGng5q/YK8e2F6pO5C1JeLkjFOvOdkaP40seuGTe207zJA0HAiw=='),
('528139a41741d2-46073251', 1384200943, 'z02/pxbSJ1gBWKbNVsjEsTB1YhInGV26VI1suSwSKcYSdqeN69KPGgHXGaBR/xbBHvGOwzjk4TZaAosouYHv5+Cm7UClAjS+UPlg8xHiSEXNt9Wj3invTUxB1Ya/o59H+amRDV/HQwxjHxZvyP5bhWQcdkKGE4+MEjW9tkoV/d6f68HLZg1v2n16WSA1nyJ06I9vq2azzvmpqbr7UCuJhELkgSJXDpKP7mZZEAI6A/4GGTK5XNlOAJo10Ym6dlss2NeIoQmlAmrqY3avavOZ5UUdWohlbnnOjDn6kYlxafU0DFmfmLnUZc8lkIfnkmG1AcJyD1ghB3VtdcWtC4+3nmJsrzBAg+08j2WcR0yFVM4e8MCd6z7e7WCD1b+2rscqJzyjfYu/NHTI3nDm0A35iDzhG63Qy20n6CS2yuMQSgia6G18301CJoLAdQ9i740h8ndtXCbpyjKas6hDuCP/+6YPu4wVyen9JwUVmX4PxSvoUJxM2jR/uVq5800hgFtCtMKWbZQBLngz9objnc0rrVb0XuxZTpeNyXBEm6buLz4/zNcVMyPtGZTKUTtMlDeKNLMZ6RIS+6xd4JuKIQsDAOtzf4YohzGc3ZHLBwZ/X33/XdMHjqpmS3uk7AEO4JqysLNp9ggTRJzd7+8psRjRCQKcQ9TWwGMGY9uAu+SF9dsfXdzoVo9sf+qE6CvjQsyY8kolMKgdDoIGhoQWpocSMtyzLdY84bAnuv9LeQGzP02xtA+9IR/+D/ZbaYlvDiSUUixckzLS86FCYQI3L4SIZ89iia4j3QbwER9zbSutX5PT4ObSYyno8ioKHb6s+lDvTVUJgcb3SAfZxNIW4m57f+Nnu6WEetSXsO1Z1/0IsEgo1U41/bb7FIWKZeNP3foKacTRK+JYqQM5BQ++n++GmSTrYO6JQGQqkLOx3PYToREkS6Dz+IPkY9+SDJ8EdKqNj6QVx4RPRhmy2EiR2Araujns7lYRWENP1cgUKpHgal3nEt1ZvRjMVaGCzO+nQkxY+NhGTIHGCvWbHhEPE+oZHmJynNoIoGrykg=='),
('5283fde6053e85-87662744', 1384383012, 'sZ7b2VyXB95qUQpopLVtIEm1UsHTunhmgO0Vvknz9XDs/O25jW4rQtZEaAD14VXC7YA5a5Qk4+mm0gbvZ0sHQ9WHeQ1f5JDfV9eYZAxeoyKp7opfOWT4SqPzfXmocmO083fvPHkcNKbyaD24sq8mvagMnhD1ci2OBiDPjdrVzRbNEVKFIrBxMajr7q4qJDC9YNUrOvHxwQDQrWoFOfJrprCqUIZfmvbSUP9gh5trBWoVU2ke1pk0bwmsZunad/Q8/POqL7mSnA4c1RPe1rVoJ0EAaOHNZUWHASES0aZ8FD7DYh38W6gQirIJ4qCVwNX3mCiUDyd4JAPHxPRDlm9JTGdBJWL5/64B0uB9zaQn0fD9jGA+TlH4puksaaaoGYU9hwweNeYub1jCCEkfo475KmdDiRH05YyXuNlvVwCaDA/yoGLNLLcT6bV/NvkW1Uk0qT5ycQ+ETC4gookrTkyD1vIF7q/ua51XMFqJyi6I+WOlVzPlNMYJpIUcYBY6jzaJdBGNTE1+uZ0m6sez2wnS4NIY+/gPb8ONMuDqkHC9kqKo235IRDAxsgkFai+Fs8nrdN9zqvMUnVeXqhR1/7NGvAtVkCP8zgMv5GtCXz1KaivAumWWfiS+Lfh5x9+r5/LT1T+6qpUtS5o1Crv5+KnVS0Ogkyn7CkWGGiECbzHorvVGKIQdQVhZT5jzHyrZ/EZ1eNWk5T8ziVF6pOa1CunQJGzyifwwQehC2YxczebntNYDnqTreFiBW3IZ3b+LqsYuzG0T58uoginCvr15JdwIvORo+rT7dOeSDrhl+wOU+cX+iuFb0eKsan44BG5/XyBzAOmGhnRo/DLAom2bBguJo2ihiRvVNhK6PHAwBvnbx+7N7AdI/cXPzeXQjHypHRx4uiv8r0EyApC1vj9GysYkW294tGLm2QRrW4rLBG03f1Cc4Ccuv5QMkonUk60mTEln5oKEBtnpQqtuxmqJX1eUdzYkMXVgTRwdXZO7iRb5q5xgiqnevKzBn5a5TZNVo0ovNIlBg5Kf6iUH7ZW07SekRt2Fb4mzf2EEGW70LUdG3oBpPdiH'),
('52a9fb499fa046-61311399', 1386871625, '2Go1rStG7x1ws5FicJqiJb+dQjx+hxvKR8NBE3Hpixx2N0i6P8dhs4bjt0YjQuHflrRcs5O+J0EET2toHuiCLSfdxb6He4nEUvToYnjDCKcw9H04/rBlyKlJjKipCj2iKPFVmizJTsIGqIUB5thCH/XJLO1fKUpYuyN3pr+yjLq5YD4ygQNKGgAKjfMVr+3uU9HrZlNDZJmedZ8jWPEqlLDR1yMUvfZetDUWJseLi8PZn/ZJ3W1j8rEwl6DLjlpObGtD10rRPkx4VALOATws1tV2an0CFSq2YyueOqUoE4QwkslcIDRrHLjTsMzPvkEhInsm9+Wcuvy79SuW5D6priFdePNRAJnVhWQ3xqG0nzurFnIfYq2v8KPzIn4q7SRvz0EV+Vy7oJgjBTtTtKVuff55VZHV7kzC1UZznwQpYAVqmvdSZ0c0xk65c2W++lR6U/I7T4yAup4OYNU8qd2LIGkClmj7cfp7Mrtn5ACBOpwgphaM+HaBClr7/dsiTxYNyT+O3GVAssFU+45qYFNfv4k9bGtr9VZC/u/4CuX3A8FBCe1YxbYDBlXvL0emspyA+G/2c7rX0XYDFEguEemgdeYq96TWf+a04tR8RUlaIK8RIcnNlCoXq1t3jJi3naOthpd224sneofYDePXKeqpHm1uCI+hCmP3wSEdZJ2/hJY+Wz9ap5lGeQOVn55X8LQSo5JVndKDG1A2qIOmKUqaHsMEiBwNrAd1HrLtj5diAkbnWsin7MLZ5ExYgNAcjOO5AXbYH1yA/fTCGRyzt0c/io5VGDMMUybJf/nIigZAToxxCpkUl2gR4TzQ4rAFTv72EYCBK6Lvhqa7tcNTYuDqvGSbeh95A9KNloNIPbpboh9+y5YpcsIE/fqef9RijPJ2tI3yYH0Qt9rNfq9IqXBET8NKpF2Kc+NlD+yDnQrpsPStM5XaiWGZKUEl7LVy07Bp3FTqNPaWbwasP5vI2o8tC0MGVLO2q3Op0MoIueLNvQaNjexm/iwuaHu6PDC1yHOEIs5gM8IEu7Lq4qNerg=='),
('52a9fc50b63c40-37514023', 1386871903, 'zHnjXdIMH/6ExzlPKhU7dA7LKcHrEfia+H8u6fcEJbi2Gl2iCYbURhrL+ifpRjv3J3OhTam2Gx0qFTmnTdixiopszODhmw8gkiny8UpKEF7u9IUJxQ/N/JOjYN2qkJCt82jNIx9VRT1JBKG7p57ha2RLs9pjZQQD44xatvS0bRjnUFLv5X9t8/EhNsqGBQx5RTtQqYmPT6wpUxvVHoAJ4ziJzMfvCki2X1G3GNlwx30vWjuL6mXvUzsoKDt+J5GJtzZUcBX1Yuykre26ScqpQpJSjcRmeNq1AVHI+D/4Xa9vMP/eg3mdnx2BeIOoqIfm6lj03MHYPiY0ZvnJ1A2fVamxpsfk+ojaUTyyN8cQcYLxY5tEx+gn0aIHTv4ENy8sKvDYIbpMzSh0p4bsN8Fs7IgQP8+GvO872prwmvKlhoiUCloQlMa9xSe3astUYOp/BkpX/uIAHSQt8RcEbzP0Tqr0jlemyRLOdF7jWJRjUW/GDjIE9nSpPtpwn2EzVtbTie+PKSrIU6lf0ZA8907D3mSXqKkM0ozrrAdAr6X9WADW1OdJFodp8+Ux8HLoRCKwFzvnSvJ+//uxcMdKNFosgX2AhNG8zqEgFaIMT+xC2s+H63luu2rJFvNQFFw2VpD2umlo8AHlyYEQ4Ft9WXFtZMh+bBfYHCnmKIFZWUZHbsyUXjTYFuxuQfClFL0OE5rJkJPvkRf9iFFnMdNHKMzKCcrNqqXJ+TaQjMKKmPBCF2vM9nz3Z8SlPtJgsmiqoS6fxglL/mJdKG29BLJZEAqH/TBwChCaXZkQD0FKfAIU8RcPR3qSSOKYCa+Nb5ousceZJw6rKtvKD+NWYvZT0LuhN4cqvR5sj945xkj3gbfmwCwzmDWhBmeoeqQ77kIHvoCuqYyu9sEd5lTPXNG6Ids/7iArDBKdSiFkHRnD4s86hz3gzw+92MnCHVei3r6uWr2k1tWY1G4MDUDAejXlxzaKuZCLUpYfrQTH93EfBaneuUDc5TrmMwcB6H75M+6MIvQwU/A9qP/ZZ2MNPqBwDJaJ'),
('52a9fc748a4c75-14859779', 1386871924, 'd6B4Ru326GXRAKkrS4SkIaZykVD+oUVHx1tQk88HxOgikhrQTAIKnJKfk2P5YP4R8oWSwIkPwPLmLqC3EU0Jwr+PnDMoifOCTkmgFB+mrLOsINqNWy/yuiJna6ZQcV8Lf2UqLpwR2kCA9NSMIdVWQkQSk6BDWyyedmWbCkET75vib/uLpun6DDT2gPLL5IwZHhi7MSFHly5qZdlwHhnaOMC1MiuEszQicD5848UsRAZ80mjWvRzMiP0bMnmKteoVPXAFy8+83k3iRP0oIeZLZr2XVACQadzdsLlUoLpylgqZi8KXIVrTpuOLycO7pEbq90yMRLl6AbzLIjQv7T9x9PyvN1HoLtFKkkpK5yLXuq3npNLU719BEHzSQWw/G4M0NGkM5mMQoyOpc61bTdhCqCASGsrvnWMcwaWXnlmUAmVT3Lva0nTeoDKZOHZqY0GUg09S9PYMZL3aAJKb8j00I44l5+nJf0PKeBiESALZqF9H/3vwuFvv8Bu9Q7m4RyvK0/aiQ6KBxLvP/0nGgn2uROloTbSs21Y5BOJ8OCbdKfKuqb0rK4PtGo8M0Mwq/XErvds6CXNUVwiujgyKYQ2MRPlXM3hfcXHhpxrhMvEZ6Jln72znT5wWO2AkCkKwCpeZnW7ZtKbAvBhKbYlXR0CL382Fiwk9E0BfhnVmHm1rbe/QMuZIDcpG6rH4LxG7x1kZW0hVH/OF2pLxXA/OcVvTfSLqE7N0EQWw6TTOe1oeWTA7cAbmyFHdO7fUFyTWzBW5spS4AAkZNEY30pabIXR4lSFztj7pK4VTqe4hbRa5T1zSeCW0F4obVxDEzTsw5++MZPIB9w22CUBoMGAjhur4WGAKMREI8FF174tk/b3Clmsi2hVcdCLquFCFzVHUN7e+SKVI37Mwowy2gsI6JfcuihEyH8Y9H5zaFyzp1fs6BoHqX4PtyKvaA1iC5cf6pci9G1y7cO2l9yfPXL0LD/eNMflFb+J8J/1uTX3bg3kx0TMhwy23qjZXuiTJbeMPSkdv+8N8iLmT+CKK5pxA5GwPxEF/yxg64bIwXwYNc2k1lw=='),
('52a9feec10c8e5-98798251', 1386872556, 'W7axK2WWH6Yg/oJ9dXaC9ziosbhPLOVilqK5nsNldTpXX1atQ06x0KTnIyqF3oVTDScYFD6ko8kwUZYu/eTH79ESH2jbGjbqm+8ZCliwzrJ8jS2UCkRTJH8neKWlDfTU5rY00EUJ4RLNZAKReiKDZe250phlddz4BOANhfVpA57Dj6oLUujbZwJdF88pGDETipD6VfHH2vWAwIR/b5KxowVjDlB2x3Tgj1257M1/sc2R2t9twf0VKSMPtX6LawBNSIl6l4dBhDyLn1Qyi4KVjtATOWsl3jVy+6uAhiMu6wOqiRhvdfBa0y3RsDFqY6YNuB0C4l+udnkKDBA2g+E0gy9OjtHMrvOJ/ZJNZJem9asiIk8Jegfb0rcltxIi5PEdrZRcAZ6EmbsETdqaBjST+G53m1NjLGKC9u81kuKGDZfspjpYq5LlYK1aOlXlGtrxJxM0yrySnHfksfQ0XiHXR5d4fwDfnH9PlwKkX4mxMGzPvrApzaJZ6f1s8p/wr1eKKbf2T5HdCO7ITvgeRVYpfbzUsd+wnsVOKwL1WG1J5TamqVy7J8kLEkCGlyRavxMDjfYtP1xO8GhACao37Jo3Rcxs+C0KIgxnS2HFWDNqbSOm+8JPaKl37RDhkjyI0gzSqI3spo1R7mXlErQDPXgP6Wcx2pTuLp2dsLYZa4Z22EiQWLIBxR34OO2wPW3yxIxlO7RqrmN/PSMDkW1MK2LZW8h5gyj6GaIzRsqZDwAkfczanWZ4cL6wQOGdoFK2yx///AsidpB1g7Pj90NYICygr+iJrhaiqh9AU1c9EACBmQiWNwfzoBlKxvds62XHT/TnZQwspIwVNeqjVBM3PikIqWjDvsc8IqeoPCnqReqdU19glvL6+ix/J8gSjh/57xm3fOqD1NJao+uPc3bF1aG9E1gPx0VSs0wZxfIDGCx8wtzMjf0nEVZj8jo2B7Ra3yvI0LudW1F4C80bRyNLP8KP5eXsniTk3P09GhHj5+nb2T0wCBy7SJTyu+9Q8MU19hw6RAwMKCXrSmiTP4JxJQ=='),
('52a9ffea98abd1-80972949', 1386872810, 's2QdyBhaGUJPQtzxIgPwfu3Nw7TCThutepgVbrGVU9AzgDezQQ9tpkknwtIIesTJJcEYg4ylVI5KStazb0jV0os1h+3Li9m5RRijSbKuvD4T/W80f2pK16BPxvhl11tUsZEjubGsOlYNzLN6YkZIXPPWJhadjc4oSHPIQwyvBtrxxNmpxIV1QUVxVqsQVVfjhBZtyxmLGz77gYlDe1FFjl2LBnzl9x7MN1PKcErst64zIPQinFH3kQYxdZRPM9LMujar2aI+vBDUaDbIjJ0VZ0ZP9YbCoEDy5hWcbbCpblIN6v6G02x36zSfbiTNNXwuiunHyw7nXdw23VXr5ds8N6vN1HU9I4vMZWBUI66J16hROpQe1QrMMl3nSm90dhP7Hrje8ps3aDDTmSs2rLXPsKJmnbUUgfCUoPnoxZzdWIro1g7tzrnKxZ+HkVAPG5/wQGvH8a/ojYABP3KAu32jPXtgKr4AIE/HOTyp1a8vrzgRckNipi04Us4LCMVTjaiE4AmVpR7pv8+6u2ZL7iy5ymI9+ITA9Q7JbgTor+6gv6ieNlaqrQk2WljIr7OksJaLmZ6iZxEHRdIh1pqgqQINBKY5X1aASH63ZyKs2k73cxWfcyx5YNziD/75tH5wmvpRS78S5iXmnGMFwLYzkRxq6d9qTzAwhf9J9zfsu4H3I8RgFQ1tlm0blV1yrjHwPaX/B1Wgq6qXLXlzeFh30ZW68bJD7eLS2xfzjKX9YvUJ3nBJxEBxGtQvlheIg68tqbaFC07DKwo7n1WEMCKwngNnXDsljbn+Eop6twChRDUbkahljnlasGn4T45CurGev6S3P7djs7cA3ydliKi/PcsgnVpQ1Xi2KcVCYjeJVs0539zRHjnuRF4azKYTokOHMfc7cJ9ziBkPDz8zxAN/TsxHpJlGkOULJUN1Q1iFgkvAE/Upyfy/x6OTuj9iEFBh5ft5vXxQfoQuvZUksvWbvCejyj8RZV3/0o8RmrTuh1fVE+Fmir7FgVE4VzTP3KQH8+nC56aBmMPHVKuMFW1HDg=='),
('52aa016c20f530-59456142', 1386873196, 'MfpDDX5DmQgAXBgZfS9F52lrkZgrXECBkLCHL52cFEiIZkQ+h3xEfShL7u5A9aY3WUD7+PxGSecYnVRpoOeMS4i4K13bq84j9mXvqkLgzNy6xTVkkmbPhyOfDkdhN6VzS4NKWyvtjV1pGv4Tn3PpvkPD/0h+DUcugXf7Tl8OFlefer9uRCQl1wYEN9hvAFdITC93NmIiCbL3U/9F97cCRoKY3R55bDF8g9134ouGCgaIRPkV9LbnmZGwRiU+KBBiBDAi61Lcrvc0BhAtCct5+CvYKWPy6z3vK06MGVkbrLK1aFyf4Sw411hivOA+AzIioSGN2Of+sPEvR8tZxN7EvfUl0yKrz0QvoQiJ6kPT2Gxxa1HvroQ6Qzdl+sNHP1ll4gL3dRXrIxNYJ0in7y2WzRyhc4G/c+GQePOL7yFyaQjMoymKm3u6gk5nDkA9+Drl50Otwt6TF8++AQwcsOF2PZyI0XE63HKrZ3gFdOSlcvhRKxAvJMTEehqTB4hXe/PCaVqQv9Hf7SSwjKEiybQWlUAnYtMe4v2/GlTQ26GjFBLbqbAKVXU1VRaDIPmX9XjQc8Z4/SjzRIjnkEex0TSIggdoQz0fcNk9L3kanAaOMq7tcEQbcAwsq1YhrZXBkc+3eEYyM5oKrLCaWKrscaQQOVJOZ+63tWAgaLQoYwS323J6WP/4HGlApaQ3ZVYMgK6IGRyNyyXC6bJbp7ADVx+O1ru3k0bRgLfL4gQ8LExT/YXeSAWbwb6Fu9nlSkNY5TzjguShoiTghUc/tTeUsDtXbvbqJ/Eqz2LU/V3Kjp6HmNSXqEJoQdnRrnpup2072K+NDhszpqYJx84x5WNql3n9xkGlRDaTUJgT3cbZh62GK8Qub6WTdd6xaKo4tEQyS8sUH+5I4/3NR4JWgk7i5Tg1YkvkMhy68qoRRnKaA2RTafOBGaPTwDAnDJfGZb+vEZsW82ZeI8Y1DrbsBqcPV+PAXFVsD9AlijNBNt5qfw9HjNJZtAI/ZCcV3Dw3xhRuQwh9ica7WgnyTuLIozLKHw=='),
('52aa017a7b08f7-79017201', 1386873219, 'bT/4LW2ap7n8E3rIJNE4QJUeyZDw7jACPF5yo1dB2AUtKzfa2W0nL/kIpD0xnP0FSc3taX3LPbONyCVSpoINvr7EsPikcmPZj0fnR+fK4hcOcHb4/0VM'),
('52aa17f257ab17-21547023', 1386878969, '6CLqKccqjUc/eBvO1bTbKKa9WfwJmvWGfalQJVZy69jSCYWKXqFA8kS1Qy+PTP7kpxO5wJmsF0iPikTT+NQLK6HIh+TPOBjh3+Hm22sOCwetyY3qODA='),
('52aa2a0cb0bc63-95469837', 1386883596, '6PFbvG06ZKS8TGzaII98hRx7VIKaggHhtpblIX8kNtw9RsjDHNKwZ6OLINWwVLLKVAqe3f9VN9oLebriVt4OI/12xPSDZKQi6E3cZ2SeRxoYya8gnsSPK6HXAhPrqv+I64gZZUz7CeYrSlc5HJtWuDj4WE5lbFlP1zQ2ap2vgAGX+KkooUgIRnQBI2gtIkqdcedKM6MNXe/PGvm5XoiR/okEwVgDCNCpeW5qNUsxpKGQMlbNHTuSQclGmZmCdBThGHGbg1oWLtEOosdV5YEMgJUmGAvWtE9UGG+F36w897NCUNlv8TnyDRPztmL2o6/l2vwdsd+E+jCv8RaEIjka5e3SQet5+N/XZak5qmDOzs7yFcxCwvXEi/4g8sOfTQrphK9DEFqpqPSkZylRqSCgTWlMZ1qLEfPKbvCHE6Apxq/xb0Upadvu/SiKjCNumWHkH3MhlopSqt383Iq72eQTN0rAoCh4Wtev/DsfAUTkiZneXdb04UcXdpAvSzrRRQkyRs5vqwG850b+ox8lNcJzEJmat8AndqcgS7x6jiFo5PC233AUTDMQ4RhpmYMAEX0q+JLIvVbtIZpWn37vjO4L5goc2IcVvNqVt5vnSt+a0YX9Y1RKYUN54lYSgfnXnZo7Uteg9iLH+1hi++6/hs9ptRKlLSdvswaW3hh5oUqX4k5aGWXEYEPQo8aXglwdKP88xiD5jCSrbh6Kh8yTQv+NIs9we4bIrhy+tDZ46uC0hr85r46tnHA3iq1GB5T3drinpihF1x7sbmeRqMxXNFKknAlTtOlF7reO2cnB5MaJas0Gg4EwwxHa2/qK0XseXlWtINTprTJ0usA6NM8rH3SLfAYr6E9YKnV++2sVxCa0Oa8n4NJA99WK997TJzdfYgtF7+0Y9T4Q6CEjN0tV3DDY6NutZxXRrs82Ve+67v89bmJ1v4CgSnLDuKNQYhnT+wUKj2xMEeBDSL69xkyGs8c9ozDKhbR7zmb6HaZW9LzaYuRjt868BZ/Rrgu07Me+E5rjDCQaUU6FJjjOFBda4A=='),
('52aa2a2962d8e9-62862389', 1386884005, 'PCd3qqWhFGsHQfp15q52MIsyYfLnHItv3jm8OFaDxgkaT8zywMpUlHgfFOn90F3CdzxLMuQFHZz7SzvE50HjlTeVIi0lrVCom1KDowW6VokrRbMzNvsHhtHyp+QNX2QM+7khUBxvIhq7Z05BPuhd1R11g1L0k1R9OZZ90tbvOEiY0B8k5wsVckjqqlzKIt2CvDRSYyNJhzmaHgFo674d4grH6g8LIgLCQvKET3gQbBmMI3bRdqMwms5WYBrfvropKQfH1FUzvcz1SWKFUIYV2Okqbab3hwDlaFHO2NPv4qs4QNQqTL0hZVvjZu9Gc/OFIqcU0RtxlT/8SH5NUWFS0ndf666Vio+0rP+ceZDPN6w7jbjpI4cl0ndWPz8y6nwC0ZSs0lGvDZod5hxYeYApra73cn2w6afcr6VcRMDvb5C+WB32wFJJrBSGirbB8/NHWShdYNxzV0l6n8Hb4c/LAscK5OomE6iitlR7xnu/VIwgUwaMyUdcg9BpE/hgohJU9STppRrFtkYlSTPFUIrHQt9cGpBK1FoczFZm5Gi6t/zOrajrRg6g8EcUmicO6blTS5o+iRbOMqIRngkU9EcyISMwKlsk1tZFP8DRBp/lItUbHb79jeUhYTyO2XMiAuqemc25iVN8z0inWzXwI9grS7G049SsCJUjAxkBCnwhTnRC5KCBQofCsd6L9NCNEaJVQeXdFOS2RwQ/rRzjYoHDclJ3AK4WxNSlgPPzmvDFNayLArqSoDCHO6PkM5HUatUtzKTLEwS7v7xa4PY+SHOA5aMT7XgFuOTS5JhbJUvojhzMOomy4cQDY1NzSxYHAUdU/I6ckdplMvKQcsnymF3rwfwx5W0B1sQBcBwPTQhk42/xfrwlJdnWgZDQHQ1I5RCR7GvrR1HXa+PP3+6xhzIEhwaGpFfAtAhM5nWjUZ1y7IuTQTy5ov8J6kK016qEijmbXPCjWlD/KZeAzDiYVQB713PRAof0IDpDbd2rnboYKv3ENi/xfAMr8eqk+txQBJKeLIR8QuxQP6HO+lrRyQ=='),
('52ac4814c982e2-37307046', 1387024578, 'WuCsDw84DWnFpzMvZbXGqNz8YgjgPJA2TM4Z+0NZOaVcKKLRjz002gxNCpj2hAm/uDwiEHTKBBD50aMKkiKRHxF5OrFtEQCi7/pX8RhWafXXg73WJ7cE6J4IIfUzOsdlFa6VMZUFBMQaH6SA1DAMX5tpGUQtx0VsjIBjry+axmT5fXqiFJ5bBZ69eqEj/vKJ3FFGApExA/g4fwLwubXxshDOwFiOamYOEomWKPHCUxG46WRG7BJceET1ezFoSzF3UtfWxRTk/j940sG/IQu2GxIjrDHbYdNVwiFFJbSbeVXTVa011k3fZag3CqFzujACrI9GQP9QEMQMHvX5PnFSBHuwKIgHsmkWOSkYQTmk5KWxUgUbZKSydEiztXjBZyqlPg/AZ+dq5+tG9y5VJKVXMHcXR2r3m+Xe0j4kxkpULYNk2GomNpqbEpoPJOWhcCyLxLpJxXXOl6hMYW/cwgcMohGrhEVo/9aBmu/Ut8btVy0DRp6TCq+geDzTXEh+P9g5/A9nbHwiMLMmW2YUVbi1HmE3apKaiU5qGfYjmeZf4E2pShla4zPAOELJW9gTyhbIMSfkFbtYNow0N3DAfGC3213k33lyCDGPjyNd/OxYjdlORU2fEG3eVro4SAQqXZ3rF3jNe5P5+HBS6TUc8MjjxXlzroxkU5K3lio+XOxlkbuNMF5B2qgnKTPE903O08HgW+4bO5KtEGJPNHKB8WRY0q/XxcQBBKuoRSHTFH4dKNgkLkhPZtHskuUz2wLnw4xf4rqnh1GPUBh8dQHPUHTX7lw8L2OayTsxhDki76OJjnvL2x7Wdyesw75+Y4VxoAE8ICJsQXIa5ljGTYLos5NK9UBVmWxK9QtSvzIbp9EnaYYK2qoCXr3JV7/VOVT6+cMr1w9NBPAz18IrjmvTs6W4QZDpW4YzFFtGNOhc31oEAZmED4g4rUrZ/K9plbQjDMrNM23BC8Mdr4LirH3TUQ/3piXuL3bTgRjl/ODEW5ZCLhWxxrOmnnX6pEsQGAhAe9Rellajag=='),
('52ac65679cea16-18090537', 1387029919, 'YXrG/UrpgAi2uTE4btNiNpmqg/ERsJ49az9RKFbJ4fZL9n0Z1WcPSqC+rFens7rvwKCbVkqOZPj0nebx1uAcT8dAAb1+7iIqies9PMtQg0CBRBkkmnyB0QLKkVSBAmGqedWwZIjYJCW/kGNaCxClCFMZnTRKDHBduDKY3Qn7D7AiYZxtKaQL8qqWaEsRptb8w8DmWKRCw7n4EUCLoj6XizHaLP9I5iaoJOB8GUBGuhwvOZdc9/ne68YCjJcoBqbFaMlj40DqreEMVUaKhcs9UG3L9+KHVFOgBB4MzP/W2IWCnFgWs00INQsjf3OK18ndVnlZ/tVSGK00uu2P6fSo/Zd7GoV/UCojUVEH9vz9CA5iIU5iyqgKmcoJwp8zV05pKlWAY9g1SYFAxVOQLMr4HYh6HBsxsspOwNq/939BhjL2VEtpSfI7sOwMZ46PJIkPedmNZFb3WMtrxuZW+IGLhzqyfeSGVsyhm3evISPHCNyDvVtjUM814dbTkRNJXuxsokv7ThC4P+aD+dGGQGsNsHHdNhizwrVkJgVO5wmo23lHfN+dxLKjHUxuhh+L/I/SOIp+qsGvk7XAehW8aCVG4GTW19nTn8Ol4sVyf4P8P+wX6UYDKUHUlqspYv49/g7BeEh+ig5YQOnHqxodHmTp5sww9DvD0Oj6On9H7+b71M2qxXZoAv2nINaps4+PfKj3ZZFFi3lviUWUbd81P6L+fm2LHNrx0VZsNqGppw1m2j6zxMe58XETSBJOZf97KU/qP0ueyTD9kuZEOaQYfJJfPMn28EvpPoYbvQlXixJ96p2P8Bxtgy4x8owowoG2xQmMNGKfZqg33DO3e7J+2i49Ivr5P2Vvv/Uk7CCtDhgx+ZGovwmLNLg6qeV3IpUewjhjertDCLaJgPfIcI0/mRrcrsSwe2EKJH/omJxQKQLFvsyY19bb7QxJQkBN/DtanFZG9lSoPEmMwKnWzSfg46O2voobdOLswNeTNw4hT8G8Ae8zEQi9rHb463ciL3ppY3uTzavEfFAh'),
('52af63afee4708-68027174', 1387232250, 'Nklzm8QXO3FAGNRv0RUnHaTD5BZtHLoUGwfHK2Z/qb2u/3p+7my7X632UGvn3zVtWyOMwTt5a9ubEB7WzKZuX7P09NDXngfru7ZKhJEVsiOw8rgTVLGa9EMxWCkAHTFM9+5O4aLlUText7kzXzRIXXx4GR2ThzLbs4AVZoHZFGibzPhJ4shg5Jg2lJVTB1wj9KlHbG4i4sgkuVPlvvvNMtDqLAwxkc4VYirNkB6DwRYyxHMRjS1hVnUuMR34OCp1jflrBmaL1JZuvvNtwoXUUDDu154Gi2sAALHzCFNie7B15jMldjC0oK/+lW3cp+CdZdvzpeRIm9WoBQy9nQyg55i0kmvOLyXPs0FSHi3lW6dCcxHIrkcKlexceMjLQB3K1XdZ3+DYJ7VPNdbDnHJth9QLKqquwhTAv+RHVJpBELXHTlVkMRR3Q/twexL7q66k9WyQ30jX9W5+2OaOM0IjiU6ToxyVHXD5B5wzjz8l0dLcobL2izpXkhQ9ScET3zagufWZPtFqglCeXe7zIUKP8ChbW5KdXQ/hv1I/9MDqHXrE6/au+THFFl18kye7ZtdHlzNdKxWmb2Sf6eOc0uQwARJnoyoCCyBNiDuceneRpj2FqMP8ahRqWreshYqlDHGhwiEZCj04sKCN7hJ/DCPho8Vwy396pqAhEqTODHbAUSHRl0SNNfCZBDv0cklBfGp4Z7a8z64avfOkn8dSuMr9jAySeacmHnFR/xfJ8UiyTqSZKf6JPjiUdoEO1Zsp1bH0v0S6/DZC+N1ui468MBVtrGT8FaU5+7t0mArsEUUjfdmNaa1t1tdxiuezyd/pPjNdXzZJBW+HlBthxh3FDMvAzUSUeuKRxKY/BjHe/qOCYyMjyKLPjN2m1QRTwqza05hZBjA1Q9n2/dgpk9cd3AZ3k1YnkbTCBefG2eHjE78wu5phZOTuYBoDE+MG0gQ7828po4C+YxmR0Hp3mSlI3h9vjgKQPUPboR0fESXhswKqLa88mY71zxGijjz5xNcJxPekZG1rk29i');

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
(13, 'user@user.ru', 'user', '3f884a8dcd987e71494a1390f9b0a51306944707ede59dddd003428628c64cf6', 11, 1387225592, NULL),
(14, 'admin@ya.ru', 'admin', 'f4b4ad84a019c58c380e9ac1a9ab12c4bd4171363b8c6822b8f2c5f2ff699230', 21, 1387226031, NULL),
(15, 'Gangsta1@i.ua', 'VladikKiller', '0ceb7798fdcef9e678cd28b0bd6af434e1efbb2381b5a9d447cf497607bbbf3e', 9, 1386881683, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `user_tokens`
--

INSERT INTO `user_tokens` (`id`, `user_id`, `user_agent`, `token`, `type`, `created`, `expires`) VALUES
(8, 14, 'd304b5286ed9eea23255c128b19f885557138b7c', 'd85178909285af882c9513a499a97c5e9d108d1e', '', 0, 1388435631);

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
