USE PriorityERP;
DROP TABLE dbo.SalesReason
)

(
	[SalesOrderID] ASC,
	[SalesReasonID] ASC
SELECT CUST,CUSTNAME,ADDRESS,PHONE,COUNTRY,CUSTDES,VATFLAG FROM Customers
SELECT SalesReasonID,Name,ReasonType FROM SalesReason
SELECT SalesOrderID,SalesReasonID FROM SalesOrderSalesReason
SELECT IV,Cust,IVDate,IVNUM FROM INVOICES

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





SELECT i.PRICE,p.PRICE,i.QUANT FROM PART p JOIN INVOICEITEMS i


--- COUNTRIES --([Sales].[SalesTerritory] 2019)
insert into COUNTRIES (COUNTRY,COUNTRYNAME)
select DISTINCT CountryRegionCode, Name
FROM [AdventureWorks2019].[Sales].[SalesTerritory]

--- CITIES --- (DimGeography)
insert into CITIES (CITYID,CITYNAME,COUNTRY )
select GeographyKey,City,CountryRegionCode 
from [AdventureWorksDW2014].[dbo].DimGeography

--- Customers  ---(DimCustomer)
insert into Customers (CUST,CUSTNAME,ADDRESS,PHONE,COUNTRY,CUSTDES,VATFLAG)
FROM AdventureWorks2019.[Production].[ProductCategory]

--- FAMILYTYPES --- ([Production].[ProductSubcategory] 2019)
insert into  FAMILYTYPES (FAMILYTYPE,FTNAME,FTCODE)
FROM [AdventureWorks2019].[Production].[ProductSubcategory]

---  PART --- ([Production].[Product] 2019)
insert into Part( Part,PartName,Family,Price,COST,COLORPART)
FROM AdventureWorks2019.[Production].[Product]

delete from INVOICES
--- INVOICES --- ([Sales].[SalesOrderHeader] 2019)
insert into INVOICES(IV,Cust,IVDate,IVNUM)
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











