
[General]
Version=1

[Preferences]
Username=
Password=2026
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=PARAMEDIC
Count=40

[Record]
Name=MEDICAL_DEGREE
Type=VARCHAR2
Size=25
Data=List('Technion','Tel Aviv University','Hebrew University')
Master=

[Record]
Name=SENIORITY
Type=NUMBER
Size=
Data=[1]
Master=

[Record]
Name=VOLUNTEER_ID
Type=NUMBER
Size=
Data=List(select VOLUNTEER_ID from VOLUNTEER)
Master=

