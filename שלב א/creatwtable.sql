CREATE TABLE ambulans
(
  Locaation VARCHAR(15) NOT NULL,
  Ambulance_ID INT NOT NULL,
  ambulancenum INT NOT NULL,
  tipe VARCHAR(10) NOT NULL,
  status VARCHAR(15) NOT NULL,
  PRIMARY KEY (Ambulance_ID)
);

CREATE TABLE Volunteer
(
  Volunteer_ID INT NOT NULL,
  Naame VARCHAR(20) NOT NULL,
  PhonNum INT NOT NULL,
  Address VARCHAR(40) NOT NULL,
  DateofBirth DATE NOT NULL,
  PRIMARY KEY (Volunteer_ID)
);

CREATE TABLE Event
(
  Event_ID INT NOT NULL,
  Deescription VARCHAR(40) NOT NULL,
  Locaation VARCHAR(25) NOT NULL,
  Date_Time DATE NOT NULL,
  PRIMARY KEY (Event_ID)
);

CREATE TABLE Paramedic
(
  Medical_degree VARCHAR(25) NOT NULL,
  seniority INT NOT NULL,
  Volunteer_ID INT NOT NULL,
  PRIMARY KEY (Volunteer_ID),
  FOREIGN KEY (Volunteer_ID) REFERENCES Volunteer(Volunteer_ID)
);

CREATE TABLE Driver
(
  licensenum INT NOT NULL,
  Volunteer_ID INT NOT NULL,
  PRIMARY KEY (Volunteer_ID),
  FOREIGN KEY (Volunteer_ID) REFERENCES Volunteer(Volunteer_ID)
);

CREATE TABLE Medic
(
  seniority INT NOT NULL,
  Volunteer_ID INT NOT NULL,
  PRIMARY KEY (Volunteer_ID),
  FOREIGN KEY (Volunteer_ID) REFERENCES Volunteer(Volunteer_ID)
);

CREATE TABLE drivertoambu
(
  Volunteer_ID INT NOT NULL,
  Ambulance_ID INT NOT NULL,
  PRIMARY KEY (Volunteer_ID, Ambulance_ID),
  FOREIGN KEY (Volunteer_ID) REFERENCES Driver(Volunteer_ID),
  FOREIGN KEY (Ambulance_ID) REFERENCES ambulans(Ambulance_ID)
);

CREATE TABLE ambutoevent
(
  Ambulance_ID INT NOT NULL,
  Event_ID INT NOT NULL,
  PRIMARY KEY (Ambulance_ID, Event_ID),
  FOREIGN KEY (Ambulance_ID) REFERENCES ambulans(Ambulance_ID),
  FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID)
);

CREATE TABLE Shift
(
  Shift_ID_ INT NOT NULL,
  Daate DATE NOT NULL,
  StartTime VARCHAR(5) NOT NULL,
  EndTime VARCHAR(5) NOT NULL,
  Event_ID INT NOT NULL,
  Volunteer_ID INT NOT NULL,
  PRIMARY KEY (Shift_ID_),
  FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID),
  FOREIGN KEY (Volunteer_ID) REFERENCES Paramedic(Volunteer_ID)
);

CREATE TABLE madicinshift
(
  Shift_ID_ INT NOT NULL,
  Volunteer_ID INT NOT NULL,
  PRIMARY KEY (Shift_ID_, Volunteer_ID),
  FOREIGN KEY (Shift_ID_) REFERENCES Shift(Shift_ID_),
  FOREIGN KEY (Volunteer_ID) REFERENCES Medic(Volunteer_ID)
);

CREATE TABLE driverinshift
(
  Volunteer_ID INT NOT NULL,
  Shift_ID_ INT NOT NULL,
  PRIMARY KEY (Volunteer_ID, Shift_ID_),
  FOREIGN KEY (Volunteer_ID) REFERENCES Driver(Volunteer_ID),
  FOREIGN KEY (Shift_ID_) REFERENCES Shift(Shift_ID_)
);
