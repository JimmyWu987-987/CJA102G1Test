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
-- SET @@auto_increment_increment = 1;
-- SET @@auto_increment_offset = 1;
CREATE TABLE sty (
	STY_NO tinyint NOT NULL AUTO_INCREMENT,
    STY_CSS_PATH varchar(300) NOT NULL,
    CONSTRAINT sty_NO_KEY PRIMARY KEY (STY_NO)
) ENGINE InnoDB;

INSERT INTO sty (STY_CSS_PATH) VALUES
('/css/style1.css'),
('/css/style2.css'),
('/css/style3.css');

-- 刪除/建立 小農會員
DROP TABLE IF EXISTS f_mem;
CREATE TABLE f_mem (
	F_MEM_ID int NOT NULL AUTO_INCREMENT,
    F_MEM_NAME varchar(20) NOT NULL,
    STY_NO tinyint DEFAULT NULL, -- FK
    CONSTRAINT f_mem_ID_KEY PRIMARY KEY (F_MEM_ID)
) ENGINE InnoDB;

INSERT INTO f_mem (F_MEM_NAME,STY_NO) VALUES
('吳永志',NULL),
('吳冠宏','2'),
('郭惠民','1'),
('孫叔均','3'),
('陳柏炘','1');


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
    CONSTRAINT pro_ad_PRO_AD_REVID_KEY PRIMARY KEY (PRO_AD_REVID)

) ENGINE InnoDB;

INSERT INTO pro_ad (
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
	MEM_ID int NOT NULL AUTO_INCREMENT,
    MEM_NAME varchar(20) NOT NULL,
    CONSTRAINT mem_ID_KEY PRIMARY KEY (MEM_ID)
) ENGINE InnoDB;

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
ADD CONSTRAINT f_mem_sty_FK FOREIGN KEY (STY_NO) REFERENCES sty(STY_NO);
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

