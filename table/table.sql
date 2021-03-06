
-- 카테고리 테이블
create table category (
	idx varchar(20) not null,		-- 전문가 번호
	name varchar(20) not null,		-- 카테고리 이름
	primary key(idx)
);

-- 사용자 테이블
create table users (
	idx int auto_increment,			-- user번호
	name varchar(10) not null,		-- 이름
	id varchar(20) not null unique,	-- 아이디
	pw varchar(20) not null,		-- 비밀번호
	email varchar(20),				-- 이메일
	proidx varchar(20),				-- 전문가 번호(카테고리 번호)
	primary key(idx)
);

-- 글 테이블
create table writing (
	idx int auto_increment,				-- 글 번호
	categoryIdx varchar(20) not null,	-- 카테고리 번호
	userId	varchar(20) not null, 		-- 유저 아이디
	subject varchar(50)	not null,		-- 글 제목
	content varchar(1500) not null,		-- 글 내용
	primary key(idx),
	foreign key(userId) references users(id),
	foreign key(categoryIdx) references category(idx)
);

-- 댓글 테이블
create table comment (
	idx int auto_increment,			-- 댓글 번호
	writingIdx int,					-- 글 번호
	userId varchar(20),				-- 사용자 아이디
	content varchar(50),			-- 댓글 내용
	primary key(idx),
	foreign key(writingIdx) references writing(idx),
	foreign key(userId) references users(id)
);

-- 찜 테이블
create table jjim (
   userId varchar(20),       -- 유저 아이디
   writingIdx int,			 -- 글 번호
   categoryIdx varchar(20),   -- 카테고리 번호
   foreign key(userId) references users(id)
);

drop table comment;
drop table writing ;

insert into category values('CATE12', '전자제품');
insert into users(name, id,pw,email) values('길동', 'user1', 'pass', 'kil@naver.com');
insert into writing (categoryIdx, userId, subject, content) 
	values('CATE12', 'user1', '제목', '내용');

