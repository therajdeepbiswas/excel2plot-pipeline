SET SCHEMA PALTEST;
DROP TYPE PAL_FORECASTSLR_DATA_T;
CREATE TYPE PAL_FORECASTSLR_DATA_T AS TABLE( "TIMESTAMP" INTEGER, "Y" DOUBLE);
DROP TYPE PAL_FORECASTSLR_CONTROL_T;
CREATE TYPE PAL_FORECASTSLR_CONTROL_T AS TABLE( "NAME" VARCHAR (50), "INTARGS" INTEGER, "DOUBLEARGS" DOUBLE, "STRINGARGS" VARCHAR (100) );
DROP TYPE PAL_FORECASTSLR_RESULT_T;
CREATE TYPE PAL_FORECASTSLR_RESULT_T AS TABLE( "NAME" VARCHAR (50), "VALUE" DOUBLE );
DROP TYPE PAL_FORECASTSLR_FORECAST_T;
CREATE TYPE PAL_FORECASTSLR_FORECAST_T AS TABLE( "TIMESTAMP" INTEGER, "VALUE" DOUBLE );
DROP TABLE PAL_FORECASTSLR_PDATA_TBL;
CREATE COLUMN TABLE PAL_FORECASTSLR_PDATA_TBL("POSITION" INT,"SCHEMA_NAME" NVARCHAR(256),"TYPE_NAME" NVARCHAR (256),"PARAMETER_TYPE" VARCHAR (7));
INSERT INTO PAL_FORECASTSLR_PDATA_TBL VALUES (1,'PALTEST','PAL_FORECASTSLR_DATA_T','in');
INSERT INTO PAL_FORECASTSLR_PDATA_TBL VALUES (2,'PALTEST','PAL_FORECASTSLR_CONTROL_T','in');
INSERT INTO PAL_FORECASTSLR_PDATA_TBL VALUES (3,'PALTEST','PAL_FORECASTSLR_RESULT_T','out');
INSERT INTO PAL_FORECASTSLR_PDATA_TBL VALUES (4,'PALTEST','PAL_FORECASTSLR_FORECAST_T','out');
CALL SYS.AFLLANG_WRAPPER_PROCEDURE_DROP('PALTEST','PAL_FORECASTSLR_PROC');
CALL SYS.AFLLANG_WRAPPER_PROCEDURE_CREATE ('AFLPAL','LRWITHSEASONALADJUST','PALTEST','PAL_FORECASTSLR_PROC',PAL_FORECASTSLR_PDATA_TBL);
DROP TABLE PAL_FORECASTSLR_DATA_TBL;
CREATE COLUMN TABLE PAL_FORECASTSLR_DATA_TBL LIKE PAL_FORECASTSLR_DATA_T;
INSERT_QUERIES_GO_HERE DROP TABLE #PAL_CONTROL_TBL;
CREATE LOCAL TEMPORARY COLUMN TABLE #PAL_CONTROL_TBL ( "NAME" VARCHAR (50),"INTARGS" INTEGER,"DOUBLEARGS" DOUBLE,"STRINGARGS" VARCHAR (100));
INSERT INTO #PAL_CONTROL_TBL VALUES ('FORECAST_LENGTH', FORECAST_LENGTH_GOES_HERE ,null,null);
INSERT INTO #PAL_CONTROL_TBL VALUES ('TREND', null,0.9,null);
INSERT INTO #PAL_CONTROL_TBL VALUES ('AFFECT_FUTURE_ONLY', 1,null,null);
INSERT INTO #PAL_CONTROL_TBL VALUES ('SEASONALITY', 1,null,null);
INSERT INTO #PAL_CONTROL_TBL VALUES ('PERIODS', 4,null,null);
INSERT INTO #PAL_CONTROL_TBL VALUES ('MEASURE_NAME', null, null, 'MSE');
DROP TABLE PAL_FORECASTSLR_RESULT_TBL;
CREATE COLUMN TABLE PAL_FORECASTSLR_RESULT_TBL LIKE PAL_FORECASTSLR_RESULT_T;
DROP TABLE PAL_FORECASTSLR_FORECAST_TBL;
CREATE COLUMN TABLE PAL_FORECASTSLR_FORECAST_TBL LIKE PAL_FORECASTSLR_FORECAST_T;
CALL PALTEST.PAL_FORECASTSLR_PROC(PAL_FORECASTSLR_DATA_TBL, "#PAL_CONTROL_TBL",PAL_FORECASTSLR_RESULT_TBL, PAL_FORECASTSLR_FORECAST_TBL) WITH OVERVIEW;
SELECT * FROM PAL_FORECASTSLR_FORECAST_TBL;