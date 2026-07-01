create database hotel
use hotel

---guest realtion
---gid name cnic street city postcode phone
create table guest
(
guest_id int primary key,
guest_name varchar(50) not null,
cnic varchar(14) unique,
street varchar(100),
city varchar(50),
postcode varchar(10),
phone varchar(15)
)


insert into guest values
(1,      'Ali Hassan',       3520112345671,              'Street 5 Gulberg',                    'Lahore',                   '54000',            '0300-1234567'),
(2,      'Sara Ahmed',       3520112345672,              'Street 12 DHA',                       'Lahore',                   '54792',            '0301-2345678'),
(3,      'Usman Khan',       3740512345673,              'Block C Satellite Town',              'Rawalpindi',               '46000',            '0302-3456789'),
(4,      'Hina Malik',       3740512345674,              'Street 3 Bahria Town',                'Rawalpindi',               '46220',            '0303-4567890'),
(5,      'Bilal Raza',       4210112345675,              'Clifton Block 4',                     'Karachi',                  '75600',            '0304-5678901'),
(6,      'Ayesha Noor',      4210112345676,              'PECHS Block 2',                       'Karachi',                  '75400',            '0305-6789012'),
(7,      'Kamran Ali',       3520212345677,              'G-10 Markaz',                         'Islamabad',                '44000',            '0306-7890123'),
(8,      'Sana Tariq',       3520212345678,              'F-7 Sector',                          'Islamabad',                '44000',            '0307-8901234'),
(9,      'Zubair Iqbal',     3630212345679,              'Model Town',                          'Faisalabad',               '38000',            '0308-9012345'),
(10,     'Madiha Shah',      3630212345680,              'Canal Road',                          'Faisalabad',               '38200',            '0309-0123456'),
(11 ,    'Tariq Mehmood',    3520312345681,              'Johar Town',                          'Lahore',                   '54770',            '0310-1234567'),
(12,     'Nadia Hussain',    3410212345682,              'Cantt Area',                          'Peshawar',                 '25000',            '0311-2345678'),
(13,     'Faisal Qureshi',   3410212345683,              'Hayatabad Phase 1',                   'Peshawar',                 '25100',            '0312-3456789'),
(14,     'Rabia Zahid',      3840212345684,              'Latifabad',                           'Hyderabad',                '71000',            '0313-4567890'),
(15,     'Hamza Butt',       3840212345685,              'Qasimabad',                           'Hyderabad',                '71100',            '0314-5678901');

select * from guest

---staff
---sid name role salary
create table staff
(
staff_id int primary key,
staff_name varchar(50) not null,
staff_role varchar(50) default 'Receptionist',
salary int not null
)

insert into staff (staff_id, staff_name, salary)values
(100,           'Rao Salman',           85000),
(101,           'Tania Aziz',           45000),
(102,           'Asif Javed',           43000),
(103,           'Sobia Rani',           44000),
(104,           'Waqar Ahmed',          32000),
(105,           'Nazia Bibi',           31000),
(106,           'Danish Ali',           28000),
(107,           'Adeel Khan',           27000),
(108,           'Farah Naz',            55000),
(109,           'Junaid Zafar',         35000),
(110,           'Tahir Bhatti',         34000),
(111,           'Amina Cheema',         50000),
(112,           'Shakeel Ahmed',        48000),
(113,           'Huma Riaz',            52000),
(114,           'Nadeem Shah',          38000);

select * from staff

---room
---rid roomtype availablity price per night
create table room
(
room_id int primary key,
room_type varchar(50) not null,
isavailable bit not null DEFAULT 1,
price_per_night int not null default 0
)

insert into room(room_id , room_type) values
(200,           'Single'        ),
(201,           'Single'        ),
(202,           'Single'        ),
(203,           'Single'        ),
(204,           'Double'        ),
(205,           'Double'        ),
(206,           'Double'        ),
(207,           'Double'        ),
(208,           'Luxury'        ),
(209,           'Luxury'        ),
(210,           'Luxury'        ),
(211,           'Single'        ),
(212,           'Double'        ),
(213,           'Luxury'        ),
(214,           'Single'        );

select * from room

UPDATE room
SET price_per_night = CASE 
    WHEN lower(room_type) = 'single' THEN 5000
    WHEN lower(room_type) = 'double' THEN 10000
    WHEN lower(room_type) = 'luxury' THEN 25000
    ELSE price_per_night
END;

---booking relation
---bid checkin checkout gid sid
create table booking
(
booking_id int primary key,
check_in date not null,
check_out date not null,
guest_id int not null,
foreign key (guest_id) references guest (guest_id),
staff_id int not null,
foreign key (staff_id) references staff (staff_id)
)
insert into booking values
(300,           '2024-01-05',           '2024-01-08',           1,        101),
(301,           '2024-01-10',           '2024-01-12',           2,        102),
(302,           '2024-01-15',           '2024-01-18',           3,        103),
(303,           '2024-01-20',           '2024-01-22',           4,        101),
(304,           '2024-02-01',           '2024-02-05',           5,        102),
(305,           '2024-02-10',           '2024-02-12',           6,        103),
(306,           '2024-02-15',           '2024-02-18',           7,        101),
(307,           '2024-02-20',           '2024-02-23',           8,        102),
(308,           '2024-03-01',           '2024-03-04',           9,        103),
(309,           '2024-03-10',           '2024-03-13',           10,       101),
(310,           '2024-03-15',           '2024-03-17',           11,       102),
(311,           '2024-03-20',           '2024-03-24',           12,       103),
(312,           '2024-04-01',           '2024-04-03',           13,       101),
(313,           '2024-04-10',           '2024-04-14',           14,       102),
(314,           '2024-04-15',           '2024-04-18',           15,       103);

select * from booking

create table booking_room
(
room_id int not null,
booking_id int not null,
primary key (room_id,booking_id),
foreign key (room_id) references room (room_id),
foreign key (booking_id) references booking (booking_id)
)
insert into booking_room values
(200, 300),
(201, 301),
(204, 302),
(208, 303),
(205, 304),
(209, 305),
(202, 306),
(206, 307),
(210, 308),
(203, 309),
(207, 310),
(211, 311),
(212, 312),
(213, 313),
(214, 314);

select* from booking_room

-- To make booked rooms unavailable
UPDATE room
SET isavailable = 0
WHERE room_id IN (
    SELECT room_id FROM booking_room
);


---bill
---bill-id total amount payment method payment date 

create table bill
(
bill_id int primary key,
total_amount int ,
payment_method varchar(20) default 'cash',
payment_date DATE,
booking_id int not null,
foreign key (booking_id) references booking (booking_id)
)

insert into bill(bill_id,payment_method,booking_id) values
(400,            'Cash',          300),
(401,            'Card',          301),
(402,            'Cash',          302),
(403,            'Online',        303),
(404,            'Card',          304),
(405,            'Cash',          305),
(406,            'Online',        306),
(407,            'Card',          307),
(408,            'Cash',          308),
(409,            'Online',        309),
(410,            'Cash',          310),
(411,            'Card',          311),
(412,            'Online',        312),
(413,            'Cash',          313),
(414,            'Card',          314);

select * from bill
---(400,           15000,         'Cash',          '2024-01-08',           300),
---(401,           10000,         'Card',          '2024-01-12',           301),
---(402,           30000,         'Cash',          '2024-01-18',           302),
---(403,           10000,         'Online',        '2024-01-22',           303),
---(404,           40000,         'Card',          '2024-02-05',           304),
---(405,           25000,         'Cash',          '2024-02-12',           305),
---(406,           30000,         'Online',        '2024-02-18',           306),
---(407,           30000,         'Card',          '2024-02-23',           307),
---(408,           25000,         'Cash',          '2024-03-04',           308),
---(409,           30000,         'Online',        '2024-03-13',           309),
---(410,           10000,         'Cash',          '2024-03-17',           310),
---(411,           40000,         'Card',          '2024-03-24',           311),
---(412,           20000,         'Online',        '2024-04-03',           312),
---(413,           75000,         'Cash',          '2024-04-14',           313),
---(414,           50000,         'Card',          '2024-04-18',           314);

CREATE FUNCTION CalculateBillByBooking(
    @BookingID INT
)
RETURNS INT
AS

BEGIN
    DECLARE @TotalAmount INT;
    DECLARE @StayDays INT;
    DECLARE @RoomPrice INT;

    SELECT @StayDays = DATEDIFF(day, check_in, check_out)
    FROM booking
    WHERE booking_id = @BookingID;

    SELECT @RoomPrice = sum(room.price_per_night) FROM room
    join booking_room
    ON booking_room.room_id = room.room_id
    WHERE booking_room.booking_id = @BookingID;

    IF @StayDays <= 0
    SET @StayDays = 1;
    SET @TotalAmount = @StayDays * @RoomPrice;

    RETURN @TotalAmount;
END;

UPDATE bill
SET total_amount = dbo.CalculateBillByBooking(booking_id);


---Payment Date function
CREATE FUNCTION fn_GetPaymentDate(
    @BookingID INT
)
RETURNS DATE
AS
BEGIN
    DECLARE @PayDate DATE;

    SELECT @PayDate = check_in
    FROM booking
    WHERE booking_id = @BookingID;

    RETURN @PayDate;
END;
UPDATE bill
SET 
    payment_date = dbo.fn_GetPaymentDate(booking_id)

--- To make Unbooked rooms available
UPDATE room
SET isavailable = 1
WHERE room_id IN (
    SELECT booking_room.room_id 
    FROM booking_room
    JOIN booking ON booking.booking_id = booking_room.booking_id
    WHERE booking.check_out <= GETDATE()
);
select * from room