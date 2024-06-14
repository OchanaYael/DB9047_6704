SELECT 
    v.Volunteer_ID,
    v.Naame,
    COUNT(s.Event_ID) AS NumberOfEvents
FROM 
    Volunteer v
JOIN 
    shift s ON v.Volunteer_ID = s.Volunteer_ID
GROUP BY 
    v.Volunteer_ID, v.Naame
ORDER BY 
    NumberOfEvents DESC;
    
    
    
    

SELECT 
    e.Event_ID,
    e.Deescription,
    e.Locaation,
    e.Date_Time,
    COUNT(ae.Ambulance_ID) AS NumberOfAmbulances
FROM 
    Event e
LEFT JOIN 
    ambutoevent ae ON e.Event_ID = ae.Event_ID
GROUP BY 
    e.Event_ID,
    e.Deescription,
    e.Locaation,
    e.Date_Time
ORDER BY 
    e.Date_Time;
    
    
    
    
    
SELECT
    v.Volunteer_ID,
    v.Naame,
    m.seniority,
    COUNT(DISTINCT ms.Shift_ID_) AS NumberOfEvents
FROM
    Medic m
JOIN
    Volunteer v ON m.Volunteer_ID = v.Volunteer_ID
JOIN
    madicinshift ms ON m.Volunteer_ID = ms.Volunteer_ID
JOIN
    shift s ON ms.Shift_ID_ = s.Shift_ID_
WHERE
    m.seniority > 2
GROUP BY
    v.Volunteer_ID, v.Naame, m.seniority
HAVING
    COUNT(DISTINCT ms.Shift_ID_) >= 10
ORDER BY
    NumberOfEvents DESC;
    
    
    
    
    
SELECT
    e.Locaation,
    COUNT(e.Event_ID) AS NumberOfBirthEvents
FROM
    Event e
WHERE
    e.Deescription = 'Birth'
GROUP BY
    e.Locaation
ORDER BY
    NumberOfBirthEvents DESC;
    
    
    
    
    
DELETE FROM ambulans
WHERE Ambulance_ID NOT IN (
    SELECT ambulans.Ambulance_ID
    FROM ambulans
    JOIN ambutoevent ON ambulans.Ambulance_ID = ambutoevent.Ambulance_ID
)
AND status = 'notavailable'
AND Ambulance_ID NOT IN (
    SELECT drivertoambu.Ambulance_ID
    FROM drivertoambu
);







DELETE FROM Volunteer
WHERE Volunteer_ID NOT IN (
    SELECT Volunteer_ID
    FROM Medic
)
AND Volunteer_ID NOT IN (
    SELECT Volunteer_ID
    FROM Driver
)
AND Volunteer_ID NOT IN (
    SELECT Volunteer_ID
    FROM Paramedic
)
AND PhonNum LIKE '5%';






UPDATE Paramedic
SET Seniority = Seniority + 1
WHERE Volunteer_ID IN (
    SELECT p.Volunteer_ID
    FROM Paramedic p
    JOIN Shift s ON p.Volunteer_ID = s.Volunteer_ID
    GROUP BY p.Volunteer_ID
    HAVING COUNT(DISTINCT s.Event_ID) >= 10
);
commit







UPDATE ambulans
SET status = 'notavailable'
WHERE Ambulance_ID IN (
    SELECT Ambulance_ID
    FROM ambutoevent
    GROUP BY Ambulance_ID
    HAVING COUNT(*) > 10
);     
    
        
    
    
            
    
    
    
    
    
    
    
    
    
