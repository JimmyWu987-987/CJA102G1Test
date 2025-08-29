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
    mem_id INT NOT NULL AUTO_INCREMENT,
    mem_name VARCHAR(20) NOT NULL,
    CONSTRAINT mem_id_key PRIMARY KEY (mem_id)
) ENGINE=InnoDB;
-- 一般會員
INSERT INTO mem (mem_name) VALUES
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
	pro_id INT NOT NULL AUTO_INCREMENT,
    pro_cate_id INT NOT NULL, -- FK
    f_mem_id INT NOT NULL,    -- FK
    pro_name VARCHAR(100) NOT NULL,
    CONSTRAINT product_pro_id_key PRIMARY KEY (pro_id)
) ENGINE InnoDB;
-- 小農商品
INSERT INTO product (pro_cate_id, f_mem_id, pro_name) VALUES
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
    f_mem_id INT NOT NULL AUTO_INCREMENT,
    f_mem_name VARCHAR(20) NOT NULL,
    sty_no TINYINT DEFAULT NULL, -- FK
    CONSTRAINT f_mem_id_key PRIMARY KEY (f_mem_id)
) ENGINE=InnoDB;
-- 小農會員
INSERT INTO f_mem (f_mem_name) VALUES
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
    pro_cpn_id INT NOT NULL AUTO_INCREMENT,
    cpn_name VARCHAR(50) NOT NULL,
    disc_type TINYINT NOT NULL COMMENT '0:滿額折抵,1: 百分比',
    disc_value DECIMAL(10,2) NOT NULL,
    min_spend INT,
    start_date DATE,
    valid_days INT,
    cpn_desc VARCHAR(200) COMMENT '折價券規則描述',
    is_active TINYINT NOT NULL COMMENT '0:未啟用,1:啟用',
    crt_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
    appl_scope TINYINT NOT NULL DEFAULT 0 COMMENT '0: 全館, 1: 指定小農, 2: 指定商品',
   CONSTRAINT  pro_cpn_id_pk PRIMARY KEY (pro_cpn_id)
) ENGINE=InnoDB;

-- 商店折價券
INSERT INTO pro_cpn  
(cpn_name, disc_type, disc_value, min_spend, start_date, valid_days, cpn_desc, is_active, appl_scope) 
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

CREATE TABLE mem_pro_cpn (
    cpn_holder_detail_id INT NOT NULL AUTO_INCREMENT,
    pro_cpn_id INT NOT NULL, -- FK
    mem_id INT NOT NULL,     -- FK
    cpn_use_status TINYINT NOT NULL COMMENT '0:未使用,1:已使用,2:已過期',
    crt_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
    rcv_at DATETIME NOT NULL,
    eff_start DATE NOT NULL,
    eff_end DATE,
    used_at DATETIME,
    CONSTRAINT cpn_holder_detail_id_pk PRIMARY KEY (cpn_holder_detail_id)
) ENGINE=InnoDB;

-- 商品折價券持有者明細
INSERT INTO mem_pro_cpn
(pro_cpn_id, mem_id, cpn_use_status, rcv_at, eff_start, eff_end, used_at)
VALUES
-- 未使用（還在有效期內）
(1, 1, 0, DATE_SUB(NOW(), INTERVAL 10 DAY), '2025-08-25', '2025-09-25', NULL),
(2, 2, 0, DATE_SUB(NOW(), INTERVAL 7 DAY), '2025-09-01', '2025-09-30', NULL),

-- 已使用（在有效期內使用過）
(3, 3, 1, DATE_SUB(NOW(), INTERVAL 15 DAY), '2025-08-20', '2025-09-20', DATE_SUB(NOW(), INTERVAL 3 DAY)),
(4, 4, 1, DATE_SUB(NOW(), INTERVAL 12 DAY), '2025-08-28', '2025-09-28', DATE_SUB(NOW(), INTERVAL 2 DAY)),

-- 已過期（沒用到）
(5, 5, 2, DATE_SUB(NOW(), INTERVAL 25 DAY), '2025-07-20', '2025-08-20', NULL),
(6, 6, 2, DATE_SUB(NOW(), INTERVAL 30 DAY), '2025-07-25', '2025-08-25', NULL),

-- 未使用（剛領，還有效）
(7, 7, 0, DATE_SUB(NOW(), INTERVAL 3 DAY), '2025-09-05', '2025-09-30', NULL),

-- 已使用（昨天用掉）
(8, 8, 1, DATE_SUB(NOW(), INTERVAL 5 DAY), '2025-09-01', '2025-09-25', DATE_SUB(NOW(), INTERVAL 1 DAY)),

-- 已過期（有效期已結束，沒使用）
(9, 9, 2, DATE_SUB(NOW(), INTERVAL 40 DAY), '2025-07-01', '2025-07-31', NULL),

-- 未使用（快到期）
(10, 10, 0, DATE_SUB(NOW(), INTERVAL 2 DAY), '2025-09-01', '2025-09-10', NULL);
DROP TABLE IF EXISTS favo_pro;
CREATE TABLE favo_pro (
    mem_id INT,  -- PK,FK
    pro_id INT,  -- PK,FK
    CONSTRAINT favo_pro_pk PRIMARY KEY (mem_id, pro_id)
) ENGINE=InnoDB;

-- 收藏清單
INSERT INTO favo_pro (mem_id, pro_id) VALUES
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

DROP TABLE IF EXISTS act_cpn;
CREATE TABLE act_cpn (
    act_cpn_id INT NOT NULL AUTO_INCREMENT,
    cpn_name VARCHAR(50) NOT NULL,
    disc_type TINYINT NOT NULL COMMENT '0:滿額折抵,1: 百分比',
    disc_value DECIMAL(10,2) NOT NULL,
    min_spend INT,
    start_date DATE,
    valid_days INT,
    cpn_desc VARCHAR(200) COMMENT '折價券規則描述',
    is_active TINYINT NOT NULL COMMENT '0:未啟用,1:啟用',
    crt_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
 CONSTRAINT act_cpn_id_pk PRIMARY KEY (act_cpn_id)
) ENGINE=InnoDB;

-- 活動折價券
INSERT INTO act_cpn
(cpn_name, disc_type, disc_value, min_spend, start_date, valid_days, cpn_desc, is_active)
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

DROP TABLE IF EXISTS mem_act_cpn;
CREATE TABLE mem_act_cpn (
    cpn_holder_detail_id INT NOT NULL AUTO_INCREMENT,
    act_cpn_id INT NOT NULL, -- FK
    mem_id INT NOT NULL,     -- FK
    cpn_use_status TINYINT NOT NULL COMMENT '0:未使用,1:已使用,2:已過期',
    crt_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
    rcv_at DATETIME NOT NULL,-- 領券時間
    eff_start DATE NOT NULL, -- 實際生效起
    eff_end DATE,-- 實際失效止
    used_at DATETIME,
    CONSTRAINT cpn_holder_detail_id_pk PRIMARY KEY (cpn_holder_detail_id)
) ENGINE=InnoDB;

-- 活動折價券持有者明細
INSERT INTO mem_act_cpn
(act_cpn_id, mem_id, cpn_use_status, rcv_at, eff_start, eff_end, used_at)
VALUES
-- 未使用（有效中）
(1, 1, 0, DATE_SUB(NOW(), INTERVAL 10 DAY), '2025-08-20', '2025-09-20', NULL),
(2, 2, 0, DATE_SUB(NOW(), INTERVAL 5 DAY), '2025-08-25', '2025-09-25', NULL),

-- 已使用
(3, 3, 1, DATE_SUB(NOW(), INTERVAL 15 DAY), '2025-08-10', '2025-09-10', DATE_SUB(NOW(), INTERVAL 2 DAY)),
(4, 4, 1, DATE_SUB(NOW(), INTERVAL 20 DAY), '2025-08-05', '2025-09-05', DATE_SUB(NOW(), INTERVAL 1 DAY)),

-- 已過期（沒使用過）
(5, 5, 2, DATE_SUB(NOW(), INTERVAL 30 DAY), '2025-07-20', '2025-08-20', NULL),
(6, 6, 2, DATE_SUB(NOW(), INTERVAL 25 DAY), '2025-07-25', '2025-08-25', NULL),

-- 未使用（剛領，還在有效期）
(7, 7, 0, DATE_SUB(NOW(), INTERVAL 1 DAY), '2025-09-01', '2025-09-30', NULL),

-- 已使用（當日使用）
(8, 8, 1, DATE_SUB(NOW(), INTERVAL 2 DAY), '2025-08-28', '2025-09-28', NOW()),

-- 已過期（有效期已經過去）
(9, 9, 2, DATE_SUB(NOW(), INTERVAL 40 DAY), '2025-07-01', '2025-07-31', NULL),

-- 未使用（即將到期）
(10, 10, 0, DATE_SUB(NOW(), INTERVAL 3 DAY), '2025-08-29', '2025-09-10', NULL);

-- 建立 FK 
-- 商品收藏清單 FK 一般會員編號、商品編號
ALTER TABLE favo_pro 
ADD CONSTRAINT favo_pro_mem_fk FOREIGN KEY (mem_id) REFERENCES mem(mem_id) ON DELETE CASCADE,
ADD CONSTRAINT favo_pro_pro_fk FOREIGN KEY (pro_id) REFERENCES product(pro_id) ON DELETE CASCADE;

-- 商品折價券持有者明細 FK 商品折價券編號、一般會員編號
ALTER TABLE mem_pro_cpn
ADD CONSTRAINT mem_pro_cpn_fk FOREIGN KEY (pro_cpn_id) REFERENCES pro_cpn(pro_cpn_id),
ADD CONSTRAINT mem_pro_cpn_mem_fk FOREIGN KEY (mem_id) REFERENCES mem(mem_id);

-- 活動折價券持有者明細 FK 活動折價券編號、一般會員編號
ALTER TABLE mem_act_cpn
ADD CONSTRAINT mem_act_cpn_fk FOREIGN KEY (act_cpn_id) REFERENCES act_cpn(act_cpn_id),
ADD CONSTRAINT mem_act_cpn_mem_fk FOREIGN KEY (mem_id) REFERENCES mem(mem_id);