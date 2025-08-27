CREATE DATABASE IF NOT EXISTS myProject;
USE myProject;

-- step1. 商店樣式 -> 小農會員 -> 小農商品類別 -> 小農商品 -> 商城廣告
-- step2. 一般會員 -> 商城訂單 -> 商城訂單明細


-- 刪除/建立 商店樣式
DROP TABLE IF EXISTS STY;
SET @@auto_increment_increment = 10;
SET @@auto_increment_offset = 10;
CREATE TABLE STY (
	STY_NO tinyint NOT NULL AUTO_INCREMENT,
    STY_CSS_PATH varchar(300) NOT NULL,
    CONSTRAINT STY_NO_KEY PRIMARY KEY (STY_NO)
) ENGINE InnoDB;

INSERT INTO STY (STY_CSS_PATH) VALUES
('/css/style1.css'),
('/css/style2.css'),
('/css/style3.css');


-- 刪除/建立 小農會員
DROP TABLE IF EXISTS F_MEM;
SET @@auto_increment_increment = 1;
SET @@auto_increment_offset = 1;
CREATE TABLE F_MEM (
	F_MEM_ID int NOT NULL AUTO_INCREMENT,
    F_MEM_NAME varchar(20) NOT NULL,
    STY_NO tinyint DEFAULT NULL, -- FK
    CONSTRAINT F_MEM_ID_KEY PRIMARY KEY (F_MEM_ID),
    CONSTRAINT F_MEM_STY_FK FOREIGN KEY (STY_NO) REFERENCES STY(STY_NO)
) ENGINE InnoDB;

INSERT INTO F_MEM (F_MEM_NAME,STY_NO) VALUES
('吳永志',NULL),
('吳冠宏','20'),
('郭惠民','10'),
('孫叔均','30'),
('陳柏炘','10');


-- 刪除/建立 小農類別商品
DROP TABLE IF EXISTS PRODUCT_CATEGORY;
SET @@auto_increment_increment = 1;
SET @@auto_increment_offset = 1;
CREATE TABLE PRODUCT_CATEGORY (
	PRO_CATE_ID int NOT NULL AUTO_INCREMENT,
    PRO_CATE_NAME varchar(100) NOT NULL,
    CONSTRAINT PRODUCT_CATEGORY_PRO_CATE_ID_KEY PRIMARY KEY (PRO_CATE_ID)
) ENGINE InnoDB;

INSERT INTO PRODUCT_CATEGORY (PRO_CATE_NAME) VALUES
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
DROP TABLE IF EXISTS PRODUCT;
SET @@auto_increment_increment = 1;
SET @@auto_increment_offset = 1;
CREATE TABLE PRODUCT (
	PRO_ID int NOT NULL AUTO_INCREMENT,
    PRO_CATE_ID int NOT NULL, -- FK
    F_MEM_ID int NOT NULL, -- FK
    PRO_NAME varchar(100) NOT NULL,
    CONSTRAINT PRODUCT_PROID_KEY PRIMARY KEY (PRO_ID),
    CONSTRAINT PRODUCT_PRODUCT_CATEGORY_FK FOREIGN KEY (PRO_CATE_ID) REFERENCES PRODUCT_CATEGORY(PRO_CATE_ID),
    CONSTRAINT PRODUCT_F_MEM_FK FOREIGN KEY (F_MEM_ID) REFERENCES F_MEM(F_MEM_ID)
) ENGINE InnoDB;

INSERT INTO PRODUCT (PRO_CATE_ID, F_MEM_ID, PRO_NAME) VALUES
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

-- 刪除/建立 商城廣告
DROP TABLE IF EXISTS PRO_AD;
SET @@auto_increment_increment = 1;
SET @@auto_increment_offset = 1;
CREATE TABLE PRO_AD (
	PRO_AD_REVID int NOT NULL AUTO_INCREMENT,
    PRO_ID int NOT NULL, -- FK
    F_MEM_ID int NOT NULL, -- FK
    PRO_AD_IMG longblob,
    PRO_AD_REVSTAT tinyint,
    PRO_AD_REVUPD datetime,
    PRO_AD_REVREMARK varchar(100),
	PRO_AD_LAUNSTAT tinyint,
    PRO_AD_LAUNUPD datetime,
    PRO_AD_START date,
    PRO_AD_END date,
    PRO_AD_FEE int,
    PRO_AD_FEE_END date,
    CONSTRAINT PRO_AD_PRO_AD_REVID_KEY PRIMARY KEY (PRO_AD_REVID),
    CONSTRAINT PRO_AD_REVID_PRO_ID_FK FOREIGN KEY (PRO_ID) REFERENCES PRODUCT(PRO_ID),
    CONSTRAINT PRO_AD_F_MEM_ID_FK FOREIGN KEY (F_MEM_ID) REFERENCES F_MEM(F_MEM_ID)
) ENGINE InnoDB;

INSERT INTO PRO_AD (
	PRO_ID,
    F_MEM_ID,
    PRO_AD_IMG,
    PRO_AD_REVSTAT,
    PRO_AD_REVUPD,
    PRO_AD_REVREMARK,
    PRO_AD_LAUNSTAT,
    PRO_AD_LAUNUPD,
    PRO_AD_START,
    PRO_AD_END,
    PRO_AD_FEE,
    PRO_AD_FEE_END
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


-- 建立 FK
-- 小農會員 FK 商店樣式
-- ALTER TABLE F_MEM
-- ADD CONSTRAINT F_MEM_STY_FK FOREIGN KEY (STY_NO) REFERENCES STY(STY_NO);
-- 小農商品 FK 小農類別商品
-- ALTER TABLE PRODUCT
-- ADD CONSTRAINT PRODUCT_PRODUCT_CATEGORY_FK FOREIGN KEY (PRO_CATE_ID) REFERENCES PRODUCT_CATEGORY(PRO_CATE_ID);
-- 小農商品 FK 小農會員
-- ALTER TABLE PRODUCT
-- ADD CONSTRAINT PRODUCT_F_MEM_FK FOREIGN KEY (F_MEM_ID) REFERENCES F_MEM(F_MEM_ID);

