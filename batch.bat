rem Als je geen output wilt hieronder rem (comment delimiter) weghalen
rem echo off

rem Variabelen TODO: Make sure everyone can run this
set MYSQL=C:\xampp\mysql\bin\mysql
set PATH=C:\Git\marios-pizza-hut
set USER=root
set PASS=secret
set DB=mario

REM rem Alter max allowed packet
REM cd C:\xampp
REM %MYSQL% --max_allowed_packet=50M

rem Create
%MYSQL% -u %USER% --password=%PASS% %DB% < "%PATH%\create\mario.sql"

rem Stored procedure
cd C:\Git\marios-pizza-hut\stored procedures

for %%i in (*.sql) do %MYSQL% -u %USER% --password=%PASS% %DB% < %%i

rem Triggers
cd C:\Git\marios-pizza-hut\triggers

for %%i in (*.sql) do %MYSQL% -u %USER% --password=%PASS% %DB% < %%i

rem Insert
cd C:\Git\marios-pizza-hut\inserts

for %%i in (*.sql) do %MYSQL% -u %USER% --password=%PASS% %DB% < %%i

rem Views
cd C:\Git\marios-pizza-hut\views

for %%i in (*.sql) do %MYSQL% -u %USER% --password=%PASS% %DB% < %%i

rem Indexes
cd C:\Git\marios-pizza-hut\indexes

for %%i in (*.sql) do %MYSQL% -u %USER% --password=%PASS% %DB% < %%i