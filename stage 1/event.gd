
[General]
Version=1

[Preferences]
Username=
Password=2661
Database=
DateFormat=dd-mm-yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=EVENT
Count=400

[Record]
Name=EVENT_ID
Type=NUMBER
Size=
Data=Sequence(11111)
Master=

[Record]
Name=DEESCRIPTION
Type=VARCHAR2
Size=40
Data=List('Poisoning','Fall Injury','Shooting Attack','Car Accident','Burn','Birth')
Master=

[Record]
Name=LOCAATION
Type=VARCHAR2
Size=25
Data=City
Master=

[Record]
Name=DATE_TIME
Type=DATE
Size=
Data=Random(01/01/2020,01/01/2024)
Master=

