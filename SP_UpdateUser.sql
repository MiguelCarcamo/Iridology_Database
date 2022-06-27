-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Miguel de Jesus Carcamo>
-- Create date: <Create Date, 19-3-2021>
-- Description:	<Description, Creamos un usuario nuevo>
-- =============================================
CREATE PROCEDURE SP_UpdateUser 
	-- Add the parameters for the stored procedure here
	@IDUser int,
	@Password varchar(300),
	@Status bit,
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

    -- Insert statements for procedure here
	IF @Password = ''
	BEGIN
		SELECT @Password = [Password] FROM [User]
	END
	IF @IDTypeUser = 0
	BEGIN
		SELECT @IDTypeUser = IDTypeUser FROM [User]
	END
	IF @UserName = ''
	BEGIN
		SELECT @UserName = UserName FROM InfoUser
	END
	IF @UserLastName = ''
	BEGIN
		SELECT @UserLastName = UserLastName FROM InfoUser
	END
	IF @UserMail = ''
	BEGIN
		SELECT @UserMail = UserMail FROM InfoUser
	END
	IF @UserPhone = ''
	BEGIN
		SELECT @UserPhone = UserPhone FROM InfoUser
	END
	IF @UserCountry = ''
	BEGIN
		SELECT @UserCountry = UserCountry FROM InfoUser
	END
	IF @UserLenguage = ''
	BEGIN
		SELECT @UserLenguage = UserLenguage FROM InfoUser
	END
	BEGIN TRAN
		UPDATE [dbo].[User]
			SET [Password] = @Password
			  ,[Status] = @Status
			  ,[IDTypeUser] = @IDTypeUser
			WHERE IDUser = @IDUser
		UPDATE [dbo].[InfoUser]
			SET [UserName] = @UserName
			   ,[UserLastName] = @UserLastName
			   ,[UserMail] = @UserMail
			   ,[UserPhone] = @UserPhone
			   ,[UserCountry] = @UserCountry
			   ,[UserLenguage] = @UserLenguage
			WHERE IDUser = @IDUser
	COMMIT TRAN
END
GO
