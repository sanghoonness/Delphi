USE [Parking]
GO

/****** Object:  Table [dbo].[GateRule]    Script Date: 06/27/2017 12:00:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[GateRule](
	[ParkNo] [smallint] NOT NULL,
	[TKType] [tinyint] NOT NULL,
	[FeeNo] [tinyint] NOT NULL,
	[IoType] [int] NULL,
	[NormalSOpen] [char](5) NULL,
	[NormalEOpen] [char](5) NULL,
	[SatudaySOpen] [char](5) NULL,
	[SatudayEOpen] [char](5) NULL,
	[SundaySOpen] [char](5) NULL,
	[SundayEOpen] [char](5) NULL,
	[SpecialdaySOpen] [char](5) NULL,
	[SpecialdayEOpen] [char](5) NULL,
	[Reserve1] [varchar](50) NULL,
	[Reserve2] [varchar](50) NULL,
	[Reserve3] [varchar](50) NULL,
	[Reserve4] [varchar](50) NULL,
	[Reserve5] [varchar](50) NULL,
	[UseYes] [int] NULL,
 CONSTRAINT [PK_GateRule] PRIMARY KEY CLUSTERED 
(
	[ParkNo] ASC,
	[TKType] ASC,
	[FeeNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'2이면 정기 1이면 일반차량' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GateRule', @level2type=N'COLUMN',@level2name=N'TKType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'요금제 0이면 일반 0이 아니면 FeeItem의 요금제' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GateRule', @level2type=N'COLUMN',@level2name=N'FeeNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0이면입차 1이면 출차' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GateRule', @level2type=N'COLUMN',@level2name=N'IoType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'평일출입시작시간(HH:MM)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GateRule', @level2type=N'COLUMN',@level2name=N'NormalSOpen'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'평일출입종료시간(HH:MM)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GateRule', @level2type=N'COLUMN',@level2name=N'NormalEOpen'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'토요일출입시작시간(HH:MM)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GateRule', @level2type=N'COLUMN',@level2name=N'SatudaySOpen'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'토요일출입종료시간(HH:MM)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GateRule', @level2type=N'COLUMN',@level2name=N'SatudayEOpen'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'일요일출입시작시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GateRule', @level2type=N'COLUMN',@level2name=N'SundaySOpen'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'일요일출입종료시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GateRule', @level2type=N'COLUMN',@level2name=N'SundayEOpen'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'특정일출입시작시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GateRule', @level2type=N'COLUMN',@level2name=N'SpecialdaySOpen'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'특정일출입종료시간' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GateRule', @level2type=N'COLUMN',@level2name=N'SpecialdayEOpen'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'예비1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GateRule', @level2type=N'COLUMN',@level2name=N'Reserve1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'예비2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GateRule', @level2type=N'COLUMN',@level2name=N'Reserve2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'예비3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GateRule', @level2type=N'COLUMN',@level2name=N'Reserve3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'예비4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GateRule', @level2type=N'COLUMN',@level2name=N'Reserve4'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'예비5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GateRule', @level2type=N'COLUMN',@level2name=N'Reserve5'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'사용유무 1이면 사용 0이면 미사용' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GateRule', @level2type=N'COLUMN',@level2name=N'UseYes'
GO

ALTER TABLE [dbo].[GateRule] ADD  CONSTRAINT [DF_GateRule_ParkNo]  DEFAULT ((0)) FOR [ParkNo]
GO

ALTER TABLE [dbo].[GateRule] ADD  CONSTRAINT [DF_GateRule_TKType]  DEFAULT ((0)) FOR [TKType]
GO

ALTER TABLE [dbo].[GateRule] ADD  CONSTRAINT [DF_GateRule_FeeNo]  DEFAULT ((0)) FOR [FeeNo]
GO

ALTER TABLE [dbo].[GateRule] ADD  CONSTRAINT [DF_GateRule_IoType]  DEFAULT ((0)) FOR [IoType]
GO

ALTER TABLE [dbo].[GateRule] ADD  CONSTRAINT [DF_GateRule_UseYes]  DEFAULT ((1)) FOR [UseYes]
GO


