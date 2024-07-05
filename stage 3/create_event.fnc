CREATE OR REPLACE FUNCTION create_event(p_event_date IN DATE, p_location IN VARCHAR2, p_description IN VARCHAR2, p_event_id OUT INT, p_ambulance_count OUT INT)
RETURN INT IS
    v_shift_id_ SHIFT.Shift_ID_%TYPE;
BEGIN
    -- Check if the date is not too old (not before 01.01.2000)
    IF p_event_date < TO_DATE('2000-01-01', 'YYYY-MM-DD') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Event date cannot be before 01.01.2000');
    END IF;
    
    -- Find a shift on the same day
    SELECT Shift_ID_
    INTO v_shift_id_
    FROM Shift
    WHERE Daate = TRUNC(p_event_date); -- Truncate time portion
    
    -- Determine number of ambulances based on event description
    CASE UPPER(p_description)
        WHEN 'BIRTH' THEN p_ambulance_count := 1;
        WHEN 'FALL INJURY' THEN p_ambulance_count := 1;
        WHEN 'POISONING' THEN p_ambulance_count := 1;
        WHEN 'CAR ACCIDENT' THEN p_ambulance_count := 2;
        WHEN 'SHOOTING ATTACK' THEN p_ambulance_count := 3;
        ELSE p_ambulance_count := 2; -- Default for any other description
    END CASE;

    -- Get the next Event_ID from the sequence
    SELECT COALESCE(MAX(Event_ID), 0) + 1
    INTO p_event_id
    FROM Event;
    
    -- Insert into Event table
    INSERT INTO Event (Event_ID, Deescription, Locaation, Date_Time, Shift_ID_)
    VALUES (p_event_id, p_description, p_location, p_event_date, v_shift_id_);
 
    -- Return the event ID
    RETURN p_event_id;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'No shift found for the given date');
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20003, 'Error inserting into Event table');
    WHEN OTHERS THEN
        RAISE;
commit;      
END;
/
