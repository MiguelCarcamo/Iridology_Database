USE [IRIDOLOGY]
GO
/****** Object:  StoredProcedure [dbo].[SP_SetupFindingsCreate]    Script Date: 27/3/2022 13:46:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,MIGUEL DE JESUS CARCAMO>
-- Create date: <Create Date, 27-3-2022>
-- Description:	<Description,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_SetupFindingsCreate]
	-- Add the parameters for the stored procedure here
	@IDSetupBodyOrgans int,
	@Foods varchar(350),
	@NotFoods varchar(350),
	@Findings varchar(350),
	@RangeMax decimal(12,2),
	@RangeMin decimal(12,2),
	@Lenguage varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @IDSetupFindings int

	SELECT @IDSetupFindings = ISNULL(MAX([IDSetupFindings]),0) + 1 FROM [SetupFindings]
    -- Insert statements for procedure here
	INSERT INTO [dbo].[SetupFindings]
           ([IDSetupFindings]
           ,[IDSetupBodyOrgans]
           ,[Foods]
           ,[NotFoods]
		   ,[Findings]
		   ,[RangeMax]
		   ,RangeMin
           ,[Lenguage])
     VALUES
           (@IDSetupFindings
           ,@IDSetupBodyOrgans
           ,@Foods
           ,@NotFoods
		   ,@Findings
		   ,@RangeMax
		   ,@RangeMin
           ,@Lenguage)
END
