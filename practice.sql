
--26/11/2026
--Write a SQL Server query that shows, for every flight, FlightNumber, aircraft name, capacity, 
--number of bookings, and seats left (capacity minus bookings). 
--Flights with no bookings must still appear with 0 bookings. Sort by bookings (highest first), then FlightNumber. 
--Tables: Flight(FlightID PK, FlightNumber, SourceCity, DestinationCity, DepartureTime, Air_id FK); Aerocraft(Air_id PK, Air_name, capacity);
--Booking(BookingID PK, PassengerID FK, FlightID FK, BookingDate, SeatNumber).

select f.flightnumber,a.airname,a.capacity,count(b.bookingid) as total_bookings,a.capacity - count(b.bookingid) as seats_left 
from flight f join aircraft a on f.air_id=a.air_id left join booking b on f.flightid =b.flightid 
group by f.flightnumber,a.air_name,a.capacity
order by total_bookings desc,f.flightnumber asc;


--27/11/2026
--write a sql query to display each department's name,number of unique employees assigned to projects,number of unique projects,
--and total hours worked , including departments with no project contributions, replacing null totals with 0, 
--and sorting by total hours in descending order


select d.department_name,count(distinct p.employee_id) as employee_count,count(distinct p.project_id) as project_count,
isnull(sum(p.hours_worked),0) as total_hours
from department d
left join employee e on d.department_id=e.department_id
left join employee_project p on e.employee_id=p.employee_id
group by d.department_id,d.department_name
order by total_hours desc;