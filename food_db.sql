-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2023 at 02:13 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth`
--

CREATE TABLE `auth` (
  `id` int(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `role` int(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `coord_id` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth`
--

INSERT INTO `auth` (`id`, `email`, `password`, `phone_number`, `role`, `address`, `user_name`, `avatar`, `coord_id`, `description`) VALUES
(60, 'ducnguyen@gmail.com', '11111111', '085265247', 1, '101 Cầu Giấy, Cầu Giấy, Hà Nội', 'Nguyễn Văn Đức', 'http://192.168.1.6:3000/uploads/2022-12-28T14-26-23.383Zimage.jpg', 18, ''),
(61, 'longdoi@gmail.com', '11111111', '098563245', 0, 'Nguyễn Cao,  Quận Hai Bà Trưng, Hà Nội', 'Lòng Dồi Nguyệt Béo 1', 'http://192.168.1.6:3000/uploads/2022-12-09T08-58-55.920Zimage.jpg', 19, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(63, 'comtho@gmail.com', '11111111', '032568985', 0, '37 Dương Khuê, P. Mai Dịch, Cầu Giấy, Hà Nội', 'Cơm Thố Anh Nguyễn', 'http://192.168.1.6:3000/uploads/2022-11-29T02-49-00.773Zimg-default.png', 21, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(64, 'linhdan@gmail.com', '123123123', '0325477774', 1, '77 Đặng Văn Ngữ, P. Trung Tự,  Quận Đống Đa, Hà Nội', 'Nguyễn Linh Đan', 'https://jes.edu.vn/wp-content/uploads/2017/10/h%C3%ACnh-%E1%BA%A3nh.jpg', 22, ''),
(66, 'mcdonalds@gmail.com', '123123123', '0985234564', 0, 'Tầng Trệt Tòa Nhà Việt Tower, 1 Thái Hà, P. Trung Liệt, Đống Đa, Hà Nội\n', 'McDonald\'s - Thái Hà', 'https://jes.edu.vn/wp-content/uploads/2017/10/h%C3%ACnh-%E1%BA%A3nh.jpg', 24, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(67, 'chiennguyen@gmail.com', '123123123', '0985326587', 1, '72 Trung Hòa, P. Trung Hoà,  Quận Cầu Giấy, Hà Nội', 'Nguyễn Thanh Chiến', 'https://jes.edu.vn/wp-content/uploads/2017/10/h%C3%ACnh-%E1%BA%A3nh.jpg', 25, ''),
(68, 'hanguyen@gmail.com', '111111111', '0875421645', 1, '72 Trung Hòa, P. Trung Hoà,  Quận Cầu Giấy, Hà Nội', 'Nguyễn Thị Hà', 'http://192.168.1.6:3000/uploads/2022-11-29T02-40-45.713Zimage.jpg', 26, ''),
(69, 'buncha@gmail.com', '11111111', '0895556235', 0, '114A1 Giảng Võ, P. Giảng Võ,  Quận Ba Đình, Hà Nội', 'Bún Chả Sinh Từ', 'http://192.168.1.6:3000/uploads/2022-12-09T09-03-25.697Zbun-cha-truyen-thong.jpg', 27, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(70, 'comnieu@gmail.com', '11111111', '0984512456', 0, '19 Duy Tân, P. Dịch Vọng Hậu,  Quận Cầu Giấy, Hà Nội', 'KOMBO - Cơm Niêu Singapore', 'https://jes.edu.vn/wp-content/uploads/2017/10/h%C3%ACnh-%E1%BA%A3nh.jpg', 28, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(71, 'banhcuon@gmail.com', '111111111', '0985231542', 0, 'Ha Dong 1', 'Banh Quan Nong', 'https://jes.edu.vn/wp-content/uploads/2017/10/h%C3%ACnh-%E1%BA%A3nh.jpg', 29, 'aaaaa'),
(72, 'test@gmail.com', '12345678', '0874564321312', 1, 'test dia chi', 'test', 'https://jes.edu.vn/wp-content/uploads/2017/10/h%C3%ACnh-%E1%BA%A3nh.jpg', 30, ''),
(73, 'test1@gmail.com', '11111111', '0985245125', 1, 'test dia chi', 'testnguoidung', 'https://jes.edu.vn/wp-content/uploads/2017/10/h%C3%ACnh-%E1%BA%A3nh.jpg', 31, ''),
(74, 'cuahang1@gmail.com', '11111111', '098526451', 0, '247 Hoang Hoa Tham', 'cuahang1', 'https://jes.edu.vn/wp-content/uploads/2017/10/h%C3%ACnh-%E1%BA%A3nh.jpg', 32, 'Mieu ta cua cua hang'),
(75, 'nguoidung1@gmail.com', '11111111', '08111111111', 1, 'Vinhome ocenpart', 'nguoidung1', 'http://192.168.1.6:3000/uploads/2023-01-09T03-22-16.806Zimage.jpg', 33, '');

-- --------------------------------------------------------

--
-- Table structure for table `coords`
--

CREATE TABLE `coords` (
  `id` int(11) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coords`
--

INSERT INTO `coords` (`id`, `latitude`, `longitude`) VALUES
(18, '21.011649244116043', '105.78676074743271'),
(19, '21.040598906722018', '105.75784653425217'),
(20, '2', '2'),
(21, '21.030842977650373', '105.770232911646'),
(22, '37.4219983', '-122.084'),
(23, '37.41767517009988', '-122.1433775871992'),
(24, '37.4219983', '-122.084'),
(25, '37.43689132193069', '-122.04304687678814'),
(26, '37.43545826164708', '-122.15697772800921'),
(27, '37.415659362312425', '-122.05994278192522'),
(28, '21.03047', '105.76753'),
(29, '21.02741', '105.80281'),
(30, '37.4220936', '-122.083922'),
(31, '37.4220936', '-122.083922'),
(32, '37.42154899025364', '-122.09499020129444'),
(33, '37.409125322310786', '-122.11280409246682');

-- --------------------------------------------------------

--
-- Table structure for table `dish`
--

CREATE TABLE `dish` (
  `id` int(100) NOT NULL,
  `id_shop` int(100) NOT NULL,
  `name` varchar(200) NOT NULL,
  `price` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `images` varchar(800) NOT NULL,
  `create_at` datetime NOT NULL,
  `percent_discount` varchar(100) NOT NULL,
  `sold_out` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dish`
--

INSERT INTO `dish` (`id`, `id_shop`, `name`, `price`, `description`, `images`, `create_at`, `percent_discount`, `sold_out`) VALUES
(70, 61, 'Lòng đặc biệt', '65000', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 'http://192.168.1.6:3000/uploads/2022-12-09T08-48-34.327Z00a8953f-9ffe-4336-abec-0236b1f2ea5c.jpeg', '2022-12-09 15:48:34', '0', 0),
(71, 61, 'Lòng truyền thống', '60000', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 'http://192.168.1.6:3000/uploads/2022-12-09T08-31-53.150Zlong-doi2.jpg', '2022-12-09 15:31:53', '5', 0),
(73, 69, 'Bún chả đặc biệt', '80000', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 'http://192.168.1.6:3000/uploads/2022-12-09T09-17-24.148Zbun-cha-dac-biet.jpg', '2022-12-28 22:29:38', '0', 1),
(74, 69, 'Bún nem', '65000', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 'http://192.168.1.6:3000/uploads/2022-12-09T09-17-43.254Zbun-nem.jpg', '2023-01-09 19:12:31', '0', 0),
(75, 69, 'Bún chả truyền thống', '70000', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 'http://192.168.1.6:3000/uploads/2022-12-09T09-18-09.898Zbun-cha-truyen-thong.jpg', '2023-01-09 10:33:51', '2', 0),
(77, 63, 'Cơm thố bò + xá xíu', '60000', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 'http://192.168.1.6:3000/uploads/2022-12-09T09-23-09.737Zcom-tho-bo+xa-xiu.jpeg', '2022-12-09 16:23:09', '0', 0),
(78, 63, 'Cơm thố xá xíu', '45000', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 'http://192.168.1.6:3000/uploads/2022-12-09T09-23-35.531Zcom-tho-xa-xiu.jpeg', '2022-12-09 16:23:35', '0', 0),
(79, 63, 'Cơm thố gà', '50000', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 'http://192.168.1.6:3000/uploads/2022-12-09T09-23-50.971Zcom-tho-ga.jpeg', '2022-12-09 16:23:50', '0', 0),
(80, 63, 'Cơm thố đặc biệt', '60000', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 'http://192.168.1.6:3000/uploads/2022-12-09T09-24-08.632Zcom-tho-dac-biet.jpeg', '2022-12-09 16:24:08', '5', 0),
(82, 69, 'Bun cha ngon', '65000', 'Day la mon an ngon', 'http://192.168.1.6:3000/uploads/2023-01-09T03-34-50.269Z75e72b28-c182-4ff2-8114-e4526845af41.jpeg', '2023-01-09 10:34:50', '10', 0),
(84, 74, 'Mon an ngon', '25000', 'Mo ta mon an ngon', 'http://192.168.1.6:3000/uploads/2023-01-09T11-51-11.294Zd9d9f199-9b2c-40e0-8a1b-557639c23ce5.jpeg', '2023-01-09 18:51:11', '5', 0);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `id_orderDish` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_dish` int(11) NOT NULL,
  `ordered_time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  `sold_out` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `id_orderDish`, `id_customer`, `id_dish`, `ordered_time`, `status`, `amount`, `id_shop`, `sold_out`) VALUES
(382, 133, 67, 70, '2022-12-09 15:34:26', 1, 2, 61, 0),
(383, 134, 67, 71, '2022-12-09 15:34:47', 1, 2, 61, 0),
(384, 134, 67, 71, '2022-12-09 15:39:25', 2, 2, 61, 0),
(385, 133, 67, 70, '2022-12-09 15:41:07', 2, 2, 61, 0),
(386, 135, 60, 71, '2022-12-09 15:43:12', 1, 2, 61, 0),
(387, 136, 60, 70, '2022-12-09 15:43:15', 1, 2, 61, 0),
(388, 135, 60, 71, '2022-12-09 15:43:59', 0, 2, 61, 0),
(389, 135, 60, 71, '2022-12-09 15:44:27', 1, 2, 61, 0),
(390, 135, 60, 71, '2022-12-09 15:51:22', 4, 2, 61, 0),
(391, 136, 60, 70, '2022-12-09 15:51:56', 4, 2, 61, 0),
(392, 136, 60, 70, '2022-12-09 16:14:24', 1, 1, 61, 0),
(393, 137, 60, 73, '2022-12-28 14:37:52', 1, 1, 69, 1),
(394, 137, 60, 73, '2022-12-28 14:37:56', 1, 1, 69, 1),
(395, 138, 60, 74, '2022-12-28 21:26:40', 1, 2, 69, 1),
(396, 138, 60, 74, '2022-12-28 21:26:54', 0, 2, 69, 0),
(397, 137, 60, 73, '2022-12-28 21:28:17', 2, 1, 69, 0),
(398, 137, 60, 73, '2022-12-28 21:28:43', 3, 1, 69, 0),
(399, 137, 60, 73, '2022-12-28 22:28:45', 4, 1, 69, 0),
(400, 137, 60, 73, '2022-12-28 22:28:48', 1, 3, 69, 1),
(401, 139, 75, 75, '2023-01-09 10:15:27', 1, 2, 69, 1),
(402, 139, 75, 75, '2023-01-09 10:15:45', 0, 2, 69, 0),
(403, 139, 75, 75, '2023-01-09 10:15:53', 1, 2, 69, 1),
(405, 137, 60, 73, '2022-12-28 22:28:48', 1, 3, 69, 1),
(406, 137, 60, 73, '2022-12-28 22:28:48', 1, 3, 69, 1),
(408, 137, 60, 73, '2022-12-28 22:28:48', 1, 3, 69, 1),
(409, 137, 60, 73, '2022-12-28 22:28:48', 5, 3, 69, 1),
(410, 137, 60, 73, '2022-12-28 22:28:48', 5, 3, 69, 1),
(411, 137, 60, 73, '2022-12-28 22:28:48', 5, 3, 69, 1),
(412, 137, 60, 73, '2022-12-28 22:28:48', 5, 3, 69, 1),
(413, 137, 60, 73, '2022-12-28 22:28:48', 5, 3, 69, 1),
(414, 137, 60, 73, '2022-12-28 22:28:48', 5, 3, 69, 1),
(415, 137, 60, 73, '2022-12-28 22:28:48', 5, 3, 69, 1),
(416, 137, 60, 73, '2022-12-28 22:28:48', 5, 3, 69, 1),
(417, 137, 60, 73, '2022-12-28 22:28:48', 5, 3, 69, 1),
(418, 137, 60, 73, '2022-12-28 22:28:48', 5, 3, 69, 1),
(419, 137, 60, 73, '2023-01-09 16:40:13', 0, 3, 69, 0),
(420, 137, 60, 73, '2023-01-09 16:40:24', 1, 1, 69, 1),
(421, 137, 60, 73, '2023-01-09 16:40:30', 0, 1, 69, 0),
(422, 137, 60, 73, '2023-01-09 16:42:15', 1, 1, 69, 1),
(423, 137, 60, 73, '2023-01-09 16:42:15', 5, 1, 69, 1),
(424, 137, 60, 73, '2023-01-09 16:43:12', 0, 1, 69, 0),
(425, 140, 60, 75, '2023-01-09 17:24:27', 1, 1, 69, 1),
(426, 140, 60, 75, '2023-01-09 17:24:27', 5, 1, 69, 1),
(427, 140, 60, 75, '2023-01-09 17:26:01', 0, 1, 69, 0),
(428, 138, 60, 74, '2023-01-09 17:30:45', 1, 1, 69, 1),
(429, 138, 60, 74, '2023-01-09 17:30:45', 5, 1, 69, 1),
(430, 140, 60, 75, '2023-01-09 17:39:28', 1, 1, 69, 1),
(431, 140, 60, 75, '2023-01-09 17:40:07', 2, 1, 69, 0),
(432, 138, 60, 74, '2023-01-09 17:46:52', 2, 1, 69, 0),
(433, 138, 60, 74, '2023-01-09 17:46:59', 3, 1, 69, 0),
(434, 138, 60, 74, '2023-01-09 17:49:28', 4, 1, 69, 0),
(435, 137, 60, 73, '2023-01-09 17:50:15', 1, 1, 69, 1),
(436, 138, 60, 74, '2023-01-09 17:50:20', 1, 1, 69, 1),
(437, 138, 60, 74, '2023-01-09 17:51:11', 2, 1, 69, 0),
(438, 137, 60, 73, '2023-01-09 17:50:15', 5, 1, 69, 1),
(439, 137, 60, 73, '2023-01-09 17:50:15', 5, 1, 69, 1),
(440, 137, 60, 73, '2023-01-09 17:52:09', 2, 1, 69, 0),
(441, 141, 60, 82, '2023-01-09 17:52:39', 1, 1, 69, 1),
(442, 141, 60, 82, '2023-01-09 17:52:40', 1, 1, 69, 1),
(443, 142, 75, 82, '2023-01-09 17:53:01', 1, 1, 69, 1),
(444, 141, 60, 82, '2023-01-09 17:53:22', 2, 1, 69, 0),
(445, 142, 75, 82, '2023-01-09 17:53:01', 5, 1, 69, 1),
(446, 142, 75, 82, '2023-01-09 17:53:01', 5, 1, 69, 1),
(447, 142, 75, 82, '2023-01-09 17:53:01', 5, 1, 69, 1),
(448, 142, 75, 82, '2023-01-09 17:53:01', 5, 1, 69, 1),
(449, 142, 75, 82, '2023-01-09 17:53:01', 5, 1, 69, 1),
(450, 142, 75, 82, '2023-01-09 17:53:01', 5, 1, 69, 1),
(451, 142, 75, 82, '2023-01-09 17:53:01', 5, 1, 69, 1),
(452, 142, 75, 82, '2023-01-09 18:26:10', 0, 1, 69, 0),
(453, 142, 75, 82, '2023-01-09 18:33:30', 1, 1, 69, 1),
(454, 142, 75, 82, '2023-01-09 18:33:30', 5, 1, 69, 1),
(455, 141, 60, 82, '2023-01-09 18:36:09', 3, 1, 69, 0),
(456, 141, 60, 82, '2023-01-09 18:36:33', 4, 1, 69, 0),
(457, 142, 75, 82, '2023-01-09 18:37:31', 0, 1, 69, 0),
(458, 143, 75, 73, '2023-01-09 18:37:38', 1, 1, 69, 1),
(459, 143, 75, 73, '2023-01-09 18:37:38', 5, 1, 69, 1),
(460, 143, 75, 73, '2023-01-09 18:38:49', 0, 1, 69, 0),
(461, 143, 75, 73, '2023-01-09 18:39:37', 1, 1, 69, 1),
(462, 143, 75, 73, '2023-01-09 18:39:37', 5, 1, 69, 1),
(463, 143, 75, 73, '2023-01-09 18:39:37', 5, 1, 69, 1),
(464, 143, 75, 73, '2023-01-09 18:39:37', 5, 1, 69, 1),
(465, 138, 60, 74, '2023-01-09 19:06:09', 3, 1, 69, 0),
(466, 138, 60, 74, '2023-01-09 19:06:34', 4, 1, 69, 0);

-- --------------------------------------------------------

--
-- Table structure for table `orderdish`
--

CREATE TABLE `orderdish` (
  `id` int(11) NOT NULL,
  `id_dish` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `ordered_time` datetime NOT NULL,
  `amount` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdish`
--

INSERT INTO `orderdish` (`id`, `id_dish`, `id_customer`, `ordered_time`, `amount`, `status`, `id_shop`) VALUES
(133, 70, 67, '2022-12-09 15:34:26', 2, 2, 61),
(134, 71, 67, '2022-12-09 15:34:47', 2, 2, 61),
(135, 71, 60, '2022-12-09 15:44:27', 2, 4, 61),
(136, 70, 60, '2022-12-09 16:14:24', 1, 1, 61),
(137, 73, 60, '2023-01-09 17:50:15', 1, 2, 69),
(138, 74, 60, '2023-01-09 17:50:20', 1, 4, 69),
(139, 75, 75, '2023-01-09 10:15:53', 2, 2, 69),
(140, 75, 60, '2023-01-09 17:39:28', 1, 2, 69),
(141, 82, 60, '2023-01-09 17:52:40', 1, 4, 69),
(142, 82, 75, '2023-01-09 18:33:30', 1, 0, 69),
(143, 73, 75, '2023-01-09 18:39:37', 1, 1, 69);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth`
--
ALTER TABLE `auth`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coord_id` (`coord_id`);

--
-- Indexes for table `coords`
--
ALTER TABLE `coords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish`
--
ALTER TABLE `dish`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_shop` (`id_shop`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_dish` (`id_dish`),
  ADD KEY `id_shop` (`id_shop`),
  ADD KEY `id_orderDish` (`id_orderDish`);

--
-- Indexes for table `orderdish`
--
ALTER TABLE `orderdish`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_dish` (`id_dish`),
  ADD KEY `id_shop` (`id_shop`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth`
--
ALTER TABLE `auth`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `coords`
--
ALTER TABLE `coords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `dish`
--
ALTER TABLE `dish`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=467;

--
-- AUTO_INCREMENT for table `orderdish`
--
ALTER TABLE `orderdish`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth`
--
ALTER TABLE `auth`
  ADD CONSTRAINT `auth_ibfk_1` FOREIGN KEY (`coord_id`) REFERENCES `coords` (`id`);

--
-- Constraints for table `dish`
--
ALTER TABLE `dish`
  ADD CONSTRAINT `dish_ibfk_1` FOREIGN KEY (`id_shop`) REFERENCES `auth` (`id`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `auth` (`id`),
  ADD CONSTRAINT `notification_ibfk_3` FOREIGN KEY (`id_dish`) REFERENCES `dish` (`id`),
  ADD CONSTRAINT `notification_ibfk_4` FOREIGN KEY (`id_shop`) REFERENCES `auth` (`id`),
  ADD CONSTRAINT `notification_ibfk_5` FOREIGN KEY (`id_orderDish`) REFERENCES `orderdish` (`id`);

--
-- Constraints for table `orderdish`
--
ALTER TABLE `orderdish`
  ADD CONSTRAINT `orderdish_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `auth` (`id`),
  ADD CONSTRAINT `orderdish_ibfk_3` FOREIGN KEY (`id_dish`) REFERENCES `dish` (`id`),
  ADD CONSTRAINT `orderdish_ibfk_4` FOREIGN KEY (`id_shop`) REFERENCES `auth` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
