SELECT 
    Event_ID,
    Deescription AS Event_Description,
    Locaation AS Event_Location,
    Date_Time AS Event_Date_Time
FROM 
    Event
WHERE 
    Date_Time = TO_DATE(&<name="date" hint="enter a date" type="date">);






SELECT 
    Ambulance_ID,
    Locaation AS Ambulance_Location,
    ambulancenum AS Ambulance_Number,
    tipe AS Ambulance_Type,
    status AS Ambulance_Status
FROM 
    ambulans
WHERE 
    status = &<name="status" hint="Select a status" list="'available','notavailable'">;
    
    
    
    
    
SELECT Volunteer_ID, Naame, PhonNum, Address, DateofBirth
FROM Volunteer
WHERE Volunteer_ID IN (
    SELECT Volunteer_ID
    FROM Shift
) AND PhonNum= &<name="num_prefix_list" hint= "A 10-digit number" type="integer">;





SELECT DISTINCT
    v.Volunteer_ID,
    v.Naame AS Volunteer_Name,
    v.PhonNum AS Volunteer_Phone_Number,
    v.Address AS Volunteer_Address,
    v.DateofBirth AS Volunteer_Date_of_Birth
FROM 
    Volunteer v
JOIN 
    Shift s ON v.Volunteer_ID = s.Volunteer_ID
WHERE 
    TRUNC(s.Daate) = TO_DATE(&<name="date" hint="enter a date" type="date">);
    
