# Схема базы данных авиакомпании (SAP CAP / CDS)

## [Диаграмма](https://app.diagrams.net/#G1HgJ0-ZfB5lWq4-J5ZbmkkjF5am4puFKN#%7B%22pageId%22%3A%22bRGkLNK6IekwTJD3EF-B%22%7D)

Схема описывает доменную модель авиакомпании: справочники географии и аэропортов, парк воздушных судов, рейсы и маршруты, бронирования, билеты, места и платежи.

Все сущности наследуют `cuid` и `managed`, то есть имеют системные поля `ID`, `createdAt`, `createdBy`, `modifiedAt`, `modifiedBy`.

## Общая структура

### География и аэропорты

| Сущность | Назначение | Основные поля и связи |
|---|---|---|
| `Countries` | Страны | `name`; связь `1:N` с `Cities` |
| `Cities` | Города | `name`; связь `N:1` с `Countries`, `1:N` с `Airports` |
| `Airports` | Аэропорты | `iataCode`, `icaoCode`, `name`, `timeZone`; связь `N:1` с `Cities`; `1:N` с `Routes` как аэропорт вылета и прилёта |

Для `Airports` задана уникальность комбинации `iataCode` и `icaoCode` через `@assert.unique.unique_codes`.

### Воздушные суда

| Сущность | Назначение | Основные поля и связи |
|---|---|---|
| `AircraftModels` | Модели воздушных судов | `manufacturer`, `modelName`; `1:N` с `Aircrafts` |
| `Aircrafts` | Конкретные борта | `registrationNumber`, `status`; `N:1` с `AircraftModels`; `1:N` с `AircraftSeats` и `Flights` |
| `AircraftSeats` | Места в самолёте | `seatNumber`, `cabinClass`; `N:1` с `Aircrafts`; `1:N` с `SeatReservations` |

Статусы воздушного судна (`AircraftStatuses`): `Active`, `InMaintenance`, `Grounded`, `OutOfService`, `Retired`.

Классы обслуживания (`CabinClasses`): `Economy`, `PremiumEconomy`, `Business`, `First`.

### Маршруты и рейсы

| Сущность | Назначение | Основные поля и связи |
|---|---|---|
| `Routes` | Маршрут между двумя аэропортами | `departureAirport`, `arrivalAirport`; `1:N` с `Flights` |
| `Flights` | Рейс | `flightNumber`, плановые и фактические время вылета/прилёта, `boardingGate`, `status`; `N:1` с `Routes` и `Aircrafts`; `1:N` с `SeatReservations` и `Tickets` |

Статусы рейса (`FlightStatuses`): `Scheduled`, `Boarding`, `Departed`, `InAir`, `Landed`, `Completed`, `Delayed`, `Cancelled`, `Diverted`.

### Клиенты и бронирования

| Сущность | Назначение | Основные поля и связи |
|---|---|---|
| `Customers` | Клиенты, пассажиры и менеджеры | `firstName`, `lastName`, `surname`, `passwordHash`, `dateOfBirth`, `email`, `documentNumber`, `documentExpiry`, `role`, `nationality`; `1:N` с `Bookings`, `BookingsCustomers`, `Tickets` |
| `Bookings` | Бронирование | `status`, `currency`, `totalPrice`, `bookingReference`, `expiresAt`; `N:1` с `Customers`; `1:N` с `BookingsCustomers`, `Tickets`, `Payments` |
| `BookingsCustomers` | Связь бронирования с дополнительными пассажирами | `N:1` с `Customers` и `Bookings` |

Статусы бронирования (`BookingStatuses`): `Pending`, `PendingPayment`, `Confirmed`, `Cancelled`, `Expired`, `Completed`.

Роли клиента (`CustomersRoles`): `Passenger`, `Manager`.

Для `Bookings` поле `bookingReference` уникально (`@assert.unique.unique_bookingReference`).

### Билеты, места и платежи

| Сущность | Назначение | Основные поля и связи |
|---|---|---|
| `Tickets` | Билет пассажира на рейс | `ticketNumber`, `totalPrice`, `currency`, `status`, `issuedAt`; `N:1` с `Bookings`, `Customers`, `Flights`; `1:N` с `SeatReservations` |
| `SeatReservations` | Резервирование конкретного места на рейс | `status`, `reservedAt`, `expiresAt`; `N:1` с `Flights`, `AircraftSeats`, `Tickets` |
| `Payments` | Платёж по бронированию | `provider`, `providerPaymentId`, `totalPrice`, `currency`, `status`, `paidAt`; `N:1` с `Bookings` |

Статусы билета (`TicketsStatuses`): `Issued`, `Cancelled`, `Refunded`, `Used`, `Voided`.

Статусы резерва места (`ReservationsStatuses`): `Held`, `Confirmed`, `Cancelled`, `Expired`.

Статусы платежа (`PaymentStatuses`): `Pending`, `Processing`, `Succeeded`, `Failed`, `Cancelled`, `RefundPending`, `PartiallyRefunded`, `Refunded`.

Для `Tickets` поле `ticketNumber` уникально (`@assert.unique.unique_ticketNumber`).

## Связи между сущностями

```text
Countries 1──N Cities 1──N Airports

Airports 1──N Routes(departureAirport)
Airports 1──N Routes(arrivalAirport)
Routes 1──N Flights

AircraftModels 1──N Aircrafts
Aircrafts 1──N AircraftSeats
Aircrafts 1──N Flights

Customers 1──N Bookings
Bookings 1──N BookingsCustomers
Customers 1──N BookingsCustomers
Bookings 1──N Tickets
Customers 1──N Tickets
Flights 1──N Tickets

Bookings 1──N Payments

Flights 1──N SeatReservations
AircraftSeats 1──N SeatReservations
Tickets 1──N SeatReservations
```

## Ключевые бизнес-правила

- У аэропорта должны быть уникальные вместе `iataCode` и `icaoCode`.
- Номер бронирования `bookingReference` уникален.
- Номер билета `ticketNumber` уникален.
- Бронирование принадлежит основному клиенту, но может включать дополнительных пассажиров через `BookingsCustomers`.
- Билет всегда привязан к бронированию, пассажиру и рейсу.
- Резерв места связывает рейс, физическое место воздушного судна и билет.
- Платёж относится к бронированию; в модели допускается несколько платежей для одного бронирования.

