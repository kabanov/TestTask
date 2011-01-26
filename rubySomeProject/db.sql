-- phpMyAdmin SQL Dump
-- version 2.11.9.2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Янв 26 2011 г., 12:22
-- Версия сервера: 5.0.37
-- Версия PHP: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- База данных: `SomeProject`
--

-- --------------------------------------------------------

--
-- Структура таблицы `figures`
--

CREATE TABLE IF NOT EXISTS `figures` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `x` int(5) unsigned NOT NULL default '0',
  `y` int(5) unsigned NOT NULL default '0',
  `age` int(5) unsigned NOT NULL default '0',
  `f_type` int(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `figures`
--

INSERT INTO `figures` (`id`, `x`, `y`, `age`, `f_type`) VALUES
(7, 0, 5, 4, 1);
