
[General]
Version=1

[Preferences]
Username=
Password=2272
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=MADICINSHIFT
Count=200

[Record]
Name=SHIFT_ID_
Type=NUMBER
Size=
Data=List(select SHIFT_ID_ from SHIFT)
Master=

[Record]
Name=VOLUNTEER_ID
Type=NUMBER
Size=
Data=List(select VOLUNTEER_ID from MEDIC)
Master=

