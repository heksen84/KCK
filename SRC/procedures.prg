*=============================================
* Функция вовращает порядковый номер месяца
*=============================================
FUNCTION getMonthNum(mes as Character)
LOCAL num as Integer
mes = ALLTRIM(mes)
DO CASE
		CASE mes = m(1)
		num = 1
		CASE mes = m(2)
		num = 2
		CASE mes = m(3)
		num = 3
		CASE mes = m(4)
		num = 4
		CASE mes = m(5)
		num = 5
		CASE mes = m(6)
		num = 6
		CASE mes = m(7)
		num = 7
		CASE mes = m(8)
		num = 8
		CASE mes = m(9)
		num = 9
		CASE mes = m(10)
		num = 10
		CASE mes = m(11)
		num = 11
		CASE mes = m(12)
		num = 12
ENDCASE
RETURN num
ENDFUNC

*=======================================
* Функция вовращает XOR значение строки
*=======================================
FUNCTION getXOR(pswrd as Character)
RETURN pswrd
ENDFUNC