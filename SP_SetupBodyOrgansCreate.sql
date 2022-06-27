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
ALTER PROCEDURE SP_SetupBodyOrgansCreate
	-- Add the parameters for the stored procedure here
	@IDSetupSystems INT,
	@BodyOrgans VARCHAR(50),
	@Left bit,
	@Right bit,
	@Men bit,
	@Womman bit,
	@RangeMax decimal(12,2),
	@RangeMin decimal(12,2),
	@Lenguage varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @IDSetupBodyOrgans INT
	SELECT @IDSetupBodyOrgans = ISNULL(MAX(IDSetupBodyOrgans),0) + 1 FROM [SetupBodyOrgans]
    -- Insert statements for procedure here
	INSERT INTO [dbo].[SetupBodyOrgans]
           ([IDSetupBodyOrgans]
           ,[IDSetupSystems]
           ,[BodyOrgans]
           ,[Left]
           ,[Right]
		   ,Men
		   ,Womman
		   ,RangeMax
		   ,RangeMin
           ,[Lenguage])
     VALUES
           (@IDSetupBodyOrgans
           ,@IDSetupSystems
           ,@BodyOrgans
           ,@Left
           ,@Right
		   ,@Men
		   ,@Womman
		   ,@RangeMax
		   ,@RangeMin
           ,@Lenguage)
END
GO