**WORLD**

EASY:

1. SELECT * FROM country Where Continent = 'South America';

2. SELECT Population FROM country WHERE name = 'Germany';

3. SELECT * FROM city WHERE CountryCode = 'JPN';

MEDIUM:

4. SELECT Name, Population FROM `country` WHERE Region = 'Central Africa' ORDER BY Population desc LIMIT 3;

5. SELECT Name, LifeExpectancy FROM `country` WHERE Population BETWEEN 1000000 AND 5000000;

6. SELECT country.Name FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode Where countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T';

**CHINOOK**

EASY:

7. SELECT Album.Title FROM Album JOIN Artist ON Album.ArtistId = Artist.ArtistId WHERE Artist.Name = 'AC/DC';

8. SELECT Customer.FirstName, Customer.LastName, Customer.Email FROM Customer WHERE Customer.Country = 'Brazil';

9. SELECT * FROM Playlist;

MEDIUM:

10. SELECT SUM(Track.GenreId) FROM Track JOIN Genre ON Track.GenreId = Genre.GenreId WHERE Genre.Name = 'Rock';

11. SELECT Employee.FirstName, Employee.LastName FROM Employee WHERE Employee.ReportsTo = '2';

12. SELECT C.CustomerId, C.FirstName, C.LastName, SUM(I.Total) AS TotalSales FROM Customer C JOIN Invoice I ON C.CustomerId = I.CustomerId GROUP BY C.CustomerId, C.FirstName, C.LastName ORDER BY TotalSales DESC;

**DATABASE**

1 + 2:

CREATE TABLE Books (
    BookId INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Price DECIMAL(6, 2)
);

CREATE TABLE Customers (
    CustomerId INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

CREATE TABLE Sales (
    SaleId INT AUTO_INCREMENT PRIMARY KEY,
    CustomerId INT,
    BookId INT,
    SaleDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(8, 2),
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId),
    FOREIGN KEY (BookId) REFERENCES Books(BookId)
);

3:
  
INSERT INTO Books (Title, Author, Genre, Price) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 10.99),
('1984', 'George Orwell', 'Dystopian', 8.99),
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 12.99),
('Moby Dick', 'Herman Melville', 'Adventure', 15.99),
('The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 9.99);

INSERT INTO Customers (FirstName, LastName, Email, Phone) VALUES
('John', 'Doe', 'john.doe@example.com', '555-1234'),
('Jane', 'Smith', 'jane.smith@example.com', '555-5678'),
('Alice', 'Johnson', 'alice.johnson@example.com', '555-8765'),
('Bob', 'Brown', 'bob.brown@example.com', '555-4321'),
('Charlie', 'Davis', 'charlie.davis@example.com', '555-6789');

INSERT INTO Sales (CustomerId, BookId, SaleDate, Quantity, TotalAmount) VALUES
(1, 1, '2024-09-01', 1, 10.99),
(2, 2, '2024-09-01', 2, 17.98),
(3, 3, '2024-09-02', 1, 12.99),
(4, 5, '2024-09-03', 3, 29.97),
(5, 4, '2024-09-04', 1, 15.99);

4:

SELECT S.SaleId, C.FirstName, C.LastName, B.Title, S.Quantity, S.TotalAmount FROM Sales S JOIN Customers C ON S.CustomerId = C.CustomerId JOIN Books B ON S.BookId = B.BookId;

SELECT C.FirstName, C.LastName, SUM(S.TotalAmount) AS TotalSpent FROM Sales S JOIN Customers C ON S.CustomerId = C.CustomerId GROUP BY C.CustomerId, C.FirstName, C.LastName ORDER BY TotalSpent DESC;

SELECT B.Title, SUM(S.Quantity) AS TotalQuantitySold FROM Sales S JOIN Books B ON S.BookId = B.BookId GROUP BY B.BookId, B.Title ORDER BY TotalQuantitySold DESC;




