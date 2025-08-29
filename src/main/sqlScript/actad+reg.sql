-- 治宣負責部分
-- 建立順序：
-- 小農會員 -> 活動 -> 場次 -> *活動廣告*-> 一般會員 -> 活動折價卷持有者明細 -> *活動訂單*
-- 活動分類明細、活動分類、活動折價卷，我這邊跳過
-- 活動、場次要接潔閔，小農、一般會員接東東，活動折價卷持有者明細接冠彥。

create database if not exists test_fake;
USE test_fake;

-- 關閉外鍵檢查
SET FOREIGN_KEY_CHECKS = 0;

-- 1. 小農會員
DROP TABLE IF EXISTS f_mem;
CREATE TABLE f_mem (
    f_mem_id INT NOT NULL AUTO_INCREMENT,
    f_mem_name VARCHAR(20) NOT NULL,
    store_name VARCHAR(50),
    store_intro VARCHAR(500),
    PRIMARY KEY (f_mem_id)
);
INSERT INTO f_mem (f_mem_name, store_name, store_intro) VALUES
('吳冠宏', '芋園樂活農場', '主打有機蔬菜，無農藥栽種。'),
('吳永志', '青禾柚園', '提供各式各樣新鮮水果。'),
('郭惠民', '薑薑藍染鋪', '稻米直銷，產地直送。'),
('黃語昕', '黃家蜂園', '天然蜂蜜與蜂產品專賣。'),
('孫叔均', '小孫花田', '休閒農場，提供花卉觀賞。');

-- 2. 活動
DROP TABLE IF EXISTS act;
CREATE TABLE act (
    act_id INT NOT NULL AUTO_INCREMENT,
    act_name VARCHAR(100) NOT NULL,
    act_start DATE,
    act_end DATE,
    act_des VARCHAR(500),
    f_mem_id INT NOT NULL,
    PRIMARY KEY (act_id)
);
INSERT INTO act (act_name, act_start, act_end, act_des, f_mem_id) VALUES
('芋頭採收節', '2025-10-01', '2025-10-31', '體驗芋農採收芋頭。',1),
('芋頭雕刻比賽', '2025-10-15', '2025-11-25', '芋頭雕刻比賽。',1),
('柚子採收活動', '2025-09-01', '2025-09-15', '現場採摘新鮮柚子，現剖現吃。',2),
('藍染體驗活動', '2025-09-15', '2025-09-20', '薑黃農場參觀及藍染活動。',3),
('蜂蜜採收體驗', '2025-09-25', '2025-09-26', '現場體驗蜂蜜採收過程。',4),
('花田攝影比賽', '2025-10-01', '2025-10-02', '賞花拍照比賽，贏取獎品。',5);

-- 3. 場次
DROP TABLE IF EXISTS ses;
CREATE TABLE ses (
    ses_id INT NOT NULL AUTO_INCREMENT,
    ses_date DATE NOT NULL,
    act_id INT NOT NULL,
    PRIMARY KEY (ses_id)
);
INSERT INTO ses (ses_date, act_id) VALUES
('2025-10-05', 1),('2025-10-20', 1),('2025-10-18', 2),('2025-10-20', 2),
('2025-09-05', 3),('2025-09-12', 3),('2025-09-16', 4),('2025-09-19', 4),
('2025-09-25', 5),('2025-09-26', 5),('2025-10-01', 6),('2025-10-02', 6);

-- 4. 活動廣告 (治宣負責)
DROP TABLE IF EXISTS actad;
CREATE TABLE actad (                			-- 活動廣告表格
    actad_id INT NOT NULL AUTO_INCREMENT,       -- 活動廣告編號 (PK)
    actad_img LONGBLOB,                         -- 廣告圖片 (一個廣告僅一張圖)(先不設定NOT NULL)
    -- ---------------------------------審核-----------------------------------------------------
    actad_revstat TINYINT NOT NULL DEFAULT 0,   -- 審核狀態: 0=編輯中, 1=待審核, 2=通過, 3=未過 4=待繳費 5=已繳費
    actad_revupd DATETIME NOT NULL,             -- 審核狀態更新時間
    actad_revremark VARCHAR(100),               -- 審核備註 (未通過原因)
   -- -------------------------------廣告輪播啟動-----------------------------------------------------
    actad_launstat TINYINT,                     -- 上下架狀態: 0=下架, 1=上架 (審核通過前為NULL)
    actad_launupd DATETIME,                     -- 上下架更新時間
    actad_start DATE,                           -- 廣告開始日期
    actad_end DATE,                             -- 廣告結束日期
    actad_fee INT,								-- 活動廣告費用
    actad_fee_end DATE,							-- 活動廣告繳費截止日
-- ------------------------------------fk-----------------------------------------------------------------
    f_mem_id INT NOT NULL,                      -- 小農會員ID (FK)
    act_id INT NOT NULL,                        -- 活動ID (FK)

    PRIMARY KEY (actad_id)                      -- 設置PK
);
INSERT INTO actad (actad_img, actad_revstat, actad_revupd, actad_revremark, actad_launstat, actad_launupd, actad_start, actad_end, actad_fee, actad_fee_end, f_mem_id, act_id) VALUES
(NULL,5,'2025-08-20 10:00:00','審核通過，已繳費（已上架）',1,'2025-08-21 09:00:00','2025-09-01','2025-09-30',2000,'2025-08-25',1,1),
(NULL,5,'2025-08-21 11:00:00','審核通過，已繳費（已上架）',1,'2025-08-22 14:00:00','2025-09-01','2025-09-30',2200,'2025-08-26',2,2),
(NULL,4,'2025-08-25 10:00:00','審核通過，待繳費',0,NULL,'2025-10-01','2025-10-31',2100,'2025-09-01',3,3),
(NULL,3,'2025-08-26 11:00:00','圖片太過色情，審核未通過',0,NULL,'2025-10-10','2025-11-20',2300,'2025-09-02',1,2),
(NULL,1,'2025-08-30 10:00:00','待審核',0,NULL,'2025-11-01','2025-12-31',3300,NULL,5,5),
(NULL,1,'2025-08-30 10:00:00','待審核',0,NULL,'2025-11-01','2025-12-31',3300,NULL,2,3);

-- 5. 一般會員
DROP TABLE IF EXISTS mem;
CREATE TABLE mem (
    mem_id INT NOT NULL AUTO_INCREMENT,
    mem_name VARCHAR(20),
    PRIMARY KEY (mem_id)
);
INSERT INTO mem (mem_name) VALUES ('冠和'),('潔閔'),('東東');

-- 6. 活動折價卷持有者明細
DROP TABLE IF EXISTS mem_act_cpn;
CREATE TABLE mem_act_cpn (
    cpn_holder_detail_id INT NOT NULL AUTO_INCREMENT,
    mem_id INT NOT NULL,
    PRIMARY KEY (cpn_holder_detail_id)
);
INSERT INTO mem_act_cpn (mem_id) VALUES (1),(2),(3),(4),(5);

-- 7. 訂單 (治宣負責)
DROP TABLE IF EXISTS reg;
CREATE TABLE `reg` (
  `reg_id` INT NOT NULL AUTO_INCREMENT,       		-- 活動報名訂單編號 PK
  `reg_at` DATETIME NOT NULL,                    	-- 活動報名訂單下單時間
  `reg_stat` TINYINT NOT NULL Default 0,       		-- 訂單狀態(0=報名成立, 1=取消報名, 2=待付款, 3=活動已完成, 4=已結案)
  `reg_name`  VARCHAR(30) NOT NULL,                 -- 聯絡人姓名
  `reg_mob` VARCHAR(20) NOT NULL,   				-- 聯絡人手機
  `reg_mail` VARCHAR(100) NOT NULL,   				-- 聯絡人email
  `reg_count` INT NOT NULL Default 1,   			-- 報名人數
  -- ------------------------------評論------------------------------------------
  `act_rate` TINYINT,   							-- 活動評分
  `act_comm` VARCHAR(500),   						-- 活動評論
  `act_commat` DATETIME,   							-- 活動評論時間
  `act_commreply` VARCHAR(500),   					-- 活動評論回覆
  -- -------------------------------fk------------------------------------------
  `ses_id` INT NOT NULL ,   						-- 場次編號(FK)
  `mem_id` INT NOT NULL ,   						-- 一般會員編號(FK)
  `cpn_holder_detail_id` INT,   					-- 活動折價卷持有者明細(FK) (非NOT NULL)
  -- -----------------------------金額計算-----------------------------------------
  `reg_total` INT NOT NULL,   						-- 報名訂單總金額
  `reg_pointdisc` INT NOT NULL Default 0,   		-- 活動訂單折抵會員點數 
  `reg_pointget` INT NOT NULL Default 0,   			-- 活動訂單回饋會員點數
  `reg_cpndisc` INT NOT NULL Default 0,   			-- 活動折價券折抵金額 
  `reg_grand_total` INT NOT NULL,   				-- 報名訂單實付金額
  
  PRIMARY KEY (`reg_id`)     						-- 設置PK
);
INSERT INTO reg (reg_at, reg_stat, reg_name, reg_mob, reg_mail, reg_count, act_rate, act_comm, act_commat, act_commreply, ses_id, mem_id, reg_total, reg_pointdisc, reg_pointget, cpn_holder_detail_id, reg_cpndisc, reg_grand_total) VALUES
('2025-08-15 09:30:00',0,'冠和','0912345678','linxm@example.com',2,5,'活動很棒，收穫滿滿！','2025-10-06 12:00:00','感謝您的參與！',1,1,2000,0,20,NULL,0,2000),
('2025-08-16 14:20:00',0,'潔閔','0922333444','chenxh@example.com',1,4,'導覽詳細，體驗愉快。','2025-10-21 15:00:00',NULL,2,2,1000,0,10,NULL,0,1000),
('2025-08-21 11:15:00',0,'冠和','0944555666','lim@example.com',3,5,'雕刻比賽很有趣！','2025-11-11 16:00:00','恭喜你！',4,4,3600,0,36,NULL,0,3600),
('2025-08-22 09:00:00',0,'東東','0955666777','zhangzq@example.com',2,4,'柚子新鮮，體驗很棒。','2025-09-06 10:00:00','謝謝支持！',5,1,1800,0,18,NULL,0,1800),
('2025-08-23 13:30:00',1,'奕婷','0966777888','zhouxa@example.com',1,NULL,NULL,NULL,NULL,6,2,900,0,9,NULL,0,900),
('2025-08-24 15:00:00',0,'潔閔','0977888999','huangxl@example.com',2,5,'藍染體驗超棒，老師很親切。','2025-09-17 11:00:00','感謝您的評價！',7,3,2200,0,22,NULL,0,2200);

-- 建立 FK
-- 活動
ALTER TABLE act ADD CONSTRAINT act_fmem_fk FOREIGN KEY (f_mem_id) REFERENCES f_mem(f_mem_id);
-- 場次
ALTER TABLE ses ADD CONSTRAINT ses_act_fk FOREIGN KEY (act_id) REFERENCES act(act_id);
-- 活動廣告
ALTER TABLE actad ADD CONSTRAINT actad_fmem_fk FOREIGN KEY (f_mem_id) REFERENCES f_mem(f_mem_id);
ALTER TABLE actad ADD CONSTRAINT actad_act_fk FOREIGN KEY (act_id) REFERENCES act(act_id);
-- 活動折價卷持有者明細
ALTER TABLE mem_act_cpn ADD CONSTRAINT mem_act_cpn_mem_fk FOREIGN KEY (mem_id) REFERENCES mem(mem_id);
-- 活動訂單
ALTER TABLE reg ADD CONSTRAINT reg_ses_fk FOREIGN KEY (ses_id) REFERENCES ses(ses_id);
ALTER TABLE reg ADD CONSTRAINT reg_mem_fk FOREIGN KEY (mem_id) REFERENCES mem(mem_id);
ALTER TABLE reg ADD CONSTRAINT reg_cpn_fk FOREIGN KEY (cpn_holder_detail_id) REFERENCES mem_act_cpn(cpn_holder_detail_id);

-- 開啟外鍵檢查
SET FOREIGN_KEY_CHECKS = 1;
