--DROP TABLE IF EXISTS TblMappings

CREATE TABLE TblMappings(
	TableName varchar(100),
	SourceRows bigint,
	SinkRows bigint,
	CopyStatus as iif(SourceRows=SinkRows,'Matched','Not-Matched'),
	IsActive bit)


	insert into TblMappings(TableName,IsActive)values('dbo.DimAccount',1)
	insert into TblMappings(TableName,IsActive)values('dbo.DimEmployee',1)
	insert into TblMappings(TableName,IsActive)values('dbo.DimCustomer',1)
	insert into TblMappings(TableName,IsActive)values('dbo.DimGeography',1)

	select * from TblMappings


	CREATE PROCEDURE sp_UpdateTableInfo(@SourceRows bigint, @SinkRows bigint,@TableName varchar(100))
	AS
	BEGIN
		UPDATE TblMappings SET SourceRows = @SourceRows, SinkRows = @SinkRows
		WHERE TableName=@TableName
	END

