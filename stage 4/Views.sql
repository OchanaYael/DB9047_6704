CREATE VIEW EventSummaryView AS
SELECT
    e.evid AS EventID,
    e.EveName AS EventName,
    e.evedate AS EventDate,
    e.evelocation AS EventLocation,
    e.EvResponsibillity AS EventResponsibility,
    e.evedescribe AS EventDescription,
    t.teid AS TeamID,
    t.tename AS TeamName,
    t.teaddress AS TeamAddress,
    t.tephone AS TeamPhone,
    t.teemail AS TeamEmail,
    r.roname AS RoleName,
    eb.boname AS EmergencyBodyName,
    eb.bophone AS EmergencyBodyPhone,
    eb.readinesslevel AS ReadinessLevel
FROM
    EVENT e
JOIN
    ACTIN a ON e.evid = a.evid
JOIN
    TEAMP t ON a.teid = t.teid
JOIN
    ROLESP r ON t.roid = r.roid
LEFT JOIN
    EMERGENBODIES eb ON e.evid = eb.evid;
    
SELECT *
FROM EventSummaryView;
    
SELECT TeamName, RoleName, COUNT(*) AS EventCount
FROM EventSummaryView
GROUP BY TeamName, RoleName
ORDER BY TeamName, RoleName 


SELECT EventID, EventName, EventDate, EventLocation, EventResponsibility, EventDescription,
       EmergencyBodyName, EmergencyBodyPhone, ReadinessLevel
FROM EventSummaryView
WHERE EmergencyBodyName IS NOT NULL
ORDER BY EventDate;


CREATE VIEW AmbulanceUsageSummary AS
SELECT
    a.Ambulance_ID,
    a.Locaation AS AmbulanceLocation,
    a.tipe AS AmbulanceType,
    COUNT(ae.Event_ID) AS NumOfAssignments,
    MIN(s.Daate) AS FirstAssignmentDate,
    MAX(s.Daate) AS LastAssignmentDate,
    a.status AS AmbulanceStatus
FROM ambulans a
LEFT JOIN ambutoevent ae ON a.Ambulance_ID = ae.Ambulance_ID
LEFT JOIN ourEvent e ON ae.Event_ID = e.Event_ID
LEFT JOIN Shift s ON e.Shift_ID_ = s.Shift_ID_
GROUP BY a.Ambulance_ID, a.Locaation, a.tipe, a.status;

SELECT *
FROM AmbulanceUsageSummary;


SELECT
    Ambulance_ID,
    AmbulanceLocation,
    AmbulanceType,
    NumOfAssignments,
    FirstAssignmentDate,
    LastAssignmentDate,
    AmbulanceStatus
FROM AmbulanceUsageSummary
WHERE NumOfAssignments > 0
ORDER BY LastAssignmentDate DESC;
  


SELECT
    Ambulance_ID,
    AmbulanceLocation,
    AmbulanceType,
    NumOfAssignments,
    FirstAssignmentDate,
    LastAssignmentDate,
    AmbulanceStatus
FROM AmbulanceUsageSummary
WHERE LastAssignmentDate >= ADD_MONTHS(SYSDATE, -1)
ORDER BY LastAssignmentDate DESC;

