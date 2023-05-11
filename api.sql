--User
CREATE TABLE users (
    id VARCHAR PRIMARY KEY,
    email VARCHAR NOT NULL,
    password VARCHAR NOT NULL,
    name VARCHAR,
    phone VARCHAR NULL,
    city VARCHAR NULL,
    address VARCHAR NULL,
    post_code VARCHAR NULL,
    photo VARCHAR NULL,
    otp VARCHAR NULL
);

ALTER TABLE users ADD otp VARCHAR NULL;

--Plane
CREATE TABLE plane (
    id SERIAL PRIMARY KEY,
    name VARCHAR
);

INSERT INTO plane(name) VALUES('Lion Air');

--Airport
CREATE TABLE airport (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    city VARCHAR,
    country VARCHAR,
    airport_code VARCHAR
);

INSERT INTO airport(name,city,country,airport_code) VALUES('Haneda Airport','Tokyo','JPN','JP-651');


--Ticket
CREATE TABLE ticket (
    id VARCHAR PRIMARY KEY,
    plane_id INTEGER REFERENCES plane(id),
    origin INTEGER REFERENCES airport(id),
    destination INTEGER REFERENCES airport(id),
    takeoff TIMESTAMP,
    landing TIMESTAMP,
    transit INTEGER,
    price INTEGER,
    duration VARCHAR,
    class VARCHAR,
    terminal VARCHAR,
    gatae VARCHAR
);

ALTER TABLE ticket ADD gate VARCHAR;

INSERT INTO ticket(id,plane_id,origin,destination,takeoff,landing,transit,price,duration) VALUES('UGH9142GIA',1,1,2,TO_TIMESTAMP('24-04-2023 13:00', 'DD-MM-YYYY HH24:MI'),TO_TIMESTAMP('24-04-2023 22:30', 'DD-MM-YYYY HH24:MI'),0,450,'9 Hours 30 Minutes');

--Booking
CREATE TABLE booking (
    id VARCHAR PRIMARY KEY,
    user_id VARCHAR REFERENCES users(id),
    ticket_id VARCHAR REFERENCES ticket(id),
    is_paid INTEGER,
    insurance INTEGER,
    insurance_price INTEGER,
    total INTEGER,
    subtotal INTEGER,
    total_passenger INTEGER
);

UPDATE booking SET is_paid = 0;

INSERT INTO booking(id,user_id,ticket_id,is_paid,insurance,insurance_price,total,subtotal,total_passenger) VALUES('IHWFIH789214GF8','36ea4e85-9dde-422a-926b-fadb0b49007c','UGH9142GIA',1,0,450,450,450,1);