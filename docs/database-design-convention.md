# Database Design Convention

Local development uses **SQLite**, deployed environments use **SAP HANA Cloud**.
HANA is the source of truth: a schema is valid only if it works on HANA.

## 1. Principles

- Define the schema in CDS (`db/*.cds`), never by hand in the database.
- Every schema change is a PR with review by the domain owner.
- A schema change is not "done" until it was deployed to HANA (dev subaccount).

## 2. Naming

| Object            | Rule                                   | Example                       |
|-------------------|----------------------------------------|-------------------------------|
| Namespace         | lowercase, dot-separated               | `namespace my.app;`           |
| Entity            | PascalCase, plural                     | `Tickets`, `Payments`         |
| Element (column)  | camelCase                              | `createdAt`, `passengerName`  |
| Foreign key       | association name, CDS generates `_ID`  | `flight` -> `flight_ID`       |
| Enum / code list  | entity named `<Thing>Statuses`         | `TicketStatuses`              |

- Max identifier length is 127 characters on HANA. Keep names short.
- Do not use SQL reserved words as names (`order`, `user`, `group`, `timestamp`, `date`, `session`). Use `orders` -> `Orders` with a prefix or a domain word, e.g. `TicketOrders`.
- No abbreviations that are not obvious. No type prefixes (`tblTickets`).

## 3. Keys

- Primary key: `key ID : UUID` (use the `cuid` aspect). One key type for the whole project.
- Do not use business values (email, ticket number, passport) as primary keys.
- Business identifiers (ticket number) are separate columns with a unique constraint.
- Composite keys only for pure link tables.

## 4. Types

| Need            | CDS type                  | Notes                                                                  |
|-----------------|---------------------------|------------------------------------------------------------------------|
| Id              | `UUID`                    | Stored as string; compare as string                                    |
| Text            | `String(n)`               | **Always set length.** SQLite does not enforce it, HANA does           |
| Long text       | `LargeString`             | Not filterable or sortable on HANA. Do not use for searchable fields   |
| Whole numbers   | `Integer`, `Integer64`    |                                                                        |
| Money           | `Integer64` + `Currency`  | Minor units (cents). Never `Decimal`, never `Double`                   |
| Flag            | `Boolean`                 | SQLite stores 0/1, abstract it via CDS, never compare to 0/1 in code   |
| Date            | `Date`                    | No time zone                                                           |
| Moment in time  | `Timestamp`               | Always UTC                                                             |
| Binary          | `LargeBinary`             | Files go to object storage, not to the database                        |

- Money: integer minor units (cents) + currency. Never `Double`.
- Do not store JSON blobs in text columns if you need to query them.
- Do not rely on implicit type conversion. SQLite is dynamically typed and will accept wrong types silently.

## 5. Mandatory fields

Every business entity uses the standard aspects:

```cds
using { cuid, managed } from '@sap/cds/common';

entity Tickets : cuid, managed {
  flightNumber  : String(10) not null;
  passengerName : String(100) not null;
  status        : Association to TicketStatuses;
}
```

`managed` adds `createdAt`, `createdBy`, `modifiedAt`, `modifiedBy`. Do not add your own variants.

## 6. Relations and integrity

- Declare relations with `Association` / `Composition`, not plain ID columns.
- Use `Composition` only when the child cannot exist without the parent (ticket -> segments).
- Mark required columns `not null`;
- Enable foreign key checks in SQLite explicitly, otherwise integrity errors appear only on HANA.
- Deletion policy is decided per relation and written in the PR description (restrict, cascade, set null).

## 7. Indexes

- HANA column store does not need an index on every foreign key. Do not add indexes "just in case".
- Add an index only for a measured slow query, with the query attached to the PR.
- Unique business keys get a unique constraint.
- SQLite plans differ from HANA. Check performance with `EXPLAIN PLAN` on HANA, not locally.

## 8. Code lists and statuses

- Statuses and types are code-list entities (`TicketStatuses`), not magic strings in code.
- Values are stable codes (`ISSUED`, `CANCELLED`), not translated texts.
- Seed data lives in `db/data/*.csv`, one file per entity, committed to the repository.

## 9. Deletion and retention

- Personal data (passenger name, documents) has a retention period defined by the owner.
- Prefer a `status` / `deletedAt` field over physical deletion for business records.
- Never store card numbers or secrets in the database. Payment data stays in Stripe.

## 10. Local vs remote differences

| Topic              | SQLite                         | HANA                                  | Rule                                         |
|--------------------|--------------------------------|---------------------------------------|----------------------------------------------|
| String length      | not enforced                   | enforced                              | validate length in the service layer         |
| Case in `LIKE`     | case-insensitive (ASCII)       | case-sensitive                        | use CDS functions (`tolower`), test on HANA  |
| Type strictness    | dynamic                        | strict                                | no implicit conversions                      |
| Decimal            | float affinity                 | exact                                 | verify money calculations on HANA            |
| Foreign keys       | off by default                 | enforced                              | enable explicitly in SQLite                  |
| Availability       | always                         | trial instance stops automatically    | start HANA before testing, do not rely on it in CI |

- If a query behaves differently on the two databases, HANA wins and the test is fixed.

## 11. Checklist for a schema PR

- [ ] Names follow section 2, no reserved words
- [ ] `cuid` and `managed` used, all strings have a length
- [ ] Required fields are `not null`
- [ ] Deletion behavior of relations is described
- [ ] No new index without a measured query
- [ ] Seed data and CSV updated
- [ ] Deployed and checked on HANA (dev)
- [ ] Reviewed by the domain owner
