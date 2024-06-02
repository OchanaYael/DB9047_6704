-- Inserting data into ambulans table
INSERT INTO ambulans (Locaation, Ambulance_ID, ambulancenum, tipe, status) VALUES ('Tel Aviv', 1, 101, 'TypeA', 'Available');
INSERT INTO ambulans (Locaation, Ambulance_ID, ambulancenum, tipe, status) VALUES ('Jerusalem', 2, 102, 'TypeB', 'Unavailable');
INSERT INTO ambulans (Locaation, Ambulance_ID, ambulancenum, tipe, status) VALUES ('Haifa', 3, 103, 'TypeC', 'Available');
INSERT INTO ambulans (Locaation, Ambulance_ID, ambulancenum, tipe, status) VALUES ('Beersheba', 4, 104, 'TypeD', 'Unavailable');
INSERT INTO ambulans (Locaation, Ambulance_ID, ambulancenum, tipe, status) VALUES ('Rishon LeZion', 5, 105, 'TypeA', 'Available');
INSERT INTO ambulans (Locaation, Ambulance_ID, ambulancenum, tipe, status) VALUES ('Petah Tikva', 6, 106, 'TypeB', 'Unavailable');
INSERT INTO ambulans (Locaation, Ambulance_ID, ambulancenum, tipe, status) VALUES ('Ashdod', 7, 107, 'TypeC', 'Available');
INSERT INTO ambulans (Locaation, Ambulance_ID, ambulancenum, tipe, status) VALUES ('Netanya', 8, 108, 'TypeD', 'Unavailable');
INSERT INTO ambulans (Locaation, Ambulance_ID, ambulancenum, tipe, status) VALUES ('Holon', 9, 109, 'TypeA', 'Available');
INSERT INTO ambulans (Locaation, Ambulance_ID, ambulancenum, tipe, status) VALUES ('Bnei Brak', 10, 110, 'TypeB', 'Unavailable');

-- Inserting data into Volunteer table
INSERT INTO Volunteer (Volunteer_ID, Naame, PhonNum, Address, DateofBirth) VALUES (1, 'John Doe', 1234567890, '123 Herzl St, Tel Aviv', DATE '1980-01-01');
INSERT INTO Volunteer (Volunteer_ID, Naame, PhonNum, Address, DateofBirth) VALUES (2, 'Jane Smith', 2345678901, '456 Ben Yehuda St, Jerusalem', DATE '1985-02-02');
INSERT INTO Volunteer (Volunteer_ID, Naame, PhonNum, Address, DateofBirth) VALUES (3, 'Emily Jones', 3456789012, '789 Hanassi St, Haifa', DATE '1990-03-03');
INSERT INTO Volunteer (Volunteer_ID, Naame, PhonNum, Address, DateofBirth) VALUES (4, 'Michael Brown', 4567890123, '101 David Ben Gurion Blvd, Beersheba', DATE '1995-04-04');
INSERT INTO Volunteer (Volunteer_ID, Naame, PhonNum, Address, DateofBirth) VALUES (5, 'Sarah Davis', 5678901234, '202 Rothschild Blvd, Rishon LeZion', DATE '2000-05-05');
INSERT INTO Volunteer (Volunteer_ID, Naame, PhonNum, Address, DateofBirth) VALUES (6, 'David Wilson', 6789012345, '303 Jabotinsky St, Petah Tikva', DATE '1981-06-06');
INSERT INTO Volunteer (Volunteer_ID, Naame, PhonNum, Address, DateofBirth) VALUES (7, 'Laura Martinez', 7890123456, '404 Bialik St, Ashdod', DATE '1986-07-07');
INSERT INTO Volunteer (Volunteer_ID, Naame, PhonNum, Address, DateofBirth) VALUES (8, 'James Garcia', 8901234567, '505 Herzl St, Netanya', DATE '1991-08-08');
INSERT INTO Volunteer (Volunteer_ID, Naame, PhonNum, Address, DateofBirth) VALUES (9, 'Emma Anderson', 9012345678, '606 Weizmann St, Holon', DATE '1996-09-09');
INSERT INTO Volunteer (Volunteer_ID, Naame, PhonNum, Address, DateofBirth) VALUES (10, 'Daniel Taylor', 1234567809, '707 Jabotinsky St, Bnei Brak', DATE '2001-10-10');

-- Inserting data into Event table
INSERT INTO Event (Event_ID, Deescription, Locaation, Date_Time) VALUES (1, 'Birth', 'Tel Aviv', DATE '2024-01-01');
INSERT INTO Event (Event_ID, Deescription, Locaation, Date_Time) VALUES (2, 'Burn', 'Jerusalem', DATE '2024-02-01');
INSERT INTO Event (Event_ID, Deescription, Locaation, Date_Time) VALUES (3, 'Shooting Attack', 'Haifa', DATE '2024-03-01');
INSERT INTO Event (Event_ID, Deescription, Locaation, Date_Time) VALUES (4, 'Car Accident', 'Beersheba', DATE '2024-04-01');
INSERT INTO Event (Event_ID, Deescription, Locaation, Date_Time) VALUES (5, 'Heart Attack', 'Rishon LeZion', DATE '2024-05-01');
INSERT INTO Event (Event_ID, Deescription, Locaation, Date_Time) VALUES (6, 'Stroke', 'Petah Tikva', DATE '2024-06-01');
INSERT INTO Event (Event_ID, Deescription, Locaation, Date_Time) VALUES (7, 'Drowning', 'Ashdod', DATE '2024-07-01');
INSERT INTO Event (Event_ID, Deescription, Locaation, Date_Time) VALUES (8, 'Electrocution', 'Netanya', DATE '2024-08-01');
INSERT INTO Event (Event_ID, Deescription, Locaation, Date_Time) VALUES (9, 'Fall Injury', 'Holon', DATE '2024-09-01');
INSERT INTO Event (Event_ID, Deescription, Locaation, Date_Time) VALUES (10, 'Poisoning', 'Bnei Brak', DATE '2024-10-01');

-- Inserting data into Paramedic table
INSERT INTO Paramedic (Medical_degree, seniority, Volunteer_ID) VALUES ('Hebrew University', 5, 1);
INSERT INTO Paramedic (Medical_degree, seniority, Volunteer_ID) VALUES ('Tel Aviv University', 4, 2);
INSERT INTO Paramedic (Medical_degree, seniority, Volunteer_ID) VALUES ('Technion', 3, 3);
INSERT INTO Paramedic (Medical_degree, seniority, Volunteer_ID) VALUES ('Ben-Gurion University', 2, 4);
INSERT INTO Paramedic (Medical_degree, seniority, Volunteer_ID) VALUES ('Bar-Ilan University', 1, 5);
INSERT INTO Paramedic (Medical_degree, seniority, Volunteer_ID) VALUES ('Weizmann Institute', 6, 6);
INSERT INTO Paramedic (Medical_degree, seniority, Volunteer_ID) VALUES ('Haifa University', 7, 7);
INSERT INTO Paramedic (Medical_degree, seniority, Volunteer_ID) VALUES ('Ariel University', 8, 8);
INSERT INTO Paramedic (Medical_degree, seniority, Volunteer_ID) VALUES ('IDC Herzliya', 9, 9);
INSERT INTO Paramedic (Medical_degree, seniority, Volunteer_ID) VALUES ('Open University', 10, 10);

-- Inserting data into Driver table
INSERT INTO Driver (licensenum, Volunteer_ID) VALUES (11111, 1);
INSERT INTO Driver (licensenum, Volunteer_ID) VALUES (22222, 2);
INSERT INTO Driver (licensenum, Volunteer_ID) VALUES (33333, 3);
INSERT INTO Driver (licensenum, Volunteer_ID) VALUES (44444, 4);
INSERT INTO Driver (licensenum, Volunteer_ID) VALUES (55555, 5);
INSERT INTO Driver (licensenum, Volunteer_ID) VALUES (66666, 6);
INSERT INTO Driver (licensenum, Volunteer_ID) VALUES (77777, 7);
INSERT INTO Driver (licensenum, Volunteer_ID) VALUES (88888, 8);
INSERT INTO Driver (licensenum, Volunteer_ID) VALUES (99999, 9);
INSERT INTO Driver (licensenum, Volunteer_ID) VALUES (101010, 10);

-- Inserting data into Medic table
INSERT INTO Medic (seniority, Volunteer_ID) VALUES (5, 1);
INSERT INTO Medic (seniority, Volunteer_ID) VALUES (4, 2);
INSERT INTO Medic (seniority, Volunteer_ID) VALUES (3, 3);
INSERT INTO Medic (seniority, Volunteer_ID) VALUES (2, 4);
INSERT INTO Medic (seniority, Volunteer_ID) VALUES (1, 5);
INSERT INTO Medic (seniority, Volunteer_ID) VALUES (6, 6);
INSERT INTO Medic (seniority, Volunteer_ID) VALUES (7, 7);
INSERT INTO Medic (seniority, Volunteer_ID) VALUES (8, 8);
INSERT INTO Medic (seniority, Volunteer_ID) VALUES (9, 9);
INSERT INTO Medic (seniority, Volunteer_ID) VALUES (10, 10);

-- Inserting data into drivertoambu table
INSERT INTO drivertoambu (Volunteer_ID, Ambulance_ID) VALUES (1, 1);
INSERT INTO drivertoambu (Volunteer_ID, Ambulance_ID) VALUES (2, 2);
INSERT INTO drivertoambu (Volunteer_ID, Ambulance_ID) VALUES (3, 3);
INSERT INTO drivertoambu (Volunteer_ID, Ambulance_ID) VALUES (4, 4);
INSERT INTO drivertoambu (Volunteer_ID, Ambulance_ID) VALUES (5, 5);
INSERT INTO drivertoambu (Volunteer_ID, Ambulance_ID) VALUES (6, 6);
INSERT INTO drivertoambu (Volunteer_ID, Ambulance_ID) VALUES (7, 7);
INSERT INTO drivertoambu (Volunteer_ID, Ambulance_ID) VALUES (8, 8);
INSERT INTO drivertoambu (Volunteer_ID, Ambulance_ID) VALUES (9, 9);
INSERT INTO drivertoambu (Volunteer_ID, Ambulance_ID) VALUES (10, 10);

-- Inserting data into ambutoevent table
INSERT INTO ambutoevent (Ambulance_ID, Event_ID) VALUES (1, 1);
INSERT INTO ambutoevent (Ambulance_ID, Event_ID) VALUES (2, 2);
INSERT INTO ambutoevent (Ambulance_ID, Event_ID) VALUES (3, 3);
INSERT INTO ambutoevent (Ambulance_ID, Event_ID) VALUES (4, 4);
INSERT INTO ambutoevent (Ambulance_ID, Event_ID) VALUES (5, 5);
INSERT INTO ambutoevent (Ambulance_ID, Event_ID) VALUES (6, 6);
INSERT INTO ambutoevent (Ambulance_ID, Event_ID) VALUES (7, 7);
INSERT INTO ambutoevent (Ambulance_ID, Event_ID) VALUES (8, 8);
INSERT INTO ambutoevent (Ambulance_ID, Event_ID) VALUES (9, 9);
INSERT INTO ambutoevent (Ambulance_ID, Event_ID) VALUES (10, 10);

-- Inserting data into Shift table
INSERT INTO Shift (Shift_ID_, Daate, StartTime, EndTime, Event_ID, Volunteer_ID) VALUES (1, DATE '2024-01-01', '08:00', '16:00', 1, 1);
INSERT INTO Shift (Shift_ID_, Daate, StartTime, EndTime, Event_ID, Volunteer_ID) VALUES (2, DATE '2024-02-01', '08:00', '16:00', 2, 2);
INSERT INTO Shift (Shift_ID_, Daate, StartTime, EndTime, Event_ID, Volunteer_ID) VALUES (3, DATE '2024-03-01', '08:00', '16:00', 3, 3);
INSERT INTO Shift (Shift_ID_, Daate, StartTime, EndTime, Event_ID, Volunteer_ID) VALUES (4, DATE '2024-04-01', '08:00', '16:00', 4, 4);
INSERT INTO Shift (Shift_ID_, Daate, StartTime, EndTime, Event_ID, Volunteer_ID) VALUES (5, DATE '2024-05-01', '08:00', '16:00', 5, 5);
INSERT INTO Shift (Shift_ID_, Daate, StartTime, EndTime, Event_ID, Volunteer_ID) VALUES (6, DATE '2024-06-01', '08:00', '16:00', 6, 6);
INSERT INTO Shift (Shift_ID_, Daate, StartTime, EndTime, Event_ID, Volunteer_ID) VALUES (7, DATE '2024-07-01', '08:00', '16:00', 7, 7);
INSERT INTO Shift (Shift_ID_, Daate, StartTime, EndTime, Event_ID, Volunteer_ID) VALUES (8, DATE '2024-08-01', '08:00', '16:00', 8, 8);
INSERT INTO Shift (Shift_ID_, Daate, StartTime, EndTime, Event_ID, Volunteer_ID) VALUES (9, DATE '2024-09-01', '08:00', '16:00', 9, 9);
INSERT INTO Shift (Shift_ID_, Daate, StartTime, EndTime, Event_ID, Volunteer_ID) VALUES (10, DATE '2024-10-01', '08:00', '16:00', 10, 10);

-- Inserting data into madicinshift table
INSERT INTO madicinshift (Shift_ID_, Volunteer_ID) VALUES (1, 1);
INSERT INTO madicinshift (Shift_ID_, Volunteer_ID) VALUES (2, 2);
INSERT INTO madicinshift (Shift_ID_, Volunteer_ID) VALUES (3, 3);
INSERT INTO madicinshift (Shift_ID_, Volunteer_ID) VALUES (4, 4);
INSERT INTO madicinshift (Shift_ID_, Volunteer_ID) VALUES (5, 5);
INSERT INTO madicinshift (Shift_ID_, Volunteer_ID) VALUES (6, 6);
INSERT INTO madicinshift (Shift_ID_, Volunteer_ID) VALUES (7, 7);
INSERT INTO madicinshift (Shift_ID_, Volunteer_ID) VALUES (8, 8);
INSERT INTO madicinshift (Shift_ID_, Volunteer_ID) VALUES (9, 9);
INSERT INTO madicinshift (Shift_ID_, Volunteer_ID) VALUES (10, 10);

-- Inserting data into driverinshift table
INSERT INTO driverinshift (Volunteer_ID, Shift_ID_) VALUES (1, 1);
INSERT INTO driverinshift (Volunteer_ID, Shift_ID_) VALUES (2, 2);
INSERT INTO driverinshift (Volunteer_ID, Shift_ID_) VALUES (3, 3);
INSERT INTO driverinshift (Volunteer_ID, Shift_ID_) VALUES (4, 4);
INSERT INTO driverinshift (Volunteer_ID, Shift_ID_) VALUES (5, 5);
INSERT INTO driverinshift (Volunteer_ID, Shift_ID_) VALUES (6, 6);
INSERT INTO driverinshift (Volunteer_ID, Shift_ID_) VALUES (7, 7);
INSERT INTO driverinshift (Volunteer_ID, Shift_ID_) VALUES (8, 8);
INSERT INTO driverinshift (Volunteer_ID, Shift_ID_) VALUES (9, 9);
INSERT INTO driverinshift (Volunteer_ID, Shift_ID_) VALUES (10, 10);
