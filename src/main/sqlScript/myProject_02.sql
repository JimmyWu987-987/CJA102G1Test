DROP DATABASE IF EXISTS myproject;
CREATE DATABASE IF NOT EXISTS myproject; 
USE myproject;
-- step1. 商店折價卷 -> 商品折價卷持有者明細 -> 商城訂單
-- step2. 活動折價卷 -> act_cpn活動折價卷持有者明細 -> 報名訂單
-- step3. 一般會員 -> 商品收藏清單 -> 小農商品

-- ----------------------------------------------------
-- 刪除/建立 一般會員
DROP TABLE IF EXISTS mem;
CREATE TABLE mem (
	MEM_ID int NOT NULL AUTO_INCREMENT,
    MEM_NAME varchar(20) NOT NULL,
    CONSTRAINT MEM_ID_KEY PRIMARY KEY (MEM_ID)
) ENGINE InnoDB;
-- 一般會員
INSERT INTO mem (MEM_NAME) VALUES
('王小明'),
('林小美'),
('陳大華'),
('張美麗'),
('吳志強'),
('葉志豪'),
('簡文君'),
('朱庭瑜'),
('劉家豪'),
('黃靜怡');

-- 刪除/建立 小農商品
DROP TABLE IF EXISTS product;
CREATE TABLE product (
	PRO_ID int NOT NULL AUTO_INCREMENT,
    PRO_CATE_ID int NOT NULL, -- FK
    F_MEM_ID int NOT NULL, -- FK
    PRO_NAME varchar(100) NOT NULL,
    CONSTRAINT PRODUCT_PRO_ID_KEY PRIMARY KEY (PRO_ID)
) ENGINE InnoDB;
-- 小農商品
INSERT INTO product (PRO_CATE_ID, F_MEM_ID, PRO_NAME) VALUES
(1, 1, '商品1'),
(1, 1, '商品2'),
(2, 2, '商品3'),
(2, 2, '商品4'),
(3, 3, '商品5'),
(3, 3, '商品6'),
(4, 4, '商品7'),
(4, 4, '商品8'),
(5, 5, '商品9'),
(5, 5, '商品10');
-- 刪除/建立 小農會員
DROP TABLE IF EXISTS f_mem;
CREATE TABLE f_mem (
	F_MEM_ID int NOT NULL AUTO_INCREMENT,
    F_MEM_NAME varchar(20) NOT NULL,
    STY_NO tinyint DEFAULT NULL, -- FK
    CONSTRAINT F_MEM_ID_KEY PRIMARY KEY (F_MEM_ID)
) ENGINE InnoDB;
-- 小農會員
INSERT INTO f_mem (F_MEM_NAME) VALUES
('王小明'),
('林小美'),
('陳大華'),
('張美麗'),
('吳志強'),
('葉志豪'),
('簡文君'),
('朱庭瑜'),
('劉家豪'),
('黃靜怡');
-- ----------------------------------------------------
DROP TABLE IF EXISTS  pro_cpn;
CREATE TABLE pro_cpn(
PRO_CPN_ID INT NOT NULL AUTO_INCREMENT,
CPN_NAME VARCHAR(50) NOT NULL,
DISC_TYPE TINYINT NOT NULL COMMENT '0:滿額折抵,1: 百分比',
DISC_VALUE DECIMAL(10,2) NOT NULL,
MIN_SPEND INT,
START_DATE DATE,
VALID_DAYS INT,
CPN_DESC VARCHAR(200) COMMENT '折價卷規則描述',
IS_ACTIVE TINYINT NOT NULL COMMENT '0:未啟用,1:啟用',
CRT_AT  DATETIME  NOT NULL  DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
APPL_SCOPE TINYINT NOT NULL DEFAULT 0 COMMENT '0: 全館, 1: 指定小農, 2: 指定商品',
PRIMARY KEY (PRO_CPN_ID)
) ENGINE=InnoDB;

-- 商店折價券
INSERT INTO pro_cpn  
(CPN_NAME, DISC_TYPE, DISC_VALUE, MIN_SPEND, START_DATE, VALID_DAYS, CPN_DESC, IS_ACTIVE, APPL_SCOPE) 
VALUES
-- 1. 滿額折抵券（滿500折100，全館）
('滿500折100', 0, 100.00, 500, '2025-09-01', NULL, '消費滿500折100元', 1, 0),

-- 2. 百分比折扣券（全館85折，有效期30天）
('全館85折', 1, 0.85, NULL, NULL, 30, '領後30天內有效', 1, 0),

-- 3. 滿1000折200（全館）
('滿1000折200', 0, 200.00, 1000, '2025-09-01', NULL, '消費滿1000折200元', 1, 0),

-- 4. 9折券（全館，新品專用）
('全館9折券', 1, 0.90, NULL, '2025-09-15', 15, '全館適用，限新品', 1, 0),

-- 5. 滿300折50（尚未啟用）
('滿300折50 (尚未啟用)', 0, 50.00, 300, '2025-10-01', NULL, '活動預備用券', 0, 0),

-- 6. 滿200折20（週末限定）
('滿200折20', 0, 20.00, 200, '2025-09-05', 7, '週末限定折抵', 1, 0),

-- 7. 全館8折券
('全館8折券', 1, 0.80, NULL, '2025-09-10', 10, '全館適用，限時8折', 1, 0),

-- 8. 滿1500折300
('滿1500折300', 0, 300.00, 1500, '2025-09-20', NULL, '全館滿1500折300元', 1, 0),

-- 9. 新客專屬9折券
('新客專屬9折券', 1, 0.90, NULL, NULL, 14, '新註冊會員14天內使用', 1, 0),

-- 10. 預購商品折100
('預購折100', 0, 100.00, 600, '2025-09-25', 10, '預購商品專屬折抵', 1, 0);

DROP TABLE IF EXISTS  mem_pro_cpn;
CREATE TABLE mem_pro_cpn(
CPN_HOLDER_DETAIL_ID INT NOT NULL AUTO_INCREMENT,
PRO_CPN_ID INT NOT NULL, -- FK
MEM_ID INT NOT NULL, -- FK
CPN_USE_STATUS TINYINT  NOT NULL COMMENT '0:未使用,1:已使用,2:已過期',
CRT_AT DATETIME  NOT NULL  DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
RCV_AT DATETIME NOT NULL,
EFF_START DATE NOT NULL,
EFF_END DATE,
USED_AT DATETIME,
PRIMARY KEY (CPN_HOLDER_DETAIL_ID)
)ENGINE=InnoDB;
-- 商品折價券持有者明細
INSERT INTO mem_pro_cpn
(PRO_CPN_ID, MEM_ID, CPN_USE_STATUS, RCV_AT, EFF_START, EFF_END, USED_AT)
VALUES
(1, 1, 0, NOW(), '2025-09-01', '2025-09-30', NULL),  -- 未使用
(2, 2, 1, NOW(), '2025-09-01', '2025-09-30', NOW()), -- 已使用
(3, 3, 2, NOW(), '2025-08-01', '2025-08-31', NULL),  -- 已過期
(4, 4, 0, NOW(), '2025-09-15', '2025-09-30', NULL),  -- 未使用
(5, 5, 1, NOW(), '2025-09-10', '2025-09-20', NOW()), -- 已使用
(6, 6, 0, NOW(), '2025-09-20', '2025-10-20', NULL),  -- 未使用
(7, 7, 0, NOW(), '2025-09-05', '2025-09-25', NULL),  -- 未使用
(8, 8, 1, NOW(), '2025-09-01', '2025-09-30', NOW()), -- 已使用
(9, 9, 2, NOW(), '2025-07-01', '2025-07-31', NULL),  -- 已過期
(10, 10, 0, NOW(), '2025-09-25', '2025-10-25', NULL); -- 未使用

DROP TABLE IF EXISTS favo_pro;
CREATE TABLE favo_pro(
MEM_ID INT, -- PK,FK
PRO_ID INT, -- PK,FK
PRIMARY KEY (MEM_ID, PRO_ID)
)ENGINE=InnoDB;

-- 收藏清單
INSERT INTO favo_pro (MEM_ID, PRO_ID) VALUES
(1, 1),   -- 會員1 收藏 商品1
(2, 3),   -- 會員2 收藏 商品3
(3, 5),   -- 會員3 收藏 商品5
(4, 7),   -- 會員4 收藏 商品7
(5, 9),   -- 會員5 收藏 商品9
(6, 2),   -- 會員6 收藏 商品2
(7, 4),   -- 會員7 收藏 商品4
(8, 6),   -- 會員8 收藏 商品6
(9, 8),   -- 會員9 收藏 商品8
(10, 10); -- 會員10 收藏 商品10

DROP TABLE IF EXISTS  act_cpn;
CREATE TABLE act_cpn(
ACT_CPN_ID INT NOT NULL AUTO_INCREMENT,
CPN_NAME VARCHAR(50) NOT NULL,
DISC_TYPE TINYINT NOT NULL COMMENT '0:滿額折抵,1: 百分比',
DISC_VALUE DECIMAL(10,2) NOT NULL,
MIN_SPEND INT,
START_DATE DATE,
VALID_DAYS INT,
CPN_DESC VARCHAR(200) COMMENT '折價卷規則描述',
IS_ACTIVE TINYINT NOT NULL COMMENT '0:未啟用,1:啟用',
CRT_AT  DATETIME  NOT NULL  DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
PRIMARY KEY (ACT_CPN_ID)
) ENGINE=InnoDB;

-- 活動折價券
INSERT INTO act_cpn
(CPN_NAME, DISC_TYPE, DISC_VALUE, MIN_SPEND, START_DATE, VALID_DAYS, CPN_DESC, IS_ACTIVE)
VALUES
-- 1
('活動滿500折50', 0, 50.00, 500, '2025-09-01', NULL, '活動消費滿500折50元', 1),
-- 2
('活動滿1000折200', 0, 200.00, 1000, '2025-09-05', NULL, '活動消費滿1000折200元', 1),
-- 3
('活動85折券', 1, 0.85, NULL, NULL, 30, '活動報名後30天有效85折', 1),
-- 4
('活動9折券', 1, 0.90, NULL, '2025-09-10', 15, '活動期間9折', 1),
-- 5
('早鳥專屬100元券', 0, 100.00, 400, '2025-08-20', NULL, '早鳥報名專屬優惠', 1),
-- 6
('團體報名8折', 1, 0.80, NULL, '2025-09-15', 10, '三人以上團報享8折', 1),
-- 7
('學生專屬50元券', 0, 50.00, 200, '2025-09-01', 20, '學生報名專屬，滿200折50', 1),
-- 8
('VIP專屬7折券', 1, 0.70, NULL, NULL, 7, 'VIP專屬7折，限7天使用', 1),
-- 9
('預備活動券（尚未啟用）', 0, 150.00, 600, '2025-10-01', NULL, '活動預備用券', 0),
-- 10
('滿1500折300', 0, 300.00, 1500, '2025-09-20', NULL, '活動消費滿1500折300元', 1);

DROP TABLE IF EXISTS  mem_act_cpn;
CREATE TABLE mem_act_cpn(
CPN_HOLDER_DETAIL_ID INT NOT NULL AUTO_INCREMENT,
ACT_CPN_ID INT NOT NULL, -- FK
MEM_ID INT NOT NULL, -- FK
CPN_USE_STATUS TINYINT  NOT NULL COMMENT '0:未使用,1:已使用,2:已過期',
CRT_AT DATETIME  NOT NULL  DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
RCV_AT DATETIME NOT NULL,
EFF_START DATE NOT NULL,
EFF_END DATE,
USED_AT DATETIME,
PRIMARY KEY (CPN_HOLDER_DETAIL_ID)
)ENGINE=InnoDB;
-- 活動折價券持有者明細
INSERT INTO mem_act_cpn
(ACT_CPN_ID, MEM_ID, CPN_USE_STATUS, RCV_AT, EFF_START, EFF_END, USED_AT)
VALUES
(1, 1, 0, NOW(), '2025-09-01', '2025-09-15', NULL),   -- 未使用
(2, 2, 1, NOW(), '2025-09-05', '2025-09-20', NOW()),  -- 已使用
(3, 3, 2, NOW(), '2025-08-01', '2025-08-31', NULL),   -- 已過期
(4, 4, 0, NOW(), '2025-09-10', '2025-09-25', NULL),   -- 未使用
(5, 5, 1, NOW(), '2025-08-20', '2025-09-10', NOW()),  -- 已使用
(6, 6, 0, NOW(), '2025-09-15', '2025-09-25', NULL),   -- 未使用
(7, 7, 0, NOW(), '2025-09-01', '2025-09-21', NULL),   -- 未使用
(8, 8, 1, NOW(), '2025-09-01', '2025-09-07', NOW()),  -- 已使用
(9, 9, 2, NOW(), '2025-07-01', '2025-07-31', NULL),   -- 已過期
(10, 10, 0, NOW(), '2025-09-20', '2025-10-05', NULL); -- 未使用


-- 建立 FK 
--  商品收藏清單 FK 一般會員編號、商品編號
ALTER TABLE favo_pro 
ADD CONSTRAINT FAV_PRO_MEM_FK FOREIGN KEY (MEM_ID) REFERENCES mem(MEM_ID) ON DELETE CASCADE,
ADD CONSTRAINT FAV_PRO_PRO_FK FOREIGN KEY (PRO_ID) REFERENCES product(PRO_ID) ON DELETE CASCADE;
-- 商品折價卷持有者明細 FK 商品折價卷編號、一般會員編號
ALTER TABLE mem_pro_cpn
ADD CONSTRAINT MEM_PRO_CPN_FK FOREIGN KEY (PRO_CPN_ID) REFERENCES pro_cpn(PRO_CPN_ID),
ADD CONSTRAINT MEM_PRO_CPN_MEM_FK FOREIGN KEY (MEM_ID) REFERENCES mem(MEM_ID) ;
-- 活動折價卷持有者明細 FK 活動折價卷編號、一般會員編號
ALTER TABLE mem_act_cpn
ADD CONSTRAINT MEM_ACT_CPN_FK FOREIGN KEY (ACT_CPN_ID) REFERENCES act_cpn(ACT_CPN_ID),
ADD CONSTRAINT MEM_ACT_CPN_MEM_FK FOREIGN KEY (MEM_ID) REFERENCES mem(MEM_ID) ;