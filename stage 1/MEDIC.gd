
[General]
Version=1

[Preferences]
Username=
Password=2249
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=MEDIC
Count=60

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

