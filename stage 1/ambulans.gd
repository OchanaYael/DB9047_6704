
[General]
Version=1

[Preferences]
Username=
Password=2553
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=AMBULANS
Count=100

[Record]
Name=LOCAATION
Type=VARCHAR2
Size=15
Data=City
Master=

[Record]
Name=AMBULANCE_ID
Type=NUMBER
Size=
Data=Sequence(11111)
Master=

[Record]
Name=AMBULANCENUM
Type=NUMBER
Size=
Data=Sequence(111)
Master=

[Record]
Name=TIPE
Type=VARCHAR2
Size=10
Data=List('motorcycle','Van')
Master=

[Record]
Name=STATUS
Type=VARCHAR2
Size=15
Data=List('available','notavailable')
Master=

