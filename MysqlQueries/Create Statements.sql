create table Candidate_Table(
Candidate_ID INT  PRIMARY KEY NOT NULL AUTO_INCREMENT,
Last_Name VARCHAR(100) NOT NULL,
First_Name VARCHAR(100) NOT NULL,
LinkedIn_Profile VARCHAR(200),
Resume VARCHAR(200),
Skillset Varchar(200) NOT NULL,
Refered_By VARCHAR(100),
Start_Date DATETIME,
Date_Added DATETIME NOT NULL,
Date_Updated DATETIME,
Comments VARCHAR(300),
Use_Flag VARCHAR(1)
);

#Stage_Table
create table Stage_Table(
Stage_ID INT PRIMARY KEY,
Stage Varchar(50) NOT NULL,
Use_Flag VARCHAR(1)
);


# Level_Table
create table Level_Table(
Level VARCHAR(1) PRIMARY KEY,
Use_Flag VARCHAR(1)
);

#Practice_Table
create table Practice_Table(
Practice_ID INT PRIMARY KEY,
Practice_Name VARCHAR(50) NOT NULL,
Use_Flag VARCHAR(1)
);

# Clients_Table
create table Clients_Table(
Client_ID INT PRIMARY KEY,
Client_Name VARCHAR(100) NOT NULL,
Use_Flag VARCHAR(1)
);

#Method_Table
create table Method_Table(
Method_ID INT PRIMARY KEY,
Method VARCHAR(100) NOT NULL,
Use_Flag VARCHAR(1)
);


#Candidate_Stage_Table
CREATE TABLE Candidate_Stage_Table(
Candidate_ID INT,
Stage_ID INT ,
Date_Updated DATETIME,
CONSTRAINT Candidate_Stage_PK PRIMARY KEY(Candidate_ID,Stage_ID),
FOREIGN KEY (Candidate_ID) REFERENCES Candidate_Table (Candidate_ID),
FOREIGN KEY (Stage_ID) REFERENCES Stage_Table (Stage_ID)
);

#Candidate_Level_Table
CREATE TABLE Candidate_Level_Table(
Candidate_ID INT,
Level Varchar(1),
Date_Updated DATETIME,
CONSTRAINT Candidate_Level_PK PRIMARY KEY(Candidate_ID,Level),
FOREIGN KEY (Candidate_ID) REFERENCES Candidate_Table (Candidate_ID),
FOREIGN KEY (Level) REFERENCES Level_Table (Level)
);

#Candidate_ Practice_Table
CREATE TABLE Candidate_Practice_Table(
Candidate_ID INT,
Practice_ID INT,
Date_Updated DATETIME,
CONSTRAINT Candidate_Practice_PK PRIMARY KEY(Candidate_ID,Practice_ID),
FOREIGN KEY (Candidate_ID) REFERENCES Candidate_Table (Candidate_ID),
FOREIGN KEY (Practice_ID) REFERENCES Practice_Table (Practice_ID)
);

#Candidate_Method_Table
CREATE TABLE Candidate_Method_Table(
Candidate_ID INT,
Method_ID INT,
Date_Updated DATETIME,
CONSTRAINT Candidate_Method_PK PRIMARY KEY(Candidate_ID,Method_ID),
FOREIGN KEY (Candidate_ID) REFERENCES Candidate_Table (Candidate_ID),
FOREIGN KEY (Method_ID) REFERENCES Method_Table (Method_ID)
);

#Candidate_Clients_Table
CREATE TABLE Candidate_Clients_Table(
Candidate_ID INT,
Client_ID INT,
Date_Updated DATETIME,
CONSTRAINT Candidate_Clients_PK PRIMARY KEY(Candidate_ID,Client_ID),
FOREIGN KEY (Candidate_ID) REFERENCES Candidate_Table (Candidate_ID),
FOREIGN KEY (Client_ID) REFERENCES Clients_Table (Client_ID)
);

#Skills_Table
CREATE TABLE Skills_Table(
Skill Varchar(50) PRIMARY KEY,
Skill_Type Varchar(50),
Use_Flag VARCHAR(1)
)

--Candidate_Skill_Table
CREATE TABLE Candidate_Skills_Table(
Candidate_ID INT,
Skill Varchar(50),
Date_Updated DATETIME,
CONSTRAINT Candidate_Skills_PK PRIMARY KEY(Candidate_ID,Skill),
FOREIGN KEY (Candidate_ID) REFERENCES Candidate_Table (Candidate_ID),
FOREIGN KEY (Skill) REFERENCES Skills_Table (Skill)
)

--Role_Table
CREATE TABLE Role_Table(
Role_ID INT PRIMARY KEY,
Role Varchar(50),
Use_Flag VARCHAR(1)
)

CREATE TABLE User_Table(
user_id INT PRIMARY KEY,
user_name Varchar(100) NOT NULL,
user_password Varchar(100) NOT NULL,
user_guid  Varchar(100)
)

INSERT INTO Role_Table VALUES(1,'PM','Y')
INSERT INTO Role_Table VALUES(2,'BA','Y')
INSERT INTO Role_Table VALUES(3,'Developer','Y')
INSERT INTO Role_Table VALUES(4,'Tester','Y')

INSERT INTO User_Table VALUES(1,'cassie.alexander','Sogeti94','');
INSERT INTO User_Table VALUES(2, 'jill.fitzgerald', 'Sogeti94','' );
