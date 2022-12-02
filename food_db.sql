-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 02, 2022 lúc 11:33 AM
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
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `auth`
--

INSERT INTO `auth` (`id`, `email`, `password`, `phone_number`, `role`, `address`, `user_name`, `avatar`, `coord_id`, `description`) VALUES
(60, 'ndminh2131@gmial.com', '123456789', '0275724367837', 1, '113, Đống Đa, Hà Nội', 'Nguyễn Văn C', 'http://10.1.30.89:3000/uploads/2022-11-24T08-47-13.649Zimage.jpg', 18, ''),
(61, 'minhvnua@gmail.com', '11111111', '0275724367837', 0, '113, Đống Đa, Hà Nội', 'Nguyễn Văn D', 'http://10.1.30.89:3000/uploads/2022-11-29T03-14-57.997Zimage.jpg', 19, ''),
(63, 'minhvnua113@gmail.com', '11111111', '0275724367837', 0, '113, Đống Đa, Hà Nội', 'Nguyễn Văn A', 'http://10.1.30.89:3000/uploads/2022-11-29T02-49-00.773Zimg-default.png', 21, ''),
(64, 'minhndtest@gmail.com', '123123123', '08745121354', 1, 'Ha Noi', 'minhtest', 'https://jes.edu.vn/wp-content/uploads/2017/10/h%C3%ACnh-%E1%BA%A3nh.jpg', 22, ''),
(66, 'minhesmail@gmail.com', '123123123', '098523456456', 0, 'TEFsss', 'aaa', 'https://jes.edu.vn/wp-content/uploads/2017/10/h%C3%ACnh-%E1%BA%A3nh.jpg', 24, ''),
(67, 'dada@gmail.com', '123123123', '0985326587', 1, 'HaNoi1', '12321aaa', 'https://jes.edu.vn/wp-content/uploads/2017/10/h%C3%ACnh-%E1%BA%A3nh.jpg', 25, ''),
(68, 'nguoidung1@gmail.com', '111111111', '0875421645', 1, 'Test dia chi', 'nguoidung2', 'http://10.1.30.89:3000/uploads/2022-11-29T02-40-45.713Zimage.jpg', 26, ''),
(69, '113@gmail.com', '11111111', '0895556235', 0, 'Ha dong, Ha noi', 'Cua hang so 1 nhat ban', 'https://jes.edu.vn/wp-content/uploads/2017/10/h%C3%ACnh-%E1%BA%A3nh.jpg', 27, 'Day la mieu ta cua hang\n');

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
(19, '21.033452848232702', '105.77572513371706'),
(20, '2', '2'),
(21, '21.030842977650373', '105.770232911646'),
(22, '37.4219983', '-122.084'),
(23, '37.41767517009988', '-122.1433775871992'),
(24, '37.4219983', '-122.084'),
(25, '37.43689132193069', '-122.04304687678814'),
(26, '37.43545826164708', '-122.15697772800921'),
(27, '37.415659362312425', '-122.05994278192522');

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
(62, 61, 'Thịt bò bít tết', '100000', 'Món bít tết làm từ thăn lõi nạc vai bò mỹ sẽ cực kỳ  tuyệt vời đấy nhé. Đây là một trong những phần thịt chuyên được dùng làm phile Steak. Tuy thường được sử dụng bằng cách xử lý đơn giản và giá đầy đ', 'http://10.1.30.89:3000/uploads/2022-11-25T08-57-37.579Zdung-than-noi-bo-my-lam-steak.jpg, http://10.1.30.89:3000/uploads/2022-11-25T08-57-37.579Zdung-than-ngoai-bo-my-lam-steak.jpg, http://10.1.30.89:3000/uploads/2022-11-25T08-57-37.580Zsteak.jpg', '2022-11-25 15:57:37', '10'),
(63, 63, 'update pizza', '22222', 'aaaaa', 'http://10.1.30.89:3000/uploads/2022-11-25T10-01-54.725Zdung-than-noi-bo-my-lam-steak.jpg, http://10.1.30.89:3000/uploads/2022-11-25T10-01-54.727Zdung-than-ngoai-bo-my-lam-steak.jpg, http://10.1.30.89:3000/uploads/2022-11-25T10-01-54.728Zsteak.jpg', '2022-11-25 17:01:54', '12'),
(66, 61, 'Mon an B', '50000', 'Mo Ta mon an a', 'http://10.1.30.89:3000/uploads/2022-11-29T02-57-35.951Ze2a40ec3-2e0a-49e9-9894-56c00c411025.jpeg', '2022-11-29 10:15:54', '0'),
(67, 69, 'ALo', '75000', 'mo ta test', 'http://10.1.30.89:3000/uploads/2022-11-29T04-26-16.878Z0da3d3e4-029e-4627-974e-06b66715f5dc.jpeg', '2022-11-29 11:26:16', '5'),
(68, 69, 'AAAAA', '100000', 'hello aadsdasdas', 'http://10.1.30.89:3000/uploads/2022-11-29T04-26-55.942Z45193d1c-96c7-4e1a-a633-e999fc9b4467.jpeg, http://10.1.30.89:3000/uploads/2022-11-29T04-26-55.970Zbb39a634-9aa9-426d-ab2e-ee9dadcc26b8.jpeg, http://10.1.30.89:3000/uploads/2022-11-29T04-26-56.017Zb0b975a8-cde1-483f-bf1f-918f844b0228.jpeg', '2022-11-29 11:26:56', '0');

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
(213, 90, 68, 62, '2022-12-02 16:28:02', 1, 2, 61),
(214, 90, 68, 62, '2022-12-02 16:28:17', 0, 2, 61),
(215, 91, 68, 67, '2022-12-02 16:28:24', 1, 1, 69),
(216, 92, 68, 68, '2022-12-02 16:28:29', 1, 1, 69),
(217, 91, 68, 67, '2022-12-02 16:28:37', 0, 1, 69),
(218, 93, 68, 66, '2022-12-02 16:42:06', 1, 3, 61);

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
(90, 62, 68, '2022-12-02 16:28:02', 2, 0, 61),
(91, 67, 68, '2022-12-02 16:28:24', 1, 0, 69),
(92, 68, 68, '2022-12-02 16:28:29', 1, 1, 69),
(93, 66, 68, '2022-12-02 16:42:06', 3, 1, 61);

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
  ADD KEY `id_orderDish` (`id_orderDish`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_dish` (`id_dish`),
  ADD KEY `id_shop` (`id_shop`);

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
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT cho bảng `coords`
--
ALTER TABLE `coords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `dish`
--
ALTER TABLE `dish`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT cho bảng `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- AUTO_INCREMENT cho bảng `orderdish`
--
ALTER TABLE `orderdish`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

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
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`id_orderDish`) REFERENCES `orderdish` (`id`),
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `auth` (`id`),
  ADD CONSTRAINT `notification_ibfk_3` FOREIGN KEY (`id_dish`) REFERENCES `dish` (`id`),
  ADD CONSTRAINT `notification_ibfk_4` FOREIGN KEY (`id_shop`) REFERENCES `auth` (`id`);

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
