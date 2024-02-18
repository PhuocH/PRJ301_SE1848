CREATE DATABASE Account

GO

USE Account

GO

CREATE TABLE Users (
	userId VARCHAR(20) PRIMARY KEY NOT NULL,
	[password] VARCHAR(50) NOT NULL,
	fullName VARCHAR(50) NOT NULL,
	[role] BIT
)

INSERT INTO Users VALUES ('U001', '123', 'Tom', 'True')
INSERT INTO Users VALUES ('U002', '456', 'David', 'False')
INSERT INTO Users VALUES ('U003', '789', 'John', 'False')
INSERT INTO Users VALUES ('U004', '012', 'Mark', 'True')
INSERT INTO Users VALUES ('U005', '134', 'Kate', 'False')

SELECT * FROM Users