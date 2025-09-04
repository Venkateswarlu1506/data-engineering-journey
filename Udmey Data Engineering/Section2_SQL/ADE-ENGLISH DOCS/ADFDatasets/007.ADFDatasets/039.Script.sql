
select * from Orders

CREATE TABLE ColumnMappings(
	ColumnNumber int,
	ColumnName varchar(100)	
)


insert into ColumnMappings(ColumnNumber,ColumnName) values
(1,'OrderDate'),
(2,'ProductKey'),
(3,'Country'),
(4,'EnglishProductName'),
(5,'SalesAmount'),
(6,'TaxAmt'),
(7,'OrderQuantity'),
(8,'UnitPrice'),
(9,'TotalProductCost')


select * from ColumnMappings

CREATE PROCEDURE sp_GetColumnMappings
AS
BEGIN
	DECLARE @jsonTemp varchar(max)= '{"type": "TabularTranslator","mappings":X}'
	DECLARE @jsonMappings varchar(max)

	set @jsonMappings= (select ColumnNumber as [source.ordinal],ColumnName as [sink.name] from ColumnMappings
	for json path)

	select replace(@jsonTemp,'X', @jsonMappings) ColumnMapping

END


EXEC sp_GetColumnMappings