
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
	proIdx varchar(20),				-- 전문가 번호(카테고리 번호)
	kakaoId long,					-- 카카오 아이디
	primary key(idx)
);

-- 글 테이블
create table writing (
	idx int auto_increment,				-- 글 번호
	categoryIdx varchar(20) not null,	-- 카테고리 번호
	userId	varchar(20) not null, 		-- 유저 아이디
	subject varchar(50)	not null,		-- 글 제목
	content varchar(1500) not null,		-- 글 내용
	readCount int default 0,			-- 글 조회수
	commentCount smallint default 0,	-- 댓글 수
	wdate datetime default current_timestamp,		-- 작성 시간
	primary key(idx),
	foreign key(categoryIdx) references category(idx),
	foreign key(userId) references users(id)
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
create table jjim(
	userId varchar(20),
	idx int,
	categoryIdx varchar(20),
	foreign key(userId) references users(id)
);



-- -------------- 예시문 예시
-- 카테고리 생성
insert into category VALUES('INTE51', '인테리어');
-- user 생성 (proIdx, KakaId는 선택적으로 삽입)
insert into users(name, id, pw, email) values('나라', 'nara94', 'pass123!', 'nara94@naver.com');
-- writing 예시 (카테고리와 userId는 반드시 이미 존재하는 값이 필요)
insert into writing (categoryIdx, userId, subject, content) values('INTE51', 'nara94', '이거 얼마죠?', '가격이 얼마인지 궁금합니다!!!');


select * from writing where userId = 'user1';

alter table jjim change writingIdx idx int;

select * from jjim j right join writing w on j.idx = w.idx where j.userId  = 'user1';

select w.idx, w.categoryIdx, w.userId, w.subject, w.content,w.readCount, w.commentCount, w.wdate, c.name 
	from writing w left join category c on w.categoryIdx = c.idx where w.idx = 3;

select * from comment;

select name from category where idx = 'CATE12';