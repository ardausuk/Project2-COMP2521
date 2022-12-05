/*
 Creating DB TABLE
 */

/* Drop all tables if they already exist. */


DROP TABLE IF EXISTS PIZZA;

DROP TABLE IF EXISTS CUSTOMER;

DROP TABLE IF EXISTS ORDER;

DROP TABLE IF EXISTS INGREDIENT;

DROP TABLE IF EXISTS DELIVERY;

DROP TABLE IF EXISTS CUSTOM;

DROP TABLE IF EXISTS PRESET;

CREATE TABLE PIZZA(
    Pizza_ID NUMERIC () NOT NULL,
    PRIMARY KEY (Pizza_ID),
    Diameter VARCHAR(),
    Quantity NUMERIC(),
    Extras VARCHAR (),
    Pizza_Type VARCHAR()
) ENGINE InnoDB;

CREATE TABLE CUSTOMER (
    Customer_ID NUMERIC () NOT NULL,
    PRIMARY KEY (Customer_ID),
    Name VARCHAR (),
    Phone_Number CHAR (),
    Address VARCHAR()
) ENGINE InnoDB;

CREATE TABLE ORDER (
    Order_ID NUMERIC () NOT NULL,
    PRIMARY KEY (Order_ID),
    Customer_ID NUMERIC(),
    FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER (Customer_ID),
    Feedback_Score NUMERIC (),
    Comment VARCHAR(),
    Date CHAR (),
    Time_Placed CHAR (),
    Order_Status VARCHAR (),
    Total_Price VARCHAR (),
    Pick_Up VARCHAR(),
) ENGINE InnoDB;

CREATE TABLE INGREDIENT(
    Ingredient_Name NUMERIC (),
    PRIMARY KEY (Ingredient_Name),
    Ingredient_Type VARCHAR (),
    Ingredient_Quantity NUMERIC ()
) ENGINE InnoDB;

CREATE TABLE DELIVERY (
    Employee_ID NUMERIC () NOT NULL,
    PRIMARY KEY (Employee_ID),
    Order_ID NUMERIC(),
    FOREIGN KEY (Order_ID) REFERENCES ORDER (Order_ID),
    Customer_ID NUMERIC (),
    FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER (Customer_ID),
    Trip_Distance VARCHAR ()
) ENGINE InnoDB;

CREATE TABLE CUSTOM(
    Pizza_ID NUMERIC(),
    FOREIGN KEY(Pizza_ID) REFERENCES PIZZA (Pizza_ID),
    Ingredient_Selection VARCHAR()
) ENGINE InnoDB;

CREATE TABLE PRESET(
    Pizza_ID NUMERIC(),
    FOREIGN KEY (Pizza_ID) REFERENCES PIZZA (Pizza_ID),
    Pizza_Name VARCHAR(),
    Ingredients VARCHAR()
) ENGINE InnoDB;


INSERT INTO PIZZA VALUES
(223, "12in", 3, "Beef", "Custom"),
(487, "14in", 2, "Chicken", "Custom"),
(999, "14in", 1, "Veggies", "Preset");

INSERT INTO CUSTOMER VALUES
(613 222, "Jack", 403-666-6666, "75 Buffalo Way"),
(200 002, "Mike", 403-451-5534, "444 Bow Road"),
(308 556, "Jess", 587-765-1933, "77 Gold Street");

INSERT INTO ORDER VALUES
(1, 613 222, 4, "Good pizza", "04/15/2022", "12:30", "Picked up", "23", "Pick up"),
(2, 200 002, 3, "Good toppings", "03/21/2022", "14:47", "Picked up", "19.50", "Pick up"),
(3, 308 556, 5, "Very tasty", "02/25/2022", "17:51", "Ready for pick up", "25", "Delivery");

INSERT INTO INGREDIENT VALUES
("Beef", "Meat", "Extra"),
("Ranch", "Sauce", "Extra"),
("Onions", "Veggies", "light");

INSERT INTO DELIVERY VALUES
(1, 612 222, 111, "12km"),
(2, 200 002, 222, "20km"),
(3, 308 556, 333, "35km");

INSERT INTO CUSTOM VALUES
(223, "Broccoli"),
(487, "Chicken"),
(999, "Olives");

INSERT INTO PRESET VALUES
(223, "Butter Chicken", "Chicken, Cheese, Curry"),
(487, "Buffalo Chicken", "Chicken, Hot sauce, Onions"),
(999, "Cheese", "Gouda, Mozzarella, Feta");