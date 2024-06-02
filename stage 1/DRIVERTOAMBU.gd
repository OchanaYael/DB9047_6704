
[General]
Version=1

[Preferences]
Username=
Password=2832
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=DRIVERTOAMBU
Count=200

[Record]
Name=VOLUNTEER_ID
Type=NUMBER
Size=
Data=List(select VOLUNTEER_ID from DRIVER)
Master=

[Record]
Name=AMBULANCE_ID
Type=NUMBER
Size=
Data=List(select AMBULANCE_ID from AMBULANS)
Master=

