-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2024 at 03:41 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `licera`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `address_id` int(11) NOT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `country` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`address_id`, `street`, `city`, `state`, `zip`, `country`, `created_at`, `payment_id`) VALUES
(22, 'PH 1 San Miguel', 'MANOLO FORTICH', 'BUKIDNON', '8703', 'Philippines', '2024-06-04 01:28:05', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `product_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `product_name`, `price`, `total`, `payment_method`, `created_at`, `product_id`) VALUES
(34, 'Apple iPhone 14 Pro', 2000.00, 2000.00, 'GCash', '2024-06-04 01:27:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `rrp` decimal(10,0) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL,
  `img` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `description`, `price`, `rrp`, `quantity`, `img`, `date_added`, `user_id`) VALUES
(1, 'Apple iPhone 14 Pro', 'The iPhone 14 Pro features a 6.1-inch Super Retina XDR display. A16 Bionic chip and a triple camera system with 12MP Ultra Wide and Telephoto lenses.It offers exceptional performance camera capabilities and a refined iOS experience.', 1500, 2000, 100, 'https://imgs.search.brave.com/t1ygAlw3pKWc1MUDj5wL3qwvWNFbu0hNGS-TAwXDzdk/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/MzFjVjFEbm84cEwu/anBn', '2024-05-08 00:00:00', 0),
(2, 'Samsung Galaxy S23 Ultra', 'The Samsung Galaxy S23 Ultra boasts a 6.8-inch Dynamic AMOLED 2X display with a 120Hz refresh rate Snapdragon 8 Gen 2 processor and a quad camera setup including a 200MP main sensor. It also supports the S Pen and delivers top-tier performance and versatility.', 3000, 4000, 150, 'https://imgs.search.brave.com/mjCQQzBNgf4efZ6YeveHxkb5EOPQgjCI-rAT2BTQcUA/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9jZG4u/bW9zLmNtcy5mdXR1/cmVjZG4ubmV0L2d4/NTVic3p4V0dHM0FI/Wk1XRGJTU1gtMzIw/LTgwLmpwZw', '2024-05-08 00:00:00', 0),
(3, 'Google Pixel 7 Pro', 'The Google Pixel 7 Pro features a 6.7-inch LTPO OLED display the Google Tensor G2 processor and a triple camera setup with 50MP main 12MP ultra-wide and 48MP telephoto lenses. Known for its superior camera capabilities and clean Android experience.', 10000, 13000, 200, 'https://imgs.search.brave.com/2o9Hqj9FQQUvSeTdgvzmr1eLYZV0CTU7I3efchqWU3M/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9jbGVh/cmJ1eS1jbG91ZC5u/eWMzLmRpZ2l0YWxv/Y2VhbnNwYWNlcy5j/b20vbWVkaWEvNTgy/OS9Hb29nbGUtUGl4/ZWwtNy1Qcm8uanBn', '2024-05-08 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `created_at`) VALUES
(5, 'Eva', '$2y$10$eEFJ05.E0F2JAQ9D3qnOIeTDLxvaqiA7JG3LmzOVje/kW./m68pTa', '2024-06-04 09:29:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
