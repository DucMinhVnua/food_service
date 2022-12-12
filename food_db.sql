-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 09, 2022 lúc 10:53 AM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `food_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `auth`
--

INSERT INTO `auth` (`id`, `email`, `password`, `phone_number`, `role`, `address`, `user_name`, `avatar`, `coord_id`, `description`) VALUES
(60, 'ducnguyen@gmail.com', '123456789', '085265247', 1, '101 Cầu Giấy, Cầu Giấy, Hà Nội', 'Nguyễn Văn Đức', 'http://10.1.30.89:3000/uploads/2022-12-07T07-31-59.282Zimage.jpg', 18, ''),
(61, 'longdoi@gmail.com', '11111111', '098563245', 0, 'Nguyễn Cao,  Quận Hai Bà Trưng, Hà Nội', 'Lòng Dồi Nguyệt Béo 1', 'http://10.1.30.89:3000/uploads/2022-12-09T08-58-55.920Zimage.jpg', 19, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(63, 'comtho@gmail.com', '11111111', '032568985', 0, '37 Dương Khuê, P. Mai Dịch, Cầu Giấy, Hà Nội', 'Cơm Thố Anh Nguyễn', 'http://10.1.30.89:3000/uploads/2022-11-29T02-49-00.773Zimg-default.png', 21, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(64, 'linhdan@gmail.com', '123123123', '0325477774', 1, '77 Đặng Văn Ngữ, P. Trung Tự,  Quận Đống Đa, Hà Nội', 'Nguyễn Linh Đan', 'https://jes.edu.vn/wp-content/uploads/2017/10/h%C3%ACnh-%E1%BA%A3nh.jpg', 22, ''),
(66, 'mcdonalds@gmail.com', '123123123', '0985234564', 0, 'Tầng Trệt Tòa Nhà Việt Tower, 1 Thái Hà, P. Trung Liệt, Đống Đa, Hà Nội\n', 'McDonald\'s - Thái Hà', 'https://jes.edu.vn/wp-content/uploads/2017/10/h%C3%ACnh-%E1%BA%A3nh.jpg', 24, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(67, 'chiennguyen@gmail.com', '123123123', '0985326587', 1, '72 Trung Hòa, P. Trung Hoà,  Quận Cầu Giấy, Hà Nội', 'Nguyễn Thanh Chiến', 'https://jes.edu.vn/wp-content/uploads/2017/10/h%C3%ACnh-%E1%BA%A3nh.jpg', 25, ''),
(68, 'hanguyen@gmail.com', '111111111', '0875421645', 1, '72 Trung Hòa, P. Trung Hoà,  Quận Cầu Giấy, Hà Nội', 'Nguyễn Thị Hà', 'http://10.1.30.89:3000/uploads/2022-11-29T02-40-45.713Zimage.jpg', 26, ''),
(69, 'buncha@gmail.com', '11111111', '0895556235', 0, '114A1 Giảng Võ, P. Giảng Võ,  Quận Ba Đình, Hà Nội', 'Bún Chả Sinh Từ', 'http://10.1.30.89:3000/uploads/2022-12-09T09-03-25.697Zbun-cha-truyen-thong.jpg', 27, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(70, 'comnieu@gmail.com', '11111111', '0984512456', 0, '19 Duy Tân, P. Dịch Vọng Hậu,  Quận Cầu Giấy, Hà Nội', 'KOMBO - Cơm Niêu Singapore', 'https://jes.edu.vn/wp-content/uploads/2017/10/h%C3%ACnh-%E1%BA%A3nh.jpg', 28, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(71, 'banhcuon@gmail.com', '111111111', '0985231542', 0, 'Ha Dong 1', 'Banh Quan Nong', 'https://jes.edu.vn/wp-content/uploads/2017/10/h%C3%ACnh-%E1%BA%A3nh.jpg', 29, 'aaaaa');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coords`
--

CREATE TABLE `coords` (
  `id` int(11) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `coords`
--

INSERT INTO `coords` (`id`, `latitude`, `longitude`) VALUES
(18, '21.005140956901943', '105.77942743959939'),
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
(29, '21.02741', '105.80281');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dish`
--

CREATE TABLE `dish` (
  `id` int(100) NOT NULL,
  `id_shop` int(100) NOT NULL,
  `name` varchar(200) NOT NULL,
  `price` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `images` varchar(800) NOT NULL,
  `create_at` datetime NOT NULL,
  `percent_discount` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `dish`
--

INSERT INTO `dish` (`id`, `id_shop`, `name`, `price`, `description`, `images`, `create_at`, `percent_discount`) VALUES
(70, 61, 'Lòng đặc biệt', '65000', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 'http://10.1.30.89:3000/uploads/2022-12-09T08-48-34.327Z00a8953f-9ffe-4336-abec-0236b1f2ea5c.jpeg', '2022-12-09 15:48:34', '0'),
(71, 61, 'Lòng truyền thống', '60000', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 'http://10.1.30.89:3000/uploads/2022-12-09T08-31-53.150Zlong-doi2.jpg', '2022-12-09 15:31:53', '5'),
(73, 69, 'Bún chả đặc biệt', '70000', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 'http://10.1.30.89:3000/uploads/2022-12-09T09-17-24.148Zbun-cha-dac-biet.jpg', '2022-12-09 16:17:24', '0'),
(74, 69, 'Bún nem', '65000', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 'http://10.1.30.89:3000/uploads/2022-12-09T09-17-43.254Zbun-nem.jpg', '2022-12-09 16:17:43', '0'),
(75, 69, 'Bún chả truyền thống', '70000', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 'http://10.1.30.89:3000/uploads/2022-12-09T09-18-09.898Zbun-cha-truyen-thong.jpg', '2022-12-09 16:18:09', '5'),
(76, 69, 'Bún chả trộn', '60000', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 'http://10.1.30.89:3000/uploads/2022-12-09T09-18-34.163Zbun-cha-tron.jpeg', '2022-12-09 16:18:34', '0'),
(77, 63, 'Cơm thố bò + xá xíu', '60000', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 'http://10.1.30.89:3000/uploads/2022-12-09T09-23-09.737Zcom-tho-bo+xa-xiu.jpeg', '2022-12-09 16:23:09', '0'),
(78, 63, 'Cơm thố xá xíu', '45000', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 'http://10.1.30.89:3000/uploads/2022-12-09T09-23-35.531Zcom-tho-xa-xiu.jpeg', '2022-12-09 16:23:35', '0'),
(79, 63, 'Cơm thố gà', '50000', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 'http://10.1.30.89:3000/uploads/2022-12-09T09-23-50.971Zcom-tho-ga.jpeg', '2022-12-09 16:23:50', '0'),
(80, 63, 'Cơm thố đặc biệt', '60000', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 'http://10.1.30.89:3000/uploads/2022-12-09T09-24-08.632Zcom-tho-dac-biet.jpeg', '2022-12-09 16:24:08', '5');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `id_orderDish` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_dish` int(11) NOT NULL,
  `ordered_time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `notification`
--

INSERT INTO `notification` (`id`, `id_orderDish`, `id_customer`, `id_dish`, `ordered_time`, `status`, `amount`, `id_shop`) VALUES
(382, 133, 67, 70, '2022-12-09 15:34:26', 1, 2, 61),
(383, 134, 67, 71, '2022-12-09 15:34:47', 1, 2, 61),
(384, 134, 67, 71, '2022-12-09 15:39:25', 2, 2, 61),
(385, 133, 67, 70, '2022-12-09 15:41:07', 2, 2, 61),
(386, 135, 60, 71, '2022-12-09 15:43:12', 1, 2, 61),
(387, 136, 60, 70, '2022-12-09 15:43:15', 1, 2, 61),
(388, 135, 60, 71, '2022-12-09 15:43:59', 0, 2, 61),
(389, 135, 60, 71, '2022-12-09 15:44:27', 1, 2, 61),
(390, 135, 60, 71, '2022-12-09 15:51:22', 4, 2, 61),
(391, 136, 60, 70, '2022-12-09 15:51:56', 4, 2, 61),
(392, 136, 60, 70, '2022-12-09 16:14:24', 1, 1, 61);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdish`
--

CREATE TABLE `orderdish` (
  `id` int(11) NOT NULL,
  `id_dish` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `ordered_time` datetime NOT NULL,
  `amount` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `orderdish`
--

INSERT INTO `orderdish` (`id`, `id_dish`, `id_customer`, `ordered_time`, `amount`, `status`, `id_shop`) VALUES
(133, 70, 67, '2022-12-09 15:34:26', 2, 2, 61),
(134, 71, 67, '2022-12-09 15:34:47', 2, 2, 61),
(135, 71, 60, '2022-12-09 15:44:27', 2, 4, 61),
(136, 70, 60, '2022-12-09 16:14:24', 1, 1, 61);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `auth`
--
ALTER TABLE `auth`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coord_id` (`coord_id`);

--
-- Chỉ mục cho bảng `coords`
--
ALTER TABLE `coords`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `dish`
--
ALTER TABLE `dish`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_shop` (`id_shop`);

--
-- Chỉ mục cho bảng `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_dish` (`id_dish`),
  ADD KEY `id_shop` (`id_shop`),
  ADD KEY `id_orderDish` (`id_orderDish`);

--
-- Chỉ mục cho bảng `orderdish`
--
ALTER TABLE `orderdish`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_dish` (`id_dish`),
  ADD KEY `id_shop` (`id_shop`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `auth`
--
ALTER TABLE `auth`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT cho bảng `coords`
--
ALTER TABLE `coords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `dish`
--
ALTER TABLE `dish`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT cho bảng `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=393;

--
-- AUTO_INCREMENT cho bảng `orderdish`
--
ALTER TABLE `orderdish`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `auth`
--
ALTER TABLE `auth`
  ADD CONSTRAINT `auth_ibfk_1` FOREIGN KEY (`coord_id`) REFERENCES `coords` (`id`);

--
-- Các ràng buộc cho bảng `dish`
--
ALTER TABLE `dish`
  ADD CONSTRAINT `dish_ibfk_1` FOREIGN KEY (`id_shop`) REFERENCES `auth` (`id`);

--
-- Các ràng buộc cho bảng `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `auth` (`id`),
  ADD CONSTRAINT `notification_ibfk_3` FOREIGN KEY (`id_dish`) REFERENCES `dish` (`id`),
  ADD CONSTRAINT `notification_ibfk_4` FOREIGN KEY (`id_shop`) REFERENCES `auth` (`id`),
  ADD CONSTRAINT `notification_ibfk_5` FOREIGN KEY (`id_orderDish`) REFERENCES `orderdish` (`id`);

--
-- Các ràng buộc cho bảng `orderdish`
--
ALTER TABLE `orderdish`
  ADD CONSTRAINT `orderdish_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `auth` (`id`),
  ADD CONSTRAINT `orderdish_ibfk_3` FOREIGN KEY (`id_dish`) REFERENCES `dish` (`id`),
  ADD CONSTRAINT `orderdish_ibfk_4` FOREIGN KEY (`id_shop`) REFERENCES `auth` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
