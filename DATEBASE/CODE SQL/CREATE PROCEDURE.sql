USE NetHelp_Desk
GO
CREATE OR ALTER PROCEDURE PK_AddUser 
	@Login VARCHAR(25),
	@Password VARCHAR(25),
	@FristName VARCHAR(35),
	@SureName VARCHAR(35),
	@IdDepartament INT,
	@IdPosition INT,
	@IdEducation INT,
	@NumberPhone CHAR(15),
	@Email VARCHAR(50)= null,
	@output_message NVARCHAR(100) OUTPUT
AS
BEGIN
SET NOCOUNT ON;
	DECLARE @IdAccount INT;

	INSERT INTO tbl_Account(Login,Password,IdTypeAccount)
	VALUES (@Login, @Password,2);

	SELECT @IdAccount = SCOPE_IDENTITY();

    IF NOT EXISTS (SELECT 1 FROM tbl_Departament WHERE IdDepartament = @IdDepartament)
    BEGIN
        SET @output_message = 'Not found departament';
        RETURN;
    END;
	IF NOT EXISTS (SELECT 1 FROM tbl_Positon WHERE IdPosition = @IdPosition)
    BEGIN
        SET @output_message = 'Not found position';
        RETURN;
    END;
	IF NOT EXISTS (SELECT 1 FROM tbl_Education WHERE IdEducation = @IdEducation)
    BEGIN
        SET @output_message = 'Not found education';
        RETURN;
    END;
	INSERT INTO tbl_User(IdAccount,FristName,SureName,IdDepartament,IdEducation,IdPosition,NumerPhone,Email)
	VALUES (@IdAccount,@FristName,@SureName,@IdDepartament,@IdEducation,@IdPosition,@NumberPhone,@Email);

	SET @output_message = 'Add new User';
END;
GO
CREATE OR ALTER PROCEDURE PK_UpdateUser
	@IdAccount INT, 
	@Login VARCHAR(25) = NULL,
	@Password VARCHAR(25) = NULL,
	@FristName VARCHAR(35) = NULL,
	@SureName VARCHAR(35) = NULL,
	@IdDepartament INT = NULL,
	@IdPosition INT = NULL,
	@IdEducation INT =NULL,
	@NumberPhone CHAR(15) = NULL,
	@Email VARCHAR(50)= NULL,
	@output_message NVARCHAR(100) OUTPUT
AS
BEGIN
SET NOCOUNT ON;
	IF NOT EXISTS (SELECT 1 FROM tbl_Account WHERE IdAccount = @IdAccount)
	BEGIN
        SET @output_message = 'Not found User';
        RETURN;
    END;

	UPDATE tbl_Account SET
	Login = ISNULL(@Login, Login),
	Password = ISNULL(@Password, Password)
	WHERE IdAccount = @IdAccount;

	UPDATE tbl_User SET
	FristName = ISNULL (@FristName, FristName),
	SureName = ISNULL (@SureName,SureName),
	IdDepartament = ISNULL(@IdDepartament, IdDepartament),
	IdPosition = ISNULL (@IdPosition,IdPosition),
	IdEducation = ISNULL(@IdEducation,IdEducation),
	NumerPhone = ISNULL(@NumberPhone, NumerPhone),
	Email = ISNULL(@Email,Email)
	WHERE IdAccount = @IdAccount;

	SET @output_message = 'Update User';
END;
GO
CREATE OR ALTER PROCEDURE PK_DeleteUser
	@IdAccount INT,
	@output_message NVARCHAR(100) OUTPUT
AS
BEGIN
SET NOCOUNT ON;
	IF NOT EXISTS (SELECT 1 FROM tbl_Account WHERE IdAccount = @IdAccount)
	BEGIN
        SET @output_message = 'Not found User';
        RETURN;
    END;
	DELETE tbl_User WHERE IdAccount = @IdAccount;
	DELETE tbl_Account WHERE IdAccount = @IdAccount;
	SET @output_message = 'Delete User';
END;
GO
CREATE OR ALTER PROCEDURE PK_AddDepartament
	@OpenHours TIME,
	@EndHours TIME,
	@IdTypeDepartament INT,
	@NumerBuldings VARCHAR(10),
	@output_message NVARCHAR(100) OUTPUT
AS
BEGIN
SET NOCOUNT ON;
	IF NOT EXISTS (SELECT 1 FROM tbl_TypeDepartament WHERE IdTypeDepartament = @IdTypeDepartament)
	BEGIN
        SET @output_message = 'Not found type departament';
        RETURN;
    END;
	INSERT INTO tbl_Departament(OpenHours,EndHours,IdTypeDepartament,NumerBuldings)
	VALUES (@OpenHours,@EndHours,@IdTypeDepartament,@NumerBuldings);
	SET @output_message = 'Add new departament';
END;
GO
CREATE OR ALTER PROCEDURE PK_UpdateDepartament
	@IdDepartament INT,
	@OpenHours TIME = NULL,
	@EndHours TIME = NULL,
	@IdTypeDepartament INT = NULL,
	@NumerBuldings VARCHAR(10) = NULL,
	@output_message NVARCHAR(100) OUTPUT
AS
BEGIN
SET NOCOUNT ON;
	IF NOT EXISTS (SELECT 1 FROM tbl_Departament WHERE IdDepartament = @IdDepartament)
	BEGIN
        SET @output_message = 'Not found  departament';
        RETURN;
    END;
	UPDATE tbl_Departament
	SET
		OpenHours = ISNULL (@OpenHours,OpenHours),
		EndHours = ISNULL (@EndHours,EndHours),
		IdTypeDepartament = ISNULL (@IdTypeDepartament,IdTypeDepartament),
		NumerBuldings = ISNULL(@NumerBuldings, NumerBuldings)
	WHERE IdDepartament = @IdDepartament;
	SET @output_message = 'Update Departament';
END;
GO;
CREATE OR ALTER PROCEDURE PK_DeleteDepartament
	@IdDepartament INT,
	@output_message NVARCHAR(100) OUTPUT
AS
BEGIN
SET NOCOUNT ON;
	IF NOT EXISTS (SELECT 1 FROM tbl_Departament WHERE IdDepartament = @IdDepartament)
	BEGIN
        SET @output_message = 'Not found  departament';
        RETURN;
    END;
	DELETE tbl_Report WHERE IdDepartament = @IdDepartament;
	DELETE tbl_Departament WHERE IdDepartament = @IdDepartament;
	SET @output_message = 'Remove departament';
END;
GO
CREATE OR ALTER PROCEDURE PK_AddReport
	@IdAccount INT,
	@IdDepartament INT,
	@Content VARCHAR(300) ,
	@IdReportStatus INT,
	@DateReport DATE ,
	@output_message NVARCHAR(100) OUTPUT
AS
BEGIN
SET NOCOUNT ON;
	IF NOT EXISTS (SELECT 1 FROM tbl_Departament WHERE IdDepartament = @IdDepartament)
	BEGIN
        SET @output_message = 'Not found  departament';
        RETURN;
    END;
	IF NOT EXISTS (SELECT 1 FROM tbl_Account WHERE IdAccount = @IdAccount)
	BEGIN
        SET @output_message = 'Not found user';
        RETURN;
    END;
	INSERT INTO tbl_Report (IdAccount,IdDepartament,Content,IdReportStatus,DateReport)
	VALUES(@IdAccount,@IdDepartament,@Content,@IdReportStatus,@DateReport);
	SET @output_message = 'Add Report';
END;
GO
CREATE OR ALTER PROCEDURE PK_RemoveReport
	@IdReport INT,
	@output_message NVARCHAR(100) OUTPUT
AS
BEGIN
SET NOCOUNT ON;
	IF NOT EXISTS (SELECT 1 FROM tbl_Report WHERE IdReport = @IdReport)
	BEGIN
        SET @output_message = 'Not found report';
        RETURN;
    END;
	DELETE FROM tbl_Report
	WHERE IdReport = @IdReport;
	SET @output_message = 'Remove Report';
END;
GO
CREATE OR ALTER PROCEDURE PK_UpdateRaport
	@IdReport INT,
	@IdReportStatus INT,
	@output_message NVARCHAR(100) OUTPUT
AS
BEGIN
SET NOCOUNT ON;
	IF NOT EXISTS (SELECT 1 FROM tbl_Report WHERE IdReport = @IdReport)
	BEGIN
        SET @output_message = 'Not found report';
        RETURN;
    END;
	UPDATE tbl_Report
	SET IdReportStatus  =@IdReportStatus
	WHERE IdReport = @IdReport
	 SET @output_message = 'Update  report';
END;
GO
CREATE OR ALTER PROCEDURE PK_AddRecords
	@IdReport INT,
	@Coverage VARCHAR(300)= NULL,
	@DataRecords DATE,
	@output_message NVARCHAR(100) OUTPUT
AS
BEGIN
SET NOCOUNT ON;
	IF NOT EXISTS (SELECT 1 FROM tbl_Report WHERE IdReport = @IdReport)
	BEGIN
        SET @output_message = 'Not found report';
        RETURN;
    END;
	INSERT INTO tbl_Records(IdReport,Coverage,DataRecords)
	VALUES (@IdReport,@Coverage,@DataRecords);
	 SET @output_message = 'Add new records';
END;
GO
CREATE OR ALTER PROCEDURE PK_RemoveRecords
	@IdRecords INT,
	@output_message NVARCHAR(100) OUTPUT
AS
BEGIN
SET NOCOUNT ON;
	IF NOT EXISTS (SELECT 1 FROM tbl_Records WHERE IdRecords = @IdRecords)
	BEGIN
        SET @output_message = 'Not found report';
        RETURN;
    END;
	DELETE FROM tbl_Records 
	WHERE IdRecords = @IdRecords;
	SET @output_message = 'Remove records';
END;
GO