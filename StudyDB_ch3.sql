-- View
CREATE VIEW uv_memberTBL
AS
	SELECT memberName, memberAddress FROM memberTBL;

SELECT * FROM uv_memberTBL;

-- Procedure

DELIMITER //
CREATE PROCEDURE myProd()
BEGIN
	SELECT * FROM memberTBL WHERE memberName = '당탕이';
	SELECT * FROM productTBL WHERE productName = '냉장고';
END //
DELIMITER ;

CALL myProd() ;

-- Trigger
INSERT INTO memberTBL VALUES ('Figure', '연아', '경기도 군포시 당정동');

UPDATE memberTBL SET memberAddress = '서울 강남구 역삼동' WHERE memberName = '연아';

DELETE FROM memberTBL WHERE memberName = '연아';

CREATE TABLE deletedMemberTBL (
	memberID CHAR(8) ,
    memberName CHAR(5) ,
    memberAddress CHAR(20),
    deletedDate DATE
);

DELIMITER //
CREATE TRIGGER trg_deletedMemberTBL -- 트리거 이름
	AFTER DELETE -- 삭제 후에 작동하게 지정
    ON memberTBL -- 트리거를 부착할 테이블 
    FOR EACH ROW -- 각 행마다 적용시킴
BEGIN
	INSERT INTO deletedMemberTBL
		VALUES (OLD.memberID, OLD.memberName, OLD.memberAddress, CURDATE() );
END //
DELIMITER ;

DELETE FROM memberTBL WHERE memberName = '당탕이';

SELECT * FROM deletedMemberTBL;



SELECT * FROM memberTBL;