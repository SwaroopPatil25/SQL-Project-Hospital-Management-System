create database hospital_management_system;
use hospital_management_system;

create table Doctor ( 
  Doctor_ID int NOT NULL, 
  Doctor_FName varchar(20) NOT NULL, 
  Doctor_LName varchar(20) NOT NULL,
  Qualifications varchar(15) NOT NULL,
  Dept_ID int NOT NULL, 
  Dept_Name varchar(20) NOT NULL, 
  primary key (Doctor_ID) 
);

create table Patient ( 
  Patient_ID int NOT NULL, 
  Patient_FName varchar(20) NOT NULL,
  Patient_LName varchar(20) NOT NULL,
  Age int NOT NULL, 
  Phone varchar(12) NOT NULL,
  Blood_Type varchar(5) NOT NULL, 
  Email varchar(50), 
  Gender varchar(10),
  disease varchar(30),
  Admission_date date,
  Discharge_date date,
  Bill_Status varchar(20) NOT NULL,
  Doctor_ID int NOT NULL, 
  primary key (Patient_ID), 
  foreign key (Doctor_ID) references Doctor (Doctor_ID)
);

create table Lab_Test ( 
  Lab_ID int NOT NULL, 
  Patient_ID int NOT NULL,
  Technician_Name varchar(50) NOT NULL, 
  Doctor_ID int NOT NULL,   
  Test_Cost decimal(10,2),
  Test_date date NOT NULL, 
  primary key (Lab_ID), 
  foreign key (Patient_ID) references Patient (Patient_ID), 
  foreign key (Doctor_ID) references Doctor (Doctor_ID)
);

-- ***********************************************************************************************
-- view
create view accountant_view as 
select pat.Patient_FName, pat.Patient_LName, pat.Phone, pat.Email, pat.Admission_date, pat.Discharge_date, pat.Bill_Status, test.Test_Cost 
from Patient pat inner join Lab_Test test using(Patient_ID);


-- ***********************************************************************************************
-- Stored Procedure
delimiter //
create procedure doctor_name(in pId int)
begin
	select Doctor_FName, Doctor_LName, Dept_ID from Doctor 
	where Doctor_ID in (select Doctor_ID from Patient where Patient_ID = pId)
	order by Doctor_FName desc;
end //


delimiter //
create procedure bill_status(in pstatus varchar(10))
begin
	select * from accountant_view
	where Bill_Status = pstatus;
end //

-- ***********************************************************************************************
-- Stored Function

delimiter //
create function category(pId int) 
returns varchar(50) deterministic
begin
	declare category varchar(20);
    declare pat_age int;
    select Age into pat_age from Patient where Patient_ID = pId;
	if pat_age <= 14 then 
	set category = "Children";
	elseif pat_age >= 15 and pat_age <=24 then
	set category = "Youth";
    elseif pat_age >= 25 and pat_age <=64 then
	set category = "Adult";
	else 
	set category = "Senior";
	end if;
    return (category);
end //


-- ***********************************************************************************************
-- Trigger
create table Pcreated_Date(patient_id int, date_added datetime);

delimiter //
create trigger patient_record_created
after insert on Patient
for each row
begin
	insert into Pcreated_Date values(new.Patient_ID, now());
end //


-- ********************************************************************************************************

use hospital_management_system;









