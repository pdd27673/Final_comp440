SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[updVersionToDec]
AS
-- Update rows in table '[TableName]' in schema '[dbo]'
UPDATE dbo.features
SET
    [version] = [version] + '0'

GO
