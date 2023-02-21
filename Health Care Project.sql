DROP TABLE PROJ_Appointments;
DROP TABLE PROJ_Patients;
DROP TABLE PROJ_Employees;
DROP TABLE PROJ_Jobs;
DROP TABLE PROJ_Departments;
DROP TABLE PROJ_Location;
DROP TABLE PROJ_Hospital;

CREATE TABLE PROJ_Hospital
(
hospital_id NUMBER(6) CONSTRAINT pk_hsp PRIMARY KEY
);
ALTER TABLE PROJ_Hospital ADD
(
hospital_name VARCHAR2(20) NOT NULL
);

CREATE TABLE PROJ_Location
(
location_id NUMBER(6) CONSTRAINT pk_loc PRIMARY KEY,
city VARCHAR2(20),
street VARCHAR2(20)
);
ALTER TABLE PROJ_Location ADD
(street_no NUMBER(6));

CREATE TABLE PROJ_Departments
(
department_id NUMBER(6) CONSTRAINT pk_dpt PRIMARY KEY,
 hospital_id NUMBER(6),
 CONSTRAINT fk_hsp FOREIGN KEY(hospital_id) REFERENCES PROJ_Hospital(hospital_id),
 location_id NUMBER(6),
 CONSTRAINT fk_loc FOREIGN KEY(location_id) REFERENCES PROJ_Location(location_id)
);
ALTER TABLE PROJ_Departments ADD 
( departmanet_name VARCHAR2(20));

CREATE TABLE PROJ_Jobs
(
job_id NUMBER(6) CONSTRAINT pk_job PRIMARY KEY,
salary NUMBER(6) UNIQUE,
department_id NUMBER(6),
CONSTRAINT fk_dpt FOREIGN KEY(department_id) REFERENCES PROJ_Departments(department_id)
);
Alter Table PROJ_JOBS ADD (job_name VARCHAR2(20));


CREATE TABLE PROJ_Employees
(
employee_id NUMBER(6) CONSTRAINT pk_emp PRIMARY KEY,
employee_name VARCHAR2(20) UNIQUE,
manager_id NUMBER(6),
job_id NUMBER(6),
CONSTRAINT fk_job FOREIGN KEY(job_id) REFERENCES PROJ_Jobs(job_id),
salary NUMBER(6) ,
CONSTRAINT fk_sal FOREIGN KEY(salary) REFERENCES PROJ_Jobs(salary),
CONSTRAINT fk_manager FOREIGN KEY(manager_id) REFERENCES PROJ_Employees(employee_id)
);
ALTER TABLE PROJ_Employees ADD 
(
email VARCHAR2(20),
phone NUMBER(10)
);



CREATE TABLE PROJ_Patients
(
patient_id NUMBER(6) CONSTRAINT pk_ptnt PRIMARY KEY,
patient_name VARCHAR2(20),
phone NUMBER(10)
);
ALTER TABLE PROJ_Patients DROP COLUMN phone;

CREATE TABLE PROJ_Appointments
(
appointment_id NUMBER(6) CONSTRAINT pk_appt PRIMARY KEY,
appointment_date DATE,
appointment_number NUMBER(3),
patient_id NUMBER(6),
CONSTRAINT fk_pat FOREIGN KEY(patient_id) REFERENCES PROJ_Patients(patient_id),
department_id NUMBER(6),
CONSTRAINT fk_depid FOREIGN KEY(department_id) REFERENCES PROJ_Departments(department_id)
);
ALTER TABLE PROJ_Appointments DROP COLUMN appointment_number;



INSERT INTO PROJ_Hospital values(1, 'Spitalul Judetean');
INSERT INTO PROJ_Hospital values(2, 'Spitalul Municipal');
INSERT INTO PROJ_Hospital values(3, 'Spitalul Sf. Ana');
INSERT INTO PROJ_Hospital values(4, 'Spitalul de nebuni');

DELETE FROM PROJ_Hospital where hospital_id = 4;

SELECT * FROM PROJ_Hospital;

INSERT INTO PROJ_Location values(1, 'Constanta', 'Str. Sanatatii', '28');
INSERT INTO PROJ_Location values(2, 'Bucuresti', 'Str. Vietii', '12');
INSERT INTO PROJ_Location values(3, 'Valcea', 'Soseaua Valcea', '1');

SELECT * FROM PROJ_Location;

INSERT INTO PROJ_Departments values(1, 1, 1 , 'Endocrinologie');
INSERT INTO PROJ_Departments values(2, 1, 1 , 'Oftalmologie');
INSERT INTO PROJ_Departments values(3, 1, 1 , 'Medicina dentara');

INSERT INTO PROJ_Departments values(4, 2, 2, 'Cardiologie');
INSERT INTO PROJ_Departments values(5, 2, 2, 'Chirurgie');
INSERT INTO PROJ_Departments values(6, 2, 2, 'Pneumonie');

INSERT INTO PROJ_Departments values(7, 3, 3 , 'Dermatologie');
INSERT INTO PROJ_Departments values(8, 3, 3 , 'Reumatologie');
INSERT INTO PROJ_Departments values(9, 3, 3 , 'Urologie');

SELECT * FROM PROJ_Departments;

INSERT INTO PROJ_Jobs values(1, 5700, 1, 'Doctor');
INSERT INTO PROJ_Jobs values(2, 4300, 2, 'Asistent');
INSERT INTO PROJ_Jobs values(3, 5000, 3, 'Doctor');
INSERT INTO PROJ_Jobs values(4, 4000, 4, 'Asistent');
INSERT INTO PROJ_Jobs values(5, 5200, 5, 'Doctor');
INSERT INTO PROJ_Jobs values(6, 3900, 6, 'Asistent');
INSERT INTO PROJ_Jobs values(7, 4100, 7, 'Asistent');
INSERT INTO PROJ_Jobs values(8, 6000, 8, 'Doctor');
INSERT INTO PROJ_Jobs values(9, 3800, 9, 'Asistent');

SELECT* FROM PROJ_Jobs ORDER BY job_name;

INSERT INTO PROJ_Employees values(1, 'Rusu Sergiu-Ioan', NULL, 1, 5700, 'rususergiu21@ase.ro', 0722232323);
INSERT INTO PROJ_Employees values(2, 'Licxandru Teodora', NULL, 5, 5200, 'licxthea@ase.ro', 0712332123);
INSERT INTO PROJ_Employees values(3, 'Nistor Stefana', NULL, 8, 6000, 'nistorstefana@ase.ro', 0765757575);
INSERT INTO PROJ_Employees values(4, 'Petrescu Roxana', 2, 4, 4000, 'petrescurox@ase.ro', 0765123456);
INSERT INTO PROJ_Employees values(5, 'Milea Robert',2, 5, 5200, 'mileaboss@ase.ro', 0778995522);
INSERT INTO PROJ_Employees values(6, 'Rata Stefania', 2, 6, 3900, 'ratastef@macmac.ro', 0777888777);
INSERT INTO PROJ_Employees values(7, 'Rosu Ionut', 1, 1, 5700, 'rosuiout@poli.ro', 0732334455);
INSERT INTO PROJ_Employees values(8, 'Onea Maria', 1, 2, 4300, 'mariaonea@upb.ro', 0765655656);
INSERT INTO PROJ_Employees values(9, 'Tanase Theodor',1, 3, 5000, 'theodortns@upb.ro', 0733445566);
INSERT INTO PROJ_Employees values(10, 'Popa Madalin',3,7,4100,'popamada@ase.ro',0733441122);
INSERT INTO PROJ_Employees values(11, 'Nistor Andrei', 3, 8, 6000, 'andrei_nist@uni.ro', 0745055932);
INSERT INTO PROJ_Employees values(12, 'Mihalovici Tudor',3,9,3800, 'mihalovicit@ase.ro', 0745010622);
SELECT * FROM PROJ_Employees order by MANAGER_ID;

INSERT INTO PROJ_Patients values(1, 'Bogdan DLP');
INSERT INTO PROJ_Patients values(2, 'Mihaita Piticu');
INSERT INTO PROJ_Patients values(3, 'Florin Salam');
INSERT INTO PROJ_Patients values(4, 'Uraganul Tzanca');

SELECT * FROM PROJ_Patients;

UPDATE PROJ_Patients
set patient_name = 'Bogdan Ploiesti' where patient_id = 1;

INSERT INTO PROJ_Appointments values(1, '12-JAN-2023', 1 , 1);
INSERT INTO PROJ_Appointments values(2, '21-JAN-2023', 3 , 1);
INSERT INTO PROJ_Appointments values(3, '17-FEB-2023', 4 , 3);
INSERT INTO PROJ_Appointments values(4, '25-MAR-2023', 2 , 2);

SELECT * FROM PROJ_Appointments;

-- in order to make sure that the salary in jobs and employees is the same we will mergem them based on job id

MERGE INTO PROJ_Employees e
Using PROJ_Jobs j
on(e.job_id=j.job_id)
WHEN MATCHED THEN UPDATE SET e.salary = j.salary;

--We added the patient name and merged with the values in patient 
ALTER TABLE PROJ_Appointments ADD (patient_name VARCHAR2(20));
MERGE INTO PROJ_Appointments a USING PROJ_Patients p
on(p.patient_id = a.patient_id)
WHEN MATCHED THEN UPDATE SET a.patient_name = p.patient_name;
SELECT * FROM PROJ_Appointments;


