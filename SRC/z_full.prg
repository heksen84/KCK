MainForm.Grid1.RecordSource = "" && обнул€ю Grid
SELECT * FROM ALIAS() INTO TABLE "data\zavod.dbf" WHERE таб_номер != 0 ORDER BY таб_номер
SELECT zavod
SCAN
_out = _334
ENDSCAN
REPORT FORM "rep_zavod_full" TO PRINTER PREVIEW
CLOSE TABLES
USE DataDir+ALLTRIM(STR(basename))+"\"+tablename
MainForm.Grid1.RecordSource = tablename
MainForm.Grid1.Refresh()
