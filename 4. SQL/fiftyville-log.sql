-- Keep a log of any SQL queries you execute as you solve the mystery.

-- Check crime scene report
SELECT * FROM crime_scene_reports WHERE street = 'Humphrey Street'; -- Theft took place at 10:15am at bakery. 3 witnesses mention bakery.

-- Check witnesses interviews
SELECT * FROM interviews WHERE year = "2021" AND month = "7" AND day = "28" AND transcript LIKE "%bakery%";

-- Check ATM transactions
SELECT * FROM atm_transactions WHERE year = "2021" AND month = "7" AND day = "28" AND atm_location = 'Leggett Street'; 

-- Check phone calls
SELECT * FROM phone_calls WHERE year = "2021" AND month = "7" AND day = "28" AND duration < 60; 

-- Check bakery footage
SELECT * FROM bakery_security_logs WHERE year = "2021" AND month = "7" AND day = "28" AND hour = "10" AND minute BETWEEN 15 AND 25 AND activity = "exit";

-- Check airports
SELECT * FROM airports WHERE city = 'Fiftyville'; -- Id: 8

-- Check flights
SELECT * FROM flights WHERE year = "2021" AND month = "7" AND day = "29" AND origin_airport_id = "8"; -- Earliest: Id:36 Destination:4 Time: 8.20

-- Check destination
SELECT * FROM airports WHERE id = "4"; -- New York City

-- Check passports
SELECT * FROM passengers WHERE flight_id = "36";

SELECT * FROM people JOIN passengers ON people.passport_number = passengers.passport_number WHERE people.passport_number IN (
    SELECT passport_number FROM passengers WHERE flight_id = "36");

-- Check bank accounts and transactions
SELECT * FROM bank_accounts JOIN people ON bank_accounts.person_id = people.id WHERE bank_accounts.person_id IN (
    SELECT id FROM people JOIN passengers ON people.passport_number = passengers.passport_number WHERE people.passport_number IN (
        SELECT passport_number FROM passengers WHERE flight_id = "36"));

SELECT * FROM atm_transactions JOIN bank_accounts ON atm_transactions.account_number = bank_accounts.account_number WHERE atm_transactions.account_number IN (
    SELECT account_number FROM bank_accounts JOIN people ON bank_accounts.person_id = people.id WHERE bank_accounts.person_id IN (
        SELECT id FROM people JOIN passengers ON people.passport_number = passengers.passport_number WHERE people.passport_number IN (
            SELECT passport_number FROM passengers WHERE flight_id = "36"))) AND atm_transactions.atm_location = 'Leggett Street';

-- Check license plates
SELECT * FROM people JOIN bakery_security_logs ON people.license_plate = bakery_security_logs.license_plate WHERE people.license_plate IN (
    SELECT license_plate FROM people JOIN bank_accounts ON people.id = bank_accounts.person_id WHERE bank_accounts.person_id IN (
        SELECT id FROM people JOIN passengers ON people.passport_number = passengers.passport_number WHERE people.passport_number IN (
            SELECT passport_number FROM passengers WHERE flight_id = "36")))
            AND year = "2021" AND month = "7" AND day = "28" AND hour = "10" AND minute BETWEEN 15 AND 25 AND activity = "exit";

-- Check caller
SELECT * FROM phone_calls JOIN people ON phone_calls.caller = people.phone_number WHERE phone_calls.caller IN (
    SELECT phone_number FROM people JOIN bakery_security_logs ON people.license_plate = bakery_security_logs.license_plate WHERE people.license_plate IN (
        SELECT license_plate FROM people JOIN bank_accounts ON people.id = bank_accounts.person_id WHERE bank_accounts.person_id IN (
            SELECT id FROM people JOIN passengers ON people.passport_number = passengers.passport_number WHERE people.passport_number IN (
                SELECT passport_number FROM passengers WHERE flight_id = "36")))
                AND year = "2021" AND month = "7" AND day = "28" AND hour = "10" AND minute BETWEEN 15 AND 25 AND activity = "exit")
                AND year = "2021" AND month = "7" AND day = "28" AND duration < 60;

-- Check call receiver - accomplice
SELECT * FROM people WHERE phone_number = "(375) 555-8161";
