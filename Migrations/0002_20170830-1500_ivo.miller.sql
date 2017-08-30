-- <Migration ID="f8a791eb-c80b-4ee3-b847-06805e6042b2" />
GO

PRINT N'Creating [Application].[Abc]'
GO
CREATE TABLE [Application].[Abc]
(
[Id] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK__Abc__384653F6] on [Application].[Abc]'
GO
ALTER TABLE [Application].[Abc] ADD CONSTRAINT [PK__Abc__384653F6] PRIMARY KEY CLUSTERED  ([Id])
GO
