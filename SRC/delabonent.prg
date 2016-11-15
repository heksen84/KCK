IF MESSAGEBOX("Удалить абонента " + ALLTRIM(Фамилия) + "?", 4+32, _screen.Caption) = 6
DELETE
_screen.ActiveForm.Release()
ENDIF



