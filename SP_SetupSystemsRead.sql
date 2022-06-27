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
-- Author:		<Author,,Miguel de Jesus Carcamo>
-- Create date: <Create Date, 19-3-2021>
-- Description:	<Description, Creamos un usuario nuevo>
-- =============================================
ALTER PROCEDURE  SP_SetupSystemsRead
	-- Add the parameters for the stored procedure here
	@IDSetupSystems INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF @IDSetupSystems = 0
	BEGIN
		SET @IDSetupSystems = NULL
	END
    -- Insert statements for procedure here
	SELECT IDSetupSystems, SetupSystems, [RangeMax], [RangeMin], Lenguage 
	FROM [SetupSystems]
	WHERE (IDSetupSystems = @IDSetupSystems OR @IDSetupSystems IS NULL)
END
GO
