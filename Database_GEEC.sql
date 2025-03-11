/*Create Database*/
CREATE DATABASE IF NOT EXISTS studyabroadprogram;

 /* Create Tables */
/*Advisor*/
CREATE TABLE advisor (
    advisor_id INT PRIMARY KEY UNIQUE,
    advisor_name VARCHAR(45) NOT NULL,
    department VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL
   );
   
/*Country*/
CREATE TABLE country (
  country_code INT PRIMARY KEY UNIQUE,
  country_name VARCHAR(45) NOT NULL,
  currency VARCHAR(45) NOT NULL,
  visa_requirements VARCHAR(45) NOT NULL
);
 
/*Term*/
CREATE TABLE term (
  term_id INT PRIMARY KEY UNIQUE,
  year INT NOT NULL,
  semester VARCHAR(45) NOT NULL
);
 
/*Travel Insurance*/
CREATE TABLE travel_insurance (
    travel_insurance_id INT PRIMARY KEY UNIQUE,
    coverage_type VARCHAR(45) NOT NULL,
    coverage_period INT NOT NULL,
    insurer_information VARCHAR(45) NOT NULL
);

/*Student*/
CREATE TABLE student (
  student_id INT PRIMARY KEY UNIQUE,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  gender VARCHAR(45) NOT NULL,
  nationality VARCHAR(45) NOT NULL,
  major VARCHAR(45) NOT NULL,
  gpa VARCHAR(45) NOT NULL,
  advisor_id INT NOT NULL,
  travel_insurance_id INT NOT NULL,
  FOREIGN KEY (advisor_id) REFERENCES advisor(advisor_id),
  FOREIGN KEY (travel_insurance_id) REFERENCES travel_insurance(travel_insurance_id)
  );
 
/*Study abroad program*/
CREATE TABLE studyabroadprogram (
  study_abroad_program_id INT PRIMARY KEY UNIQUE,
  study_abroad_program_name VARCHAR(45) NOT NULL,
  duration VARCHAR(45) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  program_coordinator VARCHAR(45) NOT NULL,
  term_id int NOT NULL,
  country_code INT NOT NULL,
  FOREIGN KEY (country_code) REFERENCES country (country_code),
  FOREIGN KEY (term_id) REFERENCES term (term_id)
);
 
/*Application*/
CREATE TABLE application (
  application_id INT PRIMARY KEY UNIQUE,
  application_date DATE NOT NULL,
  status VARCHAR(45) NOT NULL,
  documents_submitted VARCHAR(45) NOT NULL,
  study_abroad_program_id INT NOT NULL,
  student_id INT NOT NULL,
  term_id INT NOT NULL,
  FOREIGN KEY (term_id) REFERENCES term (term_id),
  FOREIGN KEY (student_id) REFERENCES student (student_id),
  FOREIGN KEY (study_abroad_program_id) REFERENCES studyabroadprogram (study_abroad_program_id)
);
 
/*Housing*/
CREATE TABLE housing (
  housing_id INT PRIMARY KEY UNIQUE,
  type VARCHAR(45) NOT NULL,
  cost INT NOT NULL,
  study_abroad_program_id int NOT NULL,
  FOREIGN KEY (study_abroad_program_id) REFERENCES studyabroadprogram (study_abroad_program_id)
);

/*Emergency Contact*/
CREATE TABLE emergency_contact (
    emergency_contact_id INT PRIMARY KEY UNIQUE,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    relationship VARCHAR(45) NOT NULL,
    contact_number VARCHAR(20) NOT NULL,
    student_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);
 
/*Orientation Session*/
CREATE TABLE orientation_session (
    Orientation_session_id INT PRIMARY KEY UNIQUE,
    date DATE NOT NULL,
    student_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);
 
/*Financial Aid*/
CREATE TABLE financial_aid (
    financial_aid_id INT PRIMARY KEY UNIQUE,
    scholarship_name VARCHAR(45) NOT NULL,
    amount INT NOT NULL,
    approval_status VARCHAR(45) NOT NULL,
    student_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);
 
/*Language Proficiency*/
CREATE TABLE language_proficiency (
    language_proficiency_id INT PRIMARY KEY UNIQUE,
    language_proficiency VARCHAR(45) NOT NULL,
    languages VARCHAR(45) NOT NULL,
    proficiency_level VARCHAR(45) NOT NULL,
    student_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);
 
/*Insert data rows in tables*/
/*Advisor*/
INSERT INTO advisor (advisor_id, advisor_name, department, email)
VALUES
    (501, 'John Doe', 'Academic Advising', 'johndoe@outlook.com'),
    (502, 'Jane Smith', 'Student Services', 'janesmith@uncg.edu'),
    (503, 'Michael Johnson', 'International Programs', 'michaeljohnson@outlook.com'),
    (504, 'Emily Brown', 'Student Affairs', 'emilybrown@yahoo.com'),
    (505, 'David Wilson', 'Career Services', 'davidwilson@gmail.com'),
    (506, 'Sarah Taylor', 'Residence Life', 'sarahtaylor@gmail.com'),
    (507, 'Olivia Martinez', 'Financial Aid', 'oliviamartinez@hotmail.com'),
    (508, 'Daniel Garcia', 'Counseling Services', 'danielgarcia@yahoo.com'),
    (509, 'Sophia Rodriguez', 'Health Center', 'sophiarodriguez@idk.com'),
    (510, 'Matthew Lopez', 'Student Activities', 'matthewlopez@latinedu.com');
    
    /*Travel Insurance*/
INSERT INTO travel_insurance (travel_insurance_id, coverage_type, coverage_period, insurer_information)
VALUES
(401, 'Health Insurance', 30, 'SecureGuard Insurance'),
(402, 'Travel Protection', 60, 'ShieldSure Assurance'),
(403, 'Emergency Evacuation', 90, 'GuardianProtect Insurance'),
(404, 'Trip Cancellation', 45, 'SafeHarbor Underwriters'),
(405, 'Accidental Death', 30, 'TrustShield Insurance'),
(406, 'Lost Luggage', 45, 'FortifySure Insurance'),
(407, 'Flight Delay', 60, 'CoveragePro Assurance'),
(408, 'Emergency Assistance', 30, 'SentinelSafe Underwriters'),
(409, 'Repatriation Coverage', 90, 'SureGuardian Insurance'),
(410, 'Medical Expenses', 45, 'ProtectFirst Assurance');
 
/*country*/
INSERT INTO country (country_code, country_name, currency, visa_requirements)
VALUES (1001, 'United States', 'USD', 'No visa '),
       (1002, 'Canada', 'CAD', 'No visa'),
       (1003, 'United Kingdom', 'GBP', 'Visa required'),
       (1004, 'France', 'EUR', 'Visa required'),
       (1005, 'Germany', 'EUR', 'Visa required'),
       (1006, 'India', 'INR', 'Visa required'),
       (1007, 'Australia', 'AUD', 'Visa required'),
       (1008, 'Japan', 'JPY', 'Visa required'),
       (1009, 'China', 'CNY', 'Visa required'),
       (1010, 'Italy', 'EUR', 'Visa required');
       
/*term*/
INSERT INTO term (term_id, year, semester)
VALUES (111, 2024, 'Spring'),
       (222, 2024, 'Summer'),
       (333, 2024, 'Fall'),
       (444, 2025, 'Spring'),
       (555, 2025, 'Summer'),
       (666, 2025, 'Fall'),
       (777, 2026, 'Spring'),
       (888, 2026, 'Summer'),
       (999, 2026, 'Fall'),
       (1000, 2027, 'Spring');
       
/*Student*/
INSERT INTO student (student_id, first_name, last_name, email, gender, nationality, major, gpa, advisor_id, travel_insurance_id)
VALUES
(101, 'Emma', 'Johnson', 'emma.johnson@gmail.com', 'Female', 'American', 'Biology', '3.8', 503, 401),
    (102, 'Michael', 'Brown', 'michael.brown@icloud.com', 'Male', 'Canadian', 'Engineering', '3.5', 504, 402),
    (103, 'Sophia', 'Garcia', 'sophia.garcia@protonmail.com', 'Female', 'British', 'Psychology', '3.9', 505, 403),
    (104, 'Daniel', 'Martinez', 'daniel.martinez@yahoo.com', 'Male', 'French', 'Business', '3.6', 506, 404),
    (105, 'Olivia', 'Taylor', 'olivia.taylor@aol.com', 'Female', 'German', 'Computer Science', '3.7', 507, 405),
    (106, 'David', 'Wilson', 'david.wilson@zoho.com', 'Male', 'Indian', 'Economics', '3.9', 508, 406),
    (107, 'Sarah', 'Rodriguez', 'sarah.rodriguez@outlook.com', 'Female', 'Australian', 'Sociology', '3.4', 509, 407),
    (108, 'Emily', 'Lee', 'emily.lee@yahoomail.com', 'Female', 'Japanese', 'Political Science', '3.8', 510, 408),
    (109, 'Matthew', 'Lopez', 'matthew.lopez@protonmail.com', 'Male', 'Chinese', 'English Literature', '3.6', 501, 409),
    (110, 'Ava', 'Perez', 'ava.perez@zoho.com', 'Female', 'Italian', 'History', '3.7', 502, 410);
    
/*Study abroad program*/
INSERT INTO studyabroadprogram (study_abroad_program_id, study_abroad_program_name, duration, start_date, end_date, 
program_coordinator, term_id, country_code)
VALUES
(111, 'Summer in USA', '6 weeks', '2024-06-01', '2024-07-15', 'Jane Doe', 111, 1001), -- United States
(112, 'Spring in Canada', '4 months', '2024-02-15', '2024-06-15', 'John Smith', 222, 1002), -- Canada
(113, 'Fall in UK', '1 semester', '2024-09-01', '2024-12-15', 'Emily Johnson', 333, 1003), -- United Kingdom
(114, 'Winter in France', '2 months', '2024-12-01', '2025-01-31', 'Michael Brown', 444, 1004), -- France
(115, 'Year-long in Germany', '1 year', '2024-03-01', '2025-03-01', 'Sarah Wilson', 555, 1005), -- Germany
(116, 'Spring Break in India', '2 weeks', '2024-03-15', '2024-03-31', 'David Lee', 666, 1006), -- India
(117, 'Summer in Australia', '8 weeks', '2024-07-01', '2024-08-31', 'Olivia Taylor', 777, 1007), -- Australia
(118, 'Fall in Japan', '1 semester', '2024-09-01', '2024-12-15', 'Daniel Martinez', 888, 1008), -- Japan
(119, 'Winter in China', '3 months', '2024-12-01', '2025-02-28', 'Sophia Garcia', 999, 1009), -- China
(120, 'Summer in Italy', '6 weeks', '2024-06-01', '2024-07-15', 'Matthew Rodriguez', 1000, 1010); -- Italy
/*Application*/
INSERT INTO application (application_id, application_date, status, documents_submitted, study_abroad_program_id, student_id, term_id)
VALUES
    (1001, '2024-01-15', 'Pending', 'Transcripts', 111, 101, 111),
    (1002, '2024-02-10', 'Approved', 'Passport Copy', 112, 102, 222),
    (1003, '2024-03-05', 'Pending', 'Recommendation Letters', 113, 103, 333),
    (1004, '2024-04-20', 'Approved', 'Financial Statement', 114, 104, 444),
    (1005, '2024-05-25', 'Pending', 'Health Clearance', 115, 105, 555),
    (1006, '2024-06-30', 'Approved', 'Insurance Documents', 116, 106, 666),
    (1007, '2024-07-15', 'Pending', 'Visa Application', 117, 107, 777),
    (1008, '2024-08-20', 'Approved', 'Acceptance Letter', 118, 108, 888),
    (1009, '2024-09-10', 'Pending', 'Essay', 119, 109, 999),
    (1010, '2024-10-05', 'Approved', 'Language Proficiency Certificate', 120, 110, 1000);
 
/*Housing*/
INSERT INTO housing (housing_id, type, cost, study_abroad_program_id)
VALUES
    (1111, 'Apartment', 800, 111),
    (2222, 'Dormitory', 600, 112),
    (3333, 'Shared House', 700, 113),
    (4444, 'Homestay', 900, 114),
    (5555, 'Apartment', 850, 115),
    (6666, 'Dormitory', 600, 116),
    (7777, 'Shared House', 750, 117),
    (8888, 'Homestay', 950, 118),
    (9999, 'Apartment', 820, 119),
    (10000, 'Dormitory', 650, 120);
    
/*Language Proficiency*/
INSERT INTO language_proficiency (language_proficiency_id, language_proficiency, languages, proficiency_level, student_id)
VALUES
    (11, 'Advanced', 'English', 'Advanced', 101),
    (22, 'Intermediate', 'Spanish', 'Intermediate', 102),
    (33, 'Basic', 'French', 'Basic', 103),
    (44, 'Fluent', 'German', 'Fluent', 104),
    (55, 'Advanced', 'Chinese', 'Advanced', 105),
    (66, 'Intermediate', 'Japanese', 'Intermediate', 106),
    (77, 'Basic', 'Italian', 'Basic', 107),
    (88, 'Fluent', 'Portuguese', 'Fluent', 108),
    (99, 'Advanced', 'Russian', 'Advanced', 109),
    (100, 'Intermediate', 'Arabic', 'Intermediate', 110);
 
/*Emergency Contact*/
INSERT INTO emergency_contact (emergency_contact_id, first_name, last_name, relationship, contact_number, student_id)
VALUES
    (201, 'John', 'Diaz', 'Parent', '123-456-7890', 101),
    (202, 'Jane', 'Smith', 'Sibling', '987-654-3210', 102),
    (203, 'Michael', 'Johnson', 'Friend', '456-789-0123', 103),
    (204, 'Emily', 'Brown', 'Guardian', '789-012-3456', 104),
    (205, 'David', 'Wilson', 'Parent', '234-567-8901', 105),
    (206, 'Sarah', 'Taylor', 'Sibling', '890-123-4567', 106),
    (207, 'Olivia', 'Martinez', 'Friend', '567-890-1234', 107),
    (208, 'Daniel', 'Garcia', 'Guardian', '901-234-5678', 108),
    (209, 'Sophia', 'Rodriguez', 'Parent', '345-678-9012', 109),
    (210, 'Matthew', 'Lopez', 'Sibling', '012-345-6789', 110);
 
/*Financial Aid*/
INSERT INTO financial_aid (financial_aid_id, scholarship_name, amount, approval_status, student_id)
VALUES
    (301, 'Merit Scholarship', 5000, 'Approved', 101),
    (302, 'Need-Based Grant', 3000, 'Approved', 102),
    (303, 'Athletic Scholarship', 6000, 'Pending', 103),
    (304, 'Research Fellowship', 7000, 'Approved', 104),
    (305, 'Study Abroad Stipend', 4000, 'Pending', 105),
    (306, 'Service Award', 3500, 'Approved', 106),
    (307, 'Leadership Grant', 4500, 'Pending', 107),
    (308, 'Community Scholarship', 5500, 'Approved', 108),
    (309, 'Artistic Achievement Award', 6500, 'Pending', 109),
    (310, 'Travel Fund', 2500, 'Approved', 110);
 
 
/*Orientation Session*/
INSERT INTO orientation_session (Orientation_session_id, date, student_id)
VALUES
    (601, '2024-05-01', 101),
    (602, '2024-05-05', 102),
    (603, '2024-05-10', 103),
    (604, '2024-05-15', 104),
    (605, '2024-05-20', 105),
    (606, '2024-05-25', 106),
    (607, '2024-05-30', 107),
    (608, '2024-06-01', 108),
    (609, '2024-06-05', 109),
    (610, '2024-06-10', 110);
    
/*3.Alter Student Table to add a colum for Last Login Date*/    
ALTER TABLE student
ADD COLUMN last_login DATE;    
/*Alter Student Table to add a constraint to check gender*/ 
ALTER TABLE student
ADD CONSTRAINT chk_gender CHECK (gender IN ('Male', 'Female', 'Other'));   

ALTER TABLE application
ADD COLUMN required_documents VARCHAR(45) NOT NULL DEFAULT 0,
ADD COLUMN submission_deadline DATE;

    
/*4.1. When a student's application has the required number of documents submitted, the application status should automatically update to 'Complete'  and If an application’s update occurs past the submission deadline, the status should automatically update to 'Closed'.*/    
DELIMITER //

DROP TRIGGER IF EXISTS trg_update_status_to_complete;

CREATE TRIGGER trg_update_status_to_complete
AFTER UPDATE ON application
FOR EACH ROW
BEGIN
  IF NEW.documents_submitted >= NEW.required_documents AND NEW.status != 'Complete' THEN
    UPDATE application
    SET status = 'Complete'
    WHERE application_id = NEW.application_id;
  END IF;
END //

DELIMITER ;
DELIMITER //

DROP TRIGGER IF EXISTS trg_update_status_to_closed;

CREATE TRIGGER trg_update_status_to_closed
BEFORE UPDATE ON application
FOR EACH ROW
BEGIN
  IF CURDATE() > NEW.submission_deadline AND NEW.status NOT IN ('Closed', 'Complete') THEN
    SET NEW.status = 'Closed';
  END IF;
END //

DELIMITER ;



      
/*4.2 For each country, list the number of study abroad programs available, the average cost of housing, the start date, end date associated with these programs and then create a view of this.*/   
/*Using Sub Query*/
CREATE VIEW CountryStudyProgramInfo AS
SELECT 
    c.country_name,
    COUNT(sap.study_abroad_program_id) AS num_programs,
    COALESCE(AVG(h.cost), 0) AS avg_housing_cost,
    MIN(sap.start_date) AS earliest_start_date,
    MAX(sap.end_date) AS latest_end_date
FROM 
    country c
JOIN 
    studyabroadprogram sap ON c.country_code = sap.country_code
LEFT JOIN 
    housing h ON sap.study_abroad_program_id = h.study_abroad_program_id
GROUP BY 
    c.country_name;

/*4.3 List all students with their respective study abroad program details, advisor, and insurance coverage information.*/
SELECT 
    s.student_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    s.email,
    s.major,
    sap.study_abroad_program_name,
    sap.start_date,
    sap.end_date,
    a.advisor_name,
    a.department,
    ti.coverage_type,
    ti.coverage_period
FROM 
    student s
JOIN 
    advisor a ON s.advisor_id = a.advisor_id
JOIN 
    travel_insurance ti ON s.travel_insurance_id = ti.travel_insurance_id
JOIN 
    application app ON s.student_id = app.student_id
JOIN 
    studyabroadprogram sap ON app.study_abroad_program_id = sap.study_abroad_program_id
WHERE 
    app.status = 'Approved';



/*4.4 Find the most popular destination for each major based on the number of students enrolled in study abroad programs.*/
SELECT 
    s.major,
    c.country_name,
    COUNT(*) AS number_of_students
FROM 
    student s
JOIN 
    application app ON s.student_id = app.student_id
JOIN 
    studyabroadprogram sap ON app.study_abroad_program_id = sap.study_abroad_program_id
JOIN 
    country c ON sap.country_code = c.country_code
WHERE 
    app.status = 'Approved'
GROUP BY 
    s.major, c.country_name
ORDER BY 
    s.major, number_of_students DESC;
