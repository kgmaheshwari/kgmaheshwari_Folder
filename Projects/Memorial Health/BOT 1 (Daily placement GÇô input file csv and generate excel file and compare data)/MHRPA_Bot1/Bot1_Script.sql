USE [RPA_MemoriaHealth]
GO
/****** Object:  Table [dbo].[Process_Master]    Script Date: 19-12-2018 20:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Process_Master](
	[REQ_NO] [varchar](20) NOT NULL,
	[START_TIME] [datetime] NOT NULL CONSTRAINT [DF_Process_Master_START_TIME]  DEFAULT (getdate()),
	[END_TIME] [datetime] NULL,
	[REQ_STATUS] [varchar](1) NULL,
	[USER_ID] [varchar](100) NULL,
	[BOT_ID] [varchar](32) NULL,
	[USER_DESC] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Process_Output]    Script Date: 19-12-2018 20:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Process_Output](
	[REQ_NO] [varchar](20) NOT NULL,
	[LINE_NUM] [int] NOT NULL,
	[REPORT_LINE] [varchar](max) NOT NULL,
	[MESSAGE_DATETIME] [datetime] NOT NULL CONSTRAINT [DF_Process_Output_MESSAGE_DATETIME]  DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tracker_Data]    Script Date: 19-12-2018 20:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tracker_Data](
	[Vendor_COS] [varchar](15) NOT NULL,
	[Count_of_Accounts] [int] NOT NULL,
	[Total_Balance] [varchar](100) NOT NULL,
	[Week] [date] NOT NULL,
	[Created_Date] [datetime] NOT NULL CONSTRAINT [DF_Tracker_Data_Created Date]  DEFAULT (getdate()),
	[REQ_NO] [varchar](20) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Trigger [dbo].[tg_process_master_upd]    Script Date: 19-12-2018 20:34:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery2.sql|18|0|C:\Users\KARUNK~1\AppData\Local\Temp\~vs673.sql
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tg_process_master_upd]
   ON  [dbo].[Process_Output] 
   AFTER  INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;
	DECLARE @Report_line Varchar(100)
	DECLARE @Req_no Varchar(100)

    SELECT @Report_line = Report_line FROM INSERTED 
	SELECT @Req_no = Req_no FROM INSERTED 

	if @Report_line like  'Process Completed'+ '%'
	
	update Process_Master set END_TIME=GETDATE() , REQ_STATUS='C'
	  where process_master.REQ_NO=@REQ_NO
	
	
	

    -- Insert statements for trigger here

END

GO
