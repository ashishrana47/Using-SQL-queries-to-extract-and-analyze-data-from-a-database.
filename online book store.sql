--Table 1 

DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);

--Table 2

DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);
 
--Table 3

DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);


SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- Import Data into Books Table-------------------------------------------------------------

COPY Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock) 
FROM 'C:\Users\Ashish\Downloads\Books.csv' 
CSV HEADER;

-- Import Data into Customers Table---------------------------------------------------------

COPY Customers(Customer_ID, Name, Email, Phone, City, Country) 
FROM 'C:\Users\Ashish\Downloads\Customers.csv' 
CSV HEADER;

-- Import Data into Orders Table------------------------------------------------------------

COPY Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount) 
FROM 'C:\Users\Ashish\Downloads\Orders.csv' 
CSV HEADER;

-- 1) Retrieve all books in the "Fiction" genre:  

SELECT * FROM Books 
WHERE Genre='Fiction';

 -- This query will join the Orders and Books tables to find the total quantity sold for each book and then list the top 5.

SELECT
    T2.Title,
    T2.Author,
    SUM(T1.Quantity) AS Total_Quantity_Sold
FROM
    Orders AS T1
INNER JOIN
    Books AS T2 ON T1.Book_ID = T2.Book_ID
GROUP BY
    T2.Title, T2.Author
ORDER BY
    Total_Quantity_Sold DESC
LIMIT 5;

--This query shows the average price for books within each Genre.


SELECT
    Genre,
    AVG(Price) AS Average_Price_by_Genre
FROM
    Books
GROUP BY
    Genre
ORDER BY
    Average_Price_by_Genre DESC;
	
--This query uses a scalar subquery to first calculate the average price of all books and then filters the main result set to show only books with a price higher than that average.

SELECT
    Title,
    Genre,
    Price
FROM
    Books
WHERE
    Price > (
    -- Subquery: Calculates the overall average price of all books
        SELECT
            AVG(Price)
        FROM
            Books
    )
ORDER BY
    Price DESC;