USE NetHelp_Desk
GO
CREATE TABLE tbl_TypeAccount(
	IdTypeAccount INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	NameType VARCHAR(25) NOT NULL);
GO
CREATE TABLE tbl_Positon(
	IdPosition INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	NamePosition VARCHAR(25) NOT NULL);
GO
CREATE TABLE tbl_Account(
	IdAccount INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Login VARCHAR(25) NOT NULL,
	Password VARCHAR(25) NOT NULL,
	IdTypeAccount INT NOT NULL,
	CONSTRAINT FK_TypeAccount FOREIGN KEY (IdTypeAccount) REFERENCES tbl_TypeAccount(IdTypeAccount));
GO
CREATE TABLE tbl_Education(
	IdEducation INT NOT NULL PRIMARY KEY  IDENTITY(1,1),
	Name VARCHAR(25) NOT NULL);
GO
CREATE TABLE tbl_ReportStatus(
	IdReportStatus INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	NameStatus VARCHAR(25) NOT NULL);
GO
CREATE TABLE tbl_TypeDepartament(
	IdTypeDepartament INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	NameType VARCHAR(25) NOT NULL);
GO
CREATE TABLE tbl_Departament(
	IdDepartament INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	OpenHours TIME NOT NULL,
	EndHours TIME NOT NULL,
	IdTypeDepartament INT NOT NULL,
	NumerBuldings VARCHAR(10) NOT NULL,
	CONSTRAINT FK_TypeDepartament FOREIGN KEY (IdTypeDepartament) REFERENCES tbl_TypeDepartament(IdTypeDepartament));
GO
CREATE TABLE tbl_Report(
	IdReport INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	IdAccount INT NOT NULL,
	IdDepartament INT NOT NULL,
	Content VARCHAR(300) NOT NULL,
	IdReportStatus INT NOT NULL,
	DateReport DATE NOT NULL,
	CONSTRAINT FK_AccountReport FOREIGN KEY (IdAccount) REFERENCES tbl_Account(IdAccount),
	CONSTRAINT FK_DepartamentReport FOREIGN KEY (IdDepartament) REFERENCES tbl_Departament(IdDepartament),
	CONSTRAINT FK_ReportStatus FOREIGN KEY (IdReportStatus) REFERENCES tbl_ReportStatus(IdReportStatus));
GO
CREATE TABLE tbl_User(
	IdUser INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	IdAccount INT NOT NULL,
	FristName VARCHAR(35) NOT NULL,
	SureName VARCHAR(35) NOT NULL,
	IdDepartament INT NOT NULL,
	IdPosition INT NOT NULL,
	NumerPhone CHAR(15) NOT NULL,
	IdEducation INT NOT NULL,
	Email VARCHAR(50) NULL,
	CONSTRAINT FK_AccountUser FOREIGN KEY (IdAccount) REFERENCES tbl_Account(IdAccount),
	CONSTRAINT FK_DepartamentUser FOREIGN KEY (IdDepartament) REFERENCES tbl_Departament(IdDepartament),
	CONSTRAINT FK_Position FOREIGN KEY (IdPosition) REFERENCES tbl_Positon(IdPosition),
	CONSTRAINT FK_Education FOREIGN KEY (IdEducation) REFERENCES tbl_Education(IdEducation));
CREATE TABLE tbl_Records(
	IdRecords INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	IdReport INT NOT NULL,
	Coverage VARCHAR(300) NULL,
	DataRecords DATA NOT NULL,
	CONSTRAINT FK_Report FOREIGN KEY (IdReport) REFERENCES tbl_Report(IdReport));
