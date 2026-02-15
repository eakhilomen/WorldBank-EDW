/*
===========================================================
  Script: 01_create_database.sql
  Project: WorldBank-EDW
  Purpose: Create Data Warehouse database and schemas
  Author: Emmanuel Akhilomen
===========================================================

This script:
- Creates the WorldBank_EDW database if it does NOT exist
- Creates Bronze, Silver, and Gold schemas
- Does NOT drop existing database
- Safe for repeated execution
===========================================================
*/

-- =============================================
-- Create Database (Only If It Does Not Exist)
-- =============================================
IF NOT EXISTS (
    SELECT 1 
    FROM sys.databases 
    WHERE name = 'WorldBank_EDW'
)
BEGIN
    PRINT 'Creating database WorldBank_EDW...';
    CREATE DATABASE WorldBank_EDW;
END
ELSE
BEGIN
    PRINT 'Database WorldBank_EDW already exists.';
END
GO

-- =============================================
-- Use Database
-- =============================================
USE WorldBank_EDW;
GO

-- =============================================
-- Create Schemas (If Not Exist)
-- =============================================

IF NOT EXISTS (
    SELECT 1 
    FROM sys.schemas 
    WHERE name = 'bronze'
)
BEGIN
    EXEC('CREATE SCHEMA bronze');
    PRINT 'Schema bronze created.';
END
ELSE
BEGIN
    PRINT 'Schema bronze already exists.';
END
GO


IF NOT EXISTS (
    SELECT 1 
    FROM sys.schemas 
    WHERE name = 'silver'
)
BEGIN
    EXEC('CREATE SCHEMA silver');
    PRINT 'Schema silver created.';
END
ELSE
BEGIN
    PRINT 'Schema silver already exists.';
END
GO


IF NOT EXISTS (
    SELECT 1 
    FROM sys.schemas 
    WHERE name = 'gold'
)
BEGIN
    EXEC('CREATE SCHEMA gold');
    PRINT 'Schema gold created.';
END
ELSE
BEGIN
    PRINT 'Schema gold already exists.';
END
GO

PRINT 'WorldBank_EDW database and schemas setup complete.';
