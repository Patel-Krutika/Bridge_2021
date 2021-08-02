-- Krutika Patel

-- CREATE DATABASE SQL_VIDEOS;

DROP TABLE REVIEWERS;
DROP TABLE VIDEOS;

CREATE TABLE VIDEOS(
	V_ID int PRIMARY KEY UNIQUE,
	TITLE varchar(50),
    LENGTH int,
    URL varchar(100));

INSERT INTO VIDEOS VALUES(1, "SQL Tutorial - 9: Create Table Statement", 8, "https://www.youtube.com/watch?v=oReH2vO8Izc");
INSERT INTO VIDEOS VALUES(2, "SQL Tutorial - 12: Inserting Data Into Tables", 11, "https://www.youtube.com/watch?v=Tet3Z7Yb2gg");
INSERT INTO VIDEOS VALUES(3, "Constraints - SQL - Tutorial 8", 11, "https://www.youtube.com/watch?v=9WP35xwZ3tk");
INSERT INTO VIDEOS VALUES(4, "https://www.youtube.com/watch?v=9WP35xwZ3tk", 8, "https://www.youtube.com/watch?v=LlCURXIdKo8");


CREATE TABLE REVIEWERS(
	R_ID int PRIMARY KEY,
    R_NAME VARCHAR(50),
    RATING INT NULL CHECK((RATING >= 0 AND RATING <=5) OR RATING = NULL),
    REVIEW VARCHAR(150),
    V_ID int, 
    FOREIGN KEY (V_ID) REFERENCES VIDEOS(V_ID));
    

INSERT INTO REVIEWERS VALUES(1, "Josh", 5, "Great explaination!!", 1);
INSERT INTO REVIEWERS VALUES(2, "Jane", NULL, "Created my first table successfully", 1);
INSERT INTO REVIEWERS VALUES(3, "Sam", 3, "Helpful", 2);
INSERT INTO REVIEWERS VALUES(4, "Arnold", 5, "Easy to understand", 2);
INSERT INTO REVIEWERS VALUES(5, "Ryan", NULL, "Thanks, really helpful.", 3);
INSERT INTO REVIEWERS VALUES(6, "Simon", 5, "Couldn't have understood it better!", 3);
INSERT INTO REVIEWERS VALUES(7, "William", 5, "Great help", 4);
INSERT INTO REVIEWERS VALUES(8, "Elizabeth", 5, "Wonderful explaination.", 4);

SELECT *
FROM VIDEOS 
JOIN REVIEWERS ON VIDEOS.V_ID = REVIEWERS.V_ID;