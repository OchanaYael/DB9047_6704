
[General]
Version=1

[Preferences]
Username=
Password=2389
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=SHIFT
Count=400

[Record]
Name=SHIFT_ID_
Type=NUMBER
Size=
Data=Sequence(11111)
Master=

[Record]
Name=DAATE
Type=DATE
Size=
Data=Random(01/01/2020,01/01/2024)
Master=

[Record]
Name=STARTTIME
Type=VARCHAR2
Size=5
Data=List('00:00'.'12:000')
Master=

[Record]
Name=ENDTIME
Type=VARCHAR2
Size=5
Data=List('06:00'.'18:000')
Master=

[Record]
Name=EVENT_ID
Type=NUMBER
Size=
Data=List(select EVENT_ID from EVENT)
Master=

[Record]
Name=VOLUNTEER_ID
Type=NUMBER
Size=
Data=List(select VOLUNTEER_ID from PARAMEDIC)
Master=

