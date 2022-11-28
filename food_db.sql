-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 25, 2022 lúc 11:04 AM
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
  `coord_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `auth`
--

INSERT INTO `auth` (`id`, `email`, `password`, `phone_number`, `role`, `address`, `user_name`, `avatar`, `coord_id`) VALUES
(60, 'ndminh2131@gmial.com', '123456789', '0275724367837', 1, '113, Đống Đa, Hà Nội', 'Nguyễn Văn C', 'http://10.1.30.89:3000/uploads/2022-11-24T08-47-13.649Zimage.jpg', 18),
(61, 'minhvnua@gmail.com', '123456789', '02234534534', 0, 'Đông Anh, Hà Nội', 'hello update', 'http://10.1.30.89:3000/uploads/2022-11-25T08-35-57.761Zimage.jpg', 19),
(63, 'minhvnua113@gmail.com', '11111111', '0275724367837', 0, '113, Đống Đa, Hà Nội', 'Nguyễn Văn C', 'http://10.1.30.89:3000/uploads/2022-11-24T08-29-11.041Zimage.jpg', 21),
(64, 'minhndtest@gmail.com', '123123123', '08745121354', 1, 'Ha Noi', 'minhtest', 'https://jes.edu.vn/wp-content/uploads/2017/10/h%C3%ACnh-%E1%BA%A3nh.jpg', 22),
(66, 'minhesmail@gmail.com', '123123123', '098523456456', 0, 'TEFsss', 'aaa', 'https://jes.edu.vn/wp-content/uploads/2017/10/h%C3%ACnh-%E1%BA%A3nh.jpg', 24),
(67, 'dada@gmail.com', '123123123', '0985326587', 1, 'HaNoi1', '12321aaa', 'https://jes.edu.vn/wp-content/uploads/2017/10/h%C3%ACnh-%E1%BA%A3nh.jpg', 25);

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
(19, '21.030133801194047', '105.82908868789673'),
(20, '2', '2'),
(21, '21.010972187564363', '105.78739985752657'),
(22, '37.4219983', '-122.084'),
(23, '37.41767517009988', '-122.1433775871992'),
(24, '37.4219983', '-122.084'),
(25, '37.43689132193069', '-122.04304687678814');

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
(63, 63, 'update pizza', '22222', 'aaaaa', 'http://10.1.30.89:3000/uploads/2022-11-25T10-01-54.725Zdung-than-noi-bo-my-lam-steak.jpg, http://10.1.30.89:3000/uploads/2022-11-25T10-01-54.727Zdung-than-ngoai-bo-my-lam-steak.jpg, http://10.1.30.89:3000/uploads/2022-11-25T10-01-54.728Zsteak.jpg', '2022-11-25 17:01:54', '12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdish`
--

CREATE TABLE `orderdish` (
  `id` int(11) NOT NULL,
  `id_dish` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `ordered_time` date NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Chỉ mục cho bảng `orderdish`
--
ALTER TABLE `orderdish`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_shop` (`id_shop`),
  ADD KEY `id_dish` (`id_dish`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `auth`
--
ALTER TABLE `auth`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT cho bảng `coords`
--
ALTER TABLE `coords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `dish`
--
ALTER TABLE `dish`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT cho bảng `orderdish`
--
ALTER TABLE `orderdish`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- Các ràng buộc cho bảng `orderdish`
--
ALTER TABLE `orderdish`
  ADD CONSTRAINT `orderdish_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `auth` (`id`),
  ADD CONSTRAINT `orderdish_ibfk_2` FOREIGN KEY (`id_shop`) REFERENCES `auth` (`id`),
  ADD CONSTRAINT `orderdish_ibfk_3` FOREIGN KEY (`id_dish`) REFERENCES `dish` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;