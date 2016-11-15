IF (MESSAGEBOX("Выполнить начисление для всех абонентов?", 4 + 64, _screen.Caption) = 6)
SAVE TO DataDir+"system.mem"
p = RECNO()
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
GO p
MESSAGEBOX("Изменения внесены", 64, "Ок")
ENDIF