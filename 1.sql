USE PRACTICE;

SELECT * from practice.staff;

CREATE OR REPLACE VIEW vw_staff_Common AS
select employeeID, firstname, lastname, jobtitle, managerID, department
from staff;

select * From vw_staff_Common;

INSERT INTO vw_staff_Common ()
values 
(8888, '

