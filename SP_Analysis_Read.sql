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
alter PROCEDURE SP_Analysis_Read
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
	SELECT Analysis.IDAnalysis, Analysis.IDPatient,AnalysisPatient.PatientName + AnalysisPatient.PatientLastName AS NamePatient, Analysis.CreateDate, 
		   Analysis.FinishDate, Analysis.IDDoctor, Analysis.Status, Analysis.URLLeft, Analysis.URLRight
	FROM Analysis 
	left outer JOIN AnalysisPatient ON Analysis.IDPatient = AnalysisPatient.IDPatient
	left outer join [User] ON AnalysisPatient.IDUser = [User].IDUser
	WHERE ([User].IDUser = @IDUser OR @IDUser IS NULL)
END
GO
