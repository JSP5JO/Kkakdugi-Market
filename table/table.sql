
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
-- 글 삽입
insert into writing (categoryIdx, userId, subject, content, readCount, commentCount)
	values('1', 'eunji88', '[질문]이 코트 정품 맞나요?', '얼마전에 구매했는데 정품 맞는지 모르갰네요 전문가분들 봐주실 수 있나요', 7, 0);
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
	values((select idx from writing order by idx desc limit 1), '109_코트.jpg');
-- 글 삽입
insert into writing (categoryIdx, userId, subject, content, readCount, commentCount)
	values('5', 'kong222', '[판매]무선 키보드 팝니다.', '대만 명품 더키 60%배열
갈축 조용함
올 1월쯤 구매한걸로 알아용
직거래 6.5
택배 7
', 3, 0);
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
	values((select idx from writing order by idx desc limit 1), '110_무선키보드.jpg');

-- 글 삽입
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('5', 'm9768', '[시세]컴퓨터 얼마정도 할까요?', '삼성 컴퓨터 이 모델 얼마정도하요?', 11);
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
	values((select idx from writing order by idx desc limit 1), '111_삼성컴퓨터.jpg');
-- 글 삽입
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('5', 'iU123', '[구매]에어팟 삽니다', '에어팟 프로 상태좋은거 10만원에 사고 싶어요', 7);
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
	values((select idx from writing order by idx desc limit 1), '112_에어팟.jpg');
-- 글 삽입
insert into writing (categoryIdx, userId, subject, content)
	values('2', 'jj3458', '[판매]농구공 새제품 팝니다', '한번도 사용안한 농구공 입니다. 3만원에 판매해요. 직거래는 일산에서만하고 택배시 착불 입니다.');
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
	values((select idx from writing order by idx desc limit 1), '113_농구공.jpg');
-- 글 삽입
insert into writing (categoryIdx, userId, subject, content)
	values('3', 'uhj9494', '[시세/질문] 드럼 세트 얼마?', '드럼세트 스틱까지 통으로 사면 얼마나 하나요? 초보용으로요');
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
	values((select idx from writing order by idx desc limit 1), '114_드럼.jpg');
-- 글 삽입
insert into writing (categoryIdx, userId, subject, content, commentCount)
	values('4', 'ho1263', '[판매] 조립식 신발장 팝니다.', '조립식 신발장 팝니다. 낱개로는 안팔고 통으로 팔아요 3만원에 판매합니다.', 3);
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
	values((select idx from writing order by idx desc limit 1), '115_조립식신발장.jpg');
-- 댓글 삽입
insert into comment (writingIdx, userId,content)
	values (115, 'iU123', '만원에 할인 안되나요');
insert into comment (writingIdx, userId,content,pro)
	values (115, 'm9768', '수요가없는 매물입니다. 가구점에서는 입찰안할 듯 해요', 1);
insert into comment (writingIdx, userId,content)
	values (115, 'jj3458', '만오천원에 안되나요?');
-- 글 삽입
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('etc', 'kong222', '점심메뉴 추천좀요', '오늘 점심 메뉴 추천해주세요 다들 뭐 드실건가요?', 2);
-- 글 삽입
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('3', 'h1313', '[구매]붓 세트 삽니다', '수필용 붓 세트 사요 낱개도 구매 합니다.', 11);
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
	values((select idx from writing order by idx desc limit 1), '117_붓.jpg');
-- 글 삽입
insert into writing (categoryIdx, userId, subject, content, readCount, commentCount)
	values('3', 'su993', '[판매]붓 세트 판매', '서예용 붓은 아닌데 붓 세트 판매 합니다', 5, 1);
-- 댓글 삽입
insert into comment (writingIdx, userId,content)
	values (108, 'h1313', '얼마에 파실건가요?');
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
	values((select idx from writing order by idx desc limit 1), '118_붓세트.jpg');
-- 글 삽입
insert into writing (categoryIdx, userId, subject, content, readCount, commentCount)
	values('1', 'eunji88', '[질문]나이키 신발 올리셨던 분 판매됐나요', '얼마전에 나이키 신발 올리셨던 분 계셨는데 혹시 판매 됐는지 궁금해요', 7, 0);
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
	values((select idx from writing order by idx desc limit 1), '119_나이키신발.jpg');
-- 글 삽입
insert into writing (categoryIdx, userId, subject, content, readCount, commentCount)
	values('5', 'kong222', '[판매]마우스 팝니다', '로지텍 정품 만원에 팔아요 직거래만 합니다.', 3, 0);
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
	values((select idx from writing order by idx desc limit 1), '120_마우스.jpg');


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