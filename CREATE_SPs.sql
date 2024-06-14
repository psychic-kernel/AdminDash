
-- CHATGPT - GENERRATED --
-- CREATE PROCEDURE
IF OBJECT_ID('NEW_DB.CreateItems', 'P') IS NOT NULL
    DROP PROCEDURE NEW_DB.CreateItems;
GO

CREATE PROCEDURE NEW_DB.CreateItems
    @name NVARCHAR(255),
    @description NVARCHAR(MAX),
    @price NVARCHAR(20),
    @is_active BIT
AS
BEGIN
    INSERT INTO Items (name, description, price, is_active)
    VALUES (@name, @description, @price, @is_active);
END
GO

-- UPDATE PROCEDURE
IF OBJECT_ID('NEW_DB.UpdateItems', 'P') IS NOT NULL
    DROP PROCEDURE NEW_DB.UpdateItems;
GO

CREATE PROCEDURE NEW_DB.UpdateItems
    @item_id INT,
    @name NVARCHAR(255),
    @description NVARCHAR(MAX),
    @price NVARCHAR(20),
    @is_active BIT
AS
BEGIN
    UPDATE Items
    SET name = @name, description = @description, price = @price, is_active = @is_active
    WHERE id = @item_id;
END
GO

-- DELETE PROCEDURE
IF OBJECT_ID('NEW_DB.DeleteItems', 'P') IS NOT NULL
    DROP PROCEDURE NEW_DB.DeleteItems;
GO
CREATE PROCEDURE NEW_DB.DeleteItems
    @item_id INT
AS
BEGIN
    DELETE FROM Items
    WHERE id = @item_id;
END
GO

-- MICROSOFT SITE
-- =======================================================
-- Create Stored Procedure Template for Azure SQL Database
-- =======================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      My Name
-- Create Date: 01/23/2024
-- Description: Returns the customer's company name.
-- =============================================
CREATE PROCEDURE SalesLT.uspGetCustomerCompany
(
    -- Add the parameters for the stored procedure here
    @LastName nvarchar(50) = NULL,
    @FirstName nvarchar(50) = NULL
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    SELECT FirstName, LastName, CompanyName
       FROM SalesLT.Customer
       WHERE FirstName = @FirstName AND LastName = @LastName;
END
GO
