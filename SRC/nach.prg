*==========================================
* Начисление
* Используется для формы userinfo
*==========================================
LOCAL n as Number

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

REPLACE Начислено WITH Площадь*n
REPLACE к_оплате  WITH Площадь*n