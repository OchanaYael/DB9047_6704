
[General]
Version=1

[Preferences]
Username=
Password=2046
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=DRIVER
Count=50

[Record]
Name=LICENSENUM
Type=NUMBER
Size=
Data=Sequence(11111)
Master=

[Record]
Name=VOLUNTEER_ID
Type=NUMBER
Size=
Data=List(select VOLUNTEER_ID from VOLUNTEER)
Master=

