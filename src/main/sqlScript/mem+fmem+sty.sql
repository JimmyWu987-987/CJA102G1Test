DROP TABLE IF EXISTS mem;
CREATE TABLE mem (
	mem_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	mem_acc varchar(40) NOT NULL UNIQUE,
	mem_pwd varchar(20) NOT NULL,
	acc_status tinyint NOT NULL DEFAULT 0,
	mem_name varchar(20) NOT NULL,
    mem_birthday date NOT NULL,
	mem_mobile varchar(11) NOT NULL,
	mem_email varchar(254) NOT NULL,
	mem_zipcode varchar(6) NOT NULL,
	mem_city varchar(5) NOT NULL,
	mem_dist varchar(5) NOT NULL,
	mem_addr varchar(40) NOT NULL,
	reg_date datetime NOT NULL DEFAULT current_timestamp,
	mem_point int NOT NULL DEFAULT 0
);

INSERT INTO mem (mem_acc, mem_pwd, acc_status, mem_name, mem_birthday, mem_mobile, mem_email, mem_zipcode, mem_city, mem_dist, mem_addr, reg_date, mem_point) VALUES
('zeusMax9914', 'Karma88@Rise', 1, '謝維綺', '1980-11-26', '0910-380143', 'pamela8508@gmail.com', '320', '桃園市', '中壢區', '仁和街35號', '2022-08-26 10:30:00', 150),
('NovaSkyline203', 'Lx657XhM', 1, '胡得軒', '1996-10-11', '0916-518593', 'henson1654@hotmail.com', '600', '嘉義市', '西區', '世賢路2段5號', '2022-08-26 11:29:30', 110),
('TigerRun88', '9y7wqUwv', 0, '宋柯雯', '1993-08-07', '0961-388330', 'arianna6146@hotmail.com', '511', '彰化縣', '社頭鄉', '中山路1段38號10樓之10', '2022-09-01 12:00:59', 253),
('valine203', 'echo92Xx@', 0, '郭實祐', '1990-11-01', '0937-453975', 'jeffrey2062@icloud.com', '360', '苗栗縣', '苗栗市', '宜春路62號', '2023-03-05 09:08:05', 20),
('alphaWolf2031', '7Y2rTPbZ', 0, '林蓁蓓', '1978-09-08', '0972-375934', 'kaylynn3676@hotmail.com', '803', '高雄市', '鹽埕區', '大成街98號', '2023-04-01 01:01:10', 5),
('SkyHunter77', 'cDMz4q55', 0, '何俞維', '1979-05-23', '0961-063659', 'hampden3392@gmail.com', '555', '南投縣', '魚池鄉', '日月街24號9樓之11', '2023-10-05 20:58:09', 16),
('tiger_XR9821', '82AY43Pw', 1, '連之義', '1992-07-28', '0915-476888', 'richards2316@gmail.com', '931', '屏東縣', '佳冬鄉', '民學路7號', '2024-06-16 22:10:00', 0),
('UtFeobef152', 'Jupiter9@Lx', 1, '許洋竹', '1985-05-19', '0956-715009', 'mendoza8324@gmail.com', '803', '高雄市', '鹽埕區', '大勇市場5號', '2024-10-20 14:20:35', 88),
('RavenX42ZpLm', 'windyX421@', 1, '陳婉術', '1982-06-21', '0924-554240', 'evangeline3888@gmail.com', '110', '臺北市', '信義區', '信義路5段16號6樓之6', '2024-11-20 11:15:20', 23),
('AlphaX9273', 't7pQkvx2', 0, '黃珍育', '1987-05-21', '0939-682988', 'debbie7435@outlook.com', '882', '澎湖縣', '望安鄉', '花嶼9號', '2024-12-01 08:54:53', 225),
('skyline_83x', 'MarsCode903', 0, '李大仁', '1965-02-28', '0911-222333', 'member001@example.com', '100', '台北市', '大安區', '信義路100號', '2025-01-01 10:00:00', 20),
('nova88_rider_12', 'novaRun88z', 1, '王小美', '1969-01-08', '0922-333444', 'member002@example.com', '221', '新北市', '板橋區', '中山路200號', '2025-02-05 11:00:00', 28),
('xtrmcoder207', 'Qq29@delta73', 1, '張志豪', '1989-04-28', '0933-444555', 'member003@example.com', '401', '台中市', '北區', '學士路300號', '2025-03-18 12:00:00', 0),
('alpha_2099zx', 'ZetaStorm99', 1, '陳玉芬', '1998-07-14', '0944-555666', 'member004@example.com', '801', '高雄市', '前金區', '五福路88號', '2025-03-18 13:00:00', 0),
('deltaWave7192', 'vR7@bLpW25', 2, '林建宏', '2000-01-19', '0955-666777', 'member005@example.com', '700', '台南市', '中西區', '民生路199號', '2025-05-25 14:00:00', 97),
('neorunner92', 'Alpha42moon', 0, '曾雅婷', '2002-10-26', '0966-777888', 'member006@example.com', '300', '新竹市', '東區', '光復路250號', '2025-06-06 15:00:00', 53),
('alpha3x9z1t', 'Skyline@Z9', 2, '游信宏', '2004-08-20', '0977-888999', 'member007@example.com', '970', '花蓮縣', '花蓮市', '中正路10號', '2025-07-13 16:00:00', 7),
('storm1987_wave', 'maxwell302', 0, '洪詠欣', '1999-08-31', '0988-999000', 'member008@example.com', '260', '宜蘭縣', '羅東鎮', '中山路一段88號', '2025-08-30 17:00:00', 5),
('midnight_42_zz', 'Tiger88@Run', 1, '邱柏睿', '2005-09-21', '0911-000222', 'member009@example.com', '600', '嘉義市', '西區', '垂楊路120號', current_timestamp(), 0),
('echo_delta_1209', 'Xp92kLo@1', 1, '簡心怡', '1988-12-25', '0922-000333', 'member010@example.com', '540', '南投縣', '南投市', '中興路300號', current_timestamp(), 0);
       
-- ================================================================

DROP TABLE IF EXISTS fmem;
CREATE TABLE fmem (
	fmem_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	f_id varchar(10) NOT NULL,
	fmem_acc varchar(40) NOT NULL,
	fmem_pwd varchar(20) NOT NULL,
	fmem_acc_status tinyint NOT NULL DEFAULT 0,
	fmem_acc_desc varchar(200) DEFAULT NULL,
	fmem_name varchar(20) NOT NULL,
	fmem_mobile varchar(11) NOT NULL,
	fmem_tel varchar(11) DEFAULT NULL,
	fmem_email varchar(254) NOT NULL,
	fmem_zipcode varchar(6) NOT NULL,
	fmem_city varchar(5) NOT NULL,
	fmem_dist varchar(5) NOT NULL,
	fmem_addr varchar(40) NOT NULL,
	bank_code varchar(5) NOT NULL,
	bank_acc varchar(20) NOT NULL,
	fmem_reg_date datetime NOT NULL,
	certi_status tinyint NOT NULL DEFAULT 0,
	fmem_pic longblob DEFAULT NULL,
	organic_pic longblob DEFAULT NULL,
	land_pic longblob DEFAULT NULL,
	insur_pic longblob DEFAULT NULL,
	store_pic longblob DEFAULT NULL,
	store_name varchar(50) DEFAULT NULL,
	store_intro varchar(500) DEFAULT NULL,
	sty_no tinyint NOT NULL DEFAULT 1,
	mkt_score int DEFAULT NULL,
	mkt_cnt int DEFAULT NULL,
	act_score int DEFAULT NULL,
	act_cnt int DEFAULT NULL,
	rpt_cnt tinyint DEFAULT NULL,
	prod_fee int DEFAULT NULL
);

INSERT INTO fmem (f_id, fmem_acc, fmem_pwd, fmem_acc_status, fmem_acc_desc, fmem_name, fmem_mobile, fmem_tel, fmem_email,
				   fmem_zipcode, fmem_city, fmem_dist, fmem_addr,  bank_code, bank_acc, fmem_reg_date, 
				   certi_status, fmem_pic, organic_pic, land_pic, insur_pic, store_pic, store_name, store_intro, sty_no, 
				   mkt_score, mkt_cnt, act_score, act_cnt, rpt_cnt, prod_fee) VALUES
('H237230756', 'user001', 'pwd12345', 0, NULL, '王小明', '0912-345678', NULL, 'user001@example.com', '101', '台北市', '中正區', '仁愛路一段100號', '004', '1234567890123456', '2024-05-01 10:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
('A182893231', 'user002', 'pwd12345', 0, NULL, '林小美', '0922-333444', NULL, 'user002@example.com', '102', '新北市', '板橋區', '文化路200號', '822', '2233445566778899', '2024-05-02 11:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
('A119254857', 'user003', 'pwd12345', 0, NULL, '陳大華', '0933-445566', NULL, 'user003@example.com', '103', '台中市', '西屯區', '市政路300號', '700', '3344556677889900', '2024-05-03 12:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
('E118270271', 'user004', 'pwd12345', 0, NULL, '張美麗', '0955-667788', NULL, 'user004@example.com', '104', '高雄市', '苓雅區', '光華路88號', '012', '4455667788990011', '2024-05-04 13:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
('F133927325', 'user005', 'pwd12345', 0, NULL, '吳志強', '0966-778899', NULL, 'user005@example.com', '221', '台南市', '東區', '東門路199號', '005', '5566778899001122', '2024-05-05 14:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
('J179726256', 'user006', 'pwd12345', 0, NULL, '葉志豪', '0977-889900', NULL, 'user006@example.com', '106', '新竹市', '東區', '關新路300號', '822', '6677889900112233', '2024-05-06 15:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
('L158944504', 'user007', 'pwd12345', 0, NULL, '簡文君', '0911-222333', NULL, 'user007@example.com', '107', '基隆市', '仁愛區', '忠孝路18號', '004', '7788990011223344', '2024-05-07 16:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
('M160270421', 'user008', 'pwd12345', 0, NULL, '朱庭瑜', '0933-777888', NULL, 'user008@example.com', '108', '桃園市', '中壢區', '中山路350號', '012', '8899001122334455', '2024-05-08 17:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
('N108676213', 'user009', 'pwd12345', 0, NULL, '劉家豪', '0922-111333', NULL, 'user009@example.com', '109', '宜蘭縣', '宜蘭市', '民權路68號', '700', '9900112233445566', '2024-05-09 18:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
('Q193833164', 'user010', 'pwd12345', 0, NULL, '黃靜怡', '0966-111222', NULL, 'user010@example.com', '100', '花蓮縣', '花蓮市', '和平路88號', '005', '0011223344556677', '2024-05-10 19:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- ================================================================

DROP TABLE IF EXISTS sty;
CREATE TABLE sty (
	sty_no tinyint NOT NULL PRIMARY KEY AUTO_INCREMENT,
    sty_css_path varchar(300) NOT NULL,
    sty_pic longblob DEFAULT NULL
);

INSERT INTO sty (sty_css_path) VALUES
('style#1'), ('style#2'), ('style#3');


-- FOREIGN KEY ================================================================
ALTER TABLE fmem
ADD CONSTRAINT fmem_styno_fk FOREIGN KEY (sty_no) REFERENCES sty(sty_no);

       
     
       
       
