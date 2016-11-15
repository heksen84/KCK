LOCAL n as Number

IF ALLTRIM(TableName) = m(12)
MESSAGEBOX("Год завершен!", 48, _screen.Caption)
RETURN
ENDIF

IF FILE(DataDir+ALLTRIM(STR(basename))+"\"+m(getMonthNum(tablename)+1)+".dbf")
MESSAGEBOX("Вы в архивном режиме!", 64, _screen.Caption)
RETURN
ENDIF

IF (MESSAGEBOX("Закрыть месяц?", 4 + 64, _screen.Caption) = 6)
WAIT "Подождите. Идет закрытие месяца..." NOWAIT WINDOW

MainForm.Grid1.RecordSource = ""

COPY STRUCTURE TO DataDir+ALLTRIM(STR(basename))+"\"+m(getMonthNum(tablename)+1)
USE DataDir+ALLTRIM(STR(basename))+"\"+m(getMonthNum(tablename)+1)

APPEND FROM; 
DataDir+ALLTRIM(STR(basename))+"\"+tablename;
FIELDS 	Фамилия, ; 
		Имя, ; 
		Отчество, ;
		Дом, ;
		Улица, ;
		Квартира, ;
		Площадь, ;
		код_тарифа, ;
		Договор, ;
		Цех, ;
		таб_номер, ;
		Примечание, ;
		ЛастСальдо

CLOSE TABLES
USE DataDir+ALLTRIM(STR(basename))+"\"+m(getMonthNum(tablename))   IN  a
USE DataDir+ALLTRIM(STR(basename))+"\"+m(getMonthNum(tablename)+1) IN  b
SELECT b
SCAN
Replace b.ЛастСальдо WITH a.Сальдо
SKIP IN a
ENDSCAN


SCAN
	IF EMPTY(код_тарифа)
	n = Stavka1
	ENDIF
	IF код_тарифа = 1
	n = Stavka1
	ENDIF
	IF код_тарифа = 2
	n = Stavka2
	ENDIF
	IF код_тарифа = 3
	n = Stavka3
	ENDIF
	
		Replace Начислено WITH Площадь*n
		Replace К_оплате  WITH ЛастСальдо+Начислено
		Replace Сальдо    WITH К_оплате-Коррекция-_441-_451-_334-_681

ENDSCAN
WAIT CLEAR

tablename = ALLTRIM(m(getMonthNum(tablename)+1))
SAVE TO DataDir+"system.mem"
RESTORE FROM DataDir+"system.mem" ADDITIVE

USE DataDir+ALLTRIM(STR(basename))+"\"+tablename
MainForm.Grid1.RecordSource = tablename
MainForm.Label1.Refresh()
MESSAGEBOX("Месяц закрыт!", 64, "Завершено")
ENDIF
