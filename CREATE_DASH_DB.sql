USE MASTER;

CREATE DATABASE DashboardDb
GO

USE DashboardDb
GO

CREATE TABLE [dbo].[Notifications](
    [notification_id] [INT] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [title] [NVARCHAR](50) NOT NULL,
    [message] [NVARCHAR](250) NOT NULL,
    [date] [DATETIME] NOT NULL,
    [is_active] [BIT] NOT NULL,
);

CREATE TABLE [dbo].[TeamMembers](
    [member_id] [INT] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [f_name] [NVARCHAR](50) NOT NULL,
    [l_name] [NVARCHAR](50) NOT NULL,
    [email] [NVARCHAR](50) NOT NULL,
    [password] [NVARCHAR](50) NOT NULL,
    [role] [NVARCHAR](50) NOT NULL,
    [is_active] [BIT] NOT NULL,
    [is_admin] [BIT] NOT NULL,
);

CREATE TABLE [dbo].[ClientMembers](
    [client_id] [INT] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [f_name] [NVARCHAR](50) NOT NULL,
    [l_name] [NVARCHAR](50) NOT NULL,
    [email] [NVARCHAR](50) NOT NULL,
    [mobile] [NVARCHAR](50) NOT NULL,
)

CREATE TABLE [dbo].[ItemsSold](
    [id] [INT] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [client_id] [INT] NOT NULL,
    [member_id] [INT] NOT NULL,
    [date] [DATETIME] NOT NULL,
    [amount] [INT] NOT NULL,
    [is_active] [BIT] NOT NULL,
    FOREIGN KEY (client_id) REFERENCES [dbo].[ClientMembers](client_id) ON DELETE CASCADE ON UPDATE NO ACTION
)

CREATE TABLE [dbo].[Expenses](
    [id] [INT] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [member_id] [INT] NOT NULL,
    [date] [DATETIME] NOT NULL,
    [amount] [INT] NOT NULL,
    [description] [NVARCHAR](250) NOT NULL,
    [is_active] [BIT] NOT NULL,
    FOREIGN KEY (member_id) REFERENCES [dbo].[TeamMembers](member_id) ON DELETE CASCADE ON UPDATE NO ACTION
)

CREATE TABLE [dbo].[Invoices](
    [id] [INT] PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [member_id] [INT] NOT NULL,
    [client_id] [INT] NOT NULL,
    [date] [DATETIME] NOT NULL,
    [amount] [INT] NOT NULL,
    [is_active] [BIT] NOT NULL,
    FOREIGN KEY (member_id) REFERENCES [dbo].[TeamMembers](member_id) ON DELETE CASCADE ON UPDATE NO ACTION,
    FOREIGN KEY (client_id) REFERENCES [dbo].[ClientMembers](client_id) ON DELETE CASCADE ON UPDATE NO ACTION

);


-- Insert data into Notifications
INSERT INTO [dbo].[Notifications] (title, message, date, is_active) VALUES
('System Update', 'The system will be updated at midnight.', '2023-06-01 12:00:00', 1),
('New Policy', 'Please review the new company policies.', '2023-06-05 09:00:00', 1),
('Holiday Notice', 'Office will be closed on July 4th.', '2023-06-10 10:00:00', 1),
('Maintenance', 'Scheduled maintenance on June 20th.', '2023-06-15 14:00:00', 0),
('Event Reminder', 'Dont forget the team event on June 30th.', '2023-06-20 08:00:00', 1);

-- Insert data into TeamMembers
INSERT INTO [dbo].[TeamMembers] (f_name, l_name, email, password, role, is_active, is_admin) VALUES
('John', 'Doe', 'john.doe@example.com', 'password123', 'Manager', 1, 1),
('Jane', 'Smith', 'jane.smith@example.com', 'password123', 'Developer', 1, 0),
('Alice', 'Johnson', 'alice.johnson@example.com', 'password123', 'Designer', 1, 0),
('Bob', 'Brown', 'bob.brown@example.com', 'password123', 'Support', 1, 0),
('Eve', 'Davis', 'eve.davis@example.com', 'password123', 'Tester', 0, 0);

-- Insert data into ClientMembers
INSERT INTO [dbo].[ClientMembers] (f_name, l_name, email, mobile) VALUES
('Michael', 'Williams', 'michael.williams@example.com', '123-456-7890'),
('Sarah', 'Jones', 'sarah.jones@example.com', '234-567-8901'),
('David', 'Miller', 'david.miller@example.com', '345-678-9012'),
('Emma', 'Wilson', 'emma.wilson@example.com', '456-789-0123'),
('James', 'Moore', 'james.moore@example.com', '567-890-1234');

-- Insert data into ItemsSold
INSERT INTO [dbo].[ItemsSold] (client_id, member_id, date, amount, is_active) VALUES
(1, 1, '2023-06-01 11:00:00', 500, 1),
(2, 2, '2023-06-02 12:00:00', 300, 1),
(3, 3, '2023-06-03 13:00:00', 150, 1),
(4, 4, '2023-06-04 14:00:00', 400, 0),
(5, 1, '2023-06-05 15:00:00', 250, 1);

-- Insert data into Expenses
INSERT INTO [dbo].[Expenses] (member_id, date, amount, description, is_active) VALUES
(1, '2023-06-01 10:00:00', 200, 'Office Supplies', 1),
(2, '2023-06-02 11:00:00', 150, 'Travel Expenses', 1),
(3, '2023-06-03 12:00:00', 100, 'Client Lunch', 1),
(4, '2023-06-04 13:00:00', 250, 'Software Subscription', 0),
(5, '2023-06-05 14:00:00', 300, 'Team Building Event', 1);

-- Insert data into Invoices
INSERT INTO [dbo].[Invoices] (member_id, client_id, date, amount, is_active) VALUES
(1, 1, '2023-06-01 09:00:00', 1000, 1),
(2, 2, '2023-06-02 10:00:00', 750, 1),
(3, 3, '2023-06-03 11:00:00', 500, 1),
(4, 4, '2023-06-04 12:00:00', 800, 0),
(5, 5, '2023-06-05 13:00:00', 600, 1);

