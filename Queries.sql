SET search_path TO MediCare;

-- 1. Fetch patient details, their reports, lab tests, and medicines for a specific patient
SELECT 
    p.Pat_id,
    p.Name AS Patient_Name,
    pr.Report_id,
    pr.Comment,
    pr.Date AS Report_Date,
    lt.Lab_test_name,
    lr.Result_of_test,
    m.Name AS Medicine_Name,
    mp.Qty_bought
FROM 
    Patient p
LEFT JOIN 
    Patient_Report pr ON p.Pat_id = pr.Pat_id
LEFT JOIN 
    Lab_report lr ON pr.Report_id = lr.Report_id
LEFT JOIN 
    Lab_Test lt ON lr.Lab_test_id = lt.Lab_test_id
LEFT JOIN 
    Medicine_patient mp ON pr.Report_id = mp.Report_id
LEFT JOIN 
    Medicine m ON mp.Med_id = m.Med_id
WHERE 
    p.Pat_id = 45444; 

-- 2. Get upcoming appointments of doctors after April 1, 2025
SELECT 
    d.License_no,
    d.Name AS Doctor_Name,
    d.Weekday AS Available_Days,
    d.Shifts AS Available_Shifts,
    d.Role AS Specialisation,
    a.Appo_id,
    a.Date_time,
    a.Status
FROM 
    Doctor d
LEFT JOIN 
    Appointments a ON d.License_no = a.Doctor_id
WHERE 
    a.Date_time >= '2025-04-01'
ORDER BY 
    a.Date_time;

-- 3. Count number of appointments per hour book for each doctor
SELECT 
    Doctor_id,
    DATE_TRUNC('hour', Date_time) AS Hour_Block,
    COUNT(*) AS Appointment_Count
FROM 
    Appointments
GROUP BY 
    Doctor_id, Hour_Block
ORDER BY 
    Appointment_Count DESC;

-- 4. Get doctors and their patients with lab tests that have no result yet
SELECT 
    d.Name AS Doctor_Name, 
    p.Name AS Patient_Name,
    lt.Lab_test_name, 
    lr.Result_of_test 
FROM Appointments a 
JOIN Doctor d ON a.Doctor_id = d.License_no 
JOIN Patient p ON p.Pat_id = a.Patient_id   
JOIN Patient_Report pr ON pr.Pat_id = a.Patient_id 
JOIN Lab_report lr ON lr.Report_id = pr.Report_id 
JOIN Lab_Test lt ON lt.Lab_test_id = lr.Lab_test_id 
WHERE lr.Result_of_test IS NULL;

-- 5. Calculate average recovery days per doctor
SELECT 
    d.License_no AS Doctor_License,
    d.Name AS Doctor_Name,
    AVG(a.Discharge_date - a.Allocation_Date) AS Avg_Recovery_Days
FROM 
    Allocate a
JOIN 
    Appointments ap ON a.Pat_id = ap.Patient_id
JOIN 
    Doctor d ON ap.Doctor_id = d.License_no
WHERE 
    a.Discharge_date IS NOT NULL
GROUP BY 
    d.License_no, d.Name;

-- 6. List available beds along with room information
SELECT 
    b.Room_no,
    r.Room_type,
    r.Room_charge,
    b.Bed_no,
    b.Status
FROM Bed b
JOIN Room r ON b.Room_no = r.Room_no
WHERE b.Status = 'Available';

-- 7. Find the most sold medicine by quantity
SELECT 
    m.Med_id,
    m.Name,
    SUM(mp.Qty_bought) AS Total_Sold
FROM Medicine_patient mp
JOIN Medicine m ON mp.Med_id = m.Med_id
GROUP BY m.Med_id, m.Name
ORDER BY Total_Sold DESC
LIMIT 1;

-- 8. Show pending bills for discharged patients whose due date has passed
SELECT 
    b.Invoice_no,
    b.Patient_id,
    b.Due_date,
    b.Status,
    b.Total_amount
FROM Bill b
WHERE b.Status = 'Pending' 
  AND b.Due_date < CURRENT_DATE
  AND b.Patient_id IN (
        SELECT Pat_id
        FROM Allocate
        WHERE Discharge_date IS NOT NULL
);

-- 9. Monthly count of ambulance service requests
SELECT 
    DATE_TRUNC('month', Date_time) AS Month,
    COUNT(*) AS Total_Requests
FROM Ambulance_Service
GROUP BY Month
ORDER BY Month;

-- 10. List rooms with no available beds
SELECT R.Room_no, R.Room_type
FROM Room R
WHERE NOT EXISTS (
    SELECT B.Bed_no
    FROM Bed B
    WHERE B.Room_no = R.Room_no AND B.Status = 'Available'
);
