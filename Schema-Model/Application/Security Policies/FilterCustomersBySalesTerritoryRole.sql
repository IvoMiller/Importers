CREATE SECURITY POLICY [Application].[FilterCustomersBySalesTerritoryRole]
ADD FILTER PREDICATE [Application].[DetermineCustomerAccess]([DeliveryCityID])
ON [Sales].[Customers]
WITH (STATE = ON)

GO
