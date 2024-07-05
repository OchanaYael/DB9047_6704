PL/SQL Developer Test script 3.0
33

DECLARE
    v_paramedic_id Volunteer.Volunteer_ID%TYPE;
    v_medic1_id Volunteer.Volunteer_ID%TYPE;
    v_medic2_id Volunteer.Volunteer_ID%TYPE;
    v_driver_id Volunteer.Volunteer_ID%TYPE;
    v_ambulance_id Ambulans.Ambulance_ID%TYPE;
    v_return_code NUMBER;
BEGIN
    -- Call the function to find volunteers with the least shifts
    v_return_code := FindVolunteersWithLeastShifts(v_paramedic_id, v_medic1_id, v_medic2_id, v_driver_id);

    -- Check the return code from the function
    IF v_return_code = -1 THEN
        DBMS_OUTPUT.PUT_LINE('Error: No available volunteers or ambulances found.');
    ELSIF v_return_code = -2 THEN
        DBMS_OUTPUT.PUT_LINE('Error: Other errors occurred.');
    ELSE
        -- Call the procedure to create a new shift with the volunteers found
        CreateNewShiftWithVolunteers(v_paramedic_id, v_medic1_id, v_medic2_id, v_driver_id);

        -- Output success message
        DBMS_OUTPUT.PUT_LINE('New shift successfully created with volunteers:');
        DBMS_OUTPUT.PUT_LINE('Paramedic Volunteer_ID: ' || v_paramedic_id);
        DBMS_OUTPUT.PUT_LINE('Medic1 Volunteer_ID: ' || v_medic1_id);
        DBMS_OUTPUT.PUT_LINE('Medic2 Volunteer_ID: ' || v_medic2_id);
        DBMS_OUTPUT.PUT_LINE('Driver Volunteer_ID: ' || v_driver_id);
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END;

0
0
