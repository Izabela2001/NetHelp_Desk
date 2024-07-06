USE NetHelp_Desk
GO
CREATE OR ALTER VIEW VW_UserInformation AS
	SELECT U.IdUser, U.FristName, U.SureName, U.Email, U.NumerPhone,
		A.Login, A.Password, TA.NameType AS 'Type account',TD.NameType as 'Type departament',
		P.NamePosition,E.Name
	FROM tbl_User AS U
	INNER JOIN tbl_Account AS A ON U.IdAccount = A.IdAccount
	LEFT JOIN tbl_TypeAccount AS TA ON A.IdTypeAccount = TA.IdTypeAccount
	INNER JOIN tbl_Departament AS D ON U.IdDepartament = D.IdDepartament
	RIGHT JOIN tbl_TypeDepartament AS TD ON D.IdTypeDepartament = TD.IdTypeDepartament
	INNER JOIN tbl_Positon AS P ON U.IdPosition = P.IdPosition
	INNER JOIN tbl_Education AS E ON U.IdEducation = E.IdEducation;
GO
CREATE OR ALTER VIEW VW_DepartamentInfo AS
	SELECT D.IdDepartament,D.OpenHours,D.EndHours,D.NumerBuldings,
		TD.NameType AS 'Type Departament'
	FROM tbl_Departament AS D
	INNER JOIN tbl_TypeDepartament AS TD ON D.IdTypeDepartament=TD.IdTypeDepartament;
GO
CREATE OR ALTER VIEW VW_RaportInfo AS
	SELECT R.IdReport, R.Content,R.DateReport,TD.NameType AS 'Type departament',
		RS.NameStatus,U.FristName, U.NumerPhone,D.NumerBuldings
	FROM tbl_Report AS R
	INNER JOIN tbl_Departament AS D ON R.IdDepartament=D.IdDepartament
	LEFT JOIN tbl_TypeDepartament AS TD ON D.IdTypeDepartament=TD.IdTypeDepartament
	INNER JOIN tbl_ReportStatus AS RS ON R.IdReportStatus=RS.IdReportStatus
	INNER JOIN tbl_Account AS A ON R.IdAccount =A.IdAccount
	LEFT JOIN tbl_User AS U ON A.IdAccount=U.IdAccount;
GO
CREATE OR ALTER VIEW VW_RecordsInfo AS 
	SELECT 
		R.IdReport, 
		R.Content, 
		R.DateReport, 
		TD.NameType AS 'TypeDepartament',
		RS.NameStatus, 
		U.FristName, 
		U.NumerPhone, 
		D.NumerBuldings, 
		Re.DataRecords, 
		Re.Coverage
	FROM tbl_Records AS Re
	INNER JOIN tbl_Report AS R ON Re.IdReport = R.IdReport
	INNER JOIN tbl_Departament AS D ON R.IdDepartament = D.IdDepartament
	LEFT JOIN tbl_TypeDepartament AS TD ON D.IdTypeDepartament = TD.IdTypeDepartament
	INNER JOIN tbl_ReportStatus AS RS ON R.IdReportStatus = RS.IdReportStatus
	INNER JOIN tbl_Account AS A ON R.IdAccount = A.IdAccount
	LEFT JOIN tbl_User AS U ON A.IdAccount = U.IdAccount;

