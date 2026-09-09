/* =========================================================
   CinemaBookingSystem — Sample Queries
   Run after schema.sql and seed-data.sql.
   A mix of SELECT, aggregation, and data-modification
   statements demonstrating how the schema is used.
   ========================================================= */

USE CinemaBookingSystem;
GO

-- All ticket details, via the view
SELECT * FROM TicketDetailsView;

-- Every ticket booked by a specific customer
SELECT * FROM TicketDetailsView
WHERE CustomerName = 'Donna' AND CustomerSurname = 'Bencic';

-- Full schedule, chronological order
SELECT * FROM TicketDetailsView
ORDER BY SessionDate, SessionTime;

-- Session listing with price, independent of bookings
SELECT
    M.Title,
    H.HallName,
    MS.SessionDate,
    MS.SessionTime,
    MS.Price
FROM MovieSessions MS
JOIN Movies M
    ON MS.MovieID = M.MovieID
JOIN Halls H
    ON MS.HallID = H.HallID;

-- Average ticket price across all sessions
SELECT AVG(Price) AS AverageTicketPrice
FROM MovieSessions;

-- Most-booked movies, busiest first
SELECT
    M.Title,
    COUNT(B.BookingID) AS TotalBookings
FROM Bookings B
JOIN MovieSessions MS
    ON B.MovieSessionID = MS.MovieSessionID
JOIN Movies M
    ON MS.MovieID = M.MovieID
GROUP BY M.Title
ORDER BY TotalBookings DESC;

-- Example price updates
UPDATE MovieSessions
SET Price = 350
WHERE MovieSessionID = 1;

UPDATE MovieSessions
SET Price = 235.90
WHERE MovieID = 2;

-- Example cancellation
DELETE FROM Bookings
WHERE BookingID = 30;
