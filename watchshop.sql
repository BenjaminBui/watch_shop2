-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 29, 2022 lúc 04:29 PM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `watchshop`
--
CREATE DATABASE IF NOT EXISTS `watchshop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `watchshop`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `AccID` int(11) NOT NULL,
  `AccName` varchar(100) NOT NULL,
  `AccEmail` varchar(200) NOT NULL,
  `AccPassword` varchar(255) NOT NULL,
  `AccAddress` varchar(255) NOT NULL,
  `AccGender` int(11) NOT NULL,
  `AccPhone` varchar(20) NOT NULL,
  `AccStatus` int(11) NOT NULL,
  `AccImg` varchar(100) NOT NULL,
  `AccDes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`AccID`, `AccName`, `AccEmail`, `AccPassword`, `AccAddress`, `AccGender`, `AccPhone`, `AccStatus`, `AccImg`, `AccDes`) VALUES
(2, 'Vandy De', 'VandyDe@example.ex', '1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non.', 1, '0123456789', 1, 'images/client.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non. Quis hendrerit dolor magna eget est lorem ipsum dolor sit. Volutpat odio facilisis mauris sit amet massa.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `CartID` int(11) NOT NULL,
  `AccID` int(11) NOT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `CartQuanity` int(11) NOT NULL,
  `CartStatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`CartID`, `AccID`, `ProductID`, `CartQuanity`, `CartStatus`) VALUES
(1, 2, 1, 5, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `ProductImg` varchar(200) NOT NULL,
  `ProductBanner` varchar(100) DEFAULT NULL,
  `ProductDes` text NOT NULL,
  `ProductPrice` int(11) NOT NULL,
  `ProductStatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`ProductID`, `ProductName`, `ProductImg`, `ProductBanner`, `ProductDes`, `ProductPrice`, `ProductStatus`) VALUES
(1, 'Stylish watches', './images/item-1.jpg', './images/watch.png', 'consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco l', 200, 1),
(2, 'Đồng Hồ Nam Orient Star Open Heart WZ0151DK Chính Hãng', './Images/Image_1.jpg', NULL, 'Máy Automatic\r\nĐường kính mặt: 40mm\r\nLoại mặt kính: Box Crystal Glass \r\nChống nước 50M\r\nOrient Star sản xuất dành riêng cho thị trường nội địa Nhật, vừa giới thiệu 2014 với thiết kế mặt số màu xanh và', 400, 2),
(3, 'Đồng Hồ Nam Orient Star Joker', './Images/Picture3.jpg', NULL, 'Máy Automatic\r\nĐường kính mặt: 41mm\r\nBề Dày Mặt Số: 10mm\r\nLoại mặt kính: Kính Sapphire\r\nChống nước 100M\r\nBộ máy: Automatic đời mới Cal.F6F44\r\nThời gian cót lên đến 50h\r\nĐồng hồ Orient Star RE-AV0113S0', 510, 2),
(4, 'Orient Star Limited Skeleton new 2021 RE-AV0118L00B ', './Images/Picture4.jpg', NULL, 'Phiên bản mới nhất của dòng Orient Star Joker\r\n– Máy Automatic “Made in Japan” trữ cót lên đến 50h (máy Inhouse của Orient)\r\n– Size 41mm (luôn núm)\r\n– Kính Sapphire nguyên khối\r\n– Có kim xăng báo năng', 670, 2),
(5, 'Orient Star RE-AY0006A00B Mechanical Moon Phase Limited', './Images/Picture5.jpg', NULL, 'Mẫu Orient này được giới thiệu là Phiên bản Giới hạn gồm 700 chiếc trên toàn thế giới.\r\nVỏ thép không gỉ 41mm, với mặt sau trong suốt cho phép bạn nhìn thấy máy móc. Số seri được khắc dưới đáy hộp. \r\nTinh thể sapphire siêu chống phản chiếu. Hình cầu có pha mặt trăng ở vị trí 6 giờ đại diện cho trái đất và cửa sổ bán khung xương ở vị trí 9 giờ đại diện cho trái đất.\r\nMặt số được thiết kế tinh xảo với kim và chỉ số màu bạc và kim giây màu vàng. Bộ máy của nó là bộ máy tự động Orient caliber F7M63 (Sản xuất tại Nhật Bản), với khả năng lên dây bằng tay, mang lại cho nó khả năng dự trữ năng lượng xấp xỉ 50h. \r\nDây đeo bằng thép không gỉ với khóa cài bướm với các nút nhấn. Trong số các chức năng của nó, nó có một cơ chế dừng kim giây. Mô hình này có khả năng chống nước 100m (10 ATM).\r\n', 1050, 2),
(6, 'Đồng Hồ Orient Star Retrograde SDE00003B0 Chính Hãng', './Images/Picture6.jpg', NULL, 'Thuộc dòng sản phẩm Orient Star, SDE00003B0 là một trong những mô đen ấn tượng nhất của Orient nhờ vẻ ngoài tinh tế và hiện đại. \r\nCỗ máy thời gian gây ấn tượng với tông màu xanh dương trẻ trung của mặt số kết hợp hoàn hảo với phần vỏ vàng hồng sang trọng và dây da nâu khỏe khoắn. \r\nMặt số được thiết kế phá cách với các mặt đồng hồ chức năng dạng cánh quạt và tròn mạ vàng hồng ton-sur-ton cùng màu sắc của phần vỏ. \r\nVị trí 12h như thường lệ là kim xăng đo năng lượng cót, vị trí 6h là kim giật chỉ lịch thứ và vị trí 9h là kim chỉ lịch ngày. \r\nBộ kim và cọc số của SDE00003B0 là dạng vạch đơn giản, cũng được phủ thêm lớp dạ quang bên trên lớp mạ vàng hồng. \r\nTổng thể mặt số vừa không có quá nhiều chi tiết vừa không quá trống trải tạo nên một bố cục bắt mắt và cân đối cho cỗ máy thời gian. \r\nMẫu Orient Star này được nhà sản xuất trang bị bộ máy Cal.40A52 đầy mạnh mẽ với 22 chân kính, chức năng lên cót tay và trữ cót lên đến 40h. \r\nNgoài ra, SDE00003B0 cũng có kính sapphire chống phản quang, mặt đáy trong suốt giúp quan sát bộ máy bên trong, vỏ thép không gỉ 316L cùng độ chịu nước lên tới 100m.\r\n', 580, 2),
(7, 'Đồng Hồ Orient Star OpenHeart – RE-AV0B01S00 Chính Hãng', './Images/Picture7.jpg', NULL, '– Tone trắng trên dail xanh tạo cho ORIENT STAR RE-AV0B01S00 vẻ đẹp sang trọng. Cọc số hiện đại. Dây kim loại sang trọng cho phép chủ nhân tha hồ diện đồ công sở. Kim dạ quang phát sáng trong tối.\r\n– Cỗ máy Automatic với đầy đủ các chức năng của một chiếc đồng hồ cấp cao. kim báo năng lượng, lộ cơ, dừng kim dây và lên cót tay\r\n– Size 41 mm phù hợp với cổ tay trung bình đến to (16cm trở lên) và dễ phối đồ công sở.\r\n– ORIENT STAR RE-AV0B01S00 được trang bị mặt kính Saphire. Hạn chế trầy xước và chống va đập cực kỳ tốt.\r\n– Case trắng lôi cuốn, quý phái. Tone tổng thể màu mát rất nổi bật và toát lên vẻ phóng khoáng.\r\n– Độ chống nước 100 m giúp chủ nhân thoải mái đi mưa, rửa tay mà không sợ vào nước.\r\n', 690, 2),
(8, 'Đồng Hồ Nam Orient Star SDE00004D0-B ', './Images/Picture8.jpg', NULL, 'Size 39.5mm, dày 14mm.\r\nBộ máy caliber 40A50 cao cấp.\r\nĐầy đủ lịch thứ và ngày.\r\nNổi bật với lịch thứ có cơ chế lội ngược dòng. Khi kim đi hết Chủ Nhật ngay lập tức chạy ngược về vị trí Thứ Hai.\r\nKim xăng báo năng lượng cót góc 12h.\r\nKính sapphire nguyên khối phủ chống lóa.\r\nĐáy sau của đồng hồ được thiết kế hở máy rất đẹp.\r\nĐồng hồ chịu nước ở mức 100m.\r\n', 600, 2),
(9, 'Đồng Hồ Nam Orient SDE00002W0 Automatic ', './Images/Picture9.jpg', NULL, '-Mặt kính Sapphire – loại kính được làm từ đá sapphire có độ cứng ở thang mức 9 trên thang đo Mohs và có chất lượng cao nhất trong các loại mặt kính đồng hồ. \r\n-Bộ máy Automatic với thời gian tích trữ cót lên đến 40h giúp bạn tự tin hơn khi sử dụng sản phẩm\r\n-Khả năng chống nước của Đồng hồ Orient SDE00002W0 là 100m giúp bạn thỏa sức rửa tay, đi mưa hay thậm chí là đi bơi cũng không lo hỏng hóc.\r\n-Trên nền trắng đó là các chi tiết cùng tông màu thép bạc. Góc 9 giờ là lịch ngày. Góc 12 giờ là kim chỉ năng lượng dây cót. Năng lượng dây cót thể hiện đầy là ở vạch 40, tương ứng với 40 giờ. Góc 6 giờ là lịch thứ. Điểm đặc biệt của Orient Star SDE00002W0 chính là nằm ở đây.\r\n', 450, 2),
(10, 'Đồng Hồ Đôi Orient Sun And Moon và Orient Blue Moon SAK00005D0 / RA-AG0018L10B', './Images/Picture10.jpg', NULL, 'Thương hiệu: Orient\r\n Đường kính mặt Nam / Nữ: 42.5 / 34 mm\r\n Độ dày Nam / Nữ : 12.5 / 12 mm\r\n Chống nước Nam / Nữ: 5ATM / 3 ATM\r\nThuộc dòng sản phẩm Orient, SAK00005D0 / RA-AG0018L10B mang trên mình một trong những thiết kế độc quyền của hãng đồng hồ xứ sở mặt trời mọc – Sun & Moon (mặt trăng, mặt trời). Với ngoại hình đầy nổi bật, cỗ máy của Orient thực sự thu hút mọi sự chú ý ngay từ cái nhìn đầu tiên. \r\nSAK00005D0 / RA-AG0018L10B sở hữu ô cửa sổ Sun & Moon ở vị trí 5h, ô lịch ngày ở vị trí 8h và lịch thứ ở vị trí 10h. Mặt đồng hồ màu xanh thanh lịch kết hợp với dây da tạo nên một thiết kế trẻ trung và lịch lãm. Bộ kim kết hợp giữa kim lá, kim Breguet cùng cọc số La Mã khiến cho chiếc đồng hồ thêm phần cổ điển. Phiên bản này được nhà sản xuất trang bị bộ máy Cal.F6B24 mạnh mẽ với 22 chân kính cùng khả năng trữ cót lên tới 40h. Ngoài ra, SAK00005D0 / RA-AG0018L10B còn có kính sapphire chống xước, vỏ từ thép không gỉ 316L. \r\n', 420, 2),
(11, 'Đồng Hồ Nam Orient Star Semi Skeleton Blue Steel SDK05002D0', './Images/Picture11.jpg', NULL, 'Lộ máy tạo hình thành khuôn mặt chú hề độc đáo\r\nSize 41mm\r\nBề dày 13mm\r\nMáy Automatic “Made in Japan” (máy Inhouse của Orient)\r\nKính Sapphire nguyên khối\r\nCó kim xăng báo năng lượng cót, kim rốn\r\nBộ dây, khoá làm bằng thép đúc cao cấp\r\nChống nước lên đến 100m\r\nOrient Star Retrograde SDK05002D0 được trang bị bộ máy Automatic 22 chân kính, thời gian trử cót lên đến 40h. Kính sapphire nguyên khối được phủ 1 lớp chống lóa . Có kím power reserve góc 12h báo mức dự trử cót của đồng hồ được đánh dấu từ 0-40. Thiết kế lộ máy góc 9h cực quyến rủ. Kim và cọc số  có dạ quang  rất đẹp. Võ được làm bằng thép chống ghỉ cao cấp 316L, dial màu xanh nổi bật. Kích thước size mặt 40mm, măt sau lộ máy.\r\n', 420, 2),
(12, 'Đồng hồ Orient Star WZ0351EL Chính Hãng', './Images/Picture12.jpg', NULL, ' Máy Automatic\r\n Mặt kính: 39mm\r\n Độ dày: 11.9mm\r\n Chất liệu: Thép không gỉ 316L/Mạ PVD\r\n Chống nước 10ATM\r\nHòa quyện trong gam màu xanh dương của mặt đồng hồ, đó là màu vàng của các con số và kim chỉ thời gian. Hai mốc thời gian 12h và 6h được thể hiện bằng số La Mã mang phong cách cổ điển. Các mốc thời gian còn lại được thể hiện bằng các nét vạch đậm màu vàng thon dần về phía đuôi. Từng đường nét đều rất sắc bén và tinh tế. Với gam màu vàng toát lên sự quyền quý, hiện đại và sang trọng của chủ nhân sở hữu chúng.\r\n', 400, 2),
(13, 'Đồng Hồ Nam Orient Star RE-AT0004S00B ', './Images/Picture13.jpg', NULL, 'Máy Automatic\r\n Đường kính mặt: 39.5mm\r\n Độ dầy: 12.2mm\r\n Loại mặt kính: Sapphire\r\n Chống nước 100M\r\nThuộc dòng sản phẩm Orient Star, RE-AT0004S00B là một trong những mẫu đồng hồ được yêu thích nhất của Orient. Với kết cấu lộ tim và mặt đồng hồ phụ đo năng lượng, Orient vừa khoe được cỗ máy cơ khí in-house do hãng tự sản xuất ở vị trí 9h vừa tạo nên ấn tượng về thiết kế cao cấp vốn thường thấy ở những hãng đồng hồ Thụy Sỹ danh tiếng. Đồng thời, RE-AT0004S00B còn ghi điểm với vẻ ngoài đầy ấn tượng nhờ sự kết hợp giữa tông màu trắng thanh lịch của mặt số và phần vỏ, dây demi mạ PVD vàng hồng. Điểm nhấn của chiếc đồng hồ đến từ phần chữ số La Mã ở vị trí 6h và 12h bên cạnh các cọc số dạng vạch đơn giản. Mẫu Orient Star này được nhà sản xuất ưu ái trang bị bộ máy Cal.F6R42 đầy mạnh mẽ với 22 chân kính, chức năng lên cót tay và trữ cót lên đến 50h. Ngoài ra, RE-AT0004S00B cũng có kính sapphire chống phản quang, mặt đáy trong suốt giúp quan sát bộ máy bên trong, vỏ và dây thép không gỉ 316L cùng độ chịu nước lên tới 100m.\r\n', 380, 2),
(14, 'Đồng Hồ Nam Orient Star SDK05004K0', './Images/Picture14.jpg', NULL, '– Size 41mm dễ đeo, dầy 12mm\r\n– Dial hở tim skeleton rất đẹp, giúp theo dõi bộ máy chuyển động trên nền xanh dương\r\n– Máy Inhouse Orient 40S60 chạy chuẩn giờ, chính xác, với 24 chân kính, 40h tích cót & 21.600 vph \r\n– Kim xăng báo năng lượng cót góc 12h\r\n– Kính sapphire nguyên khối phủ chống lóa\r\n– Đáy sau hở máy rất đẹp.\r\n', 600, 2),
(15, 'Đồng Hồ Nam Orient Automatic Sun and Moon 4 RA-AS0003S00B', './Images/Picture15.jpg', NULL, '  Kiểu máy: Tự động lên dây cót và lên dây cót bằng tay\r\n  Đường Kính Mặt Số: 42mm\r\n  Bề Dày Mặt Số: 12mm\r\n  Độ chịu nước: 5ATM\r\n  Bảo hành: 02 năm\r\nTiếp nối sự thành công của seri Sun and moon, Orient Sun and Moon Gen 4 ra mắt thêm các phiên bản khác để tăng thêm lựa chọn cho người sử dụng.\r\nCó thể thấy về màu sắc không có nhiều thay đổi so với các thế hệ trước nhưng thiết kế lần này ấn tượng hơn với mặt số đánh vân làm tăng sự lịch lãm, cọc số đã được làm bằng thép mạ rất tinh xảo hướng đến một chiếc đồng hồ cao cấp, thời thượng.\r\nViệc các con số La Mã được thay hầu hết bằng số vạch có lẽ cũng nhằm tối giản mặt số để tôn lên tâm điểm là ô hở tim – điểm mới nhất của dòng Sun and Moon này\r\n', 335, 2);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`AccID`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`CartID`),
  ADD KEY `AccID` (`AccID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `AccID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `CartID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`AccID`) REFERENCES `account` (`AccID`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
