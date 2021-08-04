-- DROP DATABASE COMPANY;
-- CREATE DATABASE COMPANY;

-- DROP TABLE EMP;
-- DROP TABLE GP_RM;
-- DROP TABLE GP;
-- DROP TABLE RM;
CREATE TABLE GP(
	G_ID INT PRIMARY KEY,
    G_NAME VARCHAR(20)
    );

CREATE TABLE RM(
	R_ID INT PRIMARY KEY,
    RM_NAME VARCHAR(20)
    );
    
CREATE TABLE GP_RM(
	G_ID INT,
    R_ID INT,
    FOREIGN KEY (G_ID) REFERENCES GP(G_ID),
    FOREIGN KEY (R_ID) REFERENCES RM(R_ID)
    );

CREATE TABLE EMP(
	EMP_ID INT PRIMARY KEY,
    FNAME VARCHAR(20),
    G_ID INT NULL,
    FOREIGN KEY (G_ID) REFERENCES GP(G_ID)
    );

INSERT INTO GP VALUES(1, "I.T.");
INSERT INTO GP VALUES(2, "Sales");
INSERT INTO GP VALUES(3, "Administration");
INSERT INTO GP VALUES(4, "Operations");

INSERT INTO RM VALUES(1, "101");
INSERT INTO RM VALUES(2, "102");
INSERT INTO RM VALUES(3, "Auditorium A");
INSERT INTO RM VALUES(4, "Auditorium B");

INSERT INTO EMP VALUES(1,"Modesto", 1);
INSERT INTO EMP VALUES(2,"Ayine", 1);
INSERT INTO EMP VALUES(3,"Christopher", 2);
INSERT INTO EMP VALUES(4,"Cheong Woo", 2);
INSERT INTO EMP VALUES(5,"Saulat", 3);
INSERT INTO EMP VALUES(6,"Heidy", NULL);

INSERT INTO GP_RM VALUES(1,1);
INSERT INTO GP_RM VALUES(1,2);
INSERT INTO GP_RM VALUES(2,2);
INSERT INTO GP_RM VALUES(2,3);

-- All groups, and the users in each group. A group should appear even if there are no users assigned to the group.
SELECT g.G_NAME AS GROUP_NAME, e.FNAME AS EMPLOYEE
FROM GP g
LEFT JOIN EMP e
ON g.G_ID = e.G_ID;


-- All rooms, and the groups assigned to each room. The rooms should appear even if no groups have been
-- assigned to them.
SELECT r.RM_NAME AS ROOM_NAME, g.G_NAME AS GROUP_NAME
FROM RM r
LEFT JOIN GP_RM gr
ON gr.R_ID = r.R_ID
LEFT JOIN GP g
ON gr.G_ID = g.G_ID;

-- A list of users, the groups that they belong to, and the rooms to which they are assigned. This should be sorted
-- alphabetically by user, then by group, then by room.

SELECT e.FNAME AS EMPLOYEE, g.G_NAME AS GROUP_NAME, r.RM_NAME AS ROOM
FROM EMP e
JOIN GP g
ON e.G_ID = g.G_ID
JOIN GP_RM gr 
ON gr.G_ID = g.G_ID
JOIN RM r
ON gr.R_ID = r.R_ID
GROUP BY EMPLOYEE, GROUP_NAME, ROOM
ORDER BY EMPLOYEE DESC;