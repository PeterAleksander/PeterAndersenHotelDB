
--Insert Self into DB
INSERT INTO Guest
VALUES
('Peter','Andersen','3600 Jeanetta St','Houston','TX','77063','832 348-9976');

INSERT INTO Reservation
VALUES
(305,111,1,0,'2023-08-23','2023-09-16',349.98);

--DELETE Jeremiah
DELETE FROM Reservation WHERE GuestId = 106;
DELETE FROM Guest WHERE GuestId = 106;
