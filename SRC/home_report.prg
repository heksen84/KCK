PROCEDURE h_report(p1 as Character, p2 as Character)
*===============================
* ����� ����
*===============================
LOCAL ALL1 as Number
LOCAL ALL2 as Number
LOCAL ALL3 as Number
LOCAL ALL4 as Number
LOCAL ALL5 as Number
LOCAL ALL6 as Number
LOCAL ALL7 as Number
LOCAL ALL8 as Number
LOCAL ALL9 as Number

ALL1 = 0
ALL2 = 0
ALL3 = 0
ALL4 = 0
ALL5 = 0
ALL6 = 0
ALL7 = 0
ALL8 = 0
ALL9 = 0

*============================
* �������� ������
*============================
SELECT * FROM ALIAS() WHERE;
ALLTRIM(�����) = p1 .AND. ALLTRIM(���) = p2;
INTO TABLE DataDir+"home_report.dbf"

USE DataDir+"home_report"
SCAN
	ALL1 = ALL1 + �������
	ALL2 = ALL2 + ����������
	ALL3 = ALL3 + ���������
	ALL4 = ALL4 + ���������
	ALL5 = ALL5 + _451
	ALL6 = ALL6 + _441
	ALL7 = ALL7 + _334
	ALL8 = ALL8 + ��������� + _451 + _441 + _334
	ALL9 = ALL9 + ������
ENDSCAN

REPORT FORM "home_report" TO PRINTER PROMPT NODIALOG PREVIEW
_screen.ActiveForm.Release()
ENDPROC