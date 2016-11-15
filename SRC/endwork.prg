*========================
* Завершение работы
*========================
SET SYSMENU TO DEFAULT
CLEAR EVENTS
CLOSE TABLES
*============ Удаляю отчеты =============
IF FILE(DataDir+"home_report.dbf")
ERASE DataDir+"home_report.dbf"
ENDIF

IF FILE(DataDir+"ksk_report.dbf")
ERASE DataDir+"ksk_report.dbf"
ENDIF
*============ Выход ====================
QUIT