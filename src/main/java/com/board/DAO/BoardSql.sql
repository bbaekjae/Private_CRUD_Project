create table board_user(
	user_num int not null auto_increment primary key,
	user_id varchar(30) not null,
	user_pw varchar(32) not null,
	user_nick varchar(20) not null,
	user_date datetime default now() not null,
	user_author varchar(2) default 'N' not null,
	user_update datetime default now() not null
)

create table board_post(
	post_num int not null auto_increment primary key,
	post_title varchar(100) not null,
	post_content varchar(10000) not null,
	post_like int default 0 not null,
	post_writer int not null,
	post_date datetime default now() not null,
	post_update datetime default now() not null,
	post_view int default 0 not null,
	constraint fk001 foreign key(post_writer) references board_user(user_num)
)

create table board_comment(
	comment_num int not null auto_increment primary key,
	comment_content varchar(400) not null,
	comment_writer int not null,
	comment_like int not null,
	comment_date datetime default now() not null,
	comment_update datetime default now() not null,
	comment_location int default 0 not null,
	constraint fk002 foreign key(comment_writer) references board_user(user_num),
	constraint fk003 foreign key(comment_location) references board_post(post_num)
)

create table board_report(
	report_num int not null auto_increment primary key,
	report_title varchar(100) not null,
	report_content varchar(4000) not null,
	report_post int not null,
	report_date datetime default now() not null,
	report_user int,
	report_comment int,
	constraint fk004 foreign key(report_post) references board_post(post_num),
	constraint fk005 foreign key(report_user) references board_user(user_num),
	constraint fk006 foreign key(report_comment) references board_comment(comment_num)
)


drop table board_user







desc crud_board

insert into crud_board 
values (null,'admin','1q2w3e4r!','관리자',default,'A',default)

alter table crud_board modify user_update datetime default now() not null

select * from crud_board