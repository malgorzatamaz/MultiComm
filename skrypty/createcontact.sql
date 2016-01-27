USE [Contacts]
GO

/****** Object:  Table [dbo].[Contact]    Script Date: 01/24/2016 18:19:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Contact](
	[IdContact] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CallerName] [nvarchar](max) NULL,
	[IdUser] [int] NULL,
	[ImageType] [int] NULL,
	[Image] [varbinary](max) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[IdContact] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_UserLogin] FOREIGN KEY([IdUser])
REFERENCES [dbo].[UserLogin] ([IdUser])
GO

ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_UserLogin]
GO


