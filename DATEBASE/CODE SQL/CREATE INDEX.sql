USE NetHelp_Desk
GO
CREATE UNIQUE INDEX idx_Login ON tbl_Account(Login);
GO
CREATE UNIQUE INDEX idx_Email ON tbl_User(Email);
GO
CREATE NONCLUSTERED INDEX idx_NumberBuldings ON tbl_Departament(NumerBuldings ASC);
GO
CREATE NONCLUSTERED INDEX idx_DateRecords ON tbl_Records(DataRecords ASC);
GO
CREATE NONCLUSTERED INDEX idx_DateReport ON tbl_Report(DateReport ASC);
GO
CREATE NONCLUSTERED INDEX idx_FristName ON tbl_User(FristName ASC);
GO
CREATE NONCLUSTERED INDEX idx_Logins ON tbl_Account(Login ASC);

