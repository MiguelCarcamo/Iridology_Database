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
ALTER PROCEDURE SP_SetupSystemsCreate
	-- Add the parameters for the stored procedure here
	@SetupSystems varchar(50),
	@RangeMax decimal(12,2),
	@RangeMin decimal(12,2),
    @Lenguage varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @IDSetupSystems INT

	SELECT @IDSetupSystems = ISNULL(MAX(IDSetupSystems),0) + 1 FROM [SetupSystems]

    -- Insert statements for procedure here
	INSERT INTO [dbo].[SetupSystems]
           ([IDSetupSystems]
           ,[SetupSystems]
           ,[RangeMax]
           ,[RangeMin]
           ,[Lenguage])
     VALUES
           (@IDSetupSystems
           ,@SetupSystems
           ,@RangeMax
           ,@RangeMin
           ,@Lenguage)
END
