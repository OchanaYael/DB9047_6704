CREATE OR REPLACE PROCEDURE CreateNewShiftWithVolunteers(
    p_paramedic_id IN Volunteer.Volunteer_ID%TYPE,
    p_medic1_id IN Volunteer.Volunteer_ID%TYPE,
    p_medic2_id IN Volunteer.Volunteer_ID%TYPE,
    p_driver_id IN Volunteer.Volunteer_ID%TYPE
)
IS
    v_shift_id NUMBER;
    v_date DATE;
    v_start_time VARCHAR2(5) := '08:00';
    v_end_time VARCHAR2(5) := '16:00';
BEGIN
    -- Generate a random date between 01.01.2020 and 01.11.2024
    SELECT TRUNC(TO_DATE('2020-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE(1, 1780))
    INTO v_date
    FROM DUAL;

    -- Find a unique Shift_ID_
    SELECT NVL(MAX(Shift_ID_), 0) + 1 INTO v_shift_id FROM Shift;

    -- Insert the new shift
    INSERT INTO Shift (Shift_ID_, Daate, StartTime, EndTime, Volunteer_ID)
    VALUES (v_shift_id, v_date, v_start_time, v_end_time, p_paramedic_id);

    -- Insert medics into madicinshift table
    INSERT INTO madicinshift (Shift_ID_, Volunteer_ID) VALUES (v_shift_id, p_medic1_id);
    INSERT INTO madicinshift (Shift_ID_, Volunteer_ID) VALUES (v_shift_id, p_medic2_id);

    -- Insert driver into driverinshift table
    INSERT INTO driverinshift (Volunteer_ID, Shift_ID_) VALUES (p_driver_id, v_shift_id);

    -- Print the shift and volunteer data
    DBMS_OUTPUT.PUT_LINE('Shift Details:');
    FOR r IN (SELECT * FROM Shift WHERE Shift_ID_ = v_shift_id) LOOP
        DBMS_OUTPUT.PUT_LINE('Shift_ID_: ' || r.Shift_ID_ || ', Date: ' || r.Daate || ', Start Time: ' || r.StartTime || ', End Time: ' || r.EndTime || ', Paramedic Volunteer_ID: ' || r.Volunteer_ID);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Medic Volunteers in Shift:');
    FOR r IN (SELECT * FROM madicinshift WHERE Shift_ID_ = v_shift_id) LOOP
        DBMS_OUTPUT.PUT_LINE('Volunteer_ID: ' || r.Volunteer_ID);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Driver Volunteer in Shift:');
    FOR r IN (SELECT * FROM driverinshift WHERE Shift_ID_ = v_shift_id) LOOP
        DBMS_OUTPUT.PUT_LINE('Volunteer_ID: ' || r.Volunteer_ID);
    END LOOP;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
        ROLLBACK;
END;
/
