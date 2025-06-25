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

-- 5. Identify long-staying or frequently visiting patients and their lab tests
SELECT 
    a.Pat_id,
    a.Allocation_Date,
    COUNT(DISTINCT a.Allocation_Date) AS total_visits,
    MAX(COALESCE(a.Discharge_date, CURRENT_DATE) - a.Allocation_Date) AS total_days_stayed,
    COUNT(DISTINCT lr.Lab_test_id) AS total_lab_tests
FROM Allocate a
LEFT JOIN Patient_Report pr ON a.Pat_id = pr.Pat_id
LEFT JOIN Lab_report lr ON pr.Report_id = lr.Report_id
GROUP BY a.Pat_id, a.Allocation_Date
HAVING 
    COUNT(DISTINCT a.Allocation_Date) > 2 
    OR MAX(COALESCE(a.Discharge_date, CURRENT_DATE) - a.Allocation_Date) > 10
    OR COUNT(DISTINCT lr.Lab_test_id) > 5;

-- 6. Calculate average recovery days per doctor
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

-- 7. List available beds along with room information
SELECT 
    b.Room_no,
    r.Room_type,
    r.Room_charge,
    b.Bed_no,
    b.Status
FROM Bed b
JOIN Room r ON b.Room_no = r.Room_no
WHERE b.Status = 'Available';

-- 8. Find the most sold medicine by quantity
SELECT 
    m.Med_id,
    m.Name,
    SUM(mp.Qty_bought) AS Total_Sold
FROM Medicine_patient mp
JOIN Medicine m ON mp.Med_id = m.Med_id
GROUP BY m.Med_id, m.Name
ORDER BY Total_Sold DESC
LIMIT 1;

-- 9. Most frequent report comment for ICU patients in the past year
SELECT 
    pr.Comment,
    COUNT(*) AS Frequency
FROM Allocate a
JOIN Room r ON a.Room_id = r.Room_no
JOIN Patient_Report pr ON a.Pat_id = pr.Pat_id
WHERE 
    r.Room_type = 'ICU'
    AND a.Allocation_Date >= CURRENT_DATE - INTERVAL '12 months'
    AND pr.Date >= CURRENT_DATE - INTERVAL '12 months'
GROUP BY pr.Comment
ORDER BY Frequency DESC
LIMIT 1;

-- 10. Show pending bills for discharged patients whose due date has passed
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

-- 11. Monthly count of ambulance service requests
SELECT 
    DATE_TRUNC('month', Date_time) AS Month,
    COUNT(*) AS Total_Requests
FROM Ambulance_Service
GROUP BY Month
ORDER BY Month;

-- 12. Department with the most patients between April 2024 and April 2025
SELECT 
    d.Department_id,
    dept.Name AS Department_Name,
    COUNT(DISTINCT a.Patient_id) AS Total_Patients
FROM Appointments a
JOIN Doctor d ON a.Doctor_id = d.License_no
JOIN Department dept ON d.Department_id = dept.Department_id
WHERE a.Date_time BETWEEN '2024-04-01' AND '2025-04-01' 
GROUP BY d.Department_id, dept.Name
ORDER BY Total_Patients DESC
LIMIT 1;

-- 13. Identify doctors with lowest patient retention rates
SELECT
    a.Doctor_id,
    COUNT(DISTINCT a.Patient_id) AS Unique_Patients,
    COUNT(*) AS Total_Appointments,
    ROUND(COUNT(*)::DECIMAL / COUNT(DISTINCT a.Patient_id), 2) AS Approx_Retention_Rate
FROM
    Appointments a
GROUP BY
    a.Doctor_id
HAVING COUNT(DISTINCT a.Patient_id) > 0
ORDER BY
    Approx_Retention_Rate ASC
LIMIT 5;

-- 14. Count how many times each disease has been treated
SELECT 
    Disease, 
    COUNT(*) AS Treatment_Count
FROM 
    Patient_Report
WHERE 
    Disease IS NOT NULL
GROUP BY 
    Disease
ORDER BY 
    Treatment_Count DESC;

-- 15. Patients treated by more than one doctor for a disease
SELECT
    pr.Pat_id,
    p.Name AS Patient_Name,
    pr.Disease,
    COUNT(DISTINCT a.Doctor_id) AS Num_Doctors
FROM
    Patient_Report pr
JOIN
    Appointments a ON pr.Pat_id = a.Patient_id
JOIN
    Patient p ON pr.Pat_id = p.Pat_id
WHERE
    pr.Disease IS NOT NULL
GROUP BY
    pr.Pat_id, p.Name, pr.Disease
HAVING
    COUNT(DISTINCT a.Doctor_id) > 1;

-- 16. Calculate department-wise revenue from doctor charges
SELECT d.Name AS Department,
       SUM(doc.Charge * doc_completed.count) AS Estimated_Revenue
FROM Department d
JOIN Doctor doc ON d.Department_id = doc.Department_id
JOIN (
    SELECT a.Doctor_id, COUNT(*) AS count
    FROM Appointments a
    WHERE a.Status = 'Completed'
    GROUP BY a.Doctor_id
) AS doc_completed ON doc.License_no = doc_completed.Doctor_id
GROUP BY d.Name
ORDER BY Estimated_Revenue DESC;

-- 17. List rooms with no available beds
SELECT R.Room_no, R.Room_type
FROM Room R
WHERE NOT EXISTS (
    SELECT B.Bed_no
    FROM Bed B
    WHERE B.Room_no = R.Room_no AND B.Status = 'Available'
);

-- 18. Verify insurance coverage for pending bills
SELECT b.Invoice_no, p.Name AS Patient_Name, b.Total_amount AS Bill_Amount,
       pi.Provider_name, pi.Percentage_of_ins,
       (b.Total_amount * pi.Percentage_of_ins/100) AS Insurance_Coverage,
       (b.Total_amount - (b.Total_amount * pi.Percentage_of_ins/100)) AS Patient_Responsibility
FROM Bill b
JOIN Patient p ON b.Patient_id = p.Pat_id
JOIN Patient_Insurance pi ON p.Pat_id = pi.Patient_id
WHERE b.Status = 'Pending'
AND pi.End_date >= CURRENT_DATE;

-- 19. Medicine inventory analysis and reorder suggestions
SELECT Name, Qty_in_stock, 
       CASE 
           WHEN Qty_in_stock < 50 THEN 'Urgent Reorder'
           WHEN Qty_in_stock < 100 THEN 'Reorder Soon'
           ELSE 'Stock Adequate'
       END AS Inventory_Status
FROM Medicine
ORDER BY Qty_in_stock ASC;
