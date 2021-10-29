
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
	content varchar(200),			-- 댓글 내용
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



-- 내용 삭제
truncate gallery ;
drop table comment ;
truncate writing ;

select * from users where name = '이우진';
delete from users where name = '이우진';
		
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
insert into users(name, id, pw, email) values('이영호', 'ho1263', 'dudgh12!@', 'ho02@naver.com', '7');
insert into users(name, id, pw, email) values('유현준', 'uhj9494', 'guswns12!@', 'hyunjun123@nate.com');
insert into users(name, id, pw, email) values('홍진호', 'kong222', 'wlsgh12!@', 'bunker3@gmail.com');
insert into users(name, id, pw, email) values('심은지', 'eunji88', 'dmswl12!@', 'eun99@naver.com');
insert into users(name, id, pw, email, proIdx) values('최명호', 'fashion98', 'fpro!@', 'myeong5@naver.com', '1');

insert into users(name, id, pw, email) values('박동현','dh1452', 'ehdgus12!@', 'dong1452@naver.com');
insert into users(name, id, pw, email) values('배지민','jimin94', 'wlals12!@', 'jimin112@naver.com');
insert into users(name, id, pw, email) values('김태우','ttww655', 'xodn12!@', 'xodn12@naver.com');
insert into users(name, id, pw, email) values('서지혜','wl67', 'wlgP12!@', 'seo9989@naver.com');
insert into users(name, id, pw, email) values('임지아','jia7898', 'wldk12!@', 'ja1162@naver.com');
insert into users(name, id, pw, email) values('유상욱','uk519', 'tkddnr12!@', 'sang99999@naver.com');
insert into users(name, id, pw, email) values('이혁주','lee6213', 'gurwn12!@', 'gurwn87@naver.com');

update users set proIdx = '4' where id = 'm9768';
update users set proIdx = '1' where id = 'ho1263';



-- writing, commnet 데이터 삽입

-- 글1
insert into writing (categoryIdx, userId, subject, content)
   values('1', 'm9768', '[판매]알파 인더스트리 MA-1 블랙 레귤러핏 M', '3회 입은 알파인더스트리 MA-1입니다 9만원에 팝니다.
	상태 좋습니다 ');
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
   values((select idx from writing order by idx desc limit 1), '1_알파인더스트리MA-1.jpg');

-- 글
insert into writing (categoryIdx, userId, subject, content)
   values('1', 'iU123', '[판매]울 캐시미어 롱코트', '은은한 세련댄 스모키블루컬러 울40 앙고라50 캐시미어 10프로 가격 15만원
정말 고급조합의 우아한 숄카라스탈 코트 새상품이에요 현대백화점 엠씨브랜드라 품질좋구 정말 보드랍구 은은한 광택이 아주예뻐요 사이즈 6677 여유있구 기장 89정도대요 ');
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
   values((select idx from writing order by idx desc limit 1), '2_울캐시미어 롱코트.jpg');
  
-- 글
insert into writing (categoryIdx, userId, subject, content)
   values('2', 'm9768', '[판매]캐피타 호러스코프 스노우보드 팝니다', '캐피타 호러스코프 151 

유니온 스캇스티븐M 40만원에 팝니다.

2021년 2월에 구매후 코로나로 인해 3시간 타고 보관중입니다..

아직 팩토리왁싱도 안벗겨진 상태이며 엣지에는 유성매직 칠해 보관중입니다.

바인딩 뒷쪽에 살짝 긁힘과 변색이 조금 있네요..

구매당시 60만원에 구매했습니다.');
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
   values((select idx from writing order by idx desc limit 1), '3_캐피타 호러스코프 스노우보드.jpg');
  
-- 글
insert into writing (categoryIdx, userId, subject, content)
   values('1', 'jj3458', '[구매]피스마이너스원 파라노이즈2', '240(245가능)사이즈 구해봅니다
댓글남기시고 사진보내주세요 40~ 45만원으로 구해봅니다
상태볼게요  안전거래로 구해봅니다
많이들 찔러봐주세요');
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
   values((select idx from writing order by idx desc limit 1), '4_피마원 파라노이즈2.png');
  
-- 글
insert into writing (categoryIdx, userId, subject, content)
   values('4', 'uhj9494', '[판매]장수돌침대 팝니다', '안녕하세요 :)
장수돌침대 판매합니다!!☆☆☆☆☆ 가격은 120만원 입니다!
물건은 사진에서 보시는 바와 같습니다.
사용감 및 생활기스 거의 존재하지 않습니다.
10회 미만으로 사용하였으며, 새것과 거의 동일합니다.(돌침대 및 부속품 포함)
돌침대에서 몇번 자보았는데 항상 꿀잠잤습니다
(그래도 전 침대가 더 좋더라구요)
부모님께 선물드리기에 정말 부끄럼 없는 제품이라 생각합니다.
 
사이즈는 키 177cm 몸무게 70kg인 저 기준 한명 반 사이즈 입니다.
저희 부모님(155cm, 65kg / 168cm, 70kg)께서 만족하며 사용하셨습니다.

구매비용은 400만원 이상으로 기억합니다. 품질보증서 등 서류는 찾아본 후 공유드리도록 하겠습니다.

물류값은 구매자분께서 부담 및 제품구매 비용으로 200만원 희망합니다.
실물보기를 희망할시 주말에만 가능하오니 참고해주시기 바라며 실물만 보고 가셔도 괜찮으니 편하게 방문문의 주세용 :)
좋은하루 되십시오!!' );
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
   values((select idx from writing order by idx desc limit 1), '5_장수돌침대.jpg');
   
-- 글
insert into writing (categoryIdx, userId, subject, content)
   values('2', 'h1313', '[판매]듀얼트론 스파이더 듀얼 전동킥보드', '카본 파이버 핸들바
항공기용 초경량 고강도 알루미늄 합금 프레임
MAX 3000W 초경량 듀얼 허브 모터
10인치 타이어
최고 품질의 1KW급 LG화학 리튬이온 배터리팩 탑재
pm 자전거도로 인증 기체

??전면 후면 봉 라이트 밝게 잘 나오고
키박스 튜닝 되어있어요
미니모터스 67.2v 6.5ah 급속 충전기

신품가로 본체 키박스 급속충전기만 구매하셔도
1875000원 나오는데 75만원에 팝니다
쿨거래 하시는분 한정해서
전동킥보드 가방, 휴대폰 거치대, 전동킥보드 자물쇠
헬멧, 장갑 서비스로 같이 드릴게요');
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
   values((select idx from writing order by idx desc limit 1), '6_듀얼트론전동킥보드.jpg');
   
-- 글 사진 x writingIdx 7번
insert into writing (categoryIdx, userId, subject, content , commentCount)
   values('1', 'jj3458', '[질문]뉴발란스 992 착화감 거슬림', '이번에 솔드아웃에서 992 샀는데 토박스? 구목 부분 
박음질이 안쪽으로 말려있어서 발등부분이 상당히 거슬리는데 원래 992가 그런가요?
',1);

-- 전문가 댓글
insert into comment (writingIdx, userId,content)
   values (7, 'ho1263', '만약 그 부분이 맞다면 텅의 커팅 라인과 발등 부분 텅을 고정시키는 재봉 라인이 너무 한쪽으로 치우치면 그런 배김 현상이 생기더군요.
다만 유독 992만 그 부분이 그런건 아니지만 반대로 유독 992가 개체 차이가 개인적으로 참 심하다 생각합니다.');
  
  
-- 글 
insert into writing (categoryIdx, userId, subject, content)
   values('5', 'jj3458', '[판매]아이폰 xs 64기가 실버', '정상 해지했고 휴대폰 교체해서 판매합니당 단품이구요!
배터리효율 83%이고 보이시듯 케이스와 강화유리를 항상 끼고다녀서 생활기스정도밖에 없습니다 ! 진짜 깨끗해요.. 받으시면 놀라실 겁니다 !!
모든 기능 정상작동 됩니다.
직거래는 강남쪽에서 가능합니다.
모든인증 가능하니 문의 주세요 :) 
쿨거하시면 택포 해드리겠습니다 ^^');
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
   values((select idx from writing order by idx desc limit 1), '8_아이폰xs실버.jpg');
   
-- 글
insert into writing (categoryIdx, userId, subject, content)
   values('3', 'su993', '[판매]원목 탑솔리드 바이올린 절반가에 팝니다', '안녕하세요
미사용 박스신품 바이올린을 팝니다.

합판이 아닌 원목으로 제작되어 시간이 갈수록 에이징이되어 소리가 좋아지는 악기입니다.

상판은 스프러스 솔리드, 측후판은 최고등급 메이플, 플렛은 블랙 메이플을 사용하여 제작되었고
오랜기간 건조되어 완성도 높은 악기입니다.

브릿지도 가공되어 있어 바로 사용하실수 있습니다.

구성품은 전용 하드케이스, 어깨받침, 활, 줄세트, 송진, 브릿지 등 풀셋 입니다.

연습용/연주용으로 적합하며 모델명은 Jagger V85S - Maestro 입니다.

자세한 정보는 네이버에 모델명을 검색하시거나 아래 링크를 클릭하시면 됩니다.

https://search.naver.com/search.naver?where=nexearch&sm=ies_hty&ie=utf8&query=jagger%20v85s

이 바이올린의 특징은 현 4개에 모두 미세조절기가 장착되어 있습니다.

조리개 한 개가 장착되어있는 일반 바이올린에 비해 더욱 안정적이고 섬세한 조율이 가능합니다.


사이즈는 1/4, 1/2, 3/4, 4/4 입니다.

사이즈 선택은 아래를 참고해서 키와 팔걸이를 통해 고르시면 됩니다.


   키     /  팔길이

1/4 : 115~125 / 48~52
1/2 : 125~135 / 53~56
3/4 : 135~145 / 57~60
4/4 : 145이상 / 60이상(성인용)

서울 송파 / 성남 근처에서 직거래 또는 택배거래 가능합니다.
오픈마켓에서 24만원대에 판매하고 있고
 
4/4 는  13만원(사각케이스 포함)
3/4, 1/2, 1/4 사이즈는 12 만원(삼각케이스 포함) 입니다
 
네고문의는 제발제발 사양합니다.
감사합니다.');
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
   values((select idx from writing order by idx desc limit 1), '9_바이올린.jpg');
   
-- 글
insert into writing (categoryIdx, userId, subject, content)
   values('2', 'kong222', '[판매]테니스라켓, 테크니화이버테니스라켓', '구매해서 한번도 쓰지않은 새라켓입니다.
스트링작업이 되서 나온 라켓이고 테린이분들 쓰기에 적합합니다.

11만원. ');
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
   values((select idx from writing order by idx desc limit 1), '10_테크니화이버테니스라켓.jpg');
   
-- 글
insert into writing (categoryIdx, userId, subject, content)
   values('2', 'h1313', '[판매](275)나이키 베이퍼 12 아카데미 hg', '택 상자포함 새상품입니다 5만원에팝니다.

쿨거래시 새 축구화쌕 한개 드립니다 ');
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
   values((select idx from writing order by idx desc limit 1), '11_나이키축구화.jpg');
   
-- 글
insert into writing (categoryIdx, userId, subject, content)
   values('1', 'wl67', '[판매]루이비통 모노그램 선글라스', '구매하고 한번밖에 쓰지않았으며 상태는 
완전 A급입니다. 가격은 550,000원 정도 생각하고있고
협의가능합니다. 많은 문의 부탁드립니당
');
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
   values((select idx from writing order by idx desc limit 1), '12_루이비통 선글라스.jpg');
   
-- 글
insert into writing (categoryIdx, userId, subject, content)
   values('5', 'ttww655', '[구매]gtx1660super 삽니다', 'gtx1660슈퍼 50에 구합니다

서울 경기권 직거래

지방 택배 구매합니다

이점참고하시고 문의주세요');
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
   values((select idx from writing order by idx desc limit 1), '13_gtx1660super.jpg');
   
-- 글
insert into writing (categoryIdx, userId, subject, content)
   values('2', 'uk519', '[판매]스텔라 페럴렉스15p 새볼', '새볼 15.3  p 입니다 
이벤트상품이라 해당볼박스는없습니다

핀거리 괜찮아요');
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
   values((select idx from writing order by idx desc limit 1), '14_스텔라 페럴렉스15p 볼링공.jpg');
   
-- 글
insert into writing (categoryIdx, userId, subject, content)
   values('4', 'dh1452', '[판매]책장 팝니다', '깨끗한책장팝니다
가로1200높이2000
3×5칸입니다
필요하신분 연락주세요 010 4155 7353
');
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
   values((select idx from writing order by idx desc limit 1), '15_책장.jpg');
   
-- 글
insert into writing (categoryIdx, userId, subject, content)
   values('1', 'lee6213', '[질문]범고래 정가품 문의드립니다', '11번가에서 샀는데 가품이 의심되서 질문드립니다..');
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
   values((select idx from writing order by idx desc limit 1), '16_조던 범고래정가품문의.jpg');
  
-- 전문가 댓글
insert into comment (writingIdx, userId,content)
 values (16, 'ho1263', '여분끈존재,탭,텅퀄리티로 가품같습니다.');
   
-- 글
insert into writing (categoryIdx, userId, subject, content)
   values('1', 'jj3458', '[구매]', '안녕하세요. 

검색을 많이 해보았는데도 최근 게시물 중에는 만족스러운 답을 얻을 수 없어서 질문드립니다.

아버지가 일할 때 많이 걸어다니시고(무거운 짐을 나르셔야 함), 
비나 눈이 와도 일을 발이 덜 젖을 수 있는 신발이 필요하셔서 제가 하나 선물해 드리려고 합니다. 
요약하자면 제가 바라는 신발은

1. 오래 걸어도 편안한 신발

2. 비, 눈에 비교적 강한 신발

입니다. 

생각 나는 신발이 있으시다면 마구마구 추천해주세요~');

-- 사진 x 댓글
insert into comment (writingIdx, userId,content)
   values (17, 'iU123', '아디다스 테렉스 고어텍스 추천해봅니다');
insert into comment (writingIdx, userId,content)
   values (17, 'ho1263', '포스 로우 추천해드려요.
제 개인적으로 눈위에서 덜 미끄러운 신발이 포스였던것 같아요.
로우 모델이라 신고 벗기가 쉬우며, 나름 가죽이라 어느정도의 눈, 비에 견디기도 하구요.');
insert into comment (writingIdx, userId,content)
   values (17, 'uk519', '저는 당연히 팀버랜드 부츠 생각했는데ㅋㅋ 팀버랜드가 짱 아닐까요 패셔니스타 소리 들으실듯');
insert into comment (writingIdx, userId,content)
   values (17, 'h1313', 'Uvex 안전화 추천합니다.');
  
-- 글
insert into writing (categoryIdx, userId, subject, content)
   values('6', 'jimin94', '[판매]입생로랑 쿠션 새상품', '입생로랑 르 쿠션 엉크르 드 뽀 15호 새상품
정가 89000원 입니다 58000원에 싸게 내놓아요:)
얼마전에 선물 받았는데 저는 이미 있어서 내놓아용

-반값택배(Gs/Cu편의점끼리 택배) +1500
-일반택배 +3000');
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
   values((select idx from writing order by idx desc limit 1), '18_입생로랑 쿠션.jpg');
   
-- 글
insert into writing (categoryIdx, userId, subject, content)
   values('6', 'kong222', '[질문] 50만원 대 노트북 어떤게 있을까요???', '노트북을 써본적이 없는지라....

사용용도는 동영상 인터넷 문서작성 코딩용인데

혹 쓸만한 제품있을까요??

혹은 검색해야될 키워드라도 알려주실분 ㅠㅠ

감사합니다');

-- 사진 x 댓글
insert into comment (writingIdx, userId,content)
   values (19, 'jia7898', '가성비 찾으시는거면 씽크패드 70~80만원 E시리즈 추천드리고 
저가형 가성비 찾으시는거면 20~40만원 아이디어패드 라인 추천드려요. 
레노버 공홈에 할인코드 LPLNV11 사용하시면 14% 할인해서 더 싸게 사실 수 있으실거에요~');
insert into comment (writingIdx, userId,content)
   values (19, 'uhj9494', '무게상관없고 15.6인치 쓰고싶다 하시면
http://prod.danawa.com/info/?pcode=5447274&cate=112758
요놈 위X프 에서 ips패널 옵션달아서 하세요 다른곳은 품절이네요, 기본옵션이 TN패널이라 꼭 ips옵션 다셔야합니다.
얘는 추가 하드 달수 있습니다.');
insert into comment (writingIdx, userId,content)
   values (19, 'dh1452', '아톰 아니면 중고겠네요. 쩝.... 행운을 빕니다.');


   
-- 글
insert into writing (categoryIdx, userId, subject, content)
   values('4', 'wl67', '[판매]마지막 가격 !!완전 공짜 헐값! 무려 모션프레임!!', '코웨이 침대 모션프레임 입니다!

해체 설치 운송건은 알아봐 드릴수 있습니다.

보시다시피 완전 새거구요 필요가 없어졋으므로 110만에 아주 싸게 처분합니다.

?프레임을 그냥 드리는거나 마찬가집니다.....?

긴 렌탈 기간과 부담되는 렌탈료와 가격없이 자가소유로 싸게 가져가세요

프레임도 헤드형이며 사이즈는 여유있게 큰 퀸 사이즈 입니다.
넓어요 신혼부부 분들이나 가족분들이 사용하시기에 아주 너무 좋습니다. 프레임도 리모컨으로 조정하는거라 아주 편하구 좋아요.

침대 프레임만 해도 460만 입니다.

원래 프레임과 매트리스는 별도 따로 입니다.

프레임과 아주 싸게 드려요~
완전 거저 값이네요ㅜ

그리고 부피와 무게가 꽤 나갑니다.

성인2명이 들고 가야합니다.

그리고 해체를 해서 가져가셔야 합니다.
해체할줄 아시는 분이나 사람을 불러서 해체해서 가져가시길 바랍니다.

설치하실때 보니 드릴 사용하시 더라구요.
기사님한테 여쭤보니 어려운건 없고 필요한게 육각렌치 드라이버와 십자드라이버만 있으면 된다 하시네요.');
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
   values((select idx from writing order by idx desc limit 1), '20_코웨이 모션프레임.jpg');
   
  
  
  
alter table writing auto_increment 30;
-- 레거시 데이터
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('2', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('3', 'm9768', '[자유]이거 뭐죠', '이상한거 발견', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('4', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('5', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('6', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('2', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('3', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('4', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('5', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('6', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('2', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('3', 'm9768', '[자유]이거 뭐죠', '이상한거 발견', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('4', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('5', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('6', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('2', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('3', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('4', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('5', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('6', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('2', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('3', 'm9768', '[자유]이거 뭐죠', '이상한거 발견', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('4', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('5', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('6', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('2', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('3', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('4', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('5', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('6', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('2', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('3', 'm9768', '[자유]이거 뭐죠', '이상한거 발견', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('4', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('5', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('6', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('2', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('3', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('4', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('5', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('6', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('2', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('3', 'm9768', '[자유]이거 뭐죠', '이상한거 발견', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('4', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('5', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('6', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('2', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('3', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('4', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('5', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('6', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('2', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('3', 'm9768', '[자유]이거 뭐죠', '이상한거 발견', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('4', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('5', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('6', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('2', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('3', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('4', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('5', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('6', 'm9768', '[시세]이런것도 판매할 수 있나요?', '이거 팔리긴할까요?', 1);


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

-- 글 삽입
insert into writing (categoryIdx, userId, subject, content, readCount)
	values('2', 'm9768', '[시세]캠핑용 자동 텐트 가격', '4인용 자동 텐트 한 얼마정도 할까요??', 10);
-- 갤러리 사진 삽입
insert into gallery (idx, fileName)
	values((select idx from writing order by idx desc limit 1), '121_텐트.jpg');

