SET SCHEMA PALTEST;

DROP TYPE PAL_ARIMA_DATA_T;
CREATE TYPE PAL_ARIMA_DATA_T AS TABLE("TIMESTAMP" INTEGER, "X1" DOUBLE);

DROP TYPE PAL_ARIMA_CONTROL_T;
CREATE TYPE PAL_ARIMA_CONTROL_T AS TABLE("NAME" VARCHAR (50), "INTARGS" INTEGER, "DOUBLEARGS" DOUBLE, "STRINGARGS" VARCHAR (100));

DROP TYPE PAL_ARIMA_MODEL_T;
CREATE TYPE PAL_ARIMA_MODEL_T AS TABLE("NAME" VARCHAR (50), "VALUE" VARCHAR (5000));

DROP TABLE PAL_ARIMA_PDATA_TBL;
CREATE COLUMN TABLE PAL_ARIMA_PDATA_TBL("POSITION" INT, "SCHEMA_NAME" NVARCHAR(256), "TYPE_NAME" NVARCHAR(256), "PARAMETER_TYPE" VARCHAR(7));

INSERT INTO PAL_ARIMA_PDATA_TBL VALUES (1, 'PALTEST', 'PAL_ARIMA_DATA_T', 'IN');
INSERT INTO PAL_ARIMA_PDATA_TBL VALUES (2, 'PALTEST', 'PAL_ARIMA_CONTROL_T', 'IN');
INSERT INTO PAL_ARIMA_PDATA_TBL VALUES (3, 'PALTEST', 'PAL_ARIMA_MODEL_T', 'OUT');

CALL SYS.AFLLANG_WRAPPER_PROCEDURE_DROP('PALTEST', 'PAL_ARIMATRAIN_PROC');
CALL SYS.AFLLANG_WRAPPER_PROCEDURE_CREATE('AFLPAL','ARIMATRAIN', 'PALTEST', 'PAL_ARIMATRAIN_PROC', PAL_ARIMA_PDATA_TBL);

DROP TABLE PAL_ARIMA_DATA_TBL;
CREATE COLUMN TABLE PAL_ARIMA_DATA_TBL LIKE PAL_ARIMA_DATA_T;
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(1, 0.8);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(2, 1.2);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(3, 1.34845613096197);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(4, 1.32261090809898);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(5, 1.38095306748554);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(6, 1.54066648969168);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(7, 1.50920806756785);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(8, 1.48461408893443);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(9, 1.43784887380224);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(10, 1.64251548718992);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(11, 1.74292337447476);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(12, 1.91137546943257);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(13, 2.07735796176367);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(14, 2.01741246166924);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(15, 1.87176938196573);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(16, 1.83354723357744);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(17, 1.66104978144571);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(18, 1.65115984070812);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(19, 1.69470966154593);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(20, 1.70459802935728);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(21, 1.61246059980916);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(22, 1.53949706614636);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(23, 1.59231354902055);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(24, 1.81741927705578);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(25, 1.80224252773564);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(26, 1.81881576781466);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(27, 1.78089755157948);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(28, 1.61473635574416);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(29, 1.42002147867225);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(30, 1.49971641345022);

INSERT INTO PAL_ARIMA_DATA_TBL VALUES(1, 3121.86);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(2, 4173.6);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(3, 7372.43);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(4, 2706.61);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(5, 7648.25);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(6, 3381.56);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(7, 5108.55);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(8, 1648.65);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(9, 3251.58);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(10, 2372.84);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(11, 1289.87);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(12, 7155.89);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(13, 1057.96);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(14, 5925.38);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(15, 6785.64);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(16, 5520.18);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(17, 4830.95);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(18, 10129.81);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(19, 1506.63);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(20, 734);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(21, 5994.03);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(22, 10299.96);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(23, 11144.31);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(24, 1705.31);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(25, 3463.38);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(26, 2766.3);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(27, 7099.24);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(28, 897.35);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(29, 2091.63);
INSERT INTO PAL_ARIMA_DATA_TBL VALUES(30, 924.4);

DROP TABLE #PAL_CONTROL_TBL;
CREATE LOCAL TEMPORARY COLUMN TABLE #PAL_CONTROL_TBL ("NAME" VARCHAR(50), "INTARGS" INTEGER, "DOUBLEARGS" DOUBLE, "STRINGARGS" VARCHAR (100));
INSERT INTO #PAL_CONTROL_TBL VALUES ('P', 1,null,null);
INSERT INTO #PAL_CONTROL_TBL VALUES ('Q', 1,null,null);
INSERT INTO #PAL_CONTROL_TBL VALUES ('D', 0,null,null);
INSERT INTO #PAL_CONTROL_TBL VALUES ('METHOD', 1,null,null);
INSERT INTO #PAL_CONTROL_TBL VALUES ('STATIONARY', 1,null,null);

DROP TABLE PAL_ARIMA_MODEL_TBL;
CREATE COLUMN TABLE PAL_ARIMA_MODEL_TBL LIKE PAL_ARIMA_MODEL_T;
CALL PALTEST.PAL_ARIMATRAIN_PROC(PAL_ARIMA_DATA_TBL, "#PAL_CONTROL_TBL", PAL_ARIMA_MODEL_TBL) WITH OVERVIEW;
SELECT * FROM PAL_ARIMA_MODEL_TBL;
