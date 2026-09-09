/* =========================================================
   CinemaBookingSystem — Seed Data
   Run after schema.sql. Populates the database with sample
   directors, movies, halls, customers, sessions, and bookings
   so the queries in queries.sql return meaningful results.
   ========================================================= */

USE CinemaBookingSystem;
GO

INSERT INTO Directors(DirectorName, DirectorSurname) VALUES
('Christopher', 'Nolan'),
('Wes', 'Anderson'),
('Denis', 'Villeneuve'),
('Milos', 'Forman'),
('Bong', 'Joon-Ho');

INSERT INTO Movies(Title, Duration, Genre, ReleaseYear) VALUES
('Inception', 148, 'Science Fiction', 2010),
('Interstellar', 169, 'Science Fiction', 2014),
('The Dark Knight', 152, 'Action', 2008),
('The Grand Budapest Hotel', 99, 'Comedy-Drama', 2014),
('Moonrise Kingdom', 94, 'Comedy-Drama', 2012),
('Fantastic Mr. Fox', 87, 'Animation', 2009),
('Arrival', 116, 'Science Fiction', 2016),
('Blade Runner 2049', 164, 'Science Fiction', 2017),
('Dune', 155, 'Epic Science Fiction', 2021),
('One Flew Over the Cuckoo''s Nest', 133, 'Drama', 1975),
('Amadeus', 160, 'Biographical Drama', 1984),
('The People vs. Larry Flynt', 130, 'Drama', 1996),
('Parasite', 132, 'Thriller', 2019),
('Memories of Murder', 131, 'Crime Thriller', 2003),
('Snowpiercer', 126, 'Science Fiction', 2013);

-- MovieID, DirectorID pairs
INSERT INTO MovieDirectors VALUES
(1,1),
(2,1),
(3,1),
(4,2),
(5,2),
(6,2),
(7,3),
(8,3),
(9,3),
(10,4),
(11,4),
(12,4),
(13,5),
(14,5),
(15,5);

INSERT INTO Halls(HallName) VALUES
('Hall 1'),
('Hall 2'),
('Hall 3');

INSERT INTO Customers(CustomerName, CustomerSurname, CustomerPhoneNumber) VALUES
('Frank', 'Cuzz', '+905429875654'),
('Meliss', 'Schtie', '+905874698521'),
('Egon', 'Fritz', '+905457012001'),
('Donna', 'Bencic', '+905312513009');

INSERT INTO MovieSessions(MovieID, HallID, Price, SessionDate, SessionTime) VALUES
(1, 1, 180.00, '2026-05-27', '14:00:00'),
(2, 2, 190.00, '2026-05-27', '17:30:00'),
(3, 3, 170.00, '2026-05-27', '20:00:00'),
(4, 1, 150.00, '2026-05-28', '13:00:00'),
(5, 2, 145.00, '2026-05-28', '16:00:00'),
(6, 3, 140.00, '2026-05-28', '19:00:00'),
(7, 1, 175.00, '2026-05-29', '14:30:00'),
(8, 2, 185.00, '2026-05-29', '18:00:00'),
(9, 3, 200.00, '2026-05-29', '21:00:00'),
(10, 1, 130.00, '2026-05-30', '12:30:00'),
(11, 2, 160.00, '2026-05-30', '16:30:00'),
(12, 3, 145.00, '2026-05-30', '20:30:00'),
(13, 1, 170.00, '2026-05-31', '15:00:00'),
(14, 2, 165.00, '2026-05-31', '18:30:00'),
(15, 3, 175.00, '2026-05-31', '21:30:00'),
(1, 2, 180.00, '2026-06-01', '13:30:00'),
(7, 3, 175.00, '2026-06-01', '17:00:00'),
(13, 1, 170.00, '2026-06-01', '20:00:00'),
(3, 2, 170.00, '2026-06-02', '15:30:00'),
(11, 3, 160.00, '2026-06-02', '19:30:00');

INSERT INTO Bookings(CustomerID, MovieSessionID, SeatNumber) VALUES
(1, 1, 'A1'),
(2, 1, 'A2'),
(3, 1, 'B1'),
(1, 2, 'A3'),
(4, 2, 'B2'),
(2, 3, 'A1'),
(3, 3, 'A2'),
(4, 3, 'C1'),
(1, 4, 'B3'),
(2, 4, 'B4'),
(3, 5, 'A1'),
(4, 5, 'A2'),
(1, 6, 'C2'),
(2, 6, 'C3'),
(3, 7, 'A4'),
(4, 7, 'B1'),
(1, 8, 'A1'),
(2, 8, 'A2'),
(3, 8, 'B2'),
(4, 9, 'C4'),
(1, 10, 'A1'),
(2, 11, 'B3'),
(3, 12, 'C2'),
(4, 13, 'A2'),
(1, 14, 'B1'),
(2, 15, 'C1'),
(3, 16, 'A3'),
(4, 17, 'B2'),
(1, 18, 'C3'),
(2, 19, 'A4'),
(3, 20, 'B4');
GO
