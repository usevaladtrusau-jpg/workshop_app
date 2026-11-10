# Application Roles and Scopes

## Roles
- 1. Passenger. Обычный пользователь авиасистемы.
- Просмотр и изменение собственного профиля.
- Просмотр доступных Flights, Routes и Airports.
- Создание собственных Bookings.
- Просмотр собственных Bookings и Tickets.
- Управление собственными SeatReservations в рамках разрешённых операций.
- Оплата билетов.

- 2. BookingAgent. Сотрудник, работающий с бронированиями и пассажирами.
- Update Passengers.
- Управление Bookings (Create, Read, Update, Delete) и управление BokingsCustomers (Create, Read, Update, Delete).
- Управление Tickets (Create, Read, Update, Delete).
- Управление SeatReservations (Create, Read, Update, Delete).
- Read Flights, Routes and AircraftSeats.
- Read Payments.

- 3. FlightOperator. Сотрудник, отвечающий за операционную информацию о рейсах
- Управление Flights (Create, Read, Update, Delete). Просмотр и изменение cтатусов Flights. Изменение Flights(Update) а именно поля boardingGate и actial arrival/departure time.
- Просмотр Routes (Read), Airports(Read), Aircrafts(Read).
- Управление назначением Aircraft на Flight (Create, Read, Update, Delete).
- Просмотр SeatReservations (Read).

- 4. FinanceManager. Сотрудник, работающий с финансовой частью
- Просмотр Bookings(Read). Просмотр Tickets(Read)
- Управление Payments (Create, Read, Update, Delete).
- Просмотр информации о Customers (Read).
- Доступ к финансовой информации Tickets(Read).

- 5. Administrator. Полный доступ к управлению приложением
- Упрвление Countris (Create, Read, Update, Delete), Cities (Create, Read, Update, Delete), Airports (Create, Read, Update, Delete), Routes (Create, Read, Update, Delete).
- Упрвление AircraftModles (Create, Read, Update, Delete), Aircrafts (Create, Read, Update, Delete), AircraftSeats (Create, Read, Update, Delete).
- Управление Flights (Crate, Read, Update, Delete).
- Управление Customers (Create, Read, Update, Delete).
- Упрвление Bookings (Create, Read, Update, Delete), Tickets (Create, Read, Update, Delete), Payments (Create, Read, Update, Delete), SeatReservations (Create, Read, Update, Delete).