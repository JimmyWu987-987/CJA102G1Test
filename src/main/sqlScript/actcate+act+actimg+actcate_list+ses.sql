create database if not exists xxxx; /*schemas名稱*/
use xxxx; /*schemas名稱*/

drop table if exists actcate;
drop table if exists act;
drop table if exists actimg;
drop table if exists actcate_list;
drop table if exists ses;


create table actcate (
 actcate_id			int not null auto_increment,
 actcate_name		varchar(10),
 constraint actcate_actcate_id_pk primary key (actcate_id));

insert into actcate values (1,'農事體驗'), (2,'食農教育'), (3,'親子同樂'), (4,'動物互動'), (5, '手作工藝'),
						   (6,'戶外體驗'), (7,'導覽活動'), (8,'季節限定'), (9,'其它');


create table act (
 act_id				int not null auto_increment,
 act_name			varchar(30) not null,
 act_start			date,
 act_end			date,
 act_des			varchar(1000),
 act_fee			int not null,
 act_revstat		tinyint default 0,
 act_revupd			datetime not null,
 act_revremark		varchar(1000),
 act_launstat		tinyint,
 act_launupd		datetime,
 f_mem_id			int not null,
 act_score			int,
 act_cnt			int,
 constraint act_f_mem_id_fk foreign key (f_mem_id) references f_mem (f_mem_id),
 constraint act_act_id_pk primary key (act_id));

insert into act values
  /*到目前都正常上架&有人評價過*/
 (null, '下田去！一日小農體驗', '2025-07-01','2025-12-30',
 '捲起袖子、赤腳踩在田裡，親手插秧、採收蔬果，感受最真實的農村日常。',
 200, 2, '2025-05-10 10:20:30', null, 1, '2025-05-15 09:20:30', 1, 101, 23),
 
 /*審核未過*/
 (null, '從產地到餐桌的秘密', '2025-10-25','2026-03-31',
 '透過遊戲與教學，讓大小朋友了解食材來源，培養珍惜食物的心。',
 10000, 3, '2025-08-26 08:20:00', '報名費用有疑慮，請再次確認。', null, null, 3, null, null),
 
 /*到目前都正常上架&有人評價過*/
 (null, '小小牧場', '2025-03-15','2025-10-31',
 '餵小羊、抱兔子，近距離接觸可愛動物，體驗牧場生活樂趣。',
 399, 2, '2025-01-10 14:10:30', null, 1, '2025-01-15 16:00:30', 2, 168, 38),
 
 /*有人評價過此活動, 此活動已結束並下架*/
 (null, '藍染工藝體驗課程', '2024-12-01','2025-06-10',
 '親手體驗藍染工藝，學習天然染色技巧，創作獨一無二的布藝作品。',
 700, 2, '2024-10-27 19:10:30', '已修正金額，審核通過', 0, '2025-06-11 00:00:00', 2, 666, 150),
 
 /*審核已通過但還沒上架*/
 (null, '小村莊的故事之旅', '2025-10-01','2026-02-28',
 '在導覽老師帶領下，認識農村的歷史、風俗與文化典故。',
 299, 2, '2025-08-28 10:20:30', null, 0, null, 1, null, null);


create table actimg (
 actimg_id			int not null auto_increment,
 act_img			longblob,
 act_id				int not null,
 constraint actimg_act_id_fk foreign key (act_id) references act (act_id),
 constraint actimg_actimg_id_pk primary key (actimg_id));

insert into actimg values (null, null, 1), (null, null, 1), (null, null, 1),
						  (null, null, 3), (null, null, 3);


create table actcate_list (
 act_id				int	not null,
 actcate_id			int not null,
 constraint actcate_list_act_id_fk foreign key (act_id) references act (act_id),
 constraint actcate_list_actcate_id_fk foreign key (actcate_id) references actcate (actcate_id),
 constraint actcate_list_act_id_actcate_id_pk primary key (act_id, actcate_i));
 
 insert into actcate_list values (1, 1), (1, 3), (1, 6),
								 (2, 2), (2, 3),
                                 (3, 3), (3, 4), (3, 6), (3, 7),
                                 (4, 3), (4, 5),
                                 (5, 3), (5, 6), (5, 7);


create table ses (
 ses_id				int not null auto_increment,
 ses_date			date not null,
 ses_start			time not null,
 ses_end			time not null,
 reg_start			date not null,
 reg_end			date not null,
 minppl				int not null default 1,
 maxppl				int not null,
 ses_fee			int not null,
 notice				int not null default 1,
 ses_launstat		tinyint not null default 0,
 ses_launupd		datetime,
 reg_stat			tinyint not null default 0,
 headcount			int default 0,
 act_id				int not null,
 constraint ses_act_id_fk foreign key (act_id) references act (act_id),
 constraint ses_ses_id_pk primary key (ses_id));																									/* 0現正報名中 1成團 2不成團.取消*/
																																/* 0下 1上*/	    /* 3場次異動.需再確認是否成團 4取消場次 5場次已圓滿結束 6結案 */		
                    /* (場次id, 場次date, 開始時間, 結束時間, 開始報名date, 報名截止(確認是否成團)date, 人數下限, 人數上限, 報名費, 行前通知, 場次狀態, 場次狀態更新時間, 報名狀態, 報名人數, 活動id)*/
						/*目前是1.3.4有上架過可以寫場次, 4只能寫已結束的*/
 
 					   /*圓滿結束*/
insert into ses values (null, '2025-08-08', '15:00', '17:30', '2025-07-01', '2025-08-01',  5, 20, 230, 3, 0, '2025-08-08 17:30:00', 5, 18, 1),
					   /*還在報名中...這邊我有修改上架狀態更新時間&修正場次狀態*/
					   (null, '2025-10-10', '14:00', '16:30', '2025-08-25', '2025-10-01',  5, 20, 200, 3, 1, '2025-08-11 14:10:09', 0, 10, 1),
                       /*不成團, 取消...這邊我有修改上架狀態跟人數 (確定取消的話人數應要歸0? 這樣後台才不會用金額成以人數結果撥款過來? 是不是應該要以場次算啊) */
                       (null, '2025-03-20', '10:30', '11:30', '2025-01-20', '2025-03-10',  5, 15, 399, 2, 0, '2025-03-10 00:00:00', 2, 4, 3),
					   /* 場次有異動, 還未確認是否成團*/                       
                       (null, '2025-10-05', '15:00', '16:00', '2025-08-10', '2025-09-20',  5, 15, 449, 2, 1, '2025-08-05 00:00:00', 3, 4, 3),
                       /* 場次取消 (10/7有地震導致部分設施要維修、直接取消) */
                       (null, '2025-10-10', '16:30', '17:30', '2025-08-25', '2025-10-01', 10, 20, 499, 3, 0, '2025-10-07 00:00:00', 4, 13, 3),
                       /* 結案 */
                       (null, '2025-06-05', '14:00', '16:30', '2025-04-25', '2025-05-25', 15, 30, 700, 3, 1, '2025-06-30 00:00:00', 6, 25, 4),
                       /* 成團, 活動尚未進行 */
                       (null, '2025-09-10', '14:00', '16:30', '2025-07-20', '2025-09-01',  5, 15, 200, 3, 1, '2025-09-01 00:00:00', 1, 11, 1);

commit;