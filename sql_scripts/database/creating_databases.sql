--creating databases
--contains the raw data

create database computer_std

create database computer_dhw
--
IF DB_ID('computer_std') IS NULL
BEGIN
    CREATE DATABASE GymDB;
END
GO

--

IF DB_ID('computer_dhw') IS NULL
BEGIN
    CREATE DATABASE GymDB;
END
GO

