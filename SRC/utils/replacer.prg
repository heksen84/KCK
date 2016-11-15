SET COLLATE TO 'RUSSIAN'

use "iulgood" in a
use "июль" in b

select a
scan
*REPLACE a.квартира WITH b.квартира
*REPLACE a.площадь WITH b.площадь
*REPLACE a.код_тарифа WITH b.код_тарифа
REPLACE a.Ластсальдо with b.ластсальдо
*REPLACE a.коррекция WITH b.коррекция
*REPLACE a._451 WITH b._451
*REPLACE a._441 WITH b._441
*REPLACE a._334 WITH b._334
*REPLACE a._681 WITH b._681
skip in b
endscan

close tables