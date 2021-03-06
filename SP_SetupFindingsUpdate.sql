USE [IRIDOLOGY]
GO
/****** Object:  StoredProcedure [dbo].[SP_SetupFindingsUpdate]    Script Date: 27/3/2022 13:47:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_SetupFindingsUpdate]
	-- Add the parameters for the stored procedure here
	@IDSetupFindings int,
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

    -- Insert statements for procedure here
	UPDATE [dbo].[SetupFindings]
	   SET [IDSetupBodyOrgans] = @IDSetupBodyOrgans
		  ,[Foods] = @Foods
		  ,[NotFoods] = @NotFoods
		  ,[Lenguage] = @Lenguage
		  ,RangeMax = @RangeMax
		  ,RangeMin = @RangeMin
		  ,[Findings] = @Findings
	 WHERE [IDSetupFindings] = @IDSetupFindings
END
