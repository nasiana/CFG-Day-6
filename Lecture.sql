-- creatings views

-- vw_staff_common is simply the name of the view
-- follow CREATE/REPLACE WITH AS
CREATE OR REPLACE VIEW vw_staff_common AS
-- anything that follows after 'as' will be the query that is shown in the view
select employeeID, firstname
from staff
-- USE WITH CHECK OPTION, such as when inserting data that would be filtered out of the view due to conditions imposed in the CREATE VIEW, i.e. results that would have shown in the original table but not view. 
-- WITH CHECK means that the command will not be executed and will present an error
-- allows you to check whether data would be inserted into the table according to the filters present in the CREATE VIEW
WITH CHECK OPTION;

select * from vw_staff_common;

-- stored function

use bank;

DELIMITER $$

CREATE FUNCTION IsEligible(balance INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
-- business logic
DECLARE customer_status VARCHAR(20);
IF balance > 100 THEN
SET customer_status = 'YES';
ELSEIF (balance >= 50 and balance <= 100) THEN
SET customer_status = 'MAYBE';
ELSEIF balance < 50 THEN
SET customer_status = 'NO';
END IF;

RETURN(customer_status)
END $$
DELIMITER ;

-- example stored procedure 

DELIMITER //
-- Create Stored Procedure
CREATE PROCEDURE Greetings( GreetingWordd VARCHAR(100), FirstName VARCHAR(100))
BEGIN
	DECLARE FullGreeting VARCHAR(200);
	SET FullGreeting = CONCAT(GreetingWordd,' ',FirstName);
	SELECT FullGreeting;
END//
-- Change Delimiter again
DELIMITER ;

-- Call Stored Procedure
CALL Greetings('Bonjour,', 'Dave');

-- create a stored procedure you can call to easily insert data into bakery database