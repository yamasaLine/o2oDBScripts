USE [datasearch]
GO

/****** Object:  View [dbo].[vwRandomNumber]    Script Date: 2016/7/8 8:45:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

 ALTER view [dbo].[vwRandomNumber]
as
  select rand() as RandomNumber

GO

ALTER FUNCTION [dbo].[RandBetween]
    ( @Bottom INTEGER
    , @Top INTEGER )
RETURNS INTEGER
AS
BEGIN
    RETURN ( SELECT CAST( FLOOR( (@Top - @Bottom + 1) * RandomNumber + @Bottom ) AS INTEGER) FROM dbo.vwRandomNumber 
    )
END

GO


