USE [IRIDOLOGY]
GO
/****** Object:  StoredProcedure [dbo].[SP_SetupFindingsRead]    Script Date: 27/3/2022 13:45:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,MIGUEL DE JESUS CARCAMO>
-- Create date: <Create Date, 27-3-2022>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_SetupFindingsRead]
	-- Add the parameters for the stored procedure here
	@IDSetupFindings INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF @IDSetupFindings = 0
	BEGIN
		SET @IDSetupFindings = NULL
	END
	SELECT [IDSetupFindings]
		  ,[SetupBodyOrgans].[IDSetupBodyOrgans]
		  ,[SetupBodyOrgans].[BodyOrgans]
		  ,[Foods]
		  ,[NotFoods]
		  ,[Findings]
		  ,[SetupFindings].[RangeMax]
		  ,[SetupFindings].[RangeMin]
		  ,[SetupFindings].[Lenguage]
	FROM [dbo].[SetupFindings]
	LEFT OUTER JOIN SetupBodyOrgans ON [SetupFindings].IDSetupBodyOrgans = [SetupBodyOrgans].[IDSetupBodyOrgans]
	WHERE ([IDSetupFindings] = @IDSetupFindings OR @IDSetupFindings IS NULL)
END
