USE [IRIDOLOGY]
GO
/****** Object:  StoredProcedure [dbo].[SP_SetupBodyOrgansRead]    Script Date: 27/3/2022 11:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Miguel de Jesus Carcamo>
-- Create date: <Create Date, 19-3-2021>
-- Description:	<Description, Creamos un usuario nuevo>
-- =============================================
ALTER PROCEDURE  [dbo].[SP_SetupSymptomsRead] 
	-- Add the parameters for the stored procedure here
	@IDSetupSymptoms INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF @IDSetupSymptoms = 0
	BEGIN
		SET @IDSetupSymptoms = NULL
	END
    -- Insert statements for procedure here
	SELECT [IDSetupSymptoms]
		  ,[SetupBodyOrgans].[IDSetupBodyOrgans]
		  ,[SetupBodyOrgans].[BodyOrgans]
		  ,[Symptoms]
		  ,[SetupSymptoms].RangeMax
		  ,[SetupSymptoms].RangeMin
		  ,[SetupSymptoms].[Lenguage]
	FROM [dbo].[SetupSymptoms]
	LEFT OUTER JOIN SetupBodyOrgans ON [SetupSymptoms].IDSetupBodyOrgans = [SetupBodyOrgans].[IDSetupBodyOrgans]
	WHERE (IDSetupSymptoms = @IDSetupSymptoms or @IDSetupSymptoms IS NULL)
END