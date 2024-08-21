use hospital_management_system;
desc Doctor;
desc Patient;
desc Lab_Test;

select * from Doctor;
select * from Patient;
select * from Lab_Test;


insert into Doctor values
(101, 'John', 'Smith', 'MD', 1, 'Cardiology'),
(102, 'Grace', 'Ritchie', 'MD', 7, 'Emergency'),
(103, 'Dennis', 'Doe', 'MD', 3, 'Diagnostic'),
(104, 'James', 'White', 'MD', 7, 'Emergency');

insert into Patient values
(1, 'John',  'Doe', 20, '456-7890', 'A+', 'john.doe@gmail.com', 'Male', 'Injury', '2023-01-01', '2023-01-10', 'Paid', '102'),
(2, 'Jane',  'Smith', 50, '459-7800', 'O-', 'jane.smith@gmail.com', 'Female', 'Flu', '2023-02-05', '2023-02-15', 'Pending', '101'),
(3, 'Emily',  'Williams', 30, '559-7320', 'B-', 'emily.williams@gmail.com', 'Female', 'Allergies', '2023-04-15', '2023-04-25', 'Paid', '102'),
(4, 'Robert', 'Brown', 55, '259-7320', 'B+', 'robert.brown@gmail.com', 'Male', 'Fracture', '2023-05-25', '2023-05-30', 'Paid', '104');

insert into Lab_Test value
(509, 1, 'Elliot Reid', 102, '2000.00', '2023-01-02'),
(510, 2, 'Bob Kelso', '101', '3000.00', '2023-02-06'),
(511, 3, 'John Wen', '102', '3050.00', '2023-04-16'),
(512, 4, 'Percival Cox', '104', '5000.00', '2023-05-26');















