--SQL QUERY HOTEL DATA

--1. Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.
SELECT Firstname,LastName,RoomNumber,StartDate,EndDate FROM Reservation
JOIN Guest
	ON Reservation.GuestId = Guest.GuestId
	WHERE EndDate 
LIKE '%2023-07-%'

--2. Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.

SELECT Guest.FirstName,LastName,Reservation.RoomNumber,StartDate,EndDate 
FROM Reservation 
JOIN Room 
ON Room.RoomNumber = Reservation.RoomNumber
JOIN Guest 
ON Guest.GuestId = Reservation.GuestId
JOIN AmenitySupport 
ON AmenitySupport.RoomNumber = Room.RoomNumber
JOIN Amenity 
ON AmenitySupport.AmenityId = Amenity.AmenityId
Where Amenity.AmenityId = 4

--03 Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, 
--the starting date of the reservation, and how many people were included in the reservation. (Choose a guest's name from the existing data.)

SELECT FirstName, LastName, RoomNumber,Adults,Children, StartDate, EndDate 
FROM Reservation
JOIN Guest
ON Reservation.GuestId = Guest.GuestId
WHERE LastName = 'Vise';

--04 Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. 
--The results should include all rooms, whether or not there is a reservation associated with the room.
SELECT Room.RoomNumber, ReservationId,TotalCost
FROM Reservation
FULL OUTER JOIN Room
ON Room.RoomNumber = Reservation.RoomNumber
ORDER BY Room.RoomNumber

--05 Write a query that returns all rooms with a capacity of three or more and that are reserved on any date in April 2023.
--If Jeremiah Pendergrass was not deleted his reservation would be included in this query
SELECT RoomNumber
FROM Reservation
JOIN RoomType
ON RoomType.MaximumOccupancy >=3 AND (Reservation.StartDate LIKE '2023-04-%' AND Reservation.EndDate LIKE '2023-04-%')

--06 Write a query that returns a list of all guest names and the number of reservations per guest,
--sorted starting with the guest with the most reservations and then by the guest's last name.
SELECT FirstName,LastName, COUNT(ReservationId) as NumberOfReservations
FROM Guest
JOIN Reservation
ON Guest.GuestId = Reservation.GuestId
GROUP BY FirstName,LastName
ORDER BY NumberOfReservations DESC,LastName 

--07 Write a query that displays the name, address, and phone number of a guest based on their phone number. (Choose a phone number from the existing data.)

SELECT FirstName,LastName,Address,Phone
FROM Guest
WHERE Phone LIKE '291 553-0508'