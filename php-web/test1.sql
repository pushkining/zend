-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 24 2020 г., 14:51
-- Версия сервера: 10.4.11-MariaDB
-- Версия PHP: 7.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `director`
--

CREATE TABLE `director` (
  `nameDir` varchar(255) NOT NULL,
  `directorId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `director`
--

INSERT INTO `director` (`nameDir`, `directorId`) VALUES
('Hitchcock', 0),
('Cameron', 1),
('Tarantino', 2),
('Abrams', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `movie`
--

CREATE TABLE `movie` (
  `movieId` int(11) NOT NULL,
  `directorId` int(11) NOT NULL,
  `nameMov` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `releaseDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `movie`
--

INSERT INTO `movie` (`movieId`, `directorId`, `nameMov`, `description`, `releaseDate`) VALUES
(1, 1, 'Avatar', 'fantasy', '2000-01-01'),
(2, 2, 'Kill Bill', 'crime', '2004-01-01'),
(4, 3, 'Star treck', 'fantastic', '2009-01-01'),
(5, 2, 'Pulp fiction', 'crime', '1994-01-01'),
(53, 2, 'Slipknot', 'drama', '1987-01-01'),
(54, 3, 'Queen', 'drama', '2003-01-01'),
(55, 1, 'Metallica', 'horror', '2000-01-01'),
(59, 0, 'Slipknot', 'drama', '1987-01-01'),
(63, 2, 'Queen', 'drama', '2001-01-01'),
(67, 1, 'assa', 'comedy', '2020-04-23');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(4, 'user', '12dea96fec20593566ab75692c9949596833adc9'),
(5, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`directorId`);

--
-- Индексы таблицы `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`movieId`),
  ADD KEY `directorId` (`directorId`) USING BTREE;

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `movie`
--
ALTER TABLE `movie`
  MODIFY `movieId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`directorId`) REFERENCES `director` (`directorId`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
