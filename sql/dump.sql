-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июн 03 2019 г., 09:14
-- Версия сервера: 5.7.21-20-beget-5.7.21-20-1-log
-- Версия PHP: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sgnaty_covert`
--

DELIMITER $$
--
-- Функции
--
DROP FUNCTION IF EXISTS `STRFIND`$$
CREATE DEFINER=`sgnaty_covert`@`localhost` FUNCTION `STRFIND` (`str` VARCHAR(255), `delimtr` CHAR(1)) RETURNS INT(11) BEGIN
    DECLARE _cnt INT;
    DECLARE _start INT;
    SET _cnt = -1;
    SET _start = 1;
    WHILE _start > 0 DO
    SET _start = LOCATE(delimtr, str);
    SET str = SUBSTRING(str, _start + 1);
    SET _cnt = _cnt + 1;
    END WHILE;
    RETURN _cnt;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--
-- Создание: Июн 02 2019 г., 10:31
-- Последнее обновление: Июн 03 2019 г., 06:05
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `thread_id` bigint(20) UNSIGNED NOT NULL,
  `parent_comment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `thread_id`, `parent_comment_id`, `author_name`, `text`, `path`, `created_at`, `updated_at`) VALUES
(19, 8, NULL, 'Dawnstar1932', 'confused screaming', '1', '2019-06-02 19:51:05', '2019-06-02 19:51:05'),
(20, 8, 19, 'GrimGamesLP', 'https://media1.tenor.com/images/8547a3306a054411d9ef1e31d798ee03/tenor.gif?itemid=11254472', '1.1', '2019-06-02 19:52:42', '2019-06-02 19:52:42'),
(21, 8, 20, 'TippyIsCool', 'Risky click', '1.1.1', '2019-06-02 19:53:29', '2019-06-02 19:53:29'),
(22, 8, 21, 'LivingDead_Victim', 'Click successful, I made it friends.', '1.1.1.1', '2019-06-02 19:54:08', '2019-06-02 19:54:08'),
(23, 8, 21, 'DragonAce03', 'good click', '1.1.1.2', '2019-06-02 19:54:36', '2019-06-02 19:54:36'),
(24, 8, 23, 'lynettetepe', 'Still nervous to click', '1.1.1.2.1', '2019-06-02 19:55:43', '2019-06-02 19:55:43'),
(25, 8, 24, 'Pat-El', 'Maybe just double click', '1.1.1.2.1.1', '2019-06-02 19:56:21', '2019-06-02 19:56:21'),
(26, 8, 21, 'MegaMan2wasrad', 'It’s good', '1.1.1.3', '2019-06-02 19:57:07', '2019-06-02 19:57:07'),
(27, 8, 20, 'HighScienceKen', 'Joji. One of my favorite musicians.', '1.1.2', '2019-06-02 19:58:36', '2019-06-02 19:58:36'),
(28, 8, 19, 'Spooodermon', 'confused boner', '1.2', '2019-06-02 19:59:35', '2019-06-02 19:59:35'),
(29, 8, 19, 'Maharba84Zurc', 'Same', '1.3', '2019-06-02 20:00:12', '2019-06-02 20:00:12'),
(30, 8, 19, 'pauletta1728', 'Imagine giving birth and having a baby come out of this 🤮', '1.4', '2019-06-02 20:00:40', '2019-06-02 20:00:40'),
(31, 8, 19, '46554B4E4348414453', 'That\'s the ides', '1.5', '2019-06-02 20:01:01', '2019-06-02 20:01:01'),
(32, 8, NULL, 'VictorZiblis', 'That\'s the best advertisement for anal sex I have ever seen.  Edit: I have been corrected. The Octosphincter is the tattoo that is best at advertising anal sex.', '1', '2019-06-03 05:43:52', '2019-06-03 05:43:52'),
(33, 8, 31, 'SolarStorm2950', 'Her butt has a scared altar boy on it', '1.5.1', '2019-06-03 05:58:06', '2019-06-03 05:58:06'),
(34, 8, 32, 'SolarStorm2950', 'Her butt has a scared altar boy on it', '1.1', '2019-06-03 05:58:38', '2019-06-03 05:58:38'),
(35, 9, NULL, 'Swolbro', 'I saw something similar on the a train in NYC. Guy was pretty old, and I guess he didn\'t even know about flash and picture sounds but he took like 3 pictures of a a group of high school girls.', '1', '2019-06-03 06:00:48', '2019-06-03 06:00:48'),
(36, 9, 35, 'Cali21', 'That’s why Japanese made phones have the mandatory shutter sound that can’t be turned off. They have a real problem with people taking inappropriate pictures.', '1.1', '2019-06-03 06:02:07', '2019-06-03 06:02:07'),
(37, 9, 36, 'ctfzs', 'I got my phone off of amazon not knowing it was a Korean model and it also has the permanent shutter sound', '1.1.1', '2019-06-03 06:03:07', '2019-06-03 06:03:07'),
(38, 9, 37, 'Mavystar', 'Same here! I hate it! You can download a different camera app and it won\'t happen.', '1.1.1.1', '2019-06-03 06:03:29', '2019-06-03 06:03:29'),
(39, 9, 38, 'BlckMrkt', 'I\'m sure you can, pervert!', '1.1.1.1.1', '2019-06-03 06:03:53', '2019-06-03 06:03:53'),
(40, 9, 39, 'DOOR_IS_STUCK', 'I can\'t give gold through reddit is fun app but I want you to know I laughed hard enough to consider it', '1.1.1.1.1.1', '2019-06-03 06:04:27', '2019-06-03 06:04:27'),
(41, 9, 40, 'Rastignac', 'thoughts and prayers', '1.1.1.1.1.1.1', '2019-06-03 06:04:52', '2019-06-03 06:04:52'),
(42, 9, 41, 'brassidas', 'Always free', '1.1.1.1.1.1.1.1', '2019-06-03 06:05:36', '2019-06-03 06:05:36');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--
-- Создание: Июн 02 2019 г., 10:31
-- Последнее обновление: Июн 02 2019 г., 10:31
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_06_01_091008_create_users_table', 1),
(2, '2019_06_02_101319_create_threads_table', 1),
(3, '2019_06_03_101042_create_comments_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `threads`
--
-- Создание: Июн 02 2019 г., 10:31
-- Последнее обновление: Июн 03 2019 г., 06:00
--

DROP TABLE IF EXISTS `threads`;
CREATE TABLE `threads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `threads`
--

INSERT INTO `threads` (`id`, `name`, `created_at`, `updated_at`) VALUES
(8, 'site.com/page1', '2019-06-02 19:51:05', '2019-06-02 19:51:05'),
(9, 'site.com/page2', '2019-06-03 06:00:48', '2019-06-03 06:00:48');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--
-- Создание: Июн 02 2019 г., 10:31
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_thread_id_index` (`thread_id`),
  ADD KEY `comments_parent_comment_id_index` (`parent_comment_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `threads_name_unique` (`name`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_email_index` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `threads`
--
ALTER TABLE `threads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_parent_comment_id_foreign` FOREIGN KEY (`parent_comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_thread_id_foreign` FOREIGN KEY (`thread_id`) REFERENCES `threads` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
