/*DROP TABLE IF EXISTS CUSTOMER; 
DROP TABLE IF EXISTS ORDERS;
DROP TABLE IF EXISTS DELIVERY;
DROP TABLE IF EXISTS PIZZA;
DROP TABLE IF EXISTS PIZZA_INGREDIENT;
DROP TABLE IF EXISTS ORDER_STATUS;
DROP TABLE IF EXISTS PIZZA_ORDER;
DROP TABLE IF EXISTS PIZZA_RECIPE;*/

CREATE TABLE CUSTOMER(
    Customer_ID NUMERIC (3),
    Customer_Name VARCHAR (40),
    Phone CHAR (12),
    Customer_Address VARCHAR (40)
) ENGINE InnoDB;

CREATE TABLE ORDERS(
    Order_ID NUMERIC (3),
    Customer_ID NUMERIC (3),
    Feedback_Score NUMERIC (3),
    Comments CHAR (50),
    Order_Status VARCHAR (63)
    Order_Date DATE,
    Order_Time VARCHAR (7), 
    Total_Price VARCHAR (63),
) ENGINE InnoDB;

CREATE TABLE DELIVERY(
    Employee_ID NUMERIC (3),
    Customer_ID NUMERIC (3),
    Trip_Distance VARCHAR (4),
    Time_Delivered VARCHAR (7)
) ENGINE InnoDB;

CREATE TABLE PIZZA(
    Pizza_ID NUMERIC (3),
    Size CHAR (1),
    Quantity_of_Pizzas NUMERIC (63),
    Pizza_Type CHAR (9)
) ENGINE InnoDB;

CREATE TABLE PIZZA_INGREDIENT(
    Ingredient_ID NUMERIC (3),
    Pizza_ID NUMERIC (3),
    Ingredient_Type VARCHAR (63),
    Ingredient_Quantity NUMERIC (63),
    Ingredient_Price VARCHAR (10)
) ENGINE InnoDB;


ALTER TABLE CUSTOMER ADD CONSTRAINT CUSTOMER_pk PRIMARY KEY (Customer_ID);
ALTER TABLE ORDERS ADD CONSTRAINT ORDERS_pk PRIMARY KEY (Order_ID);
ALTER TABLE DELIVERY ADD CONSTRAINT DELIVERY_pk PRIMARY KEY (Employee_ID);
ALTER TABLE PIZZA ADD CONSTRAINT PIZZA_pk PRIMARY KEY (Pizza_ID);
ALTER TABLE PIZZA_INGREDIENT ADD CONSTRAINT PIZZA_INGREDIENT_pk PRIMARY KEY (Ingredient_ID);

ALTER TABLE ORDERS ADD CONSTRAINT ORDERS_Customer_ID_fk FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER (Customer_ID);
ALTER TABLE DELIVERY ADD CONSTRAINT DELIVERY_Customer_ID_fk FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER (Customer_ID);
ALTER TABLE PIZZA_INGREDIENT ADD CONSTRAINT PIZZA_INGREDIENT_Pizza_ID_fk FOREIGN KEY (Pizza_ID) REFERENCES PIZZA (Pizza_ID);
ALTER TABLE PIZZA ADD CONSTRAINT PIZZA_Ingredient_ID_fk FOREIGN KEY (Ingredient_ID) REFERENCES PIZZA_INGREDIENT (Ingredient_ID);

INSERT INTO CUSTOMER (Customer_ID, Customer_Name, Phone, Customer_Address) VALUES 
(123, 'Jack Smith', '(403) 660-9873', '123 Main St.'),
(567, 'Mike Dean', '(587) 220-4556', '99 Tree St.'),
(890, 'Leroy Jenkins', '(403) 330-5677', '456 Lane Way'),
(344, 'Travis Scott', '(587) 449-6099', '90 Dog St.'),
(209, 'Mike Jackson', '(403) 776-1234', '47 Pine St.'),
(606, 'Kelly Lan ', '(587) 441-0999', '765 Rund Way'),
(435, 'Jessie Dam', '(403) 123-7864', '43 Apple St.'),
(190, 'Melissa Trot', '(403) 223-9586', '64 Beddington Ln.'),
(909, 'Drip Muni', '(403) 786-4345', '23 Water Blvd.'),
(100, 'Steve Eek', '(587) 334- 2345', '54 Airdene Rd.');
INSERT INTO ORDERS (Order_ID, Customer_ID, Feedback_Score, Comments, Order_Status, Order_Date, Order_Time, Total_Price) VALUES
(999, 123, 3, 'Slower service.', 'Delivered by driver', 2022-12-18, '01:30:05', '23.50'),
(888, 567, 4, 'Good food!', 'Ready for pickup', 2022-12-18, '12:30:00', '56.33'),
(777, 890, 5, 'Fantastic place!', 'Ready for pickup', 2022-12-18, '21:34:43', '54.55'),
(666, 344, 2, 'It was ok', 'Driver picked up', 2022-12-18, '13:30:00', '86.66'),
(555, 209, 3, 'Food was good but service ws slow', 'Driver picked up', 2022-12-17, '16:45:00', '23.45'),
(444, 606, 1, 'The food was okay, poor service', 'Delivered by driver', 2022-12-17, '15:43:09', '22.69'),
(333, 435, 5, 'Iloved the food!', 'Delivered by driver', 2022-12-17, '11:30:11', '45.65'),
(222, 190, 5, 'Everything was great!', 'Ready for pickup', 2022-12-17, '01:45:15', '54.76'),
(111, 909, 5, 'Great service!', 'Driver picked up', 2022-12-17, '17:30:25', '12.34');
INSERT INTO DELIVERY (Employee_ID, Customer_ID, Order_ID, Trip_Distance, Time_Delivered) VALUES
(001, 123, 999, '12.12', '14:50:55'),
(002, 567, 888, '5.05', '16:40:35'),
(003, 890, 777, '6.66', '20:34:45'),
(004, 344, 666, '3.20', '23:30:28');
INSERT INTO PIZZA (Pizza_ID, Ingredient_ID, Size, Pizza_Type) VALUES
(099, 199, 'S', 'Pepperoni'),
(098, 198, 'M', 'Pepperoni'),
(097, 197, 'M', 'Meat lovers'),
(096, 196, 'L', 'Pepperoni'),
(095, 195, 'S', 'Meat lovers'),
(094, 194, 'S', 'Vegetarian'),
(093, 193, 'L', 'Pepperoni'),
(092, 192, 'L', 'Cheese'),
(091, 191, 'S', 'Hawaiian'),
(090, 190, 'S', 'Meat lovers'),
(089, 189, 'M', 'Hawaiian'),
(088, 188, 'M', 'Meat lovers'),
(087, 187, 'M', 'Pepperoni'),
(086, 186, 'S', 'Meat lovers'),
(085, 185, 'L', 'Hawaiian'),
(084, 184, 'S', 'Meat lovers');
INSERT INTO PIZZA_INGREDIENT (Ingredient_ID, Pizza_ID, Ingredient_Type, Ingredient_Quantity, Ingredient_Price) VALUES
(199, 099, 'Meat', 12, 3.99),
(198, 098, 'Meat', 100, 3.99),
(197, 097, 'Meat', 122, 3.99),
(196, 096, 'Meat', 34, 3.99),
(195, 095, 'Meat', 56, 3.99);


CREATE TABLE PIZZA_ORDER (
    Pizza_ID NUMERIC (10),
    Order_ID NUMERIC (10),
    Customer_ID NUMERIC (10)
) ENGINE InnoDB;


ALTER TABLE PIZZA_ORDER ADD CONSTRAINT PIZZA_ORDER_Pizza_ID_fk FOREIGN KEY (Pizza_ID) REFERENCES PIZZA (Pizza_ID);
ALTER TABLE PIZZA_ORDER ADD CONSTRAINT PIZZA_ORDER_Order_ID_fk FOREIGN KEY (Order_ID) REFERENCES ORDERS (Order_ID);
ALTER TABLE PIZZA_ORDER ADD CONSTRAINT PIZZA_ORDER_Customer_ID_fk FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER (Order_ID);


INSERT INTO PIZZA_ORDER VALUES
(099, 999, 123),
(098, 888, 567),
(097, 777, 890),
(096, 666, 344),
(095, 555, 209),
(094, 444, 606),
(093, 333, 435),
(092, 222, 190),
(091, 111, 909);
