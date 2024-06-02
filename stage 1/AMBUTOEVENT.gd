
[General]
Version=1

[Preferences]
Username=
Password=2147
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=AMBUTOEVENT
Count=200

[Record]
Name=AMBULANCE_ID
Type=NUMBER
Size=
Data=List(select AMBULANCE_ID from AMBULANS)
Master=

[Record]
Name=EVENT_ID
Type=NUMBER
Size=
Data=List(select EVENT_ID from EVENT)
Master=

