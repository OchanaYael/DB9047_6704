CREATE OR REPLACE PROCEDURE AssignAmbulanceToEvent(
    p_event_id IN Event.Event_ID%TYPE,
    p_ambulance_type IN ambulans.tipe%TYPE
)
IS
    v_ambulance_id ambulans.Ambulance_ID%TYPE;
    v_event_exists INT;
    v_ambulance_exists INT;
    v_ambulance_count INT;

    -- Custom exception for event not found
    event_not_found EXCEPTION;
    -- Custom exception for ambulance not found
    ambulance_not_found EXCEPTION;
    -- Custom exception for no available ambulance
    no_available_ambulance EXCEPTION;

    -- Record type to hold ambulance details
    TYPE ambulance_rec IS RECORD (
        Ambulance_ID ambulans.Ambulance_ID%TYPE,
        Locaation ambulans.Locaation%TYPE,
        ambulancenum ambulans.ambulancenum%TYPE,
        tipe ambulans.tipe%TYPE,
        status ambulans.status%TYPE
    );

    ambulance_details ambulance_rec;

    -- Record type to hold event details
    TYPE event_rec IS RECORD (
        Event_ID Event.Event_ID%TYPE,
        Deescription Event.Deescription%TYPE,
        Locaation Event.Locaation%TYPE,
        Date_Time Event.Date_Time%TYPE,
        Shift_ID_ Event.Shift_ID_%TYPE
    );

    event_details event_rec;

BEGIN
    -- Check if the event exists
    SELECT COUNT(*) INTO v_event_exists FROM Event WHERE Event_ID = p_event_id;
    IF v_event_exists = 0 THEN
        RAISE event_not_found;
    END IF;

    -- Check if there are ambulances of the specified type
    SELECT COUNT(*) INTO v_ambulance_exists FROM ambulans WHERE tipe = p_ambulance_type;
    IF v_ambulance_exists = 0 THEN
        RAISE ambulance_not_found;
    END IF;

    -- Find an available ambulance of the specified type
    SELECT COUNT(*) INTO v_ambulance_count 
    FROM ambulans 
    WHERE tipe = p_ambulance_type AND status = 'available';
    
    IF v_ambulance_count = 0 THEN
        RAISE no_available_ambulance;
    END IF;

    -- Use a cursor to safely select the first available ambulance
    DECLARE
        CURSOR c_ambulance IS
            SELECT Ambulance_ID
            FROM ambulans
            WHERE tipe = p_ambulance_type AND status = 'available'
            ORDER BY DBMS_RANDOM.VALUE;
    BEGIN
        OPEN c_ambulance;
        FETCH c_ambulance INTO v_ambulance_id;
        CLOSE c_ambulance;
    END;

    -- Assign the ambulance to the event
    INSERT INTO ambutoevent (Ambulance_ID, Event_ID) 
    VALUES (v_ambulance_id, p_event_id);

    -- Update the status of the ambulance to 'assigned'
    UPDATE ambulans
    SET status = 'Unavailable'
    WHERE Ambulance_ID = v_ambulance_id;

    -- Fetch and display the assigned ambulance details
    SELECT Ambulance_ID, Locaation, ambulancenum, tipe, status 
    INTO ambulance_details
    FROM ambulans 
    WHERE Ambulance_ID = v_ambulance_id;

    -- Fetch and display the event details
    SELECT Event_ID, Deescription, Locaation, Date_Time, Shift_ID_ 
    INTO event_details
    FROM Event 
    WHERE Event_ID = p_event_id;

    DBMS_OUTPUT.PUT_LINE('Ambulance Assigned:');
    DBMS_OUTPUT.PUT_LINE('Ambulance_ID: ' || ambulance_details.Ambulance_ID || 
                         ', Location: ' || ambulance_details.Locaation || 
                         ', Ambulance Number: ' || ambulance_details.ambulancenum || 
                         ', Type: ' || ambulance_details.tipe || 
                         ', Status: ' || ambulance_details.status);

    DBMS_OUTPUT.PUT_LINE('Event Details:');
    DBMS_OUTPUT.PUT_LINE('Event_ID: ' || event_details.Event_ID || 
                         ', Description: ' || event_details.Deescription || 
                         ', Location: ' || event_details.Locaation || 
                         ', Date and Time: ' || event_details.Date_Time || 
                         ', Shift ID: ' || event_details.Shift_ID_);

    COMMIT;

EXCEPTION
    WHEN event_not_found THEN
        DBMS_OUTPUT.PUT_LINE('Error: Event with ID ' || p_event_id || ' does not exist.');
    WHEN ambulance_not_found THEN
        DBMS_OUTPUT.PUT_LINE('Error: No ambulances of type ' || p_ambulance_type || ' found.');
    WHEN no_available_ambulance THEN
        DBMS_OUTPUT.PUT_LINE('Error: No available ambulances of type ' || p_ambulance_type || ' at the moment.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END AssignAmbulanceToEvent;
/
