
# Ankasa Plane API

Ankasa Plane API is an API that functions as a Backend containing user, city, plane, airport, ans booking data. This API is built with ExpressJs which is a simple and flexible web application framework that uses NodeJs.
![Database API Ankasa](https://github.com/akbarfaiz/ankasa-api/assets/87055460/02678b9e-fe60-47f2-9943-150aa0387638)

## Requirements

    1. Node Js
    2. Postman
    3. Database (PostgreSQL or PhpMyAdmin)
    4. Server (Localhost or Online Server)
    5. Cloudinary


## Installation and Usage Steps

  1. Clone the repo to your project directory

  ```bash
    git clone git@github.com:akbarfaiz/ankasa-api.git
  ```
2. Open your project directory in CMD or terminal
3. Run command 'npm i' or 'npm install' to download the package on this API
```bash
  npm install
```
4. Turn on your server like Xampp for localhost
5. Create database in your database
6. Make new file in your project directory callad '.env' and copy this code to that file :
```bash
  DB_USER=
  DB_HOST=
  DB_NAME= //Your Database Name
  DB_PASS=
  DB_PORT= //Your Database Port

  JWT_KEY= //Your JWT key or Random Number

  EMAIL_NAME= //Your Admin Email
  EMAIL_PASSWORD= //Your Admin Email Password
```
7. Open Postman, choose HTTP request method and request URL like localhost:8080/
## Route

* **Users**
    * **POST /users/login** → Login to Users

    * **POST /users/register** → Create User 
        
        ```Body{email,password,nama}```

    * **POST /users/otp** → For send otp to email
        
        ```Body{email}```

    * **POST /users/otp/confirm** → For email verification 
        
        ```Body{email,otp}```
    
    * **PUT /users/update** → Update user data (Need Bearer Token) 
        
        ```Body{email,name,phone,city,address,post_code}```

* **Ticket**
    * **GET /ticket** → Get all ticket data

    * **GET /ticket/detail/:id** → Get ticket data by ticket id in params

    * **POST /ticket/create** → Create new ticket

        ```Body{plane_id,origin(airport_id),destination(airport_id),takeoff(FORMAT TIMESTAMP = DD-MM-YYYY HH24:MM), landing(FORMAT TIMESTAMP = DD-MM-YYYY HH24:MM),transit,price,duration(Example = '6 Hours 30 Minutes')}```

* **Booking**
    * **GET /booking/myBooking** → Get booking data by user id (Need Bearer Token) 

    * **GET /booking/detail/:id** → Get booking data by booking id in params (Need Bearer Token)

    * **POST /booking/create** → Create new booking (Need Bearer Token)

        ```Body{ticket_id,is_paid,insurance,insurance_price,subtotal,total,total_passenger}```

    * **PUT /booking/paidUpdate** →  Update is_paid value (Need Bearer Token) 
        ```Body{id(booking_id),is_paid}```
## Demo

https://unusual-frog-suit.cyclic.app
