CREATE TABLE [Sales].[BuyingGroups]
(
[BuyingGroupID] [int] NOT NULL CONSTRAINT [DF_Sales_BuyingGroups_BuyingGroupID] DEFAULT (NEXT VALUE FOR [Sequences].[BuyingGroupID]),
[BuyingGroupName] [nvarchar] (50) NOT NULL,
[LastEditedBy] [int] NOT NULL,
[ValidFrom] [datetime2] GENERATED ALWAYS AS ROW START NOT NULL,
[ValidTo] [datetime2] GENERATED ALWAYS AS ROW END NOT NULL,
PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo),
CONSTRAINT [PK_Sales_BuyingGroups] PRIMARY KEY CLUSTERED  ([BuyingGroupID])
)
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [Sales].[BuyingGroups_Archive])
)
GO
ALTER TABLE [Sales].[BuyingGroups] ADD CONSTRAINT [UQ_Sales_BuyingGroups_BuyingGroupName] UNIQUE NONCLUSTERED  ([BuyingGroupName])
GO
ALTER TABLE [Sales].[BuyingGroups] ADD CONSTRAINT [FK_Sales_BuyingGroups_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID])
GO
EXEC sp_addextendedproperty N'Description', N'Customer organizations can be part of groups that exert greater buying power', 'SCHEMA', N'Sales', 'TABLE', N'BuyingGroups', NULL, NULL
GO
EXEC sp_addextendedproperty N'Description', 'Numeric ID used for reference to a buying group within the database', 'SCHEMA', N'Sales', 'TABLE', N'BuyingGroups', 'COLUMN', N'BuyingGroupID'
GO
EXEC sp_addextendedproperty N'Description', 'Full name of a buying group that customers can be members of', 'SCHEMA', N'Sales', 'TABLE', N'BuyingGroups', 'COLUMN', N'BuyingGroupName'
GO
