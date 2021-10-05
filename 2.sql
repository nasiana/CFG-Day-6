-- example

use bakery;

DELIMITER //
CREATE PROCEDURE 
InsertValue(ID INT, ItemName VARCHAR(20), Price FLOAT, MainIngredient VARCHAR(10)) -- add required parameters
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

CALL InsertValue(7, 'pizza', 3, 'dough');
select * from savoury;

