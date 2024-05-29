USE NetHelp_Desk
GO
INSERT INTO tbl_TypeAccount(NameType) VALUES 
	('Admin'),('User');
GO
INSERT INTO tbl_Positon(NamePosition) VALUES
	('Apprentice'),('Employee'),('Manager'),('Director');
GO
INSERT INTO tbl_Account(Login,Password,IdTypeAccount) VALUES
	('Admin','Admin1*',1),
	('WojK','Wojk1*',1),
	('user01', 'password01', 2),
	('user02', 'password02', 2),
	('user03', 'password03', 2),
	('user04', 'password04', 2),
	('user05', 'password05', 2),
	('user06', 'password06', 2),
	('user07', 'password07', 2),
	('user08', 'password08', 2),
	('user09', 'password09', 2),
	('user10', 'password10', 2),
	('user11', 'password11', 2),
	('user12', 'password12', 2),
	('user13', 'password13', 2),
	('user14', 'password14', 2),
	('user15', 'password15', 2),
	('user16', 'password16', 2),
	('user17', 'password17', 2),
	('user18', 'password18', 2),
	('user19', 'password19', 2),
	('user20', 'password20', 2);
GO
INSERT INTO tbl_Education(Name) VALUES
	('Primary education'),
	('Technical education'),
	('Secondary education'),
	('Higer education');
GO
INSERT INTO tbl_ReportStatus(NameStatus) VALUES
	('Accept'),('Realize'),('Done'),('Wait');
GO
INSERT INTO tbl_TypeDepartament (NameType) VALUES
	('Cardiology'),
	('Accounts'),
	('Administration'),
	('Registration'),
	('Surgery'),
	('SOR'),
	('Orthopaedics'),
	('Laboratory'),
	('Pediatrics'),
	('IT');
GO
INSERT INTO tbl_Departament(OpenHours,EndHours,IdTypeDepartament,NumerBuldings) VALUES
	('08:00:00','21:30:00',1,'B2'),
	('10:00:00','15:00:00',2,'A1'),
	('08:00:00','21:00:00',3,'B2'),
	('09:00:00','17:00:00',4,'A2'),
	('08:30:00','21:20:00',5,'A3'),
	('07:30:00','23:30:00',6,'B1'),
	('10:00:00','15:00:00',7,'A1'),
	('08:30:00','21:20:00',8,'A3'),
	('08:00:00','21:00:00',9,'B2'),
	('08:00:00','21:00:00',10,'B2');
GO
INSERT INTO tbl_Report (IdAccount, IdDepartament, Content, IdReportStatus, DateReport) VALUES
	(18, 1, 'Report content 01', 1, '2023-01-01'),
	(19, 2, 'Report content 02', 2, '2023-01-02'),
	(3, 3, 'Report content 03', 3, '2023-01-03'),
	(4, 4, 'Report content 04', 4, '2023-01-04'),
	(5, 5, 'Report content 05', 1, '2023-01-05'),
	(6, 6, 'Report content 06', 2, '2023-01-06'),
	(7, 7, 'Report content 07', 3, '2023-01-07'),
	(8, 8, 'Report content 08', 4, '2023-01-08'),
	(9, 9, 'Report content 09', 1, '2023-01-09'),
	(10, 2, 'Report content 10', 2, '2023-01-10'),
	(11, 3, 'Report content 11', 1, '2023-01-11'),
	(12, 4, 'Report content 12', 3, '2023-01-12'),
	(13, 5, 'Report content 13', 1, '2023-01-13'),
	(14, 6, 'Report content 14', 2, '2023-01-14'),
	(15, 7, 'Report content 15', 1, '2023-01-15'),
	(16, 8, 'Report content 16', 3, '2023-01-16'),
	(17, 9, 'Report content 17', 1, '2023-01-17');
GO
INSERT INTO tbl_User (IdAccount, FristName, SureName, IdDepartament, IdPosition, NumerPhone, IdEducation, Email) VALUES
	(1,'Izabela','Naj',10,3,'123-456-789',4,'Admin@wp.pl'),
	(2,'Wojtek','Naj',10,2,'123-456-789',3,'Admin2@wp.pl'),
	(21, 'John', 'Doe', 1, 1, '123-456-789', 1, 'john.doe@example.com'),
	(22, 'Jane', 'Smith', 2, 2, '234-567-890', 2, 'jane.smith@example.com'),
	(3, 'Michael', 'Johnson', 3, 3, '345-678-901', 3, 'michael.johnson@example.com'),
	(4, 'Emily', 'Davis', 4, 4, '456-789-012', 2, 'emily.davis@example.com'),
	(5, 'Chris', 'Brown', 5, 4, '567-890-123', 3, 'chris.brown@example.com'),
	(6, 'Patricia', 'Taylor', 1, 1, '678-901-234', 1, 'patricia.taylor@example.com'),
	(7, 'Robert', 'Anderson', 2, 2, '789-012-345', 2, 'robert.anderson@example.com'),
	(8, 'Linda', 'Thomas', 3, 3, '890-123-457', 3, 'linda.thomas@example.com'),
	(9, 'James', 'Jackson', 4, 4, '901-234-567', 4, 'james.jackson@example.com'),
	(10, 'Barbara', 'White', 5, 4, '012-345-678', 4, 'barbara.white@example.com'),
	(11, 'William', 'Harris', 1, 1, '123-456-789', 1, 'william.harris@example.com'),
	(12, 'Elizabeth', 'Martin', 2, 2, '234-567-890', 2, 'elizabeth.martin@example.com'),
	(13, 'Joseph', 'Thompson', 3, 3, '345-678-901', 3, 'joseph.thompson@example.com'),
	(14, 'Susan', 'Garcia', 4, 4, '456-789-012', 4, 'susan.garcia@example.com'),
	(15, 'Thomas', 'Martinez', 5, 4, '567-890-123', 2, 'thomas.martinez@example.com'),
	(16, 'Jessica', 'Robinson', 1, 1, '678-901-234', 1, 'jessica.robinson@example.com'),
	(17, 'Daniel', 'Clark', 2, 2, '789-012-345', 2, 'daniel.clark@example.com'),
	(18, 'Sarah', 'Rodriguez', 3, 3, '890-123-456', 3, 'sarah.rodriguez@example.com'),
	(19, 'Paul', 'Lewis', 4, 4, '901-234-567', 4, 'paul.lewis@example.com'),
	(20, 'Karen', 'Lee', 5, 4, '012-345-678', 1, 'karen.lee@example.com');
GO
