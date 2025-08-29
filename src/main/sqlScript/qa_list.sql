-- 治宣負責部分
create database if not exists test_fake;
USE test_fake;
DROP TABLE IF EXISTS qa_list;
CREATE TABLE qa_list (
qa_id INT NOT NULL AUTO_INCREMENT, 		-- QA編號
qa_title VARCHAR(50),					-- QA標題
qa_cont VARCHAR(500),					-- QA內容
PRIMARY KEY (qa_id)
);
INSERT INTO qa_list (qa_title, qa_cont) 
VALUES
('此平台可以色色嗎?','不可以色色'),
('此平台可以做得更好嗎?','不爽你來做阿');