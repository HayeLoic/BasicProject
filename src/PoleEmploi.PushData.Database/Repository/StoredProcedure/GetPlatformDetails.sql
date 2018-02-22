USE [QUESTTODB]
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE type = 'P' AND name = 'GetPlatformDetails')
BEGIN
	DROP PROCEDURE [dbo].[GetPlatformDetails]
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPlatformDetails]
	@platformName varchar(50)
AS
BEGIN
	select
		ParameterType,
		ParameterName,
		ParameterValue,
		PlatformDetail.IdPlatform
	from
		PlatformDetail
		inner join [Platform] on PlatformDetail.IdPlatform = [Platform].IdPlatform
	where
		[Platform].PlatFormName = @platformName
END
