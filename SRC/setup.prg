*====================================================
* setup.prg
* ������ �.�.
* 2005(�)
*====================================================
_screen.WindowState = 2
_screen.Caption    = "��� v1.1"

SET PROCEDURE TO "procedures"
SET EXCLUSIVE ON
SET SAFETY OFF
SET TALK OFF
SET DELETED ON
SET DATE GERMAN && ���� ����
SET ANSI ON 	&& ���� �������� ������� SQL - SELECT �� ���������
SET ESCAPE OFF

SET COLLATE TO 'RUSSIAN' && ����� ���������� ���������� ����� - �������
SET EXACT ON

#DEFINE _COMPANYNAME	" "
#DEFINE _COMPANYADRESS	" "
#DEFINE _COMPANYRNN		" "
#DEFINE _COMPANYBANK	" "
#DEFINE _COMPANYSCHET	0

#DEFINE _MONEY   		"�����"
#DEFINE _DATA    		"DATA\"

PUBLIC UserName  		as Character
PUBLIC BaseName  		as Number
PUBLIC TableName 		as Character
PUBLIC CompanyName 		as Character 
PUBLIC CompanyAdress 	as Character 
PUBLIC CompanyRnn 		as Character 
PUBLIC CompanyBank 		as Character 
PUBLIC CompanySchet 	as Number
PUBLIC Money	 		as Character
PUBLIC Stavka1 			as Number
PUBLIC Stavka2 			as Number
PUBLIC Stavka3 			as Number
PUBLIC _Out				as Number
PUBLIC DataDir 			as Character
PUBLIC MainForm  		as Form
PUBLIC CompID 			as Character
PUBLIC m(12) 			as Character

PUBLIC curpos as Number

*=========[ ������ ]===========
PUBLIC Acess as Boolean
PUBLIC Pswrd as Character
*==============================
m(1)  = "������"
m(2)  = "�������"
m(3)  = "����"
m(4)  = "������"
m(5)  = "���"
m(6)  = "����"
m(7)  = "����"
m(8)  = "������"
m(9)  = "��������"
m(10) = "�������"
m(11) = "������"
m(12) = "�������"

*=========================
*
*=========================
CompID = " "
IF !FILE(_DATA+"system.mem")
UserName  		= "Admin"
BaseName  		= YEAR(DATE())
TableName 		= m(6)
CompanyName 	= _COMPANYNAME
CompanyAdress 	= _COMPANYADRESS
CompanyRnn	 	= _COMPANYRNN
CompanyBank	 	= _COMPANYBANK
CompanySchet	= _COMPANYSCHET
Money	  		= _MONEY
Stavka1			=  0.00
Stavka2			=  0.00
Stavka3			=  0.00
DataDir			= _DATA
SAVE TO _DATA+"system.mem"
ENDIF

RESTORE FROM (_DATA+"system.mem") ADDITIVE
*===========[ splash ]===========
DO FORM "titlescreen"
WAIT '' TIMEOUT 3
titlescreen.Release()

IF (ID() != CompID)
MESSAGEBOX("�����������������!", 16, "��������� �����������")
QUIT
ENDIF
*=========================
*
*=========================
IF (!FILE(DataDir+ALLTRIM(STR(BaseName))+"\"+TableName+".dbf"))
MESSAGEBOX("���� �� "+TableName+" �� ����������!!!", 16, _screen.Caption)
QUIT
ENDIF

_screen.Visible = .T.
_screen.Icon = 'SMAL_IKONKA.ICO'
USE DataDir+ALLTRIM(STR(BaseName))+"\"+TableName+".dbf"
WAIT "��������..." NOWAIT WINDOW
PACK		 && �������� ���������� ��� �������� �������
DO TableSort && ���������� ����� ������� ������
WAIT CLEAR

ON SHUTDOWN DO "endwork"

DO "Main.mpr"
DO FORM "main"
MainForm = _Screen.ActiveForm
READ EVENTS && ������ �������� �����


