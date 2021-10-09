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
CREATE PROCEDURE Greetings
(GreetingWord VARCHAR(100), FirstName VARCHAR(100))
BEGIN
	DECLARE FullGreeting VARCHAR(200);
	SET FullGreeting = CONCAT(GreetingWord,' ',FirstName);
	SELECT FullGreeting;
END//
-- Change Delimiter again
DELIMITER ;

-- Call Stored Procedure
CALL Greetings('Bonjour,', 'Dave');

-- create a stored procedure you can call to easily insert data into bakery database

-- example
USE BAKERY;

DELIMITER //

CREATE PROCEDURE InsertValue
(
id int,
item_name varchar(50),
price float,
main_ingredient varchar(50)
)
BEGIN 
INSERT INTO bakery.savoury (
id,
item_name,
price,
main_ingredient
)
VALUES (id,
item_name,
price,
main_ingredient);

END //

DELIMITER ;

CALL InsertValue(24, 'pizza', 22, 'dough');

select * from bakery.savoury;

-- Clare's code

DELIMITER //
CREATE PROCEDURE InsertValue(ID INT, ItemName VARCHAR(20), Price FLOAT, MainIngredient VARCHAR(10)) -- add required parameters
BEGIN
-- insert values inside the Savoury table in the bakery DB
	INSERT INTO Savoury(
		id,
		item_name,
		price,
		main_ingredient
		)
    VALUES(
		ID,
		ItemName,
		Price,
		MainIngredient
		);
END //
DELIMITER ;
