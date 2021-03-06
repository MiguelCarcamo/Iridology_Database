USE [IRIDOLOGY]
GO
/****** Object:  StoredProcedure [dbo].[SP_SetupBodyOrgansCreate]    Script Date: 22/3/2022 19:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SP_SetupBodyOrgansUpdate]
	-- Add the parameters for the stored procedure here
	@IDSetupBodyOrgans INT,
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

    -- Insert statements for procedure here
	UPDATE [dbo].[SetupBodyOrgans]
	   SET [IDSetupSystems] = @IDSetupSystems
		  ,[BodyOrgans] = @BodyOrgans
		  ,[Left] = @Left
		  ,[Right] = @Right
		  ,Men = @Men
		  ,Womman = @Womman
		  ,RangeMax = @RangeMax
		  ,RangeMin = @RangeMin
		  ,[Lenguage] = @Lenguage
	 WHERE [IDSetupBodyOrgans] = @IDSetupBodyOrgans
END
