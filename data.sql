-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 11, 2018 lúc 04:36 SA
-- Phiên bản máy phục vụ: 10.1.21-MariaDB
-- Phiên bản PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `internal_tool`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `allocation`
--

CREATE TABLE `allocation` (
  `allocation_id` bigint(20) NOT NULL,
  `allocation_plan` float DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `allocation`
--

INSERT INTO `allocation` (`allocation_id`, `allocation_plan`, `employee_id`, `project_id`, `end_date`, `month`, `start_date`, `year`) VALUES
(1, 13, 196, 56, '2018-05-05', 5, '2018-05-01', 2018),
(2, 13, 196, 165, '2018-05-15', 5, '2018-05-06', 2018),
(3, 13, 196, 56, '2018-05-20', 5, '2018-05-16', 2018),
(6, 0, 196, 56, '2018-05-25', 5, '2018-05-21', 2018),
(7, 0, 196, 56, '2018-05-27', 5, '2018-05-25', 2018),
(8, 0, 196, 56, '2018-05-29', 5, '2018-05-28', 2018),
(9, 0, 196, 56, '2018-06-01', 5, '2018-05-30', 2018),
(10, 0, 196, 56, '2018-06-04', 6, '2018-06-02', 2018),
(11, 0, 196, 56, '2018-06-06', 6, '2018-06-04', 2018),
(12, 0, 196, 56, '2018-06-10', 6, '2018-06-07', 2018),
(13, 0, 196, 56, '2018-06-11', 6, '2018-06-10', 2018),
(14, 0, 196, 56, '2018-06-13', 6, '2018-06-12', 2018),
(15, 0, 196, 56, '2018-06-15', 6, '2018-06-14', 2018),
(16, 0, 196, 56, '2018-06-18', 6, '2018-06-16', 2018),
(17, 0, 196, 56, '2018-06-20', 6, '2018-06-19', 2018),
(18, 0, 196, 56, '2018-06-21', 6, '2018-06-20', 2018),
(19, 0, 196, 56, '2018-06-23', 6, '2018-06-22', 2018),
(20, 0, 196, 56, '2018-06-30', 6, '2018-06-25', 2018),
(21, 0, 196, 56, '2018-07-02', 7, '2018-07-01', 2018),
(22, 0, 196, 56, '2018-07-05', 7, '2018-07-03', 2018),
(23, 0, 196, 56, '2018-07-07', 7, '2018-07-06', 2018),
(24, 0, 196, 56, '2018-07-09', 7, '2018-07-08', 2018),
(25, 0, 196, 56, '2018-07-12', 7, '2018-07-10', 2018),
(26, 0, 196, 56, '2018-07-14', 7, '2018-07-13', 2018),
(27, 0, 196, 56, '2018-07-17', 7, '2018-07-15', 2018),
(28, 100, 196, 56, '2018-07-21', 7, '2018-07-18', 2018),
(29, 0, 196, 56, '2018-07-25', 7, '2018-07-22', 2018),
(30, 0, 196, 56, '2018-07-29', 7, '2018-07-26', 2018),
(31, 0, 196, 56, '2018-08-05', 8, '2018-08-01', 2018),
(32, 0, 196, 56, '2018-08-07', 8, '2018-08-06', 2018),
(43, 26.09, 196, 56, '2018-08-20', 8, '2018-08-11', 2018);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `allocation_detail`
--

CREATE TABLE `allocation_detail` (
  `allocation_detail_id` bigint(20) NOT NULL,
  `date` date DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `allocation_detail`
--

INSERT INTO `allocation_detail` (`allocation_detail_id`, `date`, `employee_id`, `project_id`, `time`) VALUES
(1, '2018-05-10', 6, NULL, 8),
(2, '2018-05-11', 6, NULL, 8),
(3, '2018-05-14', 6, NULL, 8),
(4, '2018-05-15', 6, NULL, 8),
(5, '2018-08-21', 196, NULL, 8),
(6, '2018-08-22', 196, NULL, 8),
(7, '2018-08-23', 196, NULL, 8),
(8, '2018-08-24', 196, NULL, 8),
(9, '2018-08-27', 196, NULL, 8),
(10, '2018-08-29', 196, NULL, 8),
(11, '2018-09-03', 196, NULL, 8),
(12, '2018-09-05', 196, NULL, 8),
(13, '2018-09-06', 196, NULL, 8),
(14, '2018-09-03', 41, NULL, 8),
(15, '2018-09-04', 41, NULL, 8),
(16, '2018-09-05', 41, NULL, 8),
(17, '2018-09-06', 41, NULL, 8),
(18, '2018-09-07', 41, NULL, 8),
(19, '2018-09-10', 41, NULL, 8),
(20, '2018-09-11', 41, NULL, 8),
(21, '2018-05-01', 66, NULL, 8),
(22, '2018-05-02', 66, NULL, 8),
(23, '2018-05-03', 66, NULL, 8),
(24, '2018-05-04', 66, NULL, 8),
(25, '2018-05-07', 66, NULL, 8),
(26, '2018-05-08', 66, NULL, 8),
(27, '2018-05-09', 66, NULL, 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employee`
--

CREATE TABLE `employee` (
  `employee_id` bigint(20) NOT NULL,
  `username` varchar(36) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(128) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `group_id` varchar(5) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `group_ifi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `employee`
--

INSERT INTO `employee` (`employee_id`, `username`, `email`, `password`, `code`, `group_id`, `is_active`, `fullname`, `age`, `address`, `phone`, `role_id`, `type_id`, `group_ifi`) VALUES
(1, 'root', 'root@gmail.com', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'ROOT', 'N1', 1, 'IFISOLUTION', 21, 'root', '999999', 1, 1, NULL),
(2, 'user2', 'Nguyen Van A', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N001', 'N1', 1, 'Nguyen Van A', 21, 'Nguyen Van A', 'Nguyen Van', 1, 2, NULL),
(4, 'user3', 'ntuan90@saigonnet.com', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N003', 'N1', 1, '278 Nguyễn Văn Lượng,P16,Q.Gò Vấp ', 21, 'Nguyễn Tuấn ', '01648315306 ', 3, 2, NULL),
(5, 'user4', 'Thuynq.kv@petrolimex.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N004', 'N1', 1, '47 Huỳnh Mẫn Đạt, Phường 19, Bình Thạnh, HCM ', 25, 'Nguyễn Quốc Thùy ', '0903956484 ', 4, 2, NULL),
(6, 'user5', 'reprince911@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N005', 'N1', 1, '1544 Hùnh Tấn Phát - Phú Mỹ - Q7  ', 27, 'Trần Hồng Phúc ', '0909095475 ', 5, 2, NULL),
(7, 'user6', 'cuong11101979@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N006', 'N1', 1, 'Xà Bang - Châu Đức - BRVT  ', 28, 'Nguyễn Chơn Cường ', '0982161745 ', 4, 1, NULL),
(8, 'user7', 'huynhhuong@skypte.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N007', 'N1', 1, 'SKY JSC, 12/4C Nguyễn Thị Minh Khai, P. Đa Kao, Q1', 28, 'Huỳnh Mỹ Hương ', '0903886292 ', 3, 1, NULL),
(9, 'user8', 'khoilt@vass.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N008', 'N1', 1, '82 Thân Nhân Trung P13, Q. Tân Bình ', 25, 'Lê Trọng Khởi ', '0908283649 ', 3, 4, NULL),
(10, 'user9', 'thu_nguyenhoai@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N009', 'N1', 1, 'Căn hộ số 4, lầu 4 C/c NGuyễn Ngọc Phương, P19 Q. ', 21, 'Nguyễn Hoài Thu ', '907330379', 5, 5, NULL),
(11, 'user10', 'quanks2k13@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N010', 'N1', 1, 'A303 Cao Ốc Phú Thịnh, Cao Đạt, Q5 ', 27, 'Lê Trần Quân ', '0902334833 ', 5, 1, NULL),
(12, 'user11', 'lehoangduyanh@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N011', 'N1', 1, '880 Quốc Lộ 22, KP8, TT Củ Chi ', 26, 'Lê Hoàng Duy Anh ', '0903327124 ', 2, 5, NULL),
(13, 'user12', 'oanh_tran1972@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N012', 'N1', 1, '13 đường 702 Hồng Bàng, P1, Q11, TPHCM ', 22, 'Trần Kim Oanh ', '01686411329 ', 2, 1, NULL),
(14, 'user13', 'chauduong84@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N013', 'N1', 1, 'N21 Cư xá Phú Lâm A, P12, Q6, TPHCM ', 24, 'Dương Ngọc Châu ', '0903114330 ', 4, 3, NULL),
(15, 'user14', 'anhdao77777@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N014', 'N1', 1, '120/18B Trần Hưng Đạo, P. Phạm Ngũ Lão, Q1, TPHCM ', 29, 'Nguyễn Thị Anh Đào ', '0968263878 ', 3, 4, NULL),
(16, 'user15', 'thanhnghia862000@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N015', 'N1', 1, '132/205A Đoàn Văn Bơ, P15, Q4, HCM ', 27, 'Dương Thanh Hòa ', '906330379', 5, 2, NULL),
(17, 'user16', 'trongtridv@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N016', 'N1', 1, '525/100 Huỳnh Văn Bánh, F14, Q Phú Nhuận, HCM ', 23, 'Nguyễn Ngọc Trí ', '0986674850 ', 4, 5, NULL),
(18, 'user17', 'vominhhiep_105@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N017', 'N1', 1, 'Tổ dân phố Linh Phú, Đường 3-4, F Cam Linh, Thị Xã', 24, 'Võ Minh Hiệp ', '0583952918 ', 5, 4, NULL),
(19, 'user18', 'vietnam_red_blue@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N018', 'N1', 1, '879 Phạm Văn Thuận, F Tam Hiệp, Biên Hoà, tỉnh Đồn', 24, 'Dương Thanh Thế ', '0989777659 ', 2, 5, NULL),
(20, 'user19', 'hoahongpru@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N019', 'N1', 1, '385/20 Minh Phụng, P10, Q11, HCM ', 24, 'Ngũ Thị Hồng Hoa ', '0989777659 ', 4, 5, NULL),
(21, 'user20', 'girl_da_sau3000@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N020', 'N1', 1, '193/7A Lê Quang Sung P6, Q6, TPHCM ', 20, 'Cao Thị Thanh Thảo ', '0938020758 ', 4, 4, NULL),
(22, 'user21', 'pnt.thanh@prudential.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N021', 'N1', 1, '60/15/4 đường số 02 Hiệp Bình Phước, Thủ Đức, TPHC', 24, 'Phạm Thị Ngọc Thanh ', '0909641433 ', 3, 2, NULL),
(23, 'user22', 'tvhali@yahoo.com', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N022', 'N1', 1, '13/45/10 Bắc Hải, P6, Q. Tân Bình, TPHCM ', 28, 'Trần Văn Hạnh ', '0983436038 ', 2, 1, NULL),
(24, 'user23', 'hanhtkqn@yahoo.com', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N023', 'N1', 1, '13/45/10 Bắc Hải, P6, Q. Tân Bình, TPHCM ', 21, 'Trần Văn Hạnh ', '0983436038 ', 3, 5, NULL),
(25, 'user24', 'lequyen19021986@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N024', 'N1', 1, '144/10 Lê Trọng Tấn, P.Tây Thạnh, Q. Tân Phú, TPHC', 26, 'Nguyễn Thị Lệ Quyên ', '0909890850 ', 2, 3, NULL),
(26, 'user25', 'lananh30574@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N025', 'N1', 1, '18/189 Trần Quang Diệu, P14, Q3, TPHCM ', 20, 'Nguyễn Thị Lan Anh ', '0947774275 ', 4, 3, NULL),
(27, 'user26', 'thanhquang456@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N026', 'N1', 1, '45/6G Điện Biên Phủ, P15, Q. Bình Thạnh ', 26, 'Nguyễn Thanh Quang ', '0903682080 ', 3, 5, NULL),
(28, 'user27', 'chuonghrvietnam@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N027', 'N1', 1, '056 đường số 19, Bình Hưng Hòa A, Q. Bình Tân ', 26, 'Lương Việt Chương ', '0989961522 ', 2, 4, NULL),
(29, 'user28', 'doremonu20@yahoo.com', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N028', 'N1', 1, '2145 Lê Thúc Hoạch, P. Phú Thọ Hòa, Q. Tân Phú, TP', 27, 'Nguyễn Thị Kim Tuyến ', '0908669839 ', 4, 5, NULL),
(30, 'user29', 'xuanvinh125@hcm.fpt.vn', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N029', 'N1', 1, '2/28 tổ 18, KP3, Quốc lộ 13, Hiệp Bình Chánh, Q. T', 27, 'Vũ Xuân Vinh ', '0908690569 ', 4, 4, NULL),
(31, 'user30', 'kimtuyengifts@yahoo.com', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N030', 'N1', 1, '2145 Lê Thúc Hoạch, P. Phú Thọ Hòa, Q. Tân Phú, TP', 22, 'Nguyễn Thị Kim Tuyến ', '0908669839 ', 2, 2, NULL),
(32, 'user31', 'johnyxuanvinh@gmail.com', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N031', 'N1', 1, '2/28 tổ 18, KP3, Quốc lộ 13, Hiệp Bình Chánh, Q. T', 26, 'Vũ Xuân Vinh ', '0908690569 ', 5, 5, NULL),
(33, 'user32', 'ccdngayay@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N032', 'N1', 1, '341/19/12 Khương Việt, P. Phú Trang, Q. Tân Phú, T', 23, 'Lâm Đỗ Lê Duy ', '0909681517 ', 3, 5, NULL),
(34, 'user33', 'lemth075@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N033', 'N1', 1, '59 Bành Văn Trân, P7, Q. Tân Bình, TPHCM ', 28, 'Lê Thị Mỹ Thy ', '0909386007 ', 3, 3, NULL),
(35, 'user34', 'hvlong@vhu.hcm.edu.vn', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N034', 'N1', 1, 'C13 khu chợ phường 25, Ung Văn Khiêm, P25, Q. Bình', 27, 'Hoàng Vĩnh Long ', '0983122449 ', 5, 4, NULL),
(36, 'user35', 'hvlong@yahoo.com', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N035', 'N1', 1, 'C13 khu chợ phường 25, Ung Văn Khiêm, P25, Q. Bình', 29, 'Hoàng Vĩnh Long ', '0983122449 ', 2, 3, NULL),
(37, 'user36', 'cuongdm@vietbright.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N036', 'N1', 1, 'D415 lô E, KCN Tân Bình, P. Tây Thạnh, Q. Tân Phú,', 27, 'Đào Mạnh Cường ', '0907398720 ', 4, 5, NULL),
(38, 'user37', 'xmuiq2@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N037', 'N1', 1, '63 đường số 5, P. Bình An, Q2, TPHCM ', 25, 'Đỗ Thị Mùi ', '0917183711 ', 2, 1, NULL),
(39, 'user38', 'nhiltt@gmail.com', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N038', 'N1', 1, '208 KP4, P. Bình An, Q2, TPHCM ', 28, 'Lương Thị Nhị ', '0909380589 ', 5, 3, NULL),
(40, 'user39', 'nhiltt@yahoo.com', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N039', 'N1', 1, '208 KP4, P. Bình An, Q2, TPHCM ', 20, 'Lương Thị Nhị ', '0909380589 ', 5, 4, NULL),
(41, 'user40', 'salepacificvn2000@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N040', 'N1', 1, '505/4 Nguyễn Kiệm, P9, Q. Phú Nhuận, TPHCM ', 21, 'Bùi Thị Hoàng Mai ', '0983636773 ', 4, 1, NULL),
(42, 'user41', 'quangvietcd@yahoo.com', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N041', 'N1', 1, '309K Thanh Đa, P27, Q. Bình Thạnh, TPHCM ', 25, 'Bùi Quang Việt ', '0908987696 ', 2, 3, NULL),
(43, 'user42', 'bqviet@ueh.edu.vn', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N042', 'N1', 1, '309K Thanh Đa, P27, Q. Bình Thạnh, TPHCM ', 29, 'Bùi Quang Việt ', '0908987696 ', 5, 4, NULL),
(44, 'user43', 'onlylove20042003@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N043', 'N1', 1, '260 Ấp 3, An Phước, Long Thành, Đồng Nai ', 20, 'Phạm Công Định ', '01684667808 ', 5, 2, NULL),
(45, 'user44', 'hiensunjinvn@yahoo.com.vn', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N044', 'N1', 1, '10/123 KP3, Tam Hòa, Biên Hòa, Đồng Nai ', 20, 'Bùi Thị Diệu Hiền ', '0908350674 ', 4, 1, NULL),
(46, 'user45', 'seezuaf999@yahoo.com', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N045', 'N1', 1, '10/123 KP3, Tam Hòa, Biên Hòa, Đồng Nai ', 23, 'Bùi Thị Diệu Hiền ', '0908350674 ', 2, 3, NULL),
(47, 'user46', 'tran_ngoc92@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N046', 'N1', 1, 'Đồng Thành, Yên Thành, Nghệ An ', 22, 'Trần Đăng Ngọc ', '0932174282 ', 4, 3, NULL),
(48, 'user47', 'ddthoai2002@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N047', 'N1', 1, '50 đường 15, P. Bình Trưng Đông, Q2, TPHCM ', 21, 'Đặng Đình Thanh Hoài ', '0989354446 ', 3, 1, NULL),
(49, 'user48', 'nguyenthanh_15071962@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N048', 'N1', 1, '36 tổ 2, ấp 6, Hưng Hòa, Bến Cát, Bình Dương ', 28, 'Nguyễn Văn Thành ', '0918223085 ', 3, 4, NULL),
(50, 'user49', 'ngayayxaroi0909@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N049', 'N1', 1, 'C6 tổ 6, Khu phố 5, An Bình, Biên Hòa, Đồng Nai ', 28, 'Nguyễn Trường Giang Hà ', '0916962449 ', 3, 1, NULL),
(51, 'user50', 'christtina8282@yahoo.com', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N050', 'N1', 1, '17 đường 26, KCN Sóng Thần II, Dĩ An ', 20, 'Nguyễn Thị Thúy ', '01686699090 ', 2, 5, NULL),
(52, 'user51', 'christinanguyen@pohhuat.com', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N051', 'N1', 1, '17 đường 26, KCN Sóng Thần II, Dĩ An ', 26, 'Nguyễn Thị Thúy ', '01686699090 ', 5, 4, NULL),
(53, 'user52', 'thuyntt82@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N052', 'N1', 1, '173/15 Trần Quốc Thảo, P9, Q3, TPHCM ', 22, 'Nguyễn Thu Thủy ', '01228863254 ', 3, 5, NULL),
(54, 'user53', 'beo_con882000@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N053', 'N1', 1, '27/2/18 đường số 3, P. Tam Phú, Q. Thủ Đức, TPHCM ', 22, 'Phạm Nguyễn Phương Hồng ', '0909523525 ', 5, 3, NULL),
(55, 'user54', 'hienluong_vgas@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N054', 'N1', 1, 'Long Bình Tân, Biên Hòa, Đồng Nai ', 28, 'Đàm Thị Lương ', '0974282002 ', 4, 3, NULL),
(56, 'user55', 'nsvc.hr1@gbl.nidec_sankyo.co.jp', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N055', 'N1', 1, 'D634 khu phố 4, Long Bình, Biên Hòa, Đồng Nai ', 23, 'Trịnh Thị Tố Trinh ', '0902498125 ', 3, 5, NULL),
(57, 'user56', 'dqtruong@sym.com.tw', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N056', 'N1', 1, 'H10/2/13 Khu phố 7, Tân Phong, Biên Hòa, Đồng Nai ', 21, 'Dương Quang Trường ', '0916705252 ', 3, 3, NULL),
(58, 'user57', 'tranbaotran1982@yahoo.com', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N057', 'N1', 1, 'M8A, Thất Sơn, P15, Q10, TPHCM ', 25, 'Trần Bảo Trân ', '0902808681 ', 2, 2, NULL),
(59, 'user58', 'sakura_4t@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N058', 'N1', 1, 'D634 khu phố 4, Long Bình, Biên Hòa, Đồng Nai ', 22, 'Trịnh Thị Tố Trinh ', '0902498125 ', 4, 5, NULL),
(60, 'user59', 'dqtruong08@gmail.com', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N059', 'N1', 1, 'H10/2/13 Khu phố 7, Tân Phong, Biên Hòa, Đồng Nai ', 24, 'Dương Quang Trường ', '0916705252 ', 3, 1, NULL),
(61, 'user60', 'tranbaotran1982@gmail.com', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N060', 'N1', 1, 'M8A, Thất Sơn, P15, Q10, TPHCM ', 24, 'Trần Bảo Trân ', '0902808681 ', 4, 2, NULL),
(62, 'user61', 'ngoclnp@techcombank.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N061', 'N1', 1, '108/31 đường số 9, P9, Gò Vấp ', 24, 'Lê Nguyễn Phương Ngọc ', '0908263429 ', 5, 1, NULL),
(63, 'user62', 'nhombonminh2006@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N062', 'N1', 1, '300/28 Nguyễn Văn Linh, F Bình Thuận, Q 7, HCM ', 24, 'Nguyễn Lê Châu ', '0973643938 ', 5, 3, NULL),
(64, 'user63', 'vanvu679@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N063', 'N1', 1, 'TK 15/31 Nguyễn Cảnh Chân, F Cầu Kho, Q1, HCM ', 24, 'Trương Văn Vũ ', '0958815597 ', 5, 1, NULL),
(65, 'user64', 'haphuongnd86@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N064', 'N1', 1, '95/12 Lê Văn Sỹ, P13, Q.Phú Nhuận, HCM ', 29, 'Nguyễn Đắc Hà Phương ', '0949073268 ', 2, 3, NULL),
(66, 'user65', 'LyCTH@gemadept.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N065', 'N1', 1, 'Số 6, Lô E2, Cư xá 30/4, Phường 25, Q Bình Thạnh, ', 23, 'Chu Thị Hồng Lý ', '0976263488 ', 2, 2, NULL),
(67, 'user66', 'dvcthotnot@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N066', 'N1', 1, '02.02 Lô C C/C Phạm Viết Chánh, F19, Bình Thạnh, H', 25, 'Trương Quang Thành ', '0913911922 ', 2, 5, NULL),
(68, 'user67', 'sinhchau@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N067', 'N1', 1, '23 Đường 12, Bình An, Quận 2, HCM ', 27, 'Nguyễn Khắc Sinh Châu ', '09093607557 ', 5, 2, NULL),
(69, 'user68', 'thanhtam_email@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N068', 'N1', 1, '232/2/15 Đoàn Văn Bơ, Phường 10, Quận 4, HCM ', 22, 'Phan Thị Thanh Tâm ', '0983813530 ', 2, 2, NULL),
(70, 'user69', 'thuyhang171@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N069', 'N1', 1, '6/12 Đường 68, Hiệp Phú, Quận 9, HCM ', 29, 'Nguyễn Thị Thúy Hằng ', '0983118768 ', 3, 2, NULL),
(71, 'user70', 'nguyenminhthien2009@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N070', 'N1', 1, 'số 6, N11 KDC Phú Hòa, Phú Hòa, Thủ Dầu 1, Bình Dư', 26, 'Nguyễn Minh Thiện ', '0986317217 ', 5, 4, NULL),
(73, 'user72', 'bachyen04@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N072', 'N2', 1, '23 Đường số 10, Cát Lái, Quận 2, HCM ', 25, 'Nguyễn Thị Bạch Yến ', '0903640449 ', 4, 5, NULL),
(74, 'user73', 'at7-8x@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N073', 'N2', 1, 'Cát Hậu, Hồng Hưng, Gia Lộc, Hải Dương ', 25, 'Phạm Nguyễn Anh Trà ', '0984944604 ', 5, 2, NULL),
(75, 'user74', 'nguyenansong@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N074', 'N2', 1, 'Cát Hậu, Hồng Hưng, Gia Lộc, Hải Dương ', 25, 'Nguyễn An Sống ', '0902751783 ', 2, 3, NULL),
(76, 'user75', 'phongasc@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N075', 'N2', 1, 'Cát Hậu, Hồng Hưng, Gia Lộc, Hải Dương ', 33, 'Trần Cẩm Phong ', '0937385070 ', 2, 2, NULL),
(77, 'user76', 'ntlanh.khdn@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N076', 'N2', 1, 'Cát Hậu, Hồng Hưng, Gia Lộc, Hải Dương ', 29, 'Nguyễn Thị Lành ', '0987999031 ', 4, 3, NULL),
(78, 'user77', 'hothunga77@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N077', 'N2', 1, '255/72/4 Ngô Tất Tố, P22, Bình Thạnh ', 22, 'Hồ Thiên Nga ', '0987999031 ', 2, 2, NULL),
(79, 'user78', 'trieuminh240684@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N078', 'N2', 1, '255/72/4 Ngô Tất Tố, P22, Bình Thạnh ', 27, 'Nguyễn Văn Tý ', '0987999031 ', 3, 3, NULL),
(80, 'user79', 'moiro1985@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N079', 'N2', 1, '441/33/9 Nguyễn Bỉnh Khiêm, P1, Gò Vấp, HCM ', 24, 'Hồ Thị Quỳnh Như ', '0987999031 ', 5, 5, NULL),
(81, 'user80', 'ngohai1976@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N080', 'N2', 1, '441/33/9 Nguyễn Bỉnh Khiêm, P1, Gò Vấp, HCM ', 20, 'Ngô Thanh Hải ', '0987999031 ', 2, 2, NULL),
(82, 'user81', 'dannynguyen1980@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N081', 'N2', 1, 'P417 C/c Vạn Đô, 348 Bến Vân Đồn, F1, Quận 4, HCM ', 27, 'Nguyễn Quang Đức ', '0987999031 ', 5, 5, NULL),
(83, 'user82', 'dieuhienvssc@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N082', 'N2', 1, 'P417 C/c Vạn Đô, 348 Bến Vân Đồn, F1, Quận 4, HCM ', 28, 'Phạm Thị Diệu Hiền ', '0935765765 ', 4, 1, NULL),
(84, 'user83', 'dangngocsuong@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N083', 'N2', 1, 'P417 C/c Vạn Đô, 348 Bến Vân Đồn, F1, Quận 4, HCM ', 26, 'Đặng Thị Ngọc Sương ', '0974950370 ', 2, 3, NULL),
(85, 'user84', 'sgn-tsm@sgnlogistics.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N084', 'N2', 1, 'P417 C/c Vạn Đô, 348 Bến Vân Đồn, F1, Quận 4, HCM ', 20, 'Nguyễn Thanh Tùng ', '0938312868 ', 3, 4, NULL),
(86, 'user85', 'ngocmybk@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N085', 'N2', 1, '94 đường 17, P. Linh Chiểu, Thủ Đức ', 28, 'Nguyễn Thị Ngọc My ', '0984221287 ', 3, 2, NULL),
(87, 'user86', 'trieu_tql@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N086', 'N2', 1, '95 đường 17, P. Linh Chiểu, Thủ Đức ', 28, 'Trương Quang Long Triều ', '0918339988 ', 5, 5, NULL),
(88, 'user87', 'quanglinhmail@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N087', 'N2', 1, '45/9 Đinh Tiên Hoàng, Bến Nghé, Quận 1, HCM ', 21, 'Nguyễn Quang Linh ', '01684577977 ', 3, 2, NULL),
(89, 'user88', 'binhchuongkts@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N088', 'N2', 1, '45/9 Đinh Tiên Hoàng, Bến Nghé, Quận 1, HCM ', 30, 'Trần Bình Chương ', '0903925707 ', 4, 3, NULL),
(90, 'user89', 'andavn@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N089', 'N2', 1, '45/9 Đinh Tiên Hoàng, Bến Nghé, Quận 1, HCM ', 34, 'Lê Thị Anh Đào ', '0918103908 ', 2, 2, NULL),
(91, 'user90', 'xhavu@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N090', 'N2', 1, '277/14 Nguyễn Tiểu La, P8, Q10, Tp. Hồ Chí Minh ', 31, 'Vũ Xuân Hà ', '0982390490 ', 2, 2, NULL),
(92, 'user91', 'lqdao@pvfcoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N091', 'N2', 1, '277/14 Nguyễn Tiểu La, P8, Q10, Tp. Hồ Chí Minh ', 29, 'Lưu Quang Đạo ', '0919587879 ', 5, 5, NULL),
(93, 'user92', 'hongngocsg@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N092', 'N2', 1, '277/14 Nguyễn Tiểu La, P8, Q10, Tp. Hồ Chí Minh ', 21, 'Phan Hồng Ngọc ', '094646886 ', 5, 5, NULL),
(94, 'user93', 'lephucuong@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N093', 'N2', 1, '277/14 Nguyễn Tiểu La, P8, Q10, Tp. Hồ Chí Minh ', 32, 'Lê Phú Cường ', '0918413504 ', 2, 3, NULL),
(95, 'user94', 'Dunglv1606@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N094', 'N2', 1, '130 Ung Văn Khiêm, P25, Bình Thạnh, HCM ', 28, 'Lưu Thị Dung ', '0985596312 ', 3, 1, NULL),
(96, 'user95', 'ngocshpcnhcm@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N095', 'N2', 1, '785/16/32 Xô Viết Nghệ Tĩnh, P25, Q. Bình Thạnh, T', 23, 'Phan Văn Ngọc ', '0903820261 ', 2, 3, NULL),
(97, 'user96', 'hongphuong@sunimex.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N096', 'N2', 1, '35 Đoàn Hữu Trưng, An Phú, Q.2, TPHCM ', 25, 'Lê Cẩm Hồng Phượng ', '0903641020 ', 3, 2, NULL),
(98, 'user97', 'xuanthanh9@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N097', 'N2', 1, '327/44/3 Tổ 7 KP 2A, P.Thới An, Q.12, TPHCM ', 33, 'Nguyễn Xuân Thịnh ', '0947541503 ', 4, 2, NULL),
(99, 'user98', 'ngan.trinh@libertyinsurance.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N098', 'N2', 1, '39/9 Nhất Chi Mai, P13, Q.Tân Bình, TPHCM ', 31, 'Trịnh Kim Ngân ', '0913607635 ', 5, 4, NULL),
(100, 'user99', 'tranthiphuongthao17@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N099', 'N2', 1, '404/1/28 Lê Hồng Phong, Nha Trang, Khánh Hoà ', 31, 'Trần Thị Phương Thảo ', '0937983177 ', 4, 4, NULL),
(101, 'user100', 'vicky2006@nurian.org ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N100', 'N2', 1, '11/3H Nguyễn Anh Thủ, Ấp Đông, Hóc Môn  ', 29, 'Bùi Thuỵ Uyên Vy ', '0908200689 ', 3, 4, NULL),
(102, 'user101', 'thphng@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N101', 'N2', 1, '263 Hàn Hải Nguyên, P2, Q11, TPHCM ', 20, 'Nguyễn Thị Thanh Phương ', '0986888956 ', 2, 1, NULL),
(103, 'user102', 'thanhdevyt@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N102', 'N2', 1, 'A9 Đường 30, P.Bình Anh, Q.2, TPHCM ', 28, 'Nguyễn Xuân Thành ', '0903722730 ', 2, 1, NULL),
(104, 'user103', 'hoangnhung789@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N103', 'N2', 1, '52A Đường 20 KP 4 Hiệp Bình Chánh, Thủ Đức ', 26, 'Nguyễn Văn Nhung ', '0989519967 ', 4, 5, NULL),
(105, 'user104', 'vmphuong1@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N104', 'N2', 1, '163/22A Khu 5,6, Bình Hưng HòaB, Q.Bình Tân ', 23, 'Võ Thị Minh Phượng ', '0986 720 608 ', 4, 1, NULL),
(106, 'user105', 'minhdem1980@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N105', 'N2', 1, '41/7 Bùi Viện, P.Phạm Ngũ Lão,Q.1 ', 25, 'Quách Thế Minh ', '0985 066688 ', 5, 4, NULL),
(107, 'user106', 'alice@nurian.org ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N106', 'N2', 1, 'số 6 KP3, P.Bình Hưng Hòa, Q.Bình Tân, TPHCM ', 24, 'Trần Thị Lan Hương ', '0933340799 ', 2, 4, NULL),
(108, 'user107', 'phamtrucvy@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N107', 'N2', 1, 'số 6 KP3, P.Bình Hưng Hòa, Q.Bình Tân, TPHCM ', 25, 'Phạm Trúc Vy ', '0905751100 ', 2, 2, NULL),
(109, 'user108', 'yenvi_2812@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N108', 'N2', 1, '649/58 Điện Biên Phủ, P.25, Q. Bình Thạnh, HCM ', 24, 'Nguyễn Kiều Yến Vi ', '0984 534 246 ', 4, 4, NULL),
(110, 'user109', 'chipbombo@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N109', 'N2', 1, '245D, Nguyễn Trãi, P. Nguyễn Cư Trinh, Q.1,HCM ', 22, 'Đỗ Thị Bích Hà ', '0908 006292 ', 5, 4, NULL),
(111, 'user110', 'tramelite@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N110', 'N2', 1, '152/54/28 Lạc Long Quân, P.3, Q.11, HCM ', 32, 'Nguyễn Thị Bích Trâm ', '0918 609984 ', 5, 2, NULL),
(112, 'user111', 'hieu_kimlong@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N111', 'N2', 1, '385/4 Điện Biên Phủ, P4, Q3, TPHCM ', 22, 'Vũ Trung Hiếu ', '0903711279 ', 2, 4, NULL),
(113, 'user112', 'cucn79@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N112', 'N2', 1, '385/4 Điện Biên Phủ, P4, Q3, TPHCM ', 32, 'Nguyễn Thị Ngọc Cúc ', '0908899559 ', 2, 4, NULL),
(114, 'user113', 'viethuy@fmc.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N113', 'N2', 1, '385/4 Điện Biên Phủ, P4, Q3, TPHCM ', 24, 'Nguyễn Gia Việt Huy ', '0169997809 ', 3, 2, NULL),
(115, 'user114', 'abrandnewperson88@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N114', 'N2', 1, 'B22/15 Đường Bạch Đằng, P.2, Tân Bình, HCM ', 29, 'Trần Minh ', '0909 707110 ', 2, 1, NULL),
(116, 'user115', 'bichthuy_1804@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N115', 'N2', 1, '180/34 XVNT, P21, Q. Bình THạnh ', 24, 'Phạm Thị Bích Thủy ', '0902.217.093 ', 4, 5, NULL),
(117, 'user116', 'patuan@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N116', 'N2', 1, '68/46A, Nguyễn Thái Sơn, P.3, Q. Gò Vấp, HCM ', 25, 'Phùng Anh Tuấn ', '0903.920.555 ', 3, 5, NULL),
(118, 'user117', 'hoangtrang.vinaship@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N117', 'N2', 1, '5E, Nguyễn Đình Chiểu, P. Đakao, Q.1, HCM ', 23, 'Hòang Thị Thu Trang ', '0945.797.908 ', 2, 5, NULL),
(119, 'user118', 'v3112@jtc.com.tw ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N118', 'N2', 1, '137 I, Tân Khai,P.4, Q.11, HCM  ', 24, 'Lữ Ngọc Bình ', '0918 359 248 ', 4, 3, NULL),
(120, 'user119', 'bacsiutcamau@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N119', 'N2', 1, '40 Lý Thường Kiệt, P.7, TP Cà Mau ', 28, 'Lý Văn Út ', '0913.722791 ', 3, 2, NULL),
(121, 'user120', 'tunguyen_1234@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N120', 'N2', 1, '109 Đường 10,P.4, Q.8, HCM ', 30, 'Nguyễn Hòang Cẩm Tú ', '0909.184.797 ', 2, 3, NULL),
(122, 'user121', 'dungalc@hotmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N121', 'N2', 1, 'MM2, Trường Sơn, P.15, Q.10, HCM ', 27, 'Nguyễn Thị Ngọc Dung ', '0913.735.669 ', 3, 3, NULL),
(123, 'user122', 'tonnuphuongthanh_octieu@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N122', 'N2', 1, '50/8, Trần Khắc Trân, P. Tân Định, Q.1, HCM ', 26, 'Tôn Nữ Phương Thanh ', '0903.822.382 ', 2, 1, NULL),
(124, 'user123', 'duongxuanbinh746@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N123', 'N2', 1, '29/29D, Tổ 54, P.16, Q.Tân Bình, HCM ', 31, 'Dương Xuân Bình ', '0935.222.237 ', 5, 3, NULL),
(125, 'user124', 'dinhnhothang@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N124', 'N2', 1, '138,Dương Đình Hội, P. Phước Long B, Q.9, HCM ', 26, 'Đinh Nho Thắng ', '0983.533.777 ', 5, 3, NULL),
(126, 'user125', 'ttlong80@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N125', 'N2', 1, '195/4/1, Trần Văn Đang, P.11, Q.3, HCM ', 21, 'Trần Thế Long ', '0903.330.407 ', 2, 2, NULL),
(127, 'user126', 'mythu910@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N126', 'N2', 1, '71/26/7/25, Nguyễn Bặc, P.3, Tân Bình,HCM ', 33, 'Nguyễn Thị Mỹ Thu ', '0909.242.644 ', 4, 5, NULL),
(128, 'user127', 'minhhieung1977@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N127', 'N2', 1, '27A, Thạch Thị Thanh, P. Tân Định, Q.1, HCM ', 21, 'Nguyễn Thị Minh Hiếu ', '0908.130.179 ', 2, 3, NULL),
(129, 'user128', 'danhhocong@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N128', 'N2', 1, '48C, Lạc Long Quân, P,8, Q. Tân Bình, HCM ', 30, 'Hồ Công Danh ', '0913.728.88 ', 5, 4, NULL),
(130, 'user129', 'quocdung427@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N129', 'N2', 1, '433/40/38, Lý Thái Tổ, P.9, Q.10, HCM ', 33, 'Trần Quốc Dũng ', '0989.601.660 ', 2, 1, NULL),
(131, 'user130', 'maiquynh3003@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N130', 'N2', 1, 'Số 6, Đường 46, P. Thảo Điền, Q.2, HCM ', 21, 'Lê Vũ Quỳnh Mai ', '0907.987.340 ', 2, 5, NULL),
(132, 'user131', 'haisgb@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N131', 'N2', 1, '293/15A, Bình Tiên, P.8,Q.6, HCM ', 28, 'Lê Minh Hải ', '0909.238789 ', 3, 1, NULL),
(133, 'user132', 'mychi55@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N132', 'N2', 1, '102, LôH, Cư Xá Thanh Đa, P.27, Q.BT, HCM ', 30, 'Nguyễn Thị Mỹ Chi ', '0936.888.432 ', 2, 1, NULL),
(134, 'user133', 'quanganh.vl@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N133', 'N2', 1, '477/61/009, Nơ Trang Long, P.13, Q.BT, HCM ', 30, 'Lê Quang Anh ', '0986.040.986 ', 2, 5, NULL),
(135, 'user134', 'vthue264@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N134', 'N2', 1, '210 Dương Bá Trạc, Q.8, HCM ', 32, 'Vũ Tuyết Huệ ', '0913747748 ', 2, 1, NULL),
(136, 'user135', 'trunghieuhr@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N135', 'N2', 1, '211 Dương Bá Trạc, Q.8, HCM ', 31, 'Trần Thị Hòa ', '0988160666 ', 2, 4, NULL),
(137, 'user136', 'trunghieuhr@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N136', 'N2', 1, '17T, Tổ 35, KP 3, P. Tân Chánh Hiệp, Q.12 ', 33, 'Trần Trung Hiếu ', '1111 ', 2, 5, NULL),
(138, 'user137', 'thanhvu@hcm.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N137', 'N2', 1, '299/16/4A, Lý Thường Kiệt, P.15, Q.11, HCM ', 23, 'Trần Thị Mộng Tuyết ', '0903.811.421 ', 2, 1, NULL),
(139, 'user138', 'tranthaihoa1968@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N138', 'N2', 1, '20 Chợ Đường Rày, P.25, Q.Bình Thạnh, TPHCM ', 28, 'Trần Thái Hòa ', '0908899719 ', 3, 3, NULL),
(140, 'user139', 'toanhonghung@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N139', 'N2', 1, '292, Điện Biên Phủ, P.22, Q.BT, HCM ', 33, 'Trần Huy Tòan ', '0985.711.320 ', 4, 4, NULL),
(141, 'user140', 'haichauan@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N140', 'N2', 1, '9/33, Tổ 9, KP6, P. Linh Trung, Thủ Đức, HCM ', 30, 'Nguyễn Tôn Hiến ', '01669038200 ', 5, 5, NULL),
(142, 'user141', 'darkangel_vk@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N141', 'N2', 1, '57/18, Hùynh Khuơng An, P.5, Q.Gò Vấp, HCM ', 35, 'Nguyễn Văn Kết ', '01682709069 ', 5, 1, NULL),
(143, 'user142', 'phuonglt8583@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N142', 'N2', 1, '159, Trần Hữu Trang, P.10, Q.PN, HCM ', 32, 'Lê Thu Phượng ', '0902.020.585 ', 3, 3, NULL),
(144, 'user143', 'huongloan77@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N143', 'N2', 1, 'Lô 811, Xa lộ HN, P.An Phú, Q.2, HCM ', 33, 'Nguyễn Thị Hương Loan ', '0909.282.856 ', 2, 2, NULL),
(145, 'user144', 'wt_02003@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N144', 'N2', 1, '104,Tam Sóc A, Mỹ Thuận,Mỹ Tú, Sóc Trăng ', 24, 'Lâm Tuấn Nguyên ', '0984.066.867 ', 5, 5, NULL),
(146, 'user145', 'funnycats79@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N145', 'N2', 1, 'C/C 346, Số 504, lô 1, Đường Phan Văn Trị,P.11, Q.', 20, 'Trần Thị Huỳnh Như ', '0902.638679 ', 5, 5, NULL),
(147, 'user146', 'hoangtu_a52002@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N146', 'N2', 1, '8B, Cư Xá Tân Cảng, P.25, Q.BT, HCM ', 27, 'Nguyễn Khánh Nhật ', '0908.220.985 ', 3, 1, NULL),
(148, 'user147', 'danglv@pvdrilling.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N147', 'N2', 1, '60/9/3, Đường số 2, Hiệp Bình Phước, Quận Thủ Đức,', 27, 'Lê Văn Đáng ', '0982343506 ', 5, 1, NULL),
(149, 'user148', 'hoanbvbni@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N148', 'N2', 1, 'Chung cư 35, Nguyễn Văn Tráng, P.Bến Thành, Q.1, H', 31, 'Trần Thị Thu Hòan ', '0982.447.283 ', 4, 1, NULL),
(150, 'user149', 'hangkhanhhuy@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N149', 'N2', 1, '439 Lê Quang Định,p.5, Q.Bình Thạnh, HCM ', 32, 'Hàng Khánh Huy ', '0903804505 ', 3, 4, NULL),
(151, 'user150', 'cun_con22ot@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N150', 'N2', 1, '18 Đường số 2 căn cứ 26c, F7, Gò Vấp ', 35, 'Phạm Thị Thùy Dương ', '01227061893 ', 5, 3, NULL),
(152, 'user151', 'phuongtrang07@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N151', 'N2', 1, '19 Đường số 2 căn cứ 26c, F7, Gò Vấp ', 31, 'Nguyễn Thị Bạch Phượng ', '0909050769 ', 3, 3, NULL),
(153, 'user152', 'YEN_NGUYEN652000@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N152', 'N2', 1, '15/69 Võ Duy Ninh,P.22,Q.Bình Thạnh ', 26, 'Nguyễn Thị Bạch Yến ', '0913982889 ', 2, 1, NULL),
(154, 'user153', 'lvkhoi@pvfcco.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N153', 'N2', 1, 'Phòng C2 lầu 9 chung cư Nguyễn Phúc Nguyên,P.10, Q', 24, 'Lê Văn Khôi ', '0947878668 ', 4, 3, NULL),
(155, 'user154', 'dr.men3230@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N154', 'N2', 1, 'Phòng C2 lầu 9 chung cư Nguyễn Phúc Nguyên,P.10, Q', 33, 'Nguyễn Tài Nam ', '01222211988 ', 2, 4, NULL),
(156, 'user155', 'trantienthanh1988@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N155', 'N2', 1, '2/28, Đường 147,P. Tăng Nhơn Phú B, Q.9, HCM ', 32, 'Trần Tiến Thành ', '0908388507 ', 2, 4, NULL),
(157, 'user156', 'thuyphuc.nguyen@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N156', 'N2', 1, '361/7 Nguyễn Đình Chiểu,P5,Q3 ', 32, 'Nguyễn Phúc Khánh ', '0913751990 ', 4, 3, NULL),
(158, 'user157', 'acuongvn2000@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N157', 'N2', 1, '5/1 đường Đồ Sơn,P4,Q.Tân Bình ', 29, 'Nguyễn Mạnh Cường ', '0904481648 ', 3, 2, NULL),
(159, 'user158', 'doan_245@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N158', 'N2', 1, '24/434 A Thống Nhất, P.15, Q.Gò Vấp ', 33, 'Bùi Vũ Thục Đoan ', '0909307607 ', 5, 3, NULL),
(160, 'user159', 'nammap1978@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N159', 'N2', 1, '38/11/2A KP6 Trường Thọ,Thủ Đức.TP.HCM ', 29, 'Nguyễn Hoàng Nam ', '0984016601 ', 2, 5, NULL),
(161, 'user160', 'nvktnt@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N160', 'N2', 1, '178/4/12H1 Phan Đăng Lưu,P3,Q.Phú Nhuận ', 31, 'Nguyễn Vinh Khánh Toàn ', '0909112172 ', 3, 5, NULL),
(162, 'user161', 'ngohu@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N161', 'N2', 1, '200/48 Lê Văn Việt, P.Tăng Nhơn Phú B,Q.9 ', 34, 'Trần Ngọc Hùng ', '0909667977 ', 5, 2, NULL),
(163, 'user162', 'clragonthang@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N162', 'N2', 1, '20/17 KP5 Dầu Tiếng Bình Dương ', 23, 'Lê Minh Thắng ', '0908446644 ', 5, 5, NULL),
(164, 'user163', 'thuyphuc.nguyen@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N163', 'N2', 1, '361/7 Nguyễn Đình Chiểu,P5,Q3 ', 24, 'Nguyễn Phúc Thảo ', '0913752990 ', 5, 2, NULL),
(165, 'user164', 'tttha@baominh.om.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N164', 'N2', 1, '30/07 Bùi Thế Mỹ,P.Hiệp Tân,Q.Tân Phú ', 25, 'Trần Thị Thúy Hà ', '0908664879 ', 2, 2, NULL),
(166, 'user165', 'nguyenthuy0152@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N165', 'N2', 1, '666/64/18 đường 3/2,P14,Q10 ', 30, 'Nguyễn Thị Thùy Nhung ', '0938515658 ', 5, 3, NULL),
(167, 'user166', 'airport.hcm@aomlogistics.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N166', 'N2', 1, '89 Phan Vãn Tình,TT Thủ Thừa,Thủ Thừa,Long An ', 28, 'Nguyễn Hữu Hoàng Nguyên ', '0908558858 ', 2, 1, NULL),
(168, 'user167', 'vuongthanhvienart@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N167', 'N2', 1, '288/5 Dương bá Trạc,P2,Q8,Tp.HCM ', 26, 'Vương Thanh Viễn ', '0918676097 ', 4, 4, NULL),
(169, 'user168', 'leyen.dl@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N168', 'N2', 1, 'L6 KDC Hồng Long,Quốc Lộ 13,P.Hiệp Bình Phước,TĐ ', 27, 'Lê Thị Hải Yến ', '0907167455 ', 3, 5, NULL),
(170, 'user169', 'legiathuc@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N169', 'N2', 1, '736 Nguyễn Kiệm P4 Phú Nhuận HCM ', 34, 'Lê Gia Thức ', '0903712830 ', 4, 3, NULL),
(171, 'user170', 'ducdung@viettien.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N170', 'N2', 1, '698 Nguyễn Kiệm phường 4 Phú Nhuận HCM ', 30, 'Nguyễn Đức Dũng ', '0903656465 ', 3, 5, NULL),
(172, 'user171', 'hungchuatd@tamlong.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N171', 'N2', 1, '7/C7 Ấp 3,Xã An Phú,thuận An,Bình Dương ', 32, 'Trần Duy Hưng ', '0908468946 ', 4, 5, NULL),
(173, 'user172', 'nguyenlinh.8888@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N172', 'N2', 1, 'P.Tân Giang, tx Hà Tĩnh, hà Tĩnh ', 22, 'Nguyễn Duy Linh ', '0902660355 ', 5, 3, NULL),
(174, 'user173', 'trannhatvinh@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N173', 'N2', 1, '45/1 Đồng Xoài P.13 Q. Tân Bình ', 34, 'Trần Nhật Vĩnh ', '0932345610 ', 2, 4, NULL),
(175, 'user174', 'nlhuong@cityford.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N174', 'N2', 1, '104/1 Huỳnh Mẫn Đạt, P.2, Q.5, TP.Hồ Chí Minh ', 26, 'Nguyễn Lan Hương ', '0913895976 ', 5, 2, NULL),
(176, 'user175', 'lephan_82@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N175', 'N2', 1, '70/7 Xô Viết Nghệ Tĩnh, P.21, Q.Bình Thạnh, TP.HCM', 22, 'Phan Thị Lệ ', '0977835885 ', 5, 5, NULL),
(177, 'user176', 'trunghi668@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N176', 'N2', 1, '23/37A Hòa Hưng, P.12, Q.10, TP.HCM ', 23, 'Phan Bảo Trung ', '0938168368 ', 3, 5, NULL),
(178, 'user177', 'thithaihale@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N177', 'N2', 1, '97 Lương Đình Của,P.An Khánh,Q2 ', 34, 'Lê Thị Thái Hà ', '0908025229 ', 3, 2, NULL),
(179, 'user178', 'e_e5640@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N178', 'N2', 1, 'TT KT3 45 Paster Q.1,HCM ', 32, 'Tạ Quang Lâm ', '01689655955 ', 2, 2, NULL),
(180, 'user179', 'hongchautt@vfc.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N179', 'N2', 1, '10A Lê Thánh Tôn, P.Bến Nghé, Q.1, TP.HCM ', 27, 'Thái Thị Hồng Châu ', '0903920662 ', 2, 1, NULL),
(181, 'user180', 'vuquang_76@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N180', 'N2', 1, '2/5C Đồng Nai,Q10,TP.HCM ', 29, 'Tô Vũ Quang ', '0979308590 ', 2, 1, NULL),
(182, 'user181', 'truong_civil75@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N181', 'N2', 1, '35/97 Xô Viết Nghệ Tĩnh, P.17, Q.Bình Thạnh, TP.HC', 22, 'Trịnh Trung Trưởng ', '0913710465 ', 2, 3, NULL),
(183, 'user182', 'nganghe83@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N182', 'N2', 1, 'Định Liên, Yên Định, Thanh Hóa ', 22, 'Nguyễn Anh Nga ', '0974686999 ', 2, 4, NULL),
(184, 'user183', 'gsaigon@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N183', 'N2', 1, '26/23A Tân Thành,P.tân Thành,Q.Tân Phú ', 25, 'Nguyễn Hồng Vinh ', '0933200080 ', 3, 5, NULL),
(185, 'user184', 'khachen_dtcl@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N184', 'N2', 1, '26/23A Tân Thành,P.Tân Thành,Q.Tân Phú ', 27, 'Quách Kha Chen ', '0988030439 ', 5, 1, NULL),
(186, 'user185', 'tientodung@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N185', 'N2', 1, '132, Đường 43, P.Tân Quy, Q.7, HCM ', 20, 'Tô Dũng Tiến ', '0988.077.708 ', 3, 2, NULL),
(187, 'user186', 'thuydt@saigonnewpart.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N186', 'N2', 1, 'B7 lầu 7 c/c thế kỷ 21,326/1 Ung Văn Khiêm,P25,Q.B', 21, 'Đào Thị Thu Thủy ', '0983304525 ', 4, 3, NULL),
(188, 'user187', 'minhnguyen_05@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N187', 'N2', 1, 'Hồng Long ,NAm Đàn ,Nghệ An ', 22, 'Nguyễn Văn Minh ', '0977738902 ', 5, 3, NULL),
(189, 'user188', 'duytd117@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N188', 'N2', 1, '11 lô H c/c Nguyễn Thiện Thuật,P1,Q3 ', 27, 'Trần Đức Duy ', '0983311725 ', 4, 4, NULL),
(190, 'user189', 'dongtrantrung@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N189', 'N2', 1, '33/5/14, Ấp Tam Đa, Đ.Long Thuận, P. Trường Thạnh,', 35, 'Trần Trung Đông ', '0707.728.842 ', 5, 5, NULL),
(191, 'user190', 'nqdung@saigonnewport.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N190', 'N2', 1, '405/b12 Xô viết nghệ tĩnh , P.24 , Bình Thạnh, TP.', 35, 'NGUYỄN QUỐC DŨNG ', '0903.667.611 ', 5, 4, NULL),
(192, 'user191', 'qkien94@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N191', 'N2', 1, '89, Nguyễn Phi Khanh, P.Tân Định,Q.1, HCM ', 23, 'Nguyễn Thanh Hà ', '0989.016.229 ', 2, 2, NULL),
(193, 'user192', 'truongthenguyen@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N192', 'N2', 1, '72/3 Nguyễn Lâm, P.7, Q.Phú Nhuận, TPHCM ', 33, 'Nguyễn Thế Trường ', '0913627550 ', 4, 5, NULL),
(194, 'user193', 'hltrung@saigonnewport.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N193', 'N3', 1, '183/9C,1, Điện Biên Phủ, P.21, BT, HCM ', 20, 'Hòang Lê Trung ', '0889.250.589 ', 5, 1, NULL),
(195, 'user194', 'duong.business@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N194', 'N3', 1, '80/9 B13, Tân Hòa Đông, P.14, Q.6, HCM  ', 24, 'Nguyễn Thái Dương ', '0933.886.733 ', 3, 1, NULL),
(196, 'user195', 'vmsvnpt@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N195', 'N3', 1, 'P115C c/c Ehome 86 Dương Đình Hội,Phước Long B,Q9 ', 31, 'Hoàng Liên Sơn ', '0908220506 ', 3, 1, NULL),
(197, 'user196', 'ngovu3009@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N196', 'N3', 1, '82/14/9 NGuyễn Xí,P26,Q.Bình Thạnh ', 21, 'Ngô Thục Viên ', '0908292414 ', 2, 2, NULL),
(198, 'user197', 'buidanhhuong@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N197', 'N3', 1, 'A304 cc Ehome Dương Đình Hội,Phước Long B, Q9 ', 34, 'Bùi Danh Hường ', '0909344837 ', 3, 3, NULL),
(199, 'user198', 'chipkhoi2005@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N198', 'N3', 1, '321 c/c1 Bàn Cát,P14,Tân Bình ', 26, 'Cù Thị Tuyết ', '0978312468 ', 3, 1, NULL),
(200, 'user199', 'dinhdung7179@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N199', 'N3', 1, '12/5 Ngô Sỹ Liên,P.Tân Sơn,TP.Thanh Hóa ', 34, 'Vũ Đình Dũng ', '0908504324 ', 5, 5, NULL),
(201, 'user200', 'hangthanhnguyen@holcim.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N200', 'N3', 1, '356 Huỳnh Tấn Phát,BÌnh Thuận,Q7 ', 33, 'Nguyễn Thị Thanh Hằng ', '38724279 ', 2, 5, NULL),
(202, 'user201', 'xuyendo@tafieo.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N201', 'N3', 1, '314 cc An Hòa 1,Trần Trọng Cung,Tân Thuận Đông,Q7 ', 34, 'Đỗ Duy Xuyên ', '0984380380 ', 2, 1, NULL),
(203, 'user202', 'chung9551@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N202', 'N3', 1, '315 cc An Hòa 1,Trần Trọng Cung,Tân Thuận Đông,Q7 ', 35, 'Trần Viết Chung ', '01687825961 ', 3, 1, NULL),
(204, 'user203', 'hieu.nguyen@alamvn.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N203', 'N3', 1, '104/1, Huỳnh Mẫn Đạt, P.2, Q. 5, HCM ', 34, 'Nguyễn Nam Hiếu ', '0903.077.145 ', 4, 4, NULL),
(205, 'user204', 'hnam0904@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N204', 'N3', 1, '359B2, Nguyễn Trọng Tuyển, P.1, Tân Bình, HCM ', 29, 'Vũ Hòai Nam ', '0908.225.588 ', 3, 5, NULL),
(206, 'user205', 'viden2002@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N205', 'N3', 1, '38, Tân Canh, P1, Q. Tân Bình, HCM ', 28, 'Phan Vũ Huyền Trâm ', '0918.281.846 ', 2, 1, NULL),
(207, 'user206', 'tranvansam123@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N206', 'N3', 1, '460/4/24, Lê Văn Luơng, P. Tân Phong, Q.7, HCM ', 23, 'Trần Văn Sâm ', '0918.001.869 ', 3, 2, NULL),
(208, 'user207', 'phanvantungpsc@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N207', 'N3', 1, 'B3A 05 C/C Botanic, 312 Nguyễn Thượng Hiền, P.5, Q', 26, 'Phan Văn Tùng ', '0903.824.779 ', 2, 3, NULL),
(209, 'user208', 'tvchuong75@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N208', 'N3', 1, '184 Đường số 9, Khu Tân Mỹ, P Tân Phú, Q.7 , TP.HC', 21, 'Trần Văn Chương ', '0908188699 ', 4, 1, NULL),
(210, 'user209', 'tuananh_zip_0101@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N209', 'N3', 1, '534/12, D1, Điện Biên Phủ, Q.BT, HCM ', 20, 'Nguyễn Anh Tuấn ', '0982.399.355 ', 5, 5, NULL),
(211, 'user210', 'ahhalife@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N210', 'N3', 1, '525 Nguyễn Thị Định, P.CL, QF.2, HCM ', 24, 'Dương Nguyễn Trà My ', '0984.714.312 ', 3, 3, NULL),
(212, 'user211', 'thoingochuy@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N211', 'N3', 1, 'LôS1_S2, Cao Ốc An Cư, Đ. 8B, KĐTM An Phú An Khánh', 21, 'Thới Ngọc Huy ', '0989.876.956 ', 2, 5, NULL),
(213, 'user212', 'quachthaibao@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N212', 'N3', 1, '553, Trần Hưng Đạo, TP Long Xuyên, T. An Giang ', 30, 'Quách Thái Bảo ', '0903.986.609 ', 4, 2, NULL),
(214, 'user213', 'nguyen_phamphu@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N213', 'N3', 1, '82/43/14, ĐS2, KP 6, Hiệp Bình Phước, Thủ Đức ', 24, 'Phạm Phú Tây Nguyên ', '0913.175.929 ', 4, 4, NULL),
(215, 'user214', 'truongvinh767@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N214', 'N3', 1, '31 tầng 8 CC Cửu Long, P.13, Q.BT, HCM ', 25, 'Trương Văn Vĩnh ', '0938207789 ', 5, 4, NULL),
(216, 'user215', 'dthuong.mbbank@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N215', 'N3', 1, '32 tầng 8 CC Cửu Long, P.13, Q.BT, HCM ', 23, 'Đinh Thị Hương ', '0918607121 ', 4, 4, NULL),
(217, 'user216', 'thanhlan0106@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N216', 'N3', 1, 'Số 20, Huỳnh Văn Cọ, KP6, Thị trấn Củ Chi, HCM ', 25, 'Đặng Thị Thanh Lan ', '0976317286 ', 4, 5, NULL),
(218, 'user217', 'violet9883@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N217', 'N3', 1, '24, đường số 7, P. HBC, Q. Thủ Đức, HCM ', 23, 'Phan Thị Hải Anh ', '0907267696 ', 3, 5, NULL),
(219, 'user218', 'bantaynho09@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N218', 'N3', 1, '9, Giải Phóng, P4, Q.Tân Bình, HCM ', 28, 'Nguyễn Thị Thúy ', '0986102681 ', 2, 1, NULL),
(220, 'user219', 'kfc1902@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N219', 'N3', 1, '9, Giải Phóng, P4, Q.Tân Bình, HCM ', 23, 'Nguyễn Thị Tường Vi ', '01226769871 ', 3, 4, NULL),
(221, 'user220', 'phuongngan@grtoyota-tsusho.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N220', 'N3', 1, '118/890, Nguyễn Kiệm, P.3, Q. GV, HCM ', 27, 'Hồ Nguyễn Phương Ngân ', '0903.117.068 ', 2, 2, NULL),
(222, 'user221', 'vietha_224@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N221', 'N3', 1, '134/18, Phú Hòa, TX Thủ Dầu Một, Bình Dương ', 27, 'Phạm Việt Hà ', '0913629306 ', 5, 1, NULL),
(223, 'user222', 'luongbichtram315@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N222', 'N3', 1, '457 Đại Lộ Bình Dương, P.Phú Cường, TXTDM, Bình Dư', 26, 'Lương Thị Bích Trâm ', '0909848204 ', 3, 2, NULL),
(224, 'user223', 'tu.thuy.diem@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N223', 'N3', 1, '20 Huỳnh Khương Ninh, P.ĐaKao, Q.1, TP.HCM ', 22, 'Từ Thúy Diễm ', '0984945121 ', 3, 5, NULL),
(225, 'user224', 'lethanhthang1@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N224', 'N3', 1, '21 Huỳnh Khương Ninh, P.ĐaKao, Q.1, TP.HCM ', 21, 'Lê Thành Thắng ', '01236968125 ', 5, 4, NULL),
(226, 'user225', 'chuonganhkhoa@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N225', 'N3', 1, '26, Nguyễn Tử Nha, P12, Q Tân Bình, HCM ', 35, 'Chương Anh Khoa ', '0907835538 ', 4, 3, NULL),
(227, 'user226', 'z3ncode@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N226', 'N3', 1, 'Bắc Phương Danh Đập Đá, An Nhơn, Bình Định ', 33, 'Nguyễn Minh Bảo ', '0902006234 ', 4, 5, NULL),
(228, 'user227', 'bichthao230186@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N227', 'N3', 1, '115 Lạc Long Quân, P.10, Q.Tân Bình, TP.HCM ', 35, 'Nguyễn Thị Bích Thảo ', '0906406799 ', 3, 2, NULL);
INSERT INTO `employee` (`employee_id`, `username`, `email`, `password`, `code`, `group_id`, `is_active`, `fullname`, `age`, `address`, `phone`, `role_id`, `type_id`, `group_ifi`) VALUES
(229, 'user228', 'cscchau@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N228', 'N3', 1, '116 Lạc Long Quân, P.10, Q.Tân Bình, TP.HCM ', 24, 'Nguyễn Thanh Tùng Châu ', '0989026689 ', 5, 4, NULL),
(230, 'user229', 'voanhvu873403@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N229', 'N3', 1, '28 Cửu Long, Nha Trang, Khánh Hòa ', 26, 'Võ Anh Vũ ', '0975433482 ', 3, 1, NULL),
(231, 'user230', 'cuongletan67@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N230', 'N3', 1, '29 Cửu Long, Nha Trang, Khánh Hòa ', 24, 'Lê Tấn Cường ', '0903663760 ', 5, 1, NULL),
(232, 'user231', 'wallace_722@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N231', 'N3', 1, '30 Cửu Long, Nha Trang, Khánh Hòa ', 34, 'Nguyễn Văn Tú ', '0914700701 ', 2, 3, NULL),
(233, 'user232', 'socola3839@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N232', 'N3', 1, '31 Cửu Long, Nha Trang, Khánh Hòa ', 34, 'Lê Anh Tấn Phương ', '0909703978 ', 2, 4, NULL),
(234, 'user233', 'thietnk@yahoo.com.vn ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N233', 'N3', 1, '32 Cửu Long, Nha Trang, Khánh Hòa ', 31, 'Nguyễn Kiến Thiết ', '0908046689 ', 4, 5, NULL),
(235, 'user234', 'hviet123@yahoo.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N234', 'N3', 1, '14E3, KP1, P. Thảo Điền, Q.2, HCM ', 23, 'Nguyễn Hoàng Bình ', '0908682687 ', 5, 2, NULL),
(236, 'user235', 'haitran219@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N235', 'N3', 1, '92 đường 3/2, Q. Hải Châu, Tp. Đà Nẵng ', 35, 'Trần Thanh Hải ', '0905190087 ', 5, 3, NULL),
(237, 'user236', 'thanhtram2510@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N236', 'N3', 1, 'Thôn 4, Nghĩa Lâm, Tư Nghĩa, Quảng Ngãi ', 31, 'Trần Thị Thanh Trầm ', '01689022655 ', 5, 3, NULL),
(238, 'user237', 'chinhlt2605@gmail.com ', '$2a$10$YkKKYBHGKGzAxClLDr7B5ugSAuD5z1kWoXWE4mgvxLeXRQRd.Ce4e', 'N237', 'N3', 1, 'Thôn 4, Nghĩa Lâm, Tư Nghĩa, Quảng Ngãi ', 20, 'Lâm Trung Chính ', '0903070371 ', 5, 4, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `group_ifi`
--

CREATE TABLE `group_ifi` (
  `group_id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `group_ifi`
--

INSERT INTO `group_ifi` (`group_id`, `name`) VALUES
('N1', 'Khối N1'),
('N2', 'Khối N2'),
('N3', 'Khối N3'),
('N4', 'Khối N4');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `project`
--

CREATE TABLE `project` (
  `project_id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `group_id` varchar(5) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `start_date` date NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `manager_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `project`
--

INSERT INTO `project` (`project_id`, `name`, `group_id`, `code`, `status`, `start_date`, `description`, `month`, `year`, `end_date`, `manager_id`) VALUES
(2, 'Android Task Monitoring', 'N1', 'PRO001', 1, '2016-04-15', 'Project 1', 0, 0, NULL, 2),
(3, 'Online Mobile Recharge Portal Project', 'N1', 'PRO002', 1, '2016-10-23', 'Project 2', 0, 0, NULL, 2),
(4, 'Detecting E Banking Phishing Websites Using Associative Classification', 'N1', 'PRO003', 1, '2016-06-09', 'Project 3', 0, 0, NULL, 2),
(5, 'Vehicle Tracking Using Driver Mobile Gps Tracking', 'N1', 'PRO004', 1, '2016-04-10', 'Project 4', 0, 0, NULL, 2),
(6, 'Sentiment Analysis for Product Rating', 'N1', 'PRO005', 1, '2016-08-13', 'Project 5', 0, 0, NULL, 2),
(7, 'Fingerprint Based ATM System', 'N1', 'PRO006', 1, '2017-12-10', 'Project 6', 0, 0, NULL, 2),
(8, 'Image Encryption Using AES Algorithm', 'N1', 'PRO007', 1, '2017-02-13', 'Project 7', 0, 0, NULL, 2),
(9, 'Image Encryption Using Triple DES', 'N1', 'PRO008', 1, '2016-08-20', 'Project 8', 0, 0, NULL, 2),
(10, 'Extended AES with Custom Configurable Encryption', 'N1', 'PRO009', 1, '2016-10-09', 'Project 9', 0, 0, NULL, 2),
(11, 'E Commerce Product Rating Based On Customer Review Mining', 'N1', 'PRO010', 1, '2017-10-08', 'Project 10', 0, 0, NULL, 2),
(12, 'Image Steganography With 3 Way Encryption', 'N1', 'PRO011', 1, '2018-02-05', 'Project 11', 0, 0, NULL, 2),
(13, 'Canteen Automation System', 'N1', 'PRO012', 1, '2016-03-18', 'Project 12', 0, 0, NULL, 2),
(14, 'Engineering College Automation and Scheduling System', 'N1', 'PRO013', 1, '2017-07-21', 'Project 13', 0, 0, NULL, 2),
(15, 'Fingerprint Voting System Project', 'N1', 'PRO014', 1, '2016-02-20', 'Project 14', 0, 0, NULL, 2),
(16, 'Employee Hourly Attendance By Barcode Scan', 'N1', 'PRO015', 1, '2017-12-26', 'Project 15', 0, 0, NULL, 2),
(17, 'Weather Forecasting Using Data Mining', 'N1', 'PRO016', 1, '2016-11-02', 'Project 16', 0, 0, NULL, 2),
(18, 'User Web Access Records Mining For Business Intelligence', 'N1', 'PRO017', 1, '2017-03-12', 'Project 17', 0, 0, NULL, 2),
(19, 'Railway Tracking and Arrival Time Prediction', 'N1', 'PRO018', 1, '2016-05-19', 'Project 18', 0, 0, NULL, 2),
(20, 'Android Local Train Ticketing Project', 'N1', 'PRO019', 1, '2017-01-28', 'Project 19', 0, 0, NULL, 2),
(21, 'Android Patient Tracker', 'N1', 'PRO020', 1, '2017-07-07', 'Project 20', 0, 0, NULL, 2),
(22, 'Opinion Mining For Restaurant Reviews', 'N1', 'PRO021', 1, '2016-02-12', 'Project 21', 0, 0, NULL, 2),
(23, 'Website Evaluation Using Opinion Mining', 'N1', 'PRO022', 1, '2016-08-20', 'Project 22', 0, 0, NULL, 2),
(24, 'Opinion Mining For Comment Sentiment Analysis', 'N1', 'PRO023', 1, '2016-03-15', 'Project 23', 0, 0, NULL, 2),
(25, 'Movie Success Prediction Using Data Mining', 'N1', 'PRO024', 1, '2018-02-25', 'Project 24', 0, 0, NULL, 2),
(26, 'Android Customer Relationship Management System', 'N1', 'PRO025', 1, '2016-11-16', 'Project 25', 0, 0, NULL, 2),
(27, 'Android Employee Tracker', 'N1', 'PRO026', 1, '2017-05-23', 'Project 26', 0, 0, NULL, 2),
(28, 'Monitoring Suspicious Discussions On Online Forums Using Data Mining', 'N1', 'PRO027', 1, '2017-12-13', 'Project 27', 0, 0, NULL, 2),
(29, 'Android – PC Chatting & Image Sharing System', 'N1', 'PRO028', 1, '2016-10-02', 'Project 28', 0, 0, NULL, 2),
(30, 'Fake Product Review Monitoring And Removal For Genuine Online Product Reviews Using Opinion Mining', 'N1', 'PRO029', 1, '2017-10-11', 'Project 29', 0, 0, NULL, 2),
(31, 'Web Data Mining To Detect Online Spread Of Terrorism', 'N1', 'PRO030', 1, '2018-03-02', 'Project 30', 0, 0, NULL, 2),
(32, 'Opinion Mining For Social Networking Site', 'N1', 'PRO031', 1, '2017-12-17', 'Project 31', 0, 0, NULL, 2),
(33, 'Biomedical Data Mining For Web Page Relevance Checking', 'N1', 'PRO032', 1, '2016-08-29', 'Project 32', 0, 0, NULL, 2),
(34, 'Data Mining For Automated Personality Classification', 'N1', 'PRO033', 1, '2018-03-09', 'Project 33', 0, 0, NULL, 2),
(35, 'Real Estate Search Based On Data Mining', 'N1', 'PRO034', 1, '2017-01-10', 'Project 34', 0, 0, NULL, 2),
(36, 'Automated Payroll With GPS Tracking And Image Capture', 'N1', 'PRO035', 1, '2016-07-18', 'Project 35', 0, 0, NULL, 2),
(37, 'Unique User Identification Across Multiple Social Networks', 'N1', 'PRO036', 1, '2017-06-27', 'Project 36', 0, 0, NULL, 2),
(38, 'College Enquiry Chat Bot', 'N1', 'PRO037', 1, '2017-07-26', 'Project 37', 0, 0, NULL, 2),
(39, 'Bikers Portal', 'N1', 'PRO038', 1, '2017-07-07', 'Project 38', 0, 0, NULL, 2),
(40, 'Secure Electronic Fund Transfer Over Internet Using DES', 'N1', 'PRO039', 1, '2017-09-25', 'Project 39', 0, 0, NULL, 2),
(41, 'Sentiment Based Movie Rating System', 'N1', 'PRO040', 1, '2016-09-26', 'Project 40', 0, 0, NULL, 2),
(42, 'Advanced Reliable Real Estate Portal', 'N1', 'PRO041', 1, '2016-02-13', 'Project 41', 0, 0, NULL, 2),
(43, 'Diagnostic Centre Client Coordination System', 'N1', 'PRO042', 1, '2017-12-31', 'Project 42', 0, 0, NULL, 2),
(44, 'Improved Data Leakage Detection', 'N1', 'PRO043', 1, '2017-02-23', 'Project 43', 0, 0, NULL, 2),
(45, 'Online Herbs Shopping Project', 'N1', 'PRO044', 1, '2017-09-26', 'Project 44', 0, 0, NULL, 2),
(46, 'Sending a secure message over a network to a remote site', 'N1', 'PRO045', 1, '2017-06-18', 'Project 45', 0, 0, NULL, 2),
(47, 'Online Diagnostic Lab Reporting System', 'N1', 'PRO046', 1, '2016-08-15', 'Project 46', 0, 0, NULL, 2),
(48, 'Online Loan Application & Verification System', 'N1', 'PRO047', 1, '2018-01-01', 'Project 47', 0, 0, NULL, 2),
(49, 'Multi Website Advertisement Handling System', 'N1', 'PRO048', 1, '2017-01-27', 'Project 48', 0, 0, NULL, 2),
(50, 'Secure Data Transfer Over Internet Using Image Steganography', 'N1', 'PRO049', 1, '2016-07-19', 'Project 49', 0, 0, NULL, 2),
(51, 'Airport Network Flight Scheduler', 'N1', 'PRO050', 1, '2016-10-01', 'Project 50', 0, 0, NULL, 2),
(52, 'Image Encryption For Secure Internet Transfer', 'N1', 'PRO051', 1, '2018-03-19', 'Project 51', 0, 0, NULL, 2),
(53, 'Public Photography Contest With Live Voting', 'N1', 'PRO052', 1, '2017-12-28', 'Project 52', 0, 0, NULL, 2),
(54, 'Image Encryption For Secure Internet Transfer', 'N1', 'PRO053', 1, '2017-09-15', 'Project 53', 0, 0, NULL, 2),
(55, 'Public Photography Contest With Live Voting', 'N1', 'PRO054', 1, '2016-10-27', 'Project 54', 0, 0, NULL, 2),
(56, 'Criminal Investigation Tracker with Suspect Prediction', 'N1', 'PRO055', 1, '2018-04-28', 'Project 55', 0, 0, NULL, 2),
(57, 'Distributed Dealership Network Analyzer and Sales Monitor', 'N1', 'PRO056', 1, '2017-01-07', 'Project 56', 0, 0, NULL, 2),
(58, 'E Healthcare – Online Consultation And Medical Subscription', 'N1', 'PRO057', 1, '2016-11-17', 'Project 57', 0, 0, NULL, 2),
(59, 'Automated College Timetable Generator', 'N1', 'PRO058', 1, '2017-03-10', 'Project 58', 0, 0, NULL, 2),
(60, 'Intelligent PC Location Tracking System', 'N1', 'PRO059', 1, '2016-03-21', 'Project 59', 0, 0, NULL, 2),
(61, 'Secure Remote Communication Using DES Algorithm', 'N1', 'PRO060', 1, '2017-12-07', 'Project 60', 0, 0, NULL, 2),
(62, 'Remote Java 2 Dotnet Communication Application', 'N1', 'PRO061', 1, '2017-11-28', 'Project 61', 0, 0, NULL, 2),
(63, 'Internet Based Live Courier Tracking And Delivery System', 'N1', 'PRO062', 1, '2017-06-27', 'Project 62', 0, 0, NULL, 2),
(64, 'Active Chat Monitoring and Suspicious Chat Detection over Internet', 'N1', 'PRO063', 1, '2017-02-05', 'Project 63', 0, 0, NULL, 2),
(65, 'Credit Card Fraud Detection', 'N1', 'PRO064', 1, '2016-12-17', 'Project 64', 0, 0, NULL, 2),
(66, 'Remote User Recognition And Access Provision', 'N1', 'PRO065', 1, '2018-01-04', 'Project 65', 0, 0, NULL, 2),
(67, 'AI Multi Agent Shopping System', 'N1', 'PRO066', 1, '2017-03-13', 'Project 66', 0, 0, NULL, 2),
(68, 'Wireless Indoor Positioning System', 'N1', 'PRO067', 1, '2016-09-29', 'Project 67', 0, 0, NULL, 2),
(69, 'Web Content Trust Rating Prediction Using Evidence Theory', 'N1', 'PRO068', 1, '2016-09-21', 'Project 68', 0, 0, NULL, 2),
(70, 'Topic Detection Using Keyword Clustering', 'N1', 'PRO069', 1, '2017-04-03', 'Project 69', 0, 0, NULL, 2),
(71, 'An Adaptive Social Media Recommendation System', 'N2', 'PRO070', 1, '2017-08-23', 'Project 70', 0, 0, NULL, 2),
(72, 'Tab Based Library Book Availability & Location Finder On Wifi', 'N2', 'PRO071', 1, '2016-01-20', 'Project 71', 0, 0, NULL, 2),
(73, 'Web Mining For Suspicious Keyword Prominence', 'N2', 'PRO072', 1, '2017-08-25', 'Project 72', 0, 0, NULL, 2),
(74, 'Web Agent For Learning Content Updating', 'N2', 'PRO073', 1, '2018-04-07', 'Project 73', 0, 0, NULL, 2),
(75, 'PC Configuration Retrieval System on Online Server', 'N2', 'PRO074', 1, '2017-07-31', 'Project 74', 0, 0, NULL, 2),
(76, 'Web Server Log Analysis System', 'N2', 'PRO075', 1, '2016-09-15', 'Project 75', 0, 0, NULL, 2),
(77, 'Customer Behaviour Prediction Using Web Usage Mining', 'N2', 'PRO076', 1, '2017-12-31', 'Project 76', 0, 0, NULL, 2),
(78, 'Web Server to Client communication for web usage data analysis', 'N2', 'PRO077', 1, '2017-12-09', 'Project 77', 0, 0, NULL, 2),
(79, 'Network Based Stock Price System', 'N2', 'PRO078', 1, '2017-07-05', 'Project 78', 0, 0, NULL, 2),
(80, 'Matrimonial Portal Project', 'N2', 'PRO079', 1, '2017-03-28', 'Project 79', 0, 0, NULL, 2),
(81, 'On Demand Remote PC Monitoring system Through Internet', 'N2', 'PRO080', 1, '2016-12-03', 'Project 80', 0, 0, NULL, 2),
(82, 'Online AI Shopping With M-Wallet System', 'N2', 'PRO081', 1, '2016-02-26', 'Project 81', 0, 0, NULL, 2),
(83, 'Military Access Using Card Scanning With OTP', 'N2', 'PRO082', 1, '2017-07-07', 'Project 82', 0, 0, NULL, 2),
(84, 'Secure ATM Using Card Scanning Plus OTP', 'N2', 'PRO083', 1, '2017-01-31', 'Project 83', 0, 0, NULL, 2),
(85, 'Secure Lab Access Using Card Scanner Plus Face Recognition', 'N2', 'PRO084', 1, '2016-12-27', 'Project 84', 0, 0, NULL, 2),
(86, 'Webpage Ranking Search Engine With Seo Suggester', 'N2', 'PRO085', 1, '2017-11-06', 'Project 85', 0, 0, NULL, 2),
(87, 'Detect Irregular moving objects and tracking based on color and shape in real-time', 'N2', 'PRO086', 1, '2016-10-22', 'Project 86', 0, 0, NULL, 2),
(88, 'Camera Motion Sensing Project', 'N2', 'PRO087', 1, '2016-10-01', 'Project 87', 0, 0, NULL, 2),
(89, 'Collective Face Detection Project', 'N2', 'PRO088', 1, '2018-03-22', 'Project 88', 0, 0, NULL, 2),
(90, 'College automation project', 'N2', 'PRO089', 1, '2016-04-20', 'Project 89', 0, 0, NULL, 2),
(91, 'Online Election System Project', 'N2', 'PRO090', 1, '2017-04-21', 'Project 90', 0, 0, NULL, 2),
(92, 'Automated Attendance System', 'N2', 'PRO091', 1, '2016-05-12', 'Project 91', 0, 0, NULL, 2),
(93, 'Mobile Attendance System Project', 'N2', 'PRO092', 1, '2018-02-19', 'Project 92', 0, 0, NULL, 2),
(94, 'WiFi Shopping Guide Project', 'N2', 'PRO093', 1, '2017-07-04', 'Project 93', 0, 0, NULL, 2),
(95, 'Cursor Movement By Hand Gesture Project', 'N2', 'PRO094', 1, '2016-03-28', 'Project 94', 0, 0, NULL, 2),
(96, 'Mobile Quiz Through WiFi Project', 'N2', 'PRO095', 1, '2016-11-06', 'Project 95', 0, 0, NULL, 2),
(97, 'The Cibil System Project', 'N2', 'PRO096', 1, '2017-06-13', 'Project 96', 0, 0, NULL, 2),
(98, 'Android Merchant Application Using Qr', 'N2', 'PRO097', 1, '2016-06-16', 'Project 97', 0, 0, NULL, 2),
(99, 'Advanced Mobile Store', 'N2', 'PRO098', 1, '2016-12-14', 'Project 98', 0, 0, NULL, 2),
(100, 'Artificial Intelligence Dietician', 'N2', 'PRO099', 1, '2017-04-21', 'Project 99', 0, 0, NULL, 2),
(101, 'Look Based Media Player', 'N2', 'PRO100', 1, '2016-08-24', 'Project 100', 0, 0, NULL, 2),
(102, 'Banking Bot Project', 'N2', 'PRO101', 1, '2016-01-16', 'Project 101', 0, 0, NULL, 2),
(103, 'Android Voting System', 'N2', 'PRO102', 1, '2016-01-27', 'Project 102', 0, 0, NULL, 2),
(104, 'Android File finder and Sorting', 'N2', 'PRO103', 1, '2016-08-14', 'Project 103', 0, 0, NULL, 2),
(105, 'Android Tourist Guide Project', 'N2', 'PRO104', 1, '2018-01-20', 'Project 104', 0, 0, NULL, 2),
(106, 'Android AI Diet Consultant', 'N2', 'PRO105', 1, '2016-03-18', 'Project 105', 0, 0, NULL, 2),
(107, 'Android Blood Bank', 'N2', 'PRO106', 1, '2016-01-10', 'Project 106', 0, 0, NULL, 2),
(108, 'Bus Pass Android Project', 'N2', 'PRO107', 1, '2017-07-09', 'Project 107', 0, 0, NULL, 2),
(109, 'Android Based Parking Booking System', 'N2', 'PRO108', 1, '2018-02-02', 'Project 108', 0, 0, NULL, 2),
(110, 'Android Based Furniture Shopping', 'N2', 'PRO109', 1, '2018-03-03', 'Project 109', 0, 0, NULL, 2),
(111, 'Grocery Shopping Android', 'N2', 'PRO110', 1, '2016-04-06', 'Project 110', 0, 0, NULL, 2),
(112, 'Face Recognition Attendance System', 'N2', 'PRO111', 1, '2017-02-04', 'Project 111', 0, 0, NULL, 2),
(113, 'Driver Card With Qr Code Identification', 'N2', 'PRO112', 1, '2018-04-01', 'Project 112', 0, 0, NULL, 2),
(114, 'Detecting Data Leaks', 'N2', 'PRO113', 1, '2016-08-10', 'Project 113', 0, 0, NULL, 2),
(115, 'Mobile(location based) Advertisement System', 'N2', 'PRO114', 1, '2017-12-21', 'Project 114', 0, 0, NULL, 2),
(116, 'Medical Search Engine Project', 'N2', 'PRO115', 1, '2017-01-04', 'Project 115', 0, 0, NULL, 2),
(117, 'Automatic Answer Checker', 'N2', 'PRO116', 1, '2017-12-16', 'Project 116', 0, 0, NULL, 2),
(118, 'Document checker and Corrector Project', 'N2', 'PRO117', 1, '2017-08-14', 'Project 117', 0, 0, NULL, 2),
(119, 'AI Desktop Partner', 'N2', 'PRO118', 1, '2017-11-10', 'Project 118', 0, 0, NULL, 2),
(120, 'Car Sales And Inventory Store Project', 'N2', 'PRO119', 1, '2018-04-14', 'Project 119', 0, 0, NULL, 2),
(121, 'Media player Project', 'N2', 'PRO120', 1, '2016-04-21', 'Project 120', 0, 0, NULL, 2),
(122, 'Education Assignment Dashboard', 'N2', 'PRO121', 1, '2017-01-13', 'Project 121', 0, 0, NULL, 2),
(123, 'LED display generator project', 'N2', 'PRO122', 1, '2017-07-04', 'Project 122', 0, 0, NULL, 2),
(124, 'Human Speed Detection Project', 'N2', 'PRO123', 1, '2016-11-21', 'Project 123', 0, 0, NULL, 2),
(125, 'Cargo Booking Software', 'N2', 'PRO124', 1, '2017-10-08', 'Project 124', 0, 0, NULL, 2),
(126, 'Mobile Banking Project', 'N2', 'PRO125', 1, '2017-03-17', 'Project 125', 0, 0, NULL, 2),
(127, 'Facial Expression Recognition', 'N2', 'PRO126', 1, '2016-06-18', 'Project 126', 0, 0, NULL, 2),
(128, 'Graphical Password By Image Segmentation', 'N2', 'PRO127', 1, '2017-11-07', 'Project 127', 0, 0, NULL, 2),
(129, 'Video Surveillance Project', 'N2', 'PRO128', 1, '2017-09-03', 'Project 128', 0, 0, NULL, 2),
(130, 'Image Mining Project', 'N2', 'PRO129', 1, '2016-10-04', 'Project 129', 0, 0, NULL, 2),
(131, 'Smart Health Consulting Project', 'N2', 'PRO130', 1, '2016-09-04', 'Project 130', 0, 0, NULL, 2),
(132, 'Farming Assistance Web Service', 'N2', 'PRO131', 1, '2017-09-21', 'Project 131', 0, 0, NULL, 2),
(133, 'Corporate Dashboard Project', 'N2', 'PRO132', 1, '2017-06-26', 'Project 132', 0, 0, NULL, 2),
(134, 'iPad Restaurant Application', 'N2', 'PRO133', 1, '2017-03-17', 'Project 133', 0, 0, NULL, 2),
(135, 'Detecting Edges Using Image Processor', 'N2', 'PRO134', 1, '2018-04-04', 'Project 134', 0, 0, NULL, 2),
(136, 'Mobile(location based) Advertisement System', 'N2', 'PRO135', 1, '2017-03-21', 'Project 135', 0, 0, NULL, 2),
(137, 'Sql Injection Prevention Project', 'N2', 'PRO136', 1, '2017-10-30', 'Project 136', 0, 0, NULL, 2),
(138, 'Smart Health consulting system', 'N2', 'PRO137', 1, '2017-01-20', 'Project 137', 0, 0, NULL, 2),
(139, 'Wireless Data Handling And Management', 'N2', 'PRO138', 1, '2016-03-14', 'Project 138', 0, 0, NULL, 2),
(140, 'Android Anti-Virus Application', 'N2', 'PRO139', 1, '2016-09-13', 'Project 139', 0, 0, NULL, 2),
(141, 'Storage/Energy efficient Cloud Computing', 'N2', 'PRO140', 1, '2018-04-09', 'Project 140', 0, 0, NULL, 2),
(142, 'Cloud computing for Rural banking', 'N2', 'PRO141', 1, '2017-08-04', 'Project 141', 0, 0, NULL, 2),
(143, 'E-Learning Platform using Cloud Computing', 'N2', 'PRO142', 1, '2016-08-02', 'Project 142', 0, 0, NULL, 2),
(144, 'Automated Canteen Ordering System using Android', 'N2', 'PRO143', 1, '2017-12-31', 'Project 143', 0, 0, NULL, 2),
(145, 'RFID Based Automatic Traffic Violation Ticketing', 'N2', 'PRO144', 1, '2017-09-09', 'Project 144', 0, 0, NULL, 2),
(146, 'Android Based Visual Product Identification For The Blind', 'N2', 'PRO145', 1, '2016-03-19', 'Project 145', 0, 0, NULL, 2),
(147, 'Android Offloading Computation Over Cloud', 'N2', 'PRO146', 1, '2018-03-18', 'Project 146', 0, 0, NULL, 2),
(148, 'Android Based Universal Ticketing Project', 'N2', 'PRO147', 1, '2016-02-11', 'Project 147', 0, 0, NULL, 2),
(149, 'Smart Health Prediction Using Data Mining', 'N2', 'PRO148', 1, '2017-02-22', 'Project 148', 0, 0, NULL, 2),
(150, 'ERP System For Institutes', 'N2', 'PRO149', 1, '2016-11-23', 'Project 149', 0, 0, NULL, 2),
(151, 'Efficient Doctor Patient Portal', 'N2', 'PRO150', 1, '2017-09-13', 'Project 150', 0, 0, NULL, 2),
(152, 'Online Bookstore System On Cloud Infrastructure', 'N2', 'PRO151', 1, '2016-03-14', 'Project 151', 0, 0, NULL, 2),
(153, 'Cloud Based Online Blood Bank System', 'N2', 'PRO152', 1, '2016-04-01', 'Project 152', 0, 0, NULL, 2),
(154, 'Cloud Based Local Train Ticketing System', 'N2', 'PRO153', 1, '2017-06-03', 'Project 153', 0, 0, NULL, 2),
(155, 'Cloud Based Bus Pass System', 'N2', 'PRO154', 1, '2016-04-10', 'Project 154', 0, 0, NULL, 2),
(156, 'Cloud Based Career Guidance System', 'N2', 'PRO155', 1, '2017-11-10', 'Project 155', 0, 0, NULL, 2),
(157, 'Android Bluetooth Chat', 'N2', 'PRO156', 1, '2017-02-02', 'Project 156', 0, 0, NULL, 2),
(158, 'Bus Pass with Barcode Card scan', 'N2', 'PRO157', 1, '2017-04-27', 'Project 157', 0, 0, NULL, 2),
(159, 'Bus Pass with webcam Scan', 'N2', 'PRO158', 1, '2016-01-31', 'Project 158', 0, 0, NULL, 2),
(160, 'Employee attendance System By Qr Scan', 'N2', 'PRO159', 1, '2016-11-28', 'Project 159', 0, 0, NULL, 2),
(161, 'Online Printed T-Shirt Designing', 'N2', 'PRO160', 1, '2017-10-07', 'Project 160', 0, 0, NULL, 2),
(162, 'Online Visiting Card Creation Project', 'N2', 'PRO161', 1, '2017-08-19', 'Project 161', 0, 0, NULL, 2),
(163, 'Online Ebook Maker Project', 'N2', 'PRO162', 1, '2016-09-16', 'Project 162', 0, 0, NULL, 2),
(164, 'MLM Project', 'N2', 'PRO163', 1, '2017-05-29', 'Project 163', 0, 0, NULL, 2),
(165, 'Three Level Password Authentication System', 'N3', 'PRO164', 1, '2018-04-18', 'Project 164', 0, 0, NULL, 2),
(166, 'Question paper generator system', 'N3', 'PRO165', 1, '2016-06-27', 'Project 165', 0, 0, NULL, 2),
(167, 'Hotel Management Android Project', 'N3', 'PRO166', 1, '2016-04-10', 'Project 166', 0, 0, NULL, 2),
(168, 'Intelligent Tourist System Project', 'N3', 'PRO167', 1, '2017-12-09', 'Project 167', 0, 0, NULL, 2),
(169, 'Android Vehicle Tracking Application', 'N3', 'PRO168', 1, '2016-12-06', 'Project 168', 0, 0, NULL, 2),
(170, 'Software Piracy Protection Project', 'N3', 'PRO169', 1, '2017-10-19', 'Project 169', 0, 0, NULL, 2),
(171, 'Multi Coverage Broadcast', 'N3', 'PRO170', 1, '2017-09-07', 'Project 170', 0, 0, NULL, 2),
(172, 'Mobile Network Stability', 'N3', 'PRO171', 1, '2017-11-04', 'Project 171', 0, 0, NULL, 2),
(173, 'Attack Source Tracing Project', 'N3', 'PRO172', 1, '2016-08-05', 'Project 172', 0, 0, NULL, 2),
(174, 'Mobile Networks Load Balancing', 'N3', 'PRO173', 1, '2017-08-10', 'Project 173', 0, 0, NULL, 2),
(175, 'Graphical Password Strategy', 'N3', 'PRO174', 1, '2016-11-12', 'Project 174', 0, 0, NULL, 2),
(176, 'Android location alarm', 'N3', 'PRO175', 1, '2016-10-28', 'Project 175', 0, 0, NULL, 2),
(177, 'College Social Networking Web Project', 'N3', 'PRO176', 1, '2017-04-12', 'Project 176', 0, 0, NULL, 2),
(178, 'Voice Logger Software Project', 'N3', 'PRO177', 1, '2017-09-26', 'Project 177', 0, 0, NULL, 2),
(179, 'Seo optimizer and suggester', 'N3', 'PRO178', 1, '2017-12-05', 'Project 178', 0, 0, NULL, 2),
(180, 'Enhanced Library Management System', 'N3', 'PRO179', 1, '2016-12-22', 'Project 179', 0, 0, NULL, 2),
(181, 'Custom Web Search With User Centric Map', 'N3', 'PRO180', 1, '2016-04-24', 'Project 180', 0, 0, NULL, 2),
(182, 'Android Joystick Application', 'N3', 'PRO181', 1, '2016-07-13', 'Project 181', 0, 0, NULL, 2),
(183, 'Storage/Energy efficient Cloud Computing', 'N3', 'PRO182', 1, '2016-10-23', 'Project 182', 0, 0, NULL, 2),
(184, 'Image Editor Project', 'N3', 'PRO183', 1, '2018-02-13', 'Project 183', 0, 0, NULL, 2),
(185, 'Net Tracer (ACTIVE NETWORK MONITORING)', 'N3', 'PRO184', 1, '2016-02-12', 'Project 184', 0, 0, NULL, 2),
(186, 'Mobile Ticketing Project', 'N3', 'PRO185', 1, '2016-06-24', 'Project 185', 0, 0, NULL, 2),
(187, 'Mobile Self Encryption', 'N3', 'PRO186', 1, '2018-03-09', 'Project 186', 0, 0, NULL, 2),
(188, 'Visual Cryptography (Image encryption and decryption)', 'N3', 'PRO187', 1, '2016-01-17', 'Project 187', 0, 0, NULL, 2),
(189, 'Video Steganography', 'N3', 'PRO188', 1, '2018-01-25', 'Project 188', 0, 0, NULL, 2),
(190, 'Lan based discussion forum', 'N3', 'PRO189', 1, '2016-09-29', 'Project 189', 0, 0, NULL, 2),
(191, 'file encryption using fibonacci series', 'N3', 'PRO190', 1, '2017-12-05', 'Project 190', 0, 0, NULL, 2),
(192, 'Hybrid AES DES encryption algorithm(any combination of algorithms is available)', 'N3', 'PRO191', 1, '2016-05-28', 'Project 191', 0, 0, NULL, 2),
(193, 'Stock Market Analysis and Prediction', 'N3', 'PRO192', 1, '2016-02-03', 'Project 192', 0, 0, NULL, 2),
(194, 'Student Attendance with Fingerprint Reader', 'N3', 'PRO193', 1, '2016-07-21', 'Project 193', 0, 0, NULL, 2),
(195, 'Online Law System', 'N3', 'PRO194', 1, '2016-07-09', 'Project 194', 0, 0, NULL, 2),
(196, 'Data Protection Using Hand Gesture Recognition', 'N3', 'PRO195', 1, '2017-03-02', 'Project 195', 0, 0, NULL, 2),
(197, 'Digital Watermarking Project', 'N3', 'PRO196', 1, '2017-08-29', 'Project 196', 0, 0, NULL, 2),
(198, 'Improved Honeypot Project', 'N3', 'PRO197', 1, '2017-09-29', 'Project 197', 0, 0, NULL, 2),
(199, 'Internet Border Patrol', 'N3', 'PRO198', 1, '2017-11-28', 'Project 198', 0, 0, NULL, 2),
(200, 'Traffic Signal: Management & Control System', 'N3', 'PRO199', 1, '2017-06-08', 'Project 199', 0, 0, NULL, 2),
(201, 'Download accelerator', 'N3', 'PRO200', 1, '2016-11-17', 'Project 200', 0, 0, NULL, 2),
(202, 'Intelligent Chat Bot', 'N3', 'PRO201', 1, '2017-07-14', 'Project 201', 0, 0, NULL, 2),
(203, 'E Governance project', 'N3', 'PRO202', 1, '2016-08-25', 'Project 202', 0, 0, NULL, 2),
(204, 'Detecting Data Leaks', 'N3', 'PRO203', 1, '2016-10-26', 'Project 203', 0, 0, NULL, 2),
(205, 'Android location alarm', 'N3', 'PRO204', 1, '2016-08-20', 'Project 204', 0, 0, NULL, 2),
(206, 'Gps Based Human Tracking', 'N3', 'PRO205', 1, '2018-03-04', 'Project 205', 0, 0, NULL, 2),
(207, 'Web Filtering Software', 'N3', 'PRO206', 1, '2017-08-07', 'Project 206', 0, 0, NULL, 2),
(208, 'Lan Messenger Software Project', 'N3', 'PRO207', 1, '2017-06-23', 'Project 207', 0, 0, NULL, 2),
(209, 'Student Examination Datacard', 'N3', 'PRO208', 1, '2016-07-14', 'Project 208', 0, 0, NULL, 2),
(210, 'Enhanced Kmeans algorithm', 'N3', 'PRO209', 1, '2017-04-05', 'Project 209', 0, 0, NULL, 2),
(211, 'Student Attendance System by Barcode Scan', 'N3', 'PRO210', 1, '2016-03-21', 'Project 210', 0, 0, NULL, 2),
(212, 'Student Attendance System By Qr Scan', 'N3', 'PRO211', 1, '2018-02-25', 'Project 211', 0, 0, NULL, 2),
(213, 'Hotel Reservation Android', 'N3', 'PRO212', 1, '2016-07-28', 'Project 212', 0, 0, NULL, 2),
(214, 'Festival Calendar System with Business Promotion', 'N3', 'PRO213', 1, '2017-07-30', 'Project 213', 0, 0, NULL, 2),
(215, 'Online book recommendation system using Collaborative filtering', 'N3', 'PRO214', 1, '2017-05-30', 'Project 214', 0, 0, NULL, 2),
(216, 'Diabetes Prediction Using Data Mining', 'N3', 'PRO215', 1, '2016-12-30', 'Project 215', 0, 0, NULL, 2),
(217, 'Data Mining for Sales Prediction in Tourism Industry', 'N3', 'PRO216', 1, '2016-01-31', 'Project 216', 0, 0, NULL, 2),
(218, 'Higher Education Access Prediction Software', 'N3', 'PRO217', 1, '2016-12-11', 'Project 217', 0, 0, NULL, 2),
(219, 'Hotel Recommendation System Based on Hybrid Recommendation Model', 'N3', 'PRO218', 1, '2017-07-04', 'Project 218', 0, 0, NULL, 2),
(220, 'Detecting Fraud Apps Using Sentiment Analysis', 'N3', 'PRO219', 1, '2016-09-02', 'Project 219', 0, 0, NULL, 2),
(221, 'Personality Prediction System Through CV Analysis', 'N3', 'PRO220', 1, '2016-05-22', 'Project 220', 0, 0, NULL, 2),
(222, 'TV Show Popularity Analysis Using Data Mining', 'N3', 'PRO221', 1, '2018-03-04', 'Project 221', 0, 0, NULL, 2),
(223, 'Twitter Trend Analysis Using Latent Dirichlet Allocation', 'N3', 'PRO222', 1, '2016-03-22', 'Project 222', 0, 0, NULL, 2),
(224, 'Your Personal Nutritionist Using FatSecret API', 'N3', 'PRO223', 1, '2016-02-09', 'Project 223', 0, 0, NULL, 2),
(225, 'Secure E Learning Using Data Mining Techniques', 'N3', 'PRO224', 1, '2016-11-27', 'Project 224', 0, 0, NULL, 2),
(226, 'Price Negotiator Ecommerce ChatBot System', 'N3', 'PRO225', 1, '2016-04-11', 'Project 225', 0, 0, NULL, 2),
(227, 'Predicting User Behavior Through Sessions Web Mining', 'N3', 'PRO226', 1, '2017-01-29', 'Project 226', 0, 0, NULL, 2),
(228, 'Online Book Recommendation Using Collaborative Filtering', 'N3', 'PRO227', 1, '2017-06-23', 'Project 227', 0, 0, NULL, 2),
(229, 'Movie Success Prediction Using Data Mining Php', 'N3', 'PRO228', 1, '2016-09-16', 'Project 228', 0, 0, NULL, 2),
(230, 'Monitoring Suspicious Discussions On Online Forums Php', 'N3', 'PRO229', 1, '2017-08-02', 'Project 229', 0, 0, NULL, 2),
(231, 'Fake Product Review Monitoring & Removal For Genuine Ratings Php', 'N3', 'PRO230', 1, '2018-04-05', 'Project 230', 0, 0, NULL, 2),
(232, 'Detecting E Banking Phishing Using Associative Classification', 'N3', 'PRO231', 1, '2017-01-28', 'Project 231', 0, 0, NULL, 2),
(233, 'A Commodity Search System For Online Shopping Using Web Mining', 'N3', 'PRO232', 1, '2018-04-18', 'Project 232', 0, 0, NULL, 2),
(234, 'Detecting Phishing Websites Using Machine Learning', 'N3', 'PRO233', 1, '2016-01-07', 'Project 233', 0, 0, NULL, 2),
(235, 'Student Information Chatbot Project', 'N3', 'PRO234', 1, '2016-06-08', 'Project 234', 0, 0, NULL, 2),
(236, 'Website Evaluation Using Opinion Mining', 'N3', 'PRO235', 1, '2018-02-14', 'Project 235', 0, 0, NULL, 2),
(237, 'Filtering political sentiment in social media from textual information', 'N3', 'PRO236', 1, '2016-01-04', 'Project 236', 0, 0, NULL, 2),
(238, 'Evaluation of Academic Performance of Students with Fuzzy Logic', 'N3', 'PRO237', 1, '2017-06-26', 'Project 237', 0, 0, NULL, 2),
(239, 'Document Sentiment Analysis Using Opinion Mining', 'N3', 'PRO238', 1, '2018-02-27', 'Project 238', 0, 0, NULL, 2),
(240, 'Crime Rate Prediction Using K Means', 'N3', 'PRO239', 1, '2017-10-02', 'Project 239', 0, 0, NULL, 2),
(241, 'Cooking Recipe Rating Based On Sentiment Analysis', 'N3', 'PRO240', 1, '2017-12-09', 'Project 240', 0, 0, NULL, 2),
(242, 'Social Media Community Using Optimized Clustering Algorithm', 'N3', 'PRO241', 1, '2016-11-29', 'Project 241', 0, 0, NULL, 2),
(243, 'Online user Behavior Analysis On Graphical Model', 'N3', 'PRO242', 1, '2017-11-24', 'Project 242', 0, 0, NULL, 2),
(244, 'Student Grade Prediction Using C4.5 Decision Tree', 'N3', 'PRO243', 1, '2016-01-19', 'Project 243', 0, 0, NULL, 2),
(245, 'Cancer Prediction Using Data Mining', 'N3', 'PRO244', 1, '2017-09-23', 'Project 244', 0, 0, NULL, 2),
(246, 'Symptom Based Clinical Document Clustering by Matrix Factorization', 'N3', 'PRO245', 1, '2016-11-19', 'Project 245', 0, 0, NULL, 2),
(247, 'Using Data Mining To Improve Consumer Retailer Connectivity', 'N3', 'PRO246', 1, '2016-09-21', 'Project 246', 0, 0, NULL, 2),
(248, 'Financial Status Analysis Using Credit Score Rating', 'N3', 'PRO247', 1, '2016-05-11', 'Project 247', 0, 0, NULL, 2),
(249, 'E Banking Log System', 'N3', 'PRO248', 1, '2016-01-05', 'Project 248', 0, 0, NULL, 2),
(250, 'Stream Analysis For Career Choice Aptitude Tests', 'N3', 'PRO249', 1, '2017-02-16', 'Project 249', 0, 0, NULL, 2),
(251, 'Product Review Analysis For Genuine Rating', 'N3', 'PRO250', 1, '2016-04-15', 'Project 250', 0, 0, NULL, 2),
(252, 'Periodic Census With Graphical Representation', 'N3', 'PRO251', 1, '2016-06-12', 'Project 251', 0, 0, NULL, 2),
(253, 'Android Smart City Traveler', 'N3', 'PRO252', 1, '2017-07-30', 'Project 252', 0, 0, NULL, 2),
(254, 'Heart Disease Prediction Project', 'N3', 'PRO253', 1, '2016-04-25', 'Project 253', 0, 0, NULL, 2),
(255, 'Content Summary Generation Using NLP', 'N3', 'PRO254', 1, '2017-10-04', 'Project 254', 0, 0, NULL, 2),
(256, 'Monitoring Suspicious Discussions On Online Forums Using Data Mining', 'N3', 'PRO255', 1, '2017-01-07', 'Project 255', 0, 0, NULL, 2),
(257, 'Opinion Mining For Social Networking Site', 'N3', 'PRO256', 1, '2017-05-04', 'Project 256', 0, 0, NULL, 2),
(258, 'Web Content Trust Rating Prediction Using Evidence Theory', 'N3', 'PRO257', 1, '2016-02-03', 'Project 257', 0, 0, NULL, 2),
(259, 'Topic Detection Using Keyword Clustering', 'N3', 'PRO258', 1, '2017-04-18', 'Project 258', 0, 0, NULL, 2),
(260, 'An Adaptive Social Media Recommendation System', 'N3', 'PRO259', 1, '2017-09-18', 'Project 259', 0, 0, NULL, 2),
(261, 'Detecting E Banking Phishing Websites Using Associative Classification', 'N3', 'PRO260', 1, '2016-10-06', 'Project 260', 0, 0, NULL, 2),
(262, 'Canteen Automation System', 'N3', 'PRO261', 1, '2018-03-24', 'Project 261', 0, 0, NULL, 2),
(263, 'Opinion Mining For Hotel Rating Through Reviews', 'N3', 'PRO262', 1, '2016-05-22', 'Project 262', 0, 0, NULL, 2),
(264, 'Employee Performance Evaluation For Top Performers & Recruitment', 'N3', 'PRO263', 1, '2016-09-23', 'Project 263', 0, 0, NULL, 2),
(265, 'Data Mining For Improved Customer Relationship Management', 'N3', 'PRO264', 1, '2017-07-19', 'Project 264', 0, 0, NULL, 2),
(266, 'Social Network Privacy Using Two Tales Of Privacy Algorithm', 'N3', 'PRO265', 1, '2017-06-20', 'Project 265', 0, 0, NULL, 2),
(267, 'Impartial Intrusion & Crime Detection Without Gender or Caste Discrimination', 'N3', 'PRO266', 1, '2017-09-11', 'Project 266', 0, 0, NULL, 2),
(268, 'A neuro-fuzzy agent based group decision HR system for candidate ranking', 'N3', 'PRO267', 1, '2016-09-06', 'Project 267', 0, 0, NULL, 2),
(269, 'Workload & Resource Consumption Analysis For Online Travel & Booking Site', 'N3', 'PRO268', 1, '2017-09-25', 'Project 268', 0, 0, NULL, 2),
(270, 'Performance Evaluation in Virtual Organizations Using Data Mining & Opinion Mining', 'N3', 'PRO269', 1, '2016-12-02', 'Project 269', 0, 0, NULL, 2),
(271, 'Website Evaluation Using Opinion Mining', 'N3', 'PRO270', 1, '2016-06-30', 'Project 270', 0, 0, NULL, 2),
(272, 'E Commerce Product Rating Based On Customer Review Mining', 'N3', 'PRO271', 1, '2018-04-21', 'Project 271', 0, 0, NULL, 2),
(273, 'Weather Forecasting Using Data Mining', 'N3', 'PRO272', 1, '2017-11-20', 'Project 272', 0, 0, NULL, 2),
(274, 'Unique User Identification Across Multiple Social Networks', 'N3', 'PRO273', 1, '2017-07-28', 'Project 273', 0, 0, NULL, 2),
(275, 'Opinion Mining For Restaurant Reviews', 'N3', 'PRO274', 1, '2016-03-28', 'Project 274', 0, 0, NULL, 2),
(276, 'Sentiment Analysis for Product Rating', 'N3', 'PRO275', 1, '2017-08-17', 'Project 275', 0, 0, NULL, 2),
(277, 'Opinion Mining For Comment Sentiment Analysis', 'N3', 'PRO276', 1, '2016-04-17', 'Project 276', 0, 0, NULL, 2),
(278, 'Movie Success Prediction Using Data Mining', 'N3', 'PRO277', 1, '2016-05-02', 'Project 277', 0, 0, NULL, 2),
(279, 'Fake Product Review Monitoring And Removal For Genuine Online Product Reviews Using Opinion Mining', 'N3', 'PRO278', 1, '2016-10-22', 'Project 278', 0, 0, NULL, 2),
(280, 'Biomedical Data Mining For Web Page Relevance Checking', 'N3', 'PRO279', 1, '2017-05-15', 'Project 279', 0, 0, NULL, 2),
(281, 'Data Mining For Automated Personality Classification', 'N3', 'PRO280', 1, '2017-10-29', 'Project 280', 0, 0, NULL, 2),
(282, 'Web Data Mining To Detect Online Spread Of Terrorism', 'N3', 'PRO281', 1, '2016-11-05', 'Project 281', 0, 0, NULL, 2),
(283, 'Real Estate Search Based On Data Mining', 'N3', 'PRO282', 1, '2017-12-30', 'Project 282', 0, 0, NULL, 2),
(284, 'College Enquiry Chat Bot', 'N3', 'PRO283', 1, '2017-02-20', 'Project 283', 0, 0, NULL, 2),
(285, 'Bikers Portal', 'N3', 'PRO284', 1, '2018-03-26', 'Project 284', 0, 0, NULL, 2),
(286, 'Smart Health Prediction Using Data Mining', 'N3', 'PRO285', 1, '2016-03-21', 'Project 285', 0, 0, NULL, 2),
(287, 'Image Mining Project', 'N3', 'PRO286', 1, '2017-06-05', 'Project 286', 0, 0, NULL, 2),
(288, 'Advanced Reliable Real Estate Portal', 'N3', 'PRO287', 1, '2016-01-01', 'Project 287', 0, 0, NULL, 2),
(289, 'User Web Access Records Mining For Business Intelligence', 'N3', 'PRO288', 1, '2018-04-20', 'Project 288', 0, 0, NULL, 2),
(290, 'Mobile(location based) Advertisement System', 'N3', 'PRO289', 1, '2016-08-04', 'Project 289', 0, 0, NULL, 2),
(291, 'Smart Health Consulting Project', 'N3', 'PRO290', 1, '2016-01-30', 'Project 290', 0, 0, NULL, 2),
(292, 'Sentiment Based Movie Rating System', 'N3', 'PRO291', 1, '2018-02-21', 'Project 291', 0, 0, NULL, 2),
(293, 'Question paper generator system', 'N3', 'PRO292', 1, '2017-06-05', 'Project 292', 0, 0, NULL, 2),
(294, 'Seo optimizer and suggester', 'N3', 'PRO293', 1, '2017-07-31', 'Project 293', 0, 0, NULL, 2),
(295, 'Banking Bot Project', 'N3', 'PRO294', 1, '2017-03-06', 'Project 294', 0, 0, NULL, 2),
(296, 'Web Mining For Suspicious Keyword Prominence', 'N3', 'PRO295', 1, '2017-06-21', 'Project 295', 0, 0, NULL, 2),
(297, 'Customer Behaviour Prediction Using Web Usage Mining', 'N3', 'PRO296', 1, '2017-05-10', 'Project 296', 0, 0, NULL, 2),
(298, 'Stock Market Analysis and Prediction', 'N3', 'PRO297', 1, '2017-05-22', 'Project 297', 0, 0, NULL, 2),
(299, 'Android Offloading Computation Over Cloud', 'N3', 'PRO298', 1, '2017-06-13', 'Project 298', 0, 0, NULL, 2),
(300, 'Secure Text Transfer Using Diffie Hellman Key Exchange Based on Cloud', 'N3', 'PRO299', 1, '2016-12-30', 'Project 299', 0, 0, NULL, 2),
(301, 'University Campus Online Automation Using Cloud Computing', 'N3', 'PRO300', 1, '2016-10-07', 'Project 300', 0, 0, NULL, 2),
(302, 'Intelligent rule-based phishing websites classification Based on URL Features', 'N3', 'PRO301', 1, '2016-05-23', 'Project 301', 0, 0, NULL, 2),
(303, 'Customized AES using Pad and Chaff Technique And Diffie Hellman Key Exchange', 'N3', 'PRO302', 1, '2016-08-18', 'Project 302', 0, 0, NULL, 2),
(304, 'Detecting Data Leaks via Sql Injection Prevention on an E-Commerce', 'N3', 'PRO303', 1, '2016-06-01', 'Project 303', 0, 0, NULL, 2),
(305, 'Cloud Based Attendance System', 'N3', 'PRO304', 1, '2017-08-14', 'Project 304', 0, 0, NULL, 2),
(306, 'Cloud Based Improved File Handling and Duplication Removal Using MD5', 'N3', 'PRO305', 1, '2018-02-21', 'Project 305', 0, 0, NULL, 2),
(307, 'Cloud Based Student Information Chatbot Project', 'N3', 'PRO306', 1, '2017-05-15', 'Project 306', 0, 0, NULL, 2),
(308, 'Secure File Storage On Cloud Using Hybrid Cryptography', 'N3', 'PRO307', 1, '2017-03-06', 'Project 307', 0, 0, NULL, 2),
(309, 'Secure File Storage On Cloud Using Hybrid Cryptography', 'N3', 'PRO308', 1, '2016-01-23', 'Project 308', 0, 0, NULL, 2),
(310, 'Online Bookstore System On Cloud Infrastructure', 'N3', 'PRO309', 1, '2017-05-13', 'Project 309', 0, 0, NULL, 2),
(311, 'Cloud Based Online Blood Bank System', 'N3', 'PRO310', 1, '2016-01-14', 'Project 310', 0, 0, NULL, 2),
(312, 'Cloud Based Local Train Ticketing System', 'N3', 'PRO311', 1, '2017-05-03', 'Project 311', 0, 0, NULL, 2),
(313, 'Cloud Based Bus Pass System', 'N3', 'PRO312', 1, '2016-10-26', 'Project 312', 0, 0, NULL, 2),
(314, 'E-Learning Platform using Cloud Computing', 'N3', 'PRO313', 1, '2018-03-15', 'Project 313', 0, 0, NULL, 2),
(315, 'Storage and Energy Efficient Cloud Computing Project', 'N3', 'PRO314', 1, '2017-06-16', 'Project 314', 0, 0, NULL, 2),
(316, 'Cloud computing for Rural banking', 'N3', 'PRO315', 1, '2018-03-01', 'Project 315', 0, 0, NULL, 2),
(317, 'Data Duplication Removal Using File Checksum', 'N3', 'PRO316', 1, '2016-12-31', 'Project 316', 0, 0, NULL, 2),
(318, 'Personal Health Tracker iOS Application', 'N3', 'PRO317', 1, '2017-07-31', 'Project 317', 0, 0, NULL, 2),
(319, 'iOS Task Alerting Application', 'N3', 'PRO318', 1, '2016-11-09', 'Project 318', 0, 0, NULL, 2),
(320, 'Daily Expense Tracker iOS Application', 'N3', 'PRO319', 1, '2018-01-22', 'Project 319', 0, 0, NULL, 2),
(321, 'Doctor Appointment Manager iOS App', 'N3', 'PRO320', 1, '2018-02-05', 'Project 320', 0, 0, NULL, 2),
(322, 'iOS Periodic Bell & Timetable Reminder Application', 'N3', 'PRO321', 1, '2016-05-29', 'Project 321', 0, 0, NULL, 2),
(323, 'Personal Book iOS Application', 'N3', 'PRO322', 1, '2016-12-10', 'Project 322', 0, 0, NULL, 2),
(324, 'Secure Notes Storage Using Encryption iOS App', 'N3', 'PRO323', 1, '2017-05-14', 'Project 323', 0, 0, NULL, 2),
(325, 'Wake Me Up iOS Application', 'N3', 'PRO324', 1, '2016-06-12', 'Project 324', 0, 0, NULL, 2),
(326, 'Children Safety Tracking iOS Application', 'N3', 'PRO325', 1, '2018-02-02', 'Project 325', 0, 0, NULL, 2),
(327, 'Daily News Updates iOS Application', 'N3', 'PRO326', 1, '2017-12-26', 'Project 326', 0, 0, NULL, 2),
(328, 'Delivery Van Tracking Over Internet using iOS', 'N3', 'PRO327', 1, '2017-01-24', 'Project 327', 0, 0, NULL, 2),
(329, 'Secure Authentication Using Graphical Password iOS', 'N3', 'PRO328', 1, '2018-02-13', 'Project 328', 0, 0, NULL, 2),
(330, 'Smart Attendance System iOS', 'N3', 'PRO329', 1, '2017-09-03', 'Project 329', 0, 0, NULL, 2),
(331, 'iOS Based Vote Casting App System', 'N3', 'PRO330', 1, '2016-09-02', 'Project 330', 0, 0, NULL, 2),
(332, 'iOS Furniture Store Project', 'N3', 'PRO331', 1, '2017-01-01', 'Project 331', 0, 0, NULL, 2),
(333, 'Smart Diet Monitoring iOS Application', 'N3', 'PRO332', 1, '2017-05-12', 'Project 332', 0, 0, NULL, 2),
(334, 'Customer Targeted E-Commerce', 'N3', 'PRO333', 1, '2017-10-24', 'Project 333', 0, 0, NULL, 2),
(335, 'Android General Knowledge Chatbot', 'N3', 'PRO334', 1, '2016-06-09', 'Project 334', 0, 0, NULL, 2),
(336, 'Customer Focused Ecommerce Site With AI Bot', 'N3', 'PRO335', 1, '2016-05-02', 'Project 335', 0, 0, NULL, 2),
(337, 'Your Personal Nutritionist Using FatSecret API', 'N3', 'PRO336', 1, '2016-08-13', 'Project 336', 0, 0, NULL, 2),
(338, 'Price Negotiator Ecommerce ChatBot System', 'N3', 'PRO337', 1, '2016-06-24', 'Project 337', 0, 0, NULL, 2),
(339, 'Personality Prediction System Through CV Analysis', 'N3', 'PRO338', 1, '2017-04-25', 'Project 338', 0, 0, NULL, 2),
(340, 'TV Show Popularity Analysis Using Data Mining', 'N3', 'PRO339', 1, '2016-08-25', 'Project 339', 0, 0, NULL, 2),
(341, 'Twitter Trend Analysis Using Latent Dirichlet Allocation', 'N3', 'PRO340', 1, '2016-07-11', 'Project 340', 0, 0, NULL, 2),
(342, 'Online Book Recommendation Using Collaborative Filtering', 'N3', 'PRO341', 1, '2017-03-29', 'Project 341', 0, 0, NULL, 2),
(343, 'Movie Success Prediction Using Data Mining Php', 'N3', 'PRO342', 1, '2018-01-21', 'Project 342', 0, 0, NULL, 2),
(344, 'Fake Product Review Monitoring & Removal For Genuine Ratings Php', 'N3', 'PRO343', 1, '2017-03-04', 'Project 343', 0, 0, NULL, 2),
(345, 'A Commodity Search System For Online Shopping Using Web Mining', 'N3', 'PRO344', 1, '2017-04-26', 'Project 344', 0, 0, NULL, 2),
(346, 'College Enquiry Chat Bot', 'N3', 'PRO345', 1, '2016-08-30', 'Project 345', 0, 0, NULL, 2),
(347, 'Stream Analysis For Career Choice Aptitude Tests', 'N3', 'PRO346', 1, '2016-05-24', 'Project 346', 0, 0, NULL, 2),
(348, 'Product Review Analysis For Genuine Rating', 'N3', 'PRO347', 1, '2017-01-01', 'Project 347', 0, 0, NULL, 2),
(349, 'Android Smart City Traveler', 'N3', 'PRO348', 1, '2016-10-08', 'Project 348', 0, 0, NULL, 2),
(350, 'Artificial Intelligence Dietician', 'N3', 'PRO349', 1, '2017-09-09', 'Project 349', 0, 0, NULL, 2),
(351, 'Heart Disease Prediction Project', 'N3', 'PRO350', 1, '2018-02-27', 'Project 350', 0, 0, NULL, 2),
(352, 'Smart Health Consulting Project', 'N3', 'PRO351', 1, '2017-08-02', 'Project 351', 0, 0, NULL, 2),
(353, 'Banking Bot Project', 'N3', 'PRO352', 1, '2016-07-01', 'Project 352', 0, 0, NULL, 2),
(354, 'Sentiment Based Movie Rating System', 'N3', 'PRO353', 1, '2016-04-11', 'Project 353', 0, 0, NULL, 2),
(355, 'Online AI Shopping With M-Wallet System', 'N3', 'PRO354', 1, '2018-02-27', 'Project 354', 0, 0, NULL, 2),
(356, 'Question paper generator system', 'N3', 'PRO355', 1, '2017-05-29', 'Project 355', 0, 0, NULL, 2),
(357, 'Student Information Chatbot Project', 'N3', 'PRO356', 1, '2016-08-21', 'Project 356', 0, 0, NULL, 2),
(358, 'Website Evaluation Using Opinion Mining', 'N3', 'PRO357', 1, '2016-10-31', 'Project 357', 0, 0, NULL, 2),
(359, 'Android Attendance System', 'N3', 'PRO358', 1, '2017-06-22', 'Project 358', 0, 0, NULL, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `project_manager`
--

CREATE TABLE `project_manager` (
  `project_manager_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `manager_id` bigint(20) DEFAULT NULL,
  `manager_role` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `project_members`
--

CREATE TABLE `project_members` (
  `project_members_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `project_members`
--

INSERT INTO `project_members` (`project_members_id`, `employee_id`, `priority`, `project_id`) VALUES
(1, 2, 2, 56),
(2, 3, 3, 56),
(3, 4, 4, 56),
(4, 5, 5, 56),
(5, 196, 6, 56),
(6, 34, 5, 56),
(8, 24, 5, 56),
(12, 198, 3, 56);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'ROLE_ADMIN'),
(5, 'ROLE_EMPLOYEE'),
(2, 'ROLE_LEADER_A'),
(3, 'ROLE_LEADER_B'),
(4, 'ROLE_LEADER_C');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `types`
--

CREATE TABLE `types` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `types`
--

INSERT INTO `types` (`type_id`, `type_name`) VALUES
(5, 'BA'),
(2, 'BACK_END'),
(3, 'FRONT_END'),
(1, 'FULLSTACK'),
(4, 'TESTER');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `allocation`
--
ALTER TABLE `allocation`
  ADD PRIMARY KEY (`allocation_id`),
  ADD KEY `allocation_employee_FK1_idx` (`employee_id`),
  ADD KEY `allocation_project_FK2_idx` (`project_id`);

--
-- Chỉ mục cho bảng `allocation_detail`
--
ALTER TABLE `allocation_detail`
  ADD PRIMARY KEY (`allocation_detail_id`);

--
-- Chỉ mục cho bảng `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `UKim8flsuftl52etbhgnr62d6wh` (`username`),
  ADD KEY `employee_group_FK1_idx` (`group_id`),
  ADD KEY `employee_role_FK2_idx` (`role_id`),
  ADD KEY `employee_type_FK` (`type_id`);

--
-- Chỉ mục cho bảng `group_ifi`
--
ALTER TABLE `group_ifi`
  ADD PRIMARY KEY (`group_id`);

--
-- Chỉ mục cho bảng `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `project_FK1_idx` (`group_id`);

--
-- Chỉ mục cho bảng `project_manager`
--
ALTER TABLE `project_manager`
  ADD PRIMARY KEY (`project_manager_id`);

--
-- Chỉ mục cho bảng `project_members`
--
ALTER TABLE `project_members`
  ADD PRIMARY KEY (`project_members_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name_UNIQUE` (`role_name`),
  ADD UNIQUE KEY `APP_ROLE_UK` (`role_name`);

--
-- Chỉ mục cho bảng `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`type_id`),
  ADD UNIQUE KEY `employee_type_UK` (`type_name`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `allocation`
--
ALTER TABLE `allocation`
  MODIFY `allocation_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT cho bảng `allocation_detail`
--
ALTER TABLE `allocation_detail`
  MODIFY `allocation_detail_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT cho bảng `project_manager`
--
ALTER TABLE `project_manager`
  MODIFY `project_manager_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `project_members`
--
ALTER TABLE `project_members`
  MODIFY `project_members_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT cho bảng `types`
--
ALTER TABLE `types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `allocation`
--
ALTER TABLE `allocation`
  ADD CONSTRAINT `allocation_employee_FK1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `allocation_project_FK2` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_group_FK1` FOREIGN KEY (`group_id`) REFERENCES `group_ifi` (`group_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_role_FK2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_type_FK` FOREIGN KEY (`type_id`) REFERENCES `types` (`type_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_FK1` FOREIGN KEY (`group_id`) REFERENCES `group_ifi` (`group_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
