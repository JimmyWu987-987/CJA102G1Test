CREATE DATABASE IF NOT EXISTS myproject;
USE myproject;

-- 總共 31 個 Table

-- step 1. 

-- (1-1) 商店樣式 -> 小農會員（FK商品樣式編號）

-- (1-2) 小農商品類別 -> 小農商品（FK商品類別編號）（FK小農會員編號）-> 商品圖片（FK商品編號）
-- ps.「商城訂單」建立好才建「商城訂單明細」

-- (1-3) 商城廣告（FK商品編號）（FK小農會員編號）
-- ps.「一般會員」建立好才建「購物車」、「商品評論」、「檢舉表單」

-- (1-4) 活動分類 -> 活動（FK小農會員編號）-> 活動分類明細（FK活動編號）（FK分類編號）

-- (1-5) 活動照片（FK活動編號）-> 活動廣告（FK活動編號）（FK小農會員編號）

-- (1-6) 場次（FK小農會員編號）
-- ps.「一般會員」、「活動折價卷持有者明細」建立好才建「報名訂單」




-- 刪除/建立 商店樣式
DROP TABLE IF EXISTS sty;
CREATE TABLE sty (
	sty_no tinyint NOT NULL PRIMARY KEY AUTO_INCREMENT,
    sty_css_path varchar(300) NOT NULL
);

INSERT INTO sty (sty_css_path) VALUES
('style#1'), ('style#2'), ('style#3');

-- 刪除/建立 小農會員
DROP TABLE IF EXISTS f_mem;
CREATE TABLE f_mem (
	f_mem_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	f_id varchar(10) NOT NULL,
	f_mem_acc varchar(40) NOT NULL,
	f_mem_pwd varchar(20) NOT NULL,
	f_mem_acc_status tinyint NOT NULL DEFAULT 0,
	f_mem_acc_desc varchar(200) DEFAULT NULL,
	f_mem_name varchar(20) NOT NULL,
	f_mem_mobile varchar(11) NOT NULL,
	f_mem_tel varchar(11) DEFAULT NULL,
	f_mem_email varchar(254) NOT NULL,
	f_mem_zipcode varchar(6) NOT NULL,
	f_mem_city varchar(5) NOT NULL,
	f_mem_dist varchar(5) NOT NULL,
	f_mem_addr varchar(40) NOT NULL,
	bank_code varchar(5) NOT NULL,
	bank_acc varchar(20) NOT NULL,
	f_mem_reg_date datetime NOT NULL,
	certi_status tinyint NOT NULL DEFAULT 0,
	f_mem_pic longblob DEFAULT NULL,
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

INSERT INTO f_mem (f_id, f_mem_acc, f_mem_pwd, f_mem_acc_status, f_mem_acc_desc, f_mem_name, f_mem_mobile, f_mem_tel, f_mem_email,
				   f_mem_zipcode, f_mem_city, f_mem_dist, f_mem_addr,  bank_code, bank_acc, f_mem_reg_date, 
				   certi_status, f_mem_pic, organic_pic, land_pic, insur_pic, store_pic, store_name, store_intro, sty_no, 
				   mkt_score, mkt_cnt, act_score, act_cnt, rpt_cnt, prod_fee) VALUES
('H237230756', 'user001', 'pwd12345', 0, NULL, '王小明', '0912-345678', NULL, 'user001@example.com', '10001', '台北市', '中正區', '仁愛路一段100號', '004', '1234567890123456', '2024-05-01 10:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
('A182893231', 'user002', 'pwd12345', 0, NULL, '林小美', '0922-333444', NULL, 'user002@example.com', '10002', '新北市', '板橋區', '文化路200號', '822', '2233445566778899', '2024-05-02 11:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
('A119254857', 'user003', 'pwd12345', 0, NULL, '陳大華', '0933-445566', NULL, 'user003@example.com', '10003', '台中市', '西屯區', '市政路300號', '700', '3344556677889900', '2024-05-03 12:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
('E118270271', 'user004', 'pwd12345', 0, NULL, '張美麗', '0955-667788', NULL, 'user004@example.com', '10004', '高雄市', '苓雅區', '光華路88號', '012', '4455667788990011', '2024-05-04 13:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
('F133927325', 'user005', 'pwd12345', 0, NULL, '吳志強', '0966-778899', NULL, 'user005@example.com', '22001', '台南市', '東區', '東門路199號', '005', '5566778899001122', '2024-05-05 14:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
('J179726256', 'user006', 'pwd12345', 0, NULL, '葉志豪', '0977-889900', NULL, 'user006@example.com', '10006', '新竹市', '東區', '關新路300號', '822', '6677889900112233', '2024-05-06 15:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
('L158944504', 'user007', 'pwd12345', 0, NULL, '簡文君', '0911-222333', NULL, 'user007@example.com', '10007', '基隆市', '仁愛區', '忠孝路18號', '004', '7788990011223344', '2024-05-07 16:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
('M160270421', 'user008', 'pwd12345', 0, NULL, '朱庭瑜', '0933-777888', NULL, 'user008@example.com', '10008', '桃園市', '中壢區', '中山路350號', '012', '8899001122334455', '2024-05-08 17:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
('N108676213', 'user009', 'pwd12345', 0, NULL, '劉家豪', '0922-111333', NULL, 'user009@example.com', '10009', '宜蘭縣', '宜蘭市', '民權路68號', '700', '9900112233445566', '2024-05-09 18:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
('Q193833164', 'user010', 'pwd12345', 0, NULL, '黃靜怡', '0966-111222', NULL, 'user010@example.com', '10010', '花蓮縣', '花蓮市', '和平路88號', '005', '0011223344556677', '2024-05-10 19:00:00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);


-- 刪除/建立 小農類別商品
DROP TABLE IF EXISTS product_category;
CREATE TABLE product_category (
	PRO_CATE_ID int NOT NULL AUTO_INCREMENT,
    PRO_CATE_NAME varchar(100) NOT NULL,
    CONSTRAINT product_category_PRO_CATE_ID_KEY PRIMARY KEY (PRO_CATE_ID)
) ENGINE InnoDB;

INSERT INTO product_category (PRO_CATE_NAME) VALUES
('蔬菜'),
('水果'),
('米糧'),
('茶葉'),
('香菇'),
('蜂蜜'),
('雞蛋'),
('堅果'),
('花卉'),
('海鮮');

-- 刪除/建立 小農商品
DROP TABLE IF EXISTS product;
CREATE TABLE product (
	PRO_ID int NOT NULL AUTO_INCREMENT,
    PRO_CATE_ID int NOT NULL, -- FK
    F_MEM_ID int NOT NULL, -- FK
    PRO_NAME varchar(100) NOT NULL,
    CONSTRAINT product_PRO_ID_KEY PRIMARY KEY (PRO_ID)
) ENGINE InnoDB;

INSERT INTO product (PRO_CATE_ID, F_MEM_ID, PRO_NAME) VALUES
(1, 1, '有機高麗菜'),    -- 蔬菜
(1, 2, '小黃瓜'),
(2, 3, '蘋果'),      -- 水果
(2, 4, '香蕉'),
(3, 5, '白米'),      -- 米糧
(3, 1, '糙米'),
(4, 2, '高山烏龍茶'),  -- 茶葉
(4, 3, '大吉嶺紅茶'),
(5, 4, '乾燥香菇'),    -- 香菇
(5, 5, '新鮮杏鮑菇'),
(6, 1, '龍眼蜜'),      -- 蜂蜜
(6, 2, '荔枝蜜'),
(7, 3, '放牧雞蛋'),    -- 雞蛋
(7, 4, '紅心鴨蛋'),
(8, 5, '夏威夷豆'),    -- 堅果
(8, 1, '腰果'),
(9, 2, '玫瑰花束'),    -- 花卉
(9, 3, '向日葵盆栽'),
(10, 4, '生食級鮭魚'),   -- 海鮮
(10, 5, '急速冷凍白蝦');


-- 刪除/建立 商品圖片
DROP TABLE IF EXISTS product_image;
CREATE TABLE product_image (
	PRO_IMG_ID int NOT NULL,
    PRO_ID int NOT NULL, -- FK
    PRO_IMG LONGBLOB DEFAULT NULL,
    CONSTRAINT product_image_PRO_IMG_ID_KEY PRIMARY KEY (PRO_IMG_ID)
) ENGINE InnoDB;

INSERT INTO product_image (PRO_IMG_ID, PRO_ID, PRO_IMG) VALUES
(1, 10, NULL),
(2, 5, NULL),
(3, 18, NULL),
(4, 2, NULL),
(5, 14, NULL),
(6, 7, NULL),
(7, 20, NULL),
(8, 12, NULL),
(9, 3, NULL),
(10, 16, NULL),
(11, 8, NULL),
(12, 1, NULL),
(13, 19, NULL),
(14, 6, NULL),
(15, 11, NULL),
(16, 4, NULL),
(17, 17, NULL),
(18, 9, NULL),
(19, 13, NULL),
(20, 15, NULL);



-- 刪除/建立 商城廣告
DROP TABLE IF EXISTS pro_ad;
CREATE TABLE pro_ad (
	pro_ad_revid int NOT NULL AUTO_INCREMENT,
    pro_id int NOT NULL, -- FK
    f_mem_id int NOT NULL, -- FK
    pro_ad_img longblob,
    pro_ad_revstat tinyint,
    pro_ad_revupd datetime,
    pro_ad_revremark varchar(100),
	pro_ad_launstat tinyint,
    pro_ad_launupd datetime,
    pro_ad_start date,
    pro_ad_end date,
    pro_ad_fee int,
    pro_ad_fee_end date,
    CONSTRAINT pro_ad_pro_ad_revid_key PRIMARY KEY (pro_ad_revid)

) ENGINE InnoDB;

INSERT INTO pro_ad (
	pro_id,
	f_mem_id,
	pro_ad_img,
	pro_ad_revstat,
	pro_ad_revupd,
	pro_ad_revremark,
	pro_ad_launstat,
	pro_ad_launupd,
	pro_ad_start,
	pro_ad_end,
	pro_ad_fee,
	pro_ad_fee_end
) VALUES
(1, 1, NULL, 1, '2025-08-01 10:00:00', '待審核（編輯中）', NULL, NULL, '2025-09-01', '2025-09-30', 500, '2025-08-25'), -- 待審核（編輯中）
(5, 2, NULL, 2, '2025-08-05 15:30:00', '審核通過（已下架，待上架）', 0, '2025-08-05 15:30:00', '2025-09-10', '2025-10-10', 800, '2025-09-05'), -- 審核通過（已下架，待上架）
(12, 3, NULL, 3, '2025-08-08 11:20:00', '審核未過（缺件）,圖片尺寸不符', NULL, NULL, '2025-09-15', '2025-10-15', 750, '2025-09-10'), -- 審核未過（缺件）
(8, 4, NULL, 4, '2025-08-10 14:00:00', '待繳費', NULL, NULL, '2025-09-20', '2025-10-20', 1200, '2025-09-15'), -- 待繳費
(15, 5, NULL, 5, '2025-08-12 09:00:00', '已繳費（已上架）', 1, '2025-08-15 09:00:00', '2025-08-15', '2025-09-15', 1000, '2025-08-12'), -- 已繳費（已上架）
(20, 1, NULL, 2, '2025-08-13 16:00:00', '審核通過（已上架）', 1, '2025-08-14 10:00:00', '2025-08-14', '2025-09-14', 900, '2025-08-10'), -- 審核通過（已上架）
(4, 2, NULL, 1, '2025-08-15 08:30:00', '待審核', NULL, NULL, '2025-10-01', '2025-11-01', 600, '2025-09-25'), -- 待審核
(9, 3, NULL, 3, '2025-08-18 10:45:00', '審核未過（內容不符）廣告內容與商品不符', NULL, NULL, '2025-10-05', '2025-11-05', 700, '2025-09-30'), -- 審核未過（內容不符）
(11, 4, NULL, 5, '2025-08-20 11:00:00', '已上架', 1, '2025-08-20 12:00:00', '2025-08-20', '2025-09-20', 1100, '2025-08-18'), -- 已上架
(18, 5, NULL, 0, '2025-08-22 14:30:00', '編輯中', NULL, NULL, '2025-10-10', '2025-11-10', 950, '2025-10-05'); -- 編輯中


-- 刪除/建立 活動分類
-- 刪除/建立 活動
-- 刪除/建立 活動分類明細
-- 刪除/建立 活動照片
-- 刪除/建立 活動廣告
-- 刪除/建立 場次






-- step 2. 

-- (2-1) 一般會員
 
-- (2-2) 商品折價卷 -> 商品折價卷持有者明細（FK商品折價卷編號）（FK一般會員編號）

-- (2-3) 商城訂單（FK一般會員編號）（FK商品折價卷持有者流水號） -> 商城訂單明細（FK訂單編號）（FK商品編號）

-- (2-4) 購物車（FK一般會員編號）（FK商品編號） -> 檢舉表單(FK商品編號) -> 商品評論（FK商品編號）（FK一般會員編號）

-- (2-5) 活動折價卷 -> 活動折價卷持有者明細（FK活動折價卷編號）（FK一般會員編號）

-- (2-6) 報名訂單（FK場次編號）（FK一般會員編號）（FK活動折價卷持有者流水號）

-- (2-7) 商品收藏清單（FK一般會員編號）（FK商品編號） -> 活動收藏清單（FK一般會員編號）（FK活動編號）


-- 刪除/建立 一般會員
DROP TABLE IF EXISTS mem;
CREATE TABLE mem (
	mem_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	mem_acc varchar(40) NOT NULL,
	mem_pwd varchar(20) NOT NULL,
	acc_status tinyint NOT NULL DEFAULT 0,
	mem_name varchar(20) NOT NULL,
	mem_mobile varchar(11) NOT NULL,
	mem_email varchar(254) NOT NULL,
	mem_zipcode varchar(6) NOT NULL,
	mem_city varchar(5) NOT NULL,
	mem_dist varchar(5) NOT NULL,
	mem_addr varchar(40) NOT NULL,
	reg_date datetime NOT NULL,
	mem_point int NOT NULL DEFAULT 0
);

INSERT INTO mem (mem_acc, mem_pwd, mem_name, mem_mobile, mem_email, mem_zipcode, mem_city, mem_dist, mem_addr, reg_date) VALUES
('account1', 'sedJ5a98', '謝維綺', '0910-380143', 'pamela8508@gmail.com', '32066', '桃園市', '中壢區', '仁和街35號', '2023-08-26 10:30:00'),
('BkJdfbkE', 'Lx657XhM', '胡得軒', '0916-518593', 'henson1654@hotmail.com', '60090', '嘉義市', '西區', '世賢路2段5號', '2025-08-26 11:29:30'),
('qzrLBPga', '9y7wqUwv', '宋柯雯', '0961-388330', 'arianna6146@hotmail.com', '51141', '彰化縣', '社頭鄉', '中山路１段38號10樓之10', '2024-09-01 12:00:59'),
('ijPQjJRt', 'LF342R5y', '郭實祐', '0937-453975', 'jeffrey2062@icloud.com', '36053', '苗栗縣', '苗栗市', '宜春路62號', '2025-03-05 09:08:05'),
('tjJkwVwn', '7Y2rTPbZ', '林蓁蓓', '0972-375934', 'kaylynn3676@hotmail.com', '80343', '高雄市', '鹽埕區', '大成街98號', '2025-04-01 01:01:10'),
('account2', 'cDMz4q55', '何俞維', '0961-063659', 'hampden3392@gmail.com', '55546', '南投縣', '魚池鄉', '日月街24號9樓之11', '2023-10-05 20:58:09'),
('account3', '82AY43Pw', '連之義', '0915-476888', 'richards2316@gmail.com', '93144', '屏東縣', '佳冬鄉', '民學路7號', '2025-06-16 22:10:00'),
('UtFeobef', '5x2c42mw', '許洋竹', '0956-715009', 'mendoza8324@gmail.com', '80344', '高雄市', '鹽埕區', '大勇市場5號', '2024-12-20 14:20:35'),
('QhorvKYv', 'N72C7b86', '陳婉術', '0924-554240', 'evangeline3888@gmail.com', '11075', '臺北市', '信義區', '信義路5段16號6樓之6', '2024-11-20 11:15:20'),
('EyjzUHcd', 't7pQkvx2', '黃珍育', '0939-682988', 'debbie7435@outlook.com', '88246', '澎湖縣', '望安鄉', '花嶼9號', '2025-09-01 08:54:53'),
('member001', 'pass1234', '李大仁', '0911222333', 'member001@example.com', '10001', '台北市', '大安區', '信義路100號', '2024-06-01 10:00:00'),
('member002', 'pass1234', '王小美', '0922333444', 'member002@example.com', '22001', '新北市', '板橋區', '中山路200號', '2024-06-02 11:00:00'),
('member003', 'pass1234', '張志豪', '0933444555', 'member003@example.com', '40301', '台中市', '北區', '學士路300號', '2024-06-03 12:00:00'),
('member004', 'pass1234', '陳玉芬', '0944555666', 'member004@example.com', '80001', '高雄市', '前金區', '五福路88號', '2024-06-04 13:00:00'),
('member005', 'pass1234', '林建宏', '0955666777', 'member005@example.com', '70001', '台南市', '中西區', '民生路199號', '2024-06-05 14:00:00'),
('member006', 'pass1234', '曾雅婷', '0966777888', 'member006@example.com', '30001', '新竹市', '東區', '光復路250號', '2024-06-06 15:00:00'),
('member007', 'pass1234', '游信宏', '0977888999', 'member007@example.com', '97001', '花蓮縣', '花蓮市', '中正路10號', '2024-06-07 16:00:00'),
('member008', 'pass1234', '洪詠欣', '0988999000', 'member008@example.com', '26001', '宜蘭縣', '羅東鎮', '中山路一段88號', '2024-06-08 17:00:00'),
('member009', 'pass1234', '邱柏睿', '0911000222', 'member009@example.com', '60001', '嘉義市', '西區', '垂楊路120號', '2024-06-09 18:00:00'),
('member010', 'pass1234', '簡心怡', '0922000333', 'member010@example.com', '54001', '南投縣', '南投市', '中興路300號', '2024-06-10 19:00:00');

-- 刪除/建立 商品折價卷
-- 刪除/建立 商品折價卷持有者明細
-- 刪除/建立 商城訂單
-- 刪除/建立 商城訂單明細
-- 刪除/建立 購物車
-- 刪除/建立 檢舉表單
-- 刪除/建立 商品評論
-- 刪除/建立 活動折價卷
-- 刪除/建立 活動折價卷持有者明細
-- 刪除/建立 報名訂單
-- 刪除/建立 商品收藏清單
-- 刪除/建立 活動收藏清單






-- step 3. 
-- (3-1) 最新消息清單

-- (3-2) 常見QA清單

-- (3-2) 管理員職稱表 -> 管理員（FK職稱編號） -> 功能權限 -> 角色權限（FK職稱編號）（FK權限編號）


-- 最新消息清單
-- 常見QA清單
-- 管理員職稱表
-- 管理員
-- 功能權限
-- 角色權限





-- step1.
-- 建立 FK
-- 小農會員 FK 商店樣式編號
ALTER TABLE f_mem
ADD CONSTRAINT fmem_styno_fk FOREIGN KEY (sty_no) REFERENCES sty(sty_no);
-- 小農商品 FK 商品類別編號
ALTER TABLE product
ADD CONSTRAINT product_product_category_FK FOREIGN KEY (PRO_CATE_ID) REFERENCES product_category(PRO_CATE_ID);
-- 小農商品 FK 小農編號
ALTER TABLE product
ADD CONSTRAINT product_f_men_FK FOREIGN KEY (F_MEM_ID) REFERENCES f_mem(F_MEM_ID);
-- 商品圖片 FK 商品編號
ALTER TABLE product_image
ADD CONSTRAINT product_image_product_FK FOREIGN KEY (PRO_ID) REFERENCES product(PRO_ID);
-- 商城廣告 FK 商品編號
ALTER TABLE pro_ad
ADD CONSTRAINT pro_ad_product_FK FOREIGN KEY (PRO_ID) REFERENCES product(PRO_ID);
-- 商城廣告 FK 小農會員編號
ALTER TABLE pro_ad
ADD CONSTRAINT pro_ad_f_mem_ID_FK FOREIGN KEY (F_MEM_ID) REFERENCES f_mem(F_MEM_ID);

