-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 12, 2022 at 08:02 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mediusware`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_post` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_category_id` bigint(20) UNSIGNED NOT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_tags`
--

CREATE TABLE `blog_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(6, '2020_08_28_072131_create_blog_categories_table', 3),
(7, '2020_08_28_072234_create_blogs_table', 3),
(8, '2020_08_28_103502_create_variants_table', 3),
(10, '2020_08_28_104103_create_blog_tags_table', 3),
(14, '2020_08_28_063029_create_products_table', 4),
(15, '2020_08_28_103644_create_product_images_table', 4),
(16, '2020_08_31_065549_create_product_variants_table', 4),
(17, '2020_08_31_073704_create_product_variant_prices_table', 4),
(18, '2020_08_31_081510_create_product_variant_price_relation_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `sku`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Product Name', 'asdflasdf', 't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)', '2020-08-31 02:18:53', '2022-01-12 12:54:25'),
(2, 'Product Two', 'adfsadfsasf', 't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)', '2020-08-31 09:25:57', '2020-08-31 09:25:57'),
(3, 'Product Three', 'afdafdfasdfasasdf', 't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)', '2020-08-31 10:21:29', '2020-08-31 10:21:29'),
(4, 'Product Four', 'afdafdfasdfasasdfadsf', 'adsfadft is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)', '2020-08-31 10:21:44', '2020-08-31 10:21:44'),
(5, 'T-Shirt', 't-shirt', 't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)', '2020-08-31 10:37:15', '2020-08-31 10:37:15'),
(6, 'T-Shirt RED', 't-shirt-red', 't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)', '2020-08-31 10:38:17', '2020-08-31 10:38:17'),
(7, 'Formal Shirt', 'formal-shirt', 't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)', '2020-08-31 10:38:39', '2020-08-31 10:38:39'),
(8, 'sdfa', 'df', 'asdfasd', '2022-01-12 04:34:53', '2022-01-12 04:34:53'),
(10, 'Test Product', 'sdfa', 'This is product descriptions', '2022-01-12 04:43:03', '2022-01-12 04:43:03'),
(11, 'Test Product', 'Product Sku', 'This is product descriptions', '2022-01-12 04:43:33', '2022-01-12 04:43:33'),
(12, 'Test Product', 'Product Sku sd364', 'This is product descriptions', '2022-01-12 04:46:12', '2022-01-12 04:46:12'),
(13, 'Test Product', 'Product Sku sd183', 'This is product descriptions', '2022-01-12 04:46:44', '2022-01-12 04:46:44'),
(14, 'Test Product', 'Product Sku sd581', 'This is product descriptions', '2022-01-12 04:47:06', '2022-01-12 12:53:14'),
(15, 'Test Product', 'Product Sku sd224', 'This is product descriptions', '2022-01-12 04:48:01', '2022-01-12 04:48:01'),
(16, 'Test Product', 'Product Sku sd628', 'This is product descriptions', '2022-01-12 04:48:29', '2022-01-12 04:48:29'),
(17, 'Test Product', 'Product Sku sd456', 'This is product descriptions', '2022-01-12 04:49:23', '2022-01-12 04:49:23'),
(18, 'Shirt', 'shirt251492', 'This is sample tshirt', '2022-01-12 04:50:37', '2022-01-12 04:50:37'),
(19, 'Pant', 'Pant-542526', 'This is pant542 description is here', '2022-01-12 04:53:07', '2022-01-12 04:53:07'),
(20, 'Product 254', 'Product 254363', 'Product 254', '2022-01-12 04:57:01', '2022-01-12 04:57:01'),
(24, 'sdfa', 'sdfas dfasdf471', 'sdfas dfasd', '2022-01-12 05:27:37', '2022-01-12 12:51:22'),
(25, 'sdfasf', 'sdafasdf391', 'sdfasdf', '2022-01-12 10:39:35', '2022-01-12 12:52:19'),
(26, 'sdfasf', 'sdafasdf427', 'sdfasdf', '2022-01-12 10:40:14', '2022-01-12 12:51:45'),
(27, 'This is test product', 'testproduct-sku', 'Test Product', '2022-01-12 13:00:27', '2022-01-12 13:01:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `file_path`, `thumbnail`, `created_at`, `updated_at`) VALUES
(3, 26, '/dist/product/sdfasf-product_file-795870793.png', 1, '2022-01-12 10:40:14', '2022-01-12 10:40:14'),
(5, 25, '/dist/product/sdfasf-product_file-522452953.png', 1, '2022-01-12 12:52:19', '2022-01-12 12:52:19'),
(6, 25, '/dist/product/sdfasf-product_file-55255723.png', 1, '2022-01-12 12:52:19', '2022-01-12 12:52:19'),
(7, 14, '/dist/product/test-product-product_file-938138236.png', 1, '2022-01-12 12:53:14', '2022-01-12 12:53:14'),
(8, 1, '/dist/product/product-name-product_file-958124484.png', 1, '2022-01-12 12:54:25', '2022-01-12 12:54:25'),
(9, 27, '/dist/product/this-is-test-product-product_file-96854728.png', 1, '2022-01-12 13:00:27', '2022-01-12 13:00:27'),
(10, 27, '/dist/product/this-is-test-product-product_file-609277449.png', 1, '2022-01-12 13:00:27', '2022-01-12 13:00:27');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variant_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `variant`, `variant_id`, `product_id`, `created_at`, `updated_at`) VALUES
(7, 'XL', 2, 2, '2020-08-31 09:25:57', '2020-08-31 09:25:57'),
(8, 'L', 2, 2, '2020-08-31 09:25:57', '2020-08-31 09:25:57'),
(9, 'red', 1, 2, '2020-08-31 09:25:57', '2020-08-31 09:25:57'),
(10, 'green', 1, 2, '2020-08-31 09:25:57', '2020-08-31 09:25:57'),
(11, 'blue', 1, 2, '2020-08-31 09:25:57', '2020-08-31 09:25:57'),
(12, 'red', 1, 3, '2020-08-31 10:21:29', '2020-08-31 10:21:29'),
(13, 'green', 1, 3, '2020-08-31 10:21:30', '2020-08-31 10:21:30'),
(14, 'xl', 2, 3, '2020-08-31 10:21:30', '2020-08-31 10:21:30'),
(15, 'l', 2, 3, '2020-08-31 10:21:30', '2020-08-31 10:21:30'),
(16, 'm', 2, 3, '2020-08-31 10:21:30', '2020-08-31 10:21:30'),
(17, 'v-nick', 6, 3, '2020-08-31 10:21:30', '2020-08-31 10:21:30'),
(18, 'o-nick', 6, 3, '2020-08-31 10:21:30', '2020-08-31 10:21:30'),
(19, 'red', 1, 4, '2020-08-31 10:21:44', '2020-08-31 10:21:44'),
(20, 'green', 1, 4, '2020-08-31 10:21:44', '2020-08-31 10:21:44'),
(21, 'xl', 2, 4, '2020-08-31 10:21:44', '2020-08-31 10:21:44'),
(22, 'l', 2, 4, '2020-08-31 10:21:44', '2020-08-31 10:21:44'),
(23, 'm', 2, 4, '2020-08-31 10:21:44', '2020-08-31 10:21:44'),
(24, 'v-nick', 6, 4, '2020-08-31 10:21:44', '2020-08-31 10:21:44'),
(25, 'o-nick', 6, 4, '2020-08-31 10:21:44', '2020-08-31 10:21:44'),
(26, 'red', 1, 5, '2020-08-31 10:37:15', '2020-08-31 10:37:15'),
(27, 'green', 1, 5, '2020-08-31 10:37:15', '2020-08-31 10:37:15'),
(28, 'xl', 2, 5, '2020-08-31 10:37:15', '2020-08-31 10:37:15'),
(29, 'l', 2, 5, '2020-08-31 10:37:15', '2020-08-31 10:37:15'),
(30, 'm', 2, 5, '2020-08-31 10:37:15', '2020-08-31 10:37:15'),
(31, 'v-nick', 6, 5, '2020-08-31 10:37:15', '2020-08-31 10:37:15'),
(32, 'o-nick', 6, 5, '2020-08-31 10:37:15', '2020-08-31 10:37:15'),
(33, 'red', 1, 6, '2020-08-31 10:38:17', '2020-08-31 10:38:17'),
(34, 'green', 1, 6, '2020-08-31 10:38:17', '2020-08-31 10:38:17'),
(35, 'xl', 2, 6, '2020-08-31 10:38:18', '2020-08-31 10:38:18'),
(36, 'l', 2, 6, '2020-08-31 10:38:18', '2020-08-31 10:38:18'),
(37, 'm', 2, 6, '2020-08-31 10:38:18', '2020-08-31 10:38:18'),
(38, 'v-nick', 6, 6, '2020-08-31 10:38:18', '2020-08-31 10:38:18'),
(39, 'o-nick', 6, 6, '2020-08-31 10:38:18', '2020-08-31 10:38:18'),
(40, 'red', 1, 7, '2020-08-31 10:38:39', '2020-08-31 10:38:39'),
(41, 'green', 1, 7, '2020-08-31 10:38:39', '2020-08-31 10:38:39'),
(42, 'xl', 2, 7, '2020-08-31 10:38:39', '2020-08-31 10:38:39'),
(43, 'l', 2, 7, '2020-08-31 10:38:39', '2020-08-31 10:38:39'),
(44, 'm', 2, 7, '2020-08-31 10:38:39', '2020-08-31 10:38:39'),
(45, 'v-nick', 6, 7, '2020-08-31 10:38:39', '2020-08-31 10:38:39'),
(46, 'o-nick', 6, 7, '2020-08-31 10:38:39', '2020-08-31 10:38:39'),
(47, 'blue', 1, 8, '2022-01-12 04:34:53', '2022-01-12 04:34:53'),
(48, 'read', 1, 8, '2022-01-12 04:34:53', '2022-01-12 04:34:53'),
(49, 'gree', 1, 8, '2022-01-12 04:34:53', '2022-01-12 04:34:53'),
(50, 'lighgt', 1, 8, '2022-01-12 04:34:53', '2022-01-12 04:34:53'),
(51, 'dark', 1, 8, '2022-01-12 04:34:53', '2022-01-12 04:34:53'),
(52, 'long', 2, 8, '2022-01-12 04:34:53', '2022-01-12 04:34:53'),
(53, 'short', 2, 8, '2022-01-12 04:34:53', '2022-01-12 04:34:53'),
(54, 'classic', 6, 8, '2022-01-12 04:34:53', '2022-01-12 04:34:53'),
(55, 'blue', 1, 10, '2022-01-12 04:43:04', '2022-01-12 04:43:04'),
(56, 'read', 1, 10, '2022-01-12 04:43:04', '2022-01-12 04:43:04'),
(57, 'long', 2, 10, '2022-01-12 04:43:04', '2022-01-12 04:43:04'),
(58, 'short', 2, 10, '2022-01-12 04:43:04', '2022-01-12 04:43:04'),
(59, 'classic', 6, 10, '2022-01-12 04:43:04', '2022-01-12 04:43:04'),
(60, 'blue', 1, 11, '2022-01-12 04:43:33', '2022-01-12 04:43:33'),
(61, 'read', 1, 11, '2022-01-12 04:43:33', '2022-01-12 04:43:33'),
(62, 'long', 2, 11, '2022-01-12 04:43:33', '2022-01-12 04:43:33'),
(63, 'short', 2, 11, '2022-01-12 04:43:33', '2022-01-12 04:43:33'),
(64, 'classic', 6, 11, '2022-01-12 04:43:33', '2022-01-12 04:43:33'),
(65, 'blue', 1, 12, '2022-01-12 04:46:12', '2022-01-12 04:46:12'),
(66, 'read', 1, 12, '2022-01-12 04:46:12', '2022-01-12 04:46:12'),
(67, 'long', 2, 12, '2022-01-12 04:46:12', '2022-01-12 04:46:12'),
(68, 'short', 2, 12, '2022-01-12 04:46:12', '2022-01-12 04:46:12'),
(69, 'classic', 6, 12, '2022-01-12 04:46:12', '2022-01-12 04:46:12'),
(70, 'blue', 1, 13, '2022-01-12 04:46:44', '2022-01-12 04:46:44'),
(71, 'read', 1, 13, '2022-01-12 04:46:44', '2022-01-12 04:46:44'),
(72, 'long', 2, 13, '2022-01-12 04:46:44', '2022-01-12 04:46:44'),
(73, 'short', 2, 13, '2022-01-12 04:46:44', '2022-01-12 04:46:44'),
(74, 'classic', 6, 13, '2022-01-12 04:46:44', '2022-01-12 04:46:44'),
(80, 'blue', 1, 15, '2022-01-12 04:48:01', '2022-01-12 04:48:01'),
(81, 'read', 1, 15, '2022-01-12 04:48:01', '2022-01-12 04:48:01'),
(82, 'long', 2, 15, '2022-01-12 04:48:01', '2022-01-12 04:48:01'),
(83, 'short', 2, 15, '2022-01-12 04:48:01', '2022-01-12 04:48:01'),
(84, 'classic', 6, 15, '2022-01-12 04:48:01', '2022-01-12 04:48:01'),
(85, 'blue', 1, 16, '2022-01-12 04:48:29', '2022-01-12 04:48:29'),
(86, 'read', 1, 16, '2022-01-12 04:48:29', '2022-01-12 04:48:29'),
(87, 'long', 2, 16, '2022-01-12 04:48:29', '2022-01-12 04:48:29'),
(88, 'short', 2, 16, '2022-01-12 04:48:29', '2022-01-12 04:48:29'),
(89, 'classic', 6, 16, '2022-01-12 04:48:29', '2022-01-12 04:48:29'),
(90, 'blue', 1, 17, '2022-01-12 04:49:23', '2022-01-12 04:49:23'),
(91, 'read', 1, 17, '2022-01-12 04:49:23', '2022-01-12 04:49:23'),
(92, 'long', 2, 17, '2022-01-12 04:49:23', '2022-01-12 04:49:23'),
(93, 'short', 2, 17, '2022-01-12 04:49:23', '2022-01-12 04:49:23'),
(94, 'classic', 6, 17, '2022-01-12 04:49:23', '2022-01-12 04:49:23'),
(95, 'red', 1, 18, '2022-01-12 04:50:37', '2022-01-12 04:50:37'),
(96, 'blue', 1, 18, '2022-01-12 04:50:37', '2022-01-12 04:50:37'),
(97, '25', 2, 18, '2022-01-12 04:50:37', '2022-01-12 04:50:37'),
(98, '15', 2, 18, '2022-01-12 04:50:38', '2022-01-12 04:50:38'),
(99, 'long', 6, 18, '2022-01-12 04:50:38', '2022-01-12 04:50:38'),
(100, 'blue', 1, 19, '2022-01-12 04:53:07', '2022-01-12 04:53:07'),
(101, 'red', 1, 19, '2022-01-12 04:53:07', '2022-01-12 04:53:07'),
(102, 'small', 2, 19, '2022-01-12 04:53:07', '2022-01-12 04:53:07'),
(103, 'big', 2, 19, '2022-01-12 04:53:07', '2022-01-12 04:53:07'),
(104, '14', 2, 20, '2022-01-12 04:57:01', '2022-01-12 04:57:01'),
(105, '25', 2, 20, '2022-01-12 04:57:01', '2022-01-12 04:57:01'),
(106, 'black', 1, 20, '2022-01-12 04:57:01', '2022-01-12 04:57:01'),
(107, 'dark', 1, 20, '2022-01-12 04:57:01', '2022-01-12 04:57:01'),
(145, 'long', 2, 24, '2022-01-12 12:51:22', '2022-01-12 12:51:22'),
(146, 'short', 2, 24, '2022-01-12 12:51:22', '2022-01-12 12:51:22'),
(147, 'red', 1, 24, '2022-01-12 12:51:22', '2022-01-12 12:51:22'),
(148, 'blue', 1, 24, '2022-01-12 12:51:22', '2022-01-12 12:51:22'),
(149, 'info', 1, 24, '2022-01-12 12:51:22', '2022-01-12 12:51:22'),
(150, 'blue', 1, 26, '2022-01-12 12:51:45', '2022-01-12 12:51:45'),
(151, 'dark', 1, 26, '2022-01-12 12:51:45', '2022-01-12 12:51:45'),
(152, '25', 2, 26, '2022-01-12 12:51:45', '2022-01-12 12:51:45'),
(153, '36', 2, 26, '2022-01-12 12:51:45', '2022-01-12 12:51:45'),
(154, '12', 2, 26, '2022-01-12 12:51:45', '2022-01-12 12:51:45'),
(155, 'blue', 1, 25, '2022-01-12 12:52:19', '2022-01-12 12:52:19'),
(156, 'dark', 1, 25, '2022-01-12 12:52:19', '2022-01-12 12:52:19'),
(157, '25', 2, 25, '2022-01-12 12:52:19', '2022-01-12 12:52:19'),
(158, '36', 2, 25, '2022-01-12 12:52:19', '2022-01-12 12:52:19'),
(163, 'blue', 1, 14, '2022-01-12 12:53:14', '2022-01-12 12:53:14'),
(164, 'read', 1, 14, '2022-01-12 12:53:14', '2022-01-12 12:53:14'),
(165, 'long', 2, 14, '2022-01-12 12:53:14', '2022-01-12 12:53:14'),
(166, 'short', 2, 14, '2022-01-12 12:53:14', '2022-01-12 12:53:14'),
(172, 'red', 1, 1, '2022-01-12 12:54:25', '2022-01-12 12:54:25'),
(173, 'green', 1, 1, '2022-01-12 12:54:25', '2022-01-12 12:54:25'),
(174, 'blue', 1, 1, '2022-01-12 12:54:25', '2022-01-12 12:54:25'),
(175, 'xl', 2, 1, '2022-01-12 12:54:25', '2022-01-12 12:54:25'),
(176, 'sm', 2, 1, '2022-01-12 12:54:26', '2022-01-12 12:54:26'),
(181, 'blue', 1, 27, '2022-01-12 13:01:07', '2022-01-12 13:01:07'),
(182, 'red', 1, 27, '2022-01-12 13:01:07', '2022-01-12 13:01:07'),
(183, 'big', 2, 27, '2022-01-12 13:01:07', '2022-01-12 13:01:07'),
(184, 'small', 2, 27, '2022-01-12 13:01:07', '2022-01-12 13:01:07'),
(185, 'lerge', 2, 27, '2022-01-12 13:01:07', '2022-01-12 13:01:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_variant_prices`
--

CREATE TABLE `product_variant_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_variant_one` bigint(20) UNSIGNED DEFAULT NULL,
  `product_variant_two` bigint(20) UNSIGNED DEFAULT NULL,
  `product_variant_three` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variant_prices`
--

INSERT INTO `product_variant_prices` (`id`, `product_variant_one`, `product_variant_two`, `product_variant_three`, `price`, `stock`, `product_id`, `created_at`, `updated_at`) VALUES
(76, 80, 82, 84, 25, 10, 15, '2022-01-12 04:48:01', '2022-01-12 04:48:01'),
(77, 80, NULL, 84, 22, 15, 15, '2022-01-12 04:48:01', '2022-01-12 04:48:01'),
(78, 81, 82, 84, 23, 15, 15, '2022-01-12 04:48:01', '2022-01-12 04:48:01'),
(79, 81, NULL, 84, 28, 28, 15, '2022-01-12 04:48:01', '2022-01-12 04:48:01'),
(80, 85, 87, 89, 25, 10, 16, '2022-01-12 04:48:29', '2022-01-12 04:48:29'),
(81, 85, NULL, 89, 22, 15, 16, '2022-01-12 04:48:29', '2022-01-12 04:48:29'),
(82, 86, 87, 89, 23, 15, 16, '2022-01-12 04:48:29', '2022-01-12 04:48:29'),
(83, 86, NULL, 89, 28, 28, 16, '2022-01-12 04:48:29', '2022-01-12 04:48:29'),
(84, 90, 92, 94, 25, 10, 17, '2022-01-12 04:49:23', '2022-01-12 04:49:23'),
(85, 90, NULL, 94, 22, 15, 17, '2022-01-12 04:49:23', '2022-01-12 04:49:23'),
(86, 91, 92, 94, 23, 15, 17, '2022-01-12 04:49:23', '2022-01-12 04:49:23'),
(87, 91, NULL, 94, 28, 28, 17, '2022-01-12 04:49:23', '2022-01-12 04:49:23'),
(88, 95, 97, 99, 25, 10, 18, '2022-01-12 04:50:38', '2022-01-12 04:50:38'),
(89, 95, 98, 99, 15, 36, 18, '2022-01-12 04:50:38', '2022-01-12 04:50:38'),
(90, 96, 97, 99, 15, 20, 18, '2022-01-12 04:50:38', '2022-01-12 04:50:38'),
(91, 96, 98, 99, 25, 45, 18, '2022-01-12 04:50:38', '2022-01-12 04:50:38'),
(92, 100, 102, NULL, 10, 10, 19, '2022-01-12 04:53:07', '2022-01-12 04:53:07'),
(93, 100, NULL, NULL, 11, 25, 19, '2022-01-12 04:53:07', '2022-01-12 04:53:07'),
(94, 101, 102, NULL, 12, 10, 19, '2022-01-12 04:53:07', '2022-01-12 04:53:07'),
(95, 101, NULL, NULL, 13, 12, 19, '2022-01-12 04:53:07', '2022-01-12 04:53:07'),
(96, 104, 106, NULL, 15, 0, 20, '2022-01-12 04:57:01', '2022-01-12 04:57:01'),
(98, 105, 106, NULL, 8, 0, 20, '2022-01-12 04:57:01', '2022-01-12 04:57:01'),
(137, 145, 147, NULL, 5, 10, 24, '2022-01-12 12:51:22', '2022-01-12 12:51:22'),
(138, 145, 148, NULL, 12, 10, 24, '2022-01-12 12:51:22', '2022-01-12 12:51:22'),
(139, 145, 149, NULL, 10, 12, 24, '2022-01-12 12:51:22', '2022-01-12 12:51:22'),
(140, 146, 147, NULL, 12, 13, 24, '2022-01-12 12:51:22', '2022-01-12 12:51:22'),
(141, 146, 148, NULL, 10, 14, 24, '2022-01-12 12:51:22', '2022-01-12 12:51:22'),
(142, 146, 149, NULL, 18, 20, 24, '2022-01-12 12:51:22', '2022-01-12 12:51:22'),
(143, 150, 152, NULL, 12, 5, 26, '2022-01-12 12:51:45', '2022-01-12 12:51:45'),
(144, 150, 153, NULL, 12, 4, 26, '2022-01-12 12:51:45', '2022-01-12 12:51:45'),
(145, 150, 154, NULL, 0, 0, 26, '2022-01-12 12:51:45', '2022-01-12 12:51:45'),
(146, 151, 152, NULL, 11, 12, 26, '2022-01-12 12:51:45', '2022-01-12 12:51:45'),
(147, 151, 153, NULL, 12, 12, 26, '2022-01-12 12:51:45', '2022-01-12 12:51:45'),
(148, 151, 154, NULL, 0, 0, 26, '2022-01-12 12:51:45', '2022-01-12 12:51:45'),
(149, 155, 157, NULL, 10, 12, 25, '2022-01-12 12:52:19', '2022-01-12 12:52:19'),
(150, 155, 158, NULL, 15, 12, 25, '2022-01-12 12:52:19', '2022-01-12 12:52:19'),
(151, 156, 157, NULL, 15, 13, 25, '2022-01-12 12:52:19', '2022-01-12 12:52:19'),
(152, 156, 158, NULL, 19, 7, 25, '2022-01-12 12:52:19', '2022-01-12 12:52:19'),
(157, 163, 165, NULL, 10, 12, 14, '2022-01-12 12:53:14', '2022-01-12 12:53:14'),
(158, 163, 166, NULL, 15, 10, 14, '2022-01-12 12:53:14', '2022-01-12 12:53:14'),
(159, 164, 165, NULL, 12, 12, 14, '2022-01-12 12:53:14', '2022-01-12 12:53:14'),
(160, 164, 166, NULL, 5, 10, 14, '2022-01-12 12:53:14', '2022-01-12 12:53:14'),
(167, 172, 175, NULL, 150, 150, 1, '2022-01-12 12:54:26', '2022-01-12 12:54:26'),
(168, 172, 176, NULL, 15, 54, 1, '2022-01-12 12:54:26', '2022-01-12 12:54:26'),
(169, 173, 175, NULL, 54, 45, 1, '2022-01-12 12:54:26', '2022-01-12 12:54:26'),
(170, 173, 176, NULL, 45, 45, 1, '2022-01-12 12:54:26', '2022-01-12 12:54:26'),
(171, 174, 175, NULL, 45, 54, 1, '2022-01-12 12:54:26', '2022-01-12 12:54:26'),
(172, 174, 176, NULL, 54, 54, 1, '2022-01-12 12:54:26', '2022-01-12 12:54:26'),
(177, 181, 183, NULL, 10, 1, 27, '2022-01-12 13:01:07', '2022-01-12 13:01:07'),
(178, 181, 184, NULL, 12, 5, 27, '2022-01-12 13:01:07', '2022-01-12 13:01:07'),
(179, 181, 185, NULL, 12, 10, 27, '2022-01-12 13:01:07', '2022-01-12 13:01:07'),
(180, 182, 183, NULL, 10, 36, 27, '2022-01-12 13:01:07', '2022-01-12 13:01:07'),
(181, 182, 184, NULL, 10, 52, 27, '2022-01-12 13:01:07', '2022-01-12 13:01:07'),
(182, 182, 185, NULL, 10, 5, 27, '2022-01-12 13:01:07', '2022-01-12 13:01:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@example.com', NULL, '$2a$12$/52ZpFcCSPfIhX5spRvYIuhG0qBn4ne786MC2dVXbA7l0Tt1EbS3W', '5VdDBxVvu5M4vufZaEDSEji2LLUvEklniNvMToi32yhCD4Q45HNubQIj4mli', '2020-08-28 00:03:42', '2020-08-28 00:03:42');

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Color', 'asdfadsf', NULL, '2020-08-31 08:53:32'),
(2, 'Size', 'adfsasdf', NULL, '2020-08-31 08:54:28'),
(6, 'Style', 'Description', '2020-08-31 09:46:24', '2020-08-31 09:46:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogs_blog_category_id_foreign` (`blog_category_id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_categories_slug_unique` (`slug`);

--
-- Indexes for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_tags_blog_id_foreign` (`blog_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variants_variant_id_foreign` (`variant_id`),
  ADD KEY `product_variants_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_variant_prices`
--
ALTER TABLE `product_variant_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variant_prices_product_id_foreign` (`product_id`),
  ADD KEY `product_variant_prices_product_variant_one_foreign` (`product_variant_one`),
  ADD KEY `product_variant_prices_product_variant_two_foreign` (`product_variant_two`),
  ADD KEY `product_variant_prices_product_variant_three_foreign` (`product_variant_three`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `variants_title_unique` (`title`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_tags`
--
ALTER TABLE `blog_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT for table `product_variant_prices`
--
ALTER TABLE `product_variant_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_blog_category_id_foreign` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`);

--
-- Constraints for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD CONSTRAINT `blog_tags_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variants_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variant_prices`
--
ALTER TABLE `product_variant_prices`
  ADD CONSTRAINT `product_variant_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variant_prices_product_variant_one_foreign` FOREIGN KEY (`product_variant_one`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variant_prices_product_variant_three_foreign` FOREIGN KEY (`product_variant_three`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variant_prices_product_variant_two_foreign` FOREIGN KEY (`product_variant_two`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
