USE [IRIDOLOGY]
GO
/****** Object:  StoredProcedure [dbo].[SP_SetupSymptomsUpdate]    Script Date: 27/3/2022 11:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,MIGUEL DE JESUS CARCAMO>
-- Create date: <Create Date, 27/3/2022>
-- Description:	<Description,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_SetupSymptomsUpdate]
	-- Add the parameters for the stored procedure here
	@IDSetupSymptoms INT,
	@IDSetupBodyOrgans int,
    @Symptoms varchar(350),
	@RangeMax decimal(12,2),
	@RangeMin decimal(12,2),
    @Lenguage varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[SetupSymptoms]
	   SET [IDSetupBodyOrgans] = @IDSetupBodyOrgans
		  ,[Symptoms] = @Symptoms
		  ,[RangeMax] = @RangeMax
		  ,[RangeMin] = @RangeMin
		  ,[Lenguage] = @Lenguage
	 WHERE [IDSetupSymptoms] = @IDSetupSymptoms
END
