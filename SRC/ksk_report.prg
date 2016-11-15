*============================================
*
*
*
*============================================
LOCAL _street as Character
LOCAL _home   as Character

LOCAL ALL0	  as Number
LOCAL ALL1	  as Number
LOCAL ALL2	  as Number
LOCAL ALL3	  as Number
LOCAL ALL4	  as Number
LOCAL ALL5	  as Number
LOCAL ALL6	  as Number
LOCAL ALL7	  as Number
LOCAL ALL8	  as Number

ALL0 = 0
ALL1 = 0
ALL2 = 0
ALL3 = 0
ALL4 = 0
ALL5 = 0
ALL6 = 0
ALL7 = 0
ALL8 = 0

_street = " "
_home   = " "

MainForm.Grid1.RecordSource = "" && обнуляю Grid
COPY STRUCTURE TO DataDir+"ksk_report.dbf"
USE DataDir+"ksk_report" IN a && таблица отчета
USE DataDir+ALLTRIM(STR(basename))+"\"+tablename IN b && основная таблица

SELECT b
SCAN
	IF  ALLTRIM(_street) = ALLTRIM(b.улица) AND;
  		ALLTRIM(_home)   = ALLTRIM(b.дом)
  		
  		Replace a.Площадь 		WITH a.Площадь    + b.Площадь
		Replace a.Начислено 	WITH a.Начислено  + b.Начислено
		Replace a.к_оплате  	WITH a.к_оплате   + b.к_оплате
		Replace a.коррекция  	WITH a.коррекция  + b.коррекция
		Replace a._451 		 	WITH a._451       + b._451
		Replace a._441 		 	WITH a._441       + b._441
		Replace a._334 		 	WITH a._334       + b._334
		Replace a._681 		 	WITH a._681       + b._681
		Replace a.ЛастСальдо 	WITH a.ЛастСальдо + b.ЛастСальдо
		Replace a.Сальдо 		WITH a.Сальдо + b.Сальдо
&&(a.ЛастСальдо + a.Начислено)-a.коррекция-a._451-a._441-a._334-a._681
		
		ELSE
			APPEND BLANK IN a
			
			Replace a.Улица 		WITH b.Улица
			Replace a.Дом 			WITH b.Дом
			Replace a.Площадь 		WITH b.Площадь
			Replace a.Начислено 	WITH b.Начислено
			Replace a.к_оплате  	WITH b.к_оплате
			Replace a.коррекция  	WITH b.коррекция
			Replace a._451 		 	WITH b._451
			Replace a._441 		 	WITH b._441
			Replace a._334 		 	WITH b._334
			Replace a._681 		 	WITH b._681
			Replace a.ЛастСальдо 	WITH b.ЛастСальдо
			Replace a.Сальдо 		WITH b.Сальдо
ENDIF
		_street = ALLTRIM(a.улица)
		_home   = ALLTRIM(a.дом)
ENDSCAN


SELECT a
SCAN
ALL0 = ALL0 + Площадь
ALL1 = ALL1 + ЛастСальдо
ALL2 = ALL2 + Начислено
ALL3 = ALL3 + Коррекция
ALL4 = ALL4 + _451
ALL5 = ALL5 + _441
ALL6 = ALL6 + _334
ALL7 = ALL7 + Коррекция + _451 + _441 + _334
ALL8 = ALL8 + Сальдо
ENDSCAN

REPORT FORM "ksk_report" PREVIEW
*===========================================
* восстанавливаю основную таблицу
*===========================================
CLOSE TABLES
USE DataDir+ALLTRIM(STR(basename))+"\"+tablename
MainForm.Grid1.RecordSource = tablename


