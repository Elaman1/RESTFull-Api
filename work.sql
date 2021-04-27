-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 27 2021 г., 18:15
-- Версия сервера: 5.7.25
-- Версия PHP: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `work`
--

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(5, '2021_04_27_093210_create_records_table', 2),
(6, '2014_10_12_100000_create_password_resets_table', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `records`
--

CREATE TABLE `records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `heading` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `records`
--

INSERT INTO `records` (`id`, `heading`, `text`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Firsting', 'Go GO GO', 4, '2021-04-27 04:17:07', '2021-04-27 07:52:20'),
(2, 'Hello world', 'Much word texting', 4, '2021-04-27 04:19:38', '2021-04-27 04:19:38'),
(3, 'Hello world', 'Much word texting', 4, '2021-04-27 04:20:46', '2021-04-27 04:20:46'),
(4, 'Hello world', 'Much word texting', 4, '2021-04-27 04:23:32', '2021-04-27 04:23:32'),
(5, 'Hello world', 'Much word texting', 4, '2021-04-27 04:25:21', '2021-04-27 04:25:21'),
(6, 'MMyO keeping', 'Much more  word texting', 4, '2021-04-27 07:56:11', '2021-04-27 07:56:11'),
(7, 'test', 'Much more  word texting test', 4, '2021-04-27 08:42:37', '2021-04-27 08:42:37'),
(8, 'test2', 'Much more  word texting test', 4, '2021-04-27 08:55:37', '2021-04-27 08:55:37');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'dela@mail.ru', NULL, '$2y$10$RUQ8k9vfrE49HdnmtxJTcuhSR3HkIHot3.3kjtN9uynDPnvfnz9yO', NULL, '2021-04-27 00:39:38', '2021-04-27 00:39:38'),
(2, 'manager@mail.ru', NULL, '$2y$10$U17PdDSAJoU8scm34ArJH.pPAvaJuTiJB.6xCrUyv9KCHxI5S5BHO', NULL, '2021-04-27 00:42:02', '2021-04-27 00:42:02'),
(4, 'admin2@mail.ru', NULL, '$2y$10$cDv6epBhWIZv3uQG3kZZ2uF2mPzbNTT6ciKq2AWrr.NLrepdofRFW', NULL, '2021-04-27 01:04:51', '2021-04-27 01:04:51'),
(5, 'test@mail.ru', NULL, '$2y$10$puP.OLqhk6XJZjA/mIElJ.ySDmtcKx3za6hsNCNL3KKeRSNkUCCyi', NULL, '2021-04-27 05:59:42', '2021-04-27 05:59:42'),
(6, 'adam@md.ru', NULL, '$2y$10$3ObtMwSdjRE3UW18Fc63L.NdDDSkPjKyIqwz4P7Ie61YXHMmpbcKS', NULL, '2021-04-27 07:44:46', '2021-04-27 07:44:46');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `records`
--
ALTER TABLE `records`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `records`
--
ALTER TABLE `records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
