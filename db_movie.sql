/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `banner` (
  `ma_banner` int NOT NULL AUTO_INCREMENT,
  `hinh_anh` varchar(255) DEFAULT NULL,
  `ma_phim` int DEFAULT NULL,
  PRIMARY KEY (`ma_banner`),
  KEY `ma_phim` (`ma_phim`),
  CONSTRAINT `banner_ibfk_1` FOREIGN KEY (`ma_phim`) REFERENCES `phim` (`ma_phim`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `cumRap` (
  `ma_cum_rap` int NOT NULL AUTO_INCREMENT,
  `ten_cum_rap` varchar(255) DEFAULT NULL,
  `dia_chi` varchar(255) DEFAULT NULL,
  `ma_he_thong_rap` int DEFAULT NULL,
  PRIMARY KEY (`ma_cum_rap`),
  KEY `ma_he_thong_rap` (`ma_he_thong_rap`),
  CONSTRAINT `cumRap_ibfk_1` FOREIGN KEY (`ma_he_thong_rap`) REFERENCES `heThongRap` (`ma_he_thong_rap`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `datVe` (
  `id` int NOT NULL,
  `ma_lich_chieu` int NOT NULL,
  `ma_ghe` int DEFAULT NULL,
  PRIMARY KEY (`id`,`ma_lich_chieu`),
  KEY `ma_lich_chieu` (`ma_lich_chieu`),
  CONSTRAINT `datVe_ibfk_1` FOREIGN KEY (`id`) REFERENCES `nguoiDung` (`id`),
  CONSTRAINT `datVe_ibfk_2` FOREIGN KEY (`ma_lich_chieu`) REFERENCES `lichChieu` (`ma_lich_chieu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `ghe` (
  `ma_ghe` int NOT NULL AUTO_INCREMENT,
  `ten_ghe` varchar(255) DEFAULT NULL,
  `loai_ghe` varchar(255) DEFAULT NULL,
  `ma_rap` int DEFAULT NULL,
  PRIMARY KEY (`ma_ghe`),
  KEY `ma_rap` (`ma_rap`),
  CONSTRAINT `ghe_ibfk_1` FOREIGN KEY (`ma_rap`) REFERENCES `rapPhim` (`ma_rap`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `heThongRap` (
  `ma_he_thong_rap` int NOT NULL AUTO_INCREMENT,
  `ten_he_thong_rap` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ma_he_thong_rap`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `lichChieu` (
  `ma_lich_chieu` int NOT NULL AUTO_INCREMENT,
  `ma_rap` int NOT NULL,
  `ma_phim` int NOT NULL,
  `ngay_gio_chieu` datetime DEFAULT NULL,
  `gia_ve` int DEFAULT NULL,
  `ma_ghe` int NOT NULL,
  PRIMARY KEY (`ma_lich_chieu`,`ma_rap`,`ma_phim`,`ma_ghe`),
  KEY `ma_rap` (`ma_rap`),
  KEY `ma_phim` (`ma_phim`),
  KEY `ma_ghe` (`ma_ghe`),
  CONSTRAINT `lichChieu_ibfk_1` FOREIGN KEY (`ma_rap`) REFERENCES `rapPhim` (`ma_rap`),
  CONSTRAINT `lichChieu_ibfk_2` FOREIGN KEY (`ma_phim`) REFERENCES `phim` (`ma_phim`),
  CONSTRAINT `lichChieu_ibfk_3` FOREIGN KEY (`ma_ghe`) REFERENCES `ghe` (`ma_ghe`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `loaiNguoiDung` (
  `id` int NOT NULL AUTO_INCREMENT,
  `loai_nguoi_dung` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`loai_nguoi_dung`),
  CONSTRAINT `loaiNguoiDung_ibfk_1` FOREIGN KEY (`id`, `loai_nguoi_dung`) REFERENCES `nguoiDung` (`id`, `loai_nguoi_dung`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `nguoiDung` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tai_khoan` varchar(255) DEFAULT NULL,
  `ho_ten` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `so_dt` varchar(255) DEFAULT NULL,
  `mat_khau` varchar(255) DEFAULT NULL,
  `loai_nguoi_dung` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`loai_nguoi_dung`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `phim` (
  `ma_phim` int NOT NULL AUTO_INCREMENT,
  `ten_phim` varchar(255) DEFAULT NULL,
  `trailer` varchar(255) DEFAULT NULL,
  `hinh_anh` varchar(255) DEFAULT NULL,
  `mo_ta` varchar(255) DEFAULT NULL,
  `ngay_khoi_chieu` date DEFAULT NULL,
  `danh_gia` int DEFAULT NULL,
  `hot` tinyint(1) DEFAULT NULL,
  `dang_chieu` tinyint(1) DEFAULT NULL,
  `sap_chieu` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ma_phim`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rapPhim` (
  `ma_rap` int NOT NULL AUTO_INCREMENT,
  `ten_rap` varchar(255) DEFAULT NULL,
  `ma_cum_rap` int DEFAULT NULL,
  PRIMARY KEY (`ma_rap`),
  KEY `ma_cum_rap` (`ma_cum_rap`),
  CONSTRAINT `rapPhim_ibfk_1` FOREIGN KEY (`ma_cum_rap`) REFERENCES `cumRap` (`ma_cum_rap`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `banner` (`ma_banner`, `hinh_anh`, `ma_phim`) VALUES
(1, 'Gh??? https://movienew.cybersoft.edu.vn/hinhanh/ban-tay-diet-quy.png', 5);
INSERT INTO `banner` (`ma_banner`, `hinh_anh`, `ma_phim`) VALUES
(2, 'https://movienew.cybersoft.edu.vn/hinhanh/lat-mat-48h.png', 4);
INSERT INTO `banner` (`ma_banner`, `hinh_anh`, `ma_phim`) VALUES
(3, 'https://movienew.cybersoft.edu.vn/hinhanh/cuoc-chien-sinh-tu.png', 3);
INSERT INTO `banner` (`ma_banner`, `hinh_anh`, `ma_phim`) VALUES
(4, 'https://movienew.cybersoft.edu.vn/hinhanh/cuoc-minh-tu.png', 2),
(5, 'https://movienew.cybersoft.edu.vn/hinhanh/nnana.png', 1);

INSERT INTO `cumRap` (`ma_cum_rap`, `ten_cum_rap`, `dia_chi`, `ma_he_thong_rap`) VALUES
(1, 'r???p 01', '11 L?? l???i g?? v???p', 5);
INSERT INTO `cumRap` (`ma_cum_rap`, `ten_cum_rap`, `dia_chi`, `ma_he_thong_rap`) VALUES
(2, 'r???p 02', '12 l?? th?????ng ki???t g?? v???p', 4);
INSERT INTO `cumRap` (`ma_cum_rap`, `ten_cum_rap`, `dia_chi`, `ma_he_thong_rap`) VALUES
(3, 'r???p 03', '13 b???ch ?????ng t??n b??nh', 3);
INSERT INTO `cumRap` (`ma_cum_rap`, `ten_cum_rap`, `dia_chi`, `ma_he_thong_rap`) VALUES
(4, 'r???p 04', '50 l?? lai ph?? nhu???n', 2),
(5, 'r???p 05', '120 d????ng qu???ng h??m b??nh th???nh', 1);

INSERT INTO `datVe` (`id`, `ma_lich_chieu`, `ma_ghe`) VALUES
(2, 4, 4);
INSERT INTO `datVe` (`id`, `ma_lich_chieu`, `ma_ghe`) VALUES
(3, 3, 1);
INSERT INTO `datVe` (`id`, `ma_lich_chieu`, `ma_ghe`) VALUES
(4, 2, 5);
INSERT INTO `datVe` (`id`, `ma_lich_chieu`, `ma_ghe`) VALUES
(4, 7, 1),
(5, 1, 1),
(5, 7, 1),
(11, 6, 1),
(11, 7, 1);

INSERT INTO `ghe` (`ma_ghe`, `ten_ghe`, `loai_ghe`, `ma_rap`) VALUES
(1, 'Gh??? C', 'Gh?? Vip', 5);
INSERT INTO `ghe` (`ma_ghe`, `ten_ghe`, `loai_ghe`, `ma_rap`) VALUES
(2, 'Gh??? A', 'Gh?? Th?????ng', 4);
INSERT INTO `ghe` (`ma_ghe`, `ten_ghe`, `loai_ghe`, `ma_rap`) VALUES
(3, 'Gh??? A', 'Gh?? ????i', 3);
INSERT INTO `ghe` (`ma_ghe`, `ten_ghe`, `loai_ghe`, `ma_rap`) VALUES
(4, 'Gh??? B', 'Gh?? ????n', 2),
(5, 'Gh??? B', 'Gh?? Vip', 1),
(11, 'Gh??? C', 'Gh?? Vip', 5),
(12, 'Gh??? A', 'Gh?? Th?????ng', 4),
(13, 'Gh??? A', 'Gh?? ????i', 3),
(14, 'Gh??? B', 'Gh?? ????n', 2),
(15, 'Gh??? B', 'Gh?? Vip', 1);

INSERT INTO `heThongRap` (`ma_he_thong_rap`, `ten_he_thong_rap`, `logo`) VALUES
(1, 'CGV', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnyIx2BvelZS3_czAYAp-CrQM9S_OLveXBaQ&usqp=CAU');
INSERT INTO `heThongRap` (`ma_he_thong_rap`, `ten_he_thong_rap`, `logo`) VALUES
(2, 'VINCOM', 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fbaodautu.vnro-khach');
INSERT INTO `heThongRap` (`ma_he_thong_rap`, `ten_he_thong_rap`, `logo`) VALUES
(3, 'BIG C', 'https://www.google.com/imgres/bigc');
INSERT INTO `heThongRap` (`ma_he_thong_rap`, `ten_he_thong_rap`, `logo`) VALUES
(4, 'LOTTE', 'https://www.google.com/imgres/lotte'),
(5, 'GALAXY', 'https://www.google.com/imgres/galaxy');

INSERT INTO `lichChieu` (`ma_lich_chieu`, `ma_rap`, `ma_phim`, `ngay_gio_chieu`, `gia_ve`, `ma_ghe`) VALUES
(1, 1, 1, '2023-01-01 00:00:00', 55000, 1);
INSERT INTO `lichChieu` (`ma_lich_chieu`, `ma_rap`, `ma_phim`, `ngay_gio_chieu`, `gia_ve`, `ma_ghe`) VALUES
(1, 2, 1, '2022-07-04 18:51:53', 50000, 12);
INSERT INTO `lichChieu` (`ma_lich_chieu`, `ma_rap`, `ma_phim`, `ngay_gio_chieu`, `gia_ve`, `ma_ghe`) VALUES
(2, 4, 4, '2012-05-04 18:51:53', 85000, 14);
INSERT INTO `lichChieu` (`ma_lich_chieu`, `ma_rap`, `ma_phim`, `ngay_gio_chieu`, `gia_ve`, `ma_ghe`) VALUES
(4, 2, 5, '2021-02-04 18:22:53', 30000, 11),
(5, 1, 1, '2018-06-04 18:44:53', 75000, 13),
(6, 5, 2, '2022-01-04 18:11:53', 50000, 15),
(7, 4, 2, '2023-02-22 00:00:00', 541262, 1),
(8, 4, 2, '2023-02-22 00:00:00', 541262, 1),
(9, 4, 2, '2023-02-22 00:00:00', 541262, 1),
(10, 4, 2, '2023-02-22 00:00:00', 541262, 1);

INSERT INTO `loaiNguoiDung` (`id`, `loai_nguoi_dung`) VALUES
(1, 'khachHang');
INSERT INTO `loaiNguoiDung` (`id`, `loai_nguoi_dung`) VALUES
(2, 'quanTri');


INSERT INTO `nguoiDung` (`id`, `tai_khoan`, `ho_ten`, `email`, `so_dt`, `mat_khau`, `loai_nguoi_dung`) VALUES
(1, 'khoi124', 'tomas', 'tomas@gmail.com', '1234', 'abc', 'khachHang');
INSERT INTO `nguoiDung` (`id`, `tai_khoan`, `ho_ten`, `email`, `so_dt`, `mat_khau`, `loai_nguoi_dung`) VALUES
(2, 'tomas94', 'anna', 'anna@gmail.com', '1234', 'ee', 'quanTri');
INSERT INTO `nguoiDung` (`id`, `tai_khoan`, `ho_ten`, `email`, `so_dt`, `mat_khau`, `loai_nguoi_dung`) VALUES
(3, 'khoinguyen99', 'khoinguyen', 'khoinguyen@gmail.com', '1234', 'e2', 'khachHang');
INSERT INTO `nguoiDung` (`id`, `tai_khoan`, `ho_ten`, `email`, `so_dt`, `mat_khau`, `loai_nguoi_dung`) VALUES
(4, 'khoinee', 'dangkhoi', 'dangkhoi@gmail.com', '1234', 'fff', 'quanTri'),
(5, 'hahaha21', 'Nghh', 'kh??iii0000@gmail.com', '0396347621', '$2b$10$nLeBj3RuoG1LD0bAndsA7.806PfcjVnakxrzqB.EgVhk..gzB5nOq', 'qu???n l??'),
(11, 'kho3i124', 'tomas', 'toemas@gmail.com', '1234', 'abc', 'khachHang'),
(12, 'tomaes94', 'anna', 'aenna@gmail.com', '1234', 'ee', 'khachHang'),
(16, 'nguyendangkhoi99200', 'Nguyen Dang Khoi', 'ki99@gmail.com', '0396347621', '1234', 'quanTri'),
(17, 'nguyendangkhoi992000', 'Nguyen Dang Khoi', 'khoine999@gmail.com', '0396347621', '$2b$10$jw0djM5tyetzAG7USTTT/.7YAS3rjDMGt/BbGdtPlMDkdSg3jmmWC', 'quanTri'),
(18, 'nguyendangkhoi992000', 'Nguyen Dang Khoi', 'khoine399@gmail.com', '0396347621', '$2b$10$zlkEmgwcT.tlrhAzYP9TjO8fugrNdcl6BUHXxNHtKtG5iSO2ZWZkK', 'khachHang'),
(19, 'nguyendangkhoi992000', 'NguyenDangKhoi', 'khoine2899@gmail.com', '0396347621', '$2b$10$7aJMKYagCEW/jxdrtc5ebO.nBwhidD5xtOelzLntIATSV.FCN7EHi', 'khachHang'),
(20, 'nguyendangkhoi992000', 'NguyenDangKhoi', 'khoine27799@gmail.com', '0396347621', '$2b$10$lkXy/.HcDlpNQ0KzkopnIegzzRD9YeNCiJmcJX7GO9YUPYx1DNSNK', 'khachHang'),
(21, 'nguyendangkhoi99200', 'Nguyen Dang Khoi', 'ki7799@gmail.com', '0396347621', '1234', 'quanTri'),
(22, 'nguyendangkhoi992000', 'NguyenDangKhoi', 'kh7iND27799@gmail.com', '0396347621', '$2b$10$inZqKz8McM2uqarfMG9Oiuu.9KG3sUOQZsUL7/4rTJlidqLnOBjx2', 'khachHang');

INSERT INTO `phim` (`ma_phim`, `ten_phim`, `trailer`, `hinh_anh`, `mo_ta`, `ngay_khoi_chieu`, `danh_gia`, `hot`, `dang_chieu`, `sap_chieu`) VALUES
(1, 'wednesday123231231323', 'https://youtu.be/Q73UhUTs6y0', 'https://movienew.cybersoft.edu.vn/hinhanh/wednesday_gp01.jpg', 'phim truy???n h??nh nhi???u t???p Netflix', '2023-01-04', 9, 1, 1, 1);
INSERT INTO `phim` (`ma_phim`, `ten_phim`, `trailer`, `hinh_anh`, `mo_ta`, `ngay_khoi_chieu`, `danh_gia`, `hot`, `dang_chieu`, `sap_chieu`) VALUES
(2, 'nonoo', 'https://youtu.re://movienew.cybersoft.e', 'du.vn/hinharnh/wednesday_gp01.jpg', 'phim truy???n h??nh 23 t???p 323r2', '2023-11-07', 3, 1, 1, 1);
INSERT INTO `phim` (`ma_phim`, `ten_phim`, `trailer`, `hinh_anh`, `mo_ta`, `ngay_khoi_chieu`, `danh_gia`, `hot`, `dang_chieu`, `sap_chieu`) VALUES
(3, 'captain', 'https://youtu.be/Q73r??eUhUTs6y0', 'https://movienew.cybersoft.edu.vn/hinhanh/wednesday_gp01.jpg', '32 truy???n h??nh nhi???u t???p Netflix', '2023-09-04', 4, 1, 1, 1);
INSERT INTO `phim` (`ma_phim`, `ten_phim`, `trailer`, `hinh_anh`, `mo_ta`, `ngay_khoi_chieu`, `danh_gia`, `hot`, `dang_chieu`, `sap_chieu`) VALUES
(4, 'mua tuyet', 'https://youtu.be/Q73UhUTs6y0', 'https://movienew.cybersoft.edu.vn/hinhanh/wednesday_gp01.jpg', 'hay', '2004-01-22', 7, 1, 1, 1),
(5, 'monnalissa', 'https://youtu.be/Q73UhUTs6y0', 'https://movienew.cybersoft.edu.vn/hinhanh/wednesday_gp01.jpg', 'hay', '2004-01-22', 7, 1, 1, 1),
(6, 'ame', 'https://youtu.be/Q73??eUhUTs6y0', 'https://movrersoft.edu.vn/hinhanh/wednesday_gp01.jpg', 'phim truy???n h??nh nhi???u t???p Netflix', '2023-01-04', 9, 1, 1, 1),
(7, 'mono02', 'https://youtu.be/Q73UhUTs6y0', 'https://movienew.cybersoft.edu.vn/hinhanh/wednesday_gp01.jpg', 'hay', '2013-01-22', 9, 1, 1, 1),
(8, 'khoi123', 'https://youtu.be/Q73UhUTs6y0', 'https://movienew.cybersoft.edu.vn/hinhanh/wednesday_gp01.jpg', 'hay', '2012-01-22', 9, 1, 1, 1);

INSERT INTO `rapPhim` (`ma_rap`, `ten_rap`, `ma_cum_rap`) VALUES
(1, 'r???p 01', 5);
INSERT INTO `rapPhim` (`ma_rap`, `ten_rap`, `ma_cum_rap`) VALUES
(2, 'r???p 02', 4);
INSERT INTO `rapPhim` (`ma_rap`, `ten_rap`, `ma_cum_rap`) VALUES
(3, 'r???p 03', 3);
INSERT INTO `rapPhim` (`ma_rap`, `ten_rap`, `ma_cum_rap`) VALUES
(4, 'r???p 04', 2),
(5, 'r???p 05', 1);


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;