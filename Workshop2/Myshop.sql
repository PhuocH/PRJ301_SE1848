CREATE DATABASE Myshop

GO

USE Myshop

GO

CREATE TABLE Producer (
	id int PRIMARY KEY NOT NULL,
	[name] NVARCHAR(50)
)

CREATE TABLE Categories (
	id int PRIMARY KEY NOT NULL,
	[name] NVARCHAR(50)
)

CREATE TABLE Mobiles (
	mobileId VARCHAR(10) PRIMARY KEY NOT NULL,
	[description] NVARCHAR(250) NOT NULL,
	price FLOAT,
	mobileName NVARCHAR(250) NOT NULL,
	yearOfProduction INT,
	[image] NVARCHAR(500),
	quantity INT,
	notSale BIT,
	pId int REFERENCES Producer(id),
	cId int REFERENCES Categories(id)
)

INSERT INTO Producer VALUES (1, 'Apple')
INSERT INTO Producer VALUES (2, 'Samsung')
INSERT INTO Producer VALUES (3, 'Oppo')
INSERT INTO Producer VALUES (4, 'Xiaomi')

INSERT INTO Categories VALUES(1, 'Mobile')
INSERT INTO Categories VALUES(2, 'Tablet')
INSERT INTO Categories VALUES(3, 'Smartwatch')


-------------------------------------------------------------------------------Mobile-------------------------------------------------------------------------------
--iPhone
INSERT INTO Mobiles VALUES ('IP3902', N'Khung viền titan, camera siêu chất', 31.990000, 'iPhone 15 Pro Max 256GB', 2023, N'iPhone/iPhone15_Pro.jpeg', 100, 0, 1, 1)
INSERT INTO Mobiles VALUES ('IP9501', N'Màn hình Dynamic Island, Làm chủ công nghệ nhiếp ảnh - Camera sau 48MP, cảm biến TOF sống động', 27.290000, N'iPhone 14 Pro Max 128GB', 2022, 'iPhone14_Pro_Max_Deep_Purple.jpeg', 64, 1, 1, 1)
INSERT INTO Mobiles VALUES ('IP1568', N'Chụp ảnh chuyên nghiệp hơn - Cụm 2 camera 12 MP đi kèm nhiều chế độ và chức năng chụp hiện đại', 17.490000, N'iPhone 14 128GB', 2022, 'iPhone/iPhone14_Purple.jpeg', 44, 1, 1, 1)
INSERT INTO Mobiles VALUES ('IP9845', N'Tối ưu điện năng - Sạc nhanh 20 W, đầy 50% pin trong khoảng 30 phút', 22.990000, N'iPhone 13 Pro Max 128GB', 2021, 'iPhone/iPhone13_Pro_Max_Blue.jpeg', 10, 1, 1, 1)
INSERT INTO Mobiles VALUES ('IP1313', N'Màn hình 6.7" Super Retina XDR độ sáng cao, sắc nét', 27.990000, N'iPhone 13 Pro Max 1TB', 2021, 'iPhone/iPhone13_Pro_Max_Black.jpeg', 3, 1, 1, 1)
INSERT INTO Mobiles VALUES ('IP8524', N'Trải nghiệm điện ảnh đỉnh cao - Camera kép 12MP, hỗ trợ ổn định hình ảnh quang học', 14.990000, N'iPhone 13 128GB | Chính hãng VN/A', 2021, 'iPhone/iPhone13.jpg', 30, 1, 1, 1)
INSERT INTO Mobiles VALUES ('IP4659', N'Màu sắc phù hợp cá tính - 6 màu sắc bắt mắt để lựa chọn', 9.890000, N'iPhone 11 64GB | Chính hãng VN/A', 2019, 'iPhone/iPhone11.jpg', 10, 1, 1, 1)

--Samsung
INSERT INTO Mobiles VALUES ('SS2424', N'Mở khoá giới hạn tiềm năng với AI - Hỗ trợ phiên dịch cuộc gọi, khoanh vùng tìm kiếm, Trợ lí Note và chình sửa anh', 27.090000, N'Samsung Galaxy S24 Ultra 12GB 256GB', 2024, 'Samsung/galaxy-s24-ultra-xam_1_3.jpeg', 200, 1, 2, 1)
INSERT INTO Mobiles VALUES ('SS2323', N'Chiến game bùng nổ - chip Snapdragon 8 Gen 2 8 nhân tăng tốc độ xử lí, màn hình 120Hz, pin 5.000mAh', 22.190000, N'Samsung Galaxy S23 Ultra 256GB', 2023, 'Samsung/samsung-galaxy-s23-ultra-thumb-xanh.jpg', 69, 1, 2, 1)
INSERT INTO Mobiles VALUES ('SS0023', N'Thoả sức chụp ảnh, quay video chuyên nghiệp - Camera đến 200MP, chế độ chụp đêm cải tiến, bộ xử lí ảnh thông minh', 22.190000, N'Samsung Galaxy S23 Ultra 256GB', 2023, 'Samsung/samsung-galaxy-s23-ultra-5g-hong.jpeg', 40, 1, 2, 1)
INSERT INTO Mobiles VALUES ('SS2222', N'Camera mắt thần bóng đêm Nightography - Chụp đêm cực đỉnh', 13.290000, 'Samsung Galaxy S22 Ultra (12GB - 512GB)', 2022, N'Samsung/samsung-galaxy-s22-ultra-thumb-do.jpg', 20, 1, 2, 1)
INSERT INTO Mobiles VALUES ('SS5555', N'Thiết kế tinh tế với nếp gấp vô hình - Cải tiến nếp gấp thẩm mĩ hơn và gập không kẽ hở', 40.990000, N'Samsung Galaxy Z Fold5 12GB 256GB', 2023, 'Samsung/samsung-galaxy-z-fold-5-256gb_1.webp', 151, 0, 2, 1)
INSERT INTO Mobiles VALUES ('SS3333', N'Smartphone gập đầu tiên có kháng nước', 20.490000, 'Samsung Galaxy Z Fold3 5G 256GB', 2021, N'Samsung/galaxy-z-fold3-kv_5g.webp', 5, 1, 2, 1)
INSERT INTO Mobiles VALUES ('SS0005', N'Tuyệt tác selfie thoả sức sáng tạo - Camera sau hỗ trợ AI xử lí cực sắc nét ngay cả trên màn hình ngoài', 19.990000, N'Samsung Galaxy Z Flip5 512GB', 2023, 'Samsung/samsung-galaxy-z-flip5-tim-4.webp', 36, 1, 2, 1)

--Oppo
INSERT INTO Mobiles VALUES ('OP3333', N'Bậc thầy thiết kế, siêu mỏng nhe - Mỏng chỉ 239g, nhẹ chỉ 5.8mm với nếp gấp tàng hình', 44.990000, N'OPPO Find N3 16GB 512GB', 2023, 'Oppo/OPPO_Find_N3.jpeg', 60, 0, 3, 1)
INSERT INTO Mobiles VALUES ('OP0003', N'Thiết kế gập linh hoạt, đường cong 3D, đường cắt kim cương - biểu tượng của sự phong cách giúp bạn luôn toả sáng', 15.890000, N'OPPO Find N3 Flip 12GB', 2023, 'Oppo/OPPO_Find_N3_Flip.jpeg', 30, 1, 3, 1)
INSERT INTO Mobiles VALUES ('OP0005', N'Đa nhiệm mạnh mẽ hơn ai hết - RAM mở rộng đến 16GB, ROM 256GB mang đến trải nghiệm đa tác vụ thoải mái', 9.690000, N'OPPO Reno10 5G 8GB 256GB', 2023, 'Oppo/OPPO_Reno10_Blue.jpeg', 6, 1, 3, 1)

--Xiaomi
INSERT INTO Mobiles VALUES ('XM1313', N'Đắm chìm vào không gian giải trí sống động - AMOLED 120Hz giúp thao tác cuộn mượt mà', 8.790000, N'Xiaomi 13 Lite', 2023, 'Xiaomi/Xiaomi_13_Lite.jpeg', 24, 1, 4, 1)
INSERT INTO Mobiles VALUES ('XM0013', N'Năng lượng bất tận cả ngày - Pin 5000mAh cùng sạc nhanh 67W, sạc đầy chỉ trong 42 phút', 10.390000, N'Xiaomi 13T 12GB 256GB', 2023, 'Xiaomi/Xiaomi_13T.jpeg', 20, 1, 4, 1)
INSERT INTO Mobiles VALUES ('XM0313', N'Bắt trọn khoảnh khắc - Cụm camera đến 108MP mạnh mẽ cùng khả năng thu phóng 3x', 4.590000, N'Xiaomi Redmi Note 13 6GB 128GB', 2023, 'Xiaomi/Xiaomi_Redmi_Note_13.jpeg', 1, 1, 4, 1)


-------------------------------------------------------------------------------Tablet-------------------------------------------------------------------------------
--iPad
INSERT INTO Mobiles VALUES ('TIP1021', N'Trải nghiệm hiển thị chất lượng - Màn hình Retina 10.2 inch, hỗ trợ True Tone', 7.690000, N'iPad 10.2 2021 WiFi 64GB | Chính hãng Apple Việt Nam', 2021, 'iPad/iPad_10.2_2021.jpeg', 30, 1, 1, 2)
INSERT INTO Mobiles VALUES ('TIP1092', N'Khả năng kết nối phụ kiện tuyệt vời - Dễ dàng kết nối Magic Keyboard và Apple Pencil biến iPad của bạn thành chiếc Laptop hoàn hảo', 14.090000, N'iPad Air 5 10.9 inch (2022) WIFI 64GB I Chính hãng Apple Việt Nam', 2022, 'iPad/iPad_Air_5_10.9inch.jpeg', 22, 1, 1, 2)
INSERT INTO Mobiles VALUES ('TIP1122', N'Thiết kế phẳng mạnh mẽ - Gia công từ kim loại bền bỉ, phong cách hiện đại, sang trọng', 19.890000, N'iPad Pro 11 inch 2022 M2 Wifi 128GB I Chính hãng Apple Việt Nam', 2022, 'iPad/iPad_Pro_12.9_inch_2022_M2.jpeg', 45, 1, 1, 2)

--Samsung
INSERT INTO Mobiles VALUES ('TSS9999', N'Sống động và sắc nét mọi khung hình - Màn hình 14.6 inch Dynamic AMOLED 2X,Tần số quét đến 120Hz cùng HDR10+', 21.990000, N'Samsung Galaxy Tab S9 Ultra 12GB 256GB', 2023, 'Samsung/Samsung_Galaxy_Tab_S9_Ultra.jpeg', 99, 1, 2, 2)
INSERT INTO Mobiles VALUES ('TSS8888', N'Luôn là trung tâm của mọi khung hình - Camera trước 12MP góc siêu rộng', 16.490000, 'Samsung Galaxy Tab S8 Plus 5G', 2022, N'Samsung/Samsung_Galaxy_Tab_S8_Plus.jpeg', 10, 1, 2, 2)
INSERT INTO Mobiles VALUES ('TSS0009', N'Đắm chìm sâu vào không gian âm thanh phong phú với loa Dolby Atmos mang lại trải nghiệm âm thanh đặc sắc hơn.', 4.890000, N'Samsung Galaxy Tab A9+ WIFI 4GB 64GB', 2023, 'Samsung/Samsung_Galaxy_Tab_A9+.jpeg', 13, 1, 2, 2)

--Oppo
INSERT INTO Mobiles VALUES ('TOP0009', N'Không gian hiển thị mãn nhãn - Màn hình IPS LCD kích thước 10.36 inch độ phân giải 1200 x 2000 Pixels', 4.990000, N'OPPO Pad Air', 2022, 'Oppo/OPPO_Pad_Air.jpeg', 9, 1, 3, 2)

--Xiaomi
INSERT INTO Mobiles VALUES ('TXM5555', N'Hiệu năng vượt trội - Chip Snapdragon 860 mạnh mẽ, RAM 6 GB, GPU Adreno 640', 6.690000, N'Xiaomi Pad 5 (6GB/256GB)', 2021, 'Xiaomi/Xiaomi_Pad_5.jpeg', 6, 1, 4, 2)
INSERT INTO Mobiles VALUES ('TXM6666', N'Tận hưởng âm thanh thực sự đắm chìm với Quad Speakers cùng ánh xạ kênh giúp điều chỉnh đầu ra âm thanh theo hướng màn hình của bạn.', 7.990000, N'Xiaomi Pad 6 8GB 128GB', 2022, 'Xiaomi/Xiaomi_Pad_6_8GB_128GB.jpeg', 11, 1, 4, 2)
INSERT INTO Mobiles VALUES ('TXM0000', N'Bảo vệ mắt bạn tốt hơn - Dễ chịu hơn với Chế độ Đọc 3.0, tính năng chống nháy màn hình và hạn chế ánh sáng xanh', 4.990000, N'Xiaomi Redmi Pad SE 6GB 128GB', 2022, 'Xiaomi/Xiaomi_Redmi_Pad_SE.jpeg', 3, 1, 4, 2)


-------------------------------------------------------------------------------Smartwatch-------------------------------------------------------------------------------
--AppleWatch
INSERT INTO Mobiles VALUES ('AW2023SE', N'Apple Watch SE 2023 40mm (GPS) với trang bị màn hình Retina cho hiển thị vô cùng sắc nét cùng kính cường lực vô cùng chắc chắn', 5.690000,N'Apple Watch SE 2 2023 40mm (GPS) viền nhôm', 2023,N'Apple_Watch_SE_2_2023_40mm.jpeg', 20, 1, 1, 3)
INSERT INTO Mobiles VALUES ('AW2023S9', N'Apple Watch Series 9 41mm 4G sở hữu khả năng xử lý mượt mà nhờ được trang bị chip S9 SiP mạnh mẽ cùng chất lượng hiển thị sắc nét trên màn hình 1.6 inch.', 12.490000,N'Apple Watch Series 9 41mm (4G) viền nhôm dây cao su', 2023, 'Apple_Watch_Series_9_41mm.jpeg', 40, 1, 1, 3)
INSERT INTO Mobiles VALUES ('AWU2023', N'Apple Watch Ultra 49mm (4G) viền titan dây vải cỡ trung là chiếc đồng hồ thông minh cao cấp cùng mặt kính Sapphire sang trọng bền bỉ.', 16.490000,N'Apple Watch Ultra 49MM (4G) - Viền Titan Dây Vải Cỡ Trung', 2023, 'Apple_Watch_Ultra_2_49mm.jpeg', 60, 1, 1, 3)

--SamSumWatch
INSERT INTO Mobiles VALUES ('WSSF3', N'Đồng hồ Samsung Galaxy Fit 3 thiết kế dạng viên thuốc, màn hình OLED 1.61 inch, mật độ điểm ảnh 302 ppi, trọng lượng chỉ 21.39g, kháng nước 5ATM cùng viên pin 135mAh kéo dài 21 ngày ấn tượng tích hợp sạc không dây.', 4.190000, N'Đồng hồ Samsung Galaxy Fit 3', 2023, 'Samsung_Galaxy_Fit_3.jpeg', 0, 0, 2, 3)
INSERT INTO Mobiles VALUES ('WSSGS3', N'Đồng hồ thông minh Samsung Gear S3 frontier là phiên bản kế nhiệm mới nhất của Gear S2 với nhiều những cải tiến mới rất đáng quan tâm.', 3.100000,N'Samsung Gear S3 frontier',  2023,'Samsung_Galaxy_Gear_S3.jpeg', 0, 0, 2, 3)
INSERT INTO Mobiles VALUES ('WSSWP5', N'Đồng hồ thông minh sở hữu một thiết kế sang trọng với mặt kính Sapphire bắt mắt và khung viền Titan cao cấp.', 5.490000,N'Samsung Galaxy Watch5 Pro',  2023,'Samsung_Galaxy_Watch5_Pro.jpeg', 20, 1, 2, 3)
INSERT INTO Mobiles VALUES ('WSSW640', N'Đồng hồ Samsung Galaxy Watch 6 trang bị màn hình Sapphire cứng cáp, bền bỉ với khả năng chống nước đạt chuẩn IP68 và 5ATM, giúp người dùng thoải mái sử dụng trong nhiều môi trường khác nhau.', 5.650000, N'Samsung Galaxy Watch6 40mm Bluetooth', 2023,'Samsung_Galaxy_Watch6_40mm.jpeg', 40, 1, 2, 3)

--OPPOWatch
INSERT INTO Mobiles VALUES ('WOPB2', N'OPPO đã cho ra mắt sản phẩm OPPO Band 2 với sự nâng cấp về thiết kế, tính năng theo dõi sức khỏe và các chế độ thể thao hỗ trợ người dùng chăm sóc cơ thể một cách khoa học.', 1.090000, N'Vòng đeo tay thông minh Oppo Band 2 dây silicone Trắng - Xanh', 2023, 'Oppo-band-2-obbe215-xanh.jpeg', 15, 1, 3, 3)

--XiaomiWatch
INSERT INTO Mobiles VALUES ('WXMB8', N'Vòng đeo tay thông minh Xiaomi Mi Band 8 Active sở hữu thiết kế siêu mỏng nhẹ với độ dày thân máy chỉ 9.99mm cùng màn hình TFT 1.47’’ hiển thị sống động.', 1.000000, N'Vòng đeo tay thông minh Xiaomi Mi Band 8 Active', 2023, 'Xiaomi_Mi_Band_8_Active.jpeg', 40, 1, 4, 3)
INSERT INTO Mobiles VALUES ('WXM4', N'Đồng hồ Xiaomi Redmi Watch 4 sở hữu vẻ ngoài với khung kim loại sang trọng kết hợp với màn hình AMOLED 1.97 inch cho chất lượng hiển thị tốt.', 2.690000, N'Đồng hồ thông minh Xiaomi Redmi Watch 4', 2023, 'Xiaomi_Redmi_Watch_4.jpeg', 20, 1, 4, 3)
INSERT INTO Mobiles VALUES ('WXMS1A', N'Sản phẩm Xiaomi Watch S1 là chiếc đồng hồ thông minh có thiết kế tròn cổ điển với sự trau chuốt trong thiết kế để tạo cảm giác thời thượng mà đơn giản, cổ điển nhưng đặc biệt cao cấp.', 2.290000, N'Đồng hồ thông minh Xiaomi Watch S1 Active', 2023, 'Xiaomi_Watch_S1_Active.jpeg', 30, 1, 4, 3)