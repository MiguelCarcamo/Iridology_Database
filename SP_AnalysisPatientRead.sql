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
-- Author:		<Author,Miguel De Jesus Carcamo>
-- Create date: <Create Date, 31-3-2022>
-- Description:	<Description,>
-- =============================================
ALTER PROCEDURE SP_AnalysisPatientRead
	-- Add the parameters for the stored procedure here
	@IDUser int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		IF @IDUser = 0
		BEGIN
			SET @IDUser = NULL
		END
    -- Insert statements for procedure here
	SELECT [IDPatient]
			,[IDUser]
			,[PatientName]
			,[PatientLastName]
			,[Lenguage]
			,[BirthDate]
			,[Gender]
	FROM [dbo].[AnalysisPatient]
	WHERE ([IDUser] = @IDUser OR @IDUser IS NULL)
END
GO
