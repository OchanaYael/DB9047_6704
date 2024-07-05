PL/SQL Developer Test script 3.0
76

DECLARE
    v_event_id INT;
    v_ambulance_count INT;
    v_description VARCHAR2(100);
    v_location VARCHAR2(100);
    v_event_date DATE;
    v_ambulance_type VARCHAR2(20);

    CURSOR c_shift_dates IS
        SELECT DISTINCT Daate FROM SHIFT WHERE Daate BETWEEN TO_DATE('2020-01-01', 'YYYY-MM-DD') AND TO_DATE('2024-11-01', 'YYYY-MM-DD');
    TYPE t_shift_dates IS TABLE OF SHIFT.Daate%TYPE INDEX BY PLS_INTEGER;
    v_shift_date_list t_shift_dates;
    v_shift_count PLS_INTEGER;
    v_random_index PLS_INTEGER;
BEGIN
    -- Generate random description
    v_description := CASE ROUND(DBMS_RANDOM.VALUE(1, 6))
                        WHEN 1 THEN 'Poisoning'
                        WHEN 2 THEN 'Fall Injury'
                        WHEN 3 THEN 'Shooting Attack'
                        WHEN 4 THEN 'Car Accident'
                        WHEN 5 THEN 'Burn'
                        WHEN 6 THEN 'Birth'
                     END;

    -- Get a list of distinct dates from the SHIFT table
    OPEN c_shift_dates;
    FETCH c_shift_dates BULK COLLECT INTO v_shift_date_list;
    v_shift_count := v_shift_date_list.COUNT;
    CLOSE c_shift_dates;

    IF v_shift_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'No available shifts in the specified date range.');
    END IF;

    -- Select a random date from the list
    v_random_index := ROUND(DBMS_RANDOM.VALUE(1, v_shift_count));
    v_event_date := v_shift_date_list(v_random_index);

    -- Generate random location
    v_location := CASE ROUND(DBMS_RANDOM.VALUE(1, 10))
                    WHEN 1 THEN 'Jerusalem'
                    WHEN 2 THEN 'Tel Aviv'
                    WHEN 3 THEN 'Haifa'
                    WHEN 4 THEN 'Rishon LeZion'
                    WHEN 5 THEN 'Petah Tikva'
                    WHEN 6 THEN 'Ashdod'
                    WHEN 7 THEN 'Netanya'
                    WHEN 8 THEN 'Beer Sheva'
                    WHEN 9 THEN 'Holon'
                    WHEN 10 THEN 'Bnei Brak'
                 END;

    -- Generate random ambulance type
    v_ambulance_type := CASE ROUND(DBMS_RANDOM.VALUE(1, 2))
                            WHEN 1 THEN 'motorcycle'
                            WHEN 2 THEN 'Van'
                        END;

    -- Call create_event function
    v_event_id := create_event(v_event_date, v_location, v_description, v_event_id, v_ambulance_count);

    -- Output event details
    DBMS_OUTPUT.PUT_LINE('Created Event:');
    DBMS_OUTPUT.PUT_LINE('Event ID: ' || v_event_id);
    DBMS_OUTPUT.PUT_LINE('Description: ' || v_description);
    DBMS_OUTPUT.PUT_LINE('Location: ' || v_location);
    DBMS_OUTPUT.PUT_LINE('Event Date: ' || TO_CHAR(v_event_date, 'DD-MON-YYYY'));

    -- Call AssignAmbulanceToEvent procedure
    FOR i IN 1..v_ambulance_count LOOP
        AssignAmbulanceToEvent(v_event_id, v_ambulance_type);
    END LOOP;
END;

0
0
