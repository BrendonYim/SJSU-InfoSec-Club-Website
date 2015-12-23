USE [InfoSecurity]
GO
/****** Object:  User [Flippinunit]    Script Date: 12/23/2015 1:00:56 AM ******/
CREATE USER [Flippinunit] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [InfoGuest]    Script Date: 12/23/2015 1:00:56 AM ******/
CREATE USER [InfoGuest] FOR LOGIN [InfoGuest] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Flippinunit]
GO
/****** Object:  Table [dbo].[T_CLUB_MEMBERS]    Script Date: 12/23/2015 1:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CLUB_MEMBERS](
	[STUDENT_ID] [varchar](9) NOT NULL,
	[PASSWORD] [varchar](48) NOT NULL CONSTRAINT [DF_T_CLUB_MEMBERS_CIPHER_PASS]  DEFAULT ('laptopez422wat'),
	[FNAME] [varchar](25) NOT NULL,
	[LNAME] [varchar](25) NOT NULL,
	[GENDER] [varchar](1) NOT NULL,
	[PHONE_NUMBER] [varchar](25) NOT NULL,
	[EMAIL] [varchar](max) NOT NULL,
	[PREFERRED_EMAIL] [varchar](max) NOT NULL,
	[MAJOR] [varchar](4) NOT NULL,
	[CONFIRMATION_TOKEN] [varchar](50) NOT NULL,
	[DATE_ADDED] [datetime] NOT NULL CONSTRAINT [DF_T_CLUB_MEMBERS_DATE_ADDED]  DEFAULT (getdate()),
	[DATE__USER_CONFIRMED] [datetime] NULL,
	[DATE_ADMIN_CONFIRMED] [datetime] NULL,
	[DATE_LAST_CHANGED] [datetime] NULL,
	[USERROLE] [varchar](25) NOT NULL CONSTRAINT [DF_T_CLUB_MEMBERS_USERROLE]  DEFAULT ('USER')
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_COMMENTS]    Script Date: 12/23/2015 1:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_COMMENTS](
	[COMMENT_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[COMMENT] [varchar](max) NULL,
	[DATE_INSERTED] [datetime] NOT NULL CONSTRAINT [DF_T_COMMENTS_DATE_INSERTED]  DEFAULT (getdate()),
 CONSTRAINT [PK_T_COMMENT] PRIMARY KEY CLUSTERED 
(
	[COMMENT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_MAJOR]    Script Date: 12/23/2015 1:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_MAJOR](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MAJOR] [varchar](50) NOT NULL,
	[VALUE] [varchar](4) NOT NULL,
	[DESCRIPTION] [varchar](max) NULL,
 CONSTRAINT [PK_T_MAJOR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[VALUE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_MEMBERS]    Script Date: 12/23/2015 1:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_MEMBERS](
	[USERNAME] [varchar](20) NOT NULL,
	[PASSWORD] [varchar](20) NOT NULL,
	[DATE_ENTERED] [datetime] NOT NULL CONSTRAINT [DF_T_MEMBERS_DATE_ENTERED]  DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_QUESTION]    Script Date: 12/23/2015 1:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_QUESTION](
	[QUESTION_ID] [int] IDENTITY(1,1) NOT NULL,
	[QUESTION_TEXT] [varchar](max) NOT NULL,
	[DATE_ADDED] [datetime] NOT NULL CONSTRAINT [DF_T_QUESTION_DATE_ADDED]  DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_RESOURCES]    Script Date: 12/23/2015 1:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_RESOURCES](
	[Name] [nvarchar](255) NOT NULL,
	[Category1] [varchar](40) NOT NULL,
	[Category2] [varchar](40) NULL,
	[Operating_System1] [varchar](40) NOT NULL,
	[Operating_System2] [varchar](40) NULL,
	[Description] [varchar](255) NOT NULL,
	[Link] [varchar](255) NULL,
 CONSTRAINT [PK_Sheet1$] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SP_BRUTE_ME]    Script Date: 12/23/2015 1:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_BRUTE_ME]
	-- Add the parameters for the stored procedure here
	@USERNAME varchar(20),
	@PASSWORD varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS(SELECT * FROM T_MEMBERS WHERE USERNAME = @USERNAME AND [PASSWORD] = @PASSWORD)
	SELECT 1
	ELSE
SELECT 0
END

GO
/****** Object:  StoredProcedure [dbo].[SP_CREATE_ACCOUNT]    Script Date: 12/23/2015 1:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vivi Langga
-- Create date: 22 April, 2015
-- Description:	Creates an account from the register page
-- =============================================
CREATE PROCEDURE [dbo].[SP_CREATE_ACCOUNT]
	-- Add the parameters for the stored procedure here
	@STUDENT_ID varchar(9),
	@PASSWORD varchar(48),
	@FNAME varchar(25),
	@LNAME varchar(25),
	@GENDER varchar(1),
	@PHONE_NUMBER varchar(25),
	@EMAIL varchar(MAX),
	@MAJOR varchar(4),
	@TOKEN varchar(50)
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS(SELECT * FROM T_CLUB_MEMBERS WHERE EMAIL = @EMAIL)
	BEGIN
		SELECT 0
	END

	ELSE
	BEGIN
	INSERT INTO T_CLUB_MEMBERS (STUDENT_ID, [PASSWORD], FNAME, LNAME, GENDER, PHONE_NUMBER, EMAIL, PREFERRED_EMAIL, MAJOR,CONFIRMATION_TOKEN)
		SELECT RIGHT('000000000'+@STUDENT_ID,9),@PASSWORD, UPPER(LEFT(@FNAME,1))+LOWER(SUBSTRING(@FNAME,2,LEN(@FNAME))), UPPER(LEFT(@LNAME,1))+LOWER(SUBSTRING(@LNAME,2,LEN(@LNAME))), @GENDER, @PHONE_NUMBER, @EMAIL, @EMAIL,@MAJOR, @TOKEN

	SELECT 1
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GET_ALL_COMMENTS]    Script Date: 12/23/2015 1:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Anthony Langga
-- Create date: 3 October 2014
-- Description:	GETS ALL COMMENTS IN THE COMMENTS
--				TABLE
-- =============================================
CREATE PROCEDURE [dbo].[SP_GET_ALL_COMMENTS]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM T_COMMENTS
END


GO
/****** Object:  StoredProcedure [dbo].[SP_GET_HASH]    Script Date: 12/23/2015 1:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vivi Langga
-- Create date: April 23, 2015
-- Description:	Get's a users stored Hash
-- =============================================
CREATE PROCEDURE [dbo].[SP_GET_HASH]
	-- Add the parameters for the stored procedure here
	@STUDENT_ID varchar(9)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS (SELECT [PASSWORD] FROM T_CLUB_MEMBERS WHERE STUDENT_ID = RIGHT('000000000' + @STUDENT_ID, 9))
		BEGIN
			IF EXISTS (SELECT [PASSWORD] FROM T_CLUB_MEMBERS WHERE STUDENT_ID = RIGHT('000000000' + @STUDENT_ID, 9) AND DATE__USER_CONFIRMED IS NOT NULL)
				BEGIN
					SELECT [PASSWORD] FROM T_CLUB_MEMBERS WHERE STUDENT_ID = RIGHT('000000000' + @STUDENT_ID, 9)
				END
			ELSE SELECT 'EMAIL'
		END
	ELSE
		BEGIN
			SELECT 0
		END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GET_MAJORS]    Script Date: 12/23/2015 1:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Anthony Langga
-- Create date: 3 October 2014
-- Description:	GETS ALL THE MAJORS
-- =============================================
CREATE PROCEDURE [dbo].[SP_GET_MAJORS]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MAJOR, VALUE
	FROM T_MAJOR
	ORDER BY MAJOR

END


GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_COMMENT]    Script Date: 12/23/2015 1:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Anthony Langga
-- Create date: 3 October 2014
-- Description:	Inserts a comment into the
--				Comment table
-- =============================================
CREATE PROCEDURE [dbo].[SP_INSERT_COMMENT]
	-- Add the parameters for the stored procedure here
	@COMMENT varchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering w	ith SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO T_COMMENTS
	VALUES(@COMMENT, GETDATE())

	SELECT COMMENT_ID
	FROM T_COMMENTS
	WHERE COMMENT = @COMMENT
END


GO
/****** Object:  StoredProcedure [dbo].[SP_POPULATE_RESOURCES]    Script Date: 12/23/2015 1:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_POPULATE_RESOURCES]
	-- Add the parameters for the stored procedure here
	@OS_FILTER varchar(50),
	@CATEGORY_FILTER varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	CREATE TABLE #CATEGORIES (CATEGORY varchar(50));
	CREATE TABLE #OS (OS varchar(50));

	INSERT INTO #CATEGORIES VALUES ('All');
	INSERT INTO #OS VALUES ('All');
	INSERT INTO #OS VALUES ('Online');

	IF @OS_FILTER = 'Any'OR @OS_FILTER = '0'
		BEGIN
			INSERT INTO #OS VALUES ('Linux');
			INSERT INTO #OS VALUES ('Mac');
			INSERT INTO #OS VALUES ('Windows');
		END
	ELSE
		BEGIN
			INSERT INTO #OS VALUES (@OS_FILTER);
		END
	IF @CATEGORY_FILTER = 'Any' OR @CATEGORY_FILTER = '0'
		BEGIN
			INSERT INTO #CATEGORIES VALUES ('Cryptography');
			INSERT INTO #CATEGORIES VALUES ('Exploitation');
			INSERT INTO #CATEGORIES VALUES ('Forensics');
			INSERT INTO #CATEGORIES VALUES ('Malware Analysis');
			INSERT INTO #CATEGORIES VALUES ('Networking');
			INSERT INTO #CATEGORIES VALUES ('Penetration Testing');
			INSERT INTO #CATEGORIES VALUES ('Reconnaissance');
			INSERT INTO #CATEGORIES VALUES ('Reverse Engineering');
			INSERT INTO #CATEGORIES VALUES ('Stegnography');
			INSERT INTO #CATEGORIES VALUES ('Web Application Penetration Testing');		
		END
	ELSE
		BEGIN
			INSERT INTO #CATEGORIES VALUES (@CATEGORY_FILTER);
		END
    -- Insert statements for procedure here
	SELECT * FROM T_RESOURCES 
	WHERE 	(CATEGORY1 IN (SELECT CATEGORY FROM #CATEGORIES) OR CATEGORY2 IN (SELECT CATEGORY FROM #CATEGORIES)) AND 

	(OPERATING_SYSTEM1 IN (SELECT OS FROM #OS) OR OPERATING_SYSTEM2 IN (SELECT OS FROM #OS))
	ORDER BY NAME

END

GO
/****** Object:  StoredProcedure [dbo].[SP_VALIDATE_EMAIL]    Script Date: 12/23/2015 1:00:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vivi Langga
-- Create date: 22 April 2016
-- Description:	Confirms an SJSU email
-- =============================================
CREATE PROCEDURE [dbo].[SP_VALIDATE_EMAIL]
	-- Add the parameters for the stored procedure here
	@TOKEN varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS(SELECT * FROM T_CLUB_MEMBERS WHERE CONFIRMATION_TOKEN = @TOKEN AND DATE__USER_CONFIRMED IS NULL)
		BEGIN
			UPDATE T_CLUB_MEMBERS SET DATE__USER_CONFIRMED = GETDATE() WHERE CONFIRMATION_TOKEN = @TOKEN
			SELECT 1
		END
	ELSE
		BEGIN
			SELECT 0
		END
	
END

GO
