LOCAL i as Number

i = 0
x = 0
USE "Апрель"
SCAN
i = i + Сальдо
x = x + ЛастСальдо
ENDSCAN
MESSAGEBOX("Общая задолженность за апрель: " + ALLTRIM(STR(i, 11,2)))
MESSAGEBOX("начальное сальдо за апрель: " + ALLTRIM(STR(x, 11,2)))
*SORT TO "апр.dbf" ON Улица, Дом, Квартира


i = 0
USE "Май"
SCAN
i = i + Сальдо
x = x + ЛастСальдо
ENDSCAN
MESSAGEBOX("Общая задолженность за май: " + ALLTRIM(STR(i, 11,2)))
MESSAGEBOX("начальное сальдо за май: " + ALLTRIM(STR(x, 11,2)))
*SORT TO "ма.dbf" ON Улица, Дом, Квартира

i = 0
USE "Июнь"
SCAN
i = i + Сальдо
x = x + ЛастСальдо
ENDSCAN
MESSAGEBOX("Общая задолженность за июнь: " + ALLTRIM(STR(i, 11,2)))
MESSAGEBOX("начальное сальдо за июнь: " + ALLTRIM(STR(x, 11,2)))
*SORT TO "июн.dbf" ON Улица, Дом, Квартира

i = 0
USE "Июль"
SCAN
i = i + Сальдо
x = x + ЛастСальдо
ENDSCAN
MESSAGEBOX("Общая задолженность за июль: " + ALLTRIM(STR(i, 11,2)))
MESSAGEBOX("начальное сальдо за июль: " + ALLTRIM(STR(x, 11,2)))
*SORT TO "июл.dbf" ON Улица, Дом, Квартира







CLOSE TABLES