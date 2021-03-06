/****** Object:  View [dbo].[vw_ServerPermissionMember]    Script Date: 07/09/2008 12:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ServerPermissionMember]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_ServerPermissionMember]
AS
SELECT [PermissionState], [Server], [Grantee], [PermissionType], [timestamp], [member]
FROM dbo.ServerPermission p
CROSS APPLY dbo.ufn_GetMember(p.members)'
GO
