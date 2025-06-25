INSERT INTO Admin (Admin_id, Name, Role, Email, Contact, Joining_date, Working_status) 
VALUES
(1001, 'Riya Patel', 'System Administrator', 'riya.patel@hospital.org', '9876543210', '2022-01-10', 'Active'),
(1002, 'Amit Shah', 'HR Manager', 'amit.shah@hospital.org', '9876543211', '2021-06-25', 'Active'),
(1003, 'Meera Joshi', 'Operations Head', 'meera.joshi@hospital.org', '9876543212', '2020-09-15', 'On Leave'),
(1004, 'Vikram Desai', 'Finance Officer', 'vikram.desai@hospital.org', '9876543213', '2022-11-01', 'Active'),
(1005, 'Pooja Mehta', 'IT Support', 'pooja.mehta@hospital.org', '9876543214', '2023-03-12', 'Inactive'),
(1006, 'Nirav Kapadia', 'Medical Coordinator', 'nirav.kapadia@hospital.org', '9876543215', '2021-07-30', 'Active'),
(1007, 'Sneha Raval', 'Record Supervisor', 'sneha.raval@hospital.org', '9876543216', '2020-01-20', 'Retired'),
(1008, 'Karan Soni', 'Technical Lead', 'karan.soni@hospital.org', '9876543217', '2022-12-18', 'Active'),
(1009, 'Dhara Trivedi', 'Training Officer', 'dhara.trivedi@hospital.org', '9876543218', '2019-10-10', 'Active'),
(1010, 'Rahul Nair', 'Maintenance Head', 'rahul.nair@hospital.org', '9876543219', '2023-05-05', 'Active');

INSERT INTO Department (Department_id, Name, Superviser_id) 
VALUES
(201, 'Cardiology', 1003),
(202, 'Neurology', 1004),
(203, 'Orthopedics', 1006),
(204, 'Pediatrics', 1002),
(205, 'Emergency', 1001),
(206, 'Radiology', 1008),
(207, 'General Surgery', 1005),
(208, 'Oncology', 1009),
(209, 'Pathology', 1010),
(210, 'Urology', 1007);


INSERT INTO Doctor (License_no, Name, Contact, Joining_date, Address, Leaving_date, Salary, Role, Gender, Weekday, Shifts, Max_appointments_per_day, Charge, Department_id, Superviser_id) VALUES
('DOC001', 'Dr. Arjun Mehta', '9876000001', '2021-05-12', '12 Green Avenue, Ahmedabad', NULL, 95000.00, 'Cardiologist', 'M', 'Mon-Fri', 'Morning', 10, 500.00, 201, NULL),
('DOC002', 'Dr. Sneha Kaur', '9876000002', '2020-11-08', '23 Lotus Street, Surat', NULL, 88000.00, 'Neurologist', 'F', 'Mon-Sat', 'Evening', 12, 600.00, 202, NULL),
('DOC003', 'Dr. Raj Shah', '9876000003', '2022-01-01', '88 River Park, Vadodara', NULL, 79000.00, 'Orthopedic Surgeon', 'M', 'Tue-Sat', 'Morning', 8, 450.00, 203, 'DOC001'),
('DOC004', 'Dr. Kavita Deshmukh', '9876000004', '2021-09-17', '45 Sunview Road, Rajkot', NULL, 82000.00, 'Pediatrician', 'F', 'Mon-Fri', 'Afternoon', 9, 400.00, 204, 'DOC002'),
('DOC005', 'Dr. Aditya Rana', '9876000005', '2019-04-22', '67 Moonlight Lane, Bhavnagar', '2023-02-28', 91000.00, 'Emergency Specialist', 'M', 'All Week', 'Night', 15, 700.00, 205, NULL),
('DOC006', 'Dr. Meena Joshi', '9876000006', '2023-07-10', '34 Harmony Street, Ahmedabad', NULL, 76000.00, 'Radiologist', 'F', 'Mon-Fri', 'Morning', 10, 500.00, 206, 'DOC002'),
('DOC007', 'Dr. Ishan Patel', '9876000007', '2020-03-15', '91 Pearl Colony, Surat', NULL, 98000.00, 'General Surgeon', 'M', 'Mon-Sat', 'Evening', 11, 550.00, 207, NULL),
('DOC008', 'Dr. Neha Suri', '9876000008', '2022-12-01', '10 Greenway, Rajkot', NULL, 87000.00, 'Oncologist', 'F', 'Tue-Sat', 'Morning', 10, 650.00, 208, 'DOC001'),
('DOC009', 'Dr. Ramesh Bhatia', '9876000009', '2018-08-20', '77 Pine Street, Junagadh', NULL, 99000.00, 'Pathologist', 'M', 'Mon-Fri', 'Afternoon', 12, 400.00, 209, NULL),
('DOC010', 'Dr. Priya Vyas', '9876000010', '2021-06-05', '28 Sunrise Enclave, Gandhinagar', NULL, 85000.00, 'Urologist', 'F', 'Mon-Fri', 'Morning', 9, 550.00, 210, 'DOC004');



INSERT INTO Staff (St_id, Name, Contact, Joining_date, Address, Leaving_date, Salary, Role, Gender, Weekday, Shifts, Superviser_id, Doc_id, Dep_id) 
VALUES
(301, 'Anita Sharma', '9876100001', '2021-03-15', '45 Rose Garden, Ahmedabad', NULL, 30000.00, 'Nurse', 'F', 'Mon-Fri', 'Morning', NULL, 'DOC001', 201),
(302, 'Ravi Patel', '9876100002', '2020-07-01', '12 Blue Lake, Surat', NULL, 28000.00, 'Ward Assistant', 'M', 'Mon-Sat', 'Evening', 301, 'DOC003', 203),
(303, 'Snehal Mehta', '9876100003', '2022-05-22', '89 Sunset Lane, Vadodara', NULL, 32000.00, 'Lab Technician', 'F', 'Mon-Fri', 'Afternoon', NULL, 'DOC006', 206),
(304, 'Kunal Desai', '9876100004', '2019-11-10', '77 Hilltop View, Rajkot', NULL, 31000.00, 'Receptionist', 'M', 'Mon-Sat', 'Morning', NULL, NULL, 205),
(305, 'Payal Bhatt', '9876100005', '2023-01-03', '101 Garden View, Bhavnagar', NULL, 29500.00, 'Nurse', 'F', 'All Week', 'Night', 301, 'DOC005', 205),
(306, 'Manoj Trivedi', '9876100006', '2020-08-18', '56 Sunrise Hill, Junagadh', NULL, 33000.00, 'Pharmacist', 'M', 'Mon-Fri', 'Morning', NULL, NULL, 209),
(307, 'Divya Shah', '9876100007', '2021-12-20', '33 Orchid Avenue, Gandhinagar', NULL, 31000.00, 'Nurse', 'F', 'Mon-Fri', 'Morning', 301, 'DOC010', 210),
(308, 'Jatin Verma', '9876100008', '2018-09-14', '66 Ocean Breeze, Ahmedabad', NULL, 27000.00, 'Cleaner', 'M', 'Mon-Sat', 'Evening', NULL, NULL, 208),
(309, 'Nisha Kapoor', '9876100009', '2023-04-01', '40 Cherry Woods, Surat', NULL, 29000.00, 'Receptionist', 'F', 'Mon-Sat', 'Afternoon', 304, NULL, 202),
(310, 'Alok Rathi', '9876100010', '2021-06-11', '20 Pearl Towers, Vadodara', NULL, 28000.00, 'Security Guard', 'M', 'All Week', 'Night', NULL, NULL, 204);



INSERT INTO Patient (Pat_id, Name, Email, Contact, Address, Age, Gender, Weight, Height, Blood_grp) 
VALUES
(45001, 'Ravi Shah', 'ravi.shah@gmail.com', '9876500011', '15 Park Street, Ahmedabad', 45, 'M', 72.5, 170.2, 'B+'),
(45005, 'Anita Desai', 'anita.d@gmail.com', '9876500012', '42 Green Villas, Surat', 34, 'F', 60.0, 162.0, 'O+'),
(45100, 'Nikhil Mehta', 'nikhil.mehta@yahoo.com', '9876500013', '67 Harmony Lane, Vadodara', 29, 'M', 68.9, 175.4, 'A+'),
(45120, 'Priya Singh', 'priya_singh@gmail.com', '9876500014', '88 Lakeview Society, Rajkot', 51, 'F', 70.2, 168.3, 'AB+'),
(45200, 'Manoj Patel', 'manojp@gmail.com', '9876500015', '101 Silver Heights, Bhavnagar', 40, 'M', 80.0, 178.0, 'B-'),
(45225, 'Sneha Kothari', 'sneha_k@yahoo.com', '9876500016', '24 Sun City, Gandhinagar', 26, 'F', 55.4, 160.2, 'A-'),
(45300, 'Rahul Trivedi', 'rahul.t@gmail.com', '9876500017', '73 Riverfront Drive, Junagadh', 37, 'M', 74.6, 172.5, 'O-'),
(45333, 'Komal Joshi', 'komal.joshi@gmail.com', '9876500018', '19 Blossom Lane, Surat', 31, 'F', 62.1, 165.0, 'B+'),
(45400, 'Deepak Rana', 'deepak.rana@yahoo.com', '9876500019', '56 Hillview, Rajkot', 60, 'M', 78.0, 169.0, 'AB-'),
(45500, 'Ravi Shankar', 'ravi.shankar@gmail.com', '9876543220', 'Hyderabad', 55, 'M', 78.0, 174.0, 'O+'),
(45501, 'Suman Verma', 'suman.verma@gmail.com', '9876500011', 'Delhi', 48, 'F', 65, 158, 'B+'),
(45502, 'Manish Tiwari', 'manish.tiwari@gmail.com', '9876500012', 'Bhopal', 62, 'M', 70, 165, 'O+'),
(45503, 'Priya Sharma', 'priya.sharma@gmail.com', '9876500013', 'Jaipur', 29, 'F', 55, 160, 'A+'),
(45504, 'Amit Jain', 'amit.jain@gmail.com', '9876500014', 'Indore', 53, 'M', 82, 172, 'B-'),
(45505, 'Rina Gupta', 'rina.gupta@gmail.com', '9876500015', 'Kanpur', 34, 'F', 60, 162, 'AB+'),
(45506, 'Vikram Rao', 'vikram.rao@gmail.com', '9876500016', 'Nagpur', 46, 'M', 75, 170, 'O-'),
(45507, 'Geeta Nair', 'geeta.nair@gmail.com', '9876500017', 'Kochi', 39, 'F', 62, 158, 'B+'),
(45508, 'Karan Sethi', 'karan.sethi@gmail.com', '9876500018', 'Ludhiana', 50, 'M', 79, 175, 'A-'),
(45509, 'Anjali Dixit', 'anjali.dixit@gmail.com', '9876500019', 'Noida', 45, 'F', 68, 164, 'AB-'),
(45510, 'Siddharth Malhotra', 'siddharth.mal@gmail.com', '9876500020', 'Pune', 37, 'M', 73, 171, 'O+'),
(45444, 'Pooja Bhatt', 'pooja.bhatt@gmail.com', '9876500020', '34 Pearl Enclave, Ahmedabad', 22, 'F', 50.3, 158.0, 'O+');



INSERT INTO Appointments (Appo_id, Date_time, Status, Doctor_id, Patient_id)
VALUES
(24040101, '2025-04-01 09:00:00', 'Completed', 'DOC001', 45001),
(24040212, '2025-04-02 10:30:00', 'Scheduled', 'DOC004', 45120),
(24040320, '2025-04-03 11:15:00', 'Cancelled', 'DOC005', 45200),
(24040410, '2025-04-04 11:45:00', 'Completed', 'DOC003', 45100),
(24040525, '2025-04-05 09:20:00', 'Scheduled', 'DOC006', 45225),
(24040605, '2025-04-06 08:40:00', 'Completed', 'DOC002', 45005),
(24040730, '2025-04-07 14:10:00', 'Scheduled', 'DOC007', 45300),
(24040844, '2025-04-08 15:25:00', 'Cancelled', 'DOC010', 45444),
(24040940, '2025-04-09 16:50:00', 'Scheduled', 'DOC009', 45400),
(24041033, '2025-04-10 13:05:00', 'Completed', 'DOC008', 45333),
(24041301, '2024-06-01 10:00:00', 'Completed', 'DOC004', 45508),
(24041302, '2024-06-05 11:30:00', 'Completed', 'DOC004', 45509),
(24041401, '2024-06-08 12:15:00', 'Completed', 'DOC002', 45510),
(24041201, '2024-06-01 09:00:00', 'Completed', 'DOC001', 45501),
(24041202, '2024-06-03 09:30:00', 'Completed', 'DOC001', 45502),
(24041203, '2024-06-04 10:15:00', 'Completed', 'DOC001', 45503),
(24041204, '2024-06-06 11:00:00', 'Completed', 'DOC001', 45504),
(24041205, '2024-06-07 09:45:00', 'Completed', 'DOC001', 45505),
(24041206, '2024-06-09 10:30:00', 'Completed', 'DOC001', 45506),
(24041207, '2024-06-10 08:50:00', 'Completed', 'DOC001', 45507),
(24041101, '2025-04-10 13:15:00', 'Scheduled', 'DOC008', 45333),
(24041102, '2025-04-10 13:45:00', 'Scheduled', 'DOC008', 45444),
(24041208, '2024-06-12 10:00:00', 'Completed', 'DOC001', 45501),
(24041209, '2024-06-15 09:00:00', 'Completed', 'DOC001', 45502),
(24041210, '2024-06-18 11:00:00', 'Completed', 'DOC001', 45503),
(24041211, '2024-06-21 09:30:00', 'Completed', 'DOC001', 45504),
(24041402, '2024-06-10 10:30:00', 'Completed', 'DOC002', 45510),
(24041403, '2024-06-20 10:45:00', 'Completed', 'DOC002', 45510),
(24041303, '2025-04-03 12:00:00', 'Completed', 'DOC004', 45120),
(24041304, '2025-04-10 12:30:00', 'Completed', 'DOC004', 45120),
(24041034, '2025-04-12 14:00:00', 'Completed', 'DOC008', 45333),
(24041035, '2025-04-14 14:30:00', 'Completed', 'DOC008', 45333),
(24040526, '2025-04-06 10:00:00', 'Completed', 'DOC006', 45225),
(24040527, '2025-04-07 09:30:00', 'Completed', 'DOC006', 45225),
(24040411, '2025-04-06 11:15:00', 'Completed', 'DOC003', 45100),
(24040412, '2025-04-08 11:45:00', 'Completed', 'DOC003', 45100),
(24049907, '2025-04-16 14:00:00', 'Completed', 'DOC004', 45444),
(24049903, '2025-04-15 11:00:00', 'Completed', 'DOC002', 45120),
(24049904, '2025-04-15 11:30:00', 'Completed', 'DOC002', 45508),
(24049905, '2025-04-15 12:00:00', 'Completed', 'DOC002', 45509),
(24049906, '2025-04-15 12:30:00', 'Completed', 'DOC002', 45225),
(24049901, '2025-04-15 09:00:00', 'Completed', 'DOC001', 45100),
(24049902, '2025-04-16 10:00:00', 'Completed', 'DOC001', 45333);




INSERT INTO Patient_Report (Report_id, Comment, Date, Pat_id,Disease) 
VALUES
(91001, 'Blood pressure and cholesterol levels within normal range. Continue current lifestyle.', '2025-03-25', 45001,Hypertension & Cholestero),
(91005, 'Mild vitamin D deficiency observed. Supplements prescribed.', '2025-03-28', 45005,Vitamin D Deficiency),
(91100, 'Routine check-up normal. Advised regular cardio exercises.', '2025-03-20', 45100,Routine Check-up),
(91120, 'High sugar levels detected. Referred to endocrinologist.', '2025-03-30', 45120,Diabetes (High Sugar Levels)),
(91200, 'Knee joint pain reported. X-ray recommended.', '2025-04-01', 45200,Arthritis (Knee Pain)),
(91225, 'All vitals are normal. BMI in healthy range.', '2025-03-22', 45225,General Health Check),
(91300, 'Frequent headaches. MRI suggested for further investigation.', '2025-04-02', 45300,Frequent Headaches),
(91333, 'Mild anemia detected. Iron-rich diet recommended.', '2025-03-27', 45333,Anemia (Mild)),
(91400, 'Chronic cough persists. Chest X-ray advised.', '2025-04-03', 45400,Chronic Cough),
(91500, 'Severe chest pain and breathlessness. Admitted to ICU for emergency cardiac evaluation.', '2025-04-10', 45500,Cardiac Emergency),
(91444, 'Annual physical check-up done. No major concerns.', '2025-04-04', 45444,Annual Check-up),
(91501, 'Patient shows signs of seasonal allergies. Antihistamines advised.', '2025-04-11', 45001, 'Seasonal Allergies'),
(91502, 'Weight slightly above ideal range. Suggested diet modifications.', '2025-04-10', 45005, 'Overweight'),
(91503, 'Mild dehydration noted. Recommended increased fluid intake.', '2025-04-09', 45100, 'Dehydration'),
(91504, 'Blood glucose levels slightly elevated. Monitoring recommended.', '2025-04-08', 45120, 'Prediabetes'),
(91505, 'Normal ECG. No abnormalities found.', '2025-04-07', 45200, 'Cardiac Screening'),
(91506, 'Slight vitamin B12 deficiency. Supplement course started.', '2025-04-06', 45225, 'Vitamin B12 Deficiency'),
(91507, 'Signs of stress and fatigue. Recommended rest and lifestyle changes.', '2025-04-05', 45300, 'Stress & Fatigue'),
(91508, 'Improved hemoglobin levels. Progressing well on iron supplements.', '2025-04-04', 45333, 'Anemia (Improving)'),
(91509, 'Chest congestion subsiding. Responding well to medication.', '2025-04-03', 45400, 'Chronic Cough (Recovery)'),
(91510, 'Patient stabilized post cardiac episode. Under observation.', '2025-04-11', 45500, 'Cardiac Recovery'),
(91511, 'Annual check-up shows healthy vitals. Continue current regimen.', '2025-04-12', 45444, 'Annual Check-up');



INSERT INTO Lab_Test (Lab_test_id, Lab_test_name, Lab_no, Price) 
VALUES
(30101, 'Complete Blood Count (CBC)', 'LAB101', 550.00),
(30102, 'Liver Function Test (LFT)', 'LAB102', 800.00),
(30103, 'Kidney Function Test (KFT)', 'LAB103', 750.00),
(30104, 'Lipid Profile', 'LAB104', 900.00),
(30105, 'Thyroid Panel (T3, T4, TSH)', 'LAB105', 600.00),
(30106, 'Blood Glucose (Fasting)', 'LAB106', 250.00),
(30107, 'Urine Routine Analysis', 'LAB107', 300.00),
(30108, 'Vitamin D Test', 'LAB108', 1200.00),
(30109, 'Hemoglobin A1c (HbA1c)', 'LAB109', 450.00),
(30110, 'Electrolyte Panel', 'LAB110', 700.00);



INSERT INTO Lab_report (Report_id, Lab_test_id, Result_of_test) 
VALUES
(91001, 30101, 'WBC, RBC, and Platelets all within normal limits'),
(91001, 30104, 'Cholesterol: 180 mg/dL, HDL: 55, LDL: 100'),
(91005, 30108, 'Vitamin D level: 18 ng/mL (Deficient)'),
(91100, 30101, 'All parameters normal'),
(91100, 30106, 'Fasting blood glucose: 92 mg/dL'),
(91120, 30106, 'Fasting glucose: 145 mg/dL'),
(91120, 30109, 'HbA1c: 7.8% (High)'),
(91200, 30107, 'Normal urine report, no infection detected'),
(91225, 30110, 'Sodium, Potassium, and Chloride levels all within range'),
(91300, 30101, 'Slight elevation in WBC count'),
(91300, 30105, 'TSH: 3.1 µIU/mL – normal'),
(91333, 30101, 'Hemoglobin: 10.5 g/dL (Mild anemia)'),
(91400, 30101, 'WBC slightly elevated'),
(91400, 30103, 'Creatinine: 0.9 mg/dL – normal'),
(91444, 30101, 'CBC normal'),
(91444, 30104, 'Lipid Profile optimal'),
(91444, 30106, 'Glucose: 85 mg/dL – normal'),
(91001, 30102, NULL);



INSERT INTO Medicine (Med_id, Name, Price, Qty_in_stock) VALUES
(20253001, 'Paracetamol 500mg', 20.00, 150),
(20253002, 'Amoxicillin 250mg', 45.50, 80),
(20253003, 'Ibuprofen 400mg', 30.00, 100),
(20253004, 'Metformin 500mg', 25.75, 120),
(20253005, 'Atorvastatin 10mg', 35.00, 90),
(20253006, 'Cetirizine 10mg', 10.00, 200),
(20253007, 'Pantoprazole 40mg', 22.50, 130),
(20253008, 'Aspirin 75mg', 18.00, 160),
(20253009, 'Azithromycin 500mg', 60.00, 70),
(20253010, 'Calcium+D3 Tabs', 40.00, 110);



INSERT INTO Medicine_patient (Report_id, Med_id, Qty_bought) 
VALUES
(91001, 20253001, 10), 
(91001, 20253005, 5),  
(91005, 20253010, 15), 
(91100, 20253004, 10), 
(91120, 20253004, 20), 
(91120, 20253009, 5),  
(91200, 20253003, 12), 
(91200, 20253008, 5),  
(91225, 20253006, 5),  
(91300, 20253001, 10), 
(91300, 20253007, 5),  
(91333, 20253010, 10), 
(91333, 20253008, 8),  
(91400, 20253009, 7),  
(91400, 20253001, 6),  
(91444, 20253006, 5); 



INSERT INTO Room (Room_no, No_of_beds, Room_type, Room_charge) 
VALUES
(100, 8, 'General', 500.00),
(101, 6, 'General', 500.00),
(102, 2, 'Private', 2000.00),
(103, 3, 'General', 600.00),
(104, 1, 'Private', 2000.00),
(105, 1, 'ICU',     5500.00),
(106, 2, 'Private', 2200.00),
(107, 4, 'General', 700.00);



INSERT INTO Bed (Room_no, Bed_no, Status) 
VALUES
(100, 1, 'Available'),
(100, 2, 'Available'),
(100, 3, 'Not Available'),
(100, 4, 'Available'),
(100, 5, 'Not Available'),
(100, 6, 'Available'),
(100, 7, 'Available'),
(100, 8, 'Not Available'),

(101, 1, 'Available'),
(101, 2, 'Not Available'),
(101, 3, 'Not Available'),
(101, 4, 'Available'),
(101, 5, 'Not Available'),
(101, 6, 'Available'),

(102, 1, 'Not Available'),
(102, 2, 'Available'),

(103, 1, 'Available'),
(103, 2, 'Not Available'),
(103, 3, 'Available'),

(104, 1, 'Not Available'),

(105, 1, 'Available'),

(106, 1, 'Available'),
(106, 2, 'Available'),

(107, 1, 'Available'),
(107, 2, 'Available'),
(107, 3, 'Available'),
(107, 4, 'Available');



INSERT INTO Allocate (Room_id, Bed_no, Pat_id, Allocation_Date, Discharge_date) 
VALUES
(100, 1, 45001, '2025-04-01', '2025-04-05'),
(100, 5, 45005, '2025-04-02', NULL),
(100, 8, 45100, '2025-04-03', '2025-04-07'),
(100, 8, 45444, '2025-04-03',NULL),
(101, 3, 45120, '2025-04-04', NULL),
(101, 6, 45200, '2025-04-05', '2025-04-09'),
(102, 1, 45225, '2025-04-06', NULL),
(102, 2, 45300, '2025-04-07', '2025-04-08'),
(103, 2, 45333, '2025-04-08',NULL),
(103, 3, 45400, '2025-04-09', '2025-04-12'),
(104, 1, 45444, '2025-04-10',NULL),
(106, 2, 45001, '2025-04-11', '2025-04-15'),
(107, 4, 45005, '2025-03-12', '2025-03-18'),
(101, 2, 45200, '2025-04-13', NULL),
(101, 5, 45300, '2025-04-14', NULL),
(105, 1, 45500, '2025-04-10', NULL);



INSERT INTO Bill (Invoice_no, Start_date, End_date, Status, Due_date, Total_charge, Total_amount, Patient_id) 
VALUES
(920101, '2025-02-10', '2025-02-15', 'Paid', '2025-02-20', 4500.00, 4500.00, 45001),
(920102, '2025-01-25', '2025-01-30', 'Cancelled', NULL, 3800.00, 0.00, 45005),
(920103, '2025-03-01', '2025-03-06', 'Pending', '2025-03-12', 5000.00, 5250.00, 45100),
(920104, '2025-03-11', '2025-03-18', 'Paid', '2025-03-25', 6200.00, 6200.00, 45120),
(920105, '2025-02-20', '2025-02-27', 'Paid', '2025-03-01', 4900.00, 4900.00, 45200),
(920106, '2025-01-18', '2025-01-22', 'Pending', '2025-01-28', 4300.00, 4550.00, 45225),
(920107, '2025-03-05', '2025-03-09', 'Paid', '2025-03-14', 5600.00, 5600.00, 45300),
(920108, '2025-02-14', '2025-02-18', 'Cancelled', NULL, 4100.00, 0.00, 45333),
(920109, '2025-04-01', '2025-04-04', 'Paid', '2025-04-07', 3950.00, 3950.00, 45400),
(920110, '2025-04-05', '2025-04-10', 'Pending', '2025-04-15', 5200.00, 5400.00, 45444);




INSERT INTO Patient_Insurance (Ins_no, Provider_name, Ins_type, End_date, Percentage_of_ins, Patient_id) 
VALUES
(700101, 'Star Health', 'Comprehensive', '2026-03-31', 85.00, 45001),
(700102, 'Religare', 'Individual', '2025-12-31', 75.50, 45005),
(700103, 'HDFC ERGO', 'Family Floater', '2027-06-30', 90.00, 45100),
(700104, 'ICICI Lombard', 'Senior Citizen', '2025-09-15', 60.00, 45120),
(700105, 'New India Assurance', 'Individual', '2026-01-10', 80.00, 45200),
(700106, 'Bajaj Allianz', 'Comprehensive', '2025-11-30', 88.75, 45225),
(700107, 'Max Bupa', 'Top-up Plan', '2026-08-20', 70.00, 45300),
(700108, 'Tata AIG', 'Critical Illness', '2025-10-05', 65.00, 45333),
(700109, 'Aditya Birla', 'Maternity Plan', '2026-02-28', 92.00, 45400),
(700110, 'Future Generali', 'Basic', '2025-12-20', 55.25, 45444);



INSERT INTO Driver (Licence_id, Name, Contact, Joining_date, Address, Leaving_date, Salary, Gender, Shift) 
VALUES
('DL1001', 'Ravi Yadav', '9876511111', '2022-01-10', '21 MG Road, Ahmedabad', NULL, 30000.00, 'M', 'Morning'),
('DL1002', 'Anita Shah', '9876511112', '2021-02-12', '77 Sunrise Street, Surat', NULL, 32000.00, 'F', 'Evening'),
('DL1003', 'Kiran Mehta', '9876511113', '2020-03-15', '5 Nehru Nagar, Rajkot', NULL, 34000.00, 'M', 'Night'),
('DL1004', 'Sneha Kapoor', '9876511114', '2019-04-18', '100 Ashram Road, Vadodara', NULL, 28000.00, 'F', 'Morning'),
('DL1005', 'Amit Trivedi', '9876511115', '2023-05-01', '45 City Light, Bhavnagar', NULL, 33000.00, 'M', 'Evening'),
('DL1006', 'Reema Joshi', '9876511116', '2023-06-11', '11 Hilltop Society, Gandhinagar', NULL, 31000.00, 'F', 'Night'),
('DL1007', 'Manoj Desai', '9876511117', '2020-07-20', '66 Race Course, Junagadh', NULL, 36000.00, 'M', 'Morning'),
('DL1008', 'Divya Patel', '9876511118', '2018-08-25', '77 Greenpark, Ahmedabad', NULL, 29500.00, 'F', 'Evening'),
('DL1009', 'Jay Rana', '9876511119', '2017-09-30', '120 River Drive, Surat', NULL, 37000.00, 'M', 'Night'),
('DL1010', 'Pooja Shah', '9876511120', '2022-10-05', '88 Lakshmi Nagar, Rajkot', NULL, 30500.00, 'F', 'Morning');



INSERT INTO Ambulance (No_plate, Status) 
VALUES
('GJ01AB1001', 'Available'),
('GJ01AB1002', 'Available'),
('GJ01AB1003', 'Not Available'),
('GJ01AB1004', 'Available'),
('GJ01AB1005', 'Available'),
('GJ01AB1006', 'Not Available'),
('GJ01AB1007', 'Available'),
('GJ01AB1008', 'Available'),
('GJ01AB1009', 'Not Available'),
('GJ01AB1010', 'Available');



INSERT INTO Ambulance_Service (Patient_id, No_plate, Date_time, Pick_up_location) 
VALUES
(45001, 'GJ01AB1001', '2025-04-01 08:00:00', '15 Park Street, Ahmedabad'),
(45005, 'GJ01AB1002', '2025-04-01 09:15:00', '42 Green Villas, Surat'),
(45100, 'GJ01AB1003', '2025-04-02 10:30:00', '67 Harmony Lane, Vadodara'),
(45120, 'GJ01AB1004', '2025-04-02 11:45:00', '88 Lakeview Society, Rajkot'),
(45200, 'GJ01AB1005', '2025-04-03 12:00:00', '101 Silver Heights, Bhavnagar'),
(45225, 'GJ01AB1006', '2025-04-03 13:15:00', '24 Sun City, Gandhinagar'),
(45300, 'GJ01AB1007', '2025-04-04 14:30:00', '73 Riverfront Drive, Junagadh'),
(45333, 'GJ01AB1008', '2025-04-04 15:45:00', '19 Blossom Lane, Surat'),
(45400, 'GJ01AB1009', '2025-04-05 17:00:00', '56 Hillview, Rajkot'),
(45001, 'GJ01AB1001', '2025-02-05 10:00:00', 'A-1 Residency, Ahmedabad'),
(45005, 'GJ01AB1002', '2025-02-12 14:20:00', 'Nehru Nagar, Surat'),
(45100, 'GJ01AB1003', '2025-02-18 16:45:00', 'Manjalpur, Vadodara'),
(45500, 'GJ01AB1009', '2025-04-06 11:15:00', 'Charminar Street, Hyderabad'),
(45005, 'GJ01AB1010', '2025-04-07 13:30:00', 'Surat Civil Hospital'),
(45120, 'GJ01AB1001', '2025-04-08 15:45:00', 'Rajkot Junction'),
(45225, 'GJ01AB1002', '2025-04-09 17:00:00', 'Sector 23, Gandhinagar'),
(45120, 'GJ01AB1004', '2025-03-03 09:00:00', 'Rajpath Club Road, Rajkot'),
(45200, 'GJ01AB1005', '2025-03-14 12:30:00', 'Kalanala, Bhavnagar'),
(45300, 'GJ01AB1006', '2025-03-25 18:00:00', 'Junagadh University Campus')
(45444, 'GJ01AB1010', '2025-04-05 18:30:00', '34 Pearl Enclave, Ahmedabad');



INSERT INTO Drives (Licence_id, No_plate) 
VALUES
('DL1001', 'GJ01AB1001'),
('DL1002', 'GJ01AB1002'),
('DL1003', 'GJ01AB1003'),
('DL1004', 'GJ01AB1004'),
('DL1005', 'GJ01AB1005'),
('DL1006', 'GJ01AB1006'),
('DL1007', 'GJ01AB1007'),
('DL1008', 'GJ01AB1008'),
('DL1009', 'GJ01AB1009'),
('DL1010', 'GJ01AB1010');
