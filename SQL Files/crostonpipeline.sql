SET SCHEMA PALTEST;
DROP TYPE PAL_CROSTON_DATA_T;
CREATE TYPE PAL_CROSTON_DATA_T AS TABLE("ID" INT, "RAWDATA" DOUBLE);
DROP TYPE PAL_CONTROL_T;
CREATE TYPE PAL_CONTROL_T AS TABLE("NAME" VARCHAR(100), "INTARGS" INT,"DOUBLEARGS" DOUBLE, "STRINGARGS" VARCHAR(100));
DROP TYPE PAL_CROSTON_RESULT_T;
CREATE TYPE PAL_CROSTON_RESULT_T AS TABLE("TIME" INT, "OUTPUT" DOUBLE);
DROP TYPE PAL_CROSTON_STATISTICS_T;
CREATE TYPE PAL_CROSTON_STATISTICS_T AS TABLE ("NAME" VARCHAR (50), "VALUE" DOUBLE);
DROP TABLE PAL_CROSTON_PDATA_TBL;
CREATE COLUMN TABLE PAL_CROSTON_PDATA_TBL ("POSITION" INT,"SCHEMA_NAME" NVARCHAR(256),"TYPE_NAME" NVARCHAR (256),"PARAMETER_TYPE" VARCHAR (7));
INSERT INTO PAL_CROSTON_PDATA_TBL VALUES (1,'PALTEST','PAL_CROSTON_DATA_T','IN');
INSERT INTO PAL_CROSTON_PDATA_TBL VALUES (2,'PALTEST','PAL_CONTROL_T','IN');
INSERT INTO PAL_CROSTON_PDATA_TBL VALUES (3,'PALTEST','PAL_CROSTON_RESULT_T','OUT');
INSERT INTO PAL_CROSTON_PDATA_TBL VALUES (4,'PALTEST','PAL_CROSTON_STATISTICS_T','OUT');
CALL SYS.AFLLANG_WRAPPER_PROCEDURE_DROP('PALTEST','CROSTON_TEST_PROC');
CALL SYS.AFLLANG_WRAPPER_PROCEDURE_CREATE('AFLPAL','CROSTON', 'PALTEST', 'CROSTON_TEST_PROC', PAL_CROSTON_PDATA_TBL);
DROP TABLE #PAL_CONTROL_TBL;
CREATE LOCAL TEMPORARY COLUMN TABLE #PAL_CONTROL_TBL ("NAME" VARCHAR(100), "INTARGS" INT, "DOUBLEARGS" DOUBLE, "STRINGARGS" VARCHAR(100));
INSERT INTO #PAL_CONTROL_TBL VALUES ('RAW_DATA_COL',1,NULL,NULL);
INSERT INTO #PAL_CONTROL_TBL VALUES ('ALPHA', NULL,0.1,NULL);
INSERT INTO #PAL_CONTROL_TBL VALUES ('FORECAST_NUM',FORECAST_LENGTH_GOES_HERE, NULL,NULL);
INSERT INTO #PAL_CONTROL_TBL VALUES ('METHOD',0, NULL,NULL);
INSERT INTO #PAL_CONTROL_TBL VALUES('MEASURE_NAME',NULL,NULL,'MAPE');
DROP TABLE PAL_CROSTON_DATA_TBL;
CREATE COLUMN TABLE PAL_CROSTON_DATA_TBL LIKE PAL_CROSTON_DATA_T;
INSERT_QUERIES_GO_HERE DROP TABLE PAL_CROSTON_RESULT_TBL;
CREATE COLUMN TABLE PAL_CROSTON_RESULT_TBL LIKE PAL_CROSTON_RESULT_T;
DROP TABLE PAL_CROSTON_STATISTICS_TBL;
CREATE COLUMN TABLE PAL_CROSTON_STATISTICS_TBL LIKE PAL_CROSTON_STATISTICS_T;
CALL PALTEST.CROSTON_TEST_PROC(PAL_CROSTON_DATA_TBL, "#PAL_CONTROL_TBL", PAL_CROSTON_RESULT_TBL, PAL_CROSTON_STATISTICS_TBL) WITH OVERVIEW;
SELECT * FROM PAL_CROSTON_RESULT_TBL;