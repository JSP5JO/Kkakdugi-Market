
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
	pro tinyint default 0,		-- 전문가 여부
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

create table gallery (
	pno int,				-- 갤러리 파일 번호
	idx int,				-- 해당 글 번호
	fileName varchar(50)	-- 파일 이름
);

-- -------------- 예시문 예시
-- 카테고리 생성
insert into category VALUES('INTE51', '인테리어');
-- user 생성 (proIdx, KakaId는 선택적으로 삽입)
insert into users(name, id, pw, email) values('나라', 'nara94', 'pass123!', 'nara94@naver.com');
-- writing 예시 (카테고리와 userId는 반드시 이미 존재하는 값이 필요)
insert into writing (categoryIdx, userId, subject, content) values('INTE51', 'nara94', '이거 얼마죠?', '가격이 얼마인지 궁금합니다!!!');

select * from comment c left join users u on c.userId = u.id;

-- 데이터 삽입 예시
insert into category VALUES('1', '의류/악세서리');
insert into category VALUES('2', '스포츠/레저');
insert into category VALUES('3', '음악/미술');
insert into category VALUES('4', '가구/인테리어');
insert into category VALUES('5', '디지털/가전');
insert into category VALUES('6', '뷰티/미용');

insert into users(name, id, pw, email) values('김민수', 'm9768', 'alstn12!@', 'minsu9768@naver.com');
insert into users(name, id, pw, email) values('최준혁', 'jun1888', 'wnsgur12!@', 'jun1988@naver.com');
insert into users(name, id, pw, email) values('박준호', 'h1313', 'wnsgh12!@', 'as3216@nate.com');
insert into users(name, id, pw, email) values('이지은', 'iU123', 'wldms12!@', 'iu665@naver.com');
insert into users(name, id, pw, email) values('최자현', 'jj3458', 'wkgus12!@', 'jj1254@gmail.com');
insert into users(name, id, pw, email) values('박수빈', 'su993', 'tnqls12!@', 'su1684@naver.com');
insert into users(name, id, pw, email) values('이영호', 'ho1263', 'dudgh12!@', 'ho02@naver.com');
insert into users(name, id, pw, email) values('유현준', 'uhj9494', 'guswns12!@', 'hyunjun123@nate.com');
insert into users(name, id, pw, email) values('홍진호', 'kong222', 'wlsgh12!@', 'bunker3@gmail.com');
insert into users(name, id, pw, email) values('심은지', 'eunji88', 'dmswl12!@', 'eun99@naver.com');
insert into users(name, id, pw, email, proIdx) values('최명호', 'fashion98', 'fpro!@', 'myeong5@naver.com', '1');