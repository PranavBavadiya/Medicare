CREATE SCHEMA MediCare;
SET SEARCH_PATH to MediCare;


CREATE TABLE Admin (
    Admin_id INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Role VARCHAR(50) NOT NULL,
    Email VARCHAR(50),
    Contact VARCHAR(15),
    Joining_date DATE NOT NULL,
    Working_status VARCHAR(20)
);


CREATE TABLE Department (
    Department_id INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Superviser_id INT,
    FOREIGN KEY (Superviser_id) REFERENCES Admin(Admin_id)
        ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE Doctor (
    License_no VARCHAR(20) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Contact VARCHAR(15),
    Joining_date DATE NOT NULL,
    Address TEXT,
    Leaving_date DATE,
    Salary DECIMAL(10,2),
    Role VARCHAR(50),
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    Weekday VARCHAR(50),
    Shifts VARCHAR(50),
    Max_appointments_per_day INT CHECK (Max_appointments_per_day > 0),
    Charge DECIMAL(10,2) CHECK (Charge >= 0),
    Department_id INT,
    Superviser_id VARCHAR(20),
    FOREIGN KEY (Department_id) REFERENCES Department(Department_id)
        ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (Superviser_id) REFERENCES Doctor(License_no)
        ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE Staff (
    St_id INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Contact VARCHAR(15),
    Joining_date DATE,
    Address TEXT,
    Leaving_date DATE,
    Salary DECIMAL(10,2),
    Role VARCHAR(50),
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    Weekday VARCHAR(50),
    Shifts VARCHAR(50),
    Superviser_id INT,
    Doc_id VARCHAR(20),
    Dep_id INT,
    FOREIGN KEY (Superviser_id) REFERENCES Staff(St_id)
        ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (Doc_id) REFERENCES Doctor(License_no)
        ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (Dep_id) REFERENCES Department(Department_id)
        ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE Patient (
    Pat_id INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(50),
    Contact VARCHAR(15),
    Address TEXT,
    Age INT CHECK (Age > 0),
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    Weight DECIMAL(5,2) CHECK (Weight > 0),
    Height DECIMAL(5,2) CHECK (Height > 0),
    Blood_grp VARCHAR(5)
);


CREATE TABLE Appointments (
    Appo_id INT PRIMARY KEY,
    Date_time TIMESTAMP NOT NULL,
    Status VARCHAR(50) CHECK (Status IN ('Scheduled', 'Completed', 'Cancelled')),
    Doctor_id VARCHAR(20) NOT NULL,
    Patient_id INT NOT NULL,
    FOREIGN KEY (Doctor_id) REFERENCES Doctor(License_no)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Patient_id) REFERENCES Patient(Pat_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Patient_Report (
    Report_id INT PRIMARY KEY,
    Comment TEXT,
    Date DATE,
    Pat_id INT,
    Disease VARCHAR(50);
    FOREIGN KEY (Pat_id) REFERENCES Patient(Pat_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Lab_Test (
    Lab_test_id INT PRIMARY KEY,
    Lab_test_name VARCHAR(50) NOT NULL,
    Lab_no VARCHAR(10),
    Price DECIMAL(10,2) CHECK (Price >= 0)
);


CREATE TABLE Lab_report (
    Report_id INT NOT NULL,
    Lab_test_id INT NOT NULL,
    Result_of_test TEXT,
    PRIMARY KEY (Report_id, Lab_test_id),
    FOREIGN KEY (Report_id) REFERENCES Patient_Report(Report_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Lab_test_id) REFERENCES Lab_Test(Lab_test_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Medicine (
    Med_id INT PRIMARY KEY,
    Name VARCHAR(25) NOT NULL,
    Price DECIMAL(10,2) CHECK (Price >= 0),
    Qty_in_stock INT CHECK (Qty_in_stock >= 0)
);


CREATE TABLE Medicine_patient (
    Report_id INT NOT NULL,
    Med_id INT NOT NULL,
    Qty_bought INT CHECK (Qty_bought > 0),
    PRIMARY KEY (Report_id, Med_id),
    FOREIGN KEY (Report_id) REFERENCES Patient_Report(Report_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Med_id) REFERENCES Medicine(Med_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Room (
    Room_no INT PRIMARY KEY,
    No_of_beds INT CHECK (No_of_beds > 0),
    Room_type VARCHAR(50),
    Room_charge DECIMAL(10,2) CHECK (Room_charge >= 0)
);


CREATE TABLE Bed (
    Room_no INT NOT  NULL,
    Bed_no INT NOT NULL,
    Status VARCHAR(20) CHECK (Status IN ('Available', 'Not Available')),
    PRIMARY KEY (Room_no, Bed_no),
    FOREIGN KEY (Room_no) REFERENCES Room(Room_no)
        ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Allocate (
    Room_id INT NOT NULL,
    Bed_no INT NOT NULL,
    Pat_id INT NOT NULL,
    Allocation_Date DATE NOT NULL,
    Discharge_date DATE,
    PRIMARY KEY (Room_id, Bed_no, Pat_id, Allocation_Date),
    FOREIGN KEY (Room_id, Bed_no) REFERENCES Bed(Room_no, Bed_no)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Pat_id) REFERENCES Patient(Pat_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Bill (
    Invoice_no INT PRIMARY KEY,
    Start_date DATE,
    End_date DATE,
    Status VARCHAR(20) CHECK (Status IN ('Paid', 'Pending', 'Cancelled')),
    Due_date DATE,
    Total_charge DECIMAL(10,2) CHECK (Total_charge >= 0),
    Total_amount DECIMAL(10,2) CHECK (Total_amount >= 0),
    Patient_id INT NOT NULL,
    FOREIGN KEY (Patient_id) REFERENCES Patient(Pat_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Patient_Insurance (
    Ins_no INT PRIMARY KEY,
    Provider_name VARCHAR(50) NOT NULL,
    Ins_type VARCHAR(50),
    End_date DATE,
    Percentage_of_ins DECIMAL(5,2) CHECK (Percentage_of_ins >= 0 AND Percentage_of_ins <= 100),
    Patient_id INT NOT NULL,
    FOREIGN KEY (Patient_id) REFERENCES Patient(Pat_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Driver (
    Licence_id VARCHAR(20) PRIMARY KEY,
    Name VARCHAR(50),
    Contact VARCHAR(15),
    Joining_date DATE,
    Address TEXT,
    Leaving_date DATE,
    Salary DECIMAL(10,2) CHECK (Salary >= 0),
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    Shift VARCHAR(50)
);


CREATE TABLE Ambulance (
    No_plate VARCHAR(10) PRIMARY KEY,
    Status VARCHAR(20) CHECK (Status IN ('Available', 'Not Available'))
);


CREATE TABLE Ambulance_Service (
    Patient_id INT NOT NULL,
    No_plate VARCHAR(10) NOT NULL ,
    Date_time TIMESTAMP NOT NULL,
    Pick_up_location TEXT,
    PRIMARY KEY (Patient_id, No_plate, Date_time),
    FOREIGN KEY (Patient_id) REFERENCES Patient(Pat_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (No_plate) REFERENCES Ambulance(No_plate)
        ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Drives (
    Licence_id VARCHAR(20) NOT NULL,
    No_plate VARCHAR(10) NOT NULL,
    PRIMARY KEY (Licence_id, No_plate),
    FOREIGN KEY (Licence_id) REFERENCES Driver(Licence_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (No_plate) REFERENCES Ambulance(No_plate)
        ON UPDATE CASCADE ON DELETE CASCADE
);
