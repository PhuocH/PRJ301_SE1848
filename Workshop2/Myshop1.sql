﻿CREATE DATABASE Myshop

GO

USE Myshop

GO

CREATE TABLE Mobiles (
	mobileId VARCHAR(10) PRIMARY KEY NOT NULL,
	[description] NVARCHAR(250) NOT NULL,
	price FLOAT,
	mobileName NVARCHAR(250) NOT NULL,
	yearOfProduction INT,
	quantity INT,
	notSale BIT
	
)

select * from Mobiles

-------------------------------------------------------------------------------Mobile-------------------------------------------------------------------------------
--iPhone
INSERT INTO Mobiles VALUES ('IP3902', N'Khung viền titan, camera siêu chất', 31.990000, 'iPhone 15 Pro Max 256GB', 2023, 100, 0)
INSERT INTO Mobiles VALUES ('IP9501', N'Màn hình Dynamic Island, Làm chủ công nghệ nhiếp ảnh - Camera sau 48MP, cảm biến TOF sống động', 27.290000, N'iPhone 14 Pro Max 128GB', 2022,  64, 1)
INSERT INTO Mobiles VALUES ('IP1568', N'Chụp ảnh chuyên nghiệp hơn - Cụm 2 camera 12 MP đi kèm nhiều chế độ và chức năng chụp hiện đại', 17.490000, N'iPhone 14 128GB', 2022, 44, 1)
INSERT INTO Mobiles VALUES ('IP9845', N'Tối ưu điện năng - Sạc nhanh 20 W, đầy 50% pin trong khoảng 30 phút', 22.990000, N'iPhone 13 Pro Max 128GB', 2021, 10, 1)
INSERT INTO Mobiles VALUES ('IP1313', N'Màn hình 6.7" Super Retina XDR độ sáng cao, sắc nét', 27.990000, N'iPhone 13 Pro Max 1TB', 2021, 3, 1)
INSERT INTO Mobiles VALUES ('IP8524', N'Trải nghiệm điện ảnh đỉnh cao - Camera kép 12MP, hỗ trợ ổn định hình ảnh quang học', 14.990000, N'iPhone 13 128GB | Chính hãng VN/A', 2021, 30, 1)
INSERT INTO Mobiles VALUES ('IP4659', N'Màu sắc phù hợp cá tính - 6 màu sắc bắt mắt để lựa chọn', 9.890000, N'iPhone 11 64GB | Chính hãng VN/A', 2019, 10, 1)

--Samsung
INSERT INTO Mobiles VALUES ('SS2424', N'Mở khoá giới hạn tiềm năng với AI - Hỗ trợ phiên dịch cuộc gọi, khoanh vùng tìm kiếm, Trợ lí Note và chình sửa anh', 27.090000, N'Samsung Galaxy S24 Ultra 12GB 256GB', 2024, 200, 1)
INSERT INTO Mobiles VALUES ('SS2323', N'Chiến game bùng nổ - chip Snapdragon 8 Gen 2 8 nhân tăng tốc độ xử lí, màn hình 120Hz, pin 5.000mAh', 22.190000, N'Samsung Galaxy S23 Ultra 256GB', 2023, 69, 1)
INSERT INTO Mobiles VALUES ('SS0023', N'Thoả sức chụp ảnh, quay video chuyên nghiệp - Camera đến 200MP, chế độ chụp đêm cải tiến, bộ xử lí ảnh thông minh', 22.190000, N'Samsung Galaxy S23 Ultra 256GB', 2023, 40, 1)
INSERT INTO Mobiles VALUES ('SS2222', N'Camera mắt thần bóng đêm Nightography - Chụp đêm cực đỉnh', 13.290000, 'Samsung Galaxy S22 Ultra (12GB - 512GB)', 2022, 20, 1)
INSERT INTO Mobiles VALUES ('SS5555', N'Thiết kế tinh tế với nếp gấp vô hình - Cải tiến nếp gấp thẩm mĩ hơn và gập không kẽ hở', 40.990000, N'Samsung Galaxy Z Fold5 12GB 256GB', 2023, 151, 0)
INSERT INTO Mobiles VALUES ('SS3333', N'Smartphone gập đầu tiên có kháng nước', 20.490000, 'Samsung Galaxy Z Fold3 5G 256GB', 2021, 5, 1)
INSERT INTO Mobiles VALUES ('SS0005', N'Tuyệt tác selfie thoả sức sáng tạo - Camera sau hỗ trợ AI xử lí cực sắc nét ngay cả trên màn hình ngoài', 19.990000, N'Samsung Galaxy Z Flip5 512GB', 2023, 36, 1)

--Oppo
INSERT INTO Mobiles VALUES ('OP3333', N'Bậc thầy thiết kế, siêu mỏng nhe - Mỏng chỉ 239g, nhẹ chỉ 5.8mm với nếp gấp tàng hình', 44.990000, N'OPPO Find N3 16GB 512GB', 2023, 60, 0)
INSERT INTO Mobiles VALUES ('OP0003', N'Thiết kế gập linh hoạt, đường cong 3D, đường cắt kim cương - biểu tượng của sự phong cách giúp bạn luôn toả sáng', 15.890000, N'OPPO Find N3 Flip 12GB', 2023, 30, 1)
INSERT INTO Mobiles VALUES ('OP0005', N'Đa nhiệm mạnh mẽ hơn ai hết - RAM mở rộng đến 16GB, ROM 256GB mang đến trải nghiệm đa tác vụ thoải mái', 9.690000, N'OPPO Reno10 5G 8GB 256GB', 2023, 6, 1)

--Xiaomi
INSERT INTO Mobiles VALUES ('XM1313', N'Đắm chìm vào không gian giải trí sống động - AMOLED 120Hz giúp thao tác cuộn mượt mà', 8.790000, N'Xiaomi 13 Lite', 2023, 24, 1)
INSERT INTO Mobiles VALUES ('XM0013', N'Năng lượng bất tận cả ngày - Pin 5000mAh cùng sạc nhanh 67W, sạc đầy chỉ trong 42 phút', 10.390000, N'Xiaomi 13T 12GB 256GB', 2023, 20, 1)
INSERT INTO Mobiles VALUES ('XM0313', N'Bắt trọn khoảnh khắc - Cụm camera đến 108MP mạnh mẽ cùng khả năng thu phóng 3x', 4.590000, N'Xiaomi Redmi Note 13 6GB 128GB', 2023, 1, 1)