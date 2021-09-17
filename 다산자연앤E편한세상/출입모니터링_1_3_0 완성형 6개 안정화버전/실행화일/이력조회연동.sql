exec sp_addlogin 'siview', 'siview'
go

use parking
exec sp_grantdbaccess 'siview'
go
grant select on custinfo to siview
grant select on [V_CUSTINFO] to siview


create view [V_CUSTINFO] AS
SELECT CompName as Dong, DeptName as Ho, CarNo as CarNo From CustInfo

USE [PARKING]
GO

/****** Object:  View [dbo].[FullDsp]    Script Date: 2020-05-06 16:21:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[FullDsp] as
SELECT  TOP (1) logdatetime, leftcount
FROM     dbo.FullDispLog
ORDER BY logdatetime DESC
GO
