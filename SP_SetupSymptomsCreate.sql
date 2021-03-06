USE [IRIDOLOGY]
GO
/****** Object:  StoredProcedure [dbo].[SP_SetupSymptomsCreate]    Script Date: 27/3/2022 11:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,MIGUEL DE JESUS CARCAMO>
-- Create date: <Create Date, 27/3/2022>
-- Description:	<Description,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_SetupSymptomsCreate]
	-- Add the parameters for the stored procedure here
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
	DECLARE @IDSetupSymptoms INT
	SELECT @IDSetupSymptoms = ISNULL(MAX(IDSetupSymptoms),0) + 1 FROM SetupSymptoms
	INSERT INTO [dbo].[SetupSymptoms]
			   ([IDSetupSymptoms]
			   ,[IDSetupBodyOrgans]
			   ,[Symptoms]
			   ,[RangeMax]
			   ,RangeMin
			   ,[Lenguage])
     VALUES
           (@IDSetupSymptoms
           ,@IDSetupBodyOrgans
           ,@Symptoms
		   ,@RangeMax
		   ,@RangeMin
           ,@Lenguage)
END
