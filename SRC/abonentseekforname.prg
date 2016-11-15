*----------------------------
* Поиск по фамилии и имени
*----------------------------
PROCEDURE AbonentSeekForName(f as Character, i as Character)
LOCATE FOR; 
ALLTRIM(f) = ALLTRIM(Фамилия) .AND.;
ALLTRIM(i) = ALLTRIM(Имя)
********DEBUG*********
*IF FOUND()
*MESSAGEBOX(фамилия)
*ENDIF
ENDPROC

