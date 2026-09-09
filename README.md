# cinema-booking-system
A relational database design and MS SQL implementation for cinema booking operations, modeled in 3NF.

## Entity RelationShip (ER) Diagram
<img width="3892" height="1839" alt="erd-diagram" src="https://github.com/user-attachments/assets/c6c6e192-77d1-44ef-b3a5-022a6fa9c208" />

## Key Features
- Normalized Schema (3NF) : Solved many-to-many relationship between movies and directors via `MovieDirectors` junction table.
- Data Integrity Constraints :
  - `Hall_Session`: Prevents double booking of halls at the exact same date and time.
  - `Session_Seat`: Enforces unique seat reservations per session.
  -  Domain validation using `CHECK` constraints on ticket prices and movie durations.
- Implemented composite indexes (`Index_Movies_Title`, `Index_Hall_Time`) for fast lookups.
- Deployed `TicketDetailsView` to encapsulate complex 5-table joins for operational reporting.


## Project Structure
- `schema.sql`: Table definitions, foreign key constraints, indexes, and views.
- `seed-data.sql`: Realistic mock dataset for testing relational mapping.
- `queries.sql`: Analytical queries, aggregations, and transactional DML operations.
