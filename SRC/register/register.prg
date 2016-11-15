_screen.Visible = .F.

SET RESOURCE OFF
SET SAFETY OFF

IF !FILE("system.mem")
QUIT
	ELSE
		RESTORE FROM "system.mem"
		CompID = ID()
		SAVE TO "system.mem"
		MESSAGEBOX("Зарегестрировано!", 48, ":)")
ENDIF
