Create Table Users (
Id int not null primary key identity(1,1),
Username varchar(30) not null unique,
Password varchar(30) not null,
Firstname varchar(30) not null,
Lastname varchar(30) not null,
Phone varchar(12) null,
Email varchar(255) null,
IsReviewer bit not null default 0,
IsAdmin bit not null default 0
);
Go
Create Table Vendors (
Id int not null primary key identity(1,1),
Code varchar(30) not null unique,
Name varchar(30) not null,
Address varchar(30) not null,
City varchar(30) not null,
State varchar(2) not null,
Zip varchar(5) not null,
Phone varchar(12) null,
Email varchar(255) null
);
Go
Create Table Products (
Id int not null primary key identity(1,1),
PartNbr varchar(30) not null unique,
Name varchar(30) not null,
Price decimal(9,2) not null default 0,
Unit varchar(30) not null default 'Each',
PhotoPath varchar(255) null,
VendorId int not null foreign key references vendors(id)
);

Go
Create Table Requests (
Id int not null primary key identity(1,1),
Description varchar(80) not null,
Justification varchar(80) not null,
RejectionReason varchar(80) null,
DeliveryMode varchar(20) not null,
Status varchar(10) not null default 'NEW',
Total decimal(11,2) not null default 0,
UserId int not null foreign key references users(id)
);
Go
Create Table Requestlines (
Id int not null primary key identity(1,1),
RequestId int not null foreign key references Requests(Id),
ProductId int not null foreign key references Products(Id),
Quantity int not null default 1
);
Go
--DB created! now to enter lines
Insert Vendors
	(Code, Name, Address, City, State, Zip, Phone, Email)
	VALUES
	('CAN', 'Canon', '123 Photo Way', 'New York', 'NY', '10038', '212-888-7627', 'ordernow@canonfilm.com'),
	('FUJI', 'Fujifilm', '456 Film Freeway', 'Los Angeles', 'CA', '90069', '310-888-3455', 'filmondemand@fuji.com'),
	('APL', 'Apple', '1 Infinite Loop', 'Cupertino', 'CA', '95014', '408-888-6227', 'applesupremacy@apple.com'),
	('DMP', 'Dunder Mifflin', '2005 NBC Lane', 'Scranton', 'PA', '18501', '272-888-7273', 'dwight.schrute@dundermifflin.com'),
	('STA', 'Staples', '13 Springfiled Pike', 'Cincinnati', 'OH', '45215', '513-888-4341', 'getstuffnow@staples.com');
	Go

Insert Users
	(Username, Password, Firstname, Lastname, Email, IsReviewer, IsAdmin)
	VALUES
	('aadams', 'abc123', 'Ansel', 'Adams', 'aadams@gmail.com', 0, 0),
	('aelgort', 'abc123', 'Arthur', 'Elgort', 'aelgort@gmail.com', 1, 0),
	('mtestino', 'abc123', 'Mario', 'Testino', 'mtestino@gmail.com', 0, 0),
	('aleibovitz', 'abc123', 'Annie', 'Leibovitz', 'aleibovitz@gmail.com', 1, 1),
	('EvonU', 'abc123', 'Ellen', 'Von Unwerth', 'evonu@gmail.com', 0, 1),
	('Obee', 'abc123', 'Olivia', 'Bee', 'obee@gmail.com', 0, 0);
	Go

Insert Requests
(Description, Justification, DeliveryMode, Total, Userid)
VALUES
('New Battery', 'lost backup', 'ship', 75.50, (select id from users where Firstname = 'Ansel')),
('Pack of film', 'on my last roll', 'ship', 115.75, (select id from users where Firstname = 'Annie')),
('8x10 photo paper', 'big print order came in', 'office pickup', 45.60, (select id from users where Firstname = 'Olivia'));
Go

Insert Products
(PartNbr, Name, Price, VendorId)
VALUES
('BAT', 'Camera Battery', 75.50, (select id from Vendors where Code = 'CAN')),
('FIPA', '2-pack of film rolls', 23.15, (select id from Vendors where code = 'FUJI')),
('PHPA', 'package of photo paper', 45.60, (select id from Vendors where code = 'STA')),
('APS', 'Adobe Photoshop Pro', 350.99, (select id from Vendors where code = 'APL')),
('CAM', 'Standard employee camera kit', 1500.88, (select id from Vendors where code = 'CAN'));
Go
select * from Products;
