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
CREATE PROCEDURE SP_AnalysisPatientUpdate 
	-- Add the parameters for the stored procedure here
	@IDPatient int,
	@PatientName varchar(350),
	@PatientLastName varchar(350),
	@Lenguage varchar(50),
	@BirthDate date,
	@Gender varchar(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[AnalysisPatient]
	   SET [PatientName] = @PatientName
		  ,[PatientLastName] = @PatientLastName
		  ,[Lenguage] = @Lenguage
		  ,[BirthDate] = @BirthDate
		  ,[Gender] = @Gender
	 WHERE [IDPatient] = @IDPatient
END
GO
