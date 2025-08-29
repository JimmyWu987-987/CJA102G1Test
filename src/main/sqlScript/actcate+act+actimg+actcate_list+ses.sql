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

insert into actcate values (1,'動物互動'), (2,'手做點心'), (3,'親子同樂');



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

insert into act values (1, '採茶體驗', '2025-08-30','2025-12-30',
'走進茶園，親身感受大自然的氣息！在專業茶農的帶領下，您將學習分辨茶葉的嫩芽與成熟葉，體驗手工採茶的樂趣。除了親手採摘新鮮茶菁，還能參與製茶的簡單步驟，從揉捻到聞香，了解一杯好茶背後的用心。活動中更提供品茗時光，讓您即刻品嚐自己親手採製的清香茶湯。這不僅是一場體驗，更是一次與土地、文化連結的旅程。',
 500, 2, '2025-08-20 10:20:30', null, 1, '2025-08-21 09:20:30', 1, 1, 9, 2);


create table actimg (
 actimg_id			int not null auto_increment,
 act_img			longblob,
 act_id				int not null,
 constraint actimg_act_id_fk foreign key (act_id) references act (act_id),
 constraint actimg_actimg_id_pk primary key (actimg_id));

insert into actimg (act_id) values (null, null, 1);


create table actcate_list (
 actcate_list_id	int not null auto_increment,
 act_id				int	not null,
 actcate_id			int not null,
 constraint actcate_list_act_id_fk foreign key (act_id) references act (act_id),
 constraint actcate_list_actcate_id_fk foreign key (actcate_id) references actcate (actcate_id),
 constraint actcate_list_actcate_list_id_pk primary key (actcate_list_id));
 
 insert into actcate_list values (1, 1, 1);


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
 reg_stat			tinyint not null default 0,
 ses_launupd		datetime,
 headcount			int default 0,
 act_id				int not null,
 constraint ses_act_id_fk foreign key (act_id) references act (act_id),
 constraint ses_ses_id_pk primary key (ses_id));

insert into ses values (1, '2025-10-10', '14:00', '15:30', '2025-09-05', '2025-10-05', 5, 20, 500, 3, 1, 0, '2025-09-15 14:10:09', 10, 1);

commit;