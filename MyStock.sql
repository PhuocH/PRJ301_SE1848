CREATE DATABASE MyStock

GO

USE MyStock

CREATE TABLE Registration (
	[UserName] varchar(30) PRIMARY KEY,
	[Password] varchar(30),
	[LastName] nvarchar(50),
	[isAdmin] bit
)

INSERT INTO Registration VALUES ('U001', '123', 'Tom', 'True')
INSERT INTO Registration VALUES ('U002', '456', 'David', 'False')
INSERT INTO Registration VALUES ('U003', '789', 'John', 'False')
INSERT INTO Registration VALUES ('U004', '012', 'Mark', 'True')
INSERT INTO Registration VALUES ('U005', '134', 'Kate', 'False')

CREATE TABLE Cars (
	CarID int primary key,
	CarName varchar(50),
	Manufacturer varchar(50),
	Price money,
	ReleasedYear int
)

INSERT INTO Cars VALUES (1, 'Civic 2.0', 'Honda', 34000.00, 2021)
INSERT INTO Cars VALUES (2, 'BMW 523i', 'BMW', 100000.00, 2021)
INSERT INTO Cars VALUES (3, 'Clarity', 'Honda Motor Company', 33400.00, 2021)
INSERT INTO Cars VALUES (4,'BMW 8 Series', 'BMW', 85000.0000, 2021)
INSERT INTO Cars VALUES (5,'Audi A8', 'Audi', 16000.00, 2020)

CREATE TABLE Manufacturners (
	CarID int primary key,
	Manufacturer varchar(50),
	CONSTRAINT FK_CARID  FOREIGN KEY (CarID) REFERENCES Cars(CarID)
)

INSERT INTO Manufacturners VALUES (1, 'Honda')
INSERT INTO Manufacturners VALUES (2, 'BMW')
INSERT INTO Manufacturners VALUES (3, 'Honda Motor Company')
INSERT INTO Manufacturners VALUES (4, 'BMW')
INSERT INTO Manufacturners VALUES (5, 'Audi')

SELECT * FROM Registration
SELECT * FROM Cars
SELECT * FROM Manufacturners