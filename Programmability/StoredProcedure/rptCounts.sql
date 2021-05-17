SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[rptCounts]
AS

SELECT COUNT(feature_id)
FROM dbo.features

SELECT COUNT(item_type)
FROM dbo.features
WHERE item_type = 'feature'

SELECT COUNT(item_type)
FROM dbo.features
WHERE item_type = 'user story'

SELECT COUNT(item_type)
FROM dbo.features
WHERE item_type = 'task'

SELECT COUNT(item_type)
FROM dbo.features
WHERE item_type = 'bugs'

GO
