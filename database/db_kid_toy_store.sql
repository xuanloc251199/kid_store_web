-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 09, 2025 lúc 04:59 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_kid_toy_store`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ticket_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `ticket_id`, `quantity`, `created_at`, `updated_at`, `type`) VALUES
(97, 10, 15, NULL, 5, '2025-01-08 15:03:00', '2025-01-08 16:22:20', 'product'),
(100, 10, 18, NULL, 2, '2025-01-08 15:13:29', '2025-01-08 15:13:29', 'product'),
(101, 10, 19, NULL, 2, '2025-01-08 15:13:33', '2025-01-08 15:13:33', 'product'),
(103, 10, NULL, 3, 2, '2025-01-08 15:14:05', '2025-01-08 15:14:05', 'ticket');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `thumbnail` mediumtext NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `thumbnail`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Updated Category', 'thumbnails/categories/playground_1728150254.jpg', '<p>Updated <strong><em>description</em></strong></p>', NULL, '2024-10-05 10:44:14'),
(2, 'Books', 'thumbnails/categories/order-success_1728310943.png', '<p>Educational books</p>', NULL, '2024-10-07 07:22:23'),
(3, 'New Category', 'thumbnails/categories/order-success_1728818740.png', 'Description of the new category', '2024-09-30 21:05:13', '2024-10-13 04:25:40'),
(10, 'Toys', 'thumbnails/categories/order-success_1728818747.png', 'Children toys', NULL, '2024-10-13 04:25:47'),
(11, 'Books', 'thumbnails/categories/order-success_1728818755.png', 'Educational books', NULL, '2024-10-13 04:25:55'),
(12, 'ádad', 'thumbnails/categories/avt_1728818761.png', 'aaaa', '2024-10-05 09:29:27', '2024-10-13 04:26:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(8, '2024_10_05_034306_create_orders_table', 2),
(9, '2024_10_05_050800_create_order_items_table', 2),
(10, '2024_10_12_083227_create_orders_table', 3),
(11, '2024_10_12_083249_create_order_items_table', 3),
(13, '2024_10_13_065447_create_notifications_table', 4),
(14, '2024_10_13_152757_create_user_cards_table', 5),
(15, '2025_01_08_115257_update_type_column_in_notifications_table', 6),
(16, '2025_01_08_201256_add_status_to_notifications_table', 7),
(18, '2025_01_08_210414_add_promotion_to_products_table', 8),
(19, '2025_01_08_224451_add_promotion_to_tickets_table', 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` enum('error','success','warning','promotion') NOT NULL,
  `status` enum('unread','read') NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `message`, `type`, `status`, `created_at`, `updated_at`) VALUES
(23, 16, 'Mua hàng thành công!', 'Đơn hàng #43 đã được đặt thành công. Cảm ơn bạn đã mua hàng!', 'success', 'unread', '2024-10-15 19:00:37', '2024-10-15 19:00:37'),
(24, 16, 'Mua hàng thành công!', 'Đơn hàng #44 đã được đặt thành công. Cảm ơn bạn đã mua hàng!', 'success', 'unread', '2024-10-15 19:01:18', '2024-10-15 19:01:18'),
(25, 16, 'Mua hàng thành công!', 'Đơn hàng #45 đã được đặt thành công. Cảm ơn bạn đã mua hàng!', 'success', 'unread', '2024-10-15 19:02:39', '2024-10-15 19:02:39'),
(26, 16, 'Mua hàng thành công!', 'Đơn hàng #46 đã được đặt thành công. Cảm ơn bạn đã mua hàng!', 'success', 'unread', '2024-10-15 19:11:13', '2024-10-15 19:11:13'),
(27, 16, 'Mua hàng thành công!', 'Đơn hàng #47 đã được đặt thành công. Cảm ơn bạn đã mua hàng!', 'success', 'unread', '2024-10-15 19:14:57', '2024-10-15 19:14:57'),
(28, 16, 'Mua hàng thành công!', 'Đơn hàng #48 đã được đặt thành công. Cảm ơn bạn đã mua hàng!', 'success', 'unread', '2024-10-16 09:32:30', '2024-10-16 09:32:30'),
(29, 19, 'Mua hàng thành công!', 'Đơn hàng #49 đã được đặt thành công. Cảm ơn bạn đã mua hàng!', 'success', 'unread', '2024-10-19 01:08:25', '2024-10-19 01:08:25'),
(30, 16, 'Mua hàng thành công!', 'Đơn hàng #50 đã được đặt thành công. Cảm ơn bạn đã mua hàng!', 'success', 'unread', '2024-10-19 01:22:51', '2024-10-19 01:22:51'),
(31, 20, 'Mua hàng thành công!', 'Đơn hàng #53 đã được đặt thành công. Cảm ơn bạn đã mua hàng!', 'success', 'unread', '2024-11-15 22:53:51', '2024-11-15 22:53:51'),
(32, 20, 'Mua hàng thành công!', 'Đơn hàng #54 đã được đặt thành công. Cảm ơn bạn đã mua hàng!', 'success', 'unread', '2024-11-15 22:54:32', '2024-11-15 22:54:32'),
(33, 20, 'Mua hàng thành công!', 'Đơn hàng #56 đã được đặt thành công. Cảm ơn bạn đã mua hàng!', 'success', 'unread', '2024-11-16 09:31:41', '2024-11-16 09:31:41'),
(36, 3, 'Giảm giá', 'Giảm giá sâu 99%', 'success', 'unread', '2025-01-08 04:51:43', '2025-01-08 04:51:43'),
(38, 13, 'Giảm giá', 'Giảm giá sâu 99%', 'success', 'unread', '2025-01-08 04:51:43', '2025-01-08 04:51:43'),
(39, 16, 'Giảm giá', 'Giảm giá sâu 99%', 'success', 'unread', '2025-01-08 04:51:43', '2025-01-08 04:51:43'),
(40, 18, 'Giảm giá', 'Giảm giá sâu 99%', 'success', 'unread', '2025-01-08 04:51:43', '2025-01-08 04:51:43'),
(41, 19, 'Giảm giá', 'Giảm giá sâu 99%', 'success', 'unread', '2025-01-08 04:51:43', '2025-01-08 04:51:43'),
(42, 20, 'Giảm giá', 'Giảm giá sâu 99%', 'success', 'unread', '2025-01-08 04:51:43', '2025-01-08 04:51:43'),
(43, 3, 'Test', 'test nhiều', 'promotion', 'unread', '2025-01-08 04:54:02', '2025-01-08 04:54:02'),
(45, 13, 'Test', 'test nhiều', 'promotion', 'unread', '2025-01-08 04:54:02', '2025-01-08 04:54:02'),
(46, 16, 'Test', 'test nhiều', 'promotion', 'unread', '2025-01-08 04:54:02', '2025-01-08 04:54:02'),
(47, 18, 'Test', 'test nhiều', 'promotion', 'unread', '2025-01-08 04:54:02', '2025-01-08 04:54:02'),
(48, 19, 'Test', 'test nhiều', 'promotion', 'unread', '2025-01-08 04:54:02', '2025-01-08 04:54:02'),
(49, 20, 'Test', 'test nhiều', 'promotion', 'unread', '2025-01-08 04:54:02', '2025-01-08 04:54:02'),
(50, 3, 'Test 2', 'Test', 'promotion', 'unread', '2025-01-08 13:50:35', '2025-01-08 13:50:35'),
(52, 13, 'Test 2', 'Test', 'promotion', 'unread', '2025-01-08 13:50:35', '2025-01-08 13:50:35'),
(53, 16, 'Test 2', 'Test', 'promotion', 'unread', '2025-01-08 13:50:35', '2025-01-08 13:50:35'),
(54, 18, 'Test 2', 'Test', 'promotion', 'unread', '2025-01-08 13:50:35', '2025-01-08 13:50:35'),
(55, 19, 'Test 2', 'Test', 'promotion', 'unread', '2025-01-08 13:50:35', '2025-01-08 13:50:35'),
(56, 20, 'Test 2', 'Test', 'promotion', 'unread', '2025-01-08 13:50:35', '2025-01-08 13:50:35'),
(57, 3, 'test3', 'tét3', 'promotion', 'unread', '2025-01-08 14:00:18', '2025-01-08 14:00:18'),
(59, 13, 'test3', 'tét3', 'promotion', 'unread', '2025-01-08 14:00:18', '2025-01-08 14:00:18'),
(60, 16, 'test3', 'tét3', 'promotion', 'unread', '2025-01-08 14:00:18', '2025-01-08 14:00:18'),
(61, 18, 'test3', 'tét3', 'promotion', 'unread', '2025-01-08 14:00:18', '2025-01-08 14:00:18'),
(62, 19, 'test3', 'tét3', 'promotion', 'unread', '2025-01-08 14:00:18', '2025-01-08 14:00:18'),
(63, 20, 'test3', 'tét3', 'promotion', 'unread', '2025-01-08 14:00:18', '2025-01-08 14:00:18'),
(64, 3, 'test4', 'test4', 'promotion', 'unread', '2025-01-08 14:00:46', '2025-01-08 14:00:46'),
(66, 13, 'test4', 'test4', 'promotion', 'unread', '2025-01-08 14:00:46', '2025-01-08 14:00:46'),
(67, 16, 'test4', 'test4', 'promotion', 'unread', '2025-01-08 14:00:46', '2025-01-08 14:00:46'),
(68, 18, 'test4', 'test4', 'promotion', 'unread', '2025-01-08 14:00:46', '2025-01-08 14:00:46'),
(69, 19, 'test4', 'test4', 'promotion', 'unread', '2025-01-08 14:00:46', '2025-01-08 14:00:46'),
(70, 20, 'test4', 'test4', 'promotion', 'unread', '2025-01-08 14:00:46', '2025-01-08 14:00:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `status`, `total_price`, `created_at`, `updated_at`) VALUES
(1, 3, 'pending', 579.58, '2024-10-12 01:42:33', '2024-10-12 01:42:33'),
(41, 16, 'paid', 29.98, '2024-10-15 09:43:28', '2024-10-15 09:43:28'),
(42, 16, 'paid', 0.00, '2024-10-15 18:57:29', '2024-10-15 18:57:29'),
(43, 16, 'paid', 29.97, '2024-10-15 19:00:37', '2024-10-15 19:00:37'),
(44, 16, 'paid', 50.00, '2024-10-15 19:01:18', '2024-10-15 19:01:18'),
(45, 16, 'paid', 119.98, '2024-10-15 19:02:39', '2024-10-15 19:02:39'),
(46, 16, 'paid', 9.99, '2024-10-15 19:11:13', '2024-10-15 19:11:13'),
(47, 16, 'paid', 19.98, '2024-10-15 19:14:57', '2024-10-15 19:14:57'),
(48, 16, 'paid', 100019.98, '2024-10-16 09:32:30', '2024-10-16 09:32:30'),
(49, 19, 'paid', 9.99, '2024-10-19 01:08:25', '2024-10-19 01:08:25'),
(50, 16, 'paid', 9.99, '2024-10-19 01:22:51', '2024-10-19 01:22:51'),
(53, 20, 'paid', 100009.99, '2024-11-15 22:53:51', '2024-11-15 22:53:51'),
(54, 20, 'paid', 135.11, '2024-11-15 22:54:32', '2024-11-15 22:54:32'),
(55, 20, 'paid', 9.99, '2024-11-16 02:40:14', '2025-01-08 04:24:28'),
(56, 20, 'paid', 109.99, '2024-11-16 09:31:41', '2024-11-16 09:31:41'),
(57, 10, 'paid', 9.99, '2025-01-08 01:12:15', '2025-01-08 01:12:15'),
(58, 10, 'paid', 19.99, '2025-01-08 04:13:08', '2025-01-08 04:18:49'),
(59, 10, 'paid', 99.90, '2025-01-08 04:19:28', '2025-01-08 04:19:38'),
(60, 10, 'paid', 199.90, '2025-01-08 04:21:37', '2025-01-08 04:21:51'),
(61, 10, 'paid', 130000.00, '2025-01-08 14:53:25', '2025-01-08 14:53:25'),
(62, 10, 'paid', 130000.00, '2025-01-08 14:54:08', '2025-01-08 14:54:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ticket_id` bigint(20) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `ticket_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 15, 0, 26, 9.99, '2024-10-12 01:42:33', '2024-10-12 01:42:33'),
(2, 1, 16, 0, 16, 19.99, '2024-10-12 01:42:33', '2024-10-12 01:42:33'),
(52, 41, 15, NULL, 1, 9.99, '2024-10-15 09:43:28', '2024-10-15 09:43:28'),
(53, 41, 16, NULL, 1, 19.99, '2024-10-15 09:43:28', '2024-10-15 09:43:28'),
(54, 42, 15, NULL, 1, 9.99, '2024-10-15 18:57:29', '2024-10-15 18:57:29'),
(55, 43, 15, NULL, 3, 9.99, '2024-10-15 19:00:37', '2024-10-15 19:00:37'),
(56, 44, NULL, NULL, 1, 50.00, '2024-10-15 19:01:18', '2024-10-15 19:01:18'),
(57, 45, 15, NULL, 2, 9.99, '2024-10-15 19:02:39', '2024-10-15 19:02:39'),
(58, 45, NULL, NULL, 2, 50.00, '2024-10-15 19:02:39', '2024-10-15 19:02:39'),
(59, 46, 15, NULL, 1, 9.99, '2024-10-15 19:11:13', '2024-10-15 19:11:13'),
(60, 47, 15, NULL, 2, 9.99, '2024-10-15 19:14:57', '2024-10-15 19:14:57'),
(61, 48, 15, NULL, 2, 9.99, '2024-10-16 09:32:30', '2024-10-16 09:32:30'),
(62, 48, NULL, 3, 1, 100000.00, '2024-10-16 09:32:30', '2024-10-16 09:32:30'),
(63, 49, 15, NULL, 1, 9.99, '2024-10-19 01:08:25', '2024-10-19 01:08:25'),
(64, 50, 15, NULL, 1, 9.99, '2024-10-19 01:22:51', '2024-10-19 01:22:51'),
(65, 55, 15, NULL, 1, 9.99, '2024-11-16 02:40:14', '2024-11-16 02:40:14'),
(66, 58, 16, NULL, 1, 19.99, '2025-01-08 04:13:08', '2025-01-08 04:13:08'),
(67, 59, 15, NULL, 10, 9.99, '2025-01-08 04:19:28', '2025-01-08 04:19:28'),
(68, 60, 16, NULL, 10, 19.99, '2025-01-08 04:21:37', '2025-01-08 04:21:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'auth_token', '81b20b1d2372571dceeaa8e36e656453a09006c65624c06c1583ed6907c38d1a', '[\"*\"]', NULL, NULL, '2024-10-04 20:29:10', '2024-10-04 20:29:10'),
(2, 'App\\Models\\User', 4, 'auth_token', '8443ad8945be1f31168e1d8bc02b60ba390bdc2ac0fbefa1fe06eb1cf8f0181e', '[\"*\"]', NULL, NULL, '2024-10-04 20:37:36', '2024-10-04 20:37:36'),
(3, 'App\\Models\\User', 3, 'auth_token', 'e6ae6bd6ef7036591595cf97ff7c8f5b1f563ce976e3ea088146c306243fe06d', '[\"*\"]', NULL, NULL, '2024-10-04 21:31:42', '2024-10-04 21:31:42'),
(4, 'App\\Models\\User', 3, 'auth_token', '62d2c81abc416a88199080ba0220c336707aa6a157274a17e5e1049c95c5f667', '[\"*\"]', NULL, NULL, '2024-10-04 21:35:24', '2024-10-04 21:35:24'),
(5, 'App\\Models\\User', 3, 'auth_token', '4af612ef1edfcb833e025c1a726b584e638099a59bdfcdda0805694964a67ffc', '[\"*\"]', '2024-10-04 21:58:57', NULL, '2024-10-04 21:44:30', '2024-10-04 21:58:57'),
(6, 'App\\Models\\User', 3, 'auth_token', 'e40ed33866d0a2925c2ef5b85a55d1d6a2340c5176a3c0d07dc4f9b506387b0b', '[\"*\"]', '2024-10-12 10:57:27', NULL, '2024-10-04 21:59:04', '2024-10-12 10:57:27'),
(7, 'App\\Models\\User', 3, 'auth_token', 'b0ceeecf501c0102c17832abb1bc2528a077f2b0e6b4171165ce4db6527383da', '[\"*\"]', NULL, NULL, '2024-10-04 22:39:05', '2024-10-04 22:39:05'),
(8, 'App\\Models\\User', 7, 'auth_token', '9ba58c485750ac86e13d16fe0c09655637c1f1cf17291b21146179a81b037275', '[\"*\"]', NULL, NULL, '2024-10-04 22:39:15', '2024-10-04 22:39:15'),
(9, 'App\\Models\\User', 4, 'auth_token', '5253f53166adc12a26d05dc42fab3ba8b1c16ca7b592e310ac2ee49eda1ce770', '[\"*\"]', '2024-10-05 19:21:29', NULL, '2024-10-04 22:44:36', '2024-10-05 19:21:29'),
(10, 'App\\Models\\User', 3, 'auth_token', 'b5b7544b2d9422632825b97e359a90d72c07bc283548c00850e8cec0a524646b', '[\"*\"]', NULL, NULL, '2024-10-05 00:17:14', '2024-10-05 00:17:14'),
(11, 'App\\Models\\User', 3, 'auth_token', '37a770f3dd96aa0a6a099cd11652b4c0a4bceb39b38f2046aa32b6fd183562d4', '[\"*\"]', NULL, NULL, '2024-10-05 00:29:03', '2024-10-05 00:29:03'),
(12, 'App\\Models\\User', 3, 'auth_token', 'c6261936f4426ea99997a0608d599ef036471a904eb90325ccc676ed570fb4e3', '[\"*\"]', NULL, NULL, '2024-10-05 00:45:10', '2024-10-05 00:45:10'),
(13, 'App\\Models\\User', 8, 'auth_token', 'c5323e15829ef00404d27325448b9ca8ab449cf77707966e5ec48b6c88fd6907', '[\"*\"]', NULL, NULL, '2024-10-05 01:09:19', '2024-10-05 01:09:19'),
(14, 'App\\Models\\User', 9, 'auth_token', '05878bd06572bea16f46cc7dfb4f3132a985c2eb65e90db8f0ee92e314108333', '[\"*\"]', NULL, NULL, '2024-10-05 01:22:16', '2024-10-05 01:22:16'),
(15, 'App\\Models\\User', 9, 'auth_token', '6b91d496661b839518bbcc9ecfcec22c8c34e5e37c1410198db59b068d353d2e', '[\"*\"]', NULL, NULL, '2024-10-05 01:22:30', '2024-10-05 01:22:30'),
(16, 'App\\Models\\User', 3, 'auth_token', '4ba2bb9ef75d63b195eaf31478bf30e5f704ca459d3b2837139d7fd903357fab', '[\"*\"]', NULL, NULL, '2024-10-05 09:57:41', '2024-10-05 09:57:41'),
(17, 'App\\Models\\User', 3, 'auth_token', '33b56829fa21b485cb40141f2289ec356ce3d30211de8b1d57a785cc29664721', '[\"*\"]', NULL, NULL, '2024-10-05 09:59:10', '2024-10-05 09:59:10'),
(18, 'App\\Models\\User', 3, 'auth_token', 'ed74d954f271654aff5db484c25860edf276d22fbb707c81f52c844fb4dc3b83', '[\"*\"]', '2024-10-06 00:06:25', NULL, '2024-10-05 19:21:34', '2024-10-06 00:06:25'),
(19, 'App\\Models\\User', 3, 'auth_token', '34395ce11d17f18c86ff47bc9d770b930256ac521e70a41cf5064a90c4e4c0b2', '[\"*\"]', '2024-10-13 22:52:22', NULL, '2024-10-05 20:29:06', '2024-10-13 22:52:22'),
(21, 'App\\Models\\User', 3, 'auth_token', '3db0cde2da0f1cbada65695543d6ff28be6a1cb8b1d239c4666f1c8960a5fdfd', '[\"*\"]', NULL, NULL, '2024-10-05 21:03:31', '2024-10-05 21:03:31'),
(23, 'App\\Models\\User', 3, 'auth_token', '8d94e6844c13953895537d39e14e4f289279ae5a208c91e4097ef06a5b4cd5ba', '[\"*\"]', NULL, NULL, '2024-10-06 00:04:09', '2024-10-06 00:04:09'),
(24, 'App\\Models\\User', 3, 'auth_token', '554f9c2e23cdb2336a4a9acc98d88c36e6b4a8bffea5d6c6b82ede8f59df2cc4', '[\"*\"]', '2024-10-06 08:57:41', NULL, '2024-10-06 00:27:32', '2024-10-06 08:57:41'),
(25, 'App\\Models\\User', 3, 'auth_token', 'dc58251a795e9c52f895202d023f4712526789d6b3f687ff660b9132230a13b1', '[\"*\"]', '2024-10-06 03:18:32', NULL, '2024-10-06 02:23:07', '2024-10-06 03:18:32'),
(28, 'App\\Models\\User', 3, 'auth_token', 'c15f4d4cd90e395a75b028ee6f4e71e238f773cbd56b3a31faad4d5cc39ce0eb', '[\"*\"]', NULL, NULL, '2024-10-07 07:22:57', '2024-10-07 07:22:57'),
(30, 'App\\Models\\User', 10, 'auth_token', '573fb26fe2f8ce4ceee0cd0c41ff6bd75a7483b3f8c9787721ae9f2917a6fd8b', '[\"*\"]', NULL, NULL, '2024-10-07 07:31:16', '2024-10-07 07:31:16'),
(33, 'App\\Models\\User', 3, 'auth_token', 'ddecdadd17c04330ea1fedba5a5c8ff9f9cec937eb1532b674aee46f89f60583', '[\"*\"]', '2024-10-12 10:57:52', NULL, '2024-10-12 01:41:27', '2024-10-12 10:57:52'),
(34, 'App\\Models\\User', 14, 'auth_token', 'b8745f1ccda5a05aeb69eeaf5700658937425d589ab9c2e265de10fb2dac206a', '[\"*\"]', NULL, NULL, '2024-10-12 01:53:24', '2024-10-12 01:53:24'),
(35, 'App\\Models\\User', 14, 'auth_token', '8e095838802cd32cd86cf1c2801b82a664b1b18b1d8dd0842ef4af51db36c763', '[\"*\"]', '2024-10-12 10:49:21', NULL, '2024-10-12 01:53:33', '2024-10-12 10:49:21'),
(37, 'App\\Models\\User', 14, 'auth_token', 'e53c328ac30e3a35da666c70928cc7b3afbf1cc5d2e9593620ea5bf90a8c2cb9', '[\"*\"]', '2024-10-12 10:59:04', NULL, '2024-10-12 10:58:53', '2024-10-12 10:59:04'),
(38, 'App\\Models\\User', 14, 'auth_token', '392012928d88094560f879521c16694a0328c3faac7b74b88b67420b0d9d29ef', '[\"*\"]', '2024-10-13 03:12:38', NULL, '2024-10-12 13:58:04', '2024-10-13 03:12:38'),
(39, 'App\\Models\\User', 14, 'auth_token', '52aa6e8f474e8e66fe4d21848c0132e35c43ed322e37dd48e4dbabcb39ef4370', '[\"*\"]', '2024-10-13 03:12:42', NULL, '2024-10-12 20:38:16', '2024-10-13 03:12:42'),
(40, 'App\\Models\\User', 15, 'auth_token', '1fbb054ab9534c49810a4741fd3e2bb74a2d42159f88aae2f98cfb242026a30b', '[\"*\"]', NULL, NULL, '2024-10-13 04:27:13', '2024-10-13 04:27:13'),
(41, 'App\\Models\\User', 16, 'auth_token', '2e8b4e4316bfb3b56004603da34617adf9191689cc34781124bcaac1062d5908', '[\"*\"]', NULL, NULL, '2024-10-13 07:47:47', '2024-10-13 07:47:47'),
(43, 'App\\Models\\User', 16, 'auth_token', '68325084a5b42916ecd72c7fdf72ab4e0e575de1330951c3c8a1462e7894fe8e', '[\"*\"]', '2024-10-16 09:44:15', NULL, '2024-10-13 21:34:36', '2024-10-16 09:44:15'),
(44, 'App\\Models\\User', 16, 'auth_token', '540ecd5764e7e06b12b143e23989851b6e030be1fca3074a35568d3e9297e368', '[\"*\"]', '2024-10-14 05:39:54', NULL, '2024-10-14 03:12:19', '2024-10-14 05:39:54'),
(45, 'App\\Models\\User', 16, 'auth_token', '6dda4ded7a7c7a1eaedb8b60ab66b16ad1aa72790b9a21111aa65fe031806a86', '[\"*\"]', '2024-10-18 18:39:38', NULL, '2024-10-14 05:45:21', '2024-10-18 18:39:38'),
(46, 'App\\Models\\User', 16, 'auth_token', 'f320ce2e25251cc853657c4a588a65a9c4d164f54a985e1f0b7d6b32f5020079', '[\"*\"]', '2024-10-18 20:22:16', NULL, '2024-10-14 21:14:46', '2024-10-18 20:22:16'),
(47, 'App\\Models\\User', 19, 'auth_token', '38e39fa6598c73a441d608cd6da14266765c32f00eb6af3d89d798f6e2f9c175', '[\"*\"]', NULL, NULL, '2024-10-19 01:06:55', '2024-10-19 01:06:55'),
(48, 'App\\Models\\User', 19, 'auth_token', '9254b55d8ad621b34a98aeec1245c4767a3e1a5baf0a989d5038cd74ae02d170', '[\"*\"]', '2024-10-19 01:07:16', NULL, '2024-10-19 01:07:15', '2024-10-19 01:07:16'),
(50, 'App\\Models\\User', 20, 'auth_token', 'bc6def92825ee9ccee53832d2cfd058158f714025b3382694e5af600302d44f9', '[\"*\"]', NULL, NULL, '2024-10-19 01:09:53', '2024-10-19 01:09:53'),
(55, 'App\\Models\\User', 20, 'auth_token', '7939fc064de34035d5aa3a881cb92a3a1cf6b5e2c35b903017ea72f70162f9f1', '[\"*\"]', '2024-10-19 02:19:01', NULL, '2024-10-19 02:18:41', '2024-10-19 02:19:01'),
(56, 'App\\Models\\User', 20, 'auth_token', 'ce7a1652560d0804c1e862f2b78eb78fdb2a117639e4a7e8efa8599535fcbe41', '[\"*\"]', '2024-11-15 22:53:51', NULL, '2024-11-15 21:10:38', '2024-11-15 22:53:51'),
(57, 'App\\Models\\User', 20, 'auth_token', '20b3377923b6547bf3dd41780a9fff476f47f9814eea60bc79ac030322212d7b', '[\"*\"]', '2024-11-16 09:32:27', NULL, '2024-11-16 09:29:29', '2024-11-16 09:32:27'),
(58, 'App\\Models\\User', 10, 'auth_token', 'cac284bba40d1b095353ea2195b43c48a4eb81992d698be8fa0192061f6547ed', '[\"*\"]', '2025-01-08 16:42:07', NULL, '2025-01-08 01:09:49', '2025-01-08 16:42:07'),
(59, 'App\\Models\\User', 16, 'auth_token', '5683290eb272784c7a502f1d8365a1983788e6bd1bfdb9faeaa38185f0492884', '[\"*\"]', '2025-01-08 15:03:27', NULL, '2025-01-08 13:31:50', '2025-01-08 15:03:27'),
(60, 'App\\Models\\User', 10, 'auth_token', '44f44ffd33ab116ebf694086b483ef5a5a95faadfa12a36b9be73164f4bce724', '[\"*\"]', '2025-01-08 16:33:22', NULL, '2025-01-08 15:02:33', '2025-01-08 16:33:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` double NOT NULL,
  `thumbnail` mediumtext DEFAULT NULL,
  `sold` int(11) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `promotion` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `detail`, `description`, `price`, `thumbnail`, `sold`, `quantity`, `promotion`, `created_at`, `updated_at`) VALUES
(15, 'Toy Car', 1, '<p>Small red toy car for kids</p>', '<p>This toy car is made of durable plastic, suitable for children aged 3 and above.</p>', 130000, 'thumbnails/products/product_1728150572.jpg', 59, 11, 20, '2024-10-04 21:34:43', '2025-01-08 14:19:48'),
(16, 'Building Blocks Set', 1, '<p>A set of colorful building blocks</p>', '<p>These blocks help to develop creativity and problem-solving skills in children.</p>', 130000, 'thumbnails/products/product_1728150586.jpg', 35, 0, 0, '2024-10-04 21:34:43', '2025-01-08 04:21:37'),
(17, 'Story Book', 2, 'A story book for kids', 'A fun and engaging story book for young readers.', 130000, 'thumbnails/products/s612bae45e1ee41d7b4abec737f719ae6sjpg-720x720q80_1728817604.jpg', 34, 186, 0, '2024-10-04 21:34:43', '2024-10-13 04:55:17'),
(18, 'New prd', 1, NULL, NULL, 130000, 'thumbnails/products/order-success_1728311861.png', 13, 99, 0, '2024-10-07 07:37:41', '2024-10-12 11:06:58'),
(19, 'Product 1 Category 1', 1, 'Detail for Product 1 in Category 1', 'Description for Product 1 in Category 1', 130000, 'thumbnails/products/product_1728150572.jpg', 84, 181, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(20, 'Product 2 Category 1', 1, 'Detail for Product 2 in Category 1', 'Description for Product 2 in Category 1', 130000, 'thumbnails/products/product_1728150572.jpg', 20, 147, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(21, 'Product 3 Category 1', 1, 'Detail for Product 3 in Category 1', 'Description for Product 3 in Category 1', 130000, 'thumbnails/products/product_1728150572.jpg', 60, 73, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(22, 'Product 4 Category 1', 1, 'Detail for Product 4 in Category 1', 'Description for Product 4 in Category 1', 130000, 'thumbnails/products/product_1728150572.jpg', 68, 143, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(23, 'Product 5 Category 1', 1, 'Detail for Product 5 in Category 1', 'Description for Product 5 in Category 1', 130000, 'thumbnails/products/product_1728150572.jpg', 46, 138, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(24, 'Product 6 Category 1', 1, 'Detail for Product 6 in Category 1', 'Description for Product 6 in Category 1', 130000, 'thumbnails/products/product_1728150572.jpg', 36, 123, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(25, 'Product 7 Category 1', 1, 'Detail for Product 7 in Category 1', 'Description for Product 7 in Category 1', 130000, 'thumbnails/products/product_1728150572.jpg', 97, 104, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(26, 'Product 8 Category 1', 1, 'Detail for Product 8 in Category 1', 'Description for Product 8 in Category 1', 130000, 'thumbnails/products/product_1728150572.jpg', 69, 89, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(27, 'Product 9 Category 1', 1, 'Detail for Product 9 in Category 1', 'Description for Product 9 in Category 1', 130000, 'thumbnails/products/product_1728150572.jpg', 14, 56, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(28, 'Product 10 Category 1', 1, 'Detail for Product 10 in Category 1', 'Description for Product 10 in Category 1', 130000, 'thumbnails/products/product_1728150572.jpg', 5, 74, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(29, 'Product 1 Category 2', 2, 'Detail for Product 1 in Category 2', 'Description for Product 1 in Category 2', 130000, 'thumbnails/products/product_1728150572.jpg', 16, 96, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(30, 'Product 2 Category 2', 2, 'Detail for Product 2 in Category 2', 'Description for Product 2 in Category 2', 130000, 'thumbnails/products/product_1728150572.jpg', 68, 156, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(31, 'Product 3 Category 2', 2, 'Detail for Product 3 in Category 2', 'Description for Product 3 in Category 2', 130000, 'thumbnails/products/product_1728150572.jpg', 41, 179, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(32, 'Product 4 Category 2', 2, 'Detail for Product 4 in Category 2', 'Description for Product 4 in Category 2', 130000, 'thumbnails/products/product_1728150572.jpg', 73, 74, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(33, 'Product 5 Category 2', 2, 'Detail for Product 5 in Category 2', 'Description for Product 5 in Category 2', 130000, 'thumbnails/products/product_1728150572.jpg', 23, 131, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(34, 'Product 6 Category 2', 2, 'Detail for Product 6 in Category 2', 'Description for Product 6 in Category 2', 130000, 'thumbnails/products/product_1728150572.jpg', 21, 192, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(35, 'Product 7 Category 2', 2, 'Detail for Product 7 in Category 2', 'Description for Product 7 in Category 2', 130000, 'thumbnails/products/product_1728150572.jpg', 97, 131, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(36, 'Product 8 Category 2', 2, 'Detail for Product 8 in Category 2', 'Description for Product 8 in Category 2', 130000, 'thumbnails/products/product_1728150572.jpg', 13, 188, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(37, 'Product 9 Category 2', 2, 'Detail for Product 9 in Category 2', 'Description for Product 9 in Category 2', 130000, 'thumbnails/products/product_1728150572.jpg', 27, 192, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(38, 'Product 10 Category 2', 2, 'Detail for Product 10 in Category 2', 'Description for Product 10 in Category 2', 130000, 'thumbnails/products/product_1728150572.jpg', 44, 83, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(39, 'Product 1 Category 3', 3, 'Detail for Product 1 in Category 3', 'Description for Product 1 in Category 3', 130000, 'thumbnails/products/product_1728150572.jpg', 40, 69, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(40, 'Product 2 Category 3', 3, 'Detail for Product 2 in Category 3', 'Description for Product 2 in Category 3', 130000, 'thumbnails/products/product_1728150572.jpg', 63, 60, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(41, 'Product 3 Category 3', 3, 'Detail for Product 3 in Category 3', 'Description for Product 3 in Category 3', 130000, 'thumbnails/products/product_1728150572.jpg', 6, 70, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(42, 'Product 4 Category 3', 3, 'Detail for Product 4 in Category 3', 'Description for Product 4 in Category 3', 130000, 'thumbnails/products/product_1728150572.jpg', 4, 70, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(43, 'Product 5 Category 3', 3, 'Detail for Product 5 in Category 3', 'Description for Product 5 in Category 3', 130000, 'thumbnails/products/product_1728150572.jpg', 19, 195, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(44, 'Product 6 Category 3', 3, 'Detail for Product 6 in Category 3', 'Description for Product 6 in Category 3', 130000, 'thumbnails/products/product_1728150572.jpg', 88, 54, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(45, 'Product 7 Category 3', 3, 'Detail for Product 7 in Category 3', 'Description for Product 7 in Category 3', 130000, 'thumbnails/products/product_1728150572.jpg', 99, 59, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(46, 'Product 8 Category 3', 3, 'Detail for Product 8 in Category 3', 'Description for Product 8 in Category 3', 130000, 'thumbnails/products/product_1728150572.jpg', 36, 183, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(47, 'Product 9 Category 3', 3, 'Detail for Product 9 in Category 3', 'Description for Product 9 in Category 3', 130000, 'thumbnails/products/product_1728150572.jpg', 65, 155, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(48, 'Product 10 Category 3', 3, 'Detail for Product 10 in Category 3', 'Description for Product 10 in Category 3', 130000, 'thumbnails/products/product_1728150572.jpg', 36, 108, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(49, 'Product 1 Category 10', 10, 'Detail for Product 1 in Category 10', 'Description for Product 1 in Category 10', 130000, 'thumbnails/products/product_1728150572.jpg', 36, 56, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(50, 'Product 2 Category 10', 10, 'Detail for Product 2 in Category 10', 'Description for Product 2 in Category 10', 130000, 'thumbnails/products/product_1728150572.jpg', 24, 53, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(51, 'Product 3 Category 10', 10, 'Detail for Product 3 in Category 10', 'Description for Product 3 in Category 10', 130000, 'thumbnails/products/product_1728150572.jpg', 98, 71, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(52, 'Product 4 Category 10', 10, 'Detail for Product 4 in Category 10', 'Description for Product 4 in Category 10', 130000, 'thumbnails/products/product_1728150572.jpg', 52, 171, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(53, 'Product 5 Category 10', 10, 'Detail for Product 5 in Category 10', 'Description for Product 5 in Category 10', 130000, 'thumbnails/products/product_1728150572.jpg', 30, 178, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(54, 'Product 6 Category 10', 10, 'Detail for Product 6 in Category 10', 'Description for Product 6 in Category 10', 130000, 'thumbnails/products/product_1728150572.jpg', 27, 198, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(55, 'Product 7 Category 10', 10, 'Detail for Product 7 in Category 10', 'Description for Product 7 in Category 10', 130000, 'thumbnails/products/product_1728150572.jpg', 42, 184, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(56, 'Product 8 Category 10', 10, 'Detail for Product 8 in Category 10', 'Description for Product 8 in Category 10', 130000, 'thumbnails/products/product_1728150572.jpg', 55, 71, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(57, 'Product 9 Category 10', 10, 'Detail for Product 9 in Category 10', 'Description for Product 9 in Category 10', 130000, 'thumbnails/products/product_1728150572.jpg', 6, 101, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(58, 'Product 10 Category 10', 10, 'Detail for Product 10 in Category 10', 'Description for Product 10 in Category 10', 130000, 'thumbnails/products/product_1728150572.jpg', 68, 186, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(59, 'Product 1 Category 11', 11, 'Detail for Product 1 in Category 11', 'Description for Product 1 in Category 11', 130000, 'thumbnails/products/product_1728150572.jpg', 93, 86, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(60, 'Product 2 Category 11', 11, 'Detail for Product 2 in Category 11', 'Description for Product 2 in Category 11', 130000, 'thumbnails/products/product_1728150572.jpg', 93, 75, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(61, 'Product 3 Category 11', 11, 'Detail for Product 3 in Category 11', 'Description for Product 3 in Category 11', 130000, 'thumbnails/products/product_1728150572.jpg', 58, 171, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(62, 'Product 4 Category 11', 11, 'Detail for Product 4 in Category 11', 'Description for Product 4 in Category 11', 130000, 'thumbnails/products/product_1728150572.jpg', 6, 92, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(63, 'Product 5 Category 11', 11, 'Detail for Product 5 in Category 11', 'Description for Product 5 in Category 11', 130000, 'thumbnails/products/product_1728150572.jpg', 81, 138, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(64, 'Product 6 Category 11', 11, 'Detail for Product 6 in Category 11', 'Description for Product 6 in Category 11', 130000, 'thumbnails/products/product_1728150572.jpg', 89, 162, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(65, 'Product 7 Category 11', 11, 'Detail for Product 7 in Category 11', 'Description for Product 7 in Category 11', 130000, 'thumbnails/products/product_1728150572.jpg', 16, 50, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(66, 'Product 8 Category 11', 11, 'Detail for Product 8 in Category 11', 'Description for Product 8 in Category 11', 130000, 'thumbnails/products/product_1728150572.jpg', 88, 145, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(67, 'Product 9 Category 11', 11, 'Detail for Product 9 in Category 11', 'Description for Product 9 in Category 11', 130000, 'thumbnails/products/product_1728150572.jpg', 59, 159, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(68, 'Product 10 Category 11', 11, 'Detail for Product 10 in Category 11', 'Description for Product 10 in Category 11', 130000, 'thumbnails/products/product_1728150572.jpg', 42, 156, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(69, 'Product 1 Category 12', 12, 'Detail for Product 1 in Category 12', 'Description for Product 1 in Category 12', 130000, 'thumbnails/products/product_1728150572.jpg', 2, 175, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(70, 'Product 2 Category 12', 12, 'Detail for Product 2 in Category 12', 'Description for Product 2 in Category 12', 130000, 'thumbnails/products/product_1728150572.jpg', 13, 98, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(71, 'Product 3 Category 12', 12, 'Detail for Product 3 in Category 12', 'Description for Product 3 in Category 12', 130000, 'thumbnails/products/product_1728150572.jpg', 83, 186, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(72, 'Product 4 Category 12', 12, 'Detail for Product 4 in Category 12', 'Description for Product 4 in Category 12', 130000, 'thumbnails/products/product_1728150572.jpg', 55, 139, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(73, 'Product 5 Category 12', 12, 'Detail for Product 5 in Category 12', 'Description for Product 5 in Category 12', 130000, 'thumbnails/products/product_1728150572.jpg', 56, 130, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(74, 'Product 6 Category 12', 12, 'Detail for Product 6 in Category 12', 'Description for Product 6 in Category 12', 130000, 'thumbnails/products/product_1728150572.jpg', 56, 152, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(75, 'Product 7 Category 12', 12, 'Detail for Product 7 in Category 12', 'Description for Product 7 in Category 12', 130000, 'thumbnails/products/product_1728150572.jpg', 77, 165, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(76, 'Product 8 Category 12', 12, 'Detail for Product 8 in Category 12', 'Description for Product 8 in Category 12', 130000, 'thumbnails/products/product_1728150572.jpg', 34, 116, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(77, 'Product 9 Category 12', 12, 'Detail for Product 9 in Category 12', 'Description for Product 9 in Category 12', 130000, 'thumbnails/products/product_1728150572.jpg', 4, 105, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(78, 'Product 10 Category 12', 12, 'Detail for Product 10 in Category 12', 'Description for Product 10 in Category 12', 130000, 'thumbnails/products/product_1728150572.jpg', 40, 92, 0, '2024-10-15 19:25:43', '2024-10-15 19:25:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `product_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES
(2, 2, 2, 5, '<p>Great quality, but could use more blocks.a</p>', '2024-09-30 20:47:40', '2024-10-03 02:04:39'),
(5, 1, 1, 5, 'My kids love this toy car!', '2024-10-04 21:34:43', '2024-10-04 21:34:43'),
(6, 2, 2, 4, 'Great quality, but could use more blocks.', '2024-10-04 21:34:43', '2024-10-04 21:34:43'),
(7, 1, 3, 5, 'The story is very engaging, my kids can\'t stop reading!', '2024-10-04 21:34:43', '2024-10-04 21:34:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Administrator with full permissions', NULL, NULL),
(2, 'User', 'Regular user with limited permissions', NULL, NULL),
(3, 'Manager', 'Manager role with advanced permissions', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `thumbnail` mediumtext NOT NULL,
  `place` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) NOT NULL,
  `promotion` int(10) UNSIGNED NOT NULL,
  `number_ticket` int(11) NOT NULL DEFAULT 0,
  `sold` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tickets`
--

INSERT INTO `tickets` (`id`, `name`, `thumbnail`, `place`, `date`, `detail`, `description`, `price`, `promotion`, `number_ticket`, `sold`, `created_at`, `updated_at`) VALUES
(1, 'Water Park Fun', 'thumbnails/tickets/playground_1728150965.jpg', 'Aquatic Park, City Center', '2024-12-01', 'All-day pass to water park', 'An exciting day at the Aquatic Park with water slides, wave pools, and more.', 200000, 34, 105, 105, '2024-09-30 20:47:40', '2025-01-08 16:06:48'),
(2, 'Theme Park Adventure', 'thumbnails/tickets/thiet-ke-khu-vui-choi-tre-em-trong-nha_1728818663.jpg', 'Mountain Theme Park', '2024-11-17', 'Full-day adventure pass', 'A thrilling adventure at the mountain theme park with roller coasters, games, and family fun.', 200000, 0, 124, 126, '2024-09-30 20:47:40', '2024-10-13 07:49:00'),
(3, 'new', 'thumbnails/tickets/khu-vui-choi-tre-em-tphcm-1-1200x628_1728817297.jpg', 'new', '2024-11-25', 'aaaaa', 'aaaaa', 200000, 0, 100, 333, '2024-09-30 20:47:40', '2024-10-13 01:25:42'),
(5, 'Water Park Fun', 'thumbnails/tickets/khu-vui-choi-tre-em-tphcm-1-1200x628_1728818672.jpg', 'Aquatic Park, City Center', '2024-12-01', 'All-day pass to water park', 'An exciting day at the Aquatic Park with water slides, wave pools, and more.', 200000, 0, 33, 33, '2024-10-04 21:34:43', '2024-10-13 04:24:32'),
(6, 'Theme Park Adventure', 'thumbnails/tickets/khu-vui-choi-ngoai-troi_1728818683.jpg', 'Mountain Theme Park', '2024-11-15', 'Full-day adventure pass', 'A thrilling adventure at the mountain theme park with roller coasters, games, and family fun.', 200000, 0, 150, 150, '2024-10-04 21:34:43', '2024-10-13 04:24:43'),
(7, 'Zoo Safari Tour', 'thumbnails/tickets/khu-vui-choi-ngoai-troi_1728818693.jpg', 'National Zoo', '2024-10-25', 'Exclusive safari tour', 'Explore the wonders of wildlife with a guided safari tour at the National Zoo.', 200000, 0, 50, 50, '2024-10-04 21:34:43', '2024-10-13 04:24:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` int(11) UNSIGNED DEFAULT 2,
  `number_phone` varchar(13) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `avatar` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`, `number_phone`, `address`, `avatar`) VALUES
(3, 'New Name a', 'test1@gmail.com', NULL, '$2y$12$8Sub0oxl7e0mJPsuKF8cqu1Jp.cTiwu1ZNLCYtNgxQ7.OOKFtzB7K', NULL, '2024-10-04 20:29:10', '2024-10-13 22:53:27', 2, '0987654321', 'New Address 123', 'avatars/icon_1728201874.png'),
(10, 'New User', 'new@gmail.com', NULL, '$2y$12$b6hlnUnZE/QooeeZ7kARie5JQnnaj2q1m2cHLG4N2VIRWBw6UVv.K', NULL, '2024-10-07 07:31:16', '2025-01-08 01:12:13', 2, '0987654321', 'Viet Nam, HCM, 123', 'avatars/icon_1728885416.png'),
(13, 'Saturday', 'sat@gmail.com', NULL, '$2y$12$X4iunDLBcRMYbPEFfPdGZuDIhjdCckQSiT6FP95oYRMicvnuRQWK6', NULL, '2024-10-12 01:52:52', '2024-10-13 22:57:27', 2, NULL, NULL, 'avatars/avt_1728885447.png'),
(15, 'admin', 'admin@gmail.com', NULL, '$2y$12$28HkwKGJXOwMXw.r/DaaY.UUJyt4jCTJLevH2umOF5vQGKRJHkYQy', NULL, '2024-10-13 04:27:13', '2024-10-13 23:00:30', 1, NULL, NULL, 'avatars/avt_1728885630.png'),
(16, 'Fullname Sunday', 'sun@gmail.com', NULL, '$2y$12$FkTEIvD7uibBNCi9VibwkOczc645cxUUHZwxEs6YeWTIT0.e/cqMC', NULL, '2024-10-13 07:47:47', '2024-10-14 02:09:25', 2, '0987654321', 'kkk, kkk, kk, kk, Sunday address 3', 'avatars/avt_1728885577.png'),
(18, 'bb', 'bb@gmail.com', NULL, '$2y$12$I98jNLOTBhHNokDuInL4A.Xitz9S36guLHlsb4iAxSkIl2Th7szoe', NULL, '2024-10-13 22:59:55', '2024-10-13 22:59:55', 2, NULL, NULL, 'avatars/avt.png'),
(19, 'Satuday', 'satuday@gmail.com', NULL, '$2y$12$8KHgCXRwR1B9r7e0AJ7jfOIwjmObJ9AVsMmxtzx8I27XFjhevUBoq', NULL, '2024-10-19 01:06:55', '2024-10-19 01:08:19', 2, '0987654321', 'Viet Nam, HCM, Abc, BCD Street', 'avatars/avt_1728722970.png'),
(20, 'satuday', 'sat2@gmail.com', NULL, '$2y$12$lnWpr9gP0JHdthqNKh4CJe7tI9qM1m5oCTv.BK2U/M8sUzLML9c8O', NULL, '2024-10-19 01:09:53', '2024-10-19 02:07:16', 2, '0987456321', ', , Vn, hcn, Viet Nam, HCM, abc, bcd street', 'avatars/avt_1728722970.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_cards`
--

CREATE TABLE `user_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `card_number` longtext NOT NULL,
  `expiry_date` varchar(255) NOT NULL,
  `cvv` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_cards`
--

INSERT INTO `user_cards` (`id`, `user_id`, `card_number`, `expiry_date`, `cvv`, `created_at`, `updated_at`) VALUES
(1, 16, 'eyJpdiI6IkgySFNpVGRBK1FYNVFLZDFzeWxDc3c9PSIsInZhbHVlIjoidDd2ZVJDRzJadkpkcW9NNnBrUExlQ3gwMmp4MEd4L2NQU0RqRERBWUZVV3BuT0tTYi9XK1cxcDdCVjUwaWlwRDBuTUF4VnFxM3AyR0pNaDd0ODc4VnZKMS92TGRJWStkSmtrUTc2YXRTS3U5a1daUENEM1ZUSkt2V1lnTC9ZS1hBQVJhekRITnc5ZnFKSU1uRm5ZMm94R3cyQzlpcmwwLytzZW5RNlMvL2NmazNiQlRZd0Q5WXkzV3VYa05tK3UwYTZkbGplek9PTzJLcTZ4enJWL0xFTThLTU81T1BMdWJ2VC9kcUNTaTFlcnZ4aEM5ZlpQSHNzb1BDTERabkFySGI0TEIxOXhYRUtLbmJKdTZrQkFORDVPUXA5Q1p1OUZocHFjY0Ivc05zdXFOK3Rna1d6UVhTRVBHWE0wL043RngiLCJtYWMiOiI3OTI3N2JlNGM0NzRkYjExOGMwZmFjMzg1ZTcwMjRkMWJmZDhiMWYzYmNiODhhMDg5ODhhMTcyZmU4Yzk3M2NkIiwidGFnIjoiIn0=', 'eyJpdiI6ImlwaUZuWnpRZm9OcnBkUTFBU3pkdkE9PSIsInZhbHVlIjoiMVhZdVhYQ21CK2IrUEYvMTQ3MHBKdz09IiwibWFjIjoiNDVlMGVjMThiYzdlMDNhZGQwNzg5ZTZjYzRlMTcwOWE1N2QxOWUxNTJiNTY3YTRjYzJhYjM3YzQxYjIyN2Q3NiIsInRhZyI6IiJ9', 'eyJpdiI6IjdUcmJJMUs3Rjd1aUJhdytYWm1FaEE9PSIsInZhbHVlIjoiK20xeHhZaWYvWlBlMmEyNzlyQlp0MlNnQXRiQ1J3bE1yZS8zekNsdHFuYXFFTE9uUEgyTzY2Qm1hVlovbEhBYUNUYVNtY0hqNjVDYmxRb1YrWDZXQUFjLzA1Mzdrb2czdFY3angvYzBKelJWeWpyZk5lYTVlSFVLTWUwZGNXTzIrd2wvdWlBTTJMaFlsZ2p4eDl1dWl3S3FnVFZvTjZkdlhGcEM4Y0tVR0VNdDkwcEFYd0VsVFJtNExRVUllNUxRLzZqZkNBM2JYRnlQR0VqVU9XMHEzVXI0Wkhkb2RsSndWaitsQ2JOd2twc1pxNDJPNHRwdkoxVDlFRHRQOVlQTHRaMitudUFyZ09FSXRXcEFBT2IveDFqZE1UdG91c0RqdTQ3QU1PblpjQzA9IiwibWFjIjoiNTNkNjRhNmE4YTZmNzE4N2E5OGJkZTI1ZTc0ZjE4ZmJhNjEyZjlhOTNmZWM0NGMyNTJkOWIwNDQwZTVmZjllMSIsInRhZyI6IiJ9', '2024-10-15 18:55:32', '2024-10-15 19:15:14'),
(2, 16, 'eyJpdiI6IjZoLy9qUlNOZ2tNbnZ4Mng4Ylo4NXc9PSIsInZhbHVlIjoiQjJmalV0eUdQRCtvSXpWUUJEa210aFpvVEg2S2pXYkZ5S0E5YXRTd2lWVXl1TkZmbDFHc1p5ejFUUkkveUxJNnhQNUpJek9yK1A1MXh0cUhxWUl0bGllWkVtV3hJUklKK0s4TW9hd0dockFVUjJ1VU9Lb1F6VDlWYUlhVUh1MG03UmZFRFhmcW1ZRzhDdmt3azJFVjVwZ1llbUNId3U2TGxJVVYyZU1mWUdSTEk2SDJJd1p0RmV4QW8xZWhvMS9qZ2JMMWhZNEhYMXRnZ1lvWlQ4Ni94V0tvNGsveTNLSzg2TVZQUmlILzlPRzR4bWpIMTUzc2t3Y3RzeVJxVm5TRkpEQ2VwUXgvODRQZVhPR1h4QlNMQ0FScVJHREpteTcvNVlsQzNlNERqNFo3K3VXVTJETEVvQUlpMVhhYUJRL1ciLCJtYWMiOiJhZTUwYTlkY2UyYTM0NWQxODBmODczMjIyZmY4YzAzMDE1YTMyZDZlZGVkZjkzMzEwM2MxMDk5NjE4NzJlYzI0IiwidGFnIjoiIn0=', 'eyJpdiI6IkF2WUNrZFJPZXBQUzNyNFZOQUduRWc9PSIsInZhbHVlIjoiN0dhYUVzMm1HbGw2YitUVFFrNzlKQT09IiwibWFjIjoiZjgyODZhNGFhOTU5YzY0ZGQyMTJlNzVkZTI2OTA1NTc3NWFiMjU5YWJhMjMzZDk1ODRkNjZmOTFjNjEwNmQ0MiIsInRhZyI6IiJ9', 'eyJpdiI6IkJHbkE2VDZsMXNueEh3OU5IallXekE9PSIsInZhbHVlIjoicjdUL25sL3FqZHFBMzMvUk9EMTNSbnYvc0ZDYVdacHN6bU5ia2ltS2NCYm93amtXMW9FT3ZXaGxscXk4cUIyZ05zU1NsZjdDS1VmNko2QmVvVWQ5eTFLUVhlbHd0UmZKeUxXVWJYczRzNVZQYXVrd0llaVhDQ292ZjdVTkxnS3MzTmRIY2lNVDhObExrVDgvNzhwdGoyaE1BM0liMU1nMGxXMmMxRHRYK1BkQUcyVWVIdWoza0NFd1lPRkZ1cnFJTUhKeDdHRHhvenk1UndKb3ROQWk0eWxocHlKT2JIRzZCek1FQURvamtra1lMVE52TGNnbXRsbi9ST2FubVdMZUFFMmFkd3NHVTA4YUc5N1dzU2VCNG1XZjRUMEFoWGcwS3FRTXRPWjhHMVk9IiwibWFjIjoiZjlkZTExNmRkODhjZTYwN2ZjN2NhNzEzYjIxODlhNzQ3YzFhN2FiNWI2MzdkNTliNjQxYmYwMjY2Y2I2YjdiMCIsInRhZyI6IiJ9', '2024-10-15 18:55:41', '2024-10-15 18:55:41'),
(3, 16, 'eyJpdiI6IjczZFpCSWFnM1VpZytRMmYycVB1MXc9PSIsInZhbHVlIjoidjRSUTFRM25kSmFwMHlxMmp5MFBUN1R6eDVjc1Q5aVYwbGxVRVY2R1VuRWczOHZoL0g4RXNuVi9OT2d6MEtOVTJLQWdvTlZkdGJNMXU2M3ZXU3IraVEyRG9pNXM3OEFDQk5qenIrZVBUZmR2Vm5nSUZ5RXhjZEJNOVJKUUZOWXpraGtZc3FxbFlCUjN0eTlCWG5tQ1Zjakk0YzV4RVBEY25PUzZvTncrTk53ZjBjaWtCODRndS9ZNTI5NXNKclNZcFE1NmxBYzBKcjl5VFllWjh0NVZsbzNzdnBSWVRod283NXAzN3NVUWtlcFFsc2JaekpEZ3ZFY09nRnl4VHVqM1UxL0JKcEhrOGxwa0FFWXYrVHBHVVYycDJMTHNQaGEydFJqaThpUjNubFhkMHlJK1RvSXljUlh2UGFCSlhQUjEiLCJtYWMiOiI3NTZmMzMyZThmYTI3NjIzZWU4ZTYyYjc1NWIyZGVmZGJhMzAyYmJlYTdhZDc5NDEzY2JhMzJhNmE2NTQwZTBhIiwidGFnIjoiIn0=', 'eyJpdiI6IkdaaDNjV01wK3VVajlZdFdKT3phM2c9PSIsInZhbHVlIjoiME5Id1VrQ2VUOEEzUUptUm0xeG1xQT09IiwibWFjIjoiM2VjOGFkYjljMTc0YjFkYmNhMTlkNzgxOTgxOGJjMDY0YmQ1ODcxNWRjN2JmYWU1ODMzNWRmODNhNGUxNTM3MiIsInRhZyI6IiJ9', 'eyJpdiI6IlEzRmd4TThXUlRhWTRNWmpYZlNuWmc9PSIsInZhbHVlIjoiendOOWhLSk92Mm91cXI4VTJzMEJTMnJkVWtFaGN0b2VkUzBzQXIwRkJEUzN0bUhSTTh0RXlyZ3czYUtGaytOVUduaWhiRWJMQ0VLZ3BZMHRGajNvZVVoMWRudk8rdkl5YVVBcGZkRklEcTVRbzRscEdLaVBOTXRxeXhQTXUrQWNrKzNralllMkcrOTJ4d0tvTkVEOStFcVA0L2ZxejJLMjNUSnpSVDMzT3h0bUZNKzNJSmdNbGwySlJ0VTNjZlFwbFlSK0c4aHVGYUZzUUpZMWNycXBLYXhDYnBpVkNGdmNIa1B5RmxzSUpFZlo4SmdHYXpzb2l4NnlYZzVzK04yWGdiSnNaU244TWdWWTBvUzY2M0lubnBPT2FZbDN4NkFGYTExdEVmR1ZKZlk9IiwibWFjIjoiN2U0YjIwY2M4NThjOWIxMjhkNDAyNTdmMDA4ZWEwNDRiNjU3NTZlNzE4MDRiYzcwN2QwNzVkMzAxYTBmMDQ0OSIsInRhZyI6IiJ9', '2024-10-15 18:55:45', '2024-10-15 18:55:45'),
(4, 16, 'eyJpdiI6IlhCTmY0dFNha1gvR1pxK3lCUnhRa2c9PSIsInZhbHVlIjoiY1FqVFJINUw3S2luWlNQZGd3UU4yMTJQRjJsZjczTUJFeTFPYmVZSVNmNVB2VHFDc2dGNjVWelRQaFNWamI2Z0RzcTByL0xHdDNMSXJXeGRKbUlrRlZvbEpKL0FQOVFLcEZRZWUyb2QrczVaSytyK0Z6LzhqcGNTRWRnOUJMbzFuR2p2UVMySkw3WERYYUhjc2pZWDB4RmM2QlNwSGF2VkRXaytFMXV1ajBNY1NyZUdocG4wdTU1OUV4NlA1TEFQS2E1RVlnYlgyaFhtT2wzTEhvRGMvK0ZjRUdOd3EwNWN0UW5oMDhWWFRaK2RFTm9nTVh1M3duemw0SGdUbzBtUGRkN0JPdzN2WGowRnJwazBWYmtXZk9XT01qVEhWWnBHc3IxWHhJVFppcTdOM2dvTHdrdTVHa3prUFVUWkd0YU0iLCJtYWMiOiJmMzEzMTNjZTVjYWI2ODRkYjEwODRjNjg3Y2QzYWQ5NzEwMDM3MjYwNTFlOTAyMTRhOWM3NTQxYTY0NDRmNTc2IiwidGFnIjoiIn0=', 'eyJpdiI6IjI5OWw4NHpmQUFmWHZ4NldadjdvdVE9PSIsInZhbHVlIjoiRThTc2o1VXpNV3NQTWFrV2VCUWpYdz09IiwibWFjIjoiNWM1OTM1OTQxZGI5MWUwY2E1Yzk4YjE3MTUyY2VlM2M2YTUyY2FjYTI2MWNkYzZmYzM1NDgyZWFkMzUwN2IwMiIsInRhZyI6IiJ9', 'eyJpdiI6IkR6S1RKTkl2OTFISnFZdlc4R1dMTXc9PSIsInZhbHVlIjoiNmZjTVR5ZGNBUWZkQjVRakVRekZCYSswS0k3MWNOdll0QW9Kc2pscERSdUcwQmtYVVRaL2xUZkdzU01EVnVqVGRuQzI4UHNRL1ppNGtXQmVIMEpwdE01Tys5ZHdnbktoeW1vUWNlTVRqUzhzQXZmRHp0Z3dyRWM5MDRHRlg2SnBidUlsazVmSFYydVdXUlR2OVRmWGlEcDQ4VGdJZk5mZGpzeU9JNVhtMGJHVG1kTE9ZVnVtUEJuWUtVR093U1g2R3lERVplbE5aY1ZlNzF4SFJSYitZMVhwUVNnaGE4dnJvWThPTnRaRGMyK3NKK3VFclpkcmxqbUpXZ2g5Y1g1cjVaU1NQdW9qOWxKNHF6Q0k3d2llcGxXeU1oc2JSeEFvVmlNT0hLbUY5cEk9IiwibWFjIjoiM2MxZDE4ZTc1ZTliYjhmZWIwOGQ4OWZjYzQ3NzRiZWE4NGJlZGNiMzRkZmQ5ZWJlMDdlNDczN2M1ZTYyZDIwYiIsInRhZyI6IiJ9', '2024-10-15 18:55:50', '2024-10-15 18:55:50'),
(5, 16, 'eyJpdiI6InZFU1pWRzQ0M2ZWY0dBTzlhR0VPZUE9PSIsInZhbHVlIjoiV3Fidk4vYXJUampzdGZHSnArdWNSRFhwbFEvMlJRbnpXcXFNdElkS0NFYk5oUzdIditwSlRUa3o0Qk0wMHNqanhoRFJmbzdNNGMza0QwV3RsYktVNEhUZHk2SmxHc0VSZHpxY0lnM3RnRmN1cHo5RnFKaEU3dkJMUldNbDNuVlAxMDU5emxOSHZtZGxrM25qdnZpTzNhZ0p5d2xJUDZPYnhVTnVyVnNFQXFwVFE3YXk4YUtOYTB1bVo5MmkrT0w4aFVPcnZKK3RxSXlsVU96SUlqU1dlenZ2MDZxUXU2bmdJakhYS093WkZRR0dGaWM5VGdHRHozbW1qRFovSXFJQW1zekkzejBqb0tLaElPMnpTR0doblpWMHpRdjdVeFYxd3FjcTNBWElYUWp4UHFFMlR2aFlqd3AwQWkvRVN4RFAiLCJtYWMiOiI0M2I0ZWUxZTYxNWNlNGJjMzE3M2RiMWI1YzRlNDcwZTQ1ZDRlMmJmYWUzZWQzMTcyZDRmZjczYjRmNTNhNTc3IiwidGFnIjoiIn0=', 'eyJpdiI6IjVISU5mYTZtNGtlU3d0ZlpCOTg0Tnc9PSIsInZhbHVlIjoiWEtaQXVHNDU5ODFDWXdWZkRCcmRndz09IiwibWFjIjoiMDlmN2JjODIwNTI4M2JkYmIyZTJmODBmZDBjYTgxN2I5NTc1ZWM4ZWMwZWJmZmU5MmU3ZjUyYjQ1Y2Q2NTA1MyIsInRhZyI6IiJ9', 'eyJpdiI6IkcwQkszakkraTJDbEUzZGZkRDZxMUE9PSIsInZhbHVlIjoidnZZK2txaEc0bitZazJhUzAyTmhTOUdwd3lEY1kvdVE5T0JjUms0eWRYZnVoemVoRG51TGY0R3phbDNLeC9mclNHVzdSMnpFc0lhV0tJT2RhM01CbmNwUS8rNEVrZnhwSENSM2ZtNnlOMlBmYWc0ZXJDQlRUZ1Q4L2VNck1OQjJwSWFPbDlscXFzQzR6VDdqOFNFV2svYTZvMXZzaXFTM2xnb1hVem40NzYzY2YrL0ZwdlBrMjB1c0hBcnB3S2ZjTlFiMlZLT0FZaFdrUnJJNUhlNVE0cHYwR3lhaEd3eFhWVkt4WjBKVkhnU3ZBUG1LeVRKcDc1eDVySVpHaXZrbENXWjBtc0gwYVpMNGgwa0YwbzI0Z2xhczVjM2hPTzFRMndOdkxvNXREd2s9IiwibWFjIjoiMzU2YmI1ODAwZmMyYzgwZDI4ZmMxMzU2NmUyNWUxMWRiOTgyZTI0YTdjNTk1YzcwMzcwNmQyOWIwNjA1YTFmMCIsInRhZyI6IiJ9', '2024-10-18 18:39:38', '2024-10-18 18:39:38'),
(6, 16, 'eyJpdiI6ImhGSUF6K2M3c1J2ZmhkUjBoU1FuSXc9PSIsInZhbHVlIjoiVlU1dEk0cWtEdHNnOW1OMkMvS2tVY1RsR0dPYko0M2tuUnUzMjA5NUFidjVCd2R1NVViWHJtZjEzYUFZT2gvMndIZ2RvY2VmaGczaUluQjBVMURvbzVaUWRnSi9tVnB1YkFOMlpKMG43eHVlNWlUWFVwVG5uRDdTcyt3UTdKR1dXVXZwQ3dmUE05MXBFQS91U3pJU1hoWG84QUFkOURVU2hVbUkraWxFTHM3bEpMbFNKK0V1L25aSHRQdmFYQkc3VjNNMGR5TEN3OGhDZ0JwZHdOVy9ad2Z1MWhSRmZBRkU0UG1YY2M4R1ovYThHLy9qZmJ4SUx5alBzTTJnbEZlK2xrbVRwUjNwZG9ZVGxrZ3U1SDRQem5TZjNTV3VjcmdqVktaR0tYejBxbEZIZEUyRzYySjA3ZkpIdFZXRXI2NEQiLCJtYWMiOiJkMDNiZDU4MmZlMzQxMjk3NmZmZmFlZWZmZDgyM2I0MWEwOWI4NmNiYmY2OGZiN2EyZTI4YTMzNjI0NThmZjc1IiwidGFnIjoiIn0=', 'eyJpdiI6ImpDN3J6bmNkeWpRTncrQjdEQ1ByQ0E9PSIsInZhbHVlIjoiVXVhVjBldjZHald2UFk0cmJuUzR0Zz09IiwibWFjIjoiMzQ3YmUzY2JiMmYwNzhhNzIyOWYzNjM5YTk4MzJlN2IzNTQ3MGRiYTgzN2QxNjhkMDI3OWVlODZjZWY3YmIxMiIsInRhZyI6IiJ9', 'eyJpdiI6Im4rTGVnVmNiR2J1ZzJxU29WNW82QkE9PSIsInZhbHVlIjoicEc5QjNJWFpOWEhLdjVneXQ4SGhveUl1T3prcXN1enlhVXVtM2JaUHZrS2lvZkFRbkpxUGFObVppMTVVWi9YQVRFWll3NnJHTVM3dEJnYmVqR3hSbUJ3Q0pBY0xBMXZRd2Jidm90MkZ1SWJUYkRWS3Nlb2c3bUtlT1FJZlgzajlwbU90aTdiRnFpa2t1S1dJaFJ5ZGluM0NpN2txanFaNXZPNUgvakp1NmZSeWx5ZVdIN0NNR1J1eEdHZE52RVFpNGNUMzByWXBWYlRhVGdyMkJPVlh5YmJIYzhtZWdtcm9jb21HS3dmYXRFTkhLMGptZ1BMSXFsMENTN1hwYXgvYmZtSXhIZEFoYlkzcC9wVXhhMkp5cXNWaXYwdWhNUHJpM0dEdS9PWS8ydms9IiwibWFjIjoiYzliMGI5ZDA3OTNiYTBlM2JjMzEyZGZjY2I5ZTk3ZGI0NjIzYmZmZDUzMWM4NjgwMjgzMzBkOWYwMDZiY2MxZSIsInRhZyI6IiJ9', '2024-10-18 19:08:32', '2024-10-18 19:08:32'),
(7, 16, 'eyJpdiI6ImRKY3JJZHZ3OHhadk9qTlpRNzR2UVE9PSIsInZhbHVlIjoiTWFPQjhadVBqeTFGR3ZHZXVMWG56MnhUaDRRN0YvTnBMREhtWUIzcWJ4T0dsdXdnZm40dEFWcXhxUWtrZ1JCa0dwcEU2OVFQbmhZcmpIYkNYa04xWUtPdUF0U3ZtS1crd0d4TXg5ck0vanJDTDJwNEpoR3ZqcG96MVVqVmZpZ1lrQllvUjlYbjcyZjBpMVhJWnVFUGU2OENSTUFZSnVaYUtvWlpFajZXY2ZNVW1zaXhRYWo5QnJnRVhXcUZGOE5JK0tOcmEySjJBZndsRlMwZGdLNFJtK2E3R1Rib1dBeUhlczNpcjVJTmtIZHZPUTd1RjljeXFNZ1RSRmlWNjlYcVgzbFlrcUxwd1RnUzF0Ymh6MHorTVR2Mi9ncHFtakdWNkxCaGxXM1g5UksyOUVhd3d2NXh4MWhBUUQ5TTc1aDkiLCJtYWMiOiIyNmQ3NDQxZTc0YWI2MDUwODE4YzhjMGY4NjkyODJjNzljYmEzMWE0Y2FkOWJiOTg0MTcwMWJlYzk1ZmEyN2Q5IiwidGFnIjoiIn0=', 'eyJpdiI6Ik0wYVNNRXlUc3MxTTcyT0xTOTRNNVE9PSIsInZhbHVlIjoiWGcwd0YxNGl2Nks1S1E4a3FIVHE0QT09IiwibWFjIjoiODRlM2Y1NzgxNjBiNDdhOTI0MzU0NzYwYmI0YTUxNDM5NzI3ZTQ1ODFjOGMwNWJlMDM2ZjVhYzNmNzA5OTZmNCIsInRhZyI6IiJ9', 'eyJpdiI6Ik5VdXE4UHFTWjlEbEl3akhFMWYxbVE9PSIsInZhbHVlIjoiTVNDWndCd3NDOFRIY3h1cFdkZFIvYUkyS05kZnlVeGRsQVE1aUlUZVduVkhXY0EwOGU2ekkwWGNvMnF1dzdRZm9kYng4cXpNdDVvNVgxb2pxUnZxOEU1eUNvQ0FZNXF4SGYwQUM5UXVvaTF4dUlFSDc4VjQzb1VNTEE2cHRYZlUrQ1QxZTZ6QXpBMVcxYTAvNEljOWFXL3YrWjlpN0NheElVdlM1SGVFZ0gyRGdiOG1xRVZzQy9pVGRuSlJXS0pTWVA4cVFaZFhOZDZjeWFnUmxYeHFzTTJtM2hXUjk3RG52TVJiTk8yNVE2QVBSVENXdWVtN3Rhc3NyeitoWFIyQUNocjAwR1VaNVBUY25IOUJTK0ZORFdlV0hZbHlKQ0pjcFBXZXFCcFFuQ1U9IiwibWFjIjoiMWUwMTQ3OGUyYTEwNjQ0MGRjZGZkNWFiODE2YzQwNmZlMmI1MDA0MDNmYmQyYjM2ZDgzY2Y5NWNhMDNmYmZmYSIsInRhZyI6IiJ9', '2024-10-18 19:08:40', '2024-10-18 19:08:40'),
(8, 16, 'eyJpdiI6IjRaUjEwWXNIcFV0RmhiTnVoa1NLaEE9PSIsInZhbHVlIjoiWWppQ0dwK3pCSldRK2U2QjUzSUVReXlQYkUvcXlzZXNIVmdtZCtIZUdCK0IzeEJYL1F1SnZZeHJUNnRpZm1LR0NqazE0T1g3aUVKbm1PSHJXSVJMOGd4UWxGTEkzNTNCNW9uVU9KWGNDMGpnWUdxL2xYVWgxRUV5WWJSTUZ3TGV4bUFmczBHUlVnS1UxbGpmVkZLMDV4MURNRUI1Ty96OUw5WnJIOFo0ZEQ1N3Rpb0VFcG9xc2FuOUZNcWZZanVLS09rWGp3WXRZWTFhZ3k1OHBEc3NDTzhRYjRNQldEaG9obmE4REJpZUlleGoyZkNwU29BRGs1VXNHaGpzWGJwSHpQTmxJa0JDK1JUbUdzR01xZ2Z4WExFWFRKSUd4SWpnUEwyNndxWGl1QVRCY0JkZ0V3Vy9DYjYwQzRIRGJGakgiLCJtYWMiOiJiNDYxNGM5ZjIwMWJkYzBlYThlNGU1NjhlMTRhMDhhMzM1YTFiMTU2OTUwNGY4OWYxYzkxNDgxNTA3MTBkNTk4IiwidGFnIjoiIn0=', 'eyJpdiI6IjhON21uSmdtbDdUbFBtUklqRkdMM0E9PSIsInZhbHVlIjoidUtUTWpjdzBwc2dLZFVxeFVZUVhwQT09IiwibWFjIjoiNGFmY2RjYTI1NDlhNWVkNmJlOWJiNDU4MGRlYTgyOGVlZmNlMGMwMmQ2NmVjMjg4NjBiMjY5NzliZmE1OGNhNCIsInRhZyI6IiJ9', 'eyJpdiI6ImJVNU5qcjhqN1MzSWlld2pMcml6SkE9PSIsInZhbHVlIjoiWDBBd2FWS2JmcXdXUFY2TVdoVVljNy9SODlHSXdNRmtScDBIWFpjMFlEWEpLM3hRaE5IOWRDUFloVXhPeW1HQ0pwVkFJamFDVk9odE5jT3E3TjNseU8veEVoS2JTL3FYVFFUUUs5MFdnLytXUHcyS1Y4ejRONXRqRWUvMHBuWCtNVGt6eGJFR1ArNmtoQVdZMUZoanpLT0g2VDVUTjg5ajdkRHlMMklCRHRHUGQ0ZTdHT3NYdVNsNFBrK1RieFVuREdGaEZaWVE3ejlSci85YjJZRElqT09YL2dQVVFNbVNGejhDTFVyOHArV21rTTlBZnJCWEp5cTF1cC9QZjNHWDZhcTlYQ3dDSi9ySkZZZ3FsRTU4cEE1YTQxL05GQ1RGNkhiaTZsZFJWbEE9IiwibWFjIjoiNzQ1NzY0ZTZkMWI2MDg5Zjc5ZTliNjVjM2U4MjdkM2UyOTNlOGMzMGQ5ZDdjMzEzYjZlMjEzMmZhMGYxYzEzNSIsInRhZyI6IiJ9', '2024-10-18 19:09:20', '2024-10-18 19:09:20'),
(9, 16, 'eyJpdiI6IlZiU2t5OE11NXpCQjVjZ0VSRlVWc3c9PSIsInZhbHVlIjoiZmY5MFplUmVzZ1VqRFlIbkUxVUMwREIwRW9oTkFqMFBhMnlLWU0wd1djTFVjamNhd2dRREExQ2VHWmx5MkYzSU1RWTBZUWFYaXlTMTJZVllRRjFNdXNBdTBzd3kyTGsxQ3h1LzY0SHhVaG01NVR1Y3hSTVJzT1h5L3MwdTI3ODZvMzZtRDdYelltMjZTcjZ5Y1V5eW1MYnB4OVdzbFNiRFk5dGVqZkIvc3FBTHNiQnhlL3ZRZ3d1ZXByWWx5UzRCZTNBVzl5SzMzUldrWk1weDl6YnVkMlp6MjJkNy9lc2xHWm0wdXpzUHpkcm1vbVhnWTVVQWdGUnZkbWpQTzdaSEljMmpiTmdFVkF1M3dFVCsxRy9heWgzdmZYaUdNMjRQNDZCY0tnUEl3UjBDQjZadnFSQ25EMlN6a2NqMzhzQmIiLCJtYWMiOiJjY2JkOWJlZTEzNmFjODk5OTBjMDE5ODMzZjlkNTdkZTIzMjFkYWU2MTg5MGRhMjI0ZWMyZjM3OTRhNmYxNTk4IiwidGFnIjoiIn0=', 'eyJpdiI6IitWZ3RQSU5qOGx0cHFKZldJODRoTnc9PSIsInZhbHVlIjoiUmJxSHBKamVWdFAxYnRhRE9RUmZsQT09IiwibWFjIjoiNzRkNWNjZjU3NDVkNTQ3NmFjOTkxNmZjZjNiY2UxMDcwYzI4ODJkYWMxYTdjNGY0MDI1NGQ5N2Q3ZDdiY2I5OSIsInRhZyI6IiJ9', 'eyJpdiI6Ims3ZTJLQUlvWG9wdUkzTTVSaStMTnc9PSIsInZhbHVlIjoiQzBGTFErWkdVWDZhYnlHVS9acXBKb3hTOExQemZkRVJPQTB3ZlZheCt6NjEvNC9lbDk2UWplREJaWjgxL2wvL1kwQTkxOUdtMnNmcThyWXlVMjUvMXRhNXdNTksyZ3VxRkhaczMwM3pCMXBVN2NFRU1LZ2JMOG9kT1pLS1BMOElWbnU0dEd6TG1jb2NUNGVvVTJjUWFFVFk3K3FZc3dqS2k4dk44VFQ1YXk5ZHpwMFlmbnJDWExtSU1BWVFZakhNc0MrS0szbTR2Uk5tMWVKOTNob1dhTG5DbkhLcm1GZjNHOTJMUUh6V0preERpczRTaFYwWUQvRDNJc0RobDRMbjk3Wngvd2xibmt6S0RzZUVVNlZabGtMV3BvcTRRMXlFcFE2NkFYNzJMR1U9IiwibWFjIjoiMmJhZjU2YzMzMmZmMTdkZjFkY2U4MzUxMDVmNWMzMTRlNWRkMWRjNWM4ODJkMWFmMTU0NTc2MWU2NTRkYTgwZiIsInRhZyI6IiJ9', '2024-10-18 19:14:30', '2024-10-18 19:14:30'),
(10, 19, 'eyJpdiI6IklybE05MSsxU2N6K3RuSDUrTFNJd1E9PSIsInZhbHVlIjoiaEhpdkNaOTVxanBwOTlLMTZwS2s2d0xKb2tMTG1Oc2RScGFnRzhsclNGNHUrdGZaN1VUaC8yZ1Z1bENZRFR5Q0NQK0JiVXlMZmxZY2h5SFJVUi9zSFkrQmc1UmRYNzluZk5rckprSzNtNGpqSEQ4aUhSRk5ZQTN0V2hVcXRoK29FcU9LQUYweHhMc0JrTUt5c2d0T1V5K1RLUElZemhRUjlNV05URlBhZmlGYlZFVWE2Y0hZN01PbjhSSVdUNlF4MHBVRkx4MEMyVW5wWDZwOVZ3VlJGN2FkM21mQ1BHMitYZWhGa3g0NGRyWEwwZ0JkWEl1Ynh5RHYyNElIOXl1Z1R6d1o0VFhkbGE4Mm44OFYxR3BwOHFpVWVGaXJPMmRnT3I5K21YeGVjTjE3Y1BuRC8zRjdSRWpsQWdBc3dUTkMiLCJtYWMiOiI4ZDI4ZWVmM2Y3MmZkNjExZGU5MWZkYjNiNDkwYjY3ZjdmZDc4NTJlZDBlNzllMTk0MDIzMzMxYzY2MzVmZDA4IiwidGFnIjoiIn0=', 'eyJpdiI6IkVUNVBWcUNaOG1ZVXdISzRybFBjYkE9PSIsInZhbHVlIjoiMGwrK0d2UGdLTjZ3aEt6NGFmUm5jQT09IiwibWFjIjoiYzQwMGUzZTUwZTI4NTVmNDhjMjEyMTIzYzE4YmE1YTliNDliMmZmMjBmOGRkZWEzYzU5NDBmMjFmNjZlNTAyZCIsInRhZyI6IiJ9', 'eyJpdiI6IlZmbnZXa1hIL0oydElRTWVzNEgvb1E9PSIsInZhbHVlIjoieW5zZ1BOcDdnSksrV1YvZVJydXFGeTlSWldnMlZvUTkzMDU1TDc0WWxVNk1HK25oNTFITnVFbkNGSVVEQUIrMlpTWE1rZG9hRDB4REFqdjhGRS9xYmRGaDdPemUvM1g5blY3dkhIMWJKbzlLUE5OTHJhb1RkTm1oVTI2VWd1NFlhMjdPMGVKT3dVTFVyMGE1aExUdTkwRExFMWtmYk5sVExKZmZsa2IxOHFFRTFUZzVSUTJaZDRKYkxCb1h5UXA5VWdtbE1FWlFrbWJvMlc0MUF4UkF5OVZnYWJ6d1E5ZDlKOU5iM3V3MXhZRUNhN2g4UkJlblI1eEpNVUZYUnp3d1JGMXlkdmZObDA1YXpGZVhtTUVYT1hQa25wdEp5ZVg1d3NFRWlwczlHWTQ9IiwibWFjIjoiN2ZlNmNiNmUxNGZkZDRmOWFjZjVhOTY1ZmJiZDAwZGVhOWQ5MjkzYmNkMjAzYzRiYzVmMDkzNTk4ZmM0YjRlNiIsInRhZyI6IiJ9', '2024-10-19 01:07:44', '2024-10-19 01:07:44'),
(12, 20, 'eyJpdiI6Ijd3TmNFNlBhMTdiVEk4RkhOcHpmK2c9PSIsInZhbHVlIjoib2FucnlMbWIxK2ZiQStodk9selJoNnpXTE1HUWhQNGlEKy92ejNQYmxnZ2pBd3N6bWVOaWNqdGdLbWJqV2JnYTEyNVVOVUsxSHdiTmhvbTZ5MWVzYmo5ZHpKYlcvZjNRMWN0UEJDK0wxaVB2VkxWTkxISGVGOVRsZmR6ckU5cUJIYklBTVpGQWlzbVpES0VBejVHbVFMNDJGdVNjcGpMSStNQng3UEx3RXl6ZjNmU1Y4WVNXU3JodWk2QjlWeHdsbE9vV2tEY0hDV1BwOEdEdzU0bVZUdHJTR05nbDAreVlMc3J2eHdUcHFTR2czMXl5KzRicmpiVHlTR1gyalpPWHRIdWN1cVk4Q0ZVUjJsNm93NVI1STBITVBLV2QwRWM4U29vcjRLcHhuU0M2alBrYklKZEtCZ3ZRV2hhR1dlbDMiLCJtYWMiOiJhY2JhNzkyZmMzMWNkN2I4YmFiZWI4MWE4YmY5MGQ2ZGEzNzljOTdkZGFjY2RkZWUzMTdlN2U2MWUyZDJiZTFiIiwidGFnIjoiIn0=', 'eyJpdiI6IkEvaUdrQVF4RFFzblc2cmFRaTV6Y2c9PSIsInZhbHVlIjoiT1VxeHQ1OFZQT2F1SER1UDM2WkZtQT09IiwibWFjIjoiYjQ0OWMzNTk1M2JlMjg4ODk1MzkxYmY5OWJhY2M4OGRkNGVlMmRlZWQ2YzgxZjViOWU3MzU5YjVhZmM4MWMyMSIsInRhZyI6IiJ9', 'eyJpdiI6IkZ4RWN2K1p3cHlDakh0WFRtWmpGNVE9PSIsInZhbHVlIjoicWthcFNScXNleThaZml3UTdJL0VleUxEV00rbGZVWC95eTJ6SkRnVzk4cnlMRGpoVmRjOGdzWGE4eHpJcnprZWZlNFJlZDU5MnBGdVhwS3ExMXduU05aMm5Ba0JtNENMRkhrMkQ4V1ZLbklsd0c4OTZBY1BjOU13cnRXM2pDUWwxa3dCOWFNTlpFS09pNTUzUFpxUncxclFTcnF0OGtIelM5OGF4bU1BL1RieElxSlZnZDdlTC9PR2lYTkpqNnRzTUZYeW9kK1VnL1ZjUVBJRktNVzhBM0daQ2ViTGxPUGlkZHdhdGdBQmQvcFNsNVZzUlBEN0xZYi9lRHphM0g5dnczeGxsdFBPdk1XRUVYUWtTL1RuMk1GcEZSR05oMFhZWGNrcWViMmFTWFE9IiwibWFjIjoiOGZjYTFhOTExY2ZhMDQxZmYzMTNiN2E1NTQyYTFlN2FlMzFmYzNjMWUzNjViM2I1YjUxZWQ0OWZjN2RiYWEzZCIsInRhZyI6IiJ9', '2024-11-15 21:32:16', '2024-11-15 21:32:16'),
(13, 20, 'eyJpdiI6IkVFQ3FZTmhsMzVoWFJKMGFhN0dpUnc9PSIsInZhbHVlIjoiY3gwYmZ4eXdEaEU4QytRUkFEckJhVjJtVWVaUGovUXZlOWZxZk1PdzFycUpiRHh3dzQ5b0F6eWwydWsvUXhJZ3Fzc0phNmYxbnU0MUp2cUxXU3duaVFDUVk2em1qZ1BkeTE3QXJmNXNqeDI5M0ppNWFaNTJyNHRta0hGbm91TVBiNmUvQU9xQUdEOEdETzUzRXRlVHIvbE5aaVdoOEtPeTZEMzhnOGhzZXQ1ZFhMQ0phL2Y2UWFoVjNnNWFWclVFRUJhakxSNnFSZnZNbUFIRm9rakl0ZkNXWWkwdVoxY0hOdnRvdmg3TUhtVnJWVCtuWW04VmJnRDZtQUJMaVhzclRHNmp1OTB4blVReTVJdU5qWXZsZ1BYYUFFZU9rSFFCR3IwSVIrc2t1MkJBYXpxQmx1R0RqWStDZ3pYem5zNnkiLCJtYWMiOiI0NGZkMTZlNjhlNGQxMDYyNjNjNzQ0NjA5ZTNjZDE4NmJmNWI2MGIwZThjZTk3Yzg5ZTY1YTQyYjg5YzA2NTQzIiwidGFnIjoiIn0=', 'eyJpdiI6IlBCYlBCaHJoNDBIWEVxdjR6eGlXU1E9PSIsInZhbHVlIjoibFFMR29hNXR5OVV2ODgxR1JaRE5SUT09IiwibWFjIjoiNDViZTc5OTY5MWVmNzgwOTE0M2I2NmZkYmEyNGFmY2JmMjBhNWI0NTM4MGE0OTg1YTQxZGRmMDQ1OGQwZDY5NyIsInRhZyI6IiJ9', 'eyJpdiI6InE2b09vQWk4M3BwVGtsWHJZTTVDcEE9PSIsInZhbHVlIjoiQllyUngwaE5RWExHSFBUWnluMnFEKzJXVElMMFhpeStIU3RiZC9aRnljM2NnSTRrdmFYNnNENmNsZ0tTdVJ2Z2lxSlpscGZFNEg3dHorZlBkRVhFYllRdmhnalE4NmZzZXZDVGZER2Y3RHB4SXMxbllwUDRpZFQvRy8wNlI5a1dxaDZLeVdmcDQ0cmR3YlZqczhRZUZwNXFXRlhKUkFsdzJlUTM5Y09QdjZjZFYyTUlWSDVMeHV1VEZ1TnpHZ3hzZUNTallBc1RaM1hiNFd3WEhtZGtOTWNoZ01zYkpzOE1BTi9QOVFGMjlOdXE5a0kxNGtKSWw0cGhyWmhnSDVGdTlnc1JaTVd2UHo4dng3Sms2dnd0WFZWeXlET1VFVnBtdEhZUm9zUWRlb289IiwibWFjIjoiMjYwMjljYzliMzczMjgwODhkZmE4NTc4ZWQxNjNiMzhlNWM3OGZiM2U0OThjMjZjODFhZDc1ZDBmZWUwYTEwYiIsInRhZyI6IiJ9', '2024-11-15 21:35:32', '2024-11-15 21:35:32'),
(14, 10, 'eyJpdiI6Im5EVVh0Z3hkcEhVWSswRy8rdGF0Q0E9PSIsInZhbHVlIjoieURFZUF0R1hRa0pPcWRZUnc2aG1KTDY3VmN3SnBKSTExMWVKUXppR3NwOG9xT2owOGRwM3ovVCtlSk1nQUVDdm9UUXNIcjNKbXhPc0J1VTZPYVBVYWNsWEZNdzB4MlVnZHovWnUzdFlOYWp5ZjNsaG1KZDluWHBQaFdGZk1FODdlMFdXcGtvS1ZscGZodDFwSDk5aXBWMHR3NnNyV1ZyaURsdkRaWEMrQVZ1SkRGV3BQSC9ULzBTeUw0Q2hia3JLcndNQWhCU0s5MjYyeVBTU0xKSU9rMUZNbTlKSHRsSzhRUEI2UHNCMTU3VUwvQi9PTjVPOHRjVTFyRXZ0dFVuMis4cWFpc0lpT05HSkZyQ3AxMVQrSVRQdUQ1UnFrb0JJSEIxcmYvN25zNkJHNUJwdWhuVnRXaDlZWTRjWW5vSysiLCJtYWMiOiI5YzM5OTA4YmUwMGY3YWY0MTRlMTIxNzExMTAzNzc2NGUxMGUxOWQzZWI1Nzc0Y2RiYTFjYjU5NmE2NjUxODM4IiwidGFnIjoiIn0=', 'eyJpdiI6InhiUDFVbkdRN0ZKcG9GMG9pQUtHVVE9PSIsInZhbHVlIjoiQ1RUMnFWKzBkb1BGclVOSnBVdjBVQT09IiwibWFjIjoiMGYzMDZjN2E0ZmM3NjVhMzk0MTJjZGM3MzZjYTU4Nzc5MmRiNmZhN2UxNjA5NDU2ZjlkYzQxNDBlZGY3MzlkOCIsInRhZyI6IiJ9', 'eyJpdiI6IkcyYkMyazVXd0x3eUxDYzRuR1FXNUE9PSIsInZhbHVlIjoiU2xqMkg3WXVNU21oaFVKaTJyUkt3MDcwRjN6T2IranpZN3Q2MXZNUFhWYkFGRmdZQWtPaHAwaFYzcVhPUE5uNTBKdHhsSTk1YTFab3YvTmJVYTJlVG16RWpIbW9vMEFScW56N05QczB2YTg0Y0NPSWwzd2ZobFUxQ1RlSi9RdXVXNm5JajJMbTBHUDd3dTlQUmRpUUZnRU9WMkxPcDJQazRMcUtoSUtnOVZTZzhDOXE4UTIvUDJLOWpNTU5GVzBuNFF6Y0l2OE02UjJHVWVGUm5NSk1nek84UXI0ZjBGNUg5a2Z3VTNzR0FYQ3BLUG4yYmgyRlVQMDh3d0s4VDhySGx2Z3NJZTc3S1ZZRzRyL2k1YjJlTzBycUVjUnV5VURHcUJ2QzFtNi9UeHc9IiwibWFjIjoiZTdjODUyYzUyYWY0MGM1MGQzYWZiYmE5NjlhMTAxNWY0NGI1NmI5YjcxY2FmNWU5NzRlNWY1ODkwNzdkMjlhMyIsInRhZyI6IiJ9', '2025-01-08 01:11:30', '2025-01-08 01:11:30');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_user_id_foreign` (`user_id`),
  ADD KEY `cart_product_id_foreign` (`product_id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- Chỉ mục cho bảng `user_cards`
--
ALTER TABLE `user_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_cards_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT cho bảng `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `user_cards`
--
ALTER TABLE `user_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Các ràng buộc cho bảng `user_cards`
--
ALTER TABLE `user_cards`
  ADD CONSTRAINT `user_cards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
