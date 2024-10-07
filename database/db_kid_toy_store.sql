-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 16, 2024 lúc 04:36 AM
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
(63, 14, 15, NULL, 4, '2024-10-13 04:56:19', '2024-10-13 04:58:19', 'product'),
(78, 16, 15, NULL, 2, '2024-10-15 19:15:02', '2024-10-15 19:15:02', 'product');

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
(14, '2024_10_13_152757_create_user_cards_table', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` enum('error','success','warning') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `message`, `type`, `created_at`, `updated_at`) VALUES
(23, 16, 'Mua hàng thành công!', 'Đơn hàng #43 đã được đặt thành công. Cảm ơn bạn đã mua hàng!', 'success', '2024-10-15 19:00:37', '2024-10-15 19:00:37'),
(24, 16, 'Mua hàng thành công!', 'Đơn hàng #44 đã được đặt thành công. Cảm ơn bạn đã mua hàng!', 'success', '2024-10-15 19:01:18', '2024-10-15 19:01:18'),
(25, 16, 'Mua hàng thành công!', 'Đơn hàng #45 đã được đặt thành công. Cảm ơn bạn đã mua hàng!', 'success', '2024-10-15 19:02:39', '2024-10-15 19:02:39'),
(26, 16, 'Mua hàng thành công!', 'Đơn hàng #46 đã được đặt thành công. Cảm ơn bạn đã mua hàng!', 'success', '2024-10-15 19:11:13', '2024-10-15 19:11:13'),
(27, 16, 'Mua hàng thành công!', 'Đơn hàng #47 đã được đặt thành công. Cảm ơn bạn đã mua hàng!', 'success', '2024-10-15 19:14:57', '2024-10-15 19:14:57');

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
(2, 3, 'pending', 199.84, '2024-10-12 01:43:14', '2024-10-12 01:43:14'),
(3, 3, 'pending', 1200379.68, '2024-10-12 01:46:01', '2024-10-12 01:46:01'),
(39, 16, 'pending', 75159.94, '2024-10-13 07:49:00', '2024-10-13 07:49:00'),
(40, 16, 'pending', 9.99, '2024-10-13 21:11:20', '2024-10-13 21:11:20'),
(41, 16, 'paid', 29.98, '2024-10-15 09:43:28', '2024-10-15 09:43:28'),
(42, 16, 'paid', 0.00, '2024-10-15 18:57:29', '2024-10-15 18:57:29'),
(43, 16, 'paid', 29.97, '2024-10-15 19:00:37', '2024-10-15 19:00:37'),
(44, 16, 'paid', 50.00, '2024-10-15 19:01:18', '2024-10-15 19:01:18'),
(45, 16, 'paid', 119.98, '2024-10-15 19:02:39', '2024-10-15 19:02:39'),
(46, 16, 'paid', 9.99, '2024-10-15 19:11:13', '2024-10-15 19:11:13'),
(47, 16, 'paid', 19.98, '2024-10-15 19:14:57', '2024-10-15 19:14:57');

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
(3, 2, 16, 0, 4, 19.99, '2024-10-12 01:43:14', '2024-10-12 01:43:14'),
(4, 2, 15, 0, 12, 9.99, '2024-10-12 01:43:14', '2024-10-12 01:43:14'),
(5, 3, 15, 0, 12, 9.99, '2024-10-12 01:46:01', '2024-10-12 01:46:01'),
(6, 3, 16, 0, 10, 19.99, '2024-10-12 01:46:01', '2024-10-12 01:46:01'),
(7, 3, 17, 0, 10, 5.99, '2024-10-12 01:46:01', '2024-10-12 01:46:01'),
(8, 3, 18, 0, 12, 100000.00, '2024-10-12 01:46:01', '2024-10-12 01:46:01'),
(47, 39, 15, NULL, 1, 9.99, '2024-10-13 07:49:00', '2024-10-13 07:49:00'),
(48, 39, NULL, NULL, 1, 50.00, '2024-10-13 07:49:00', '2024-10-13 07:49:00'),
(49, 39, NULL, NULL, 1, 75000.00, '2024-10-13 07:49:00', '2024-10-13 07:49:00'),
(50, 39, 16, NULL, 5, 19.99, '2024-10-13 07:49:00', '2024-10-13 07:49:00'),
(51, 40, 15, NULL, 1, 9.99, '2024-10-13 21:11:20', '2024-10-13 21:11:20'),
(52, 41, 15, NULL, 1, 9.99, '2024-10-15 09:43:28', '2024-10-15 09:43:28'),
(53, 41, 16, NULL, 1, 19.99, '2024-10-15 09:43:28', '2024-10-15 09:43:28'),
(54, 42, 15, NULL, 1, 9.99, '2024-10-15 18:57:29', '2024-10-15 18:57:29'),
(55, 43, 15, NULL, 3, 9.99, '2024-10-15 19:00:37', '2024-10-15 19:00:37'),
(56, 44, NULL, NULL, 1, 50.00, '2024-10-15 19:01:18', '2024-10-15 19:01:18'),
(57, 45, 15, NULL, 2, 9.99, '2024-10-15 19:02:39', '2024-10-15 19:02:39'),
(58, 45, NULL, NULL, 2, 50.00, '2024-10-15 19:02:39', '2024-10-15 19:02:39'),
(59, 46, 15, NULL, 1, 9.99, '2024-10-15 19:11:13', '2024-10-15 19:11:13'),
(60, 47, 15, NULL, 2, 9.99, '2024-10-15 19:14:57', '2024-10-15 19:14:57');

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
(42, 'App\\Models\\User', 16, 'auth_token', '9d757145ddbfd5ef0616869de3cec08ff04acad272dd43c981971242ea870c55', '[\"*\"]', '2024-10-15 19:15:15', NULL, '2024-10-13 07:47:57', '2024-10-15 19:15:15'),
(43, 'App\\Models\\User', 16, 'auth_token', '68325084a5b42916ecd72c7fdf72ab4e0e575de1330951c3c8a1462e7894fe8e', '[\"*\"]', '2024-10-14 03:12:07', NULL, '2024-10-13 21:34:36', '2024-10-14 03:12:07'),
(44, 'App\\Models\\User', 16, 'auth_token', '540ecd5764e7e06b12b143e23989851b6e030be1fca3074a35568d3e9297e368', '[\"*\"]', '2024-10-14 05:39:54', NULL, '2024-10-14 03:12:19', '2024-10-14 05:39:54'),
(45, 'App\\Models\\User', 16, 'auth_token', '6dda4ded7a7c7a1eaedb8b60ab66b16ad1aa72790b9a21111aa65fe031806a86', '[\"*\"]', '2024-10-15 18:55:50', NULL, '2024-10-14 05:45:21', '2024-10-15 18:55:50'),
(46, 'App\\Models\\User', 16, 'auth_token', 'f320ce2e25251cc853657c4a588a65a9c4d164f54a985e1f0b7d6b32f5020079', '[\"*\"]', '2024-10-14 22:39:13', NULL, '2024-10-14 21:14:46', '2024-10-14 22:39:13');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `detail`, `description`, `price`, `thumbnail`, `sold`, `quantity`, `created_at`, `updated_at`) VALUES
(15, 'Toy Car', 1, '<p>Small red toy car for kids</p>', '<p>This toy car is made of durable plastic, suitable for children aged 3 and above.</p>', 9.99, 'thumbnails/products/product_1728150572.jpg', 48, 22, '2024-10-04 21:34:43', '2024-10-13 21:11:20'),
(16, 'Building Blocks Set', 1, '<p>A set of colorful building blocks</p>', '<p>These blocks help to develop creativity and problem-solving skills in children.</p>', 19.99, 'thumbnails/products/product_1728150586.jpg', 24, 11, '2024-10-04 21:34:43', '2024-10-13 07:49:00'),
(17, 'Story Book', 2, 'A story book for kids', 'A fun and engaging story book for young readers.', 5.99, 'thumbnails/products/s612bae45e1ee41d7b4abec737f719ae6sjpg-720x720q80_1728817604.jpg', 34, 186, '2024-10-04 21:34:43', '2024-10-13 04:55:17'),
(18, 'New prd', 1, NULL, NULL, 100000, 'thumbnails/products/order-success_1728311861.png', 13, 99, '2024-10-07 07:37:41', '2024-10-12 11:06:58'),
(19, 'Product 1 Category 1', 1, 'Detail for Product 1 in Category 1', 'Description for Product 1 in Category 1', 64.12, 'thumbnails/products/product_1728150572.jpg', 84, 181, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(20, 'Product 2 Category 1', 1, 'Detail for Product 2 in Category 1', 'Description for Product 2 in Category 1', 76.94, 'thumbnails/products/product_1728150572.jpg', 20, 147, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(21, 'Product 3 Category 1', 1, 'Detail for Product 3 in Category 1', 'Description for Product 3 in Category 1', 70.93, 'thumbnails/products/product_1728150572.jpg', 60, 73, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(22, 'Product 4 Category 1', 1, 'Detail for Product 4 in Category 1', 'Description for Product 4 in Category 1', 17.84, 'thumbnails/products/product_1728150572.jpg', 68, 143, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(23, 'Product 5 Category 1', 1, 'Detail for Product 5 in Category 1', 'Description for Product 5 in Category 1', 93.2, 'thumbnails/products/product_1728150572.jpg', 46, 138, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(24, 'Product 6 Category 1', 1, 'Detail for Product 6 in Category 1', 'Description for Product 6 in Category 1', 50.28, 'thumbnails/products/product_1728150572.jpg', 36, 123, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(25, 'Product 7 Category 1', 1, 'Detail for Product 7 in Category 1', 'Description for Product 7 in Category 1', 87.15, 'thumbnails/products/product_1728150572.jpg', 97, 104, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(26, 'Product 8 Category 1', 1, 'Detail for Product 8 in Category 1', 'Description for Product 8 in Category 1', 44.58, 'thumbnails/products/product_1728150572.jpg', 69, 89, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(27, 'Product 9 Category 1', 1, 'Detail for Product 9 in Category 1', 'Description for Product 9 in Category 1', 31.6, 'thumbnails/products/product_1728150572.jpg', 14, 56, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(28, 'Product 10 Category 1', 1, 'Detail for Product 10 in Category 1', 'Description for Product 10 in Category 1', 74.41, 'thumbnails/products/product_1728150572.jpg', 5, 74, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(29, 'Product 1 Category 2', 2, 'Detail for Product 1 in Category 2', 'Description for Product 1 in Category 2', 22.95, 'thumbnails/products/product_1728150572.jpg', 16, 96, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(30, 'Product 2 Category 2', 2, 'Detail for Product 2 in Category 2', 'Description for Product 2 in Category 2', 42.04, 'thumbnails/products/product_1728150572.jpg', 68, 156, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(31, 'Product 3 Category 2', 2, 'Detail for Product 3 in Category 2', 'Description for Product 3 in Category 2', 76.43, 'thumbnails/products/product_1728150572.jpg', 41, 179, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(32, 'Product 4 Category 2', 2, 'Detail for Product 4 in Category 2', 'Description for Product 4 in Category 2', 23.24, 'thumbnails/products/product_1728150572.jpg', 73, 74, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(33, 'Product 5 Category 2', 2, 'Detail for Product 5 in Category 2', 'Description for Product 5 in Category 2', 18.49, 'thumbnails/products/product_1728150572.jpg', 23, 131, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(34, 'Product 6 Category 2', 2, 'Detail for Product 6 in Category 2', 'Description for Product 6 in Category 2', 66.17, 'thumbnails/products/product_1728150572.jpg', 21, 192, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(35, 'Product 7 Category 2', 2, 'Detail for Product 7 in Category 2', 'Description for Product 7 in Category 2', 56.54, 'thumbnails/products/product_1728150572.jpg', 97, 131, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(36, 'Product 8 Category 2', 2, 'Detail for Product 8 in Category 2', 'Description for Product 8 in Category 2', 26.47, 'thumbnails/products/product_1728150572.jpg', 13, 188, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(37, 'Product 9 Category 2', 2, 'Detail for Product 9 in Category 2', 'Description for Product 9 in Category 2', 47.14, 'thumbnails/products/product_1728150572.jpg', 27, 192, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(38, 'Product 10 Category 2', 2, 'Detail for Product 10 in Category 2', 'Description for Product 10 in Category 2', 94.7, 'thumbnails/products/product_1728150572.jpg', 44, 83, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(39, 'Product 1 Category 3', 3, 'Detail for Product 1 in Category 3', 'Description for Product 1 in Category 3', 91.42, 'thumbnails/products/product_1728150572.jpg', 40, 69, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(40, 'Product 2 Category 3', 3, 'Detail for Product 2 in Category 3', 'Description for Product 2 in Category 3', 95.12, 'thumbnails/products/product_1728150572.jpg', 63, 60, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(41, 'Product 3 Category 3', 3, 'Detail for Product 3 in Category 3', 'Description for Product 3 in Category 3', 51.42, 'thumbnails/products/product_1728150572.jpg', 6, 70, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(42, 'Product 4 Category 3', 3, 'Detail for Product 4 in Category 3', 'Description for Product 4 in Category 3', 22.13, 'thumbnails/products/product_1728150572.jpg', 4, 70, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(43, 'Product 5 Category 3', 3, 'Detail for Product 5 in Category 3', 'Description for Product 5 in Category 3', 16.5, 'thumbnails/products/product_1728150572.jpg', 19, 195, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(44, 'Product 6 Category 3', 3, 'Detail for Product 6 in Category 3', 'Description for Product 6 in Category 3', 72.36, 'thumbnails/products/product_1728150572.jpg', 88, 54, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(45, 'Product 7 Category 3', 3, 'Detail for Product 7 in Category 3', 'Description for Product 7 in Category 3', 61.51, 'thumbnails/products/product_1728150572.jpg', 99, 59, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(46, 'Product 8 Category 3', 3, 'Detail for Product 8 in Category 3', 'Description for Product 8 in Category 3', 38.49, 'thumbnails/products/product_1728150572.jpg', 36, 183, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(47, 'Product 9 Category 3', 3, 'Detail for Product 9 in Category 3', 'Description for Product 9 in Category 3', 44.11, 'thumbnails/products/product_1728150572.jpg', 65, 155, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(48, 'Product 10 Category 3', 3, 'Detail for Product 10 in Category 3', 'Description for Product 10 in Category 3', 84.31, 'thumbnails/products/product_1728150572.jpg', 36, 108, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(49, 'Product 1 Category 10', 10, 'Detail for Product 1 in Category 10', 'Description for Product 1 in Category 10', 35.11, 'thumbnails/products/product_1728150572.jpg', 36, 56, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(50, 'Product 2 Category 10', 10, 'Detail for Product 2 in Category 10', 'Description for Product 2 in Category 10', 52.13, 'thumbnails/products/product_1728150572.jpg', 24, 53, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(51, 'Product 3 Category 10', 10, 'Detail for Product 3 in Category 10', 'Description for Product 3 in Category 10', 27.76, 'thumbnails/products/product_1728150572.jpg', 98, 71, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(52, 'Product 4 Category 10', 10, 'Detail for Product 4 in Category 10', 'Description for Product 4 in Category 10', 49.1, 'thumbnails/products/product_1728150572.jpg', 52, 171, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(53, 'Product 5 Category 10', 10, 'Detail for Product 5 in Category 10', 'Description for Product 5 in Category 10', 56.58, 'thumbnails/products/product_1728150572.jpg', 30, 178, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(54, 'Product 6 Category 10', 10, 'Detail for Product 6 in Category 10', 'Description for Product 6 in Category 10', 78.1, 'thumbnails/products/product_1728150572.jpg', 27, 198, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(55, 'Product 7 Category 10', 10, 'Detail for Product 7 in Category 10', 'Description for Product 7 in Category 10', 25.67, 'thumbnails/products/product_1728150572.jpg', 42, 184, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(56, 'Product 8 Category 10', 10, 'Detail for Product 8 in Category 10', 'Description for Product 8 in Category 10', 30.6, 'thumbnails/products/product_1728150572.jpg', 55, 71, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(57, 'Product 9 Category 10', 10, 'Detail for Product 9 in Category 10', 'Description for Product 9 in Category 10', 24.48, 'thumbnails/products/product_1728150572.jpg', 6, 101, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(58, 'Product 10 Category 10', 10, 'Detail for Product 10 in Category 10', 'Description for Product 10 in Category 10', 16.17, 'thumbnails/products/product_1728150572.jpg', 68, 186, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(59, 'Product 1 Category 11', 11, 'Detail for Product 1 in Category 11', 'Description for Product 1 in Category 11', 74.17, 'thumbnails/products/product_1728150572.jpg', 93, 86, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(60, 'Product 2 Category 11', 11, 'Detail for Product 2 in Category 11', 'Description for Product 2 in Category 11', 24.68, 'thumbnails/products/product_1728150572.jpg', 93, 75, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(61, 'Product 3 Category 11', 11, 'Detail for Product 3 in Category 11', 'Description for Product 3 in Category 11', 26.22, 'thumbnails/products/product_1728150572.jpg', 58, 171, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(62, 'Product 4 Category 11', 11, 'Detail for Product 4 in Category 11', 'Description for Product 4 in Category 11', 55.59, 'thumbnails/products/product_1728150572.jpg', 6, 92, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(63, 'Product 5 Category 11', 11, 'Detail for Product 5 in Category 11', 'Description for Product 5 in Category 11', 27.33, 'thumbnails/products/product_1728150572.jpg', 81, 138, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(64, 'Product 6 Category 11', 11, 'Detail for Product 6 in Category 11', 'Description for Product 6 in Category 11', 90.7, 'thumbnails/products/product_1728150572.jpg', 89, 162, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(65, 'Product 7 Category 11', 11, 'Detail for Product 7 in Category 11', 'Description for Product 7 in Category 11', 14.07, 'thumbnails/products/product_1728150572.jpg', 16, 50, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(66, 'Product 8 Category 11', 11, 'Detail for Product 8 in Category 11', 'Description for Product 8 in Category 11', 72.93, 'thumbnails/products/product_1728150572.jpg', 88, 145, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(67, 'Product 9 Category 11', 11, 'Detail for Product 9 in Category 11', 'Description for Product 9 in Category 11', 17.02, 'thumbnails/products/product_1728150572.jpg', 59, 159, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(68, 'Product 10 Category 11', 11, 'Detail for Product 10 in Category 11', 'Description for Product 10 in Category 11', 85.02, 'thumbnails/products/product_1728150572.jpg', 42, 156, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(69, 'Product 1 Category 12', 12, 'Detail for Product 1 in Category 12', 'Description for Product 1 in Category 12', 99.74, 'thumbnails/products/product_1728150572.jpg', 2, 175, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(70, 'Product 2 Category 12', 12, 'Detail for Product 2 in Category 12', 'Description for Product 2 in Category 12', 61.1, 'thumbnails/products/product_1728150572.jpg', 13, 98, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(71, 'Product 3 Category 12', 12, 'Detail for Product 3 in Category 12', 'Description for Product 3 in Category 12', 15.85, 'thumbnails/products/product_1728150572.jpg', 83, 186, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(72, 'Product 4 Category 12', 12, 'Detail for Product 4 in Category 12', 'Description for Product 4 in Category 12', 18.18, 'thumbnails/products/product_1728150572.jpg', 55, 139, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(73, 'Product 5 Category 12', 12, 'Detail for Product 5 in Category 12', 'Description for Product 5 in Category 12', 25.65, 'thumbnails/products/product_1728150572.jpg', 56, 130, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(74, 'Product 6 Category 12', 12, 'Detail for Product 6 in Category 12', 'Description for Product 6 in Category 12', 39.43, 'thumbnails/products/product_1728150572.jpg', 56, 152, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(75, 'Product 7 Category 12', 12, 'Detail for Product 7 in Category 12', 'Description for Product 7 in Category 12', 25.05, 'thumbnails/products/product_1728150572.jpg', 77, 165, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(76, 'Product 8 Category 12', 12, 'Detail for Product 8 in Category 12', 'Description for Product 8 in Category 12', 71.18, 'thumbnails/products/product_1728150572.jpg', 34, 116, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(77, 'Product 9 Category 12', 12, 'Detail for Product 9 in Category 12', 'Description for Product 9 in Category 12', 36.68, 'thumbnails/products/product_1728150572.jpg', 4, 105, '2024-10-15 19:25:43', '2024-10-15 19:25:43'),
(78, 'Product 10 Category 12', 12, 'Detail for Product 10 in Category 12', 'Description for Product 10 in Category 12', 80.49, 'thumbnails/products/product_1728150572.jpg', 40, 92, '2024-10-15 19:25:43', '2024-10-15 19:25:43');

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
  `number_ticket` int(11) NOT NULL DEFAULT 0,
  `sold` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tickets`
--

INSERT INTO `tickets` (`id`, `name`, `thumbnail`, `place`, `date`, `detail`, `description`, `price`, `number_ticket`, `sold`, `created_at`, `updated_at`) VALUES
(1, 'Water Park Fun', 'thumbnails/tickets/playground_1728150965.jpg', 'Aquatic Park, City Center', '2024-12-01', 'All-day pass to water park', 'An exciting day at the Aquatic Park with water slides, wave pools, and more.', 50, 179, 105, '2024-09-30 20:47:40', '2024-10-13 07:49:00'),
(2, 'Theme Park Adventure', 'thumbnails/tickets/thiet-ke-khu-vui-choi-tre-em-trong-nha_1728818663.jpg', 'Mountain Theme Park', '2024-11-17', 'Full-day adventure pass', 'A thrilling adventure at the mountain theme park with roller coasters, games, and family fun.', 75000, 124, 126, '2024-09-30 20:47:40', '2024-10-13 07:49:00'),
(3, 'new', 'thumbnails/tickets/khu-vui-choi-tre-em-tphcm-1-1200x628_1728817297.jpg', 'new', '2024-11-25', 'aaaaa', 'aaaaa', 100000, 100, 333, '2024-09-30 20:47:40', '2024-10-13 01:25:42'),
(5, 'Water Park Fun', 'thumbnails/tickets/khu-vui-choi-tre-em-tphcm-1-1200x628_1728818672.jpg', 'Aquatic Park, City Center', '2024-12-01', 'All-day pass to water park', 'An exciting day at the Aquatic Park with water slides, wave pools, and more.', 50, 33, 33, '2024-10-04 21:34:43', '2024-10-13 04:24:32'),
(6, 'Theme Park Adventure', 'thumbnails/tickets/khu-vui-choi-ngoai-troi_1728818683.jpg', 'Mountain Theme Park', '2024-11-15', 'Full-day adventure pass', 'A thrilling adventure at the mountain theme park with roller coasters, games, and family fun.', 75, 150, 150, '2024-10-04 21:34:43', '2024-10-13 04:24:43'),
(7, 'Zoo Safari Tour', 'thumbnails/tickets/khu-vui-choi-ngoai-troi_1728818693.jpg', 'National Zoo', '2024-10-25', 'Exclusive safari tour', 'Explore the wonders of wildlife with a guided safari tour at the National Zoo.', 40, 50, 50, '2024-10-04 21:34:43', '2024-10-13 04:24:53');

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
(10, 'New User', 'new@gmail.com', NULL, '$2y$12$b6hlnUnZE/QooeeZ7kARie5JQnnaj2q1m2cHLG4N2VIRWBw6UVv.K', NULL, '2024-10-07 07:31:16', '2024-10-13 22:56:56', 2, NULL, NULL, 'avatars/icon_1728885416.png'),
(13, 'Saturday', 'sat@gmail.com', NULL, '$2y$12$X4iunDLBcRMYbPEFfPdGZuDIhjdCckQSiT6FP95oYRMicvnuRQWK6', NULL, '2024-10-12 01:52:52', '2024-10-13 22:57:27', 2, NULL, NULL, 'avatars/avt_1728885447.png'),
(15, 'admin', 'admin@gmail.com', NULL, '$2y$12$28HkwKGJXOwMXw.r/DaaY.UUJyt4jCTJLevH2umOF5vQGKRJHkYQy', NULL, '2024-10-13 04:27:13', '2024-10-13 23:00:30', 1, NULL, NULL, 'avatars/avt_1728885630.png'),
(16, 'Fullname Sunday', 'sun@gmail.com', NULL, '$2y$12$FkTEIvD7uibBNCi9VibwkOczc645cxUUHZwxEs6YeWTIT0.e/cqMC', NULL, '2024-10-13 07:47:47', '2024-10-14 02:09:25', 2, '0987654321', 'kkk, kkk, kk, kk, Sunday address 3', 'avatars/avt_1728885577.png'),
(18, 'bb', 'bb@gmail.com', NULL, '$2y$12$I98jNLOTBhHNokDuInL4A.Xitz9S36guLHlsb4iAxSkIl2Th7szoe', NULL, '2024-10-13 22:59:55', '2024-10-13 22:59:55', 2, NULL, NULL, 'avatars/avt.png');

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
(4, 16, 'eyJpdiI6IlhCTmY0dFNha1gvR1pxK3lCUnhRa2c9PSIsInZhbHVlIjoiY1FqVFJINUw3S2luWlNQZGd3UU4yMTJQRjJsZjczTUJFeTFPYmVZSVNmNVB2VHFDc2dGNjVWelRQaFNWamI2Z0RzcTByL0xHdDNMSXJXeGRKbUlrRlZvbEpKL0FQOVFLcEZRZWUyb2QrczVaSytyK0Z6LzhqcGNTRWRnOUJMbzFuR2p2UVMySkw3WERYYUhjc2pZWDB4RmM2QlNwSGF2VkRXaytFMXV1ajBNY1NyZUdocG4wdTU1OUV4NlA1TEFQS2E1RVlnYlgyaFhtT2wzTEhvRGMvK0ZjRUdOd3EwNWN0UW5oMDhWWFRaK2RFTm9nTVh1M3duemw0SGdUbzBtUGRkN0JPdzN2WGowRnJwazBWYmtXZk9XT01qVEhWWnBHc3IxWHhJVFppcTdOM2dvTHdrdTVHa3prUFVUWkd0YU0iLCJtYWMiOiJmMzEzMTNjZTVjYWI2ODRkYjEwODRjNjg3Y2QzYWQ5NzEwMDM3MjYwNTFlOTAyMTRhOWM3NTQxYTY0NDRmNTc2IiwidGFnIjoiIn0=', 'eyJpdiI6IjI5OWw4NHpmQUFmWHZ4NldadjdvdVE9PSIsInZhbHVlIjoiRThTc2o1VXpNV3NQTWFrV2VCUWpYdz09IiwibWFjIjoiNWM1OTM1OTQxZGI5MWUwY2E1Yzk4YjE3MTUyY2VlM2M2YTUyY2FjYTI2MWNkYzZmYzM1NDgyZWFkMzUwN2IwMiIsInRhZyI6IiJ9', 'eyJpdiI6IkR6S1RKTkl2OTFISnFZdlc4R1dMTXc9PSIsInZhbHVlIjoiNmZjTVR5ZGNBUWZkQjVRakVRekZCYSswS0k3MWNOdll0QW9Kc2pscERSdUcwQmtYVVRaL2xUZkdzU01EVnVqVGRuQzI4UHNRL1ppNGtXQmVIMEpwdE01Tys5ZHdnbktoeW1vUWNlTVRqUzhzQXZmRHp0Z3dyRWM5MDRHRlg2SnBidUlsazVmSFYydVdXUlR2OVRmWGlEcDQ4VGdJZk5mZGpzeU9JNVhtMGJHVG1kTE9ZVnVtUEJuWUtVR093U1g2R3lERVplbE5aY1ZlNzF4SFJSYitZMVhwUVNnaGE4dnJvWThPTnRaRGMyK3NKK3VFclpkcmxqbUpXZ2g5Y1g1cjVaU1NQdW9qOWxKNHF6Q0k3d2llcGxXeU1oc2JSeEFvVmlNT0hLbUY5cEk9IiwibWFjIjoiM2MxZDE4ZTc1ZTliYjhmZWIwOGQ4OWZjYzQ3NzRiZWE4NGJlZGNiMzRkZmQ5ZWJlMDdlNDczN2M1ZTYyZDIwYiIsInRhZyI6IiJ9', '2024-10-15 18:55:50', '2024-10-15 18:55:50');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `user_cards`
--
ALTER TABLE `user_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
