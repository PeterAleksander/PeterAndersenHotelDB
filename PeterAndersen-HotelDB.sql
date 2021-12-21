USE master
IF EXISTS(select * from sys.databases where name='PeterAndersenHotelDB')
DROP DATABASE PeterAndersenHotelDB

CREATE DATABASE PeterAndersenHotelDB
GO

BEGIN TRANSACTION INITIALIZE_HOTELTABLES;
USE [PeterAndersenHotelDB]

CREATE TABLE Guest(
GuestId int IDENTITY(100,1) NOT NULL PRIMARY KEY,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Address varchar(50) NOT NULL,
City varchar(163) NOT NULL,
State varchar(2) NOT NULL,
Zip varchar(5) NOT NULL,
Phone varchar(14) NOT NULL,
)

CREATE TABLE Amenity(
AmenityId int PRIMARY KEY,
AmenityName varchar(50),
ExtraCharge decimal(5,2)
)

CREATE TABLE RoomType(
RoomTypeId int NOT NULL PRIMARY KEY,
TypeName varchar(10),
StandardOccupancy int,
MaximumOccupancy int,
ExtraPersonCost decimal(5,2),
BasePrice decimal(5,2)
)

CREATE TABLE Room(
RoomNumber int PRIMARY KEY NOT NULL,
RoomTypeId int FOREIGN KEY REFERENCES RoomType(RoomTypeId),
AdaAccessible BIT NOT NULL
)

CREATE TABLE Reservation(
ReservationId int IDENTITY(1,1) NOT NULL  PRIMARY KEY,
RoomNumber int NOT NULL FOREIGN KEY REFERENCES Room(RoomNumber),
GuestId int NOT NULL FOREIGN KEY REFERENCES Guest(GuestId),
Adults int,
Children int,
StartDate Date,
EndDate Date,
TotalCost decimal(7,2)
)

CREATE TABLE AmenitySupport(
AmenityId int FOREIGN KEY REFERENCES Amenity(AmenityId),
RoomNumber int FOREIGN KEY REFERENCES Room(RoomNumber)
)


--INSERTING GUEST VALUES INTO GUEST

Insert INTO Guest
VALUES
('Mack','Simmer','379 Old Shore Street','Council Bluffs','IA','51501','291 553-0508'),
('Bettyann','Seery','750 Wintergreen Dr.','Wasilla','AK','99654','478 277-9632'),
('Duane','Cullison','9662 Foxrun Lane','Harlingen','TX','78552','308 494-0198'),
('Karie','Yang','9378 W. Augusta Ave.','West Deptford','NJ','08096','214 730-0298'),
('Aurore','Lipton','762 Wild Rose Street','Saginaw','MI','48601','377 507-0974'),
('Zachery','Luechtefeld','7 Poplar Dr.','Arvada','CO','80003','814 485-2615'),
('Jeremiah','Pendergrass','70 Oakwood St.','Zion','IL','60099','279 491-0960'),
('Walter','Holaway','7556 Arrowhead St.','Cumberland','RI','02864','446 396-6785'),
('Wilfred','Vise','77 West Surrey Street','Oswego','NY','13126','834 727-1001'),
('Maritza','Tilton','939 Linda Rd.','Burke','VA','22015','446 351-6860'),
('Joleen','Tison','87 Queen St.','Drexel Hill','PA','19026','231 893-2755')

--INSERTING AMENITIES VALUE INTO AMENITY
INSERT INTO Amenity
VALUES
(1,'Microwave',NULL),
(2,'Refrigerator',NULL),
(3,'Oven',NULL),
(4,'Jacuzzi',25.00) 

--Inserting values into RoomType
INSERT INTO RoomType
VALUES
(1,'Single',2,2,NULL,149.99),
(2,'Double',2,4,10.00,174.99),
(3,'Suite',3,8,20.00,399.99)

--Insert Values into Room
INSERT INTO Room
VALUES
(201,2,0),
(202,2,1),
(203,2,0),
(204,2,1),
(205,1,0),
(206,1,1),
(207,1,0),
(208,1,1),
(301,2,0),
(302,2,1),
(303,2,0),
(304,2,1),
(305,1,0),
(306,1,1),
(307,1,0),
(308,1,1),
(401,3,1),
(402,3,1)

--INSERT VALUES INTO RESERVATION --Ohmygod, I was ready to blow my head off
INSERT INTO Reservation
VALUES
(308,100,1,0,'2023-02-02','2023-02-04',299.98),	
(203,101,2,1,'2023-02-05','2023-02-10',999.95),	
(305,102,2,0,'2023-02-22','2023-02-24',349.98),	
(201,103,2,2,'2023-03-06','2023-03-07',199.99),	
(302,104,3,0,'2023-03-18','2023-03-23',924.95),	
(202,105,2,2,'2023-03-29','2023-03-31',349.98),	
(304,106,2,0,'2023-03-31','2023-04-05',874.95),	
(301,107,1,0,'2023-04-09','2023-04-13',799.96),	
(207,108,1,1,'2023-04-23','2023-04-24',174.99),	
(401,109,2,4,'2023-05-30','2023-06-02',1199.97),	
(206,110,2,0,'2023-06-10','2023-06-14',599.96),	
(208,110,1,0,'2023-06-10','2023-06-14',599.96),	
(304,104,3,0,'2023-06-17','2023-06-18',184.99),	
(204,107,3,1,'2023-07-13','2023-07-14',184.99),	
(401,108,4,2,'2023-07-18','2023-07-21',1259.97),	
(303,101,2,1,'2023-07-28','2023-07-29',199.99),	
(305,101,1,0,'2023-08-30','2023-09-01',349.98),	
(208,100,2,0,'2023-09-16','2023-09-17',149.99),	
(203,103,2,2,'2023-09-13','2023-09-15',399.98),	
(401,102,2,2,'2023-11-22','2023-11-25',1199.97),	
(206,100,2,0,'2023-11-22','2023-11-25',449.97),	
(301,100,2,2,'2023-11-22','2023-11-25',599.97),	
(302,109,2,0,'2023-12-24','2023-12-28',699.96)	

--INSERT VALUES into 'AMENTITY SUPPORT'
INSERT INTO AmenitySupport
VALUES
--Fix with Sean's Suggestion 101,1::101,2 etc
(1,201),
(4,201),
(2,202),
(1,203),
(4,203),
(2,204),
(1,205),
(2,205),
(4,205),
(1,206),
(2,206),
(1,207),
(2,207),
(4,207),
(1,208),
(2,208),
(1,301),
(4,301),
(2,302),
(1,303),
(4,303),
(2,304),
(1,305),
(2,305),
(4,305),
(1,306),
(2,306),
(1,307),
(2,307),
(4,307),
(1,308),
(2,308),
(1,401),
(2,401),
(3,401),
(1,402),
(2,402),
(3,402)

COMMIT TRANSACTION INITIALIZE_HOTELTABLES;
