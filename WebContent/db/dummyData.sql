-- MEMBER
INSERT INTO MEMBER (MID, MPW, MNAME, MTEL, MEMAIL, MGENDER, MBIRTH, MADDRESS)
    VALUES ('test1', '111', '사용자1' , '010-1111-1111', 'test1@gmail.com', 'M', 
            '1995/01/01', '서울시 용산구');
            
INSERT INTO MEMBER (MID, MPW, MNAME, MTEL, MEMAIL, MGENDER, MBIRTH, MADDRESS)
    VALUES ('test2', '111', '사용자2' , '010-2222-2222', 'test2@gmail.com', 'M', 
            '1995/01/01', '서울시 용산구');
            
-- SHELTER
INSERT INTO SHELTER(SID, SPW, SNAME, STEL, SEMAIL, SADDRESS)
    VALUES ('ashel', '111', '서울동물복지지원센터', '02-2124-2839', 'ashel@seoulAnimal.co.kr', '서울특별시 마포구 매봉산로 31(상암동)');

INSERT INTO SHELTER(SID, SPW, SNAME, STEL, SEMAIL, SADDRESS)
    VALUES ('bshel', '111', '강동구청 반려동물팀', '02-3425-6015', 'gangdong@seoulAnimal.co.kr', '서울특별시 강동구 성내로 25(성내동, 강동구청)');
    
-- ANIMAL
INSERT INTO ANIMAL(ANO, SID, APHOTO, ABREED, AGENDER, AAGE, AWEIGHT, ACONTENT, AADDRESS, ARDATE, AADOPT, AIP)
    VALUES (ANIMAL_ANO_SEQ.NEXTVAL, 'ashel', 'wgh_0001.png', '개/진도 믹스', '수컷', '4', '12',
            '사람을 잘 따라요', '서울시 용산역 부근', SYSDATE, 'PROTECT', '197.0.0.1');
            
INSERT INTO ANIMAL(ANO, SID, APHOTO, ABREED, AGENDER, 
                   AAGE, AWEIGHT, ACONTENT, AADDRESS, ARDATE, AADOPT, AIP)
    VALUES (ANIMAL_ANO_SEQ.NEXTVAL, 'bshel', 'wgh_0002.png', '개/푸들', '암컷(중성화 O)', '5', '4',
            '사람을 잘 따라요', '중산마을 9단지', SYSDATE, 'PROTECT', '197.0.0.1');

INSERT INTO ANIMAL(ANO, SID, APHOTO, ABREED, AGENDER, 
                   AAGE, AWEIGHT, ACONTENT, AADDRESS, AADOPT, AIP)
    VALUES (ANIMAL_ANO_SEQ.NEXTVAL, 'SHELTER2', 'wgh_0000.png', '푸들', '암컷(중성화 O)', '5', '4',
            '사람을 잘 따라요', '중산마을 9단지', 'PROTECT', '197.0.0.1');

-- ANIMALCOMMENT
INSERT INTO ANIMALCOMMENT (ACNO, MID, ANO, ACCONTENT, ACRDATE, ACIP)
    VALUES (ANIMALCOMMENT_ACNO_SEQ.NEXTVAL, 'member', '12', '강아지들과의 친화력은 좋은가요?', SYSDATE, '210.0.0.1');
    
INSERT INTO ANIMALCOMMENT (ACNO, MID, ANO, ACCONTENT, ACRDATE, ACIP)
    VALUES (ANIMALCOMMENT_ACNO_SEQ.NEXTVAL, 'member', '12', '아니요 굉장히 안좋습니다.', SYSDATE, '210.0.0.1');

SELECT * FROM ANIMALCOMMENT;
-- REVIEWBOARD
INSERT INTO REVIEWBOARD
    (RNO, MID, SID, RTITLE, RCONTENT, RPW, RPHOTO, RRDATE, RHIT, RGROUP, RSTEP, RINDENT, RIP)
VALUES (REVIEWBOARD_RNO_SEQ.NEXTVAL, 'test1', NULL, '입양 5주차 후기', '입양 5주차 이제는 친해졌어요',
        '111', NULL, SYSDATE, 0, REVIEWBOARD_RNO_SEQ.CURRVAL, 0, 0, '197.0.0.1');
        
INSERT INTO REVIEWBOARD
    (RNO, MID, SID, RTITLE, RCONTENT, RPW, RPHOTO, RRDATE, RHIT, RGROUP, RSTEP, RINDENT, RIP)
VALUES (REVIEWBOARD_RNO_SEQ.NEXTVAL, 'test1', NULL, '입양 6주차 후기', '입양 6주차 산책도 잘해요',
        '111', NULL, SYSDATE, 0, REVIEWBOARD_RNO_SEQ.CURRVAL, 0, 0, '197.0.0.1');
        
INSERT INTO REVIEWBOARD
    (RNO, MID, SID, RTITLE, RCONTENT, RPW, RPHOTO, RRDATE, RHIT, RGROUP, RSTEP, RINDENT, RIP)
VALUES (REVIEWBOARD_RNO_SEQ.NEXTVAL, NULL, 'SHELTER1', '입양 6주차 후기', '입양 6주차 산책도 잘해요',
        '111', NULL, SYSDATE, 0, REVIEWBOARD_RNO_SEQ.CURRVAL, 0, 0, '197.0.0.1');

-- LIKElIST
INSERT INTO LIKELIST (LNO, MID, ANO)
    VALUES (LIKELIST_LNO_SEQ.NEXTVAL ,'aaaa', '16');
    
    INSERT INTO LIKELIST (LNO, MID, ANO)
    VALUES (LIKELIST_LNO_SEQ.NEXTVAL ,'test3', '14');
    
-- 2. 관심동물 해제
DELETE FROM LIKELIST
    WHERE MID = 'aaaa' AND ANO = '19';

SELECT * FROM MEMBER;
SELECT * FROM SHELTER;
SELECT * FROM ANIMAL;
SELECT * FROM ANIMALCOMMENT;
SELECT * FROM REVIEWBOARD;
SELECT * FROM LIKELIST;

COMMIT;
ROLLBACK;