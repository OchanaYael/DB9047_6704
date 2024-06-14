ALTER TABLE Shift
ADD CONSTRAINT chk_Shift_Start_End CHECK (StartTime <> EndTime);


ALTER TABLE Ambulans
MODIFY status DEFAULT 'Available';



ALTER TABLE Volunteer
MODIFY Naame VARCHAR(20) NOT NULL;
