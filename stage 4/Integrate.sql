rename event to ourevent

SELECT uc.constraint_name
FROM user_cons_columns ucc
JOIN user_constraints uc ON ucc.constraint_name = uc.constraint_name
WHERE ucc.table_name = 'ACTIN'
AND ucc.column_name = 'EVID'
AND uc.r_constraint_name IN (
    SELECT constraint_name
    FROM user_constraints
    WHERE table_name = 'EVENT'
);

SELECT uc.constraint_name
FROM user_cons_columns ucc
JOIN user_constraints uc ON ucc.constraint_name = uc.constraint_name
WHERE ucc.table_name = 'EMERGENBODIES'
AND ucc.column_name = 'EVID'
AND uc.r_constraint_name IN (
    SELECT constraint_name
    FROM user_constraints
    WHERE table_name = 'EVENT'
);

-- קוד לשינוי שמות העמודות בטבלה EVENT
ALTER TABLE EVENT DROP COLUMN evename;

ALTER TABLE EVENT RENAME COLUMN evedate TO Date_Time;
ALTER TABLE EVENT RENAME COLUMN evelocation TO Locaation;
ALTER TABLE EVENT RENAME COLUMN evedescribe TO Deescription;
ALTER TABLE EVENT RENAME COLUMN evid TO Event_ID;

-- קוד להוספת העמודה evresponsibillity לטבלה OurEvent
ALTER TABLE OurEvent
ADD evresponsibillity VARCHAR2(255);

-- קוד להעברת כל הנתונים מהטבלה EVENT לטבלה OurEvent
INSERT INTO OurEvent (Event_ID, Deescription, Locaation, Date_Time, evresponsibillity, Shift_ID_)
SELECT e.Event_ID, e.Deescription, e.Locaation, e.Date_Time, e.evresponsibillity, s.Shift_ID_
FROM EVENT e
CROSS JOIN (
    SELECT Shift_ID_ FROM (
        SELECT Shift_ID_, ROW_NUMBER() OVER (ORDER BY DBMS_RANDOM.VALUE) AS rn
        FROM Shift
    ) WHERE rn = 1
) s
WHERE e.Event_ID NOT IN (
    SELECT Event_ID FROM OurEvent
);

-- קוד לשינוי הקשרים בין הטבלות ACTIN ו- EMERGENBODIES לטבלת OurEvent
ALTER TABLE ACTIN
DROP CONSTRAINT SYS_C0013004; 
-- אם יש קשר חוץ שלא ידוע לי מה זה.

ALTER TABLE ACTIN
ADD CONSTRAINT fk_our_event_id
FOREIGN KEY (evid) REFERENCES OurEvent (Event_ID);

ALTER TABLE EMERGENBODIES
DROP CONSTRAINT SYS_C0013010; -- אם יש קשר חוץ שלא ידוע לי מה זה.

ALTER TABLE EMERGENBODIES
ADD CONSTRAINT fk_our_event_idd
FOREIGN KEY (EVID) REFERENCES OurEvent (Event_ID);

drop table EVENT; 

COMMIT;


SELECT uc.constraint_name
FROM user_cons_columns ucc
JOIN user_constraints uc ON ucc.constraint_name = uc.constraint_name
WHERE ucc.table_name = 'TEAMP'
AND ucc.column_name = 'ROID'
AND uc.r_constraint_name IN (
    SELECT constraint_name
    FROM user_constraints
    WHERE table_name = 'ROLESP'
);

SELECT uc.constraint_name
FROM user_cons_columns ucc
JOIN user_constraints uc ON ucc.constraint_name = uc.constraint_name
WHERE ucc.table_name = 'ACTIN'
AND ucc.column_name = 'TEID'
AND uc.r_constraint_name IN (
    SELECT constraint_name
    FROM user_constraints
    WHERE table_name ='TEAMP'
);

SELECT uc.constraint_name
FROM user_cons_columns ucc
JOIN user_constraints uc ON ucc.constraint_name = uc.constraint_name
WHERE ucc.table_name = 'PRACTICING'
AND ucc.column_name = 'TEID'
AND uc.r_constraint_name IN (
    SELECT constraint_name
    FROM user_constraints
    WHERE table_name ='TEAMP'
);

SELECT uc.constraint_name
FROM user_cons_columns ucc
JOIN user_constraints uc ON ucc.constraint_name = uc.constraint_name
WHERE ucc.table_name = 'WORKER'
AND ucc.column_name = 'TEID'
AND uc.r_constraint_name IN (
    SELECT constraint_name
    FROM user_constraints
    WHERE table_name ='TEAMP'
);



-- הוספת העמודה teemail כעמודה שיכולה להיות NULL בטבלת VOLUNTEER
ALTER TABLE Volunteer
ADD teemail VARCHAR2(255);

-- שינוי שם העמודה Volunteer_ID ל־VARCHAR2(20) בטבלת TEAMP
ALTER TABLE TEAMP
RENAME COLUMN teid TO volunteer_id;

-- שינוי שם העמודה Naame ל־Naame בטבלת TEAMP
ALTER TABLE TEAMP
RENAME COLUMN tename TO Naame;

-- שינוי שם העמודה Address ל־Address בטבלת TEAMP
ALTER TABLE TEAMP
RENAME COLUMN teaddress TO Address;

-- שינוי שם העמודה PhonNum ל־PhonNum בטבלת TEAMP
ALTER TABLE TEAMP
RENAME COLUMN tephone TO PhonNum;

-- שינוי טיפוס העמודה PhonNum ל־NUMBER בטבלת TEAMP
ALTER TABLE TEAMP
MODIFY (PhonNum NUMBER);

-- הוספת עמודה DateofBirth והזנת ערכים תאריכים בטבלת TEAMP
ALTER TABLE TEAMP
ADD DateofBirth DATE;

UPDATE TEAMP
SET DateofBirth = TO_DATE('1970-01-01', 'YYYY-MM-DD') + FLOOR(DBMS_RANDOM.VALUE(1, 36) * 3650);
COMMIT;
-- העברת נתונים מטבלת TEAMP לטבלת VOLUNTEER עם המרת Volunteer_ID ל־VARCHAR2(20)
INSERT INTO Volunteer (Volunteer_ID, Naame, PhonNum, Address, DateofBirth, teemail)
SELECT TO_CHAR(t.Volunteer_ID), t.Naame, t.PhonNum, t.Address, t.DateofBirth, t.teemail
FROM TEAMP t
WHERE t.Volunteer_ID NOT IN (
    SELECT v.Volunteer_ID
    FROM Volunteer v
);
COMMIT;

ALTER TABLE TEAMP
DROP CONSTRAINT SYS_C0012999;

ALTER TABLE ACTIN
DROP CONSTRAINT SYS_C0013003; 

ALTER TABLE ACTIN
ADD CONSTRAINT FK_ACTIN_VOLUNTEER FOREIGN KEY (TEID)
REFERENCES VOLUNTEER (Volunteer_ID);


ALTER TABLE Practicing 
DROP CONSTRAINT SYS_C0013028 ; 

ALTER TABLE Practicing
ADD CONSTRAINT FK_Practicing_VOLUNTEER FOREIGN KEY (TEID)
REFERENCES VOLUNTEER (Volunteer_ID);

ALTER TABLE WORKER 
DROP CONSTRAINT SYS_C0013032 ; 

ALTER TABLE WORKER
ADD CONSTRAINT FK_WORKER_VOLUNTEER FOREIGN KEY (TEID)
REFERENCES VOLUNTEER (VOLUNTEER_ID);



DROP TABLE TEAMP;

ALTER TABLE WORKER
ADD ROID INTEGER;

ALTER TABLE WORKER
ADD CONSTRAINT FK_WORKER_ROLES FOREIGN KEY (ROID)
REFERENCES ROLESP (ROID);

ALTER TABLE EMERGENCYDRILL
ADD Driver_id VARCHAR(20);

ALTER TABLE EMERGENCYDRILL
ADD Medic_id VARCHAR(20);
 
ALTER TABLE EMERGENCYDRILL
ADD Paramedic_id VARCHAR(20);

ALTER TABLE EMERGENCYDRILL
ADD CONSTRAINT FK_EMERGENCYDRILL_Parmedic FOREIGN KEY (Paramedic_id)
REFERENCES Paramedic (Volunteer_ID);

ALTER TABLE EMERGENCYDRILL
ADD CONSTRAINT FK_EMERGENCYDRILL_medic FOREIGN KEY (Medic_id)
REFERENCES Medic (Volunteer_ID);

ALTER TABLE EMERGENCYDRILL
ADD CONSTRAINT FK_EMERGENCYDRILL_Driver FOREIGN KEY (Driver_id)
REFERENCES Driver (Volunteer_ID);



