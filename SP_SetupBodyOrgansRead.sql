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
ALTER PROCEDURE  SP_SetupBodyOrgansRead 
	-- Add the parameters for the stored procedure here
	@IDSetupBodyOrgans INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF @IDSetupBodyOrgans = 0
	BEGIN
		SET @IDSetupBodyOrgans = NULL
	END
    -- Insert statements for procedure here
	SELECT [SetupBodyOrgans].[IDSetupBodyOrgans]
      ,[SetupSystems].[IDSetupSystems]
	  ,[SetupSystems].[SetupSystems]
      ,[SetupBodyOrgans].[BodyOrgans]
      ,[SetupBodyOrgans].[Left]
      ,[SetupBodyOrgans].[Right]
	  ,[SetupBodyOrgans].Men
	  ,[SetupBodyOrgans].Womman
	  ,[SetupBodyOrgans].RangeMax
	  ,[SetupBodyOrgans].RangeMin
      ,[SetupBodyOrgans].[Lenguage]
  FROM [dbo].[SetupBodyOrgans]
  LEFT OUTER JOIN SetupSystems ON SetupBodyOrgans.IDSetupSystems = SetupSystems.IDSetupSystems
  WHERE (IDSetupBodyOrgans = @IDSetupBodyOrgans or @IDSetupBodyOrgans IS NULL)
END
GO