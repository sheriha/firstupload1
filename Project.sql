USE PriorityERP;GO------------------------------------------------------------------------------------------------------/****** Object:  Table [Sales].[SalesReason]    Script Date: 12/21/2021 5:17:02 PM ******/
DROP TABLE dbo.SalesReasonCREATE TABLE dbo.SalesReason([SalesReasonID] INT,[Name] [VARCHAR](100),[ReasonType] [VARCHAR](100),CONSTRAINT PK_SalesReasonID PRIMARY KEY ([SalesReasonID])
)----------------------------------------------------------------------------------------------------/****** Object:  Table [Sales].[SalesOrderHeaderSalesReason]    Script Date: 12/21/2021 5:21:28 PM ******/
CREATE TABLE dbo.SalesOrderSalesReason([SalesOrderID] [int],[SalesReasonID] [int], CONSTRAINT [PK_SalesOrderHeaderSalesReason_SalesOrderID_SalesReasonID] PRIMARY KEY CLUSTERED 
(
	[SalesOrderID] ASC,
	[SalesReasonID] ASC))--------------------------------------------------------------------------------------------------SELECT COUNTRY,COUNTRYNAME FROM COUNTRIES SELECT CITYID,CITYNAME,COUNTRY FROM CITIES
SELECT CUST,CUSTNAME,ADDRESS,PHONE,COUNTRY,CUSTDES,VATFLAG FROM CustomersSELECT FAMILYNAME,FAMILY FROM FAMILYSELECT FAMILYTYPE,FTNAME,FTCODE FROM FAMILYTYPESSELECT Part,PartName,Family,Price,COST,COLORPART FROM PART
SELECT SalesReasonID,Name,ReasonType FROM SalesReason
SELECT SalesOrderID,SalesReasonID FROM SalesOrderSalesReason
SELECT IV,Cust,IVDate,IVNUM FROM INVOICESSELECT KLINE,IV,PART,PRICE,QUANT FROM INVOICEITEMS

Truncate Table [mrr].[Mrr_Countries]
Truncate Table [mrr].[Mrr_Cities]
Truncate Table [mrr].[Mrr_Customers]
Truncate Table [mrr].[Mrr_Family]
Truncate Table [mrr].[Mrr_FamilyTypes]
Truncate Table [mrr].[Mrr_Invoices]
Truncate Table [mrr].[Mrr_InvoicesItem]
Truncate Table [mrr].[Mrr_OrderSalesReason]
Truncate Table [mrr].[Mrr_Part]
Truncate Table [mrr].[Mrr_SalesReason]





SELECT i.PRICE,p.PRICE,i.QUANT FROM PART p JOIN INVOICEITEMS iON p.PART = i.PARTwhere p.PART = 776SELECT  i.*,it.* FROM INVOICES i left JOIN INVOICEITEMS iton i.IV= it.IVwhere i.IV = 43659


--- COUNTRIES --([Sales].[SalesTerritory] 2019)
insert into COUNTRIES (COUNTRY,COUNTRYNAME)
select DISTINCT CountryRegionCode, Name
FROM [AdventureWorks2019].[Sales].[SalesTerritory]

--- CITIES --- (DimGeography)
insert into CITIES (CITYID,CITYNAME,COUNTRY )
select GeographyKey,City,CountryRegionCode 
from [AdventureWorksDW2014].[dbo].DimGeography

--- Customers  ---(DimCustomer)
insert into Customers (CUST,CUSTNAME,ADDRESS,PHONE,COUNTRY,CUSTDES,VATFLAG)select CustomerKey,FirstName,AddressLine1,Phone,GeographyKey,MaritalStatus,Genderfrom [AdventureWorksDW2014].[dbo].DimCustomer--- Family --- ([Production].[ProductCategory] 2019)insert into Family(Family, FamilyName) SELECT ProductCategoryID,Name 
FROM AdventureWorks2019.[Production].[ProductCategory]

--- FAMILYTYPES --- ([Production].[ProductSubcategory] 2019)
insert into  FAMILYTYPES (FAMILYTYPE,FTNAME,FTCODE)SELECT ProductSubcategoryID,Name,ProductCategoryID
FROM [AdventureWorks2019].[Production].[ProductSubcategory]

---  PART --- ([Production].[Product] 2019)
insert into Part( Part,PartName,Family,Price,COST,COLORPART)SELECT ProductID,Name,ProductSubcategoryID,ListPrice,StandardCost,Color
FROM AdventureWorks2019.[Production].[Product]

delete from INVOICES
--- INVOICES --- ([Sales].[SalesOrderHeader] 2019)
insert into INVOICES(IV,Cust,IVDate,IVNUM)select SalesOrderID,CustomerID,OrderDate,SalesOrderNumber 
FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]


--- INVOICEITEMS --- ([Sales].[SalesOrderDetail] 2019 )
insert into INVOICEITEMS (KLINE,IV,PART,PRICE,QUANT)
select SalesOrderDetailID,SalesOrderID,ProductID,UnitPrice,OrderQty
FROM [AdventureWorks2019].[Sales].[SalesOrderDetail]

--- Sales Reason ---
insert into SalesReason (SalesReasonID,Name,ReasonType)
select SalesReasonID,Name,ReasonType
from [AdventureWorks2019].[Sales].[SalesReason]

--- Sales Order Sales Reason ---
insert into SalesOrderSalesReason (SalesOrderID,SalesReasonID)
select SalesOrderID,SalesReasonID 
from [AdventureWorks2019].[Sales].[SalesOrderHeaderSalesReason]












