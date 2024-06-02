
[General]
Version=1

[Preferences]
Username=
Password=2090
Database=
DateFormat=dd-mm-yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=VOLUNTEER
Count=400

[Record]
Name=VOLUNTEER_ID
Type=NUMBER
Size=
Data=Sequence(11111)
Master=

[Record]
Name=NAAME
Type=VARCHAR2
Size=20
Data=FirstName + LastName
Master=

[Record]
Name=PHONNUM
Type=NUMBER
Size=
Data=[1111111111]
Master=

[Record]
Name=ADDRESS
Type=VARCHAR2
Size=40
Data=Address1
Master=

[Record]
Name=DATEOFBIRTH
Type=DATE
Size=
Data=Random(01/01/1980,01/01/2004)
Master=

