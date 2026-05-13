--creating databases
--contains the raw data

create database computer_std

create database computer_dhw
--
IF DB_ID('computer_std') IS NULL
BEGIN
    CREATE DATABASE computer_std;
END
GO

--

IF DB_ID('computer_dhw') IS NULL
BEGIN
    CREATE DATABASE computer_dhw ;
END
GO

