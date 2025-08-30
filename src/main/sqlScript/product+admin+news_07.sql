-- 最新消息 --

CREATE TABLE news (
	news_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	news_title VARCHAR(50) NOT NULL,
	news_cont VARCHAR(1000) NOT NULL,
	news_at DATETIME NOT NULL
);

INSERT INTO news (news_title, news_cont, news_at) VALUES
('網站更新', '我們的網站已經更新至最新版本，提供更好的使用者體驗。', '2024-05-20 10:30:00'),
('夏季特賣會', '所有商品8折優惠，只到月底！', '2024-06-01 15:00:00');

-- 小農商品--

CREATE TABLE product (
	pro_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	pro_name VARCHAR(100) NOT NULL,
	pro_stock INT NOT NULL,
	pro_price INT NOT NULL,
	pro_status INT NOT NULL DEFAULT 0,
	pro_score INT,
	pro_cnt INT,
	pro_form VARCHAR(10),
	f_mem_id INT,   -- FK測試用先放 --
	pro_cate_id INT  -- FK測試用先放 --
);

INSERT INTO product (pro_name, pro_stock, f_mem_id, pro_price, pro_status, pro_cate_id, pro_score, pro_cnt) VALUES
('有機小白菜', 50, 1, 80, 1, 1, 4, 10),
('放山雞', 20, 2, 250, 1, 2, 5, 15),
('新鮮雞蛋', 100, 1, 120, 0, 1, 4, 5);

-- 管理員職稱表 --

CREATE TABLE admin_type (
	admin_type_id INT NOT NULL PRIMARY KEY,
	admin_type_name VARCHAR(20) NOT NULL
);

INSERT INTO admin_type (admin_type_id, admin_type_name) VALUES
(1, '超級管理員'),
(2, '中級管理員'),
(3, '低級人員');

-- 管理員--

CREATE TABLE administrator (
	admin_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	admin_acc VARCHAR(20) NOT NULL,
	admin_pwd VARCHAR(20) NOT NULL,
	admin_status TINYINT NOT NULL DEFAULT 0,
	admin_name VARCHAR(20) NOT NULL,
	admin_email VARCHAR(40) NOT NULL,
	admin_mobile VARCHAR(11) NOT NULL,
	admin_pic LONGBLOB
	admin_type_id INT NOT NULL,  -- FK測試用先放 --
);
	
INSERT INTO administrator (admin_type_id, admin_acc, admin_pwd, admin_status, admin_name, admin_email, admin_mobile) VALUES
(1, 'admin1', 'pwd123', 1, '張三', 'admin1@email.com', '0912345678'),
(2, 'admin2', 'pwd456', 1, '李四', 'admin2@email.com', '0912345679'),
(3, 'admin3', 'pwd789', 0, '王五', 'admin3@email.com', '0912345680');

-- 功能權限表--

CREATE TABLE admin_function (
	admin_func_id INT NOT NULL PRIMARY KEY,
	admin_func_name VARCHAR(20) NOT NULL,
	admin_func_des VARCHAR(100) NOT NULL
);
	
INSERT INTO admin_function (admin_func_id, admin_func_name, admin_func_des) VALUES
(1, '網站總管理', '商品活動廣告上架、下架、編輯，管理員管理'),
(2, '商城管理', '查看、處理商城商品'),
(3, '活動管理', '查看、管理活動資料');

-- 角色權限表--

CREATE TABLE admin_type_func_list (
	admin_type_id INT NOT NULL,  -- FK測試用先放 --
	admin_func_id INT NOT NULL,  -- FK測試用先放 --
	PRIMARY KEY (admin_type_id, admin_func_id)
);

INSERT INTO admin_type_func_list (admin_type_id, admin_func_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(3, 2);
    
    
-- FK --   
    
ALTER TABLE product
ADD CONSTRAINT pro_f_mem_id_fk
FOREIGN KEY (f_mem_id) REFERENCES f_mem(f_mem_id);

ALTER TABLE product
ADD CONSTRAINT pro_pro_cate_id_fk
FOREIGN KEY (pro_cate_id) REFERENCES product_category(pro_cate_id);
    
ALTER TABLE administrator
ADD CONSTRAINT admin_type_id_fk
FOREIGN KEY (admin_type_id) REFERENCES admin_type(admin_type_id);

ALTER TABLE admin_type_func_list
ADD CONSTRAINT atfl_admin_type_id_fk
FOREIGN KEY (admin_type_id) REFERENCES admin_type(admin_type_id);

ALTER TABLE admin_type_func_list
ADD CONSTRAINT atfl_admin_func_id_fk
FOREIGN KEY (admin_func_id) REFERENCES admin_function(admin_func_id);
