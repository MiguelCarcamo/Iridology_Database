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
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
alter PROCEDURE SP_Analysis_Create
	-- Add the parameters for the stored procedure here
	@IDPatient int,
	@IDDoctor int,
	@URLLeft varchar(350),
	@URLRight varchar(350)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @IDAnalysis int
    -- Insert statements for procedure here
	SELECT @IDAnalysis = ISNULL(MAX(IDAnalysis),0) + 1 FROM Analysis
	INSERT INTO [dbo].[Analysis]
           ([IDAnalysis]
           ,[IDPatient]
           ,[CreateDate]
           ,[IDDoctor]
           ,[Status]
		   ,[URLLeft]
		   ,[URLRight])
     VALUES
           (@IDAnalysis
		   ,@IDPatient
		   ,GETDATE()
		   ,@IDDoctor
		   ,1
		   ,@URLLeft
		   ,@URLRight)
END
GO
