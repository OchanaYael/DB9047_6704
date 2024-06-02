
[General]
Version=1

[Preferences]
Username=
Password=2547
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=DRIVERINSHIFT
Count=100

[Record]
Name=VOLUNTEER_ID
Type=NUMBER
Size=
Data=List(select VOLUNTEER_ID from VOLUNTEER)
Master=

[Record]
Name=SHIFT_ID_
Type=NUMBER
Size=
Data=List(select SHIFT_ID_ from SHIFT)
Master=

