/* =========================================================
   CinemaBookingSystem — Schema
   Microsoft SQL
   Run this file first. Creates the database, tables,
   constraints, indexes, and a reporting view.
   ========================================================= */

CREATE DATABASE CinemaBookingSystem;
GO

USE CinemaBookingSystem;
GO

CREATE TABLE Directors(
    DirectorID INT PRIMARY KEY IDENTITY(1,1),
    DirectorName VARCHAR(100) NOT NULL,
    DirectorSurname VARCHAR(100) NOT NULL
);

CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100) NOT NULL,
    CustomerSurname VARCHAR(100) NOT NULL,
    CustomerPhoneNumber VARCHAR(50) UNIQUE
);

CREATE TABLE Movies(
    MovieID INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(100) NOT NULL,
    Duration INT NOT NULL CHECK(Duration > 0),
    Genre VARCHAR(100) NOT NULL,
    ReleaseYear INT NOT NULL
);

-- Many-to-many: a movie can have several directors, a director can have several movies
CREATE TABLE MovieDirectors(
    MovieID INT NOT NULL FOREIGN KEY
        REFERENCES Movies(MovieID),
    DirectorID INT NOT NULL FOREIGN KEY
        REFERENCES Directors(DirectorID),
    PRIMARY KEY(MovieID, DirectorID)
);

CREATE TABLE Halls(
    HallID INT PRIMARY KEY IDENTITY(1,1),
    HallName VARCHAR(50) NOT NULL
);

CREATE TABLE MovieSessions(
    MovieSessionID INT PRIMARY KEY IDENTITY(1,1),

    MovieID INT NOT NULL FOREIGN KEY
        REFERENCES Movies(MovieID),

    HallID INT NOT NULL FOREIGN KEY
        REFERENCES Halls(HallID),

    Price DECIMAL(6,2) NOT NULL CHECK(Price > 0) DEFAULT 150.00,
    SessionDate DATE NOT NULL,
    SessionTime TIME NOT NULL,

    -- Prevents scheduling two sessions in the same hall at the same date/time
    CONSTRAINT Hall_Session
        UNIQUE(HallID, SessionDate, SessionTime)
);

CREATE TABLE Bookings(
    BookingID INT NOT NULL PRIMARY KEY IDENTITY(1,1),

    CustomerID INT NOT NULL FOREIGN KEY
        REFERENCES Customers(CustomerID),

    MovieSessionID INT NOT NULL FOREIGN KEY
        REFERENCES MovieSessions(MovieSessionID),

    SeatNumber VARCHAR(20) NOT NULL,

    -- Prevents the same seat being booked twice for the same session
    CONSTRAINT Session_Seat
        UNIQUE(MovieSessionID, SeatNumber)
);

-- Speeds up title lookups/searches
CREATE INDEX Index_Movies_Title
    ON Movies(Title);

-- Speeds up hall-schedule lookups
CREATE INDEX Index_Hall_Time
    ON MovieSessions(HallID, SessionTime);
GO

-- Everything needed to be displayed in a ticket
CREATE VIEW TicketDetailsView
AS
SELECT
    C.CustomerName,
    C.CustomerSurname,
    M.Title,
    H.HallName,
    MS.SessionDate,
    MS.SessionTime,
    B.SeatNumber
FROM Bookings B
JOIN Customers C
    ON B.CustomerID = C.CustomerID
JOIN MovieSessions MS
    ON B.MovieSessionID = MS.MovieSessionID
JOIN Movies M
    ON MS.MovieID = M.MovieID
JOIN Halls H
    ON MS.HallID = H.HallID;
GO
