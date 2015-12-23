USE [SQLI1]
GO
/****** Object:  User [Flippinunit]    Script Date: 12/23/2015 1:05:32 AM ******/
CREATE USER [Flippinunit] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [SQLi1]    Script Date: 12/23/2015 1:05:32 AM ******/
CREATE USER [SQLi1] FOR LOGIN [SQLi1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Todd-PC\Todd]    Script Date: 12/23/2015 1:05:32 AM ******/
CREATE USER [Todd-PC\Todd] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Todd-PC\Todd]
GO
/****** Object:  Table [dbo].[T_MEMBERS]    Script Date: 12/23/2015 1:05:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_MEMBERS](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[USERNAME] [varchar](20) NOT NULL,
	[PASSWORD] [varchar](20) NULL,
	[FIRST_NAME] [varchar](15) NOT NULL,
	[LAST_NAME] [varchar](15) NOT NULL,
	[STUDENT_ID] [varchar](9) NOT NULL,
	[EMAIL] [varchar](25) NULL,
	[PHONE_NUMBER] [varchar](10) NULL,
	[MAJOR] [varchar](3) NOT NULL,
	[DATE_ENTERED] [datetime] NOT NULL CONSTRAINT [DF_T_MEMBERS_DATE_ENTERED]  DEFAULT (getdate()),
 CONSTRAINT [PK_T_MEMBERS] PRIMARY KEY CLUSTERED 
(
	[STUDENT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SP_CHECK_CREDENTIALS]    Script Date: 12/23/2015 1:05:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Anthony Langga
-- Create date: <6 October 2014
-- Description:	Checks if a user's login exists
-- =============================================
CREATE PROCEDURE [dbo].[SP_CHECK_CREDENTIALS]
	-- Add the parameters for the stored procedure here
	@USERNAME varchar(20),
	@PASSWORD varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF EXISTS(SELECT * FROM T_MEMBERS WHERE USERNAME = @USERNAME AND [PASSWORD] = @PASSWORD)
	SELECT 1
	ELSE
SELECT 0
END

GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTER_USER]    Script Date: 12/23/2015 1:05:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Anthony Langga
-- Create date: 3 October 2014
-- Description:	Inserts a new User into the data
-- =============================================
CREATE PROCEDURE [dbo].[SP_REGISTER_USER]
	-- Add the parameters for the stored procedure here
	@USERNAME	varchar(20),
	@PASSWORD	varchar(20),
	@FIRST_NAME	varchar(15)	,
	@LAST_NAME	varchar(15)	,
	@STUDENT_ID	varchar(9)	,
	@EMAIL		varchar(25)	,
	@PHONE_NUMBER	varchar(10),	
	@MAJOR		varchar(3)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF NOT EXISTS(SELECT USERNAME FROM T_MEMBERS WHERE USERNAME = @USERNAME)
		BEGIN
			INSERT INTO T_MEMBERS ([USERNAME], [PASSWORD], FIRST_NAME, LAST_NAME, STUDENT_ID, EMAIL,PHONE_NUMBER, MAJOR)
			VALUES (@USERNAME, @PASSWORD, @FIRST_NAME, @LAST_NAME, @STUDENT_ID, @EMAIL, @PHONE_NUMBER, @MAJOR)
			SELECT 1
		END
	ELSE 
		BEGIN
			SELECT 0
		END
END

GO
