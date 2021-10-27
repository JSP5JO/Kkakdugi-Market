
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
select * from writing where categoryIdx != 'help' 
			order by idx desc limit 10, 15;
		
select * from category;
insert into category values ('etc', '기타');
select * from writing order by idx desc;
insert into writing(categoryIdx, userId, subject, content)
			values ('1', 'user1', '1번 카테고리 예시', '테스트 내용 삽입 사진 없음');


truncate comment; 
drop table comment ;
truncate writing ;
truncate gallery ;
		
-- 데이터 삽입 예시
insert into category VALUES('1', '의류/악세서리');
insert into category VALUES('2', '스포츠/레저');
insert into category VALUES('3', '음악/미술');
insert into category VALUES('4', '가구/인테리어');
insert into category VALUES('5', '디지털/가전');
insert into category VALUES('6', '뷰티/미용');
insert into category VALUES('etc', '기타');
insert into category VALUES('HELP', '고객문의');

insert into users(name, id, pw, email, proIdx) values('김민수', 'm9768', 'alstn12!@', 'minsu9768@naver.com', '4');
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
update users set proIdx = '4' where id = 'm9768';

select * from users;
select * from writing order by idx desc;
select * from gallery;

delete from users where name ='이우진';

alter table writing auto_increment 100;
-- 글 삽입
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('1', 'm9768', '[시세]가격 좀 봐주세요(재업).', '작년에 구매한 조던 정품 신발인데 얼마정가 적당할까요?', 12);
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
	values((select idx from writing order by idx desc limit 1), '100_나이키조던신발.jpg');
-- 글 삽입
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('5', 'iU123', '[구매]맥북 프로 파시는 분?', '12인치 중고 사고 싶은데 파실분 없나요?', 5);
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
	values((select idx from writing order by idx desc limit 1), '101_맥북12인치.jpg');
-- 글 삽입
insert into writing (categoryIdx, userId, subject, content)
	values('2', 'jj3458', '[판매]서핑 보드 팔아요', '5만원에 팝니다 직거래는 서울에서만 할래요.');
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
	values((select idx from writing order by idx desc limit 1), '102_서핑보드.jpg');
-- 글 삽입
insert into writing (categoryIdx, userId, subject, content)
	values('3', 'uhj9494', '[시세/질문] 통기타 가격 질문드려요.', '10만원 선에서 살만한 기타 추천해주세요.');
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
	values((select idx from writing order by idx desc limit 1), '103_통기타.jpg');
-- 글 삽입
insert into writing (categoryIdx, userId, subject, content, commentCount)
	values('4', 'ho1263', '[판매] 침대 판매', '침대 새로운거 사게돼서 판매합니다. 가격은 미정 입니다. 댓글 달아주세요.', 3);
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
	values((select idx from writing order by idx desc limit 1), '104_침대.jpg');
-- 댓글 삽입
insert into comment (writingIdx, userId,content)
	values (104, 'iU123', '5만원에 사고 싶어요!');
insert into comment (writingIdx, userId,content,pro)
	values (104, 'm9768', '중고 가구점에도 최소 10만원은 받을 수 있는 매물입니다.', 1);
insert into comment (writingIdx, userId,content)
	values (104, 'jj3458', '12만원에 직거래 원합니다.');

-- 글 삽입
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('6', 'eunji88', '[판매]명품 화장품 세트 판매', '직업상 많이 생기는데 모두 새 제품 입니다. 싸게 판매해요', 57);
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
	values((select idx from writing order by idx desc limit 1), '105_명품화장품세트.jpg');
-- 글 삽입
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('etc', 'kong222', '잡글...', '출근길에 하늘보니까 맑네요 출근할 때 하늘 맑은게 좋나요? 어두운게 좋나요?', 3);
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
	values((select idx from writing order by idx desc limit 1), '106_출근길하늘.jpg');
-- 글 삽입
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('3', 'h1313', '[구매]미술도구 파시는분 안계신가요?', '색 연필과 수채화도구 파시는 분 계신가요', 12);
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
	values((select idx from writing order by idx desc limit 1), '107_수채화.jpg');
-- 글 삽입
insert into writing (categoryIdx, userId, subject, content, readCount, commentCount)
	values('3', 'su993', '[판매]수채화 찾으셨던 분?', '수채화 찾으시던 분 계시던데 댓글 주시면 나눔 합니다.', 5, 1);
-- 댓글 삽입
insert into comment (writingIdx, userId,content)
	values (108, 'h1313', '접니다! 쪽지 주세요!');
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
	values((select idx from writing order by idx desc limit 1), '108_수채화도구.jpg');

insert into users(name, id, pw, email, proIdx) values('김민수', 'm9768', 'alstn12!@', 'minsu9768@naver.com', '4');
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