


--DROP TABLE IF EXISTS Products

CREATE TABLE Products(
	ProductKey int primary key,
	EnglishProductName varchar(250),
	Color varchar(40),
	ListPrice money
)

--DROP TABLE IF EXISTS Employees

CREATE TABLE Employees(
	EmployeeKey int primary key,
	FirstName varchar(50),
	LastName varchar(50),
	EmailAddress varchar(250),
	HireDate datetime
)


--DROP TABLE IF EXISTS Countries

CREATE TABLE Countries(
	CountryKey int primary key,
	CountryName varchar(100)
)


CREATE TABLE tblColumnMappings(
	TableName varchar(50),
	ColumnNumber int,
	ColumnName varchar(100)

)

insert into tblColumnMappings(TableName,ColumnNumber,ColumnName) values
('Products',1,'ProductKey'),
('Products',2,'EnglishProductName'),
('Products',3,'Color'),
('Products',4,'ListPrice')

insert into tblColumnMappings(TableName,ColumnNumber,ColumnName) values
('Employees',1,'EmployeeKey'),
('Employees',3,'FirstName'),
('Employees',4,'LastName'),
('Employees',8,'EmailAddress'),
('Employees',6,'HireDate')

insert into tblColumnMappings(TableName,ColumnNumber,ColumnName) values
('Countries',1,'CountryKey'),
('Countries',4,'CountryName')

select * from tblColumnMappings

CREATE PROCEDURE sp_GetTableColumnMappings(@TableName varchar(50))
AS
BEGIN
	DECLARE @jsonTemp varchar(max)= '{"type": "TabularTranslator","mappings":X}'
	DECLARE @jsonMapping varchar(max)

	set @jsonMapping =(select ColumnNumber as [source.ordinal], ColumnName as [sink.name] from tblColumnMappings
	where TableName=@TableName
	for json path)

	select replace(@jsonTemp, 'X',@jsonMapping) ColumnMapping
END

EXEC sp_GetTableColumnMappings 'employees'

--drop table if exists tblMappings

CREATE TABLE tblMappings(
	TableName varchar(50),
	DataLakePath varchar(1000),
	DataFileName varchar(100),
	IsActive bit 
)

insert into tblMappings(TableName,DataLakePath,DataFileName,IsActive) values
('Products','NHFiles','Products.csv',1),
('Employees','NHFiles','Employees.csv',1),
('Countries','NHFiles','Countries.csv',1)


select TableName,DataLakePath,DataFileName from tblMappings where IsActive = 1

SELECT * FROM Products

SELECT * FROM EMPLOYEES

SELECT * FROM Countries