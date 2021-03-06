USE [IRIDOLOGY]
GO
/****** Object:  StoredProcedure [dbo].[SP_CreateUser]    Script Date: 10/04/2022 06:33:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Miguel de Jesus Carcamo>
-- Create date: <Create Date, 19-3-2021>
-- Description:	<Description, Creamos un usuario nuevo>
-- =============================================
ALTER PROCEDURE [dbo].[SP_CreateUser] 
	-- Add the parameters for the stored procedure here
	@Password varchar(300),
	@IDTypeUser int,
	@UserName varchar(350),
	@UserLastName varchar(350),
	@UserMail varchar(350),
	@UserPhone varchar(50),
	@UserCountry varchar(350),
	@UserLenguage varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @USER varchar(50)
	DECLARE @CANT_USER INT
	DECLARE @IDUser INT
	DECLARE @IDInfoUser INT
	DECLARE @Error int

	BEGIN TRAN
		--GESTIONAMOS EL USUARIO
		IF CHARINDEX(' ', @UserName, 0) > 0
		BEGIN
			SET @USER = SUBSTRING(LEFT(LOWER(@UserName), CHARINDEX(' ', @UserName, 0) - 1), 1, 23)
		END
		ELSE
		BEGIN
			SET @USER = SUBSTRING(LOWER(@UserName), 1, 23)
		END
		IF CHARINDEX(' ', @UserLastName, 0) > 0
		BEGIN
			SET @USER = @USER + '.' + SUBSTRING(LEFT(LOWER(@UserLastName), CHARINDEX(' ', @UserLastName, 0) - 1), 1, 23)
		END
		ELSE
		BEGIN
			SET @USER = @USER + '.' + SUBSTRING(LOWER(@UserLastName), 1, 23)
		END
		
		SELECT @CANT_USER = COUNT(*) FROM [User] WHERE [User] LIKE '%' + @USER + '%'
		IF @CANT_USER >= 1
		BEGIN
			SET @USER = LTRIM(@USER + CONVERT(varchar(3), @CANT_USER))
		END

		--VERIFICAMOS EL ID DEL USUARIO
		SELECT @IDUser = ISNULL(MAX(([IDUser])),0) + 1 FROM [User]
		SELECT @IDInfoUser = ISNULL(MAX((IDInfoUser)),0) + 1 FROM [InfoUser]

		INSERT INTO [dbo].[User]
			   ([IDUser]
			   ,[User]
			   ,[Password]
			   ,[Status]
			   ,[IDTypeUser])
		 VALUES
			   (@IDUser
			   ,@USER
			   ,@Password
			   ,1--INICIAMOS EL USUARIO ACTIVO
			   ,@IDTypeUser)
		INSERT INTO [dbo].[InfoUser]
			   ([IDInfoUser]
			   ,[IDUser]
			   ,[UserName]
			   ,[UserLastName]
			   ,[UserMail]
			   ,[UserPhone]
			   ,[UserCountry]
			   ,[UserLenguage])
		 VALUES
			   (@IDInfoUser
			   ,@IDUser
			   ,@UserName
			   ,@UserLastName
			   ,@UserMail
			   ,@UserPhone
			   ,@UserCountry
			   ,@UserLenguage)
	COMMIT TRAN
END
